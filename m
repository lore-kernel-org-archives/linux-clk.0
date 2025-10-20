Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A32D7DE8
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760987648; cv=none; b=nRxkLuxnDkDrWhkGLojFpgyKJy9C3Y3d19WiaCQ9j4ni2JdPdS/hfJr/Pm9l7PcXMf46txHAY28gfVx8ZUu4FBAfazItPwMpdeMUMBqUmMAMnyFO2zymm8ga2RE9BTtGGYPGwUrmpk8Hbh1tcAmBs8l6ZxNlHV/5j0zAEBHLSCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760987648; c=relaxed/simple;
	bh=m+tVu+83RvXRHDE4L736NwxubnHnEhTnYwFshq2Ypjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nTzV+UckOI4AJNb+Jh2MpHKHaneLqVEPatlT+30uf10TzO4WaIb5PKoZnRxlO1LUv0J9Tnpi9BpermHvFw7uEu2owzVvlE7cXT3je9q7nkyf6uq6a9pzOpZMWTQHAR9ikAgPOf3eyQObgiqG/tcSE4sdfFdpx2COsmJIc+w9nTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QnxFvG+i; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QnxFvG+i"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b403bb7843eso876309566b.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760987644; x=1761592444; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=394T93MvlNTwJ4OmrNSHdthp7AqCvywv9bIug30d09M=;
        b=QnxFvG+ijsY10To98gWmFOor6sCFbSubLuaqYQ/uI2DUD44ck4d6ZWiaSpiFP7gdxC
         EtnPzvUQe5xTFls4R8grqgtcrQn/HdBc2XqJf4x1BAPnGAndx2UguBpOdf1iSeyjaRPw
         wQl8SNLHeYUqmSOrF/O68J19HFQDu4Uw+75p7o1uvKwmdkrvKR+DH6RyB5i1qG/r6uNA
         PxXs2AZrrHfZVgMUsAoij1i4BmMVLNL7Og3VEvNWNN4OC9RRxkeqsEyAxh78yF30o/WC
         OIHPq8HaVDz/XiO8WPMnzGCdRpYgq7diswWt6hnCFfB/sLav4XtO/q0iW07B8HNLqY05
         QEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760987644; x=1761592444;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=394T93MvlNTwJ4OmrNSHdthp7AqCvywv9bIug30d09M=;
        b=NhJKNicBZlTeLt48AFtoaNZMRdsXBR1xNhFaA1ncF/SwuxiWYqX39wDTQYqFdrXFF5
         YUwYM/ADlyuIKyiJsycUJ6zn6vVLYBq7hycJlfO6eo4AyFabZalTads//Tq5dpR4GivA
         ezwxnBnVa+JR/Z/Fm1Z36o3iw18/Bekv/DcEuwA4P/r8rcwcOA4Kl+AhBkmS5Ly9pNaC
         1pdJeIQnjYsh2OIqSaAQTKVIGaWP5wIZW/SFXv2FTAK+d2QDp6XQTeNdhtmg9wJzEonB
         E9eUjMPq7g81tVjwZjUmN5KF2Ubb20bvDHz8m5LkfbX/fnwM6N+AFFITjMZWHWgHKVlo
         O/Ug==
X-Gm-Message-State: AOJu0YwdNuak5u+cOG9ekpa4pRfls7DxO9r1V0iXoOpD89ZawsVAyo+u
	93PC5r9NkKvfWaViBwpqvAy1Gh8fKQDk+NvIp4i8KsTfiNAtMyImrmXC+Q+j9uc2Mjs=
X-Gm-Gg: ASbGnctvjZ0gbH6mo5X0uENB5iUgWXegIvbzKm7ZvyywYdHyQudH4kKkO1QvA+FvKOU
	DK7FNR/ao4k4r+pSrCGOimdRE2PDza3UT7p3ltSc7Eu3H+NCsI9ryERM/SEuZEiNEnrr1xFYaNC
	3vznAykd+rkS8LCPNcbf1SYAzzqnFU6PMwEMb9uTz3ZS/XbtQfm1pkVsEevqNX7qb8kjNgKwsUd
	R3GFe3+q+X00MBSXE+xereLtyHOt/aF1ea7ddkuCkOOzzOblet6tuK5cjaexifRLApOmiXm8uGH
	UYyw78oaNy92bBQNeJzm51fPDYaMiLML8zHWkpYvhpE+6Fl0faHJVfWeou0Te0COq9F3LR70rAW
	13eRyD9Y9R9GbVZw1VmOzBJghTMxsG8tjhh6Fi6i0YJ7BbEkXyc1mQd5uWELwevmjPAaESwFXE2
	bZJEMv4t3t
