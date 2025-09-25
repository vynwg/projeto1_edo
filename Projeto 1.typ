#import "@preview/codly:1.3.0": *

#let name = sys.inputs.NAME
#let matri = sys.inputs.MATRICULA
#let disc = "MAT7ED"
#let turma = "S12"
#let disciplina = "Equações Diferenciais Ordinárias"

#set page(fill: white)
#set text(size: 12pt, font: "Times New Roman")
#set par(justify: true)

#show heading.where(level: 1): it => {
    set align(center)
    text(size: 22pt, it)
    set text(size: 10pt)
    name + [ -- ] + matri + h(30pt) + disc + [ -- ] + turma + [ -- ] + disciplina

    v(1pt)

    [ Arquivos disponíveis em: ] + link("https://github.com/vynwg/projeto1_edo/")
    
    v(20pt)
}

#show: codly-init.with()

= Métodos de Euler e Runge-Kutta -- Grupo 12

1. Em cada um dos problemas de valor inicial abaixo, use o Método de Euler para obter uma solução aproximada no intervalo [0, 0.5], usando passo fixo h = 0.1, depois h = 0.05 e finalmente h = 0.01. São portanto, 3 soluções distintas para cada equação, que devem ser exibidas na forma gráfica, junto com a solução exata (que deve ser calculada à parte), para efeito de comparação. Repita a resolução usando Método de Euler aprimorado, apenas para o passo h = 0.1.

(d) $y' = 2y − 1, y(0) = −2$
#raw(read("edo11.m"), block: true, lang: "matlab")
#figure(image("edo11.svg", width: 200%))

(g) $y' = 3 cos t − 2y, y(0) = 0$
#raw(read("edo12.m"), block: true, lang: "matlab")
#figure(image("edo12.svg", width: 200%))

2. Em cada um dos problemas de valor inicial abaixo, use o Método de Runge-Kutta para obter uma solução aproximada no intervalo [0, 1], usando passo fixo h = 0.5 depois h = 0.25 e finalmente h = 0.1. São portanto, 3 soluções distintas para cada equação, que devem ser exibidas na forma gráfica, junto com a solução exata (que deve ser calculada à parte), para efeito de comparação.

(e) $y' = 0.5 − t + 2y, y(0) = 1$
#raw(read("edo21.m"), block: true, lang: "matlab")
#figure(image("edo21.svg", width: 200%))

(f) $y' = 0.5 − t + 2y, y(0) = −1$
#raw(read("edo22.m"), block: true, lang: "matlab")
#figure(image("edo22.svg", width: 200%))

