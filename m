Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A611A25FA05
	for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 08:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769417520; cv=none; b=t0YO+2QRZoM3aByEmqxEBMSa7W3R4mknVMoEY+mkWg1lYWWml8KHa+r8TIucYaX31vwtE/QSl0yfHnT+n04EKQdstJ9TSPfhXmo0sY2SaihoBMITrDgRNIW81ejcj5kBYi/iFcf3I4gQwcMEqFueEy/gnJJIo4VKbDTjUQz8+0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769417520; c=relaxed/simple;
	bh=yNNmDafKikk8OeTbLJGPY++ioU4/Rj1Y/FjQfcjoWuI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JYq0iWaX3F/JjaoIClszRk3JFu/rugViLZiQ2wvWPAmSzD1hxCoAKtFjKkYyug/5YF8fxROJ4QDXgiZcSEJci+NTHI0GckbC8+jQ9FAJKsWsw+gPeFMshJpvf2JHdCWqz8aKRGcyDpKsiZU7HqoV0Lx5IoJ2X7wJ7/1rP3jyw14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=LxsHG4Ay; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="LxsHG4Ay"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47f3b7ef761so30106975e9.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Jan 2026 00:51:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769417516; x=1770022316; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xs82vUP5osntenqpqOoVmwrbJUmMQdIcW7feR5dYo94=;
        b=LxsHG4Aydm7GyW/sIsTg24fitlR4dYHYUnDbXfa9hjDkJflrfEyrz/k12dByxyKtkm
         zPyF82xpT8qYdz83s80NyExukdNtqgDmJQKWkUFxSLKhY8Dd7o1NI62cjVxxq6PwM23R
         iBGC7ynb1+ZdHKRYuohOv20CWG2l5s9YSqsgWJTcyVpm6ttxhO1ugBSRaU3qwBsZr8e2
         xyIox3eL43Vg6+e+AjKDkiq2kLoUW/vvaqFtIv4icvgm46JMu5wLeHeSJpPGmtjSPiKb
         OB0f8DSVg2PdDWo19XK1K1/JEbcklgNTdiGJL7iXJlWgyv00te2iL7DvRsk08D/RKb27
         9w1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769417516; x=1770022316;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xs82vUP5osntenqpqOoVmwrbJUmMQdIcW7feR5dYo94=;
        b=GVZdbAS1nMeGPqz1FSS4OYWKMIIPaHIBC1BFPrh8UgiPBZ1sltzN43tBjf36WCiDV5
         /vjG8ywJeZ0Vp23VpmFdvvfqk+H3VV3icQam86zgU1hQQJKdjoWt5ct+x/3hArgSXz33
         GbCdstwIP9y2W5WSi73FsEew/GdyVsK6lSZZG1g0/jb1VNIEUHChlg9gr5yW69azkjLJ
         MOEgZZdOSjcWlQj6wx9IerPyfG3YnC7tLXzUIEJG2LlF9dYup/9pr239YGil7ZQMlHxx
         ndsPsFAWk7nn4m3Fz/DMhYA+T9mZuPxTP+dks9vojgOudl7sChXEGU6ZkatL9BObtJeb
         cz6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUegs8mk3KtU9hniT6rZZ8Th2zZrSfsVBJmBvWCKWqfv11pcGP37HJ85/F1Lmc7DJExDkyHf40rHgE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf39PdH/Y4cCze0hoqUxXIFQ9jy6plwn9c0CURL3LxDvRkL5uX
	47b332c99Z5o3Ak8ibTDJ1anBHGrZWF43Gg+GT/iVkgpQUal5TZ6MNjwAD1/Ci84KQPugiHiJfQ
	pkEx4
X-Gm-Gg: AZuq6aJotFBD5hUbiMmJMThNl275J2j9AYlz5swvrePwGBygRAjOn7ia8XA3CgZxi3e
	aLT+lJpHc0XMuOAFNr+O7ra3heQtaIhaStmDHL1jnaNJAuZ5RdkLEp+1KlS4xgriPW0eQfJ7LQK
	7/SxpvkuhINE5jP4FMRmyWnA0S9FM+3Syl/Bl20VgLakXzEUmlO3rJH9wtP9CAW12sD7qBrRytg
	did7hHVusMi1QZyFFPK+0L2f5ZumLxqUasEueezbQfdesqIVgXL3q/KRgQbU2jqR300LRDoIDG8
	S0lfheSQLxT/QNCGej6z/Yo13NCG4IE1gLPojGlaGB8+nH384FJWwfIBINHZgeqZxoVmBsTR/UM
	og70PGiZ1bctZLoLGGuCvm9YcF8FyKuJAT6Dpbjt3nWaeVlEbaUvC4n5zWJei76oIVzAGnous1Y
	/696DnB14u3iJg4Edbzw==
