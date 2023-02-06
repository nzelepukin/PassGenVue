<template>
    <div class="main-checks">
        <div v-for="check in checks" v-bind:key="check" class="main-checks-div">
            <input class="main-checks-check" type="checkbox" v-model="check.checked" /> 
            <label id="check" class="main-checks-label">{{check.label}}</label>
        </div>
    </div>
</template>
<script>
export default {
    name: "SuperChecks",
    props: {
        checks: {
            type:Array
        }
    }
}
</script>
<style>
.main-checks {
    position: relative;
}
.main-checks-div {
    display: inline-block;
    padding-left: 1%;
    margin-right: 10%;
}
.main-checks-check {
    -webkit-appearance: none;
    border-radius: 15px;
    width: 40px;
    height: 40px;
    background: #FFFFFF;
    border: 2px solid #000000;
    box-shadow: inset 4px 4px 4px rgba(0, 0, 0, 0.25);
}
.main-checks-check:before {
    z-index: 1;
}
.main-checks-check:checked {
    background-image: url(img/check.svg);
    background-size: 40px 40px;
    z-index: 2;
}
.main-checks-label {
    font-family: 'Indie Flower';
    font-style: normal;
    font-size: 25px;
    position: absolute;
    margin-top: 1%;
    margin-left: 1%;
}
</style>
