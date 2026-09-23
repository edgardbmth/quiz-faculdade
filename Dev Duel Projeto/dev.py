# ==================================================
# DEV DUEL
# QUIZ DE PROGRAMAÇÃO
# ==================================================


def linha():
    print("=" * 50)


def pergunta(numero, texto, alternativas, correta):

    print()
    linha()

    print(f"PERGUNTA {numero}")
    print()

    print(texto)

    print()

    for letra, alternativa in alternativas.items():

        print(f"{letra}) {alternativa}")

    print()

    resposta = input("Digite sua resposta: ").strip().upper()

    if resposta == correta:

        print("\n✓ Resposta correta!")

        return 10

    else:

        print("\n✗ Resposta incorreta!")

        print(f"A resposta correta era: {correta}")

        return 0


# ==================================================
# INÍCIO
# ==================================================

linha()

print("                 DEV DUEL")

print("           QUIZ DE PROGRAMAÇÃO")

linha()


nome = input("\nDigite seu nome: ").strip()


if nome == "":

    nome = "Jogador"


print(f"\nOlá, {nome}!")

print("Prepare-se para o desafio.")


# ==================================================
# PONTUAÇÃO
# ==================================================

pontuacao = 0


# ==================================================
# PERGUNTAS
# ==================================================

pontuacao += pergunta(

    1,

    "Qual linguagem é utilizada para estruturar páginas web?",

    {
        "A": "Python",
        "B": "HTML",
        "C": "SQL",
        "D": "C++"
    },

    "B"

)


pontuacao += pergunta(

    2,

    "Qual linguagem é utilizada para estilizar páginas web?",

    {
        "A": "CSS",
        "B": "Java",
        "C": "Python",
        "D": "C"
    },

    "A"

)


pontuacao += pergunta(

    3,

    "Qual estrutura pode ser utilizada para repetição em Python?",

    {
        "A": "if",
        "B": "print",
        "C": "for",
        "D": "input"
    },

    "C"

)


pontuacao += pergunta(

    4,

    "Qual símbolo é utilizado para comentários de uma linha em Python?",

    {
        "A": "//",
        "B": "/* */",
        "C": "#",
        "D": "<!-- -->"
    },

    "C"

)


pontuacao += pergunta(

    5,

    "Qual comando é utilizado para exibir informações no Python?",

    {
        "A": "show()",
        "B": "print()",
        "C": "displayText()",
        "D": "console()"
    },

    "B"

)


# ==================================================
# RESULTADO
# ==================================================

print()

linha()

print("                  RESULTADO")

linha()

print()

print(f"Jogador: {nome}")

print(f"Pontuação: {pontuacao}/50")


if pontuacao == 50:

    print("\n🏆 PERFEITO!")

    print("Você dominou o Dev Duel!")


elif pontuacao >= 30:

    print("\n🔥 MUITO BOM!")

    print("Você está evoluindo muito!")


elif pontuacao >= 20:

    print("\n💻 BOM TRABALHO!")

    print("Continue praticando!")


else:

    print("\n📚 CONTINUE ESTUDANDO!")

    print("A prática leva à evolução!")


linha()

print()

print("Obrigado por jogar DEV DUEL!")

print()