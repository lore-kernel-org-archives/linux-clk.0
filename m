Return-Path: <sboyd@codeaurora.org>
Message-ID: <559B1AB2.10901@codeaurora.org>
Date: Mon, 06 Jul 2015 17:17:54 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
MIME-Version: 1.0
To: Sergej Sawazki <ce3a@gmx.de>, mturquette@baylibre.com, jsarha@ti.com
CC: linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 3/4] clk: add gpio controlled clock multiplexer
References: <1435501496-25761-1-git-send-email-ce3a@gmx.de> <1435501496-25761-4-git-send-email-ce3a@gmx.de>
In-Reply-To: <1435501496-25761-4-git-send-email-ce3a@gmx.de>
Content-Type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 06/28/2015 07:24 AM, Sergej Sawazki wrote:
> Add a common clock driver for basic gpio controlled clock multiplexers.
> This driver can be used for devices like 5V41068A or 831721I from IDT
> or for discrete multiplexer circuits. The 'select' pin selects one of
> two parent clocks.
>
> Cc: Jyri Sarha <jsarha@ti.com>
> Signed-off-by: Sergej Sawazki <ce3a@gmx.de>
> ---
>

And this doesn't do a good job of freeing stuff on failure paths. I
squashed this in

---8<---

diff --git a/drivers/clk/clk-gpio.c b/drivers/clk/clk-gpio.c
index 29d8917e8eeb..c0d202c24a97 100644
--- a/drivers/clk/clk-gpio.c
+++ b/drivers/clk/clk-gpio.c
@@ -126,6 +126,9 @@ static struct clk *clk_register_gpio(struct device *dev, const char *name,
 		if (err != -EPROBE_DEFER)
 			pr_err("%s: %s: Error requesting clock control gpio %u\n",
 					__func__, name, gpio);
+		if (!dev)
+			kfree(clk_gpio);
+
 		return ERR_PTR(err);
 	}
 
@@ -147,8 +150,8 @@ static struct clk *clk_register_gpio(struct device *dev, const char *name,
 		return clk;
 
 	if (!dev) {
-		kfree(clk_gpio);
 		gpiod_put(clk_gpio->gpiod);
+		kfree(clk_gpio);
 	}
 
 	return clk;
@@ -256,13 +259,13 @@ static struct clk *of_clk_gpio_delayed_register_get(
 
 	clk = data->clk_register_get(data->node->name, parent_names,
 			num_parents, gpio, of_flags & OF_GPIO_ACTIVE_LOW);
-	if (IS_ERR(clk)) {
-		mutex_unlock(&data->lock);
-		return clk;
-	}
+	if (IS_ERR(clk))
+		goto out;
 
 	data->clk = clk;
+out:
 	mutex_unlock(&data->lock);
+	kfree(parent_names);
 
 	return clk;
 }

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
