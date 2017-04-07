Return-Path: <sboyd@codeaurora.org>
Date: Fri, 7 Apr 2017 10:23:02 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: mturquette@baylibre.com, lee.jones@linaro.org,
	linux-kernel@vger.kernel.org, guodong.xu@linaro.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: hi6220: Add the hi655x's pmic clock
Message-ID: <20170407172302.GW7065@codeaurora.org>
References: <1489737531-3036-1-git-send-email-daniel.lezcano@linaro.org>
 <20170407164851.GU7065@codeaurora.org>
 <20170407172148.GO2078@mai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170407172148.GO2078@mai>
List-ID: <linux-clk.vger.kernel.org>

On 04/07, Daniel Lezcano wrote:
> On Fri, Apr 07, 2017 at 09:48:51AM -0700, Stephen Boyd wrote:
> > On 03/17, Daniel Lezcano wrote:
> > > The hi655x multi function device is a PMIC providing regulators.
> > > 
> > > The PMIC also provides a clock for the WiFi and the Bluetooth, let's implement
> > > this clock in order to add it in the hi655x MFD and allow proper wireless
> > > initialization.
> > > 
> > > Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> > 
> > Is there a binding patch for the PMIC?
> 
> There is a binding for the hi655x at:
> 
> Documentation/devicetree/bindings/mfd/hisilicon,hi655x.txt
> 
> but I don't see what I should add there.

#clock-cells?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
