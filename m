Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7F3594A
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184415; cv=none; b=CPC7p+1fsPltsFK3sub0vZqjzaD51QXisHJ5q+9zxGen4TZxQQdz4Pb227aw9WE/B6aUtlhjF55d+QCZqbLgvzLnSedzkIJYv8xPyzRdfQTYqbxS5WVUfGDEFD/79CYwqmg36rBxjFmukWxDbrDTfcDzj1k6fwPbXVgrWKXhfn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184415; c=relaxed/simple;
	bh=0AuUmYDGUgWr6NLQHAXspt1nlUrnwqxucWAtvtA4Wi4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=u369Yyg9Sp4kOpCuP0V2oVIsLkB4r4HmMlcymehLGUCTlyVQTkN02iBxWKqejIs5x0QUs7lrpLB0xkxrm7m5E8mRbU1+rybN1vXA5t+gtq/i3SSKmZVtx62lZ6nr8BjN8pih13/7ooDVpUc8paz2mrE83LZUPlOu+luP6EiWYpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ZqWQuqRk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ZqWQuqRk"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45de221da9cso888165e9.0
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184412; x=1757789212; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iXIBvGz2QRYZ2c6J6+fuJIBALqm9W64iJQz3FvyRluM=;
        b=ZqWQuqRkKpxRazFqonBdLMgsNt/Br9wtPuEPo9UY+uy1sKx/UVbYhu8mtdWA8nq8vQ
         jWRhnL1BVXgsAEc3+13nlaFESKz4eNi+yxG8W/KQw+dgJ0VHS/vlLD8xoBdQKV2P+748
         8na+T6SiB7NwjLFBw+uqpXE/Dhpi6v2eKBZ3JnHLXdtVqLdlXxxhDTB5JOImAaDv/i9B
         jwUCHVh7HmijfCjx+vRhRe7XtArQWvHD743CwRgCB/Ax/ek962Krl2RlTVEo2L/0Zs0u
         4Bi8QLuY/oC+8QBjJSL5755glRCgfy/0SzKf3BDdTxzAr4gm264O1W8812b7Y15jww9l
         OFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184412; x=1757789212;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iXIBvGz2QRYZ2c6J6+fuJIBALqm9W64iJQz3FvyRluM=;
        b=Cs0HKseApA6rSt21anZzT4i/ZvmaaBU3Ncx3rnnQqr5hRYCOgRMvPEWjaRxL1Z8qoQ
         XQ7I4Kf3fgfwDmoZ+QOImg5pzXLwRkzAnQpRu5PQrRxvy5IwxZrE/tG7FMZSNkt0dZ76
         cxBRjo2pQFyF7seiNK41qx/Ffv7rBSfIzhw3p8eg9KoTwqE3B1EyefXCq00mFU3IAi/F
         0hjR55RHOTSb5OT088dqVpW+aKC0wXiQvX03XuI9jNKIzlRI4aVTmOP8N7rb60bIObL4
         dMxlukMtj10VKzHcMwU5HS+WwRJDugzhTI2i/e4Pm0KKuUDyLmjhU8wbOFthEJF2Ypre
         qRWw==
X-Forwarded-Encrypted: i=1; AJvYcCUSoGVyYiR2ZIwTKnbXYY0ZQnZOpIkP8o3ab+xVRVGEmgNGyMzyCpvb8OHTZbVybfn5JNaAwsU1Ix0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BL6ygB0TTiOUfnZTtXcvaAsJX5Foxpm2sWotu+Xgqu2dIr8B
	jgdSHgd/IUT8oQEDSUhqbOBFlDeeDVMdWO77QldES8hyRBNHbs1/9sx5/U6l1kQF7DE=
