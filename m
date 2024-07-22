Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E505216DEB1
	for <linux-clk@vger.kernel.org>; Mon, 22 Jul 2024 15:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721661508; cv=none; b=cu8HFVLCaTijvR1vr89pmTpoHO+6SIXvBYTgxEBRvoO4rs2ssVzxMmSPpYIEtko///tdpbjTErXnXHC2HW9mPpv6oQ7S4sSiQ43wWhZ5pdhBHAUsXK+McgKMcKxC/yuj4RVd8RbeqLKI4MZ532R9a/BCus5zWnb2YEu766WP4MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721661508; c=relaxed/simple;
	bh=zm5u8wZXEjdYWsoOLkmz2zH7ehYsVAsv9EcqDcypJq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJU/fKQt0lHDZpoNyBElNIBbLgRrfFvVM99eNOdYndAxggH4WdnmZBLRdbsMdZ77oWdAHDuSbTW2bvypdt+AdVMx6m6AT/4KnH0LwyVZuymaHpk4K6iBbq+/b3OyrKuqRTT581YirffesBtZq5Tn4Tl7JRS/jdc+s/1FSlNBrSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q0l6Lj6p; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Q0l6Lj6p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721661505;
	bh=zm5u8wZXEjdYWsoOLkmz2zH7ehYsVAsv9EcqDcypJq4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q0l6Lj6pVf5jYns2yr30sMv0IbtiubDDUm/fpJ3kDqghCxhPLeKV9r3hiupwV0J/d
	 Fabc1z9YNf5djiyFPa4Wf5iWhtO1ODjbOswHlNtLJ87aVh9XCh/EH2Gu8HWJHUqrzP
	 cs3dX0251qNrXDPbJ6a1kdascz4vY1melpM34ysOoZNPcxgqina+2s/cSjm8ImfZSV
	 P8UrzWHuEdtp3Zc7//nNk7yBYKUxnrAA+tgEzuwbtmEH4VkQbQPJMWvFolpn7f9d8H
	 l78Z7BZpuiBiUm15vSfbeNnFsewWxArx84+bt5b0vSTvox6XIfQ2rcc+AUuTbeNcSC
	 vbFY8JSclqnSQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 749AE37800DE;
	Mon, 22 Jul 2024 15:18:24 +0000 (UTC)
Message-ID: <26151f58-9dd3-4e14-afaf-c62f539f8e26@collabora.com>
Date: Mon, 22 Jul 2024 17:18:23 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: en7523: fix scuclk io region for upcoming
 pinctrl
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 lorenzo.bianconi83@gmail.com, linux-arm-kernel@lists.infradead.org,
 nbd@nbd.name, john@phrozen.org, upstream@airoha.com
References: <cover.1720510991.git.lorenzo@kernel.org>
 <f1c8e114fb1370b9a3a602e3ed3e9eeb5824c2e7.1720510991.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <f1c8e114fb1370b9a3a602e3ed3e9eeb5824c2e7.1720510991.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/07/24 09:48, Lorenzo Bianconi ha scritto:
> EN7581 clock driver shares the IO region with the upcoming pinctrl
> driver for Airoha EN7581 SoC. Fix it by reducing the clk mapped
> region to only used registers in order to not overlap with pinctrl
> one. This change is not introducing any backward compatibility issue
> since the EN7581 dts is not upstream yet.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>   drivers/clk/clk-en7523.c | 23 +++++++++++++++--------
>   1 file changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> index b20e56337a6b..d9ecbb6bf55a 100644
> --- a/drivers/clk/clk-en7523.c
> +++ b/drivers/clk/clk-en7523.c
> @@ -31,7 +31,14 @@
>   #define   REG_RESET_CONTROL_PCIE1	BIT(27)
>   #define   REG_RESET_CONTROL_PCIE2	BIT(26)
>   /* EN7581 */
> -#define REG_CRYPTO_CLKSRC2		0x20c
> +#define REG_GSW_CLK_DIV_SEL2		0x00
> +#define REG_EMI_CLK_DIV_SEL2		0x04
> +#define REG_BUS_CLK_DIV_SEL2		0x08
> +#define REG_SPI_CLK_DIV_SEL2		0x10
> +#define REG_SPI_CLK_FREQ_SEL2		0x14
> +#define REG_NPU_CLK_DIV_SEL2		0x48
> +#define REG_CRYPTO_CLKSRC2		0x58
> +
>   #define REG_PCIE0_MEM			0x00
>   #define REG_PCIE0_MEM_MASK		0x04
>   #define REG_PCIE1_MEM			0x08
> @@ -203,7 +210,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_GSW,
>   		.name = "gsw",
>   
> -		.base_reg = REG_GSW_CLK_DIV_SEL,
> +		.base_reg = REG_GSW_CLK_DIV_SEL2,

This is practically just commit noise :-)

You are adding the en7581_base_clks[] in patch [1/2] with the wrong base register,
then fixing it here ... and that's wrong.

Please squash the two patches.

Cheers,
Angelo

>   		.base_bits = 1,
>   		.base_shift = 8,
>   		.base_values = gsw_base,
> @@ -217,7 +224,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_EMI,
>   		.name = "emi",
>   
> -		.base_reg = REG_EMI_CLK_DIV_SEL,
> +		.base_reg = REG_EMI_CLK_DIV_SEL2,
>   		.base_bits = 2,
>   		.base_shift = 8,
>   		.base_values = emi7581_base,
> @@ -231,7 +238,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_BUS,
>   		.name = "bus",
>   
> -		.base_reg = REG_BUS_CLK_DIV_SEL,
> +		.base_reg = REG_BUS_CLK_DIV_SEL2,
>   		.base_bits = 1,
>   		.base_shift = 8,
>   		.base_values = bus_base,
> @@ -245,13 +252,13 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_SLIC,
>   		.name = "slic",
>   
> -		.base_reg = REG_SPI_CLK_FREQ_SEL,
> +		.base_reg = REG_SPI_CLK_FREQ_SEL2,
>   		.base_bits = 1,
>   		.base_shift = 0,
>   		.base_values = slic_base,
>   		.n_base_values = ARRAY_SIZE(slic_base),
>   
> -		.div_reg = REG_SPI_CLK_DIV_SEL,
> +		.div_reg = REG_SPI_CLK_DIV_SEL2,
>   		.div_bits = 5,
>   		.div_shift = 24,
>   		.div_val0 = 20,
> @@ -260,7 +267,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_SPI,
>   		.name = "spi",
>   
> -		.base_reg = REG_SPI_CLK_DIV_SEL,
> +		.base_reg = REG_SPI_CLK_DIV_SEL2,
>   
>   		.base_value = 400000000,
>   
> @@ -272,7 +279,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
>   		.id = EN7523_CLK_NPU,
>   		.name = "npu",
>   
> -		.base_reg = REG_NPU_CLK_DIV_SEL,
> +		.base_reg = REG_NPU_CLK_DIV_SEL2,
>   		.base_bits = 2,
>   		.base_shift = 8,
>   		.base_values = npu7581_base,

