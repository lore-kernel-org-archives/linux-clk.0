Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDD03502A5
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 16:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785773697; cv=none; b=WOb8HohWHU3AskMmavW/jyntzT+GnHgDFPitNuDUwWMNQgKeI4o4dyi17oqTZk6QmLYWir/6hEcs1KQso6KfDDSNO9Tn1qCvRdqOnU3A/hG9gpkfAgKYkuyBn85RITPOwUYbgXgye2ut4+1bc+vq05wCs1rpb1auaMRTy1nko3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785773697; c=relaxed/simple;
	bh=qJ7OHeRdhigjpazP5LHh19uweVNBGbyeFWULJEFKjXc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rpwkoaqry4bH6MpVLAYOQps6fxE/vg9WZFln76p0jaaFi3ZJ0BbaYU1gZddVghDq6pXz6Em7YsM0/4p9XKNi+tji3oNkbJI5PblFAoSDCRk79qHjtpqbO9lIIFyymGAAsEvupI8ucIcuwTIz6lEN1Yo9386IKimP0Oz0Rp3t1L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QzkLAB/c; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=neldnove; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QzkLAB/c";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="neldnove"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785773692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=;
	b=QzkLAB/cOXTsncmtj5PNCGs3y5i1PW8tksNk/Pjvn/GBCh+Zjs2A+huEMm/IbBusgdnu88
	YNgcUMt3qsv7osd3TM8/XBrbv5hzY11/UoM7cOMjZdl3nraCv6YEUUTfTOqZon5NmRyHiE
	F6E1/gdvM1MYRFnzukDrw6LSRNFZjQY=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-ThJWQ2EtNfKUPGuOH70jMQ-1; Mon, 03 Aug 2026 12:14:51 -0400
X-MC-Unique: ThJWQ2EtNfKUPGuOH70jMQ-1
X-Mimecast-MFC-AGG-ID: ThJWQ2EtNfKUPGuOH70jMQ_1785773691
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eedabbefcso120617697b3.3
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785773691; x=1786378491; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=;
        b=neldnoveHUS1RFeAPUQTUYpuyyFv7k+BvJ73USDVzrgyJRR8uTYREUsJD44XyAfvCO
         jXU2CYfIv3x4ODlSU7rXUVd9FcZWknyFiVNXAp/93BiFhVBvwLy9hctMrJ5mJ1wIgs1p
         4z77Rqy044D9JnyYCzgMSqZ3P0s3yPS9KMVrhQECLgrDOH/RaKSV5axlXEu/mu8PMhYZ
         VVyQb8MYFKkG4kBsMmO+uz15jJEgcQzsF+TCVhKwVtcbrLquvgI7NCWaGrBfeTc8+9GJ
         DxepevSo/BRKBmek1qF8+4gXIjc7F3VKBwLqXn5zYRntalK5D8BwJogAsPB1ARLReju3
         rPKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785773691; x=1786378491;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=TYABYwpx6ruAb5bhUwEW7oIyVa3yNnOD8j4tVtfIkMg=;
        b=elcT/oXrNjjSfWNZbSrFeQUXTx6kQra/X7A+FXa9vRuehsMgxup9mPDtFP17ufMzsN
         V5wwsHLqe8hyMBQ6DQPd7fK5bM0tAHcQB9JNMJiWeTuEKdK0CnUybx4oe/s91jzg0bpc
         W/ZtnrSySuhISrkt7OBgXSTm4OdW0WHwB1LJ6W0kFedtk4P3eLvfnyOw6UzrAqS59SZJ
         l1UrcnOEfHwWA9LObQbenw5fe0yPqO178h0iZJs8x7t/Ac4OCZft0aivafv3hLTzm5Zx
         v2an2m6qihIwAHTuGxQ5ik9f3HK3FFgA5BMPY18+l8EerEQ9FyyiSle/MornWO5CneKh
         DFUw==
X-Forwarded-Encrypted: i=1; AHgh+RpUt08Cs/P3gudw73+7sUstrrX6SIsvFGM7aME/4xhj26ZPzlp23JozVqoTyc4/cw4jUjRtXINwUfI=@vger.kernel.org
X-Gm-Message-State: AOJu0YycY4/jXfOgnFnnSdEvUVmYapowe0m0W545KA7xVwFXVmwevTAM
	eUp1o/4BTYg8IF/qgbn2/ZKnFdyg6VzpAbCSQ2H7idspb05wdir4Cm7O0W5eFaYyfrldf84Nktw
	mZMmPpxyRMNOOGoaKo9V5YiJnTrsKXP89lZvZ/Gq0PnBbwt9nFDSFcSviLsbJ/TPpQI51hw==
