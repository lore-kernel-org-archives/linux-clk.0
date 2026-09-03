Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C944E66BB;
	Thu,  3 Sep 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788450604; cv=none; b=C+c7+G0hwD6pVngoyssU5/GXExwpCzl0aguxwhYHJ3I4yO6bMJg2VjidgItWE98F3LaIFPIuE5n+NZLvIY0m+/vIdCtlfYaR7xTl3RnPGIeeK76GIzBoSp6NQzQhIdgHqm1Gq35HmptDk46ZEsuwwXYUn+WmJ73BAWMC4mMxeuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788450604; c=relaxed/simple;
	bh=P5yL6XM+HFZD2EJo3mgYDXyrzkgPSp5EI8Wlswg1ons=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5KAgwF5hABApONCk23EP4WsO3iVyHeDdlUHcO9BW4arTJpf+01xrPODc4hN4ww2uhWsPntm3lvxFBfjw3hNNt696P6QtTN9IgTjjbH8GAF7ouSFdLS4ntGvpGuH99dXMVmbZoRuYQkZ7Mkyzk+qwh0t2uJwoVumjKY0TmxcZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=Y+LRzX5x; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Z9gdxPc8; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="Y+LRzX5x";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Z9gdxPc8"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id EBA2DEC0238;
	Thu,  3 Sep 2026 11:50:00 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 03 Sep 2026 11:50:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788450600;
	 x=1788537000; bh=wPaKRwmdtsp1vBm6EBvKaf7R0Kdtczf/LA21lHbOp6w=; b=
	Y+LRzX5xXrXNqayPe7KMXhQ/+VURhxMAgD0ouM2uz/50gHIgx6YbABbiyMMOXR1n
	a62FqLUqkD5wWgT2vYK68ItICcEiLtaaur7gr1X4uNDroxw8do+W+vLveKTo7EPx
	Sbcdsu9eyzYh8/+nYrO/dvdzAXbVviuSCN5cC1PKGN50g6kcP9QN9SffMZUBytKA
	eitoKI86Sv0Oz024heau6EJUYkyji/8cuY0dyXEC6fPwPJM9e8QOM8XKA0OJsAqI
	3dLYFULnT4HTI9P7GB7GEV6cWZAA5U/qXYtIISToY/UUX8709akWpnvihHPv8j2/
	wi84HN0OocBuE8VO0U4G/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788450600; x=
	1788537000; bh=wPaKRwmdtsp1vBm6EBvKaf7R0Kdtczf/LA21lHbOp6w=; b=Z
	9gdxPc8qT4qcXSUK4pJjIKUZA7ps5P7Hj4MRy4YH/XdqaH1bQxW76li8Mfuc/ZF4
	9QHYb5cBxEP0YjeqayeT5DTxvZaRn/r/oqnmpR/wSwElb/KadB/+AG6WWEnBrmuL
	L1gcPyr+jVPqTiLzDwTrefksTVkffwpeReiVWreZoGWNIJMRPT/SwCR29gnlKFi9
	+GdNJoeOyzcakBvLwfGnOvPajhgPqucUGyIAzdNoaFm6SzUY6mKnlqxpDXO9Xmp8
	oAJgQRjtNe91wFtgnOengMBGcoDM1J7gAmz6zUZdjdbutqEJUH4m1abFdnz186m6
	PCl6AWggSZm6Ls56takfA==
X-ME-Sender: <xms:KJeZavHlyvyQp1ITFAuWKHqGWF30QMATEV5ve-6B4q4v8iZufmvNnA>
    <xme:KJeZatDb1XPu0wiq2DEhbo2VPGHjtI0WBc9bJJqlrIgkpDxNmczsualM1raAuwL4y
    n98CDEqcx09KOfm-Qh1XoquWRz_ycZwtihLcPuhaYJU9BsnImp-6dir>
X-ME-Received: <xmr:KJeZavVLAMGn5ROfkGFNygK9_hz4s760hvCyX0JDGCv4TChCuca79hEbnSDq2cR9M7j1hNwS1l9-JsqeHt_pda0n21XARj0>
X-ME-Proxy-Cause: dmFkZTEKFNFBziP3Hnm5AxBg2sOgHcF9oUDXzJd61wy6hyexaRStyPEYfzZyFEEdEoTapN
    egHacyPulcZ2GKXuuvQOWha3eill4kuuVHLBl50Qkyqh3QI7U4+y82Rg9GOmZ9lEmxosy2
    LV5IqBSLogMY+bS5t9+REPNqkXe+PKHh2HEn8rX84EW2uOBT/DFTO19KuUAmjE4zzGRm6P
    mSSmrzltrnA46Eto7106GnTVygTolp1Lm2U4/TY/3L4wIMkWM4sPORwpjrSBUdn3q6UxZc
    36eYCchSuy7xETYPlQWwmTApU2tj4YE4f6M0IBGQ+l5kdaAAgv6TsEbiMagvTn/EHmjqoC
    SJ4AUPSj8PQdwFFifVCmCmLch4a3KEl92ZrfhEhURsHD/7BoT0QscUJ/Rno1jcguv53K/+
    9HAT7zYx9jAE+l5xZwkxg2UthHEDsw6jrVcYo4huSVBGPIRMIlduNiNPhtWa94zpszOeFL
    3K1w1VBGdIJBKGm/O4/ciGRAfJKkjs3yxYmbbaQ9s+48lmCu9myXI12XCJoeFd4+nVnim6
    VjDjtSDBFvCHgNWPpsYK+BomZb9G4WPYSMh+Zyqxb9Ikk3LVFdFsla+iEXI4tj1YnAho47
    J0UKC4sqA8FBfFCPX6+3cHIPxQhn5mbb63yLSHfhkNCZjxc7YWSL7h+2AQxg
