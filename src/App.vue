<template>
    <div class="main">
        <h2 class="main-title">Password Generator</h2>
        <SuperInput :password="password" :method="generate" />
        <SuperRange :value="value" :min="min" :max="max" :send_to_value="send_to_value" :generate="generate" />
        <SuperChecks :checks="checks" />      
    </div>
</template>

<script>
import SuperChecks from "./components/SuperChecks/SuperChecks.vue"
import SuperInput from "./components/SuperInput.vue"
import SuperRange from "./components/SuperRange.vue"
export default {
  name: "App",
  components: {
    SuperChecks,
    SuperInput,
    SuperRange
  },
  data() {
    return {
      checks: [
        {name:"big_alpha", label: "ABC", value:"QWERTYUIOPASDFGHJKLZXCVBNM",checked: true},
        {name:"small_alpha", label: "abc", value:"qwertyuiopasdfghjklzxcvbnm",checked: true},
        {name:"numbers", label: "123", value:"1234567890",checked: true},
        {name:"symbols", label: "$^*", value:"!$^&*(){}|~",checked: false},
      ],
      password: " ",
      value: 16,
      max: 40,
      min:10
    }
  },
  methods: {
    randomiser(min,max) {
        return Math.floor(Math.random() * (max - min) + min);
    },
    generate() {
        let str=""; 
        let output="";
        this.checks.forEach(element => {if (element.checked) {output+=element.value}});
        for (let i = 0; i < this.value; i++) {
          str = str + output.charAt(this.randomiser(0,output.length));
        }
        this.password=str
    },
    send_to_value(num) {
        this.value=num
    }
  }

}
</script>

<style>
@import url("https://fonts.googleapis.com/css2?family=Indie+Flower&family=Luckiest+Guy");
html {
    background-color: #B49B5B;
    height: 100%;
    width: 100%;
    margin: 0;
    display:table;
}
body {
    display:table-cell;
    vertical-align:middle;
}
.main {
    box-sizing: border-box;
    display: block;
    width: 650px;
    height: 450px;

    background: #FFF4D7;
    border: 2px solid #000000;
    box-shadow: 20px 20px 10px rgba(0, 0, 0, 0.25);
    border-radius: 10px;
    place-items: center;
    text-align: center;
    margin: auto;
}
.main-title {
    position: center;
    text-align: center;
    font-family: 'Luckiest Guy';
    font-style: normal;
    font-weight: 400;
    font-size: 40px;
    line-height: 40px;
    /* identical to box height */
    color: #000000;
    padding-top: 5%;
}

</style>
