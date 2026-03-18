Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2E31C860B;
	Wed, 18 Mar 2026 12:30:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837013; cv=none; b=iprjLgUTDk/3u7aAKjKkU13k2jx5/6YPzIIUfDrqmEa+0utEcnDGxXFqqjkLniMNQ0KWI8cHbPuW5APRbYQTzSWOzvpUyhNRka5iZSEd7BQrptOINijCzWiuhmCp6aYRlZUfliZoZBdgS+SNwY7J7LZJj4Yer6t9Gox1D3ei9oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837013; c=relaxed/simple;
	bh=iOulkhDoqNITbcvR7gTtzu3AHBi+cKQ21g+bnwKGJ64=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=YmHJZNtj4rnGPay7NIuMVjfMwiy+nXF7wZBXLUTZuSRdBy5XBulxHJeeLuJffmM0H3KqiiC5CkiYy+1zZwUcxylj6WIwnyT1tj3PQJ3lZae/jNlHryvpgfHYb/ctBGc9cSJNGPDt33/R+XjjLm5rIJc+P6zQQIMMBuJrKOR3CEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A4uxB/0q; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A4uxB/0q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837010;
	bh=iOulkhDoqNITbcvR7gTtzu3AHBi+cKQ21g+bnwKGJ64=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=A4uxB/0qxWOhi+l49UbCUHvGY/AqdbIZKCIC8nprEl8vrFJ4LT56pSrGF9BWPtvAw
	 k+fzd/9pNHbsCZmK4ZEPqXz2OaNrBXW6N4xk0Y3ZCc4k7Aei5BVasz31Zs5mtwLyLy
	 79xxD3rwLIHwxx7P2bTsy8/x8Mg42MFfpmE9ndoQUypSRIC0hAhriKMuc25Sc6XKD3
	 cbhre8NlJrTnRPq7ulwRoDvfRHWTfG85iT9haXKYOSPTiqMtFMSBJCrTF5vFOLeD5p
	 2PmPQ5AgY7vSHOsq53/O7IvjECh9kZwX0/9UN6nRtb8dtpTuen2929/oeoB0T0Y6Bf
	 dSdnKvHQUJC0A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 17EF117E0497;
	Wed, 18 Mar 2026 13:30:10 +0100 (CET)
Message-ID: <d466ee35-789a-4e2c-a040-f182083dd82e@collabora.com>
Date: Wed, 18 Mar 2026 13:30:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt7988: use MUX_CLR_SET_UPD for gate-less
 muxes
To: Daniel Golle <daniel@makrotopia.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sam Shih <sam.shih@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <869a8a99bbde357fb4f2175f99e605c3e1597640.1773801987.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <869a8a99bbde357fb4f2175f99e605c3e1597640.1773801987.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 18/03/26 03:48, Daniel Golle ha scritto:
> All 18 muxes in the infra_muxes[] array are pure mux selectors without
> a clock gate, yet they were defined using MUX_GATE_CLR_SET_UPD with
> gate_shift = -1.
> 
> This macro assigns mtk_mux_gate_clr_set_upd_ops, whose
> enable/disable/is_enabled callbacks perform BIT(gate_shift). Since
> gate_shift is stored as u8, the -1 truncates to 255, causing a
> shift-out-of-bounds at runtime:
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:76:8
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:102:4
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> UBSAN: shift-out-of-bounds in drivers/clk/mediatek/clk-mux.c:122:16
> shift exponent 255 is too large for 64-bit type 'long unsigned int'
> 
> Switch these definitions to MUX_CLR_SET_UPD, which uses
> mtk_mux_clr_set_upd_ops (no gate callbacks). The actual clock gating
> for these peripherals is handled by the separate GATE_INFRA* definitions
> further down.
> 
> Fixes: 4b4719437d85f ("clk: mediatek: add drivers for MT7988 SoC")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

While this makes things to actually work, there's another problem, and that is
that .upd_ofs is a u32 and is being set to -1.

Since, as far as I remember, MT7988 is *not* the only one that is affected by the
issue that you're fixing here...

I would rather consider, instead, to add a new macro that is a bit more foolproof
in clk-mux.h

