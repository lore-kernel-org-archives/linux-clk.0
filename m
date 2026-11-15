Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794704363;
	b=Z3HONjROrfjUo7fpA8haQWFHZixFN1sybCU2vVUe4Nlkx4XJKGFuni2j/rmZntBrBIMH
	 T8do96j5pp56i06qudK51yJb7/x+RpDnb5xXbZnYfzfCm78F/KML+E57SOCzXzl/EXvA0
	 RXbzmP2uhFJuzgg+SUmMN/y2ueNtCkIk8aw9GfFNfo1mnhL8Dn945U/2By390gkOXLlAD
	 Cid976KI82/4mubZbFUc2HC69xSmCG2XT+OqGCEBe4Bl6+PkHeMVZng7FlGdyTHSB7O+M
	 Ge8YaT+oeZlt/jY6DU/ywKB3koFaoUNm6Z62N897eW2RBZ+xY/JHW6J8tq7K1XLNEuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794704363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Reply-To:Subject:
	 Content-Language:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
	b=3OIKseb/S87O4OhNbcWdzowdx9HqwBrWdryn8riZMJ0w28oxWtS1vjYCPU/FFu2U/Chx
	 9o1rJ5/0i2069EqpVzs9n1Jp7eKdcqwErIcE/3wP3Ls+ZAhoiXsEQwBjtV9xkX2NCeifl
	 IYX1bjYcKIK5RFvnE39bJ1gRa++GK98vqpUoNyaSyjTWCw1LqrgyK1OyF/OjZMGuynHBo
	 HaJuUvW6Vid02aeb2Vq/2otxAfkckIFnXX1GHYCB0ntPLUvEWesXv58HktmUTSZdsZx16
	 YNJW7CTlMk70KMkp5D778X+mIiOqOghHjYsk/GWGafZcZdf5zJCOjS8Qdouc245rHHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4SUhaU;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E73606A323
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 00:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61E73606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jP4SUhaU
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3704d30b84fso2812278eec.1
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 16:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794704361; x=1795309161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=jP4SUhaU/1s+bJegZl7fwS9GDcrkTwT3ktqXJB2jbdhpkF9qtkmX9hOuc4H0Isf6/S
         t95bJXrfBfioTpYwsmbsT4XWMh27lioeK72HmRVm69No8veKhDn+WFPaYBrdlR/OQb8C
         4Pt9iCuXplfG8tNV/Zrp+sML03tNMGDgnqXF2JbU0OP6RXHj/xU5Fh5Pxz9ItgSlVgAS
         FO+oCzPpkmFBneYuu5WTqqZVuRNwErAH/gFHfSNI8K+rdziuRDc8p0NBmkD7NZqfMDev
         /Ph9aWNz5ykxrInosryMfF5gBUlufGQF4UKWcEj2MeyU9i0z3KLltz5MobgMR9SXe67r
         RXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794704361; x=1795309161;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:reply-to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H5gORA8lBWNt/FrQUIrrCLOfomvpdlfZQU675IOPv9o=;
        b=u5hoK06G63H552Bx3JokEweyeLAUBTgNDdN6l06MDlWnSVpvGdNo1Rnh/axs5A1liv
         elVuvR6UYEQVnwnl0kZ03WaLp6PJyb6zBFCXfT7ulSoiTVcgTM/ZC32CPxoucjPaoEip
         eC7PGNRPZSCPEdlythDn9C/DcjEgeEw976amJBxCeEqJbYab1Uf/yhRKD9pq/SdqZMS+
         vwhKSANbGrSX5WDU5lcq/1A7q+Qu+f8HnR4Y0IuP6XA67RCww1L83Y+HuK9I45VtGMKz
         O7DA6vJN2dkRYfCeen19jQHaraLBlP3txKGOe9KiSy5eXfdNDhQgb4fUwtF4MvXaOe8e
         aV8A==
X-Forwarded-Encrypted: i=1; AL+hErFXutB5x5Rf2fHvPHIp6306t/yFOaS+ErrViMdCn0SvQZVE672m0V11MsXn3L6yoytmSgP7ymo2pwc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/3lBDjs2549brEGY25jtHE8lS6IVly+PzVVbb4kVgHib2gfH0
	+qAh6np80HqfUj6w3DTukXhltkA0o6qRvD7E9A/o9mY4KqMoKTGIGd/Y
X-Gm-Gg: AYBFou0+F5F91S1j0gkwnRnztNB4zX0VVo2sG0GjX3Z1g2wHGvlSQTeZ/gIkbs5Hibq
	aRHdh8fu6LMxsRBmgvItpf88B2qAp/ki+GJYBG0y5guGM59FC8D8FKbEFLPJOOo+GKQV6EuDwL8
	1lcJp8TicShNWIj5+gQdPIq9P+b3TIzmBp8LrIUYueWnbhgSEZqYz3Uj0FemXOj/ZVHvZQtuBFh
	5+aeJvBSNQQUqyWrQWX0Xy5HENTziBJhsqibyQDsgjxjCKO+UCjBjpqy25HL2SenIrj9Vylmia/
	tTyxU4XUbqKs7G58NkSIwvAxu7+o3vVuuIqyuK8on1ieDQePfdjMu9VXpzBd3JHbgv23Hlc2SdF
	gtdQ2K568/6FL0+q08l4OCT/LvRSv1gw+noHhMP0kEjaIA2e+OyVAWc+9PHjSyl9DcPcW93ZIuI
	O6Qqd5vkznDyNMjkXIDmApmUyU5sd7/jn6jCgtZsmpmK1ks5j0BpYBQLtoBdexFfb4mh1jKzUU0
	/5JBfbRcSbGowQvkjj06HtrGeKQ3eNFG0yj9tmY0vsagIUutU2YDU6QuOmM9lQoAduJXQPhT5Ux
	eSsdnc0ddarAx8RsZowocUFjyp89il4AHeaTh8C1+LKFUcqLaI+wL4rsPrfjuowowWvOKn13OAv
	C6GzPZaE3I7y6
