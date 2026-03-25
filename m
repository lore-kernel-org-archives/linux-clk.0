Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2629B22F;
	Wed, 25 Mar 2026 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406943; cv=none; b=uh4sjpiFgg/8WSPvcjmGnwzufOFQIceNgQ1uWq3C34FpyR02yZFog3Cl7ltwvDeRqlt33B9pIpTqBNVpCvMGT/ZX4NTRYrKrGeS0zhCDi/H1cox4cO4C7Ox2dlR/5sThPSQWINGwFxW8yLUvqFSwdDxCprlsxutSo21JKzr7GTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406943; c=relaxed/simple;
	bh=lUXHocbr1M1b2KViD96k/UbvtkQcjf0ESNAjW/qWTXg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=G0FwPU5o5+RRn9rV/YXGi3+d1C5p2Iw8ZeIfVMGNPB5IcrAm0RfiXf3dCb+dasQtAppONkj4A+bCcM7rWAU9AR/tlL9lAqma8B3jiW0NjgTE+OcJg5EZQ5LpkNbGEe3Szbg6HqrqIj6nh1RqCRPhN1IgLfzuKLUnriSkkpSMYzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kVnF85fe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kVnF85fe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47199C19424;
	Wed, 25 Mar 2026 02:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406943;
	bh=lUXHocbr1M1b2KViD96k/UbvtkQcjf0ESNAjW/qWTXg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kVnF85fetiOQtOWLC0T952kjOPwthqi7RV0VrM6j9gq/KlAH7Jc8BtpNjnhjtUy2p
	 XH8OxtEFlDYrOZQPaNqiQU2RXYOqzzA/9D6GpgEH4P/nI8uTmZVwvLX6j5LgfEeuXh
	 PyioXsGCaJ5TANFWXjfI85Y4i/QSINVjnfUSbdNii+Rm1r78NsPPXFmZCNaRGjwOaz
	 e1jq42lA3GtcudBmi/pmLgaVGmEeu/ovCvQtCyLGppPn/DcOlh3YHeHll05/dxmMBK
	 xuMU6OaKt87Monu4PLjz6H9SnVEuhuXtOlNfy8XyC9jDtQTlzJ4zpQ5y/Wgs3HH/aZ
	 SHqNahPYq/UJg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260324025332.3416977-9-eleanor.lin@realtek.com>
References: <20260324025332.3416977-1-eleanor.lin@realtek.com> <20260324025332.3416977-9-eleanor.lin@realtek.com>
Subject: Re: [PATCH v5 08/10] clk: realtek: Add support for MMC-tuned PLL clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, eleanor.lin@realtek.com
To: Yu-Chun Lin <eleanor.lin@realtek.com>, afaerber@suse.com, conor+dt@kernel.org, cylee12@realtek.com, jyanchou@realtek.com, krzk+dt@kernel.org, mturquette@baylibre.com, p.zabel@pengutronix.de, robh@kernel.org
Date: Tue, 24 Mar 2026 18:54:24 -0700
Message-ID: <177440366488.5403.14385693004290004608@localhost.localdomain>
User-Agent: alot/0.12

Quoting Yu-Chun Lin (2026-03-23 19:53:29)
> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> index 000000000000..017663738c1f
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2021 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include "clk-pll.h"

Include what you use in this C file, not just this header file. That
makes it simpler to see what is used without following include trails.

> +
> +#define PLL_EMMC1_OFFSET           0x0
> +#define PLL_EMMC2_OFFSET           0x4
> +#define PLL_EMMC3_OFFSET           0x8
> +#define PLL_EMMC4_OFFSET           0xc
> +#define PLL_SSC_DIG_EMMC1_OFFSET   0x0
> +#define PLL_SSC_DIG_EMMC3_OFFSET   0xc
> +#define PLL_SSC_DIG_EMMC4_OFFSET   0x10
> +
> +#define PLL_MMC_SSC_DIV_N_VAL      0x1b
> +
> +#define PLL_PHRT0_MASK             BIT(1)
> +#define PLL_PHSEL_MASK             GENMASK(4, 0)
> +#define PLL_SSCPLL_RS_MASK         GENMASK(12, 10)
> +#define PLL_SSCPLL_ICP_MASK        GENMASK(9, 5)
> +#define PLL_SSC_DIV_EXT_F_MASK     GENMASK(25, 13)
> +#define PLL_PI_IBSELH_MASK         GENMASK(28, 27)
> +#define PLL_SSC_DIV_N_MASK         GENMASK(23, 16)
> +#define PLL_NCODE_SSC_EMMC_MASK    GENMASK(20, 13)
> +#define PLL_FCODE_SSC_EMMC_MASK    GENMASK(12, 0)
> +#define PLL_GRAN_EST_EM_MC_MASK    GENMASK(20, 0)
> +#define PLL_EN_SSC_EMMC_MASK       BIT(0)
> +#define PLL_FLAG_INITAL_EMMC_MASK  BIT(1)
[...]
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> index 2d27a44a270c..9cf219871218 100644
> --- a/drivers/clk/realtek/clk-pll.h
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -44,4 +44,25 @@ static inline struct clk_pll *to_clk_pll(struct clk_hw=
 *hw)
>  extern const struct clk_ops rtk_clk_pll_ops;
>  extern const struct clk_ops rtk_clk_pll_ro_ops;
> =20
> +struct clk_pll_mmc {
> +       struct clk_regmap clkr;
> +       int pll_ofs;
> +       int ssc_dig_ofs;

These offsets should be unsigned?

> +       struct clk_hw phase0_hw;
> +       struct clk_hw phase1_hw;
> +       u32 set_rate_val_53_97_set_ipc: 1;

bool? Doubt we care about this unless we're packing structs (which we
shouldn't be).

> +};
> +
> +#define __clk_pll_mmc_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
> +
> +static inline struct clk_pll_mmc *to_clk_pll_mmc(struct clk_hw *hw)
> +{
> +       struct clk_regmap *clkr =3D to_clk_regmap(hw);
> +
> +       return container_of(clkr, struct clk_pll_mmc, clkr);
> +}
