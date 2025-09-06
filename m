Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2562222AF
	for <linux-clk@vger.kernel.org>; Sat,  6 Sep 2025 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757184680; cv=none; b=SP6tMCo5/KB/7s0M6V9mVPMEMNRBBBXQuFzaW5fS4uh1wSabm+MhxXHugUSMR8vv0MUTnWkWGaHlc+7pB5lLmKcaJAUkMOO3iyvahcrv96CkRzzqV4F7UqbxckDuw0r/Cxmu5wo2wrGr2c1JITp5ugGQjm7w/5B+Cv9w5Q684/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757184680; c=relaxed/simple;
	bh=fv+MAOHErE8vjKcYm2tKZRQMaBeZJOGNIDiojhdak5w=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y3WzDWV/xDs2P+TWH3dP892O5vMZ0Mzv2bpP5GQjU3JwLAUP3ngBt9BReVTI7XxySDzlsg3xzPVbqx82+cpqeCte4se3idp0tKOH5aLiIEdrTUalf/rjWyhfSQhricmfHXTMK/xQF/Ni5XJzv053HPmBeyPF4xFfkH+oR1LgZjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=DpNRERvn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="DpNRERvn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3e537dc30c7so1197871f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Sep 2025 11:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1757184677; x=1757789477; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UvCeu/ME5wBtoFyvy/RwWyofR+UUb0XG5d3ODFPfnfw=;
        b=DpNRERvnjB4uKIUqAEldCWioRepbZKQkG6bdds7b1b8Pe9Lz3cZhAMUNyDlnX4KgyV
         Q2KexhjvDLuphGZ6sXYROxL4Wk0WR0y3bO4kppCvZ5ljFEmEbZRSd8ARsdY6ilPW8GyQ
         cVOi3YrVWIeBZHO4/1NvuLmEPE2C2u6YlUuoDq4piNHYdaoGmRjW9XayF2E2CJDr177v
         JvbMbkDIS9PSxRIajZa3hZo6niA+Wm9Fgnn95c9e4/D08Ctk+3FqMTijimUBdo87eUsj
         b26EsFjyagNFzN2snjIhgx3+MUiJZHWP7cjpURsM5KA9cCkKPXgiQWW/sjWaZ2IVkzHH
         yTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757184677; x=1757789477;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvCeu/ME5wBtoFyvy/RwWyofR+UUb0XG5d3ODFPfnfw=;
        b=D3C2Es4YKt6Ptv/W8mu0NnzXbWqSuAO+qoPR8SrWhNTsikCBBAObKPU1dMH6h5lA2f
         gpV5vC0lkC251wowAWz4wnz5iKn6EpAlic4V7TCzYfS1lN8OYjXb+pTSqOYKCYJ0FwFg
         qBKnJUdYsbDnXDRmBj8/diJsooHbqszNZ9Ig0TYC+KINZBMk+CwIu5a22HeIibEvY1XK
         dxCtpkwjopzSaEC3zWIU8u6zVKBSBFk58pM+J0VZUL0s2xxu/qlIZ8+BI9zXEjDYpZIc
         JZx6feg8qVD3bez1rbFkaQ6fznEkfDNgL6g3Gjnms3KZnxpErKak4Nx0WstWtNnEXRSR
         oIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKPHj/k37f/aMYIlD/vAq2+H5YQ8XEQ3p+ywAYR9vWScbJynEsYrteqw9H61t3KvotUFqEK/6lBjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZ9DFe9vpcipIvRzpEneL8oiMKPcX9BGft1QaSxwMlwFnUuF9
	DH3jloma6drCGOiJyoyN27S1pNlXYGc7mAZVd941lWq/hw7bBgsMepoKdFXEXj0RFgA=
X-Gm-Gg: ASbGncvQ7gdLhG1eNX5aet6vTAeZREQG4K/lA2oFuVYzNygG/IztBBlKbZiHgHFk+4z
	NoFQkwsGzYZ57u+m4h8BGnqZymKQW/eBIBo4YF0s1OzP1HlTEr60QC32ZDYLYE6G8OlUXFxgE+B
	0aVtj0IgnNvjcvipcMa4KZ0UD9YnQgAmAQR52SFb/PJUX9gFoWXBP8xyeIf/zheW1iSzdA1GDgv
	z9cf6sUimjwgMX6DhFSMKLdsP4ZpM3afrM3Wy0AAT2gumZf5buSfuqW9Mx/yhZejsaMLX06vvNh
	Ni7N4V2uE/a8r9CCM3RZydoFLvmDE8WZG24WroCCp7FSl0wXn9+dqSZH8YbXEioN1j9d4z6t5LY
	/FFtctCh4Fhj+dhXWZTmM6pOJcaNA5cc=
X-Google-Smtp-Source: AGHT+IEkI1qA1BQ+gKz+PmerbUufnOz1P3kfM2JHr03n1X4s1Su6tIVnS7ROLH5JWvxqm7fR1lny0Q==
X-Received: by 2002:a05:6000:2f87:b0:3d7:df92:5e31 with SMTP id ffacd0b85a97d-3e641e3b09amr2609603f8f.16.1757184676830;
        Sat, 06 Sep 2025 11:51:16 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3d92d51982bsm20303143f8f.21.2025.09.06.11.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Sep 2025 11:51:16 -0700 (PDT)
Message-ID: <506c3f57-d71a-426e-882e-ba3395c7b1b9@tuxon.dev>
Date: Sat, 6 Sep 2025 21:51:14 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v3 25/32] clk: at91: sama5d4: switch to parent_hw and
 parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 robh@kernel.org
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <1b8f27323cb403ffcf6be7fac2def43c4a31bea9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <1b8f27323cb403ffcf6be7fac2def43c4a31bea9.1752176711.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/10/25 23:07, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch SAMA5D4 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/sama5d4.c | 129 +++++++++++++++++++------------------
>   1 file changed, 66 insertions(+), 63 deletions(-)
> 
> diff --git a/drivers/clk/at91/sama5d4.c b/drivers/clk/at91/sama5d4.c
> index 1ff9286148da..a06fea1a7a02 100644
> --- a/drivers/clk/at91/sama5d4.c
> +++ b/drivers/clk/at91/sama5d4.c
> @@ -36,9 +36,9 @@ static const struct clk_pcr_layout sama5d4_pcr_layout = {
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
>   } sama5d4_systemck[] = {
> @@ -46,14 +46,14 @@ static const struct {
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
> @@ -128,25 +128,16 @@ static const struct {
>   
>   static void __init sama5d4_pmc_setup(struct device_node *np)
>   {
> +	const char *slow_clk_name = "slowck", *main_xtal_name = "main_xtal";
> +	struct clk_hw *main_rc_hw, *main_osc_hw, *mainck_hw;
> +	u8 slow_clk_index = 0, main_xtal_index = 1;
> +	struct clk_hw *smdck_hw, *usbck_hw, *hw;
>   	struct clk_range range = CLK_RANGE(0, 0);
> -	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];
>   	struct pmc_data *sama5d4_pmc;
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

Same here