X-Gm-Gg: AR+sD11y/Ul6qXwzKXHAjB+q8V0OHLIk3xLPy5Jm285bp1YukGBYnVQCeH/E89i8laU
	wMvAG3x+b8V5opjhVfCk2V8grV09yhj+HETn2BTcTUdX+TEDWKmzSqCWrg6PScjHcZr+ysXAdpt
	L28h3C5QL1mhmtNR7kqaj+f3v/JeKlkOLmYqZNy6EqLA8DlTj2f6pAyZ37uivNR/0wOd9PsWukK
	PT31rJmb2RoE4cN0fbr9SkbWC5vZLHdIRiCgcovChQ6QAMNkRGQ/lN/MvshKpsi6QDxKnfegk6e
	zDhmrMVYLO0ZoFOxAgLDmx0bkaZ09QyCMCERJWHJp88sxscg8VewPntG/LXPL8Y5N1N3lTv69iV
	V+qjqydNTNLTJzcw303E/TIZ2DLMlsxUGLqY=
X-Received: by 2002:a05:690c:e3f0:b0:81c:eca8:dbaf with SMTP id 00721157ae682-81fd4bed013mr148250487b3.31.1785773690494;
        Mon, 03 Aug 2026 09:14:50 -0700 (PDT)
X-Received: by 2002:a05:690c:e3f0:b0:81c:eca8:dbaf with SMTP id 00721157ae682-81fd4bed013mr148250027b3.31.1785773689959;
        Mon, 03 Aug 2026 09:14:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd0d6fcasm57682727b3.29.2026.08.03.09.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 09:14:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 12:14:47 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v9 07/12] clk: zte: Add zx PLL support infrastructure
Message-ID: <anC-d-cNuHoYD7px@redhat.com>
References: <20260802-zx29clk-v9-0-d05530d85d28@gmail.com>
 <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260802-zx29clk-v9-7-d05530d85d28@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Aug 02, 2026 at 11:33:39PM +0300, Stefan Dösinger wrote:
