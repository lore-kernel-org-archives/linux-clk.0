Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0474314A5
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 15:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439897; cv=none; b=rYB0aAtyN53T1llu7NkVzH3OehyhBhqndNVM6H/eexe2EJSe1sasVzV/Qw0yf5MN3K4UGJjR1Jyx0/H649pG0b4ATY/cEjSd4PeFS9lJFvRJ8Vwrp151c//lUo/oh5AGkGSDXQwQtmp1b4pRo6hak8XldYlk5kdjsSUo43N2J2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439897; c=relaxed/simple;
	bh=UhQZWbF7A5fDYYoSGX+1ndN7L9yikRUgWQep5Lo0rpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Un0RU8AxQ5sxs3HjUOnuY0h+NlIIRY0foJWpkkrq07qc68zNAyfcpB8ZipZ8CDvvYLen9V02W5fN+FoHoi+EK7stkK0j+477QMReCyvTHDwDZ0CTP7qAQHpPuoqwmVatp7YICwrCMzwjl7JV4JyxO05UKvR30ek/hGurxBTDaac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=diqBB+nx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lU31dlBR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="diqBB+nx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lU31dlBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783439894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l9R//O3la49RHIHi2ZJ0nnvSIXlJpfsPVkfnZbOQtU0=;
	b=diqBB+nxdy0p4srH3Ul9WLSBMRZyslmLK8aoN4z5KrIHCYYxOnsZQ+PMW5PROFPKde1Kkq
	TTxjbXK6I5mlNdlWIchsXokvzvRVzK0SsuPf1TpjtJG0ZfWN53kxqznhF/nm7IIpTkJsil
	EAowrirvC7CwInfRJ5UFi4yDtw9txFM=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-09hqII4iN0q59F6-orTkig-1; Tue, 07 Jul 2026 11:58:13 -0400
X-MC-Unique: 09hqII4iN0q59F6-orTkig-1
X-Mimecast-MFC-AGG-ID: 09hqII4iN0q59F6-orTkig_1783439892
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17baa4d18so5038728eaf.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783439892; x=1784044692; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=l9R//O3la49RHIHi2ZJ0nnvSIXlJpfsPVkfnZbOQtU0=;
        b=lU31dlBRMs7yRe75TejZMKo1K2Lv07Dkx+VMdpGIHrzErQP14yGChYILswsFHjZJHK
         SNXKSL+xY0K9zn/DjsyIaU9lblMGQEX5YVPO4VS/gRnXP6tyhetw7uko3RymeUcfr9Z8
         3QiplFpSdgtKIXST6naSHFz+iUy2Wg/m8B0lYsSfWCpNVmQR7Jx2BbnIkt6PBjx6+uS5
         VOQ1/1P0xHLVISkXNQB06XbSNvWCdBTjussNC0ak6Csjx68/k5oepALSOXLU3CehLqW6
         MBjx6NQ6W6eL49QMqJDG/iKK8Liin9+C0087OIS7E8G4o29VDqYN5IPxdUEXNOfbn0w5
         IDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783439892; x=1784044692;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9R//O3la49RHIHi2ZJ0nnvSIXlJpfsPVkfnZbOQtU0=;
        b=Y3NDfcVt9W9vpf8EJMTSshMXk9Ravz280OFy47bYgieUl0bTGr2YOMA4vFlysDo82j
         1y7DHXvFQi3JOqhQTFfEDo2e3rIE/afmrepCG8RIdbpdaJDlVSxbmPFa5MbnxG0E1UmU
         EMMGe35yQjmE2td1oPxsePymkzj39usjiIeJqz/1wJ5/qFF5fnr254kD2sA1FxsEVXcw
         djXhJghzxqHeI5vTnN1xeHIG0a2N0nufVbNUDG+iZzfbIogsKyFqiDwI+snUvjgGeOcv
         Jgc7LB3oQiWe/H18uo7HuxZHMN6P6vyisn6jdU7o4ysxIIoFjbSaak1tF8UKmJEe5oqe
         lnzQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rcvY6kiH+/NJDgK439ydbXsCeIHT46/zbm47fORo2xqO1IBe6wtnwtSmizPeDAK7JMo6yDL1dE7A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1YIODDttl7crZFeMXWZ4DL1QofoyH4qUrn1Kk5YVCJShTZZfo
	WWLQqQp/m2+mZfLos2p5MGb+aG+Z3Ft1YKxC/S2wz/qMACFFVb7be6dn+1HEI6yCWggb5D1tDxq
	05HsIdmvz/AqobRk8jykrprSL0meK3Fkn2ZKdpDUDTK2UfSBx3xq4XQtnTlwHxA==
