Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C8C1DF989
	for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 20:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730146228; cv=none; b=BLtB7SEQZQ0YDQv8o8XNFF/TKRAO8jo0cfdZrFlTHzH6VZuHtQYqWe6K+mMcTfUBsah/eroyaEJf7JLIS0U6bR4b9rvN134yZPPNkvfGDDE9CybLEXuf3fEmmFa2sob8TisMYuOUmffOi5+qdSEN7tmtVvVpxYjIM3+a/BQNPw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730146228; c=relaxed/simple;
	bh=uIc83Yj70HCk2vgshffko5JRuPLiQcXiG/9qAs3cmzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoCEAEijdkPQgs3eUH129/ZHA0oXTGsNbCqCNr+E3FM6i0Hx2Ky6JjuUJW71AffRis6AM0EMsP+560uF/18n4lYCuQ3UxxFYt8HnFdzdpGbQEi4dAdMn4/J6Qsr+Lv8S5m1EvcdTeTCMB5TcHulNEOH87ebBJqyJNoawfXOl9uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yx6UUCfO; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yx6UUCfO"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb5a9c7420so43322601fa.3
        for <linux-clk@vger.kernel.org>; Mon, 28 Oct 2024 13:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730146224; x=1730751024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9OakXUHW4ekUbkk4194qmDiDkD1ec89ns71VYRu02+Y=;
        b=Yx6UUCfOHNu7nndkkpPBqkWL2oqJoWv13ypHxKKweDl2lS4rTIwRr9FdkwzIpY6nkD
         PH5+efIC/Ne7XSiZyLFllzDF4lu9DBuwYaQxTa5kkhMTjI9aeGgH7PJHcpn2hRh0gKnT
         LEr9dkAf10M2OC6/OVEgdub4Y5Dx1IneWi7u/TfmEpUCPyOXOIeATNUqrPars8sP/zs0
         gQ+qzhe2dwSkxiaxCm1vuuhsWjIiqNlARzH0VHdu7ht+A3zIulJLlLoPABXbtVuAmXxD
         dm45Hhka5rbsQtXiPfiWyAVxO6YdZQ/B42+jlzbFQQYLMA2pnVb+MI9OPxybFqLad+sb
         s2Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730146224; x=1730751024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9OakXUHW4ekUbkk4194qmDiDkD1ec89ns71VYRu02+Y=;
        b=MSNXiwttqDAraTApjRol7c/mMduethtoSI5RAlNIhYvTJVWCgEVVgrx+prk67By1zz
         1M/IZpHVD20v4Atd77kNCTnc+bwItoi9uucJN8MMXBHuq+DsJPqZ3DEag9If73pJWj7P
         Lg/0CvoxaJKdbDO/g9d/vSTgdQK3DyQ5Bdz2HiosZwpnFK3GvvTfcMOmBP1Ml8jYvtBE
         02xwEl8FTJgV5CS/iukqxTFPaRxw67kiO/qprgTd7Gle0vACXo1NorTokHovXHX4WD7T
         dxOsmWWL8MXr61TE1sV1wytrZao3W/3KR32XO1boJFWF5KYPgNSW8VwqdfpOKLSg0Hbl
         ZGGg==
X-Gm-Message-State: AOJu0YwDtUnei8Me4Vkkj2ZWSZpa5RG0zyZ2tzDv7/OiW31zZPBA3SmF
	3HRxF0h7vpCla9qf62RRAYlRdTNhk262ZShmaHBliF56q8Oouh52zGs4bNUU
X-Google-Smtp-Source: AGHT+IEhRHymYCU+tCOEvbZ8QNMhh5sgOJMiW/Owt/4gwHI7TUaTxsRkZjuhBGPWWmqjENgxq52sag==
X-Received: by 2002:a05:651c:1994:b0:2fb:4f0c:e40c with SMTP id 38308e7fff4ca-2fcbe0674f0mr39846821fa.34.1730146223350;
        Mon, 28 Oct 2024 13:10:23 -0700 (PDT)
Received: from [192.168.1.17] (229.140-242-81.adsl-dyn.isp.belgacom.be. [81.242.140.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6349675sm3362990a12.94.2024.10.28.13.10.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 13:10:22 -0700 (PDT)
Message-ID: <de178df0-9c88-421b-a02f-f5b25d18249b@gmail.com>
Date: Mon, 28 Oct 2024 21:10:22 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during
 frequency changes
To: Andre Przywara <andre.przywara@arm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20241025105620.1891596-1-andre.przywara@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I made various tests with this patch, and it doesn't resolve the issue 
on H700.

It doesn't hurt either, so it's up to you to keep it or not.


For the H700, I'm wondering if DVFS is the issue. I mean that's how I 
trigger the crash,

but the crash maybe just a side effect, I've ran tests across the 
transition matrix, and they all seems to works... until it crash.


Crashes are random in their occurrence and their manifestation...


I'm clueless at what could it be.


I've stressed the DRAM at various CPU speeds, and this seems to be 
stable, but again we have detection issues with u-boot... so...

Philippe

On 25/10/2024 12:56, Andre Przywara wrote:
> The H616 user manual recommends to re-parent the CPU clock during
> frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
> at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
> after the factor changes have been applied.
>
> Add clock notifiers for the PLL and the CPU mux clock, using the existing
> notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
> and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
> correct algorithms.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
> Hi,
>
> the manual states that those changes would be needed to safely change
> the CPU_PLL frequency during DVFS operation. On my H618 boards it works
> fine without them, but Philippe reported problems on his H700 board.
> Posting this for reference at this point, to see if it helps people.
> I am not sure we should change this without it fixing any real issues.
>
> The same algorithm would apply to the A100/A133 (and the upcoming A523)
> as well.
>
> Cheers,
> Andre
>
>   drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
>   1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 84e406ddf9d12..85eea196f25e3 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] = {
>   	SUN50I_H616_USB3_CLK_REG,
>   };
>   
> +static struct ccu_mux_nb sun50i_h616_cpu_nb = {
> +	.common		= &cpux_clk.common,
> +	.cm		= &cpux_clk.mux,
> +	.delay_us	= 1, /* manual doesn't really say */
> +	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
> +};
> +
> +static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
> +	.common		= &pll_cpux_clk.common,
> +	.enable		= BIT(29),	/* LOCK_ENABLE */
> +	.lock		= BIT(28),
> +};
> +
>   static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>   {
>   	void __iomem *reg;
>   	u32 val;
> -	int i;
> +	int ret, i;
>   
>   	reg = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(reg))
> @@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>   	val |= BIT(24);
>   	writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
>   
> -	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
> +	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
> +	if (ret)
> +		return ret;
> +
> +	/* Reparent CPU during CPU PLL rate changes */
> +	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
> +				  &sun50i_h616_cpu_nb);
> +
> +	/* Re-lock the CPU PLL after any rate changes */
> +	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
> +
> +	return 0;
>   }
>   
>   static const struct of_device_id sun50i_h616_ccu_ids[] = {
