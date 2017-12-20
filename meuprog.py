from time import sleep


def clr():
    print(chr(27) + "[2J")


def modoastavel():
    flag = 'sim'
    while flag == 'sim':
        clr()
        desenho = '''
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
        '''
        print(desenho)
        capacitor = float(input('Digite o valor do capacitor(uF): '))
        resistor_a = float(input('Digite o valor de RA(k ohms): '))
        resistor_b = float(input('Digite o valor de RB(k ohms): '))
        frequencia = 1.44 / ((resistor_a + 2 * resistor_b) * capacitor)
        frequencia *= 1000  # hertz
        nivel_alto = 0.693 * ((resistor_a + resistor_b) * capacitor)
        nivel_baixo = 0.693 * resistor_b * capacitor
        if (1 <= resistor_a <= 10000) and (1 <= resistor_b <= 10000):
            desenho = '''
                             î VCC
                 {resistor_a:5.3f}       |
                  _/\/\/\----|__ _ __ _ _
                 |           |           |
                 |   ||= = = = = = =||   |
                 /---||7      8   4 ||---|
        {resistor_b:5.3f}    \   ||             ||
                 /   ||             ||
                 \---||6    555    3||---SAIDA
                 |   ||             ||
                 |---||2          5 ||---|
                 |   ||      1      ||   |
               __|__ ||= = = = = = =|| __|__
               _____ {capacitor:5.3f}    |        _____
                 |            |          | 10
                 |____________|__________| nf
                            __|__
                             ___ GND
                              _

            Frequência é : {frequencia:5.3f} hz
            Tempo em nível alto do pulso: {nivel_alto:5.3f} ms
            Tempo em nível baixo do pulso: {nivel_baixo:5.3f} ms
            '''.format(
                resistor_a=resistor_a,
                resistor_b=resistor_b,
                frequencia=frequencia,
                nivel_alto=nivel_alto,
                nivel_baixo=nivel_baixo,
                capacitor=capacitor
            )
            print(desenho)
        else:
            print("Valores inválidos.")
        flag = 'invalido'
        while flag not in ('sim', 'nao'):
            flag = input('Deseja calcular novamente (sim/nao): ')


def modomono():
    flag = 'sim'
    while flag == 'sim':
        clr()
        desenho = '''
                               î VCC
                      R        |
                   /\/\/\------|__ _ __ _ _
                   |           |           |
                   |  ||= = = = = = =||    |
                   ---||7      8   4 ||----|
                   |  ||             ||
                   |  ||             ||
                   |--||6    555    3||---SAIDA' );
                   |  ||             ||
          Disparo--)--||2          5 ||---|
                   |  ||      1      ||   |
                   |  ||= = = = = = =|| __|__
                 __|__         |         _____
               C _____         |          | 10
                   |___________|__________| nf
                             __|__
                              ___ GND
                               _
        '''
        print(desenho)
        resistor = float(input('Digite o valor de R(K ohms): '))
        capacitor = float(input('Digite o valor do capacitor(uF): '))
        temporizacao = 1.1 * resistor * capacitor
        desenho = '''
                                î VCC
                {resistor:5.3f}           |
                   /\/\/\------ |__ _ __ _ _
                   |            |          |
                   |  ||= = = = = = =||    |
                   ---||7      8   4 ||----|
                   |  ||             ||
                   |  ||             ||
                   |--||6   555    3 ||---SAIDA
                   |  ||             ||
          Disparo--)--||2          5 ||---|
                   |  ||      1      ||   |
                   |  ||= = = = = = =|| __|__
                 __|__         |        _____
            {capacitor:5.3f}_____         |          | 10
                   |___________|__________| nf
                             __|__
                              ___ GND
                               _

        Temporização é: {temporizacao:5.3f} ms.
        '''.format(
            resistor=resistor,
            capacitor=capacitor,
            temporizacao=temporizacao
        )
        print(desenho)
        flag = 'invalido'
        while flag not in ('sim', 'nao'):
            flag = input('Deseja calcular novamente (sim/nao): ')
    return


def main():
    opcao = 0
    while opcao != '3':
        clr()
        opcao = input(
            '''
                    Programa para cálculos do multivibrador 555

                    Bem vindo ao menu de opções escolha sua opção:

                                             |
                                             |
                                    ||= = = = = = =||
                                 ---||7      8   4 ||---
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
                                           '''
        )
        if opcao == '1':
            modoastavel()
        elif opcao == '2':
            modomono()
        elif opcao == '3':
            print("Até mais! =)")
        else:
            print("Opção inválida")
            sleep(.5)


if __name__ == '__main__':
    main()