X-Gm-Gg: AfdE7cn1IMDM0Ie9RrWzXwdWlfrKqCowhXKVRqeTUSIuxCYw1FhFJ+VZ0tPaKdKs7c7
	lxK6fyoPAaiQvqIOt66TO0ZAo8TjfBlwR/R2m0/1FhHPP7KcbYwhQvegQ/1ChM3MjevJCqrEem5
	KIUyK4/jewkW7v7auhmE04cWaByWn7X8frP3hFYcIrXx4Jh7yyejJq8pu0j/aRre/GvKMGuvSkz
	mG8cHNdfE61G/Qg8QhvIYjoxQiAHzTe4GiTumFzAtBsd4l7FfWrI4FnmJJPTOtyXkKic54yzF3W
	RUVdL3G8YdWcy8IHjlnq/5Dd6hKRbw1zPTO0w8PGlwRvRid4GkZTXqsuJABpSD9ds3SxHZMiJe4
	uKKw4NHeK
X-Received: by 2002:a05:6820:8598:10b0:6a3:66dd:c9fa with SMTP id 006d021491bc7-6a366ddd174mr318577eaf.55.1783439892268;
        Tue, 07 Jul 2026 08:58:12 -0700 (PDT)
X-Received: by 2002:a05:6820:8598:10b0:6a3:66dd:c9fa with SMTP id 006d021491bc7-6a366ddd174mr318568eaf.55.1783439891720;
        Tue, 07 Jul 2026 08:58:11 -0700 (PDT)
Received: from redhat.com ([2600:382:850a:55b4:731e:b0d4:e0cc:410])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a3103ad433sm11458289eaf.12.2026.07.07.08.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 08:58:11 -0700 (PDT)
Date: Tue, 7 Jul 2026 11:58:08 -0400
From: Brian Masney <bmasney@redhat.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH v6 2/3] clk: cs2600: Add Fractional-N clock driver
Message-ID: <ak0iEAJsZJOkvkX1@redhat.com>
References: <20260630155549.824059-1-rf@opensource.cirrus.com>
 <20260630155549.824059-3-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630155549.824059-3-rf@opensource.cirrus.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Richard,

Thanks for the patch.

