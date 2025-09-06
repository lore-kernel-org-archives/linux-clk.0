Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8F4255F39
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757183642; cv=none; b=NRJs9LYiAR0hPByaiHY+WpYOILNzoEtZ/9o2ok+ygIxQSt0P+8WaMT+sKAf1I30hQXG2RUqkNZWFWuLvyfyJ1ROznQVo1FcCRAGfUjhyIPuUDC4mJ/ipQeaTPwYsa8xT134j9eJP48g9uvHcn7xr9E943LOoJ6UZfOcSLHZsquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757183642; c=relaxed/simple;
	bh=W/2Sq/4yyLLnRl++lsYCiOAuBBkhcepnNFKicgLlL+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fr/eSqRrrzqpCF0JMUWHqbJK9eaJAZgRt9wPIfEPsFVohvGZrv2ovuUK4zwc3TmNMTPMBheMmXNouozE4Xub7iiafuvkO2kvUxZIZx3zSDM2q+g1uH4WC8BtTOyXQqqYbqvDY1/kv5cwFzWQf69yjTEs8GMYlJDK4HdrYeNUX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DFOTZtGo; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DFOTZtGo"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45dda7d87faso11177265e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757183638; x=1757788438; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iv6V9tVtGvXzN9JN5JdXHgexWU19RiPJvHD4mnHh1lY=;
        b=DFOTZtGoPmADL2NZ/bfb2N0Be20WmxSoZOI9Bpfk9KEoMz0gBxQMjclI2HuiohsXG3
         8Sslvnd37qAmgqjeyeJn2bwRUXLcxBMn7i4kMgmLw00DMKukqfe3OPGYwZmwvkPq5qFD
         NA2tfF/VDAIXkSSJUFWhP4+YaLg7hFlxewE0WeOz9/MAcKMAtrNyQc+VNxcsA2e3ZSGh
         ckrWw7aLe9DXSjaTxEHjPTmPfx4DKY9pOQTca4/cNm4zkFCEeKo8tPUZouwRKU3NWW1y
         Xap+jMdV7XGLr5QAI5cc+4psHfShfDwBsTuBk3+nZ/aMxXMNdH8zOPhqmdus6JuDu3x7
         x9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757183638; x=1757788438;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iv6V9tVtGvXzN9JN5JdXHgexWU19RiPJvHD4mnHh1lY=;
        b=GHb7Vf5DqufXwxK/Nln7YxRpkDCpUswafVhQoyaO3y7CZnK4SFhSlkrsmbw0dWx/83
         0UuU9OOiBT3kxc9vTQ9yMmPXj/RsO07ps2Npg+JwFhYB2tkrhbfXj5jxedSfKy+bgBrt
         iSSPdDwzyr3T5ELGU2nbgycxewNVNvcN4cheOoHgwIFO7dDl+cSR9XbQS36k+1HH5mXQ
         357FHX8mLv0x4sKlHs1xL4N3GxzaQM09nFRIZKyOAHQUmh+GeIAv9bOaH5ulh1KAuqDm
         FzTumOQ5HWPETfv1idcwf5PYaiRg3BzA3SID3RmbXZc5dNjJ8umHj7CWZ9vxuuXfCygG
         uM6A==
X-Forwarded-Encrypted: i=1; AJvYcCWIf89PKR5OA92QDTgsH3jiDXO6qc1urqYVJxfNXixW+a+gkHjNh+N9P+AqJAssG+cQa8yg7Sl3GjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsEAhRTskXttS1KFPGLGVf2dlF6oxdcLS3MZI9SL2S5KlVJTPM
	n2xEvoclyne/mM1O3SZd1tcvCCeirTYZq7TR0N6SwmHH7SxGJNm+tfnQ3gDQgg/OD94=
