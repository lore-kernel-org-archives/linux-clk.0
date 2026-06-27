Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D326B2D3
	for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 07:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782545464; cv=none; b=ibw3FlI2sPeLkp6N04Jfyve6vq2WIhDfgka8qXy7OWV0a8Y6rFvk202cl2KfPzJo1ZKH22UGuEBiZEURQgtuZJJ2smqhrYrhyYux1mBJg9f5DacQX4qS5Fxbp0YFNKrvV8G1FM3LGJ5mM3LHHQ+CWpstRpePyvx4SdXXvXWwvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782545464; c=relaxed/simple;
	bh=KK53X/hnuFrngO18GA2XypEG0BVH3nJ1EeapBtooc5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PF2gHcMKQPxLE7eUfHzGTDCwW4tL9UqKib6u2GFo9qxkvex9kO8L9uH5arM5DeYJKD/dJI0MeJzhjIDWZ3NPWknrZHAg5CijW0Fim+/umq3MpZpVi5tzb4uHUGL0K3o8p9Q1vsMNEcvIKyItZy6cOQuzBH5cpjggGejGKvbL5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net; spf=pass smtp.mailfrom=pardini.net; dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b=TMpG4ayo; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pardini.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pardini.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pardini.net header.i=@pardini.net header.b="TMpG4ayo"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-68bd9fce347so3136580a12.2
        for <linux-clk@vger.kernel.org>; Sat, 27 Jun 2026 00:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pardini.net; s=google; t=1782545461; x=1783150261; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QL3YlGwC31Y8JENjif0rePlWfsMeeECArxgJS8HhxD4=;
        b=TMpG4ayoO3tik4XnozU4r7FsPD2p3Mj71xDPpqwDtLaZhRtH5a2pV9XZeizPyF6ayg
         1KR1ZyBkcyP/8gXiNpFq6ov+/A7KvlYaJibz4I1ItOQhyuwh/d9oiYwYYEUzYLue4AHm
         nS7xEWtROFZgFGw8Kiv/ejGITFU6gVjCeUZ0Qay0iQeoIG99WeFvZErcZTYFrWOctB27
         Zt4UeKVRVUKCguF/O2o999pcaQbE0xpKZHbfoo10h0M5xsSOSC+5vLzDlgws8ttCpmFZ
         lGT6gXt/4ZyzfwY9SoyNcRYvEajUWD55z8ueqFr38t3SEFmbPWpA4rQkQ4K2+c+XlOCj
         EBXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782545461; x=1783150261;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QL3YlGwC31Y8JENjif0rePlWfsMeeECArxgJS8HhxD4=;
        b=ph+cBZHU7MshM+IUOAhRb/W1wvLx6+GEhOm0w5nDXYRHtUn2idth5uaKFXNqY7vDm+
         13UCV+GLuvauQJc6ra/1WjxtqqWLOOiB84xIo9cvjni+I3J7T1ZuUGHc7K5wN9BOSiaB
         zYZhMF2g61FCnqjaeriwZu58Ddrou+zapEhLpN2N8JXwaVk2GHaaGNNA/3Dvq0ENX3dP
         L/YyGLE4pOKsF+Ox2lGdGwzWGqTMv7KKA8URtnMYZcvFCDaQ5RD4kHAesKztVhQQrEZO
         jIGztS9fixCYAhX9bSFilH4SKw6e73n3WMGd6jjwID26Xc+dNu9SsBwFYN7rovVm0rDr
         oaDQ==
X-Gm-Message-State: AOJu0Yx+l3PFI3nKc30csSWGQkeJx0FMME8e0w+pBNqdvXuQd/2pTRdM
	rU6eZ+YssqNZHn5yc9wlG8/cjF28EQMWhYpOEbZQRDuKM4ttSM6yy+54ALqz4Qpqug==
X-Gm-Gg: AfdE7cn+01JsD3PxpVSYN9z1SgbwoFR3wrsVH9kFTIgk7+HBprK3EfTglBg+IXj1lpT
	0Zsulwt4+1JZfFAmemIV/zF4G/Fy+lJ21UidwJluOLZdK+lVqyxIdPWcPf1HEE/XeOEB61qIdMe
	MJHRTcxiyRK8uzN4zx5PwdFGcOCMpd0S4GDw4YhrOFkY+ele9bsBGkJHQH51nY3H+4Wq/C2QeVA
	4t3KDaDXuZlkB/Khze/Q1TQYzaruNIYI0A9kPREg/qRM9E4ArbhEZJ0HQ5kY90jt0E9B/lYrLCF
	HoC7YbzdVCZxm2IgJi80Uz1q8dR6r5/Zr8l/AOwJWYvxf/7xSUlp6xYiHBFJbjx5lArxdehJ3oT
	qYVvNXJ81CwHS94wp7sJtkKK8fSmCgZw5MT7OXR6e7ZnaROWtGVwKvtLrHFZAlxfo7GEOtwveRT
	V1SQ+T7vNrTJgyHUxgLh5nZU0eFP9k8hIXMXtyPe9l8+cLjbj3rb8LgOUEGwx39/HcMJiPjm1v0
	K2uVfqaunglOI+uPD+osbc/zskgu7kANzCXqGw7v4GAnHrDPXZ8jn+mDTq4pDmC
X-Received: by 2002:a17:907:6d25:b0:c10:2eac:e839 with SMTP id a640c23a62f3a-c1233661842mr156084766b.39.1782545460756;
        Sat, 27 Jun 2026 00:31:00 -0700 (PDT)