X-ME-Proxy: <xmx:KJeZahrVhz9_kCC5MMh89piSc_xcj3LNN3QTP1kI9NSnxB1swPkCaA>
    <xmx:KJeZarRzHYrlswsrGnxcyu5cTEXFPH8ltA0Ef3Sp40MLI-bIf4gtlw>
    <xmx:KJeZar321pRvz1s0r3DDSXyWumz6MeL-OMdNnzOuYAhRttnIdj2-Nw>
    <xmx:KJeZanCa_XCXiZsc5LDFgUYkTAlFpNZhbCARYrHn7UVG6GcRoP46lA>
    <xmx:KJeZak0ehqF0Eo7H5f0G5mDxvK51lNkbbeqeGWC76xRXU0iJqtChtgLu>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 3 Sep 2026 11:49:59 -0400 (EDT)
Date: Thu, 3 Sep 2026 17:49:57 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: Use FIELD_GET()
Message-ID: <20260903154957.GA3497753@ragnatech.se>
References: <17c50847f86b814150573e34cc64913f09598f0f.1788437047.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <17c50847f86b814150573e34cc64913f09598f0f.1788437047.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your work.

On 2026-09-03 14:05:25 +0200, Geert Uytterhoeven wrote:
> Improve readability by using the FIELD_GET() helper instead of
> open-coding the same operation, and by adding field definitions to get
> rid of hardcoded values.
> 
> While at it, move register definitions that are only used inside the
> rcar-gen3-cpg.c source file out of the rcar-gen3-cpg.h header file.
> Add comments where appropriate.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v7.4.
> 
>  drivers/clk/renesas/rcar-gen3-cpg.c | 15 +++++++++------
>  drivers/clk/renesas/rcar-gen3-cpg.h |  3 +--
>  2 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index e5b503332217dcdc..bbb76e4fa333553d 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -36,7 +36,11 @@
>  
>  #define CPG_PLLnCR_STC_MASK	GENMASK(30, 24)	/* PLL Circuit Mult. Ratio */
>  
> -#define CPG_RCKCR_CKSEL	BIT(15)	/* RCLK Clock Source Select */
> +#define CPG_RPCCKCR		0x238	/* RPC-IF Clock Frequency Control Reg */
> +#define CPG_RPCCKCR_DIV_RPCSRC	GENMASK(4, 3)	/* RPCSRC divider */
> +
> +#define CPG_RCKCR_CKSEL		BIT(15)		/* RCLK Clock Source Select */
> +#define CPG_RCKCR_DIV		GENMASK(5, 0)	/* RCLK Division Ratio */
>  
>  /* PLL Clocks */
>  struct cpg_pll_clk {
> @@ -395,7 +399,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  		 * the multiplier value.
>  		 */
>  		value = readl(base + CPG_PLL4CR);
> -		mult = (((value >> 24) & 0x7f) + 1) * 2;
> +		mult = (FIELD_GET(CPG_PLLnCR_STC_MASK, value) + 1) * 2;
>  		break;
>  
>  	case CLK_TYPE_GEN3_SDH:
> @@ -420,7 +424,7 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  			 * RINT is default.
>  			 * Only if EXTALR is populated, we switch to it.
>  			 */
> -			value = readl(csn->reg) & 0x3f;
> +			value = readl(csn->reg) & CPG_RCKCR_DIV;
>  
>  			if (clk_get_rate(clks[cpg_clk_extalr])) {
>  				parent = clks[cpg_clk_extalr];
> @@ -496,9 +500,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>  		 * MD[4:1] pins and CPG_RPCCKCR[4:3] register value for
>  		 * which has been set prior to booting the kernel.
>  		 */
> -		value = (readl(base + CPG_RPCCKCR) & GENMASK(4, 3)) >> 3;
> -
> -		switch (value) {
> +		value = readl(base + CPG_RPCCKCR);
> +		switch (FIELD_GET(CPG_RPCCKCR_DIV_RPCSRC, value)) {
>  		case 0:
>  			div = 5;
>  			break;
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.h b/drivers/clk/renesas/rcar-gen3-cpg.h
> index d15a5d1df71c788b..fa25911b993edfb9 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.h
> @@ -76,8 +76,7 @@ struct rcar_gen3_cpg_pll_config {
>  	u8 osc_prediv;
>  };
>  
> -#define CPG_RPCCKCR	0x238
> -#define CPG_RCKCR	0x240
> +#define CPG_RCKCR		0x240	/* RCLK Frequency Control Register */
>  
>  struct clk *rcar_gen3_cpg_clk_register(struct device *dev,
>  	const struct cpg_core_clk *core, const struct cpg_mssr_info *info,
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund
