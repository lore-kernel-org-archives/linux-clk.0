Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794574469;
	b=skdHsAKmo6mZdxwVXizxKpRp9KpyvTL+kZ0utPq0M/NwwezOdZnqZHusaSy4hSXpnUI6
	 UBHzpNmmyUmdrd5GjG69BsotRA6nF7O6zpew5Yt9aXRgWkpUDj4NUEuBY31et/0PMMTzT
	 vjq9G544RD8NPhy2RX2UYkAQpk0pHvdy+C7yjKutN8l3xMPhexf8AKdavp9eCftWZD5nj
	 JgDVm76YdeIjlKS0SWu7HcSuudaHaz3vCbt4swb7QQ7tVo3zSdVIdNm58H3TmHH0072qM
	 YZ5UY8nqq0u4KJlcn470bSP06LjOBduayLsTOya85aYoDjGHAoW6w77J7yP2/WDkEyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
	b=ueejAllnBLzxiGuVTJ6clSRdHp/LdRe107tGVuNDBxLYGXa7ogkk6rBK8uxIdxBCQCnZ
	 1Tv7IT59LuukAeVnhiTwGntQ/wbGms0MF1R0UWXFFUeYY9yV9iZMkIsG8hL3u+QQQy929
	 0F+JkMbEon8a+xdy3gemGbERS8jkE8Kbd1N+0uusNHg+aYXfxn4IbRxmEatH9kMBDYXrd
	 JeUGjt30kXLrvl/mVYhmWVBSeuhf5ou6oPiU8irdjoGOCeU1mwsrbnIqrb9WDpNFS/9Pa
	 +aRuCbxeVTmzwK9iUi2Rspk++ezPo9ajNH85ewr3V73PZxSRll8uJO/x97NAAIi8LGw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A203606A330
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 12:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A203606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WKaeb2l4
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso1759980a12.3
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 04:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794574467; cv=none;
        d=google.com; s=arc-20260327;
        b=cqwGw63peuKZnaflYIHTEwD/uOxfCkE6CyAwUHKkNtnk8oIjX4mBegw+2aoJr0CIre
         VWFBc87fjIZ3T5nMz5e4jEs91VRZpj5Q5EmR7x8fzV/icSFNr6DDJ6J7Qovq0s/2J6Js
         6poUvuvx71wutkil4jEq2jGVVcqdo2z3HV08t85gg3eKTpNb2DrjutBzGGSUllPbssmD
         RF/Wxbr5fP+8hbKbotk1hU+Vsu55X0+bgxINBH/mU1rVVXhMw38AeOZkxmZIPCa+iBFg
         c/cwcZwbddfo4SryVvFrsqXYX8ANCgAUqogI+q1cKEJqeUBphyANHCA683jSLON356Xu
         hGrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        fh=FsRUhxqNwaNQ+XG//dS1hRbBTxKcMmNTBS/iihw1jeA=;
        b=jL4TJWOJ5WpkOKvV5ZP3zGAluLD4KGdWJwvT01ddJm+0AqxkAnmGilawxwbsR+CeKv
         CA+0OZB8Cy2A61t36PpRGLU4uLB1sFowNA52fUOlRV7M+uyX7PEDtnUIn6Vy5PnYCkqq
         UI4JIsgog87kN9p6V6XowwmVdyxhIXTIkwxs4RHs0B8Cyo/nV9FOlbEnp50kczrJJmGL
         mVWy4//FnMQkkbmEsq+Lb9W5tIPUNZpaW67HPM+MAJuHz93obC16EOkejl//Hko4IujX
         xtSHMwgQXqFOdp16baWNxAyf919NM4bCdxvy/HHmjGpN/44RrkDs5wnfP7ADiHlcQYQK
         Dy9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794574467; x=1795179267; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=WKaeb2l4pVzBS87XlMfPO1VmDqptC/3pLusWhgieqeXXXbpQOD/MIp0MA41pPGaSFE
         UGPcR7i6V3UxRV/TUJfwrRDVWP1rRhkfW2bv5f3NKIh7u65gSoBnWc3Smn0ZYEC1mG59
         9c6J0EwwIbANh6fVCNqaE+Sh+OrShJvWjxXx6MXf+bORf3/36vfNUdBbbOHoGqqHfsEC
         sjhXCaXM03ov3jzCLS+fNlnP85J/nu4r9Jy4UZgLRRt4sSmQTCKs9VTP14lzhYH0OT5X
         XIqDjGH1/R319J2ZswfccQWGwNAO+p9bfzHnzjuzlF/O/NaF7SFfrUot6bmtetdPzbED
         pgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574467; x=1795179267;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mLlFdlAUsckIoBDaS7lANsUL8Pv2vCZkw0CEClRgKQA=;
        b=NgPQ4fsBDrvWqxwS06GE6gtHln66tAbVJUK6AlUZ+7ehLFsi9uDNA7m/C+mVYna/tt
         dNzdt5Wgd2/LM9AN1zwTCY5NalxuAQhAwvcQ/n7AkkhYkWQSBpf0qiHbJIMtIkTwrphF
         vmrW4xZnzp8yKI624tz2i56PkOvUlT3sgrc6HhlqWxg800KvogbMrgniGW4vgkrJ4uYc
         hIP5KOXsxLrhD5gVCU5AsrZfLICZkJ8T/nzbd/wSFQnc9Q/yUXwqAVKeiC+gJFCotXpB
         f8dXJhYLrN84YanhMugHrQsPuyEFOgRSZ1Fz50WzPCBeG52ADktgnxMD2hmL+FPeeTB4
         bWTw==
