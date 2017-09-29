package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"text/template"
	"time"
)

var mainScreen = `Programa para cálculos do multivibrador 555
Bem vindo ao menu de opções escolha sua opção:
            |
            |
    ||= = = = = = =||
 ---||7     8    4 ||---
    ||             ||
 ---||6            ||
    ||    555    3 ||---
    ||             ||
 ---||2          5 ||---
    ||      1      ||
    ||= = = = = = =||
            |
            |
				
1-Modo Astável, 2-Modo Monoestável, 3-fim do programa
`

func clr() {
	fmt.Printf("%c[2J", 27)
}

func astavel() {
	for {
		clr()
		screenAstavelMenu := `
                               î VCC
                     RA        |
                   /\/\/\------|__ _ __ _ _
                  |            |          |
                  |   ||= = = = = = =||   |
                  /---||7      8   4 ||---|
              RB  \   ||             ||
                  /   ||             ||
                  \---||6    555    3||---SAIDA
                  |   ||             ||
                  |---||2          5 ||---|
                  |   ||      1      ||   |
                __|__ ||= = = = = = =|| __|__
                _____ C1       |        _____
                  |            |          | 10
                  |____________|__________| nf
                             __|__
                              ___ GND
                               _
		`
		fmt.Println(screenAstavelMenu)
		/*
		   capacitor = float(input('Digite o valor do capacitor(uF): '))
		           resistor_a = float(input('Digite o valor de RA(k ohms): '))
		           resistor_b = float(input('Digite o valor de RB(k ohms): '))
		*/

		capacitor, err := readFloat("Digite o valor do capacitor(uF): ")
		if err != nil {
			fmt.Println("Valor invalido")
			<-time.After(time.Duration(2) * time.Second)
			continue
		}
		resistorA, err := readFloat("Digite o valor de RA(k ohms): ")
		if err != nil {
			fmt.Println("Valor invalido")
			<-time.After(time.Duration(2) * time.Second)
			continue
		}
		resistorB, err := readFloat("Digite o valor de RB(k ohms): ")
		if err != nil {
			fmt.Println("Valor invalido")
			<-time.After(time.Duration(2) * time.Second)
			continue
		}

		frequencia := 1.44 / ((resistorA + 2*resistorB) * capacitor)
		nivelAlto := 0.693 * ((resistorA + resistorB) * capacitor)
		nivelBaixo := 0.693 * resistorB * capacitor

		clr()
		screenAstavelResult := `
                             î VCC
                {{.resistor_a}}       |
                  _/\/\/\----|__ _ __ _ _
                 |           |           |
                 |   ||= = = = = = =||   |
                 /---||7      8   4 ||---|
       {{.resistor_b}}    \   ||             ||
                 /   ||             ||
                 \---||6    555    3||---SAIDA
                 |   ||             ||
                 |---||2          5 ||---|
                 |   ||      1      ||   |
               __|__ ||= = = = = = =|| __|__
               _____{{.capacitor}}    |        _____
                 |            |          | 10
                 |____________|__________| nf
                            __|__
                             ___ GND
                              _
            Frequência é : {{.frequencia}} Khz
            Tempo em nível alto do pulso: {{.nivel_alto}} ms
            Tempo em nível baixo do pulso: {{.nivel_baixo}} ms		
`

		t, err := template.New("astavel").Parse(screenAstavelResult)
		if err != nil {
			fmt.Println(err)
			<-time.After(time.Duration(2) * time.Second)
			continue
		}

		m := make(map[string]string)
		m["resistor_a"] = fmt.Sprintf("%5.3f", resistorA)
		m["resistor_b"] = fmt.Sprintf("%5.3f", resistorB)
		m["capacitor"] = fmt.Sprintf("%5.3f", capacitor)
		m["nivel_alto"] = fmt.Sprintf("%5.3f", nivelAlto)
		m["nivel_baixo"] = fmt.Sprintf("%5.3f", nivelBaixo)
		m["frequencia"] = fmt.Sprintf("%5.3f", frequencia)
		err = t.Execute(os.Stdout, m)
		if err != nil {
			fmt.Println(err)
			<-time.After(time.Duration(2) * time.Second)
			continue
		}
		readline("")

	}
}

func readFloat(label string) (valueFloat float64, err error) {
	value := readline(label)
	valueFloat, err = strconv.ParseFloat(value, 64)
	return
}

func readline(label string) string {
	reader := bufio.NewReader(os.Stdin)
	fmt.Print(label)
	text, _ := reader.ReadString('\n')
	text = text[:len(text)-1]
	return text
}

func main() {
	for {
		clr()
		fmt.Println(mainScreen)
		opc := readline("Digite uma opção:")

		switch opc {
		case "1":
			astavel()
		case "2":
			//monoestavel()
		case "3":
			fmt.Println("Até mais! =)")
			os.Exit(0)
		default:
			fmt.Println("opção invalida")
			<-time.After(time.Duration(2) * time.Second)
		}
	}
}
