document.addEventListener('DOMContentLoaded', function () {
    //global variable
    const welcomeScreen = document.getElementById('welcome-screen');
    const usernameInput = document.getElementById('username');
    const selectCountry = document.getElementById('select-country');
    const selectOpponentCountry = document.getElementById('select-oppenent-country');
    const selectLevel = document.getElementById('select-level');
    const playButton = document.getElementById('play-button');
    const instructionButton = document.getElementById('instruction-button');
    const instructionScreen = document.getElementById('instruction-screen');
    const instructionCloseButton = document.getElementById('close-instruction');
    const countdownScreen = document.getElementById('countdown-screen');
    const countdownNumber = document.getElementById('countdown-number');
    const pauseScreen = document.getElementById('pause-screen');
    const restartButton = document.getElementById('restart-game');
    const continueButton = document.getElementById('continue-game');
    const gameplay = document.querySelector(".screen-gameplay");
    const gameArea = document.getElementById('game-display');
    const timeDisplay = document.getElementById('time-display');
    const timeNumber = document.getElementById('time-number');
    const usernameDisplay = document.getElementById('username-in-game');
    const afterMatchScreen = document.getElementById('after-match');
    const afterMatchUsername = document.getElementById('username-after-match')
    const afterMatchScore = document.getElementById('score-after-match');
    const afterMatchCountry = document.getElementById('country-after-match')
    const restartButtonAfterMatch = document.getElementById('restart-button-after-match');
    const saveMatch = document.getElementById('save-match-button');
    const userFlag = document.getElementById('user-flag');
    const oppFlag = document.getElementById('opponent-flag');


    let score = 0;
    let pause = false;
    let level = 'easy';
    let timeDuration = 30;
    let userCountry = 'brazil';
    let oppenentCountry = 'brazil';
    let userCharacter = 'Character 01 - brazil'
    let oppCharacter = 'Character 01 - brazil'
    let timeRemaining;




    usernameInput.addEventListener('input', function () {
        usernameDisplay.textContent = usernameInput.value
        playButton.disabled = usernameInput.value.trim() === '';
    });


    selectCountry.addEventListener('change', function () {
        userCountry = this.value;
        switch (userCountry){
            case 'Character 01 - brazil' :
                userCountry = 'Brazil'
                userCharacter = 'Character 01 - brazil'
                userFlag.src = './Sprites/Flag/Brazil.png'
                break
            case 'Character 02 - England' :
                userCountry = 'England'
                userCharacter = 'Character 02 - England'
                userFlag.src = './Sprites/Flag/England.png'
                break
            case 'Character 07 - Germany' :
                userCountry = 'Germany'
                userCharacter = 'Character 07 - Germany'
                userFlag.src = './Sprites/Flag/Germany.png'
                break
            case 'Character 08 - Italy' :
                userCountry = 'italy'
                userCharacter = 'Character 08 - Italy'
                userFlag.src = './Sprites/Flag/Italy.png'
                break
            case 'Character 04 - Japan' :
                userCountry = 'Japan'
                userCharacter = 'Character 04 - Japan'
                userFlag.src = './Sprites/Flag/Japan.png'
                break
            case 'Character 05 - Netherlands' :
                userCountry = 'Netherlands'
                userCharacter = 'Character 05 - Netherlands'
                userFlag.src = './Sprites/Flag/Netherlands.png'
                break
            case 'Character 06 - Portugal' :
                userCountry = 'Portugal'
                userCharacter = 'Character 06 - Portugal'
                userFlag.src = './Sprites/Flag/Portugal.png'
                break
            case 'Character 03 - Spain' :
                userCountry = 'Spain'
                userCharacter = 'Character 03 - Spain'
                userFlag.src = './Sprites/Flag/Spain.png'
                break
            default : userCountry = 'brazil'
                userCharacter = 'Character 01 - brazil'
                userFlag.src = './Sprites/Flag/Brazil.png'
                break

        }
    })
    selectOpponentCountry.addEventListener('change', function () {
        oppenentCountry = this.value;
        switch (oppenentCountry) {
            case 'Character 01 - brazil' :
                oppenentCountry = 'Brazil'
                oppCharacter = 'Character 01 - brazil'
                oppFlag.src = './Sprites/Flag/Brazil.png'
                break
            case 'Character 02 - England' :
                oppenentCountry = 'England'
                oppCharacter = 'Character 02 - England'
                oppFlag.src = './Sprites/Flag/England.png'
                break
            case 'Character 07 - Germany' :
                oppenentCountry = 'Germany'
                oppCharacter = 'Character 07 - Germany'
                oppFlag.src = './Sprites/Flag/Germany.png'
                break
            case 'Character 08 - Italy' :
                oppenentCountry = 'italy'
                oppCharacter = 'Character 08 - Italy'
                oppFlag.src = './Sprites/Flag/Italy.png'
                break
            case 'Character 04 - Japan' :
                oppenentCountry = 'Japan'
                oppCharacter = 'Character 04 - Japan'
                oppFlag.src = './Sprites/Flag/Japan.png'
                break
            case 'Character 05 - Netherlands' :
                oppenentCountry = 'Netherlands'
                oppCharacter = 'Character 05 - Netherlands'
                oppFlag.src = './Sprites/Flag/Netherlands.png'
                break
            case 'Character 06 - Portugal' :
                oppenentCountry = 'Portugal'
                oppCharacter = 'Character 06 - Portugal'
                oppFlag.src = './Sprites/Flag/Portugal.png'
                break
            case 'Character 03 - Spain' :
                oppenentCountry = 'Spain'
                oppCharacter = 'Character 03 - Spain'
                oppFlag.src = './Sprites/Flag/Spain.png'
                break
            default :
                oppenentCountry = 'brazil'
                oppCharacter = 'Character 01 - brazil'
                oppFlag.src = './Sprites/Flag/Brazil.png'
                break
        }
    });

    selectLevel.addEventListener('change', function () {
        level = this.value;
        switch (level) {
            case 'easy':
                timeDuration = 30;
                break;
            case 'medium':
                timeDuration = 20;
                break;
            case 'hard':
                timeDuration = 15;
                break;
            default:
                timeDuration = 30;
                break;
        }
    });

    instructionButton.addEventListener('click', function () {
        instructionScreen.style.display = 'block';
    });

    instructionCloseButton.addEventListener('click', function () {
        instructionScreen.style.display = 'none';
    });

    playButton.addEventListener('click', function () {
        welcomeScreen.style.display = 'none';
        instructionScreen.style.display = 'none';
        countdownScreen.style.display = 'block';
        let countdown = 3;
        countdownNumber.textContent = `Game Start in : ${countdown}`;

        const countdownInterval = setInterval(function () {
            countdown--;
            countdownNumber.textContent = `Game Start in : ${countdown}`;
            if (countdown === 0) {
                clearInterval(countdownInterval);
                countdownScreen.style.display = 'none';
                startGame();
            }
        }, 1000);
    });


    restartButton.addEventListener('click', function () {
        location.reload()
    })

    continueButton.addEventListener('click', function () {
        resumeGame()
    })


    let player, opponent;

    function createAvatar(character, x, y, flip = false) {
        const avatar = {
            el: document.createElement('img'),
            character: character,
            states: {
                'Idle': { maxFrame: 17 },
                'Jump': { maxFrame: 4 },
                'Kick': { maxFrame: 8 },
                'Move Forward': { maxFrame: 9 },
                'Move Backward': { maxFrame: 9 },
                'Falling Down': { maxFrame: 4 },
            },
            stateName: 'Idle',
            currentFrame: 0,
            speed: 2,
            x: x,
            y: y,
            w: 200,
            h: 200,
            movement: { isMoving: false, direction: null },
            jumping: { isJumping: false, initY: null, tall: 200 }
        };

        avatar.el.classList.add('avatar');
        avatar.el.style.width = avatar.w + 'px';
        avatar.el.style.height = avatar.h + 'px';
        avatar.el.style.position = 'absolute';
        avatar.el.style.left = avatar.x + 'px';
        avatar.el.style.top = avatar.y + 'px';
        if (flip) avatar.el.style.transform = 'scaleX(-1)';
        gameplay.appendChild(avatar.el);

        return avatar;
    }




});


function clearConsole(){
    console.clear()
}

setInterval(function () {
    clearConsole()
},0)