X-Received: by 2002:a05:600c:1992:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-4805ce3ff38mr72084645e9.1.1769417515426;
        Mon, 26 Jan 2026 00:51:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm462919105e9.2.2026.01.26.00.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 00:51:55 -0800 (PST)
Message-ID: <8fea4eb8-6160-448c-b0b2-5c093a1ed769@tuxon.dev>
Date: Mon, 26 Jan 2026 10:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/31] clk: at91: sam9x75: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <30ba2ce066b788f5b5bcbf3db927b30293d881b6.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <30ba2ce066b788f5b5bcbf3db927b30293d881b6.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 1/16/26 22:06, ryan.wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch SAM9X75 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> The USBCLK will be updated in subsequent patches that update the clock
> registration functions to use parent_hw and parent_data.
> 
> __clk_get_hw() will be removed in subsequent patches in this series.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sam9x7.c | 305 ++++++++++++++++++++++----------------
>   1 file changed, 174 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index 89868a0aeaba..c48c91da914e 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c


[ ...]

>   
>   /*
> @@ -426,7 +450,8 @@ static const struct {
>   /*
>    * Generic clock description
>    * @n:			clock name
> - * @pp:			PLL parents
> + * @pp:			PLL parents (entry formed by PLL components identifiers
> + *			(see enum pll_component_id))
>    * @pp_mux_table:	PLL parents mux table
>    * @r:			clock output range
>    * @pp_chg_id:		id in parent array of changeable PLL parent
> @@ -435,7 +460,10 @@ static const struct {
>    */
>   static const struct {
>   	const char *n;
> -	const char *pp[8];
> +	struct {
> +			int pll_id;
> +			int pll_compid;

Still having more than 2 tabs here.

[ ... ]

>   static void __init sam9x7_pmc_setup(struct device_node *np)
>   {
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	const char *main_xtal_name;
>   	struct pmc_data *sam9x7_pmc;
>   	const char *parent_names[9];
>   	void **clk_mux_buffer = NULL;
>   	int clk_mux_buffer_size = 0;
> -	struct clk_hw *main_osc_hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	struct clk_hw *parent_hws[9];
>   	int i, j;
>   
> -	i = of_property_match_string(np, "clock-names", "td_slck");
> -	if (i < 0)
> -		return;
> -
> -	td_slck_name = of_clk_get_parent_name(np, i);
> +	i = of_property_match_string(np, "clock-names", "main_xtal");
>   
> -	i = of_property_match_string(np, "clock-names", "md_slck");
>   	if (i < 0)
>   		return;
> +	main_xtal_name = of_clk_get_parent_name(np, i);
>   
> -	md_slck_name = of_clk_get_parent_name(np, i);
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
>   
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> +	if (!td_slck_hw || !md_slck_hw)
>   		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);

I would have been prefered that the code here to look more organized, something 
like:

	i = of_property_match_string(np, "clock-names", "main_xtal");
	if (i < 0)
		return;
	main_xtal_name = of_clk_get_parent_name(np, i);

	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
	if (!td_slck_hw || !md_slck_hw)
		return;

but it is OK for now as the final form looks alike.

>   
>   	regmap = device_node_to_regmap(np);
>   	if (IS_ERR(regmap))
> @@ -760,26 +784,26 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (!clk_mux_buffer)
>   		goto err_free;
>   
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>   		goto err_free;
>   
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> -	if (IS_ERR(hw))
> +	main_osc_hw = at91_clk_register_main_osc(regmap, "main_osc", NULL,
> +						 &AT91_CLK_PD_NAME(main_xtal_name), 0);
> +	if (IS_ERR(main_osc_hw))
>   		goto err_free;
> -	main_osc_hw = hw;
>   
> -	parent_names[0] = "main_rc_osc";
> -	parent_names[1] = "main_osc";
> -	hw = at91_clk_register_sam9x5_main(regmap, "mainck", parent_names, NULL, 2);
> +	parent_hws[0] = main_rc_hw;
> +	parent_hws[1] = main_osc_hw;
> +	hw = at91_clk_register_sam9x5_main(regmap, "mainck", NULL, parent_hws, 2);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
>   	sam9x7_pmc->chws[PMC_MAIN] = hw;
>   
>   	for (i = 0; i < PLL_ID_MAX; i++) {
> -		for (j = 0; j < 3; j++) {
> +		for (j = 0; j < PLL_COMPID_MAX; j++) {
>   			struct clk_hw *parent_hw;
>   
>   			if (!sam9x7_plls[i][j].n)
> @@ -787,19 +811,23 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   
>   			switch (sam9x7_plls[i][j].t) {
>   			case PLL_TYPE_FRAC:
> -				if (!strcmp(sam9x7_plls[i][j].p, "mainck"))
> +				switch (sam9x7_plls[i][j].p) {
> +				case SAM9X7_PLL_PARENT_MAINCK:
>   					parent_hw = sam9x7_pmc->chws[PMC_MAIN];
> -				else if (!strcmp(sam9x7_plls[i][j].p, "main_osc"))
> -					parent_hw = main_osc_hw;
> -				else
> -					parent_hw = __clk_get_hw(of_clk_get_by_name
> -								 (np, sam9x7_plls[i][j].p));
> +					break;
> +				case SAM9X7_PLL_PARENT_MAIN_XTAL:
> +					parent_hw = main_xtal_hw;

main_xtal_hw is not initialized. You should be able to do here as you did on 
patch 7/31.

> +					break;
> +				default:
> +					/* Should not happen. */
> +					parent_hw = NULL;
> +					break;
> +				}
>   
>   				hw = sam9x60_clk_register_frac_pll(regmap,
>   								   &pmc_pll_lock,
>   								   sam9x7_plls[i][j].n,
> -								   sam9x7_plls[i][j].p,
> -								   parent_hw, i,
> +								   NULL, parent_hw, i,
>   								   sam9x7_plls[i][j].c,
>   								   sam9x7_plls[i][j].l,
>   								   sam9x7_plls[i][j].f);
> @@ -809,7 +837,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   				hw = sam9x60_clk_register_div_pll(regmap,
>   								  &pmc_pll_lock,
>   								  sam9x7_plls[i][j].n,
> -								  sam9x7_plls[i][j].p, NULL, i,
> +								  NULL, sam9x7_plls[i][0].hw, i,
>   								  sam9x7_plls[i][j].c,
>   								  sam9x7_plls[i][j].l,
>   								  sam9x7_plls[i][j].f, 0);
> @@ -822,23 +850,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   			if (IS_ERR(hw))
>   				goto err_free;
>   
> +			sam9x7_plls[i][j].hw = hw;
>   			if (sam9x7_plls[i][j].eid)
>   				sam9x7_pmc->chws[sam9x7_plls[i][j].eid] = hw;
>   		}
>   	}
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = "mainck";
> -	parent_names[2] = "plla_divpmcck";
> -	parent_names[3] = "upll_divpmcck";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[2] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> +	parent_hws[3] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
>   	hw = at91_clk_register_master_pres(regmap, "masterck_pres", 4,
> -					   parent_names, NULL, &sam9x7_master_layout,
> +					   NULL, parent_hws, &sam9x7_master_layout,
>   					   &mck_characteristics, &mck_lock);
>   	if (IS_ERR(hw))
>   		goto err_free;
>   
>   	hw = at91_clk_register_master_div(regmap, "masterck_div",
> -					  "masterck_pres", NULL, &sam9x7_master_layout,
> +					  NULL, hw, &sam9x7_master_layout,
>   					  &mck_characteristics, &mck_lock,
>   					  CLK_SET_RATE_GATE, 0);
>   	if (IS_ERR(hw))
> @@ -849,24 +878,24 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	parent_names[0] = "plla_divpmcck";
>   	parent_names[1] = "upll_divpmcck";
>   	parent_names[2] = "main_osc";
> -	hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> -	if (IS_ERR(hw))
> +	usbck_hw = sam9x60_clk_register_usb(regmap, "usbck", parent_names, 3);
> +	if (IS_ERR(usbck_hw))
>   		goto err_free;
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = td_slck_name;
> -	parent_names[2] = "mainck";
> -	parent_names[3] = "masterck_div";
> -	parent_names[4] = "plla_divpmcck";
> -	parent_names[5] = "upll_divpmcck";
> -	parent_names[6] = "audiopll_divpmcck";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
> +	parent_hws[4] = sam9x7_plls[PLL_ID_PLLA][PLL_COMPID_DIV0].hw;
> +	parent_hws[5] = sam9x7_plls[PLL_ID_UPLL][PLL_COMPID_DIV0].hw;
> +	parent_hws[6] = sam9x7_plls[PLL_ID_AUDIO][PLL_COMPID_DIV0].hw;
>   	for (i = 0; i < 2; i++) {
>   		char name[6];
>   
>   		snprintf(name, sizeof(name), "prog%d", i);
>   
>   		hw = at91_clk_register_programmable(regmap, name,
> -						    parent_names, NULL, 7, i,
> +						    NULL, parent_hws, 7, i,
>   						    &sam9x7_programmable_layout,
>   						    NULL);
>   		if (IS_ERR(hw))
> @@ -875,9 +904,14 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->pchws[i] = hw;
>   	}
>   
> +	/* Set systemck parent hws. */
> +	sam9x7_systemck[0].parent_hw = sam9x7_pmc->chws[PMC_MCK];
> +	sam9x7_systemck[1].parent_hw = usbck_hw;
> +	sam9x7_systemck[2].parent_hw = sam9x7_pmc->pchws[0];
> +	sam9x7_systemck[3].parent_hw = sam9x7_pmc->pchws[1];
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_systemck); i++) {
>   		hw = at91_clk_register_system(regmap, sam9x7_systemck[i].n,
> -					      sam9x7_systemck[i].p, NULL,
> +					      NULL, sam9x7_systemck[i].parent_hw,
>   					      sam9x7_systemck[i].id,
>   					      sam9x7_systemck[i].flags);
>   		if (IS_ERR(hw))
> @@ -890,7 +924,7 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		hw = at91_clk_register_sam9x5_peripheral(regmap, &pmc_pcr_lock,
>   							 &sam9x7_pcr_layout,
>   							 sam9x7_periphck[i].n,
> -							 "masterck_div", NULL,
> +							 NULL, sam9x7_pmc->chws[PMC_MCK],
>   							 sam9x7_periphck[i].id,
>   							 &range, INT_MIN,
>   							 sam9x7_periphck[i].f);
> @@ -900,12 +934,13 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		sam9x7_pmc->phws[sam9x7_periphck[i].id] = hw;
>   	}
>   
> -	parent_names[0] = md_slck_name;
> -	parent_names[1] = td_slck_name;
> -	parent_names[2] = "mainck";
> -	parent_names[3] = "masterck_div";
> +	parent_hws[0] = md_slck_hw;
> +	parent_hws[1] = td_slck_hw;
> +	parent_hws[2] = sam9x7_pmc->chws[PMC_MAIN];
> +	parent_hws[3] = sam9x7_pmc->chws[PMC_MCK];
>   	for (i = 0; i < ARRAY_SIZE(sam9x7_gck); i++) {
>   		u8 num_parents = 4 + sam9x7_gck[i].pp_count;
> +		struct clk_hw *tmp_parent_hws[6];

I see maximum pp_count is 2, thus the size of this array could be reduced.

>   		u32 *mux_table;
>   
>   		mux_table = kmalloc_array(num_parents, sizeof(*mux_table),
> @@ -916,13 +951,21 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   		PMC_INIT_TABLE(mux_table, 4);
>   		PMC_FILL_TABLE(&mux_table[4], sam9x7_gck[i].pp_mux_table,
>   			       sam9x7_gck[i].pp_count);
> -		PMC_FILL_TABLE(&parent_names[4], sam9x7_gck[i].pp,
> +
> +		for (j = 0; j < sam9x7_gck[i].pp_count; j++) {
> +			u8 pll_id = sam9x7_gck[i].pp[j].pll_id;
> +			u8 pll_compid = sam9x7_gck[i].pp[j].pll_compid;
> +
> +			tmp_parent_hws[j] = sam9x7_plls[pll_id][pll_compid].hw;

You can get rid of tmp_parent_hws[] and the above PMC_FILL_TABLE() and just use 
here something like:

			parent_hws[4 + j] = sam9x7_plls[pll_id][pll_compid].hw;

> +		}
> +
> +		PMC_FILL_TABLE(&parent_hws[4], tmp_parent_hws,
>   			       sam9x7_gck[i].pp_count);
>   
>   		hw = at91_clk_register_generated(regmap, &pmc_pcr_lock,
>   						 &sam9x7_pcr_layout,
>   						 sam9x7_gck[i].n,
> -						 parent_names, NULL, mux_table,
> +						 NULL, parent_hws, mux_table,
>   						 num_parents,
>   						 sam9x7_gck[i].id,
>   						 &sam9x7_gck[i].r,

