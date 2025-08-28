Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5CC338F2E
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 17:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756402702; cv=none; b=ret2uQ8vY7Z0Lz7i3bMW8YVVBcCVhgU6UzyUABPMHcKw/uWb15UZn78jdVe5tsmXCXsVDn2Lsmqbk9AavpDzbE4VuNxRP3wDiTVgU59fUhUafpSoAFlvDwg374eVqeQdvWTPyU7WKUnnTaFSiDJA91vfEsLe1WmSKBYXF3V1Q38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756402702; c=relaxed/simple;
	bh=SNXhCWfAZBtgC6ZU2ndzFpAUbXp6YJbSyN/+bro18TM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WTtfUEcvsx4eL0X4RU0tCAS/P7GFD0bU4/y0OWVt+qWKTUvthj51muK2Ls7QCyMoEgLCNPreYmgMtVsPy+Ih+6EHuaXCBmBFQQAlxOmTPoXLtsRSE6GNQHNCsF2vZjSbt5TmmpQX0rFSM8MrIUI0Djc8PPvOrp/5Q9DvIbOF7vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eiy8/CbG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eiy8/CbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756402699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=K6p2tt16Ex86fLCzx2c9aJ/wVLkuf0FjhhNKWXNuhhU=;
	b=Eiy8/CbGW/22nXY2GkppTXkGiRLkUikJZduvIqdtgLEYaHX4Inyxiypt8TcxeaUlMcsl8G
	FBnmP2oazIprOD66ZMwDBuqr6LyOr6K43MfbeVoO7JwGQNqM69/LOdLUn2i5jScnYapqgg
	YeuBtHwZZxaMfLahBOGjx9dJsEe19CE=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-zXwAvQ_eMluJ9Js-HHd8Xg-1; Thu, 28 Aug 2025 13:38:15 -0400
X-MC-Unique: zXwAvQ_eMluJ9Js-HHd8Xg-1
X-Mimecast-MFC-AGG-ID: zXwAvQ_eMluJ9Js-HHd8Xg_1756402695
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70d7c7e972eso28867496d6.3
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 10:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756402695; x=1757007495;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K6p2tt16Ex86fLCzx2c9aJ/wVLkuf0FjhhNKWXNuhhU=;
        b=BVu3f1oiyVuTTqiIs/CiQYMm/ytT08p1YM1IltzXk8+cj5tNbqAlSNY7hgWVefSI+o
         Ju04vEcwcB8txCvgJGSxSwcel20YhgFM0Si89otP3V9FKY+q+5LNXOwS/MY9aVbZE7/q
         wzIdwzl4U/NOqKlHqCn5sJSFtkrDxl3as/oFf2ZNXusyZJxhFTAPCserM16aOSLOxwwn
         O5Nxbfs0eGmckiqaqC6488C1OwzJQRpNlcz6hR36XoDKlqWzcClXNWcEUYHx2PD7lTbb
         YUrVhGdASYRNV1YAtb1fL8d7y2x+sktfO7pA3dIPKf1pRjK7BO0DJuzJpT9HeCS2XOPZ
         216Q==
X-Forwarded-Encrypted: i=1; AJvYcCXqD0V0mWbDjlcM294rZ3aWIWIR5F3mr+an537kEcjJDag8/btT8m39xdx7Y5CpoIeT3uWHlcLVFGg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7ht74Lp81AsTG3i20oYjDx6yL5k8NJ2lFnIdsa50Th+fYHkDl
	iXfQIxoEb2Fp84y8YCXyMLN/47BQh9IL7bj2dbGbJiV1w/7bNgXywCaX5vfOU4UMyryKDy6oxfn
	3TFdXKltj5mdqlQYb3r/KO8PlIovnMx4QjoSwNFYATpDfI3NJd8AtJ0fxVSSIyg==
X-Gm-Gg: ASbGncsXanbdcarKZ8GhBQZvz6VybwJVkT+i8j5PGukdwv281u68WtcjoEMcfu+Afy+
	1RJITTnhfnSnmDF5Z1CnEnCNot2HUHyrdTu3MQWP0ymVy/TcfQxxdrbxI9jZF36mTxZbtBQfcJL
	2m4G7MqyP5etXSjMtcNIsTrxZLUIjcQ+qW1cRhe/ZMZM335aHDUv92EPaOn1pAn4HEdOOQX4Mxj
	GzvqM82GhImMV1RzLMJqyz+LSFTEziKGLARPY5ZpJPyCUbFr+qKDrRH03d9V1Ypng6wJvYVH5u/
	N4lEEAa4fCvWPKhtC+MqPrlQMLt6SU8NZXNZtNuxTl3DB/XP4PqJ0EGe7X+al4dLj1CHVuQ8NlZ
	BCUI4hXEAfMYh8+gK06c=
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id 6a1803df08f44-70d970980e6mr246817936d6.5.1756402695118;
        Thu, 28 Aug 2025 10:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFolBQi5Yqb+JsBG1B+iQ0UbKTmrqVThPcyhvOhG9tT6SqvRRRfRTx8LsjupRZvAV5rgEeAWg==
X-Received: by 2002:a05:6214:c65:b0:707:4539:5183 with SMTP id 6a1803df08f44-70d970980e6mr246817666d6.5.1756402694644;
        Thu, 28 Aug 2025 10:38:14 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72cbff7sm108739796d6.62.2025.08.28.10.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 10:38:14 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:38:12 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 03/32] clk: at91: sam9x75: switch to parent_hw and
 parent_data
Message-ID: <aLCUBDXzZm8LukL9@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b39fdf4c800103e4fd3fe2ace2c295f635a59d0f.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jul 10, 2025 at 01:06:56PM -0700, Ryan.Wanner@microchip.com wrote:
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

[snip]

> -	[PLL_ID_PLLA_DIV2] = {
> -		{
> -			.n = "plla_div2pmcck",
> -			.p = "plla_fracck",
> -			.l = &plladiv2_divpmc_layout,
> -			/*
> -			 * This may feed critical parts of the system like timers.
> -			 * It should not be disabled.
> -			 */
> -			.f = CLK_IS_CRITICAL | CLK_SET_RATE_GATE,
> -			.c = &plladiv2_characteristics,
> -			.eid = PMC_PLLADIV2,
> -			.t = PLL_TYPE_DIV,
> -		},
> -	},

Should the div2 to div1 rename be mentioned in the commit log?

> @@ -710,32 +738,24 @@ static const struct {
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

Based on Stephen's comment on your earlier series, I think it would be
worthwhile to call out that these __clk_get_hw() calls will be removed
in later patches in this series. I know you do in the next patch.

Everything else in this patch looks good to me.

Brian

