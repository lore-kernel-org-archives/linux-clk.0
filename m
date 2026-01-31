Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F62257855
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 14:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769869367; cv=none; b=tpXcXIiuKBlnuHOspqz5GziuSx00bySvVwg1P9SLNBO54Fp8fMPgzjxwmK+ASggD1zV8ef8w1DMIE+jVVL58PM5tsf48RW4uA1IOP5mA1lUf142vkue+5/GT/O66uO51OJgdWxCm54prxdlVMJvfswueGRPuvH+tSquZkDMkpNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769869367; c=relaxed/simple;
	bh=8UieifHjR5GoUX5KqC5JYb+rjM2O1hIp8uQ3hGgXJUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TpjeMDxn/ud7t1XEOZ/X7Xo4hKb1l3E1NcqwPYhg2Nc4Y8U/X8UsPKtSrvEU0TEXGUzV1f8LHqHG321DZSMeswvxlSCOT7H17D1Y3v7duDZJoKENT+8VtoR/YZvPVATtqxx/nwuQ7Cry15Q36JL5n0pwUOGycn6bxnfj9spoboM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=bDvLBWWx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="bDvLBWWx"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee07570deso25347465e9.1
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 06:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769869364; x=1770474164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U3CZzSVVx2dpM9MGCKEwNRkXh7AjWOcopY5v7H1v3xg=;
        b=bDvLBWWxqxcnNXFWIOefohCStMbC8zNenBHx4DTWSdlAC7+OwY4ZcIh+gDbH545J1G
         McnRmHpzevdDd+qIHHSjwLaiTzp6bfkMiqHmK03J9XNnpZY+8ARqGX5V/6c8WYXVoMPw
         28V76o3/boIS/cYotyrQaaVZH3EfLLD7OrS4VIp6PEJAqAmRxocmv+jITOgBZGuS5sxJ
         oo5Mwc8gMwP9l65TaZEEoe63q1S1uttELZqtWE/WZ6zl/5M/xvkbdxKVnj0Qsta24ZBY
         jysCnNfwgCXbEoMrcltX26sIPdJjz31DKXEEeDAhZerN+YSOGygYDJQyFbcC3m3wUq4y
         lhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769869364; x=1770474164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3CZzSVVx2dpM9MGCKEwNRkXh7AjWOcopY5v7H1v3xg=;
        b=Z3HnYnD/175n1z2CckzagF9a2jizBOA5w4U5KMKYESS2TDRIafixGoHCfpEEXdZlpg
         GiMyxMCR7GI4mMcsY0Rbr3JkzXTUlGC6Yj35OxsbLA4KByoQnpkm7fzNMJ18iRr5Q+Ik
         VEYpyngBUmn6AD0FfW/8c4nYt6HZfpy+E5Gi6a/E24p0wpVqDCCj3xNdEiGtk/0XazDE
         I7+6385q1pOTA9NdR5QAWUdCzwecOwPk3Gd28tAFjjipRaSJZ0VzGNEIjdKmJXTsdSL5
         +tbbFyehKxo+IrgfXJs6kqpyz4JiJZdgPE1TQTJDKzii9qn8Y2j7nREa0Omo6MSGj7Nr
         XrMA==
X-Forwarded-Encrypted: i=1; AJvYcCXKe2w4k1TJoeFo7MCfVg80RFTeHAVmjkHSVbX2p/U0pYwH/HfPmKrQJSb73DWpU6JmrmLIU9Spj3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwskXe02bRdH5dqN2Coj/OdXyqNqmmtJrFGxD/ZsI9wCpJvnwP3
	ecu++5O0c1ZIC+Zu9GZu2XL+Qj5N9D/As/sr8xUWe06b2N0jIk1s5ORTACAkG0AaWY4=
X-Gm-Gg: AZuq6aK/AeP4OcN78W0aAcFEfqEkNqOJ9KuHvTL12zBSgFQJmWH2uGXeTRVFTTV0NKP
	ijb/6TtL3Jq/HJ3A2rLGEXoPsHXism3y8XIZfOuuM/NO7NtYX7taK+WoukKUcSE/IkGKajoOAbv
	AzAGDwoqfpA2SLCacomfs16yE6BtJlcLdXVSb+db/ZWEXY756xcVXqKG03hcZOKuhowQuUNqlnB
	gH3s21HGN2NXACKKIBTlHuG0mFnnh4E+uvE46w6Lntdevxfh48W+WmIe8PQ4T2vf8AD/v+OL88b
	hYnVHE743ERaidWC0+yoL+d9hxdVipr0uTvm6UhRwOqHx0A09WmIolnHv4wsOTf86HtMhoNhAV2
	yZf18Ict4dj5GDZ/8D9niS79ndVSvzxWVi6Eu7qKu0aDhhYkUwP+PWfiHoC0vr6JUiGGpE+RKBH
	Ir6oD9Orw6yR3o/m4MtA==
