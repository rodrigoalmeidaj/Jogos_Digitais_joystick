display.setStatusBar( display.HiddenStatusBar )

local _w = display.viewableContentWidth		-- Largura
local _h = display.viewableContentHeight		-- Altura

local velocidade = 2

    -- Bordas Limites
local linhaCima = display.newLine(0,0, _w, 0)
linhaCima:setStrokeColor(171/255, 9/255, 50/255)
linhaCima.strokeWidth = 5

local linhaEsquerda = display.newLine(0,0, 0, _h)
linhaEsquerda:setStrokeColor(171/255, 9/255, 50/255)
linhaEsquerda.strokeWidth = 6

local linhaDireita = display.newLine(_w,_h, _w, 0)
linhaDireita:setStrokeColor(171/255, 9/255, 50/255)
linhaDireita.strokeWidth = 6

local linhaBaixo = display.newLine(_w,_h, 0, _h)
linhaBaixo:setStrokeColor(171/255, 9/255, 50/255)
linhaBaixo.strokeWidth = 6

    -- Area de Descanso
local ret = display.newRect(_w/2, _h/2, 100, 100)
ret:setFillColor( 0,0 )
ret:setStrokeColor(171/255, 9/255, 50/255)
ret.strokeWidth = 3
    -- Bola
local ball = display.newCircle(_w/2, _h/2, 20)
ball:setFillColor(171/255, 9/255, 50/255)

local movendo = false
local positionX, positionY

local function touchTela(event)
    positionX = event.x
    positionY = event.y
    if (event.phase == "began" ) then	-- Começo o toque
		movendo = true
	elseif (event.phase == "ended" ) then -- Termino o toque
		movendo = false
	end
    print(positionX, positionY)
end

Runtime:addEventListener("touch", touchTela);

local function moveBall(event)
    --P
    local positionInicialXRet = _w/2 - ret.width /2
    local positionFinalXRet = _w/2 + ret.width /2
    local positionInicialYRet = _h/2 - ret.height /2
    local positionFinalYRet = _h/2 + ret.height /2

    --Primeira parte (noroeste)
    local parte1InicialX = 0
    local parte1FinalX = _w/2
    local parte1InicialY = 0
    local parte1FinalY = _h/2

    --Segundo parte (nordeste)
    local parte2InicialX = _w/2
    local parte2FinalX = _w
    local parte2InicialY = 0
    local parte2FinalY = _h/2

    --Terceiro parte (sudoeste)
    local parte3InicialX = 0
    local parte3FinalX = _w/2
    local parte3InicialY = _h/2
    local parte3FinalY = _h

    --Quarto parte (sudeste)
    local parte4InicialX = _w/2
    local parte4FinalX = _w
    local parte4InicialY = _h/2
    local parte4FinalY = _h

    if (movendo == true) then
        
        if (positionX>=positionInicialXRet and positionX<=positionFinalXRet and positionY>=positionInicialYRet and positionY<=positionFinalYRet)then

        elseif (positionX>=parte1InicialX and positionX<=parte1FinalX and positionY>=parte1InicialY and positionY<=parte1FinalY) then  
            ball.x = ball.x - velocidade
            ball.y = ball.y - velocidade
        elseif (positionX>=parte2InicialX and positionX<=parte2FinalX and positionY>=parte2InicialY and positionY<=parte2FinalY)then
            ball.x = ball.x +velocidade
            ball.y = ball.y -velocidade
        elseif (positionX>=parte3InicialX and positionX<=parte3FinalX and positionY>=parte3InicialY and positionY<=parte3FinalY)then
            ball.x = ball.x -velocidade
            ball.y = ball.y +velocidade
        elseif (positionX>=parte4InicialX and positionX<=parte4FinalX and positionY>=parte4InicialY and positionY<=parte4FinalY)then
            ball.x = ball.x +velocidade
            ball.y = ball.y +velocidade
        end

        -- Horizontal
        if(ball.x >= 0 + 20 and ball.x <= _w - 20)then
            ball.x = ev.x
        else
            if(ev.x > _w/2)then
                ball.x = _w - 20
            else
                ball.x = 20
            end
  
        end
        -- Vertical
        if(ball.y >=0 + 20 and ball.y <= _h -20)then
            ball.y = ev.y
        else
            if(ev.y > _h/2)then
                ball.y = _h -20
            else
                ball.y = 20
            end
        end

        

    end
end
Runtime:addEventListener("enterFrame", moveBall);