#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
		    _mux_set_ofs, _mux_clr_ofs, _shift)
	MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs, _mux_set_ofs,	\
			_mux_clr_ofs, _shift, 0, 0, -1)

...and use it in this driver (and others, if you can..) instead.

Cheers,
Angelo

> ---
>   drivers/clk/mediatek/clk-mt7988-infracfg.c | 84 +++++++++++-----------
>   1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt7988-infracfg.c b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> index c40e18c27f12e..57203d08ac265 100644
> --- a/drivers/clk/mediatek/clk-mt7988-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt7988-infracfg.c
> @@ -56,49 +56,49 @@ static const char *const infra_pcie_gfmux_tl_ck_o_p3_parents[] __initconst = {
>   
>   static const struct mtk_mux infra_muxes[] = {
>   	/* MODULE_CLK_SEL_0 */
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
> -			     infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
> -			     infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
> -			     infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel", infra_mux_spi0_parents,
> -			     0x0018, 0x0010, 0x0014, 4, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel", infra_mux_spi1_parents,
> -			     0x0018, 0x0010, 0x0014, 5, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel", infra_mux_spi0_parents,
> -			     0x0018, 0x0010, 0x0014, 6, 1, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel", infra_pwm_bck_parents, 0x0018,
> -			     0x0010, 0x0014, 14, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 16, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 18, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 20, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 22, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 24, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 26, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 28, 2, -1, -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel", infra_pwm_bck_parents,
> -			     0x0018, 0x0010, 0x0014, 30, 2, -1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART0_SEL, "infra_mux_uart0_sel",
> +			infra_mux_uart0_parents, 0x0018, 0x0010, 0x0014, 0, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART1_SEL, "infra_mux_uart1_sel",
> +			infra_mux_uart1_parents, 0x0018, 0x0010, 0x0014, 1, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_UART2_SEL, "infra_mux_uart2_sel",
> +			infra_mux_uart2_parents, 0x0018, 0x0010, 0x0014, 2, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI0_SEL, "infra_mux_spi0_sel",
> +			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 4, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI1_SEL, "infra_mux_spi1_sel",
> +			infra_mux_spi1_parents, 0x0018, 0x0010, 0x0014, 5, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_MUX_SPI2_SEL, "infra_mux_spi2_sel",
> +			infra_mux_spi0_parents, 0x0018, 0x0010, 0x0014, 6, 1, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_SEL, "infra_pwm_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 14, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK1_SEL, "infra_pwm_ck1_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 16, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK2_SEL, "infra_pwm_ck2_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 18, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK3_SEL, "infra_pwm_ck3_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 20, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK4_SEL, "infra_pwm_ck4_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 22, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK5_SEL, "infra_pwm_ck5_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 24, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK6_SEL, "infra_pwm_ck6_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 26, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK7_SEL, "infra_pwm_ck7_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 28, 2, -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PWM_CK8_SEL, "infra_pwm_ck8_sel",
> +			infra_pwm_bck_parents, 0x0018, 0x0010, 0x0014, 30, 2, -1, -1),
>   	/* MODULE_CLK_SEL_1 */
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2, -1,
> -			     -1, -1),
> -	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
> -			     infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2, -1,
> -			     -1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P0_SEL, "infra_pcie_gfmux_tl_o_p0_sel",
> +			infra_pcie_gfmux_tl_ck_o_p0_parents, 0x0028, 0x0020, 0x0024, 0, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P1_SEL, "infra_pcie_gfmux_tl_o_p1_sel",
> +			infra_pcie_gfmux_tl_ck_o_p1_parents, 0x0028, 0x0020, 0x0024, 2, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P2_SEL, "infra_pcie_gfmux_tl_o_p2_sel",
> +			infra_pcie_gfmux_tl_ck_o_p2_parents, 0x0028, 0x0020, 0x0024, 4, 2,
> +			-1, -1),
> +	MUX_CLR_SET_UPD(CLK_INFRA_PCIE_GFMUX_TL_O_P3_SEL, "infra_pcie_gfmux_tl_o_p3_sel",
> +			infra_pcie_gfmux_tl_ck_o_p3_parents, 0x0028, 0x0020, 0x0024, 6, 2,
> +			-1, -1),
>   };
>   
>   static const struct mtk_gate_regs infra0_cg_regs = {