X-Received: by 2002:a05:600c:1f92:b0:47a:8088:439c with SMTP id 5b1f17b1804b1-482db4a873emr86851925e9.35.1769869364039;
        Sat, 31 Jan 2026 06:22:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3c6sm261644645e9.10.2026.01.31.06.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 06:22:43 -0800 (PST)
Message-ID: <7f5838af-b8f0-44ca-ba9d-378a8aeee934@tuxon.dev>
Date: Sat, 31 Jan 2026 16:22:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/31] clk: at91: at91sam9n12: switch to parent_hw and
 parent_data
To: ryan.wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 bmasney@redhat.com, alexander.sverdlin@gmail.com,
 varshini.rajendran@microchip.com
Cc: cristian.birsan@microchip.com, balamanikandan.gunasundar@microchip.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1768512290.git.ryan.wanner@microchip.com>
 <d4125677564e1deab066f88fb12137069d1f4a6d.1768512290.git.ryan.wanner@microchip.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d4125677564e1deab066f88fb12137069d1f4a6d.1768512290.git.ryan.wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Same here for the patch title.

On 1/16/26 22:07, ryan.wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Switch AT91SAM9N12 clocks to use parent_hw and parent_data. Having
> parent_hw instead of parent names improves to clock registration
> speed and re-parenting.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>   drivers/clk/at91/at91sam9n12.c | 90 +++++++++++++++++++---------------
>   1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/clk/at91/at91sam9n12.c b/drivers/clk/at91/at91sam9n12.c
> index 34dd7645f964..87c28d34f98d 100644
> --- a/drivers/clk/at91/at91sam9n12.c
> +++ b/drivers/clk/at91/at91sam9n12.c
> @@ -51,9 +51,9 @@ static const struct clk_pll_characteristics pllb_characteristics = {
>   	.out = pllb_out,
>   };
>   
> -static const struct {
> +static struct {
>   	char *n;
> -	char *p;
> +	struct clk_hw *parent_hw;
>   	unsigned long flags;
>   	u8 id;
>   } at91sam9n12_systemck[] = {
> @@ -61,12 +61,12 @@ static const struct {
>   	 * ddrck feeds DDR controller and is enabled by bootloader thus we need
>   	 * to keep it enabled in case there is no Linux consumer for it.
>   	 */
> -	{ .n = "ddrck", .p = "masterck_div", .id = 2, .flags = CLK_IS_CRITICAL },
> -	{ .n = "lcdck", .p = "masterck_div", .id = 3 },
> -	{ .n = "uhpck", .p = "usbck",        .id = 6 },
> -	{ .n = "udpck", .p = "usbck",        .id = 7 },
> -	{ .n = "pck0",  .p = "prog0",        .id = 8 },
> -	{ .n = "pck1",  .p = "prog1",        .id = 9 },
> +	{ .n = "ddrck", .id = 2, .flags = CLK_IS_CRITICAL },
> +	{ .n = "lcdck", .id = 3 },
> +	{ .n = "uhpck", .id = 6 },
> +	{ .n = "udpck", .id = 7 },
> +	{ .n = "pck0",  .id = 8 },
> +	{ .n = "pck1",  .id = 9 },
>   };
>   
>   static const struct clk_pcr_layout at91sam9n12_pcr_layout = {
> @@ -111,12 +111,12 @@ static const struct pck at91sam9n12_periphck[] = {
>   
>   static void __init at91sam9n12_pmc_setup(struct device_node *np)
>   {
> +	struct clk_hw *usbck_hw, *hw, *main_rc_hw, *main_osc_hw;
>   	struct clk_range range = CLK_RANGE(0, 0);
>   	const char *slck_name, *mainxtal_name;
> +	struct clk_parent_data parent_data[5];

Same here as in the previous patch, please mention that you've changed the array 
size along with the rationale behind.

The rest LGTM.

Thank you,
Claudiu