X-Forwarded-Encrypted: i=1; AL+hErF5NKtyLsYTKCo3vsmw/5CQetFovRbel8mpZotK0I+PBKPk6pUGUUxm0ocA43wduPXOB32qkiunF7E=@vger.kernel.org
X-Gm-Message-State: APuU4Z8tVx5HaYvrxnDn57hXMHsQFgZ+M60dscqiLphxKLUiF6HCsmWg
	1+9pqRoLeiV0GihuKwykQ9A182Q8AoXjtY1cNee+dp5Hnzec7UMkFDvDZnpFw+lQSKy9fsnXYxa
	6L77cl7WstNPNZhjWYeNrpzLt6a+4kb0ihN+sgRaNwQ==
X-Gm-Gg: AYBFou0Im5G/0/wWME0DcU/wMXCVrMLLu+EpVGOH0BDTSw7zmTXC2RiCTeo+pomabml
	C2T3d/uYMpWwcE6SB98pFHagh4enHyK6CQ7gb2YeQNa+9BT6tcH1vXLyeThDz+5tyo2VAesKKMs
	+Wa9pDAuVUZMI46fg9KWlDivzJ6RXuNeOadDOq8RydXzkTgGSdMW8+xYW7aFImboamKvMEk6BJ2
	PqaJdjS3qMxNycYuomJwarMq1aM/bVdrmUDv1aQLARx8cXWyk5rkaXuONv+iKiF3H6chW1V8j1f
	er4zPkCsqZK9O3jO9GRKzTQHr09q8gyLMHs1aRumNzvZOZSOekgM0YSgp8h26VPsmAChi2f9EpH
	gLhLl3+hDufKGlxGeyTBsxTSv30Deiml7yANIDz/AyhCxI1lkkfiIQOklUGY4bVwi930XqA==
X-Received: by 2002:a05:6402:2804:b0:6b7:245a:a509 with SMTP id
 4fb4d7f45d1cf-6b7c0d166cfmr1777902a12.40.1794574467313; Fri, 13 Nov 2026
 04:54:27 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CGME20261113104853epcas5p175c566a1ced2547e533c21b21e60e993@epcas5p1.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <20261113110612.3265841-9-raghav.s@samsung.com>
In-Reply-To: <20261113110612.3265841-9-raghav.s@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 12:54:14 +0000
X-Gm-Features: AclHuK9WcGq9tEUmProC1B7yOVe2Lz9yBCRU5dHo1y04eEg6YkemqWw0onfqCbI
Message-ID: <CADrjBPrzHP_97OgAYacJKKqeCcp9FURoi6=Dmopk6nisTdEbdA@mail.gmail.com>
Subject: Re: [PATCH v3 08/14 RESEND] clk: samsung: exynos8855: add block peris
 clock support
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Raghav,

