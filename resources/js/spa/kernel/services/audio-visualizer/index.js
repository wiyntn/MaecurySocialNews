import { Wave } from '@foobar404/wave';

const audioVisualizer = () => {
    return {
        audioStream: null,
        canvas: null,
        audioContext: null,
        animationInstance: null,
        audioElement: null, // {} အစား null သို့ ပြောင်းထားပါ
        config: {
            count: 50,
            lineWidth: 2,
            frequencyBand: 'mids',
            fillColor: 'rgba(0, 122, 255, 1)',
            lineColor: 'rgba(0, 122, 255, 1)'
        },
        setAudioElement: function(audioElement = null) {
            if (audioElement) {
                this.audioElement = audioElement;
            }
            return this;
        },
        setCanvas: function(canvas = null) {
            if (canvas) {
                this.canvas = canvas;
            }
            return this;
        },
        linesWaveStart: function (config = {}) {
            // audioElement နှင့် canvas ရှိမရှိ အရင်စစ်ဆေးပါ
            if (!this.audioElement || !this.canvas) {
                console.error('Audio element or Canvas is not set properly!');
                return;
            }

            this.config = {
                ...this.config,
                ...config
            };
            
            // ေနာက်ထပ် undefined များ မဝင်စေရန် ကာကွယ်ခြင်း
            try {
                this.animationInstance = new Wave(this.audioElement, this.canvas, true);
        
                if (this.animationInstance && this.animationInstance.animations) {
                    this.animationInstance.addAnimation(new this.animationInstance.animations.Wave(this.config));
                }
            } catch (error) {
                console.error('Wave initialization error:', error);
            }
        }
    };
} 

export { audioVisualizer };