On Tue, Jun 30, 2026 at 04:55:48PM +0100, Richard Fitzgerald wrote:
> From: Paul Handrigan <paulha@opensource.cirrus.com>
> 
> Add driver for the Cirrus Logic CS2600 fractional-N clock synthesizer
> and multiplier.
> 
> The CS2600 is a system-clocking device using a hybrid fractional-N analog
> PLL and a digital frequency-locked loop (FLL). The CS2600 enables frequency
> synthesis and clock generation from a stable timing reference clock. The
> device can generate low-jitter clocks between 6 MHz and 75 MHz from a noisy
> clock reference between 50 Hz and 30 MHz, or from a stable clock reference
> between 8 MHz and 75 MHz.
> 
> The timing reference clock (REF_CLK_IN) can be an external clock source
> or the internal oscillator. This clock drives the PLL and is always
> required to generate output clocks, even if it is not used as the frequency
> reference.
> 
> The frequency reference source can be either REF_CLK_IN or an external
> clock on CLK_IN.
> 
> The PLL_OUT clock frequency is a ratio of the chosen frequency reference.
> The ratio is a fixed-point number of either 12.20 or 20.12 precision. The
> lower-precision high-multiplication 20.12 ratios are only available when
> CLK_IN is the frequency reference.
> 
> In smart mode the CS2600 will synthesize the output based on REF_CLK_IN
> until a clock is present on CLK_IN; it then performs a glitchless switch
> to CLK_IN as the frequency reference. A variant of smart mode
> automatically enables the PLL output only when CLK_IN becomes available.
> 
> Three output pins are derived from PLL_OUT:
> 
>   CLK_OUT:   Gated output from PLL_OUT.
>   BCLK_OUT:  Divided from PLL_OUT.
>   FSYNC_OUT: Divided from PLL_OUT.
> 
> The BCLK_OUT and FSYNC_OUT have different sets of available divide ratios
> intended to provide the typical frequency relation between bit clock and
> frame clock on I2S/TDM audio interfaces. They can also be inverted with
> respect to CLK_OUT to support various formats of serial audio data.
> FSYNC_OUT has the additional feature that it can be either a 50:50 duty
> cycle or a pulse of a programmable number of BCLK cycles.
> 
> This configuration is modeled in the driver as:
> 
>                  +------------+
>   REF_CLK_IN ----| Hybrid PLL | PLL_OUT    +--------+
>                  |   + FLL    |-----+------|  GATE  |--------- CLK_OUT
>       CLK_IN ----|            |     |      +--------+
>                  +------------+     |
>                                     |      +---------+
>                                     +------| DIVIDER |-------- BCLK_OUT
>                                     |      +---------+
>                                     |
>                                     |      +---------+
>                                     +------| DIVIDER |-------- FSYNC_OUT
>                                            +---------+
> 
> OF properties define the hardware-level configuration to match the
> hardware that the CS2600 is driving.
> 
> The CS2600_ERR_xxx register bits are not used in the driver but are
> defined in the header file as a convenience for anyone debugging a
> system.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> Co-developed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> ---
> 
> Changes in V6:
> 
> - Merged the functions to calculate synth mode and mult mode ratios. The
>   math is the same, only the fixed-point precision is different. The new
>   cs2600_calc_ratio() function calculates at 20:20 fixed point and then
>   converts to 20:12 if the value is too large for 12:20.
>   This also simplifies the calling code because it doesn't need all the
>   checks of which ratio function it should be calling.
> - Re-worked the rounding of calculated rates so that they didn't drift
>   away from the best rate when the clock core passed the rounded rate from
>   determine_rate() back into set_rate().
> - Changed various parts of the recalc_rate()/determine_rate()/set_rate()
>   functions that relied on the state of the other clock registers to make
>   decisions. There's no guarantee whether those other clocks have been
>   configured yet so the decision making could be invalid.
> - Removed the use of different ratio slots depending on the mode. The
>   The CS2600 doesn't care which slots are used for synth and mult ratio.
>   Using fixed slots simplifies the code.
> - Split the large cs2600_pll_out_prepare() into helper functions.
> - Request ref_clk when starting the PLL. It is the system clock of the
>   CS2600 so it is always required to clock the chip even if it isn't the
>   frequency reference parent. In previous versions ref_clk was only
>   enabled by being the parent, which meant the CS2600 wasn't clocked when
>   using mult mode with clk_in as the frequency reference parent.
> - Fix cs2600_pll_out_set_parent() to properly reconfigure the PLL when
>   changing parents. The parent selection isn't a simple mux, it changes
>   PLL mode and selected ratio registers. Previously the mode bit was
>   written but the mode ratio registers weren't updated to match.
> - Factor out the BCLK and FSYNC divider lookup into a single function. The
>   lookup code is the same apart from the divide value that each register
>   field value represents. The divide values are provided as an array.
> - Don't attempt to set a best_parent_rate when setting BCLK/FSYNC rate.
>   The parent (CLK_OUT) rate is not arbitrary, it must match the requirements
>   of the device being clocked, and only the consumer driver will know
>   what is correct.
> - Set CLK_SET_PARENT_GATE on the PLL. Its configuration cannot be updated
>   atomically, so it must be stopped to reconfigure it.
> - Split several functions into separate functions for calculating a value
>   and get/set the register.
> - Use FIELD_PREP() and FIELD_GET() instead of multiple custom macros.
> - Fix inverted register unfreeze and freeze that meant the bits affected
>   by FREEZE_EN were not actually updated.
> - Use a DEFINE_GUARD to implement the register field unfreeze.
> - Rename cs2600_ref_clk_bound_rate() to cs2600_ref_clk_set_divider() to
>   indicate it's actually setting the rate, not just finding a rounded value.
> - Remove inappropriate use of in_range() that required some confusing
>   math to pass the correct value into in_range(). It's clearer to do
>   normal min/max comparison.
> - Use DIV_ROUND_UP_ULL() to convert PPM to a frequency delta instead of
>   open-coding it.
> - Initialize all the clocks using a single common loop.
> - Use clk_init_data.parent_hws to set FSYNC, BCLK and CLK_OUT parent as
>   PLL_OUT, instead of looking up PLL_OUT by name and setting FSYNC, BCLK
>   and CLK_OUT parent to that name.
> - Smart mode selection is now two boolean properties instead of an enum
>   property. One property select smart mode, the other property enables
>   suppression of PLL_OUT until there is clock on CLK_IN.
> - Added properties to invert FSYNC and BCLK relative to CLK_OUT.
> - Added property to set the duty cycle of FSYNC (required when clocking
>   TDM audio formats).
> - Use match_string() instead of a string of strcmp() to lookup
>   cirrus,aux1-output-source value.
> - Use of the internal oscillator is now explictly flagged by the presence
>   of the cirrus,internal-oscillator property. Previously the driver
>   inferred it from the absence of a ref_clk in clock-names.
> - More error checking.
> 
> Changes before V6:
> Sorry, the previously upstreamed versions don't have a changelist for
> me to copy into here.
> 
>  MAINTAINERS                     |    1 +
>  drivers/clk/Kconfig             |    1 +
>  drivers/clk/Makefile            |    1 +
>  drivers/clk/cirrus/Kconfig      |   10 +
>  drivers/clk/cirrus/Makefile     |    3 +
>  drivers/clk/cirrus/clk-cs2600.c | 1274 +++++++++++++++++++++++++++++++
>  drivers/clk/cirrus/clk-cs2600.h |  163 ++++
>  7 files changed, 1453 insertions(+)
>  create mode 100644 drivers/clk/cirrus/Kconfig
>  create mode 100644 drivers/clk/cirrus/Makefile
>  create mode 100644 drivers/clk/cirrus/clk-cs2600.c
>  create mode 100644 drivers/clk/cirrus/clk-cs2600.h
> 