On Fri, 13 Nov 2026 at 10:54, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Register compatible and cmu_info data to support clocks.
> CMU_PERIS, this provides clocks for PERIS
>
> Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos8855.c | 97 ++++++++++++++++++++++++++++
>  1 file changed, 97 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
> index dcf58f2459b0..12b5ae54b560 100644
> --- a/drivers/clk/samsung/clk-exynos8855.c
> +++ b/drivers/clk/samsung/clk-exynos8855.c
> @@ -18,7 +18,9 @@
>  /* NOTE: Must be equal to the last clock ID increased by one */
>  #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
>  #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
> +#define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
>
> +#define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
>  #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
>  #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
>
> @@ -1092,6 +1094,98 @@ static const struct samsung_cmu_info peric_cmu_info __initconst = {
>         .memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
>  };
>
> +/* ---- CMU_PERIS --------------------------------------------------------- */
> +
> +/* Register Offset definitions for CMU_PERIS (0x10030000) */
> +#define CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER           0x600
> +#define CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC                    0x1000
> +#define CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER              0x610
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP                   0x1800
> +#define CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP                    0x1804
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK     0x201c
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK  0x2040
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK          0x2048
> +#define CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK          0x204c
> +#define CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL                  0x800
> +
> +static const unsigned long peris_clk_regs[] __initconst = {
> +       CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER,
> +       CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC,
> +       CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +       CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +       CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +       CMU_PERIS_CONTROLLER_OPTION0_CMU_CTRL,
> +};

Same comment about preserving register state from the bootloader when
powering off/on PERIS block.

> +
> +/* List of parent clocks for Muxes in CMU_PERIS */
> +PNAME(mout_clkcmu_peris_noc_user_p) = { "oscclk", "dout_clkcmu_peris_noc" };
> +PNAME(mout_clk_peris_gic_p) = { "oscclk", "mout_clkcmu_peris_gic_user" };
> +PNAME(mout_clkcmu_peris_gic_user_p) = { "oscclk", "dout_clkcmu_peris_gic" };
> +
> +static const struct samsung_mux_clock peris_mux_clks[] __initconst = {
> +       MUX(CLK_MOUT_PERIS_NOC_USER, "mout_clkcmu_peris_noc_user",
> +           mout_clkcmu_peris_noc_user_p, CMU_PERIS_PLL_CON0_MUX_CLKCMU_PERIS_NOC_USER, 4, 1),
> +       MUX(CLK_MOUT_PERIS_GIC, "mout_clk_peris_gic",
> +           mout_clk_peris_gic_p, CMU_PERIS_CLK_CON_MUX_CLK_PERIS_GIC, 0, 1),
> +       MUX(CLK_MOUT_PERIS_GIC_USER, "mout_clkcmu_peris_gic_user",
> +           mout_clkcmu_peris_gic_user_p, CMU_PERIS_PLL_CON0_MUX_CLK_PERIS_GIC_USER, 4, 1),
> +};
> +
> +static const struct samsung_div_clock peris_div_clks[] __initconst = {
> +       DIV(CLK_DOUT_PERIS_NOCP, "dout_clkcmu_peris_nocp",
> +           "mout_clkcmu_peris_noc_user", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_NOCP,
> +           0, 4),
> +       DIV(CLK_DOUT_PERIS_OTP, "dout_clkcmu_peris_otp",
> +           "oscclk", CMU_PERIS_CLK_CON_DIV_CLK_PERIS_OTP,
> +           0, 4),
> +};
> +
> +static const struct samsung_gate_clock peris_gate_clks[] __initconst = {
> +       GATE(CLK_GOUT_CMU_PERIS, "gout_cmu_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_CMU_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_SYSREG_PERIS, "gout_sysreg_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_SYSREG_PERIS_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT0_PERIS, "gout_wdt0_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT0_IPCLKPORT_PCLK,
> +            21, 0, 0),
> +       GATE(CLK_GOUT_WDT1_PERIS, "gout_wdt1_peris",
> +            "dout_clkcmu_peris_nocp",
> +            CMU_PERIS_CLK_CON_GAT_BLK_PERIS_UID_WDT1_IPCLKPORT_PCLK,
> +            21, 0, 0),

The Linux clock name strings look wrong here. It looks like you've
generally followed the clk-gs101 clock name mangling in this series so
it should be "gout_<block-name>_<IP-clock-name>, but you have
"gout_IP-clock_name>-<block-name>". I know there is some "name
diversity" in-tree for various SoCs, but with new SoCs using auto
clocks I would like to keep the naming scheme following a similar
style to clk-gs101.

Also I guess with auto clocks now enabled from the start you may never
need to expose all the CMU bus clocks, but I worry a bit you may have
mangled the names here a bit too much. If you do need to expose extra
gates you might get name collisions. For example in clk-gs101 we have
both

gout_apm_apm_usi0_uart_ipclk
gout_apm_apm_usi0_uart_pclk

So we kept the _pclk suffix in the Linux name to avoid a name collision.

Thanks,

Peter
