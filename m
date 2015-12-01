Return-Path: <sboyd@codeaurora.org>
Date: Mon, 30 Nov 2015 23:27:38 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Rajendra Nayak <rnayak@codeaurora.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: qcom: gdsc: Add support for gdscs with gds hw
 controller
Message-ID: <20151201072738.GB26865@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
 <1448517297-32419-3-git-send-email-rnayak@codeaurora.org>
 <20151201022238.GG17532@codeaurora.org>
 <565D0F11.90504@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <565D0F11.90504@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 12/01, Rajendra Nayak wrote:
> 
> On 12/01/2015 07:52 AM, Stephen Boyd wrote:
> > On 11/26, Rajendra Nayak wrote:
> > 
> >> +		udelay(1);
> >> +	}
> >> +
> >> +	do {
> >> +		if (gdsc_is_enabled(sc, status_reg) == en)
> >>  			return 0;
> >>  	} while (time_before(jiffies, timeout));
> >>  
> >> -	ret = regmap_read(sc->regmap, sc->gdscr, &val);
> >> -	if (ret)
> >> -		return ret;
> >> -
> >> -	if ((val & PWR_ON_MASK) == check)
> >> -		return 0;
> >> -
> > 
> > This opens a bug where we timeout and then the status bit changes
> > after the timeout. One more check is good and should stay. We
> > could also change this to ktime instead of jiffies. That would be
> > a good improvement.
> 
> If the status bit does change after timeout maybe the timeout isn't
> really enough and needs to be increased?

The problem is more that this isn't a tight loop with interrupts
disabled, so we may schedule the task away for quite some time
before we come back here and test the timeout against the jiffies
value. So it's best to always check the register one more time
after we bail out in case this occurs.

> 
> > 
> >>  	return -ETIMEDOUT;
> >>  }
> >>  
> >> @@ -165,6 +169,7 @@ static int gdsc_init(struct gdsc *sc)
> >>  {
> >>  	u32 mask, val;
> >>  	int on, ret;
> >> +	unsigned int reg;
> >>  
> >>  	/*
> >>  	 * Disable HW trigger: collapse/restore occur based on registers writes.
> >> @@ -185,7 +190,8 @@ static int gdsc_init(struct gdsc *sc)
> >>  			return ret;
> >>  	}
> >>  
> >> -	on = gdsc_is_enabled(sc);
> >> +	reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
> >> +	on = gdsc_is_enabled(sc, reg);
> > 
> > If the gdsc is voteable, then we need to make sure that the vote
> > is from us when we boot up. Otherwise the kernel may think that
> > the gdsc is enabled, but it gets turned off by some other master
> > later on. I don't know if this causes some sort of problem for
> > the power domain framework, but we can't rely on the status bit
> > unless we're sure that we've actually set the register to enable
> > it. In the normal enable/disable path we'll always know we set
> > the register, so this really only matters once when we boot up.
> 
> right, thanks for catching this. However if we vote for a votable
> GDSC just because its ON at boot (due to someone else having voted)
> we won't ever remove the vote keeping it always enabled.
> 
> I think a safe way would be to consider all votable gdscs for which
> *we* haven't voted explicitly to be disabled at boot?
> 

Agreed, when we boot we should consider GDSCs that are indicating
they're enabled via the bit 31 status bit but without the sw
enable mask set as "disabled" even though they're actually
enabled by some other master in the SoC.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