[snip]

> diff --git a/drivers/clk/cirrus/clk-cs2600.c b/drivers/clk/cirrus/clk-cs2600.c
> new file mode 100644
> index 000000000000..73937ac868fc
> --- /dev/null
> +++ b/drivers/clk/cirrus/clk-cs2600.c

[snip]

> +
> +DEFINE_GUARD(cs2600_unfreeze, struct cs2600 *,
> +	     cs2600_clear_freeze(_T), cs2600_set_freeze(_T))

Can you go through the Sashiko output for this series?

https://sashiko.dev/#/message/20260630161121.020FB1F000E9%40smtp.kernel.org

The clear/set inverted looks questionable to me. If this is expected,
then a comment clarifying why should be added.

[snip]

> +static int cs2600_clk_register(struct cs2600 *cs2600)
> +{
> +	static const char *parent_names[2];

I wouldn't worry too about about Sashiko asking about multiple driver
instances for this section, unless you think it will eventually be used
in that way.

> +	const struct clk_hw *out_clocks_parent;
> +	struct clk_init_data init[ARRAY_SIZE(cs2600->hw)] = { };
> +	int ret, i, n, input_num = 0;
> +	const char *names[ARRAY_SIZE(cs2600_clks)];

Reverse Christmas tree order.

I can do a more thorough review once you go through the Sashiko results.

Brian

