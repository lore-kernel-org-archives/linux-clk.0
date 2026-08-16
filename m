Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88B3BB4A;
	Sun, 16 Aug 2026 08:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786869737; cv=none; b=fjA+hOag4g1n1XLHBrvaTSjiwixVodpy4LAJqneUgEX/vS9CfuSm9w+dn1YN61osMXIfpztvF0u/ECS59Rk5tT1fq9q8rvQtlW4vj+1KVevcLzmUdz5VDvFvCq2BEZsawmbrK992cpQr5UGNvlXjg5QBmF7EFJ4/vemaGl9OEYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786869737; c=relaxed/simple;
	bh=AJVp3pdHr0lpfuuUq95trvoeGgKC8Dnkv92xOoqBM90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZMm3t+cVk+MXh94ziBX2pSrttsf+SNOtwVuZslPKMW3g1Ypm9yeAheW4RpLYBVQtWTOdDUDXykVTPYxKGSWGt6swD1O78UsZQ8wq+mrvfu0sdHasBO/EyonsiYG4Ry9E3VNzgV4gQBefsbpBKisUEzjeUPfjhDCqzYJ6gjkNLjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ll8UIuU+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ll8UIuU+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E4C1F000E9;
	Sun, 16 Aug 2026 08:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786869736;
	bh=efcLIlNDexmjPdefiVvlEnpen0nNuSn6Dz+/O1aw/NM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ll8UIuU+GgHW0Y5aLfAQpMf5zP8WUjNqGkNdJgQ9rMZtpamHgq+JNkmxLRDKywwg0
	 agbPB+aYpj/ZC0Wje56//K4jIOvSmFXPB5aONAJHsb5Ek9buKuSBQ9mSOfYzVjcIzX
	 H5U3e/YQ9/gs3GligVhX2xspAi1MYWw8JnDUP5qVnMWXFRzxQ+FmK2lNEPMlNumyZE
	 QbNfO1Rit/bDQ4e05VcdtSfvPNYZBaLq/PZlnM5+rQmLor12STdYDlXtZ8ZRISoCxD
	 5944M5BHw0EBLLY2PoeV33wOmQPLxbz5TKpebYF9IQWsL/pqZNeHi6MgDBbDMWAcJn
	 StyNII6qx6sgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: Add Global Clock Controller (GCC) driver
 for SM7250
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeshankar K" <sreeshankar0910@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
In-Reply-To: <20260816082801.5773-2-sreeshankar0910@gmail.com>
References: <20260816082801.5773-1-sreeshankar0910@gmail.com>
 <20260816082801.5773-2-sreeshankar0910@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 16 Aug 2026 08:42:15 +0000
Message-Id: <20260816084215.E9E4C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] gcc_cpuss_gnoc_clk is incorrectly configured with its enable_reg p=
ointing to its CBCR instead of a central vote register, and uses an invalid=
 enable_mask.
- [Low] Unused static constant arrays `gcc_parent_map_5` and `gcc_parent_da=
ta_5`.
- [Low] Incorrect space-based indentation in Kconfig block for SM_GCC_7250.
- [Low] The dt-bindings header file 'qcom,gcc-sm7250.h' is included but omi=
tted from the commit tree.
--

--- Patch [1]: [PATCH 1/2] clk: qcom: Add Global Clock Controller (GCC) dri=
ver for SM7250 ---
commit 3285603c7b98a0179a26091f983c989773cbb48c
Author: Sreeshankar K <sreeshankar0910@gmail.com>

clk: qcom: Add Global Clock Controller (GCC) driver for SM7250

Add support for the global clock controller found on SM7250
based devices. This should allow most non-multimedia device
drivers to probe and control their clocks.

> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1416,6 +1416,15 @@ config SM_GCC_7150
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS, PCIe etc.
> =20
> +config SM_GCC_7250
> +        tristate "SM7250 Global Clock Controller"
> +        depends on ARM64 || COMPILE_TEST

[Severity: Low]
This isn't a bug, but there appears to be space-based indentation instead
of tabs in this Kconfig block.

> +        select QCOM_GDSC
> +        help
> +          Support for the global clock controller on SM7250 devices.
> +          Say Y if you want to use peripheral devices such as UART,
> +          SPI, I2C, USB, SD/UFS, PCIe etc.
> +
[ ... ]
> diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7250.c
> @@ -0,0 +1,2347 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,gcc-sm7250.h>

[Severity: Low]
Is this header file missing from the commit? The dt-bindings header
qcom,gcc-sm7250.h does not appear to be included in the tree, which
might cause a build failure.

> +
> +#include "clk-alpha-pll.h"
[ ... ]
> +static const struct parent_map gcc_parent_map_5[] =3D {
> +	{ P_BI_TCXO, 0 },
> +	{ P_SLEEP_CLK, 5 },
> +};
> +
> +static const struct clk_parent_data gcc_parent_data_5[] =3D {
> +	{ .fw_name =3D "bi_tcxo" },
> +	{ .fw_name =3D "sleep_clk" },
> +};

[Severity: Low]
Are the gcc_parent_map_5 and gcc_parent_data_5 arrays used anywhere in
the driver? They seem to be defined but unreferenced, which could trigger
unused-const-variable compiler warnings.

> +
> +static const struct freq_tbl ftbl_gcc_cpuss_ahb_clk_src[] =3D {
[ ... ]
> +static struct clk_branch gcc_cpuss_gnoc_clk =3D {
> +	.halt_reg =3D 0x48064,
> +	.halt_check =3D BRANCH_HALT_VOTED,
> +	.clkr =3D {
> +		.enable_reg =3D 0x48064,
> +		.enable_mask =3D BIT(29),

[Severity: High]
Does gcc_cpuss_gnoc_clk use the correct enable_reg and enable_mask?=20

Since this clock uses BRANCH_HALT_VOTED, writing BIT(29) directly to=20
its CBCR at 0x48064 instead of a central vote register (like 0x52000)=20
might fail to properly enable the clock, potentially causing a timeout
when waiting for the halt bit to clear.

> +		.hw.init =3D &(struct clk_init_data){
> +			.name =3D "gcc_cpuss_gnoc_clk",
> +			.ops =3D &clk_branch2_ops,
> +		},
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260816082801.5773=
-1-sreeshankar0910@gmail.com?part=3D1