X-Gm-Gg: ASbGncuvyqWBiHhHviczT5qQx5mTRnsAR1QgSd8q6efnn1cRGcIvDDZ66EKN5ybztVN
	RkzBclQt1qu5ihm26VwJ1qGlKcz5r0VikxBiEx1J8IpfhyRZZxx5iuVPEndCrlEvnjle5AbVt7F
	qV1yFZ/GGUwKp7meukFfQX4lnTVAxFhZmxgqyULO/I5jMRJii2JOc53XG2Nxi4ZmzW/SY4dRBMF
	mE1lHw4Mhrib09kQTHe2ruJkiBR22lE6Bs0mi/mj2j74cUi7Y2hW8jQdwpg0+Av2iY2y746/9Iv
	NWsAy/qAyVygXs5DWu+OgPkufGUJvIzk3tvu33z6U3j/8jiGDAuGP6FMEtH6XHIzj6UsgJ0FyC8
	u0/P4nAnBNgc435IbCrzwglKDE1fIwFo=
X-Google-Smtp-Source: AGHT+IGPeBLOpzMXH5QWmLiH/7uxfPzMzBWJEe83t320chzPFpRcaWsKId0R0dA9X9dygo6lURy4DQ==
X-Received: by 2002:a05:6000:2c0b:b0:3e0:37f3:7778 with SMTP id ffacd0b85a97d-3e64317d070mr2097103f8f.26.1757183638489;
        Sat, 06 Sep 2025 11:33:58 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e411219ddfsm6301439f8f.57.2025.09.06.11.33.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:33:58 -0700 (PDT)
