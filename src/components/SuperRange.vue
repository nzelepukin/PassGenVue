<template>
    <div class="field">
        <button class="magic-circle" id="min" @click="minus">-</button>
        <input type="range" class="main-slider-range" :min="min" :max="max" :value="value" steps="1">
        <div class="slider"></div>
        <button class="magic-circle" id="max" @click="plus">+</button>
    </div>
</template>
<script>
export default {
    name: "SuperRange",
    mounted() {
        const rangeInput = document.querySelector('input[type="range"]');
        this.moveText(this.value);
        rangeInput.addEventListener("change", (e) => {
          this.moveText(e.target.value);
        });
        rangeInput.addEventListener("input", (e) => {
          this.moveText(e.target.value);
        })
    },
    props: {
        password: String,
        value: Number,
        min: Number,
        max: Number,
        send_to_value: { type: Function },
        generate: { type: Function }
    },
    methods: {
        moveText(newVal) {
            const rangeText = document.querySelector(".slider");
            let negNewVal = -1 * newVal;
            rangeText.style.left = ((newVal-this.min)*64/(this.max-this.min) + "%");
            rangeText.style.transform = "translate(" + negNewVal + "%, 2px)"; 
            rangeText.innerHTML = newVal;
            this.send_to_value(newVal);
            this.generate();
        },
        minus() {
            if (this.value>this.min) {
                this.moveText(Number(this.value)-1);
            }
        },
        plus() {
            if (this.value<this.max) {
                this.moveText(Number(this.value)+1);
            }
        }
    }    
}
</script>
<style>

.field {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: center;
    height: 10%;
    padding-top: 5%;
    padding-bottom: 5%;
}
.field .main-slider-range {
    -webkit-appearance: none;
    width: 69%;
    border-radius: 10px;
    height: 5px ;
    border: 1px solid #000000;
}
.range .field .main-slider-range{
    -webkit-appearance: none;
    cursor: default;
}
input[type='range']::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 40px;
    width: 40px;
    border-radius: 50%;
    border: 2px solid #000000;
    background: #FFFFFF;
    font-family: 'Indie Flower';
    font-style: normal;
    font-size: 25px;
    z-index: 1;
  }
.magic-circle {
    height: 30px;
    width: 30px;
    border-radius: 50%;
    border: 2px solid #000000;
    background: #FFFFFF;
    font-family: 'Indie Flower';
    font-style: normal;
    font-size: 25px;
    align-items:center;
}
.magic-circle::selection {
    background: transparent;
}
.magic-circle:active {
    filter: drop-shadow(1px 2px 1px rgb(110, 109, 109));
}
.main-input-password {
    position: relative;
    display: inline-block;
    width: 80%;
    height: 60px;
    background: #FFFFFF;
    font-family: 'Indie Flower';
    font-style: normal;
    font-weight: 400;
    font-size: 30px;
    line-height: 71px;
    color: #000000; 
    border: 0;
    right:5%;
    top: 3px;
    text-align: center;
    overflow: hidden !important;
    text-overflow: ellipsis;
}
.main-input-password:focus {
    border: 0;
    outline: 0;
}
.main-input-password::selection {
  background: #FFF; /* WebKit/Blink Browsers */
}
.slider {
    position:absolute;
    font-family: 'Indie Flower';
    font-style: normal;
    font-size: 25px;
    margin-left: 17%;
    z-index: 0;
}
</style>