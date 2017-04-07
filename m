Return-Path: <daniel.lezcano@linaro.org>
Return-Path: <daniel.lezcano@linaro.org>
Date: Fri, 7 Apr 2017 19:32:17 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: mturquette@baylibre.com, lee.jones@linaro.org,
	linux-kernel@vger.kernel.org, guodong.xu@linaro.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: hi6220: Add the hi655x's pmic clock
Message-ID: <20170407173217.GP2078@mai>
References: <1489737531-3036-1-git-send-email-daniel.lezcano@linaro.org>
 <20170407164851.GU7065@codeaurora.org>
 <20170407172148.GO2078@mai>
 <20170407172302.GW7065@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20170407172302.GW7065@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Apr 07, 2017 at 10:23:02AM -0700, Stephen Boyd wrote:
> On 04/07, Daniel Lezcano wrote:
> > On Fri, Apr 07, 2017 at 09:48:51AM -0700, Stephen Boyd wrote:
> > > On 03/17, Daniel Lezcano wrote:
> > > > The hi655x multi function device is a PMIC providing regulators.
> > > > 
> > > > The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> > > > this clock in order to add it in the hi655x MFD and allow proper wireless
> > > > initialization.
> > > > 
> > > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > > 
> > > Is there a binding patch for the PMIC?
> > 
> > There is a binding for the hi655x at:
> > 
> > Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> > 
> > but I don't see what I should add there.
> 
> #clock-cells?

Ok, thanks. I will have a look.



> -- 
> Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
> a Linux Foundation Collaborative Project

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