Message-ID: <05e16211-7521-452d-9ef3-988dfe70618e@tuxon.dev>
Date: Sat, 6 Sep 2025 21:33:56 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/32] clk: at91: sam9x75: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:06, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch SAM9X75 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> The USBCLK will be updated in subsequent patches that update the clock
> registration functions to use parent_hw and parent_data.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sam9x7.c | 308 +++++++++++++++++++++-----------------
>  1 file changed, 173 insertions(+), 135 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index cbb8b220f16b..31184e11165a 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -33,10 +33,22 @@ enum pll_ids {
>  	PLL_ID_UPLL,
>  	PLL_ID_AUDIO,
>  	PLL_ID_LVDS,
> -	PLL_ID_PLLA_DIV2,
>  	PLL_ID_MAX,
>  };
>  
> +/*
> + * PLL component identifier
> + * @PLL_COMPID_FRAC: Fractional PLL component identifier
> + * @PLL_COMPID_DIV0: 1st PLL divider component identifier
> + * @PLL_COMPID_DIV1: 2nd PLL divider component identifier
> + */
> +enum pll_component_id {
> +	PLL_COMPID_FRAC,
> +	PLL_COMPID_DIV0,
> +	PLL_COMPID_DIV1,
> +	PLL_COMPID_MAX,
> +};
> +
>  /**
>   * enum pll_type - PLL type identifiers
>   * @PLL_TYPE_FRAC:	fractional PLL identifier
> @@ -180,6 +192,18 @@ static const struct clk_pll_layout pll_divio_layout = {
>  	.endiv_shift	= 30,
>  };
>  
> +/*
> + * SAM9X7 PLL possible parents
> + * @SAM9X7_PLL_PARENT_MAINCK: MAINCK is PLL a parent
> + * @SAM9X7_PLL_PARENT_MAIN_XTAL: MAIN XTAL is a PLL parent
> + * @SAM9X7_PLL_PARENT_FRACCK: Frac PLL is a PLL parent (for PLL dividers)
> + */
> +enum sam9x7_pll_parent {
> +	SAM9X7_PLL_PARENT_MAINCK,
> +	SAM9X7_PLL_PARENT_MAIN_XTAL,
> +	SAM9X7_PLL_PARENT_FRACCK
> +};
> +
>  /*
>   * PLL clocks description
>   * @n:		clock name
> @@ -187,22 +211,24 @@ static const struct clk_pll_layout pll_divio_layout = {
>   * @l:		clock layout
>   * @t:		clock type
>   * @c:		pll characteristics
> + * @hw:		pointer to clk_hw
>   * @f:		clock flags
>   * @eid:	export index in sam9x7->chws[] array
>   */
> -static const struct {
> +static struct {
>  	const char *n;
> -	const char *p;
>  	const struct clk_pll_layout *l;
>  	u8 t;
>  	const struct clk_pll_characteristics *c;
> +	struct clk_hw *hw;
>  	unsigned long f;
> +	enum sam9x7_pll_parent p;
>  	u8 eid;
> -} sam9x7_plls[][3] = {
> +} sam9x7_plls[][PLL_COMPID_MAX] = {
>  	[PLL_ID_PLLA] = {
> -		{
> +		[PLL_COMPID_FRAC] = {
>  			.n = "plla_fracck",
> -			.p = "mainck",
> +			.p = SAM9X7_PLL_PARENT_MAINCK,
>  			.l = &plla_frac_layout,
>  			.t = PLL_TYPE_FRAC,
>  			/*
> @@ -213,9 +239,9 @@ static const struct {
>  			.c = &plla_characteristics,
>  		},
>  
> -		{
> +		[PLL_COMPID_DIV0] = {
>  			.n = "plla_divpmcck",
> -			.p = "plla_fracck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
>  			.l = &pll_divpmc_layout,
>  			.t = PLL_TYPE_DIV,
>  			/* This feeds CPU. It should not be disabled */
> @@ -223,21 +249,35 @@ static const struct {
>  			.eid = PMC_PLLACK,
>  			.c = &plla_characteristics,
>  		},
> +
> +		[PLL_COMPID_DIV1] = {
> +			.n = "plla_div2pmcck",
> +			.p = SAM9X7_PLL_PARENT_FRACCK,
> +			.l = &plladiv2_divpmc_layout,
> +			/*
> +			 * This may feed critical parts of the system like timers.
> +			 * It should not be disabled.
> +			 */
> +			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> +			.c = &plladiv2_characteristics,
> +			.eid = PMC_PLLADIV2,
> +			.t = PLL_TYPE_DIV,
> +		},

According to manual at [1] this looks correct. Maybe mention this move in
commit description.

[1]
https://ww1.microchip.com/downloads/aemDocuments/documents/MPU32/ProductDocuments/DataSheets/SAM9X7-Series-Data-Sheet-DS60001813.pdf


[...]

>  static void __init sam9x7_pmc_setup(struct device_node *np)
>  {
>  	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	const char *main_xtal_name = "main_xtal";
>  	struct pmc_data *sam9x7_pmc;
>  	const char *parent_names[9];
>  	void **clk_mux_buffer = NULL;
>  	int clk_mux_buffer_size = 0;
> -	struct clk_hw *main_osc_hw;
>  	struct regmap *regmap;
> -	struct clk_hw *hw;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw, *main_xtal_hw;
> +	struct clk_hw *td_slck_hw, *md_slck_hw, *usbck_hw;
> +	static struct clk_parent_data parent_data;
> +	struct clk_hw *parent_hws[9];
>  	int i, j;
>  
> -	i = of_property_match_string(np, "clock-names", "td_slck");
> -	if (i < 0)
> -		return;
> -
> -	td_slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "md_slck");
> -	if (i < 0)
> -		return;
> -
> -	md_slck_name = of_clk_get_parent_name(np, i);
> +	td_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "td_slck"));
> +	md_slck_hw = __clk_get_hw(of_clk_get_by_name(np, "md_slck"));
> +	main_xtal_hw = __clk_get_hw(of_clk_get_by_name(np, main_xtal_name));
>  
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> +	if (!td_slck_hw || !md_slck_hw || !main_xtal_hw)
>  		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
>  
>  	regmap = device_node_to_regmap(np);
>  	if (IS_ERR(regmap))
> @@ -754,26 +774,27 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	if (!clk_mux_buffer)
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> -					   50000000);
> -	if (IS_ERR(hw))
> +	main_rc_hw = at91_clk_register_main_rc_osc(regmap, "main_rc_osc", 12000000,
> +						   50000000);
> +	if (IS_ERR(main_rc_hw))
>  		goto err_free;
>  
> -	hw = at91_clk_register_main_osc(regmap, "main_osc", mainxtal_name, NULL, 0);
> -	if (IS_ERR(hw))
> +	parent_data.name = main_xtal_name;
> +	parent_data.fw_name = main_xtal_name;

You should be able to use AT91_CLK_PD_NAME() directly in the above call
where main_xtal_name should be retrieved with of_clk_get_parent_name()

