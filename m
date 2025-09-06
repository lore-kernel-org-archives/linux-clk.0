Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B495253F12
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184597; cv=none; b=bc3xWIrdfF8+8FYEVf6jDqUVK6GfyDXBsjpehclFjGLYO5qMp1iWMqW0z1yXR6rv5GwF3F4CCcSmgxEw7mxPrTZp/0SAoIJFnNT7nBx/MMO/1eYEK4ZPPM2MPT0MPsH/WHLy1OR3gCAAYygnNbu5W4wCLY/spE+toVMD4tWXMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184597; c=relaxed/simple;
	bh=ags8ApmD1oguZ7lNJsYYUASpAjmjVWGGaS/SCa7S8QY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=qFtnYED4u99CWGrANbKN1Q/GHT51mM7422EsgR3+4Nejc/qgK5QgNkYa27a3HW6jCMw+94NSkoXZs0Sb04Ei5WEMGUAlANfXU9olJHoN/9a1P5mRoL/uVW/uu1BOG2A+89EY5/v9B57gwlrnkqsrnV3oPzt06U1Chu81i1mPdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=e2HEwgp3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="e2HEwgp3"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45b9c35bc0aso27547855e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184594; x=1757789394; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T1duALMFYguAwGoCUAj68KdsYk8MNW56WucSUt18X7Q=;
        b=e2HEwgp3Jr/4BqWo6nwSa1gnsy4wakiLpLRd8giOEc3yQ0lzD/idE/IeN8vRn8K/Ym
         erw/p8QfRIAOhnOAzD100rEQ7Gp+nwaUZlvE1suTuJ0WUFaKhcocR7vMPVDuMecxMuPD
         UNNVUFxPJIH82wPT6UK0BjC9U7OMbTMeVt+57HY4gYorfw6Cx5UIgLF1J6DLgClvoaJ8
         krG/KS2yyGnWbbrXhJ/hJlD6lEo9TI7Z6DDNrGOgaclDZdDEKqpQIX9EaGMXdA3k0P6z
         a5EOm3VJfaeb9/yhhLOicBAezPDRPR2+JROtg/BOto8SvRXlVJUK6ghUwdwtX1ozzk3o
         iVXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184594; x=1757789394;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1duALMFYguAwGoCUAj68KdsYk8MNW56WucSUt18X7Q=;
        b=v3zDACZPATUaeP1bR4Gnei9aROm1ZP37LiuLYL1W9k2LSExdVByM93X5bQemIFyOJh
         Jg0Gbd+0dkpRHXnSTbQoL+4miYahIxr067AY/2sfE/eAUIZb02CoYJm2GI9PBk7jzqAM
         13npUL3b04icUJ4RlC8VBKaq3do8eaWGC+Q3Uf+8T8gv4arnTf+H1BubWkzSJGLr21gO
         +qu1jGevrm29RAzYVZfEmbQbCEKIxydozPkco5INwp+GMHxCbxoQ+luz3niEzjRIKz9t
         INDO9bpmqVLS8+5m4/BMBmHrJvtg8D0FzITrGzRnNlk0rUTR68mKgZTASUdqjE5rOqVw
         vjGA==
X-Forwarded-Encrypted: i=1; AJvYcCXjicf4I1UbC21yrg0KYqOwr/pfMA+Ud5YvvTlgIvVTHzGLuxB7N7B6nh1eDcXdLaTCXWmcgmvCyPw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMv3xV6Wlf5dVxwH+zawgRqpGAZnNWYm380MplguTSSFTQs7y+
	SoeukfS1chrPmJRdRvz16hfsGipRWyQWx65U3t9txc0qihKIGXNTObrbp1hn3Udv9lE=
X-Gm-Gg: ASbGncvszqgq1yDGRZKJPUMxAUC1JZ9NbUNSra//7P4UVYpVA9JjSvyupXV4LKzenOV
	iaM1I4bV+FWZ5AOpe2XVwaOOuSDfj8smPhMDkmve4AT2EaeYGv3pmNLbsOuedUep4PtNWADGFsm
	gZzfums9nGkB2U5J8n/WPy5PWtq/61Tk1zSqX+BWcSiLae+cYZgsgpXwtbiIG5gXWreRUfuAWNz
	i092WOoDIVLUjogo8lJ1StzmBH5ygzbh92wCmqXiSUW9wEjtaZq2zp+T2ioFUqK8UXHNPTFyz1Z
	vYyNCZoq10lrbyORAHVcah9ecFuONKT7nX/wgNjGKXH6Nz2F3X/Fo2WFFhmivntG4CMd/fkmogV
	tv2yAJMJipxnhlQ6d1hiduvT2I2OdJys=
X-Google-Smtp-Source: AGHT+IHZFDMtmYlvXENzg7IersllDvAME69Aa+eYY71GR9KeI6KFHf2HfcJV0/Y9VxN/J7hUF8lrdg==
X-Received: by 2002:a05:600c:1d16:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-45ddde89897mr29808885e9.3.1757184593820;
        Sat, 06 Sep 2025 11:49:53 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d690f2ebb9sm25918131f8f.20.2025.09.06.11.49.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:49:53 -0700 (PDT)
Message-ID: <30806f24-b038-4785-8787-25229541136b@tuxon.dev>
Date: Sat, 6 Sep 2025 21:49:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 24/32] clk: at91: sama5d3: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <8b9b4447d93f048bc95ab083c9fbe1d5ccd8acd1.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <8b9b4447d93f048bc95ab083c9fbe1d5ccd8acd1.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D3 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d3.c | 122 +++++++++++++++++++------------------
>   1 file changed, 63 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d3.c b/drivers/clk/at91/sama5d3.c
> index 8326bb6a291c..e5b061783b09 100644
> --- a/drivers/clk/at91/sama5d3.c
> +++ b/drivers/clk/at91/sama5d3.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d3_pcr_layout = {
>   	.div_mask = GENMASK(17, 16),
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } sama5d3_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "smdck", .p = "smdclk",       .id = 4 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "smdck", .id = 4 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
>   };
>   
>   static const struct {
> @@ -114,24 +114,15 @@ static const struct {
>   
>   static void __init sama5d3_pmc_setup(struct device_node *np)
>   {
> -	const char *slck_name, *mainxtal_name;
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
> +	struct clk_hw *smdck_hw, *usbck_hw, *hw;
> +	struct clk_parent_data parent_data[5];
>   	struct pmc_data *sama5d3_pmc;
> -	const char *parent_names[5];
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
> -	int i;
>   	bool bypass;
> -
> -	i = of_property_match_string(np, "clock-names", "slow_clk");
> -	if (i < 0)
> -		return;
> -
> -	slck_name = of_clk_get_parent_name(np, i);
> -
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> -		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);

Same here. Keep the name retrieval method and use it with AT91_CLK_PD_NAME()

Thank you,
Claudiu
