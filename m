Return-Path: <rnayak@codeaurora.org>
Message-ID: <fa3b0189ad586a846f398d3189505dca.squirrel@www.codeaurora.org>
In-Reply-To: <20151201072738.GB26865@codeaurora.org>
References: <1448517297-32419-1-git-send-email-rnayak@codeaurora.org>
    <1448517297-32419-3-git-send-email-rnayak@codeaurora.org>
    <20151201022238.GG17532@codeaurora.org> <565D0F11.90504@codeaurora.org>
    <20151201072738.GB26865@codeaurora.org>
Date: Tue, 1 Dec 2015 16:01:42 -0000
Subject: Re: [PATCH 2/6] clk: qcom: gdsc: Add support for gdscs with gds hw
 controller
From: "Rajendra Nayak" <rnayak@codeaurora.org>
To: "Stephen Boyd" <sboyd@codeaurora.org>
Cc: "Rajendra Nayak" <rnayak@codeaurora.org>,
 mturquette@baylibre.com,
 linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
List-ID: <linux-clk.vger.kernel.org>

[]..

>> >>  	return -ETIMEDOUT;
>> >>  }
>> >>
>> >> @@ -165,6 +169,7 @@ static int gdsc_init(struct gdsc *sc)
>> >>  {
>> >>  	u32 mask, val;
>> >>  	int on, ret;
>> >> +	unsigned int reg;
>> >>
>> >>  	/*
>> >>  	 * Disable HW trigger: collapse/restore occur based on registers
>> writes.
>> >> @@ -185,7 +190,8 @@ static int gdsc_init(struct gdsc *sc)
>> >>  			return ret;
>> >>  	}
>> >>
>> >> -	on = gdsc_is_enabled(sc);
>> >> +	reg = sc->gds_hw_ctrl ? sc->gds_hw_ctrl : sc->gdscr;
>> >> +	on = gdsc_is_enabled(sc, reg);
>> >
>> > If the gdsc is voteable, then we need to make sure that the vote
>> > is from us when we boot up. Otherwise the kernel may think that
>> > the gdsc is enabled, but it gets turned off by some other master
>> > later on. I don't know if this causes some sort of problem for
>> > the power domain framework, but we can't rely on the status bit
>> > unless we're sure that we've actually set the register to enable
>> > it. In the normal enable/disable path we'll always know we set
>> > the register, so this really only matters once when we boot up.
>>
>> right, thanks for catching this. However if we vote for a votable
>> GDSC just because its ON at boot (due to someone else having voted)
>> we won't ever remove the vote keeping it always enabled.
>>
>> I think a safe way would be to consider all votable gdscs for which
>> *we* haven't voted explicitly to be disabled at boot?
>>
>
> Agreed, when we boot we should consider GDSCs that are indicating
> they're enabled via the bit 31 status bit but without the sw
> enable mask set as "disabled" even though they're actually
> enabled by some other master in the SoC.

Thinking about this a bit more, your earlier suggestion of voting
for the GDSC explicitly seemed to work too, and also seemed cleaner.
genpd ends up removing the vote if there aren't any users as part
of genpd_poweroff_unused()

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