Received: from ?IPV6:2a02:a466:4d7a:0:79f9:b7dc:8cc2:bc28? (2a02-a466-4d7a-0-79f9-b7dc-8cc2-bc28.fixed6.kpn.net. [2a02:a466:4d7a:0:79f9:b7dc:8cc2:bc28])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f47d5a35sm3896286a12.17.2026.06.27.00.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jun 2026 00:30:59 -0700 (PDT)
Message-ID: <45e48dc7-1aa6-4214-8dcc-b3c562d61343@pardini.net>
Date: Sat, 27 Jun 2026 09:30:58 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
To: Daniele Briguglio <hello@superkali.me>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
References: <20260624123914.1767374-1-hello@superkali.me>
Content-Language: en-US
From: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260624123914.1767374-1-hello@superkali.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/06/2026 14:39, Daniele Briguglio wrote:
> No in-tree board references these gates yet. Boards drive the codec
> MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> managed clocks, clk_disable_unused() turns them off at boot. On a board
> that relied on firmware leaving the output enabled, that cuts the MCLK
> and analog audio stops working.
> 
> Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> state firmware left. A board that wants the kernel to own the gate can
> reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> 
> Fixes: 02b9b0bb6269 ("clk: rockchip: rk3588: add GATE_GRF clocks for I2S MCLK output to IO")
> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> Closes: https://lore.kernel.org/linux-rockchip/DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com/
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>
> Signed-off-by: Daniele Briguglio <hello@superkali.me>

I've reproduced the failure reported by Diederik on the NanoPC-T6-LTS 
(indirect I2S0_8CH_MCLKOUT) without this patch, then with this patch 
(which fixes it), and re-tested the R58X-Pro (out-of-tree explicit 
I2S0_8CH_MCLKOUT_TO_IO consumer); it all works for me now.

Tested-by: Ricardo Pardini <ricardo@pardini.net> # on R58X-Pro+NanoPC-T6

Thanks,

-- Ricardo

> ---
>   drivers/clk/rockchip/clk-rk3588.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3588.c b/drivers/clk/rockchip/clk-rk3588.c
> index 2ba9976654c..86953f9ffee 100644
> --- a/drivers/clk/rockchip/clk-rk3588.c
> +++ b/drivers/clk/rockchip/clk-rk3588.c
> @@ -895,7 +895,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S2_2CH_MCLKOUT, "i2s2_2ch_mclkout", i2s2_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(30), 2, 1, MFLAGS),
>   	GATE_GRF(I2S2_2CH_MCLKOUT_TO_IO, "i2s2_2ch_mclkout_to_io", "i2s2_2ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 2, GFLAGS, grf_type_sys),
>   
>   	COMPOSITE(CLK_I2S3_2CH_SRC, "clk_i2s3_2ch_src", gpll_aupll_p, 0,
>   			RK3588_CLKSEL_CON(30), 8, 1, MFLAGS, 3, 5, DFLAGS,
> @@ -912,7 +912,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S3_2CH_MCLKOUT, "i2s3_2ch_mclkout", i2s3_2ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(32), 2, 1, MFLAGS),
>   	GATE_GRF(I2S3_2CH_MCLKOUT_TO_IO, "i2s3_2ch_mclkout_to_io", "i2s3_2ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 7, GFLAGS, grf_type_sys),
>   	GATE(PCLK_ACDCDIG, "pclk_acdcdig", "pclk_audio_root", 0,
>   			RK3588_CLKGATE_CON(7), 11, GFLAGS),
>   	GATE(HCLK_I2S0_8CH, "hclk_i2s0_8ch", "hclk_audio_root", 0,
> @@ -942,7 +942,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S0_8CH_MCLKOUT, "i2s0_8ch_mclkout", i2s0_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_CLKSEL_CON(28), 2, 2, MFLAGS),
>   	GATE_GRF(I2S0_8CH_MCLKOUT_TO_IO, "i2s0_8ch_mclkout_to_io", "i2s0_8ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 0, GFLAGS, grf_type_sys),
>   
>   	GATE(HCLK_PDM1, "hclk_pdm1", "hclk_audio_root", 0,
>   			RK3588_CLKGATE_CON(9), 6, GFLAGS),
> @@ -2229,7 +2229,7 @@ static struct rockchip_clk_branch rk3588_early_clk_branches[] __initdata = {
>   	MUX(I2S1_8CH_MCLKOUT, "i2s1_8ch_mclkout", i2s1_8ch_mclkout_p, CLK_SET_RATE_PARENT,
>   			RK3588_PMU_CLKSEL_CON(9), 2, 2, MFLAGS),
>   	GATE_GRF(I2S1_8CH_MCLKOUT_TO_IO, "i2s1_8ch_mclkout_to_io", "i2s1_8ch_mclkout",
> -			0, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
> +			CLK_IGNORE_UNUSED, RK3588_SYSGRF_SOC_CON6, 1, GFLAGS, grf_type_sys),
>   	GATE(PCLK_PMU1, "pclk_pmu1", "pclk_pmu0_root", CLK_IS_CRITICAL,
>   			RK3588_PMU_CLKGATE_CON(1), 0, GFLAGS),
>   	GATE(CLK_DDR_FAIL_SAFE, "clk_ddr_fail_safe", "clk_pmu0", CLK_IGNORE_UNUSED,
> 
> base-commit: 7edfb7fb58ee058298e18fde76a6077ef17d19d8