X-Gm-Gg: ASbGncvdvrTwiFJjv7gwzo8wwxpwHdFCb1MYZfu/QgzEOKVOmlTZQJMitOZ0r9McREm
	vY18EyjUQgXP+CWERCcDipRnn06dWbs/Lmka9TUCd+R/TDaDa1ZLcOMDoc3K0S3o3jV/nFKW8KM
	SsO0oopiQ7S9V0+Ed9+cW2w2IJmznCIo6eLMJcBBEizfzjFfuaVrNQx/qFQ4BIbMfzAAaAS03kp
	FZ9qlUpmCvuzK2jD1RhrJ8yztmaFy9qQIen4SPGAQ3NDb6vU+91ojj1MfWYc/M2fbRNk9Z0Wraa
	VwuxII3YvrO4Px3Em08ZCIwbuz31Zo3BS/M4JXpz95U1tXkmYtZV7TDXuVj0vyqi92wvOIIDazC
	UtK/+P9Tk5cCnoEH6Ok0lMt30z3jrm4A=
X-Google-Smtp-Source: AGHT+IELO4WCYtXnWgGHZ+m3e/fCm3/0gRjeizrA1xDQ2eHBYPWbZicD4ZFELLra/Cwi94VouYjN2Q==
X-Received: by 2002:a05:600c:8b22:b0:458:be62:dcd3 with SMTP id 5b1f17b1804b1-45dddec82fdmr28142265e9.17.1757184411619;
        Sat, 06 Sep 2025 11:46:51 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b98e77231sm202054845e9.12.2025.09.06.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:46:51 -0700 (PDT)
Message-ID: <4754b656-6168-417e-8fc8-450d1b0a3293@tuxon.dev>
Date: Sat, 6 Sep 2025 21:46:49 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 22/32] clk: at91: sam9x60: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <7f90312300d24617c51f63aa0a1c7bbb4a0212cc.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <7f90312300d24617c51f63aa0a1c7bbb4a0212cc.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAM9X60 clocks to use modern parent_hw and parent_data.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sam9x60.c | 109 +++++++++++++++++--------------------
>   1 file changed, 51 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/clk/at91/sam9x60.c b/drivers/clk/at91/sam9x60.c
> index eb38da77d69a..b2e86e600a9f 100644
> --- a/drivers/clk/at91/sam9x60.c
> +++ b/drivers/clk/at91/sam9x60.c
> @@ -79,9 +79,9 @@ static const struct clk_pcr_layout sam9x60_pcr_layout = {
>   	.pid_mask = GENMASK(6, 0),
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } sam9x60_systemck[] = {
> @@ -89,11 +89,11 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck",  .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "uhpck",  .p = "usbck",    .id = 6 },
> -	{ .n = "pck0",   .p = "prog0",    .id = 8 },
> -	{ .n = "pck1",   .p = "prog1",    .id = 9 },
> -	{ .n = "qspick", .p = "masterck_div", .id = 19 },
> +	{ .n = "ddrck",  .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "uhpck",  .id = 6 },
> +	{ .n = "pck0",   .id = 8 },
> +	{ .n = "pck1",   .id = 9 },
> +	{ .n = "qspick", .id = 19 },
>   };
>   
>   static const struct {
> @@ -184,32 +184,17 @@ static const struct {
>   
>   static void __init sam9x60_pmc_setup(struct device_node *np)
>   {
> +	const char *td_slck_name = "td_slck", *md_slck_name = "md_slck";
> +	u8 td_slck_index = 0, md_slck_index = 1, main_xtal_index = 2;
> +	struct clk_hw *hw, *main_rc_hw, *main_osc_hw;
> +	const char *main_xtal_name = "main_xtal";
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *td_slck_name, *md_slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[6];
>   	struct pmc_data *sam9x60_pmc;
> -	const char *parent_names[6];
> -	struct clk_hw *main_osc_hw;
> +	struct clk_hw *usbck_hw;
>   	struct regmap *regmap;
> -	struct clk_hw *hw;
>   	int i;
>   

Please keep this starting here:

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
> -
> -	i = of_property_match_string(np, "clock-names", "main_xtal");
> -	if (i < 0)
> -		return;
> -	mainxtal_name = of_clk_get_parent_name(np, i);
> -

ending here and use the retrieved name with AT91_CLK_PD_NAME()