X-Received: by 2002:a05:7300:231c:b0:36f:3c7e:3c13 with SMTP id 5a478bee46e88-37967ae7f85mr9538114eec.22.1794704361510;
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Received: from [192.168.35.43] ([218.50.238.131])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm20244703eec.0.2026.11.14.16.59.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 16:59:21 -0800 (PST)
Message-ID: <0a8c0d90-9d80-4688-83b3-faf6bf04ca06@gmail.com>
Date: Sun, 15 Nov 2026 09:59:16 +0900
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: chanwoo@kernel.org
Subject: Re: [PATCH v2 5/7] PM / devfreq: rockchip-dfi: move register offsets
 to variant struct
Content-Language: ko
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, kernel@collabora.com
References: <20260921-b4-rockchip-dfi-rk3576-support-v2-0-04f847016321@collabora.com>
 <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
From: Choi Chanwoo <cwchoi00@gmail.com>
In-Reply-To: <20260921-b4-rockchip-dfi-rk3576-support-v2-5-04f847016321@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/22/2026 6:15 AM, Sebastian Reichel wrote:
> DDRMON in version 0x40 (found in RK3576) has two control registers,
> which moves the register addresses. Move the register offsets from the
> defines to the varaint struct to ease supporting the newer version.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  drivers/devfreq/event/rockchip-dfi.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/devfreq/event/rockchip-dfi.c b/drivers/devfreq/event/rockchip-dfi.c
> index 380361a231a2..8490219f61be 100644
> --- a/drivers/devfreq/event/rockchip-dfi.c
> +++ b/drivers/devfreq/event/rockchip-dfi.c
> @@ -42,12 +42,6 @@
>  #define DDRMON_CTRL_TIMER_CNT_EN	BIT(0)
>  #define DDRMON_CTRL_LP5_BANK_MODE_MASK	GENMASK(8, 7)
>  
> -#define DDRMON_CH0_WR_NUM		0x20
> -#define DDRMON_CH0_RD_NUM		0x24
> -#define DDRMON_CH0_COUNT_NUM		0x28
> -#define DDRMON_CH0_DFI_ACCESS_NUM	0x2c
> -#define DDRMON_CH1_COUNT_NUM		0x3c
> -#define DDRMON_CH1_DFI_ACCESS_NUM	0x40
>  
>  #define PERF_EVENT_CYCLES		0x0
>  #define PERF_EVENT_READ_BYTES		0x1
> @@ -128,6 +122,10 @@ struct rockchip_dfi {
>   * @clocks_optional: whether not finding the clocks is non-fatal. Set if the
>   *                   DT binding for this variant didn't require clocks in the
>   *                   past, so that the driver remains compatible with old DTs.
> + * @reg_write_access: register offset for writes access
> + * @reg_read_access: register offset for read access
> + * @reg_access: register offset for read/write access
> + * @reg_clock_cycles: register offset for clock cycles
>   */
>  struct rockchip_dfi_variant {
>  	int (*init)(struct rockchip_dfi *dfi);
> @@ -137,6 +135,10 @@ struct rockchip_dfi_variant {
>  	const char * const *clk_names;
>  	unsigned int num_clks;
>  	bool clocks_optional;
> +	u8 reg_write_access;
> +	u8 reg_read_access;
> +	u8 reg_access;
> +	u8 reg_clock_cycles;
>  };
>  
>  static int rockchip_dfi_ddrtype_to_ctrl(struct rockchip_dfi *dfi, u32 *ctrl)
> @@ -275,13 +277,13 @@ static void rockchip_dfi_read_counters(struct rockchip_dfi *dfi, struct dmc_coun
>  		if (!(dfi->channel_mask & BIT(i)))
>  			continue;
>  		res->c[i].read_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_RD_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_read_access + i * dfi->variant->stride);
>  		res->c[i].write_access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_WR_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_write_access + i * dfi->variant->stride);
>  		res->c[i].access = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_DFI_ACCESS_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_access + i * dfi->variant->stride);
>  		res->c[i].clock_cycles = readl_relaxed(dfi_regs +
> -				DDRMON_CH0_COUNT_NUM + i * dfi->variant->stride);
> +				dfi->variant->reg_clock_cycles + i * dfi->variant->stride);
>  	}
>  }
>  
> @@ -829,6 +831,10 @@ static const struct rockchip_dfi_variant rk3399_variant = {
>  	.max_channels = 2,
>  	.clk_names = rk3399_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3399_clk_names),
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3568_variant = {
> @@ -836,6 +842,10 @@ static const struct rockchip_dfi_variant rk3568_variant = {
>  	.stride = 0x0,
>  	.ctrl_single = true,
>  	.max_channels = 1,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct rockchip_dfi_variant rk3588_variant = {
> @@ -845,6 +855,10 @@ static const struct rockchip_dfi_variant rk3588_variant = {
>  	.clk_names = rk3588_clk_names,
>  	.num_clks = ARRAY_SIZE(rk3588_clk_names),
>  	.clocks_optional = true,
> +	.reg_write_access = 0x20,
> +	.reg_read_access = 0x24,
> +	.reg_clock_cycles = 0x28,
> +	.reg_access = 0x2c,
>  };
>  
>  static const struct of_device_id rockchip_dfi_id_match[] = {
> 

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>	

-- 
Best Regards,
Chanwoo Choi
Principal Engineer, Samsung Electronics