> I am guessing how much of this is reusable among other zx chips or even
> differently named ZTE platforms (if there are any). From reading the old
> zx2967 code, I think the PLL code would be reusable there, maybe with
> platform-specific bitmasks but otherwise the same logic.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 9:
> *) Take req->min_rate and req->max_rate into account when looking for
> possible PLL configurations (sashiko). In practice the code will still
> only ever encounter a fixed request to set dpll to 491.52 MHz.
> 
> *) The same code style changes Brian requested on the other clk patches.
> 
> Version 8:
> *) Document the behavior of unlocked PLLs better: They don't pass
> through their reference/parent, but pass through the fixed clock-26m
> oscillator, even if their reference clock is something else.
> *) dpll has working fractionals. Add this in the comment, but there is
> no actual code support for it - the LTE hardware doesn't need it.
> 
> As for Sashiko's comments on the .set_rate implementation: In practice
> .set_rate will only ever set one rate, 491.52 MHz for dpll. All other
> PLLs are bootloader configured. Dpll could be handled by writing a magic
> constant into its config.
> 
> I want to have the rate finding code as documentation, and maybe there
> is more elaborate future use for it (e.g. more flexible underclocking),
> but attempts to handle eventualities like rate searches or misconfigured
> bootloader values would be dead code.
> 
> Version 7:
> *) Always keep unknownpll enabled when prepared so dpll can acquire a
> lock in its prepare() function.
> *) Clean up error reporting a bit (Sashiko)
> 
> Version 6:
> *) Use abs_diff to compare target and candidate PLL rate (Sashiko).
> *) Use req->best_parent_rate in zx29_pll_determine_rate. Add a TODO
> comment about the parent rate flexibility.
> 
> Version 5: Fix some issues pointed out by Sashiko: NULL dev,
> zx29_pll_recalc_rate error handling, disable PLL again on enable error.
> ---
>  drivers/clk/zte/pll-zx.c | 568 ++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 565 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/pll-zx.c b/drivers/clk/zte/pll-zx.c
> index fc76c6524a16..e61b462ec0b4 100644
> --- a/drivers/clk/zte/pll-zx.c
> +++ b/drivers/clk/zte/pll-zx.c
> @@ -4,15 +4,577 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/clk.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
> +#include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/math.h>
> +#include <linux/rational.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
>  
>  #include "clk-zx.h"
>  
> +/*
> + * This code has only been tested with zx297520v3 PLLs, but from reading the zx296718 clock code it
> + * looks like PLL registers are similar. ZTE's sources explain the PLL register contents only in a
> + * .cmm file (A Lauterbach TRACE32 script) and some unused headers in their U-Boot code dump, which
> + * may not be accurate. When calculating the frequencies from the default PLL configuration the
> + * results match the fixed rate clocks from their clock driver.
> + *
> + * The 26 MHz and 32 kHz clocks can be easily observed with the timers. The 104 MHz output can be
> + * observed through the UART. One 122.88 MHz clock can be observed through the TDM device. All
> + * others can only be indirectly inferred, e.g. by comparing CPU speed or SDIO transfer rate between
> + * the fixed 26 MHz oscillator and the provided PLL frequency.
> + *
> + * The formula to calculate the clock is ((ref / refdiv) * fbdiv) / postdiv1 / postdiv2. The masks
> + * are given below. There are a few control flags:
> + *
> + * Bit 31: Disables the PLL, but passes clock-26m through unmodified. Whether POSTDIV_OUT_DISABLE
> + *         still matters is different between PLLs.
> + * Bit 30: Returns if the PLL is locked
> + * Bit 29: Not named in ZTE's code, but can be set. There is no obvious impact. Lock times are
> + *         unchanged, so it doesn't influence or bypass lock detection. It doesn't raise any IRQs or
> + *         influence GPIOs.
> + * Bit 27: Given its name it likely disables the Delta-Sigma Modulator, if one exists at all. The
> + *         boot ROM sets it on every PLL. Unsetting it marginally decreases the time it takes to
> + *         lock to the reference clock (from ~400 us to ~300 us).
> + * Bit 24: Bypasses the VCO, but still applies refdiv and postdiv. Doesn't matter if PLL_DISABLE=1.
> + *
> + * NB: Some PLLs have an automatic bypass logic that forwards clock-26m (REGARDLESS of reference)
> + * when they don't have a lock, regardless of reason. This can be triggered by disabling the PLL,
> + * setting an out-of-spec VCO frequency or disabling the parent. This shouldn't matter in regular
> + * operation, but caused me some confusion when reverse engineering the clock tree. E.g. clock-26m->
> + * unknownpll(disabled) -> dpll(enabled) counterintuitively results in a 26 MHz output clock.
> + */
> +
> +#define ZX29_PLL_DISABLE			BIT(31)
> +#define ZX29_PLL_LOCKED				BIT(30)
> +#define ZX29_PLL_LOCK_FILTER			BIT(29)
> +#define ZX29_PLL_DSM_DISABLE			BIT(27)
> +#define ZX29_PLL_PARENT_MASK			GENMASK(26, 25)
> +#define ZX29_PLL_PARENT_SHIFT			25
> +#define ZX29_PLL_BYPASS				BIT(24)
> +#define ZX29_PLL_REFDIV_MASK			GENMASK(23, 18)
> +#define ZX29_PLL_REFDIV_SHIFT			18
> +#define ZX29_PLL_FBDIV_MASK			GENMASK(17, 6)
> +#define ZX29_PLL_FBDIV_SHIFT			6
> +#define ZX29_PLL_POSTDIV1_MASK			GENMASK(5, 3)
> +#define ZX29_PLL_POSTDIV1_SHIFT			3
> +#define ZX29_PLL_POSTDIV2_MASK			GENMASK(2, 0)
> +#define ZX29_PLL_POSTDIV2_SHIFT			0
> +
> +/*
> + * The second register has a 24 bit fractional value, which only matters when ZX29_PLL_DSM_DISABLE
> + * is not set, and only seems to matter for dpll. ZTE's firmware does not make use of the fractional
> + * and it is unimplemented in this driver. Experimental testing confirms that it has an impact on
> + * dpll.
> + *
> + * Bits 27:24 contain more flags:
> + *
> + * Bit 27: Setting ZX29_PLL_DACAP slows down the lock time and obviates the speed gained from
> + *         !DSM_DISABLE. No other effect observed.
> + *
> + * Bit 26: ZX29_PLL_4PHASE_OUT_DISABLE is set on some PLLs on boot but not on others. It is set on
> + *         boot on mpll and upll, but not gpll, dpll or unknownpll. I am not sure what it does
> + *         either. The SDIO devices break if they are fed from gpll with this flag set, but they
> + *         work OK if they are fed from mpll without this flag set.
> + *
> + * Bit 25: ZX29_PLL_POSTDIV_OUT_DISABLE seems to disable the PLL output entirely. Whether it is
> + *         bypassed by PLL_DISABLE differs between PLLs. gpll still produces an output clock if
> + *         PLL_DISABLE = 1 and POSTDIV_DISABLE = 1, but produces no output if PLL_DISABLE = 0 and
> + *         POSTDIV_DISABLE = 1. The dpll feeder ("unknownpll") at 0x100 produces no output clock if
> + *         both PLL_DISABLE and POSTDIV_DISABLE are set to 1.
> + *
> + * Bit 24: ZX29_PLL_VCO_OUT_DISABLE probably disables the output of the VCO clock without
> + *         post-VCO-dividers, but the raw VCO output is not a possible parent of any consumer clock,
> + *         so I could not confirm this. It does not disable the VCO entirely - that's what
> + *         PLL_DISABLE does.
> + *
> + * A spinlock should not be needed. PLLs don't share their registers with anything else and the
> + * global prepare mutex and enable spinlock should be enough. Beware of conflicts in reg2 between
> + * POSTDIV_OUT_DISABLE and the fractional value in case you find out how fractional dividers work
> + * and add support for them.
> + */
> +#define ZX29_PLL_REG2_OFFSET			4
> +#define ZX29_PLL_DACAP				BIT(27)
> +#define ZX29_PLL_4PHASE_OUT_DISABLE		BIT(26)
> +#define ZX29_PLL_POSTDIV_OUT_DISABLE		BIT(25)
> +#define ZX29_PLL_VCO_OUT_DISABLE		BIT(24)
> +#define ZX29_PLL_FRACT				GENMASK(23, 0)
> +
> +/*
> + * The VCO's frequency range is limited. The stock settings run the VCO between 960 and 1248 MHz.
> + * Ad-hoc testing with gpll suggests that at least this PLL remains stable down to about 7 MHz and
> + * up to 2 GHz and produces a clock that can be used by the SDIO controller. Attempting to run the
> + * mpll VCO at 624 MHz and setting postdiv1 = postdiv2 = 1 - which should result in the same output
> + * frequency - or running it at 1872 MHz with an effective post divider of 3 crashes the CPU. Most
> + * likely the PLLs become unstable outside their core range and the SDIO controller is much more
> + * forgiving than CPU and DRAM are.
> + */
> +#define ZX29_PLL_VCO_MAX_FREQ			(1300 * HZ_PER_MHZ)
> +#define ZX29_PLL_VCO_MIN_FREQ			(900 * HZ_PER_MHZ)
> +
> +struct zx29_clk_pll {
> +	struct clk_hw	hw;
> +	struct device	*dev;
> +	struct regmap	*map;
> +	u16		reg;
> +};
> +
> +static inline struct zx29_clk_pll *to_zx29_clk_pll(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zx29_clk_pll, hw);
> +}
> +
> +static int zx29_pll_is_prepared(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_prepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 val = 0;
> +	int res;
> +
> +	res = regmap_clear_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	/* Lock duration is usually between 300 us and 500 us */
> +	res = regmap_read_poll_timeout(pll->map, pll->reg, val, val & ZX29_PLL_LOCKED, 50, 2000);
> +	if (res) {
> +		regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +		dev_err(pll->dev, "%s: PLL prepare failed: %d. Config value 0x%08x\n",
> +			clk_hw_get_name(&pll->hw), res, val);
> +	}
> +	return res;
> +}
> +
> +static void zx29_pll_unprepare(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg, ZX29_PLL_DISABLE);
> +}
> +
> +static int zx29_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	int res;
> +
> +	res = regmap_test_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			       ZX29_PLL_POSTDIV_OUT_DISABLE);
> +	if (res < 0)
> +		return res;
> +
> +	return !res;
> +}
> +
> +static int zx29_pll_enable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	return regmap_clear_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +				 ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static void zx29_pll_disable(struct clk_hw *hw)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +
> +	regmap_set_bits(pll->map, pll->reg + ZX29_PLL_REG2_OFFSET,
> +			ZX29_PLL_POSTDIV_OUT_DISABLE);
> +}
> +
> +static unsigned long zx29_pll_get_rate(const struct zx29_clk_pll *pll, unsigned long parent_rate,
> +				       u32 setting)
> +{
> +	unsigned long refdiv, fbdiv, postdiv1, postdiv2, freq;
> +	const char *name = clk_hw_get_name(&pll->hw);
> +	u64 vco;
> +
> +	refdiv = (setting & ZX29_PLL_REFDIV_MASK) >> ZX29_PLL_REFDIV_SHIFT;
> +	fbdiv = (setting & ZX29_PLL_FBDIV_MASK) >> ZX29_PLL_FBDIV_SHIFT;
> +	postdiv1 = (setting & ZX29_PLL_POSTDIV1_MASK) >> ZX29_PLL_POSTDIV1_SHIFT;
> +	postdiv2 = (setting & ZX29_PLL_POSTDIV2_MASK) >> ZX29_PLL_POSTDIV2_SHIFT;
> +	dev_dbg(pll->dev, "%s: reference clock %lu Hz, PLL setting 0x%08x\n",
> +		name, parent_rate, setting);
> +
> +	if (!refdiv || !postdiv1 || !postdiv2) {
> +		dev_err(pll->dev, "%s: divide by zero (%lu, %lu, %lu)\n", name, refdiv, postdiv1,
> +			postdiv2);
> +		return 0;
> +	}
> +
> +	vco = div_u64((u64)parent_rate * fbdiv, refdiv);
> +	freq = div_u64(div_u64(vco, postdiv1), postdiv2);
> +	dev_dbg(pll->dev, "%s: refdiv %lu fbdiv %lu\n", name, refdiv, fbdiv);
> +	dev_dbg(pll->dev, "%s: postdiv1 %lu postdiv2 %lu\n", name, postdiv1, postdiv2);
> +
> +	dev_dbg(pll->dev, "%s: %lu MHz\n", name, freq / HZ_PER_MHZ);
> +
> +	return freq;
> +}
> +
> +static unsigned long zx29_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 val;
> +	int res;
> +
> +	res = regmap_read(pll->map, pll->reg, &val);
> +	if (res < 0) {
> +		dev_err(pll->dev, "%s: Failed to read PLL settings\n", clk_hw_get_name(&pll->hw));
> +		return 0;
> +	}
> +
> +	return zx29_pll_get_rate(pll, parent_rate, val);
> +}
> +
> +static u32 zx29_pll_calc_values(const struct zx29_clk_pll *pll, unsigned long parent_rate,
> +				unsigned long rate, unsigned long min_rate, unsigned long max_rate)
> +{
> +	const unsigned int postdiv1_max = (1 << hweight32(ZX29_PLL_POSTDIV1_MASK)) - 1;
> +	const unsigned int postdiv2_max = (1 << hweight32(ZX29_PLL_POSTDIV2_MASK)) - 1;
> +	unsigned long fbdiv, refdiv, best_fbdiv = 0, best_refdiv = 0;
> +	u32 postdiv1 = 0, postdiv2 = 0, i, j, setting;
> +	const char *name = clk_hw_get_name(&pll->hw);
> +	long best = LONG_MAX;
> +
> +	/*
> +	 * This code produces the same VCO settings that the boot loader and stock firmware use for
> +	 * the standard frequencies. It has seen only very little manual testing beyond that.
> +	 *
> +	 * The goal is to find a VCO setting that gets us as close as possible to the desired output
> +	 * rate, while being within the VCO's operating limits and achievable with the input value
> +	 * range. It is iterating over possible post-VCO divider values (1-7)*(1-7) to look for
> +	 * valid VCO target frequencies and then looks for refdiv and fbdiv values to achieve the
> +	 * VCO frequency from the reference frequency.
> +	 */
> +	for (j = 1; j <= postdiv2_max; j++) {
> +		for (i = 1; i <= postdiv1_max; i++) {
> +			u64 vco = (u64)rate * i * j;
> +			unsigned long out;
> +
> +			if (vco > ZX29_PLL_VCO_MAX_FREQ || vco < ZX29_PLL_VCO_MIN_FREQ)
> +				continue;
> +
> +			rational_best_approximation(vco, parent_rate,
> +						    (1 << hweight32(ZX29_PLL_FBDIV_MASK)) - 1,
> +						    (1 << hweight32(ZX29_PLL_REFDIV_MASK)) - 1,
> +						    &fbdiv, &refdiv);
> +			setting = fbdiv << ZX29_PLL_FBDIV_SHIFT;
> +			setting |= refdiv << ZX29_PLL_REFDIV_SHIFT;
> +			setting |= i << ZX29_PLL_POSTDIV1_SHIFT;
> +			setting |= j << ZX29_PLL_POSTDIV2_SHIFT;
> +			out = zx29_pll_get_rate(pll, parent_rate, setting);
> +
> +			if (out < min_rate || out > max_rate)
> +				continue;
> +
> +			if (abs_diff(out, rate) > best)
> +				continue;
> +
> +			if (abs_diff(out, rate) < best) {
> +				postdiv1 = i;
> +				postdiv2 = j;
> +				best_fbdiv = fbdiv;
> +				best_refdiv = refdiv;
> +				best = abs_diff(out, rate);
> +
> +				if (!best)
> +					goto search_done;
> +			}
> +		}
> +	}
> +search_done:
> +
> +	if (!postdiv1) {
> +		dev_err(pll->dev, "Did not find a setting for %lu Hz, parent %lu Hz\n",
> +			rate, parent_rate);
> +		return 0;
> +	}
> +
> +	dev_dbg(pll->dev, "%s: parent rate %lu\n", name, parent_rate);
> +	dev_dbg(pll->dev, "%s: found VCO dividers %u and %u\n", name, postdiv1, postdiv2);
> +	dev_dbg(pll->dev, "%s: VCO target rate %lu\n", name, rate * postdiv1 * postdiv2);
> +
> +	dev_dbg(pll->dev, "%s: Got fbdiv = %lu refdiv = %lu\n", name, best_fbdiv, best_refdiv);
> +
> +	setting = best_fbdiv << ZX29_PLL_FBDIV_SHIFT;
> +	setting |= best_refdiv << ZX29_PLL_REFDIV_SHIFT;
> +	setting |= postdiv1 << ZX29_PLL_POSTDIV1_SHIFT;
> +	setting |= postdiv2 << ZX29_PLL_POSTDIV2_SHIFT;
> +	dev_dbg(pll->dev, "%s: Final setting 0x%08x\n", name, setting);
> +
> +	return setting;
> +}
> +
> +static int zx29_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	unsigned long new_rate;
> +	u32 setting;
> +
> +	/*
> +	 * TODO: DPLL can switch between two parents, one of which is another PLL. Take this into
> +	 * account when searching the config space and set req->best_parent_rate.
> +	 *
> +	 * In practice it shouldn't matter though. Dpll is always configured to a fixed frequency
> +	 * and is the only clock with a switchable parent.
> +	 */
> +	if (!req->best_parent_rate) {
> +		dev_err(pll->dev, "Did not expect best_parent_rate=0\n");
> +		return -EINVAL;
> +	}
> +
> +	setting = zx29_pll_calc_values(pll, req->best_parent_rate, req->rate, req->min_rate,
> +				       req->max_rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	new_rate = zx29_pll_get_rate(pll, req->best_parent_rate, setting);
> +	if (new_rate != req->rate) {
> +		dev_warn(pll->dev, "Did not find an exact match. Want %lu, got %lu\n",
> +			 req->rate, new_rate);

Could this also be dev_dbg() ?

> +		req->rate = new_rate;
> +	}
> +
> +	return 0;
> +}
> +
> +static int zx29_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			     unsigned long parent_rate)
> +{
> +	struct zx29_clk_pll *pll = to_zx29_clk_pll(hw);
> +	u32 setting;
> +
> +	/*
> +	 * TODO: Implement gradual PLL rate change. PLLs can be changed while they are running and
> +	 * downstream hardware is generally fine with that. The exception is DRAM, which reads
> +	 * incorrect values if changed too fast.
> +	 *
> +	 * Changing the mpll rate is potentially useful for over/underclocking. Gating mpll is
> +	 * unrealistic because too many devices depend on it.
> +	 */
> +	setting = zx29_pll_calc_values(pll, parent_rate, rate, rate, rate);
> +	if (!setting)
> +		return -EINVAL;
> +
> +	dev_info(pll->dev, "%s: Setting new configuration: 0x%08x\n", clk_hw_get_name(hw), setting);

dev_dbg()

Brian

