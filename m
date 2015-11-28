Return-Path: <info@lategoodbye.de>
Subject: Re: [PATCH v2 0/3] Add PWM clock support for bcm2835
To: Remi Pommarel <repk@triplefau.lt>, Eric Anholt <eric@anholt.net>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
From: Stefan Wahren <info@lategoodbye.de>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>, linux-rpi-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bart Tanghe <bart.tanghe@thomasmore.be>
Message-ID: <565A13F7.3020905@lategoodbye.de>
Date: Sat, 28 Nov 2015 21:52:07 +0100
MIME-Version: 1.0
In-Reply-To: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Hi Remi,
hi Eric,

Am 11.11.2015 um 15:22 schrieb Remi Pommarel:
> Hi,
>
> This patchset adds support for pwm clock. At boot, this clock does not have a
> default parent nor a default rate set. Thus we should be able to change its
> parent to get this clock working. The current clock implementation is using a
> mux to select the parent, but these clocks need to add a password (0x5a) in
> higher register bits when changing parent. So a generic mux cannot be used
> here.
>
> The two first patches fix the clock parent selection, while the second one is
> actually adding the pwm clock registration.
>
> Changes since v1:
> 	- determine_rate now based its parent selection upon divided rate
> 	  instead of the parent one
> 	- bcm2835_clock_choose_div has been modified to produce an avarage rate
> 	  lower or equal to the requested one
> 	- devicetree modifications have removed to be send in another patch
>

i applied the series including the devicetree modification, but it 
doesn't work for me.

First of all i get an ugly division by zero warning from the pwm driver. 
The pwm driver still assume a fixed clock and doesn't handle the error 
cases of clk_get_rate(). I attached a patch at the end.

The reason in my case why clk_get_rate() returns zero is that the pwm 
clock is orphan ( pwm is listed under 
/sys/kernel/debug/clk_orphan_summary ).

My suspicion is it has something to do with the clock manager driver.
The bcm2835_clock_per_parents contains only 8 entries. But according to
BCM2835-ARM-Peripherals.pdf [1] CM_GP0CTL SRC page 107 has 16 entries. 
The upper 8 entries are all mapped to GND. It looks to me that the 
driver doesn't take care of this and so the pwm clock isn't able to 
determine it's parent.

Best regards
Stefan

[1] - 
https://www.raspberrypi.org/wp-content/uploads/2012/02/BCM2835-ARM-Peripherals.pdf

---------------------------------->8------------------------------
diff --git a/drivers/pwm/pwm-bcm2835.c b/drivers/pwm/pwm-bcm2835.c
index b4c7f95..49e28df 100644
--- a/drivers/pwm/pwm-bcm2835.c
+++ b/drivers/pwm/pwm-bcm2835.c
@@ -29,7 +29,6 @@
  struct bcm2835_pwm {
  	struct pwm_chip chip;
  	struct device *dev;
-	unsigned long scaler;
  	void __iomem *base;
  	struct clk *clk;
  };
@@ -66,6 +65,15 @@ static int bcm2835_pwm_config(struct pwm_chip *chip, 
struct pwm_device *pwm,
  			      int duty_ns, int period_ns)
  {
  	struct bcm2835_pwm *pc = to_bcm2835_pwm(chip);
+	unsigned long rate = clk_get_rate(pc->clk);
+	unsigned long scaler;
+
+	if (rate <= 0) {
+		dev_err(pc->dev, "Invalid clock rate: %ld\n", rate);
+		return -EINVAL;
+	}
+
+	scaler = NSEC_PER_SEC / rate;

  	if (period_ns <= MIN_PERIOD) {
  		dev_err(pc->dev, "period %d not supported, minimum %d\n",
@@ -73,8 +81,8 @@ static int bcm2835_pwm_config(struct pwm_chip *chip, 
struct pwm_device *pwm,
  		return -EINVAL;
  	}

-	writel(duty_ns / pc->scaler, pc->base + DUTY(pwm->hwpwm));
-	writel(period_ns / pc->scaler, pc->base + PERIOD(pwm->hwpwm));
+	writel(duty_ns / scaler, pc->base + DUTY(pwm->hwpwm));
+	writel(period_ns / scaler, pc->base + PERIOD(pwm->hwpwm));

  	return 0;
  }
@@ -156,8 +164,6 @@ static int bcm2835_pwm_probe(struct platform_device 
*pdev)
  	if (ret)
  		return ret;

-	pc->scaler = NSEC_PER_SEC / clk_get_rate(pc->clk);
-
  	pc->chip.dev = &pdev->dev;
  	pc->chip.ops = &bcm2835_pwm_ops;
  	pc->chip.npwm = 2;