X-Google-Smtp-Source: AGHT+IGwCJgZYKC8FZLAT4kOm6dkEpwAC47hppBn//mgpxVSX8jW4DahXg//7RoX6AQwA7IGTbpD8Q==
X-Received: by 2002:a17:907:7ba8:b0:b41:297c:f7bb with SMTP id a640c23a62f3a-b647245844fmr1618450466b.26.1760987644536;
        Mon, 20 Oct 2025 12:14:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb525d1asm866441566b.58.2025.10.20.12.14.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:14:04 -0700 (PDT)
Message-ID: <88a560cc-4176-4674-b2c3-009af68f5bf0@tuxon.dev>
Date: Mon, 20 Oct 2025 22:14:02 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 13/31] clk: at91: sama7d65: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <cd47c45215f4c6a38447151222094616850a9d0d.1758226719.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <cd47c45215f4c6a38447151222094616850a9d0d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

In title: s/switch/switch system clocks"

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Switch the system clocks to use parent_hw and parent_data. Having this
> allows the driver to conform to the new clk-system API.
> 
> The parent registration is after the USBCK registration due to one of
> the system clocks being dependent on USBCK.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/sama7d65.c | 36 +++++++++++++++++++++++-------------
>  1 file changed, 23 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama7d65.c b/drivers/clk/at91/sama7d65.c
> index 986e8ef57dea..38c44b5d5d42 100644
> --- a/drivers/clk/at91/sama7d65.c
> +++ b/drivers/clk/at91/sama7d65.c
> @@ -537,23 +537,23 @@ static struct {
>  /*
>   * System clock description
>   * @n:	clock name
> - * @p:	clock parent name
> + * @p:	clock parent hw
>   * @id: clock id
>   */
> -static const struct {
> +static struct {
>  	const char *n;
> -	const char *p;
> +	struct clk_hw *parent_hw;
>  	u8 id;
>  } sama7d65_systemck[] = {
> -	{ .n = "uhpck",		.p = "usbck", .id = 6 },
> -	{ .n = "pck0",		.p = "prog0", .id = 8, },
> -	{ .n = "pck1",		.p = "prog1", .id = 9, },
> -	{ .n = "pck2",		.p = "prog2", .id = 10, },
> -	{ .n = "pck3",		.p = "prog3", .id = 11, },
> -	{ .n = "pck4",		.p = "prog4", .id = 12, },
> -	{ .n = "pck5",		.p = "prog5", .id = 13, },
> -	{ .n = "pck6",		.p = "prog6", .id = 14, },
> -	{ .n = "pck7",		.p = "prog7", .id = 15, },
> +	{ .n = "uhpck",		.id = 6 },
> +	{ .n = "pck0",		.id = 8, },
> +	{ .n = "pck1",		.id = 9, },
> +	{ .n = "pck2",		.id = 10, },
> +	{ .n = "pck3",		.id = 11, },
> +	{ .n = "pck4",		.id = 12, },
> +	{ .n = "pck5",		.id = 13, },
> +	{ .n = "pck6",		.id = 14, },
> +	{ .n = "pck7",		.id = 15, },
>  };
>  
>  /* Mux table for programmable clocks. */
> @@ -1299,9 +1299,19 @@ static void __init sama7d65_pmc_setup(struct device_node *np)
>  		sama7d65_pmc->pchws[i] = hw;
>  	}
>  
> +	/* Set systemck parent hws. */
> +	sama7d65_systemck[0].parent_hw = usbck_hw;
> +	sama7d65_systemck[1].parent_hw = sama7d65_pmc->pchws[0];
> +	sama7d65_systemck[2].parent_hw = sama7d65_pmc->pchws[1];
> +	sama7d65_systemck[3].parent_hw = sama7d65_pmc->pchws[2];
> +	sama7d65_systemck[4].parent_hw = sama7d65_pmc->pchws[3];
> +	sama7d65_systemck[5].parent_hw = sama7d65_pmc->pchws[4];
> +	sama7d65_systemck[6].parent_hw = sama7d65_pmc->pchws[5];
> +	sama7d65_systemck[7].parent_hw = sama7d65_pmc->pchws[6];
> +	sama7d65_systemck[8].parent_hw = sama7d65_pmc->pchws[7];
>  	for (i = 0; i < ARRAY_SIZE(sama7d65_systemck); i++) {
>  		hw = at91_clk_register_system(regmap, sama7d65_systemck[i].n,
> -					      sama7d65_systemck[i].p, NULL,
> +					      NULL, &AT91_CLK_PD_HW(sama7d65_systemck[i].parent_hw),
>  					      sama7d65_systemck[i].id, 0);

Just saying: we could have been used parent_hw only for system clocks (and
some other clocks updated in this series) if we wouldn't have the dt-compat.c.

>  		if (IS_ERR(hw))
>  			goto err_free;

