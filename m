Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Jan 2017 15:20:49 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: Rajendra Nayak <rnayak@codeaurora.org>, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, sricharan@codeaurora.org
Subject: Re: [PATCH] clk: qcom: gdsc: Fix handling of hw control
 enable/disable
Message-ID: <20170120232049.GB20800@codeaurora.org>
References: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org>
 <3164de46-a251-3b3f-e6f5-5c3699bb4df8@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3164de46-a251-3b3f-e6f5-5c3699bb4df8@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 01/10, Stanimir Varbanov wrote:
> 
> > +		udelay(1);
> > +
> > +		reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
> > +		ret = gdsc_poll_status(sc, reg, 0);
> 
> This should be gdsc_poll_status(sc, reg, true) because after disabling
> hw_control we expect that the GDSC is in power_on state.
> 
> > +		if (ret)
> > +			return ret;
> >  	}
> >  
> >  	if (sc->pwrsts & PWRSTS_OFF)
> > 

I expect this patch is going for v2?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
