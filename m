Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B09720C038
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184518; cv=none; b=PMm/OLIz26HQ+liXNS7h1c5Qwh36acJpmOfpimnU+YFqUPUQYTCrrqVcGnPP4ZUHOC38Tc5g6aaML9ybLsW1Wxm5Xb+eVrXuUepcUYbQ0FTE80Rt1WVDIogeNkHZhTnPL6XLrwNn2aNDV/gP+nDBY4suqZl2RFBaj3ZUI8xs2is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184518; c=relaxed/simple;
	bh=Wlm2TUGUQHR65VwbYHEx8NwbIjb7dZT7CtLfA+JhaO8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=IVOcgD9Q8JhsupdXIy4X+l4OkzJuJuXdvrfXSsaapzZQ6N45bOiVN2qkgfeAXToHIj6zeOI1kv3WKWRMGW8Vdi1WlFIgM0YXx8BCRp88OEEb+mEnNMqTpF0zrqDSFROk/0zWs0Oos7dfqUcrZQBVdlG4AaR7a9fUMJQnYYMz32E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=M0nNHLPB; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="M0nNHLPB"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso16125865e9.2
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184515; x=1757789315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ItxyGgS7E2CVkqaAgZtR5mA+Tn6EFqfbGhszvfBwvE=;
        b=M0nNHLPBDKy5rslNhWdY7ImrW6DzoKx99WWInzC0mMfwd8roehhOFm4RSelYTPlZuS
         3WU81BTkk9+k5dx3zJ1t9DmmpU9j6cu7Wp3PbEl1ZhKChEfSL2tSE118Nqa61HAywPny
         9aJE6g4QFqAcqP0GpaJJMCj+nOR/QSeqgJz1wA5HlKTuwDYbomy8vf7q7o2nDzmiC4t5
         +ZRum897S1pYgxpoTP8KTf/JvVaYJFx0KfHm9zEmxBkpf9yRybLXQELR+0HTvgU8RdQs
         IZDTRFone5TeVNt1kpYenVEQT3behAsnaYunRapsD3Pe0+MWn93+ydqPrZ6KlXR8neLl
         rTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184515; x=1757789315;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ItxyGgS7E2CVkqaAgZtR5mA+Tn6EFqfbGhszvfBwvE=;
        b=KkYTk+hrxBFQzWMXjJScA1xeQHj5OPFgbU+SfFBbt5+D0VvCbyPcAWhKvi/A0zHgWl
         1tFuTTszSorxQ2s6wfVRHQ+liPMXTlZ8Na5y8dVU0WN+4bSjpClLQxVrQvN3Nlpjfgln
         0suOwYPqkghG3HgUF2AAg15WA3PbWy8851UiWAaFeQ7EweXZ6HEo2+jgYIyEMOkHx5u0
         uJJcaL9EWuKYa9Mk0e+I05lET82QgX8/aO5Ce+M52XA6zKNRK0onPQLa/zi8mh2ITU0u
         EGHoWUuBbATlrxITg1jLgpFCJYRupfIXb6xNCKHW1dQAoFWM1wHSBEnxh24FEY4o+JLS
         csMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiHPx3K+eQFkZcIaYcfkSDNSgUJiZzhOVp0L9vclUtSzOpKILoyRPqi67aMl4zMGS1JpU8oR59Kd8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy+G4MF0uZkeoIfbyWhYOKaQvi+Lg5QOdgJBA93Ylessd+Qar+
	ZfEo7AURl5ulSNOCozPHSwocmeUXpDWchXOl3zMVNkqKD0PWH2MAISVvFFiBsIEN6og=
X-Gm-Gg: ASbGncvq5/ovPQPZJXZrtTgh30Qmged8UqBOZkxwRShQZuoGQquXl1PphJV7dQWtMGi
	YfByAQhEeVUmqxHQT2mZxMwi5VIuBuN7qPKshs295sszfUJX3VI18RbZtxwL5woSshkT1PMuRSk
	/NofXsR7Dct4ApyZ583DwSRbZw9RpDNWN0EzHXMXUzHE0NMjaU9wjbhQU59tHF/Olljy1XFqQYK
	INM065VIjT4PAkZ72NvBcVGdSBee5JRKg72tbsQaPhgEQQL6UwyrIdcyWX2/zReSHATy1MaMEj2
	FW/8d/BnUVIEjCB57PK0eZEHwkTw3TkP4w0gNpxh/WQFBKvHBYgdN1rgOV2fe32Qa220T9iQqkz
	1DUtXr4vNDIOnIrsrFwxJHIqjyDfGjjJ8Nl3W+IR6sg==
X-Google-Smtp-Source: AGHT+IHTpgtyModfxsIQAemnthqZ9Byeaws22gLsiNTaGF/G3vxl6nHs3mKSEO1Ko1X3b2mJaMKTSQ==
X-Received: by 2002:a05:600c:4ed1:b0:459:db71:74d7 with SMTP id 5b1f17b1804b1-45ddded6d45mr22663215e9.27.1757184515506;
        Sat, 06 Sep 2025 11:48:35 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd4affb6bsm95138195e9.1.2025.09.06.11.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:48:35 -0700 (PDT)
Message-ID: <7ea4f72d-ac4a-4f8c-80db-ac439f04f21d@tuxon.dev>
Date: Sat, 6 Sep 2025 21:48:33 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 23/32] clk: at91: sama5d2: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <e245b72936832627469e74a694af1d1cb65a40ab.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <e245b72936832627469e74a694af1d1cb65a40ab.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D2 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: Adjust commit message.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d2.c | 168 +++++++++++++++++++------------------
>   1 file changed, 86 insertions(+), 82 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d2.c b/drivers/clk/at91/sama5d2.c
> index f5d6c7a96cf2..538ffb8deedb 100644
> --- a/drivers/clk/at91/sama5d2.c
> +++ b/drivers/clk/at91/sama5d2.c
> @@ -37,9 +37,9 @@ static const struct clk_pcr_layout sama5d2_pcr_layout = {
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
>   } sama5d2_systemck[] = {
> @@ -47,14 +47,14 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> -	{ .n = "pck2",  .p = "prog2",        .id = 10 },
> -	{ .n = "iscck", .p = "masterck_div", .id = 18 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
> +	{ .n = "pck2",  .id = 10 },
> +	{ .n = "iscck", .id = 18 },
>   };
>   
>   static const struct {
> @@ -164,25 +164,15 @@ static const struct clk_programmable_layout sama5d2_programmable_layout = {
>   
>   static void __init sama5d2_pmc_setup(struct device_node *np)
>   {
> +	struct clk_hw *hw, *audio_fracck_hw, *usbck_hw, *main_rc_hw, *main_osc_hw;
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *slck_name, *mainxtal_name;
> -	struct pmc_data *sama5d2_pmc;
> -	const char *parent_names[6];
> +	struct clk_parent_data parent_data[6];
>   	struct regmap *regmap, *regmap_sfr;
> -	struct clk_hw *hw;
> -	int i;
> +	struct pmc_data *sama5d2_pmc;
>   	bool bypass;

Please keep these starting here:

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

ending here, and use the retrieved names with AT91_CLK_PD_NAME()

