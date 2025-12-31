Received: from mout.perfora.net (mout.perfora.net [74.208.4.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B516EB42;
	Wed, 31 Dec 2025 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.208.4.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767173748; cv=none; b=P6BkTBtHzIfJLsE1iLPwd2Li+aHyXbJstO6tzAHE65H5bBZxeg4Pj1bcdNoZLmd0RHGtv6oNh7DBkCH3jrXNF/RfvN0GFVGyBOc+oS+c8dSC9cP8Rz1oVpzjadH9XKcFS/BOcRJ6MWzsOcMRiNJmrvxqOoa1yayJfOcZc7L4S8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767173748; c=relaxed/simple;
	bh=PwKWx991YJAOpoPP3wiuSkYRShTv4dV8tCnsDZvDdQk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U0DeyjkFVPl5ZdQYK54v/ElADWFwBmpFepbQknLxoJS64t/HZMjk6FVitIkmXDBAfyJ10rzyQYAFLRfsQVWXdHgBBltXAvy/i3rZiRR2sFUCcu7/5ovWJP6pZhaOWPSoycF3+hx017Zn+Pc9ObuUrLcm2FnkE13QGIoQ2iIMMoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com; spf=pass smtp.mailfrom=ziswiler.com; dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b=s3h/JptC; arc=none smtp.client-ip=74.208.4.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziswiler.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziswiler.com header.i=marcel@ziswiler.com header.b="s3h/JptC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1767173702; x=1767778502; i=marcel@ziswiler.com;
	bh=PvVL2ncsWU7RGiuU0A4tqmrZmHzzJrjuXZioV97SG1w=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=s3h/JptCdzpwbRq7jxqJsK0NTUQShQ7RJR5u4ItjZEW6PECiuW5AU0IpK4MTE2xl
	 /62r7TiMacYouMGxFkOi4QqGw4h6OsC6HAd/FkFzX/UTb/lur8KhpsXU86NaSe396
	 vBYnBDfupU7sq8UzR12JBUQriv0WS53y8ztsL96Wa4ioXdc7Rv9OyxMY9n0aDm6y4
	 1L8sZCV+4vi5VTzEjm/KSCeCOBkjHbIGsW4chb2tF2DlrqPkR5t477vNSm1nm8fMP
	 e6siOmBF05IcQ/uVHhxJGxl5B8NZSryE7H8fxF32rTNkfEMh1orqF8fvvRUI6zSE/
	 RSqngu4BXCRboQX0bA==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.13.73.253] ([213.55.221.38]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0Ma0N7-1vL7fu1YFj-00TOf4;
 Wed, 31 Dec 2025 10:35:02 +0100
Message-ID: <a7f4cf00b396096512d6947612031207c4d4459b.camel@ziswiler.com>
Subject: Re: [PATCH v9 2/3] clock: eswin: Add eic7700 clock driver
From: Marcel Ziswiler <marcel@ziswiler.com>
To: dongxuyang@eswincomputing.com, mturquette@baylibre.com,
 sboyd@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 troy.mitchell@linux.dev, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, 
	ganboing@gmail.com
Date: Wed, 31 Dec 2025 10:34:53 +0100
In-Reply-To: <20251229105949.1202-1-dongxuyang@eswincomputing.com>
References: <20251229105844.1089-1-dongxuyang@eswincomputing.com>
	 <20251229105949.1202-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BaN7rnHXkX0wq3WD0gr3ovRRBuNObqrJDuhsFsnw58FRXX84XFh
 qNHE76S7KWoidbA/ZXjmdOnybirfu19TF/v3BB+xwvzvB8JKTmB41vyfsM9mMqOx1ETI375
 0KZXbZbnURS8sYfkLmefQBd2aMRMrCFzs3SRnzWPUTkK3rc9vOe5pq7f6NVDOVxY98iPUW4
 2GYip65O92Hww1uqMilCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:CiuKNwn/sg4=;DmQJ9iXWrSyYsQDvmK++d3eKYH8
 RC6QS+pSs6vpiUt6/mwxYCb8UNE45SfpevnIU4warmzQj9XEPcV7YNQAEHgyUcm6XVRb2HNrS
 RyqmOBGt1U52evmmkYSDSmSwUjnmgtAlD2qyp5quKS/FXXTtDkR9VtJa+GH7j0USWvtav+wif
 Je9DSrvzovgdb2UeDfodghN3XgdW3zjMWCN4IgmANFfy5Sx3773cmqjw4ZDbC18aLdP1pP1Ly
 QShuEQQg67fZ/3uYkmBKoDTS5tKW5kRy8AHLdzryfvo6N0MAzRE8c7NJlz4sHd+t6avR6PWgY
 upeWIul1KFMDlpOV05Y4n+T5x2dDn5gJ56KAJYLj0E/TGcmiApSqMPGHATi9vV22SAXLen8P6
 cjfkn4UZKcWmpSzZ1ln3oX80IZnxcADJJ0EXLL/N+6E/nrKZYUCvojCSJYAu/pX7B9s0MnChK
 t4PAsRSRfukyneWmLZmHnKs59us6BYedp6beBkC5dkZn/4K61hz1PagV9DS0nV3o6CCx/XUR/
 snw40jrNKSBpK/BBEfosglsU28Z/flPJMuvrtmKfHxMClwsGIUBxrKkl6LxzB0sbExJzZOFnl
 I66TkTTjK5RPV6S4tbtl6uxFOFhOFgcqhuVDYIJE8lgo1L8zAtr9bI4TrkEUxXmXL4wwYNqHF
 GKepQbe7z+xr79QF1G33bFbQrvTHJqIG8OISHo4JzH9njASVtqDLO+WsSz+7AVAaupE1KSeJj
 A8RF6dTF9vsHeDtr7KmO3ZNb0B5sXPtCS58tzuXUBwvxE6K5i/HrIUeArqZf/6IH9GAkcD0WM
 fiSA/zzPWfNpy+DyzZ3G1k0D5fFBWtEHcsGJ6wyPl4JlG82+nCBdZNLL1H1gtZ8v8Up5h4zyU
 Dq7v8YinIaAsA59qHaEx+bMTCgktSWGBnqSYXxr4k7JoUdsH83FKvi6iMSRP0IcNY8xW0KNyr
 IvC704hhH3LpTvqfwrptKT2KDdo8McFA72g+72UMZevipvLqicmDFJmHi77Qd3/n4j70OKzRv
 QB9M5nqZdxPOj6TPoaJDlylWR/XL9rtWukbh2Zgx8DEPQdTDa052MmPKQQZIbXaj2d31Gw9aM
 kKRv/sCw+u/R8v0zpoH3A97yLYafiHhGztGNscUewHViAHeYsFnoxyrI2tem52cj6z7h17+Du
 eH/Moh73LW1AvBMWwxt+6vZa+FHKVCaVqCeez2BGxOle+0CE490TFfK2rnhxoclwkp9GGxDsN
 b0kAd3BkIuDCLAHlaJZ/6IxFJEnLjJpO04VnhDIHnZrZ7CnSPVS99dgw6sy6LvUvtBhp1SBuK
 uSRe1noFSdc7cqSqKFyMnHNrdvU9Pq4DBoCuSInDqt2NmiqA53U8prbMzWGhzRnYFXEB2GemO
 0Z+S812UeTYLi95XczAHi3JzXgcBnbPDOp76H0pC51RCy5lwupeJQM1oL5B07q3BWhijoeckI
 e1QI6IBslyzh/jNsjMGuMy//d2YdjyRnyaU1HKgGL9gwlCfjntZXWDXDWjC7t0ajiMvrbriDy
 iiQskKALYWhCFi65nYA/H+ImR/1p6RMLnqSKRXhADCbHqK7N0hrR4NbeEU8MtOJKweJ++Zj+j
 YfH1ha3xJ3nhWg/ope1oBTdIWtGSBpcui6ILNKwLcP9KuG+JgYOmkIgQ+pZnD5sVgAAQjx7TR
 iGZmATPnxQ2KfOO0PNCYinklcQo32xRjlnTkbMF2KRjgjl/ksUz34xx+SBGDjYB4XF6K+HION
 V/ZZOj9i1FcCyoracQ+b7+ajyC73vBaHs8yJ5axwtVkyX2yYt5F4e//877Zp1vs8CNNw+iocd
 66Us

On Mon, 2025-12-29 at 18:59 +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
>=20
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---
> =C2=A0drivers/clk/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0drivers/clk/eswin/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 15 +
> =C2=A0drivers/clk/eswin/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=
=A0=C2=A0 8 +
> =C2=A0drivers/clk/eswin/clk-eic7700.c | 1110 ++++++++++++++++++++++++++++=
+++
> =C2=A0drivers/clk/eswin/clk-eic7700.h |=C2=A0 122 ++++
> =C2=A0drivers/clk/eswin/clk.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 396 +++++++++++
> =C2=A0drivers/clk/eswin/clk.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 266 ++++++++
> =C2=A08 files changed, 1919 insertions(+)
> =C2=A0create mode 100644 drivers/clk/eswin/Kconfig
> =C2=A0create mode 100644 drivers/clk/eswin/Makefile
> =C2=A0create mode 100644 drivers/clk/eswin/clk-eic7700.c
> =C2=A0create mode 100644 drivers/clk/eswin/clk-eic7700.h
> =C2=A0create mode 100644 drivers/clk/eswin/clk.c
> =C2=A0create mode 100644 drivers/clk/eswin/clk.h
>=20
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 3a1611008e48..2a9056d41093 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -515,6 +515,7 @@ source "drivers/clk/actions/Kconfig"
> =C2=A0source "drivers/clk/analogbits/Kconfig"
> =C2=A0source "drivers/clk/baikal-t1/Kconfig"
> =C2=A0source "drivers/clk/bcm/Kconfig"
> +source "drivers/clk/eswin/Kconfig"
> =C2=A0source "drivers/clk/hisilicon/Kconfig"
> =C2=A0source "drivers/clk/imgtec/Kconfig"
> =C2=A0source "drivers/clk/imx/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index 61ec08404442..37f6070a342e 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -121,6 +121,7 @@ obj-$(CONFIG_CLK_BAIKAL_T1)		+=3D baikal-t1/
> =C2=A0obj-y					+=3D bcm/
> =C2=A0obj-$(CONFIG_ARCH_BERLIN)		+=3D berlin/
> =C2=A0obj-$(CONFIG_ARCH_DAVINCI)		+=3D davinci/
> +obj-$(CONFIG_ARCH_ESWIN)		+=3D eswin/
> =C2=A0obj-$(CONFIG_ARCH_HISI)			+=3D hisilicon/
> =C2=A0obj-y					+=3D imgtec/
> =C2=A0obj-y					+=3D imx/
> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> new file mode 100644
> index 000000000000..86af60f852c2
> --- /dev/null
> +++ b/drivers/clk/eswin/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +config COMMON_CLK_ESWIN
> +	bool
> +
> +config COMMON_CLK_EIC7700
> +	tristate "EIC7700 Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST
> +	select COMMON_CLK_ESWIN
> +	default ARCH_ESWIN
> +	help
> +	=C2=A0 This driver provides support for clock controller on ESWIN EIC77=
00
> +	=C2=A0 SoC. The clock controller can generates and supplies clock to va=
rious
> +	=C2=A0 peripherals within the SoC.
> +	=C2=A0 Say yes here to support the clock controller on the EIC7700 SoC.
> diff --git a/drivers/clk/eswin/Makefile b/drivers/clk/eswin/Makefile
> new file mode 100644
> index 000000000000..4a7c2af82164
> --- /dev/null
> +++ b/drivers/clk/eswin/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Eswin Clock specific Makefile
> +#
> +
> +obj-$(CONFIG_COMMON_CLK_ESWIN)		+=3D clk.o
> +
> +obj-$(CONFIG_COMMON_CLK_EIC7700)	+=3D clk-eic7700.o
> diff --git a/drivers/clk/eswin/clk-eic7700.c b/drivers/clk/eswin/clk-eic7=
700.c
> new file mode 100644
> index 000000000000..0693a4ae8510
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700.c
> @@ -0,0 +1,1110 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * ESWIN EIC7700 Clk Provider Driver
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/clock/eswin,eic7700-clock.h>
> +
> +#include "clk.h"
> +#include "clk-eic7700.h"
> +
> +#define EIC7700_NR_CLKS (EIC7700_CLK_GATE_NOC_WDREF + 1)
> +
> +/* clock parent list */
> +PNAME(mux_cpu_root_3mux1_gfree_p) =3D { "clk_pll_cpu",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_u84_core_lp_div2",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "xtal24m" };
> +PNAME(mux_cpu_aclk_2mux1_gfree_p) =3D { "fixed_factor_cpu_div2",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree" };
> +PNAME(dsp_aclk_root_2mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll2_fout1=
",
> +					=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1" };
> +PNAME(d2d_aclk_root_2mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll2_fout1=
",
> +					=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1" };
> +PNAME(ddr_aclk_root_2mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll2_fout1=
",
> +					=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1" };
> +PNAME(mshcore_root_3mux1_0_mux_p) =3D { "fixed_rate_clk_spll0_fout3",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout3" };
> +PNAME(mshcore_root_3mux1_1_mux_p) =3D { "fixed_rate_clk_spll0_fout3",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout3" };
> +PNAME(mshcore_root_3mux1_2_mux_p) =3D { "fixed_rate_clk_spll0_fout3",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout3" };
> +PNAME(npu_llclk_3mux1_gfree_mux_p) =3D { "divider_npu_llc_src0_div_dynm"=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "divider_npu_llc_src1_div_dynm"=
,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout1" };
> +PNAME(npu_core_3mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll1_fout1",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout1",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout2" };
> +PNAME(npu_e31_3mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll1_fout1",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout1",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout2" };
> +PNAME(vi_aclk_root_2mux1_gfree_mux_p) =3D { "fixed_rate_clk_spll0_fout1"=
,
> +					=C2=A0 "fixed_rate_clk_spll2_fout1" };
> +PNAME(mux_vi_dw_root_2mux1_p) =3D { "fixed_rate_clk_vpll_fout1",
> +				=C2=A0 "fixed_rate_clk_spll0_fout1" };
> +PNAME(mux_vi_dvp_root_2mux1_gfree_p) =3D { "fixed_rate_clk_vpll_fout1",
> +					 "fixed_rate_clk_spll0_fout1" };
> +PNAME(mux_vi_dig_isp_root_2mux1_gfree_p) =3D { "fixed_rate_clk_vpll_fout=
1",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1" };
> +PNAME(mux_vo_aclk_root_2mux1_gfree_p) =3D { "fixed_rate_clk_spll0_fout1"=
,
> +					=C2=A0 "fixed_rate_clk_spll2_fout1" };
> +PNAME(mux_vo_pixel_root_2mux1_p) =3D { "fixed_rate_clk_vpll_fout1",
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout2" };
> +PNAME(mux_vcdec_root_2mux1_gfree_p) =3D { "fixed_rate_clk_spll0_fout1",
> +					"fixed_rate_clk_spll2_fout1" };
> +PNAME(mux_vcaclk_root_2mux1_gfree_p) =3D { "fixed_rate_clk_spll0_fout1",
> +					 "fixed_rate_clk_spll2_fout1" };
> +PNAME(mux_syscfg_clk_root_2mux1_gfree_p) =3D { "divider_sys_cfg_div_dynm=
",
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "xtal24m" };
> +PNAME(mux_bootspi_clk_2mux1_gfree_p) =3D { "divider_bootspi_div_dynm",
> +					 "xtal24m" };
> +PNAME(mux_scpu_core_clk_2mux1_gfree_p) =3D { "divider_scpu_core_div_dynm=
",
> +					=C2=A0=C2=A0 "xtal24m" };
> +PNAME(mux_lpcpu_core_clk_2mux1_gfree_p) =3D { "divider_lpcpu_core_div_dy=
nm",
> +					=C2=A0=C2=A0=C2=A0 "xtal24m" };
> +PNAME(mux_vo_mclk_2mux_ext_mclk_p) =3D { "divider_vo_mclk_div_dynm",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_ext_mclk" };
> +PNAME(mux_aondma_axi2mux1_gfree_p) =3D { "divider_aondma_axi_div_dynm",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "xtal24m" };
> +PNAME(mux_rmii_ref_2mux1_p) =3D { "fixed_factor_hsp_rmii_ref_div6",
> +				"fixed_rate_lpddr_ref_bak" };
> +PNAME(mux_eth_core_2mux1_p) =3D { "fixed_rate_clk_spll1_fout3",
> +				"fixed_rate_lpddr_ref_bak" };
> +PNAME(mux_sata_phy_2mux1_p) =3D { "divider_sata_phy_ref_div_dynm",
> +				"fixed_rate_lpddr_ref_bak" };
> +
> +/* fixed rate clocks */
> +static struct eswin_fixed_rate_clock eic7700_fixed_rate_clks[] =3D {
> +	EIC7700_FIXED(EIC7700_CLK_XTAL_32K, "fixed_rate_clk_xtal_32k", NULL, 0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32768),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL0_FOUT1, "fixed_rate_clk_spll0_fout1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 1600000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL0_FOUT2, "fixed_rate_clk_spll0_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 800000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL0_FOUT3, "fixed_rate_clk_spll0_fout3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 400000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL1_FOUT1, "fixed_rate_clk_spll1_fout1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 1500000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL1_FOUT2, "fixed_rate_clk_spll1_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 300000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL1_FOUT3, "fixed_rate_clk_spll1_fout3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 250000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL2_FOUT1, "fixed_rate_clk_spll2_fout1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 2080000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL2_FOUT2, "fixed_rate_clk_spll2_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 1040000000),
> +	EIC7700_FIXED(EIC7700_CLK_SPLL2_FOUT3, "fixed_rate_clk_spll2_fout3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 416000000),
> +	EIC7700_FIXED(EIC7700_CLK_VPLL_FOUT1, "fixed_rate_clk_vpll_fout1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 1188000000),
> +	EIC7700_FIXED(EIC7700_CLK_VPLL_FOUT2, "fixed_rate_clk_vpll_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 594000000),
> +	EIC7700_FIXED(EIC7700_CLK_VPLL_FOUT3, "fixed_rate_clk_vpll_fout3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 49500000),
> +	EIC7700_FIXED(EIC7700_CLK_APLL_FOUT2, "fixed_rate_clk_apll_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 0),
> +	EIC7700_FIXED(EIC7700_CLK_APLL_FOUT3, "fixed_rate_clk_apll_fout3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 0),
> +	EIC7700_FIXED(EIC7700_CLK_EXT_MCLK, "fixed_rate_ext_mclk", NULL, 0, 0),
> +	EIC7700_FIXED(EIC7700_CLK_LPDDR_REF_BAK, "fixed_rate_lpddr_ref_bak",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, 0, 50000000),
> +};
> +
> +/* pll clocks */
> +static struct eswin_pll_clock eic7700_pll_clks[] =3D {
> +	EIC7700_PLL(EIC7700_CLK_APLL_FOUT1, "clk_apll_fout1", NULL,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_APLL_CFG_0, 0, 1, 12, 6, 20, 12,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_APLL_CFG_1, 4, 24,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_APLL_CFG_2, 1, 3, 16, 3,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PLL_STATUS, 4, 1, APLL_HIGH_FREQ=
,
> +		=C2=A0=C2=A0=C2=A0 APLL_LOW_FREQ),
> +	EIC7700_PLL(EIC7700_CLK_PLL_CPU, "clk_pll_cpu", NULL,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MCPUT_PLL_CFG_0, 0, 1, 12, 6, 20=
, 12,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MCPUT_PLL_CFG_1, 4, 24,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MCPUT_PLL_CFG_2, 1, 3, 16, 3,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PLL_STATUS, 5, 1, PLL_HIGH_FREQ,
> +		=C2=A0=C2=A0=C2=A0 PLL_LOW_FREQ),
> +};
> +
> +/* fixed factor clocks */
> +static struct eswin_fixed_factor_clock eic7700_fixed_factor_clks[] =3D {
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_CPU_DIV2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_cpu_div2", "mux_cpu=
_root_3mux1_gfree", 1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_CLK_1M_DIV24,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_clk_1m_div24", "xta=
l24m", 1, 24, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_MIPI_TXESC_DIV10,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_mipi_txesc_div10",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree"=
, 1, 10, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_U84_CORE_LP_DIV2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_u84_core_lp_div2", =
"gate_clk_spll0_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1, 2, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_SCPU_BUS_DIV2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_scpu_bus_div2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_scpu_core_clk_2mux1_gfree", =
1, 2, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_LPCPU_BUS_DIV2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_lpcpu_bus_div2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_lpcpu_core_clk_2mux1_gfree",=
 1, 2, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_PCIE_CR_DIV2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pcie_cr_div2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree"=
, 1, 2, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_PCIE_AUX_DIV4,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pcie_aux_div4",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree"=
, 1, 4, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_PVT_DIV20,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pvt_div20", "xtal24=
m", 1, 20, 0),
> +	EIC7700_FACTOR(EIC7700_CLK_FIXED_FACTOR_HSP_RMII_REF_DIV6,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_hsp_rmii_ref_div6",
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll1_fout2", 1, =
6, 0),
> +};
> +
> +/* mux clocks */
> +static struct eswin_mux_clock eic7700_mux_clks[] =3D {
> +	EIC7700_MUX(EIC7700_CLK_MUX_CPU_ROOT_3MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree", mux_cpu_root_3mux1_gfre=
e_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_cpu_root_3mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_CTRL, 0=
, 2, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_CPU_ACLK_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_cpu_aclk_2mux1_gfree", mux_cpu_aclk_2mux1_gfre=
e_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_cpu_aclk_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_CTRL, 2=
0, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_DSP_ACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_dsp_aclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 dsp_aclk_root_2mux1_gfree_mux_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(dsp_aclk_root_2mux1_gfree_mux_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_DSP_ACLK_CT=
RL, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_D2D_ACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_d2d_aclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 d2d_aclk_root_2mux1_gfree_mux_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(d2d_aclk_root_2mux1_gfree_mux_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_D2D_ACLK_CT=
RL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_DDR_ACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_ddr_aclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 ddr_aclk_root_2mux1_gfree_mux_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(ddr_aclk_root_2mux1_gfree_mux_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_DDR_CTRL, 1=
6, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_MSHCORE_ROOT_3MUX1_0,
> +		=C2=A0=C2=A0=C2=A0 "mux_mshcore_root_3mux1_0", mshcore_root_3mux1_0_mu=
x_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mshcore_root_3mux1_0_mux_p), CLK_SET_RAT=
E_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MSHC0_CORE_CTRL, 0, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_MSHCORE_ROOT_3MUX1_1,
> +		=C2=A0=C2=A0=C2=A0 "mux_mshcore_root_3mux1_1", mshcore_root_3mux1_1_mu=
x_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mshcore_root_3mux1_1_mux_p), CLK_SET_RAT=
E_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MSHC1_CORE_CTRL, 0, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_MSHCORE_ROOT_3MUX1_2,
> +		=C2=A0=C2=A0=C2=A0 "mux_mshcore_root_3mux1_2", mshcore_root_3mux1_2_mu=
x_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mshcore_root_3mux1_2_mux_p), CLK_SET_RAT=
E_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_MSHC2_CORE_CTRL, 0, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_NPU_LLCLK_3MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_npu_llclk_3mux1_gfree", npu_llclk_3mux1_gfree_=
mux_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(npu_llclk_3mux1_gfree_mux_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_NPU_LLC_CTR=
L, 0, 2,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_NPU_CORE_3MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_npu_core_3mux1_gfree", npu_core_3mux1_gfree_mu=
x_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(npu_core_3mux1_gfree_mux_p), CLK_SET_RAT=
E_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_CORE_CTRL, 0, 2, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_NPU_E31_3MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_npu_e31_3mux1_gfree", npu_e31_3mux1_gfree_mux_=
p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(npu_e31_3mux1_gfree_mux_p), CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_CORE_CTRL, 8, 2, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VI_ACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_aclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 vi_aclk_root_2mux1_gfree_mux_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(vi_aclk_root_2mux1_gfree_mux_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VI_ACLK_CTR=
L, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VI_DW_ROOT_2MUX1, "mux_vi_dw_root_2mux1",
> +		=C2=A0=C2=A0=C2=A0 mux_vi_dw_root_2mux1_p, ARRAY_SIZE(mux_vi_dw_root_2=
mux1_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VI_DWCLK_CT=
RL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VI_DVP_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_dvp_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_vi_dvp_root_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vi_dvp_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VI_DVP_CTRL=
, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VI_DIG_ISP_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_dig_isp_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_vi_dig_isp_root_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vi_dig_isp_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VI_DIG_ISP_=
CTRL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VO_ACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vo_aclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_vo_aclk_root_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vo_aclk_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VO_ACLK_CTR=
L, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VO_PIXEL_ROOT_2MUX1,
> +		=C2=A0=C2=A0=C2=A0 "mux_vo_pixel_root_2mux1", mux_vo_pixel_root_2mux1_=
p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vo_pixel_root_2mux1_p), CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_PIXEL_CTRL, 0, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VCDEC_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vcdec_root_2mux1_gfree", mux_vcdec_root_2mux1_=
gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vcdec_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VCDEC_ROOT_=
CTRL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VCACLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_vcaclk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_vcaclk_root_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vcaclk_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VC_ACLK_CTR=
L, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_SYSCFG_CLK_ROOT_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_syscfg_clk_root_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_syscfg_clk_root_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_SYSCFG_CTRL=
, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_BOOTSPI_CLK_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_bootspi_clk_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_bootspi_clk_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_bootspi_clk_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_BOOTSPI_CTR=
L, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_SCPU_CORE_CLK_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_scpu_core_clk_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_scpu_core_clk_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_scpu_core_clk_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_SCPU_CORE_C=
TRL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_LPCPU_CORE_CLK_2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_lpcpu_core_clk_2mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0 mux_lpcpu_core_clk_2mux1_gfree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_lpcpu_core_clk_2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_LPCPU_CORE_=
CTRL, 0,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_VO_MCLK_2MUX_EXT_MCLK,
> +		=C2=A0=C2=A0=C2=A0 "mux_vo_mclk_2mux_ext_mclk", mux_vo_mclk_2mux_ext_m=
clk_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_vo_mclk_2mux_ext_mclk_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VO_MCLK_CTR=
L, 0, 1,
> +		=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_AONDMA_AXI2MUX1_GFREE,
> +		=C2=A0=C2=A0=C2=A0 "mux_aondma_axi2mux1_gfree", mux_aondma_axi2mux1_gf=
ree_p,
> +		=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(mux_aondma_axi2mux1_gfree_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_AON_DMA_CTR=
L, 20,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_RMII_REF_2MUX, "mux_rmii_ref_2mux1",
> +		=C2=A0=C2=A0=C2=A0 mux_rmii_ref_2mux1_p, ARRAY_SIZE(mux_rmii_ref_2mux1=
_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_ETH0_CTRL, =
2, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_ETH_CORE_2MUX1, "mux_eth_core_2mux1",
> +		=C2=A0=C2=A0=C2=A0 mux_eth_core_2mux1_p, ARRAY_SIZE(mux_eth_core_2mux1=
_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_ETH0_CTRL, =
1, 1, 0),
> +	EIC7700_MUX(EIC7700_CLK_MUX_SATA_PHY_2MUX1, "mux_sata_phy_2mux1",
> +		=C2=A0=C2=A0=C2=A0 mux_sata_phy_2mux1_p, ARRAY_SIZE(mux_sata_phy_2mux1=
_p),
> +		=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_SATA_OOB_CT=
RL, 9,
> +		=C2=A0=C2=A0=C2=A0 1, 0),
> +};
> +
> +/* divider clocks */
> +static struct eswin_divider_clock eic7700_div_clks[] =3D {
> +	EIC7700_DIV(EIC7700_CLK_DIV_SYS_CFG_DYNM, "divider_sys_cfg_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout3", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SYSCFG_CTRL, 4, 3,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NOC_NSP_DYNM, "divider_noc_nsp_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NOC_CTRL, 0, 3, CLK_DIVIDER_ONE_=
BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_BOOTSPI_DYNM, "divider_bootspi_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "gate_clk_spll0_fout2", 0, EIC7700_REG_OFFSET_BOOTS=
PI_CTRL,
> +		=C2=A0=C2=A0=C2=A0 4, 6, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_SCPU_CORE_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_scpu_core_div_dynm", "fixed_rate_clk_spll0=
_fout1",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_SCPU_CORE_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_LPCPU_CORE_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_lpcpu_core_div_dynm", "fixed_rate_clk_spll=
0_fout1",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_LPCPU_CORE_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),

During testing on top of next-20251219 I got the following:

[    0.126102] divider_lpcpu_core_div_dynm: Zero divisor and CLK_DIVIDER_AL=
LOW_ZERO not set
[    0.126194] WARNING: drivers/clk/clk-divider.c:145 at divider_recalc_rat=
e+0x8a/0x9c, CPU#0: swapper/0/1

Therefore I suggest for above line needing to be:

+                   CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZERO),

> +	EIC7700_DIV(EIC7700_CLK_DIV_GPU_ACLK_DYNM, "divider_gpu_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_GPU_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_D2D_ACLK_DYNM, "divider_d2d_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_d2d_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_D2D_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DSP_ACLK_DYNM, "divider_dsp_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_d2d_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_D2D_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DDR_ACLK_DYNM, "divider_ddr_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_ddr_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 20, 4, CLK_DIVIDER_ONE=
_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_HSP_ACLK_DYNM, "divider_hsp_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_HSP_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_ETH_TXCLK_DYNM_0,
> +		=C2=A0=C2=A0=C2=A0 "divider_eth_txclk_div_dynm_0", "mux_eth_core_2mux1=
", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_ETH0_CTRL, 4, 7, CLK_DIVIDER_ONE=
_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_ETH_TXCLK_DYNM_1,
> +		=C2=A0=C2=A0=C2=A0 "divider_eth_txclk_div_dynm_1", "mux_eth_core_2mux1=
", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_ETH1_CTRL, 4, 7, CLK_DIVIDER_ONE=
_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_MSHC_CORE_DYNM_0,
> +		=C2=A0=C2=A0=C2=A0 "divider_mshc_core_div_dynm_0", "mux_mshcore_root_3=
mux1_0",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_MSHC0_CORE_CTRL, 4, 12,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST),
> +	EIC7700_DIV(EIC7700_CLK_DIV_MSHC_CORE_DYNM_1,
> +		=C2=A0=C2=A0=C2=A0 "divider_mshc_core_div_dynm_1", "mux_mshcore_root_3=
mux1_1",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_MSHC1_CORE_CTRL, 4, 12,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST),
> +	EIC7700_DIV(EIC7700_CLK_DIV_MSHC_CORE_DYNM_2,
> +		=C2=A0=C2=A0=C2=A0 "divider_mshc_core_div_dynm_2", "mux_mshcore_root_3=
mux1_2",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_MSHC2_CORE_CTRL, 4, 12,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST),
> +	EIC7700_DIV(EIC7700_CLK_DIV_PCIE_ACLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_pcie_aclk_div_dynm", "fixed_rate_clk_spll2=
_fout2",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_PCIE_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NPU_ACLK_DYNM, "divider_npu_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_ACLK_CTRL, 4,=C2=A0 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NPU_LLC_SRC0_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_npu_llc_src0_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_LLC_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NPU_LLC_SRC1_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_npu_llc_src1_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll2_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_LLC_CTRL, 8, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NPU_CORECLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_npu_coreclk_div_dynm", "mux_npu_core_3mux1=
_gfree",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_NPU_CORE_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NPU_E31_DYNM, "divider_npu_e31_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_npu_e31_3mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_CORE_CTRL, 12, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_ACLK_DYNM, "divider_vi_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_DW_DYNM, "divider_vi_dw_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_dw_root_2mux1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DWCLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_DVP_DYNM, "divider_vi_dvp_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_dvp_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DVP_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_DIG_ISP_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_dig_isp_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vi_dig_isp_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DIG_ISP_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_0,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_0",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER0, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_1,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_1",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER1, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_2,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_2",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER2, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_3,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_3",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER3, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_4,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_4",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER4, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VI_SHUTTER_DYNM_5,
> +		=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_5",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER5, 4, 7,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VO_ACLK_DYNM, "divider_vo_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vo_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_IESMCLK_DYNM, "divider_iesmclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout3", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_IESMCLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VO_PIXEL_DYNM, "divider_vo_pixel_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vo_pixel_root_2mux1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_PIXEL_CTRL, 4, 6,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VO_MCLK_DYNM, "divider_vo_mclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "clk_apll_fout1", 0, EIC7700_REG_OFFSET_VO_MCLK_CTR=
L, 4, 8,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VO_CEC_DYNM, "divider_vo_cec_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_PHY_CLKCTRL, 16, 16,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ROUND_CLOSEST),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VC_ACLK_DYNM, "divider_vc_aclk_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vcaclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_ACLK_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_JD_DYNM, "divider_jd_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vcdec_root_2mux1_gfree", 0, EIC7700_REG_OFFSET=
_JD_CTRL,
> +		=C2=A0=C2=A0=C2=A0 4, 4, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_JE_DYNM, "divider_je_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vcdec_root_2mux1_gfree", 0, EIC7700_REG_OFFSET=
_JE_CTRL,
> +		=C2=A0=C2=A0=C2=A0 4, 4, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VE_DYNM, "divider_ve_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vcdec_root_2mux1_gfree", 0, EIC7700_REG_OFFSET=
_VE_CTRL,
> +		=C2=A0=C2=A0=C2=A0 4, 4, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_VD_DYNM, "divider_vd_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_vcdec_root_2mux1_gfree", 0, EIC7700_REG_OFFSET=
_VD_CTRL,
> +		=C2=A0=C2=A0=C2=A0 4, 4, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_G2D_DYNM, "divider_g2d_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "mux_dsp_aclk_root_2mux1_gfree", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_G2D_CTRL, 4, 4, CLK_DIVIDER_ONE_=
BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_AONDMA_AXI_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_aondma_axi_div_dynm", "fixed_rate_clk_spll=
0_fout1",
> +		=C2=A0=C2=A0=C2=A0 0, EIC7700_REG_OFFSET_AON_DMA_CTRL, 4, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_CRYPTO_DYNM, "divider_crypto_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout1", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SPACC_CTRL, 4, 4, CLK_DIVIDER_ON=
E_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_SATA_PHY_REF_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_sata_phy_ref_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll1_fout2", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SATA_OOB_CTRL, 0, 4,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DSP_0_ACLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_dsp_0_aclk_div_dynm", "gate_dspt_aclk", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_CFG_CTRL, 19, 1, 0),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DSP_1_ACLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_dsp_1_aclk_div_dynm", "gate_dspt_aclk", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_CFG_CTRL, 20, 1, 0),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DSP_2_ACLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_dsp_2_aclk_div_dynm", "gate_dspt_aclk", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_CFG_CTRL, 21, 1, 0),
> +	EIC7700_DIV(EIC7700_CLK_DIV_DSP_3_ACLK_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_dsp_3_aclk_div_dynm", "gate_dspt_aclk", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_CFG_CTRL, 22, 1, 0),
> +	EIC7700_DIV(EIC7700_CLK_DIV_AON_RTC_DYNM, "divider_aon_rtc_div_dynm",
> +		=C2=A0=C2=A0=C2=A0 "fixed_factor_clk_1m_div24", 0, EIC7700_REG_OFFSET_=
RTC_CTRL,
> +		=C2=A0=C2=A0=C2=A0 21, 11, CLK_DIVIDER_ONE_BASED),
> +	EIC7700_DIV(EIC7700_CLK_DIV_U84_RTC_TOGGLE_DYNM,
> +		=C2=A0=C2=A0=C2=A0 "divider_u84_rtc_toggle_dynm", "xtal24m", 0,
> +		=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_RTC_CTRL, 16, 5,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST),
> +	EIC7700_DIV(EIC7700_CLK_DIV_NOC_WDREF_DYNM, "divider_noc_wdref_dynm",
> +		=C2=A0=C2=A0=C2=A0 "xtal24m", 0, EIC7700_REG_OFFSET_NOC_CTRL, 4, 16,
> +		=C2=A0=C2=A0=C2=A0 CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ROUND_CLOSEST),
> +};
> +
> +/* gate clocks */
> +static struct eswin_gate_clock eic7700_gate_clks[] =3D {
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_EXT_SRC_CORE_CLK_0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_ext_src_core_clk_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_U84_CTRL, 28, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_EXT_SRC_CORE_CLK_1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_ext_src_core_clk_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_U84_CTRL, 29, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_EXT_SRC_CORE_CLK_2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_ext_src_core_clk_2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_U84_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_EXT_SRC_CORE_CLK_3,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_ext_src_core_clk_3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_cpu_root_3mux1_gfree", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_U84_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_TRACE_CLK_0,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_trace_clk_0", "mux_cpu_root_3mu=
x1_gfree",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_C=
TRL, 24, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_TRACE_CLK_1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_trace_clk_1", "mux_cpu_root_3mu=
x1_gfree",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_C=
TRL, 25, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_TRACE_CLK_2,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_trace_clk_2", "mux_cpu_root_3mu=
x1_gfree",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_C=
TRL, 26, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_TRACE_CLK_3,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_trace_clk_3", "mux_cpu_root_3mu=
x1_gfree",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_C=
TRL, 27, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CPU_TRACE_COM_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_cpu_trace_com_clk", "mux_cpu_aclk_2=
mux1_gfree",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_U84_C=
TRL, 23, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_SPLL0_FOUT2, "gate_clk_spll0_fout2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll0_fout2", CLK_SET_RATE_PA=
RENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SPLL0_CFG_2, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NOC_NSP_CLK, "gate_noc_nsp_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_noc_nsp_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NOC_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_BOOTSPI, "gate_clk_bootspi",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_bootspi_clk_2mux1_gfree", CLK_SET_RATE_P=
ARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_BOOTSPI_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_BOOTSPI_CFG, "gate_clk_bootspi_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_BOOTSPI_CFGCLK_CTRL, 31, 0=
),
> +	EIC7700_GATE(EIC7700_CLK_GATE_SCPU_CORE, "gate_clk_scpu_core",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_scpu_core_clk_2mux1_gfree", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SCPU_CORE_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_SCPU_BUS, "gate_clk_scpu_bus",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_scpu_bus_div2", CLK_SET_RATE_PA=
RENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SCPU_BUSCLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LPCPU_CORE, "gate_clk_lpcpu_core",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_lpcpu_core_clk_2mux1_gfree", CLK_SET_RAT=
E_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LPCPU_CORE_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LPCPU_BUS, "gate_clk_lpcpu_bus",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_lpcpu_bus_div2", CLK_SET_RATE_P=
ARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LPCPU_BUSCLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_GPU_ACLK, "gate_gpu_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_gpu_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_GPU_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_GPU_GRAY_CLK, "gate_gpu_gray_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "xtal24m", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_GPU_GRAY_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_GPU_CFG_CLK, "gate_gpu_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_GPU_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DSPT_ACLK, "gate_dspt_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_dsp_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DSPT_CFG_CLK, "gate_dspt_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DSP_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_D2D_ACLK, "gate_d2d_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_d2d_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_D2D_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_D2D_CFG_CLK, "gate_d2d_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_D2D_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TCU_ACLK, "gate_tcu_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TCU_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TCU_CFG_CLK, "gate_tcu_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TCU_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT_CFG_CLK, "gate_ddrt_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 9, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT0_P0_ACLK, "gate_ddrt0_p0_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 4, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT0_P1_ACLK, "gate_ddrt0_p1_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 5, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT0_P2_ACLK, "gate_ddrt0_p2_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 6, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT0_P3_ACLK, "gate_ddrt0_p3_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 7, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT0_P4_ACLK, "gate_ddrt0_p4_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 8, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT1_P0_ACLK, "gate_ddrt1_p0_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 4, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT1_P1_ACLK, "gate_ddrt1_p1_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 5, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT1_P2_ACLK, "gate_ddrt1_p2_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 6, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT1_P3_ACLK, "gate_ddrt1_p3_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 7, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDRT1_P4_ACLK, "gate_ddrt1_p4_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 8, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_ACLK, "gate_clk_hsp_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_hsp_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_HSP_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_CFG_CLK, "gate_clk_hsp_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_HSP_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_PCIET_ACLK, "gate_pciet_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_pcie_aclk_div_dynm", CLK_SET_RATE_PA=
RENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PCIE_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_PCIET_CFG_CLK, "gate_pciet_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PCIE_CFG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_PCIET_CR_CLK, "gate_pciet_cr_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pcie_cr_div2", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PCIE_CFG_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_PCIET_AUX_CLK, "gate_pciet_aux_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pcie_aux_div4", CLK_SET_RATE_PA=
RENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PCIE_CFG_CTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NPU_ACLK, "gate_npu_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_npu_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NPU_CFG_CLK, "gate_npu_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_ACLK_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NPU_LLC_ACLK, "gate_npu_llc_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_npu_llclk_3mux1_gfree", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_LLC_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NPU_CLK, "gate_npu_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_npu_coreclk_div_dynm", CLK_SET_RATE_=
PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_CORE_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NPU_E31_CLK, "gate_npu_e31_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_npu_e31_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NPU_CORE_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_ACLK, "gate_vi_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_aclk_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_CFG_CLK, "gate_vi_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_ACLK_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_DIG_DW_CLK, "gate_vi_dig_dw_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_dw_div_dynm", CLK_SET_RATE_PARENT=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DWCLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_DVP_CLK, "gate_vi_dvp_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_dvp_div_dynm", CLK_SET_RATE_PAREN=
T,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DVP_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_DIG_ISP_CLK, "gate_vi_dig_isp_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_dig_isp_div_dynm", CLK_SET_RATE_P=
ARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_DIG_ISP_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_0, "gate_vi_shutter_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_0", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER0, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_1, "gate_vi_shutter_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_1", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER1, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_2, "gate_vi_shutter_2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_2", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER2, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_3, "gate_vi_shutter_3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_3", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER3, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_4, "gate_vi_shutter_4",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_4", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER4, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_SHUTTER_5, "gate_vi_shutter_5",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vi_shutter_div_dynm_5", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_SHUTTER5, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_PHY_TXCLKESC, "gate_vi_phy_txclkesc",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_mipi_txesc_div10", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VI_PHY_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VI_PHY_CFG, "gate_vi_phy_cfg", "xtal24m",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_VI_PH=
Y_CTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_ACLK, "gate_vo_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vo_aclk_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_CFG_CLK, "gate_vo_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_ACLK_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_HDMI_IESMCLK, "gate_vo_hdmi_iesmclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_iesmclk_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_IESMCLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_PIXEL_CLK, "gate_vo_pixel_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vo_pixel_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_PIXEL_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_I2S_MCLK, "gate_vo_i2s_mclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_vo_mclk_2mux_ext_mclk", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_MCLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VO_CR_CLK, "gate_vo_cr_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_mipi_txesc_div10", CLK_SET_RATE=
_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VO_PHY_CLKCTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_ACLK, "gate_vc_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vc_aclk_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_ACLK_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_CFG_CLK, "gate_vc_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_JE_CLK, "gate_vc_je_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_je_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_JE_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_JD_CLK, "gate_vc_jd_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_jd_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_JD_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_VE_CLK, "gate_vc_ve_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ve_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VE_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_VD_CLK, "gate_vc_vd_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_vd_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VD_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_G2D_CFG_CLK, "gate_g2d_cfg_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_G2D_CTRL, 28, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_G2D_CLK, "gate_g2d_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_g2d_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_G2D_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_G2D_ACLK, "gate_g2d_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_g2d_div_dynm", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_G2D_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_AONDMA_CFG, "gate_clk_aondma_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_AON_DMA_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_AONDMA_ACLK, "gate_aondma_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_aondma_axi2mux1_gfree", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_AON_DMA_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_AON_ACLK, "gate_aon_aclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_aondma_axi2mux1_gfree", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_AON_DMA_CTRL, 29, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_CLK_0, "gate_time_clk_0", "xtal24m"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_TIMER=
_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_CLK_1, "gate_time_clk_1", "xtal24m"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_TIMER=
_CTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_CLK_2, "gate_time_clk_2", "xtal24m"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_TIMER=
_CTRL, 2, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_CLK_3, "gate_time_clk_3", "xtal24m"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_TIMER=
_CTRL, 3, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_PCLK_0, "gate_timer_pclk_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TIMER_CTRL, 4, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_PCLK_1, "gate_timer_pclk_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TIMER_CTRL, 5, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_PCLK_2, "gate_timer_pclk_2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TIMER_CTRL, 6, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER_PCLK_3, "gate_timer_pclk_3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TIMER_CTRL, 7, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TIMER3_CLK8, "gate_timer3_clk8",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_vpll_fout3", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TIMER_CTRL, 8, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_RTC_CFG, "gate_clk_rtc_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_RTC_CTRL, 2, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_RTC, "gate_clk_rtc",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_aon_rtc_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_RTC_CTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_PKA_CFG, "gate_clk_pka_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_PKA_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_SPACC_CFG, "gate_clk_spacc_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SPACC_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_CRYPTO, "gate_clk_crypto",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_crypto_div_dynm", CLK_SET_RATE_PAREN=
T,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SPACC_CTRL, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_TRNG_CFG, "gate_clk_trng_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_TRNG_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_OTP_CFG, "gate_clk_otp_cfg",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_OTP_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_0, "gate_clk_mailbox_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_1, "gate_clk_mailbox_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_2, "gate_clk_mailbox_2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 2, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_3, "gate_clk_mailbox_3",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 3, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_4, "gate_clk_mailbox_4",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 4, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_5, "gate_clk_mailbox_5",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 5, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_6, "gate_clk_mailbox_6",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 6, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_7, "gate_clk_mailbox_7",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 7, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_8, "gate_clk_mailbox_8",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 8, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_9, "gate_clk_mailbox_9",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 9, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_10, "gate_clk_mailbox_10",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 10, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_11, "gate_clk_mailbox_11",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 11, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_12, "gate_clk_mailbox_12",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 12, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_13, "gate_clk_mailbox_13",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 13, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_14, "gate_clk_mailbox_14",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 14, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_MAILBOX_15, "gate_clk_mailbox_15",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 15, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C0_PCLK, "gate_i2c0_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 7, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C1_PCLK, "gate_i2c1_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 8, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C2_PCLK, "gate_i2c2_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 9, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C3_PCLK, "gate_i2c3_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 10, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C4_PCLK, "gate_i2c4_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 11, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C5_PCLK, "gate_i2c5_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 12, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C6_PCLK, "gate_i2c6_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 13, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C7_PCLK, "gate_i2c7_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 14, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C8_PCLK, "gate_i2c8_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 15, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_I2C9_PCLK, "gate_i2c9_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 16, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_WDT0_PCLK, "gate_lsp_wdt0_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 28, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_WDT1_PCLK, "gate_lsp_wdt1_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 29, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_WDT2_PCLK, "gate_lsp_wdt2_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 30, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_WDT3_PCLK, "gate_lsp_wdt3_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_SSI0_PCLK, "gate_lsp_ssi0_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 26, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_SSI1_PCLK, "gate_lsp_ssi1_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 27, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_UART0_PCLK, "gate_lsp_uart0_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 17, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_UART1_PCLK, "gate_lsp_uart1_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 18, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_UART2_PCLK, "gate_lsp_uart2_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 19, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_UART3_PCLK, "gate_lsp_uart3_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 20, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_UART4_PCLK, "gate_lsp_uart4_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 21, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_TIMER_PCLK, "gate_lsp_timer_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 25, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_FAN_PCLK, "gate_lsp_fan_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_PVT_PCLK, "gate_lsp_pvt_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN0, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_PVT0_CLK, "gate_pvt0_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pvt_div20", CLK_SET_RATE_PARENT=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 16, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_LSP_PVT1_CLK, "gate_pvt1_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_factor_pvt_div20", CLK_SET_RATE_PARENT=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_LSP_EN1, 17, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_JE_PCLK, "gate_vc_je_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 2, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_JD_PCLK, "gate_vc_jd_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 1, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_VE_PCLK, "gate_vc_ve_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 5, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_VD_PCLK, "gate_vc_vd_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 4, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_VC_MON_PCLK, "gate_vc_mon_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_VC_CLKEN_CTRL, 3, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_MSHC0_CORE_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_mshc0_core_clk", "divider_mshc_core=
_div_dynm_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_MSHC0=
_CORE_CTRL,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 16, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_MSHC1_CORE_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_mshc1_core_clk", "divider_mshc_core=
_div_dynm_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_MSHC1=
_CORE_CTRL,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 16, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_MSHC2_CORE_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_mshc2_core_clk", "divider_mshc_core=
_div_dynm_2",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_MSHC2=
_CORE_CTRL,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 16, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_SATA_RBC_CLK, "gate_hsp_sata_rbc_clk"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "fixed_rate_clk_spll1_fout2", CLK_SET_RATE_PA=
RENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SATA_RBC_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_SATA_OOB_CLK, "gate_hsp_sata_oob_clk"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_sata_phy_2mux1", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_SATA_OOB_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_DMA0_CLK_TEST,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_dma0_clk_test", "gate_clk_hsp_aclk"=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_HSP_A=
CLK_CTRL, 1,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_DMA0_CLK, "gate_hsp_dma0_clk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_clk_hsp_aclk", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_HSP_ACLK_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_ETH0_CORE_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_eth0_core_clk", "divider_eth_txclk_=
div_dynm_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_ETH0_=
CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_ETH1_CORE_CLK,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "gate_hsp_eth1_core_clk", "divider_eth_txclk_=
div_dynm_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 CLK_SET_RATE_PARENT, EIC7700_REG_OFFSET_ETH1_=
CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_RMII_REF_0, "gate_hsp_rmii_ref_0",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_rmii_ref_2mux1", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_ETH0_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_HSP_RMII_REF_1, "gate_hsp_rmii_ref_1",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_rmii_ref_2mux1", CLK_SET_RATE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_ETH1_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_AON_I2C0_PCLK, "gate_aon_i2c0_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_I2C0_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_AON_I2C1_PCLK, "gate_aon_i2c1_pclk",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "mux_syscfg_clk_root_2mux1_gfree", CLK_SET_RA=
TE_PARENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_I2C1_CTRL, 31, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDR0_TRACE, "gate_ddr0_trace",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_DDR1_TRACE, "gate_ddr1_trace",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_ddr_aclk_div_dynm", CLK_SET_RATE_PAR=
ENT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_DDR1_CTRL, 0, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_RNOC_NSP, "gate_rnoc_nsp",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_noc_nsp_div_dynm", CLK_SET_RATE_PARE=
NT,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NOC_CTRL, 29, 0),
> +	EIC7700_GATE(EIC7700_CLK_GATE_NOC_WDREF, "gate_noc_wdref",
> +		=C2=A0=C2=A0=C2=A0=C2=A0 "divider_noc_wdref_dynm", CLK_SET_RATE_PARENT=
,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 EIC7700_REG_OFFSET_NOC_CTRL, 30, 0),
> +};
> +
> +/*
> + * This clock notifier is called when the rate of clk_pll_cpu clock is t=
o be
> + * changed. The mux_cpu_root_3mux1_gfree clock should save the current p=
arent
> + * clock and switch its parent clock to fixed_factor_u84_core_lp_div2 be=
fore
> + * clk_pll_cpu rate will be changed. Then switch its parent clock back a=
fter
> + * the clk_pll_cpu rate is completed.
> + */
> +static int eic7700_clk_pll_cpu_notifier_cb(struct notifier_block *nb,
> +					=C2=A0=C2=A0 unsigned long action, void *data)
> +{
> +	struct eswin_clock_data *pdata;
> +	struct clk_hw *mux_clk;
> +	struct clk_hw *lp_clk;
> +	int ret =3D 0;
> +
> +	pdata =3D container_of(nb, struct eswin_clock_data, pll_nb);
> +	mux_clk =3D pdata->clk_data.hws[EIC7700_CLK_MUX_CPU_ROOT_3MUX1_GFREE];
> +	lp_clk =3D pdata->clk_data.hws[EIC7700_CLK_FIXED_FACTOR_U84_CORE_LP_DIV=
2];
> +
> +	if (action =3D=3D PRE_RATE_CHANGE) {
> +		pdata->original_clk =3D clk_hw_get_parent(mux_clk);
> +		ret =3D clk_hw_set_parent(mux_clk, lp_clk);
> +	} else if (action =3D=3D POST_RATE_CHANGE) {
> +		ret =3D clk_hw_set_parent(mux_clk, pdata->original_clk);
> +	}
> +
> +	return notifier_from_errno(ret);
> +}
> +
> +static int eic7700_clk_probe(struct platform_device *pdev)
> +{
> +	struct eswin_clock_data *clk_data;
> +	struct device *dev =3D &pdev->dev;
> +	struct clk *pll_clk;
> +	int ret;
> +
> +	clk_data =3D eswin_clk_init(dev, EIC7700_NR_CLKS);
> +	if (!clk_data)
> +		return dev_err_probe(dev, -EAGAIN, "failed to get clk data!\n");
> +
> +	ret =3D eswin_clk_register_fixed_rate(eic7700_fixed_rate_clks,
> +					=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(eic7700_fixed_rate_clks),
> +					=C2=A0=C2=A0=C2=A0 clk_data, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eswin_clk_register_pll(eic7700_pll_clks,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(eic7700_pll_clks),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 clk_data, dev);
> +	if (ret)
> +		return ret;
> +
> +	pll_clk =3D devm_clk_hw_get_clk
> +		(dev, clk_data->clk_data.hws[EIC7700_CLK_PLL_CPU],
> +		"clk_pll_cpu");
> +	if (IS_ERR(pll_clk))
> +		return dev_err_probe(dev, PTR_ERR(pll_clk),
> +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to get pll clock\n");
> +
> +	clk_data->pll_nb.notifier_call =3D eic7700_clk_pll_cpu_notifier_cb;
> +	ret =3D devm_clk_notifier_register(dev, pll_clk, &clk_data->pll_nb);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eswin_clk_register_fixed_factor
> +		(eic7700_fixed_factor_clks,
> +		ARRAY_SIZE(eic7700_fixed_factor_clks), clk_data, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eswin_clk_register_mux(eic7700_mux_clks,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(eic7700_mux_clks), clk_data,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eswin_clk_register_divider(eic7700_div_clks,
> +					 ARRAY_SIZE(eic7700_div_clks),
> +					 clk_data, dev);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D eswin_clk_register_gate(eic7700_gate_clks,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ARRAY_SIZE(eic7700_gate_clks), clk_da=
ta,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					=C2=A0=C2=A0 &clk_data->clk_data);
> +}
> +
> +static const struct of_device_id eic7700_clock_dt_ids[] =3D {
> +	{ .compatible =3D "eswin,eic7700-clock", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, eic7700_clock_dt_ids);
> +
> +static struct platform_driver eic7700_clock_driver =3D {
> +	.probe	=3D eic7700_clk_probe,
> +	.driver =3D {
> +		.name	=3D "eic7700-clock",
> +		.of_match_table	=3D eic7700_clock_dt_ids,
> +	},
> +};
> +module_platform_driver(eic7700_clock_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Yifeng Huang<huangyifeng@eswincomputing.com>");
> +MODULE_AUTHOR("Xuyang Dong<dongxuyang@eswincomputing.com>");
> +MODULE_DESCRIPTION("ESWIN EIC7700 clock controller driver");
> diff --git a/drivers/clk/eswin/clk-eic7700.h b/drivers/clk/eswin/clk-eic7=
700.h
> new file mode 100644
> index 000000000000..625b12306aa3
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700.h
> @@ -0,0 +1,122 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#ifndef __CLK_EIC7700_H__
> +#define __CLK_EIC7700_H__
> +
> +/* REG OFFSET OF SYS-CRG */
> +#define EIC7700_REG_OFFSET_SPLL0_CFG_0		0x0
> +#define EIC7700_REG_OFFSET_SPLL0_CFG_1		0x4
> +#define EIC7700_REG_OFFSET_SPLL0_CFG_2		0x8
> +#define EIC7700_REG_OFFSET_SPLL0_DSKEWCAL	0xC
> +#define EIC7700_REG_OFFSET_SPLL0_SSC		0x10
> +#define EIC7700_REG_OFFSET_SPLL1_CFG_0		0x14
> +#define EIC7700_REG_OFFSET_SPLL1_CFG_1		0x18
> +#define EIC7700_REG_OFFSET_SPLL1_CFG_2		0x1C
> +#define EIC7700_REG_OFFSET_SPLL1_DSKEWCAL	0x20
> +#define EIC7700_REG_OFFSET_SPLL1_SSC		0x24
> +#define EIC7700_REG_OFFSET_SPLL2_CFG_0		0x28
> +#define EIC7700_REG_OFFSET_SPLL2_CFG_1		0x2C
> +#define EIC7700_REG_OFFSET_SPLL2_CFG_2		0x30
> +#define EIC7700_REG_OFFSET_SPLL2_DSKEWCAL	0x34
> +#define EIC7700_REG_OFFSET_SPLL2_SSC		0x38
> +#define EIC7700_REG_OFFSET_VPLL_CFG_0		0x3C
> +#define EIC7700_REG_OFFSET_VPLL_CFG_1		0x40
> +#define EIC7700_REG_OFFSET_VPLL_CFG_2		0x44
> +#define EIC7700_REG_OFFSET_VPLL_DSKEWCAL	0x48
> +#define EIC7700_REG_OFFSET_VPLL_SSC		0x4C
> +#define EIC7700_REG_OFFSET_APLL_CFG_0		0x50
> +#define EIC7700_REG_OFFSET_APLL_CFG_1		0x54
> +#define EIC7700_REG_OFFSET_APLL_CFG_2		0x58
> +#define EIC7700_REG_OFFSET_APLL_DSKEWCAL	0x5C
> +#define EIC7700_REG_OFFSET_APLL_SSC		0x60
> +#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_0	0x64
> +#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_1	0x68
> +#define EIC7700_REG_OFFSET_MCPUT_PLL_CFG_2	0x6C
> +#define EIC7700_REG_OFFSET_MCPUT_PLL_DSKEWCAL	0x70
> +#define EIC7700_REG_OFFSET_MCPUT_PLL_SSC	0x74
> +#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_0	0x78
> +#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_1	0x7C
> +#define EIC7700_REG_OFFSET_DDRT_PLL_CFG_2	0x80
> +#define EIC7700_REG_OFFSET_DDRT_PLL_DSKEWCAL	0x84
> +#define EIC7700_REG_OFFSET_DDRT_PLL_SSC		0x88
> +#define EIC7700_REG_OFFSET_PLL_STATUS		0xA4
> +#define EIC7700_REG_OFFSET_NOC_CTRL		0x100
> +#define EIC7700_REG_OFFSET_BOOTSPI_CTRL		0x104
> +#define EIC7700_REG_OFFSET_BOOTSPI_CFGCLK_CTRL	0x108
> +#define EIC7700_REG_OFFSET_SCPU_CORE_CTRL	0x10C
> +#define EIC7700_REG_OFFSET_SCPU_BUSCLK_CTRL	0x110
> +#define EIC7700_REG_OFFSET_LPCPU_CORE_CTRL	0x114
> +#define EIC7700_REG_OFFSET_LPCPU_BUSCLK_CTRL	0x118
> +#define EIC7700_REG_OFFSET_TCU_ACLK_CTRL	0x11C
> +#define EIC7700_REG_OFFSET_TCU_CFG_CTRL		0x120
> +#define EIC7700_REG_OFFSET_DDR_CTRL		0x124
> +#define EIC7700_REG_OFFSET_DDR1_CTRL		0x128
> +#define EIC7700_REG_OFFSET_GPU_ACLK_CTRL	0x12C
> +#define EIC7700_REG_OFFSET_GPU_CFG_CTRL		0x130
> +#define EIC7700_REG_OFFSET_GPU_GRAY_CTRL	0x134
> +#define EIC7700_REG_OFFSET_DSP_ACLK_CTRL	0x138
> +#define EIC7700_REG_OFFSET_DSP_CFG_CTRL		0x13C
> +#define EIC7700_REG_OFFSET_D2D_ACLK_CTRL	0x140
> +#define EIC7700_REG_OFFSET_D2D_CFG_CTRL		0x144
> +#define EIC7700_REG_OFFSET_HSP_ACLK_CTRL	0x148
> +#define EIC7700_REG_OFFSET_HSP_CFG_CTRL		0x14C
> +#define EIC7700_REG_OFFSET_SATA_RBC_CTRL	0x150
> +#define EIC7700_REG_OFFSET_SATA_OOB_CTRL	0x154
> +#define EIC7700_REG_OFFSET_ETH0_CTRL		0x158
> +#define EIC7700_REG_OFFSET_ETH1_CTRL		0x15C
> +#define EIC7700_REG_OFFSET_MSHC0_CORE_CTRL	0x160
> +#define EIC7700_REG_OFFSET_MSHC1_CORE_CTRL	0x164
> +#define EIC7700_REG_OFFSET_MSHC2_CORE_CTRL	0x168
> +#define EIC7700_REG_OFFSET_MSHC_USB_SLWCLK	0x16C
> +#define EIC7700_REG_OFFSET_PCIE_ACLK_CTRL	0x170
> +#define EIC7700_REG_OFFSET_PCIE_CFG_CTRL	0x174
> +#define EIC7700_REG_OFFSET_NPU_ACLK_CTRL	0x178
> +#define EIC7700_REG_OFFSET_NPU_LLC_CTRL		0x17C
> +#define EIC7700_REG_OFFSET_NPU_CORE_CTRL	0x180
> +#define EIC7700_REG_OFFSET_VI_DWCLK_CTRL	0x184
> +#define EIC7700_REG_OFFSET_VI_ACLK_CTRL		0x188
> +#define EIC7700_REG_OFFSET_VI_DIG_ISP_CTRL	0x18C
> +#define EIC7700_REG_OFFSET_VI_DVP_CTRL		0x190
> +#define EIC7700_REG_OFFSET_VI_SHUTTER0		0x194
> +#define EIC7700_REG_OFFSET_VI_SHUTTER1		0x198
> +#define EIC7700_REG_OFFSET_VI_SHUTTER2		0x19C
> +#define EIC7700_REG_OFFSET_VI_SHUTTER3		0x1A0
> +#define EIC7700_REG_OFFSET_VI_SHUTTER4		0x1A4
> +#define EIC7700_REG_OFFSET_VI_SHUTTER5		0x1A8
> +#define EIC7700_REG_OFFSET_VI_PHY_CTRL		0x1AC
> +#define EIC7700_REG_OFFSET_VO_ACLK_CTRL		0x1B0
> +#define EIC7700_REG_OFFSET_VO_IESMCLK_CTRL	0x1B4
> +#define EIC7700_REG_OFFSET_VO_PIXEL_CTRL	0x1B8
> +#define EIC7700_REG_OFFSET_VO_MCLK_CTRL		0x1BC
> +#define EIC7700_REG_OFFSET_VO_PHY_CLKCTRL	0x1C0
> +#define EIC7700_REG_OFFSET_VC_ACLK_CTRL		0x1C4
> +#define EIC7700_REG_OFFSET_VCDEC_ROOT_CTRL	0x1C8
> +#define EIC7700_REG_OFFSET_G2D_CTRL		0x1CC
> +#define EIC7700_REG_OFFSET_VC_CLKEN_CTRL	0x1D0
> +#define EIC7700_REG_OFFSET_JE_CTRL		0x1D4
> +#define EIC7700_REG_OFFSET_JD_CTRL		0x1D8
> +#define EIC7700_REG_OFFSET_VD_CTRL		0x1DC
> +#define EIC7700_REG_OFFSET_VE_CTRL		0x1E0
> +#define EIC7700_REG_OFFSET_AON_DMA_CTRL		0x1E4
> +#define EIC7700_REG_OFFSET_TIMER_CTRL		0x1E8
> +#define EIC7700_REG_OFFSET_RTC_CTRL		0x1EC
> +#define EIC7700_REG_OFFSET_PKA_CTRL		0x1F0
> +#define EIC7700_REG_OFFSET_SPACC_CTRL		0x1F4
> +#define EIC7700_REG_OFFSET_TRNG_CTRL		0x1F8
> +#define EIC7700_REG_OFFSET_OTP_CTRL		0x1FC
> +#define EIC7700_REG_OFFSET_LSP_EN0		0x200
> +#define EIC7700_REG_OFFSET_LSP_EN1		0x204
> +#define EIC7700_REG_OFFSET_U84_CTRL		0x208
> +#define EIC7700_REG_OFFSET_SYSCFG_CTRL		0x20C
> +#define EIC7700_REG_OFFSET_I2C0_CTRL		0x210
> +#define EIC7700_REG_OFFSET_I2C1_CTRL		0x214
> +
> +#endif /* __CLK_EIC7700_H__ */
> diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
> new file mode 100644
> index 000000000000..d05cdc82c0a1
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.c
> @@ -0,0 +1,396 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/math.h>
> +#include <linux/slab.h>
> +
> +#include "clk.h"
> +
> +struct eswin_clock_data *eswin_clk_init(struct device *dev, int nr_clks)
> +{
> +	struct eswin_clock_data *eclk_data;
> +
> +	eclk_data =3D devm_kzalloc(dev, struct_size(eclk_data, clk_data.hws,
> +						=C2=A0 nr_clks), GFP_KERNEL);
> +	if (!eclk_data)
> +		return NULL;
> +
> +	eclk_data->base =3D devm_of_iomap(dev, dev->of_node, 0, NULL);
> +	if (IS_ERR(eclk_data->base)) {
> +		dev_err(dev, "failed to map clock registers\n");
> +		return NULL;
> +	}
> +
> +	eclk_data->clk_data.num =3D nr_clks;
> +	/* Avoid returning NULL for unused id */
> +	memset_p((void **)eclk_data->clk_data.hws, ERR_PTR(-ENOENT), nr_clks);
> +	spin_lock_init(&eclk_data->lock);
> +
> +	return eclk_data;
> +}
> +
> +/**
> + * eswin_calc_pll - calculate PLL values
> + * @frac_val: fractional divider
> + * @fbdiv_val: feedback divider
> + * @rate: reference rate
> + *
> + *=C2=A0=C2=A0 Calculate PLL values for frac and fbdiv
> + */
> +static void eswin_calc_pll(u32 *frac_val, u32 *fbdiv_val, u64 rate)
> +{
> +	u64 rem =3D 0;
> +	u32 tmp1 =3D 0, tmp2 =3D 0;
> +
> +	rate =3D rate * 4;
> +	rem =3D do_div(rate, 1000);
> +	if (rem)
> +		tmp1 =3D rem;
> +
> +	rem =3D do_div(rate, 1000);
> +	if (rem)
> +		tmp2 =3D rem;
> +
> +	rem =3D do_div(rate, 24);
> +	/* fbdiv =3D rate * 4 / 24000000 */
> +	*fbdiv_val =3D rate;
> +	/* frac =3D rate * 4 % 24000000 * (2 ^ 24) */
> +	*frac_val =3D (u64)((1000 * (1000 * rem + tmp2) + tmp1) << 24) / 24
> +			=C2=A0 / 1000000;
> +}
> +
> +static inline struct eswin_clk_pll *to_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eswin_clk_pll, hw);
> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			=C2=A0=C2=A0=C2=A0 unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk =3D to_pll_clk(hw);
> +	u32 postdiv1_val =3D 0, refdiv_val =3D 1;
> +	u32 frac_val, fbdiv_val, val;
> +	bool lock_flag =3D false;
> +	int try_count =3D 0;
> +
> +	eswin_calc_pll(&frac_val,=C2=A0 &fbdiv_val, (u64)rate);
> +
> +	/* First, disable pll */
> +	val =3D readl_relaxed(clk->ctrl_reg0);
> +	val &=3D ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |=3D 0 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val =3D readl_relaxed(clk->ctrl_reg0);
> +	val &=3D ~(((1 << clk->fbdiv_width) - 1) << clk->fbdiv_shift);
> +	val &=3D ~(((1 << clk->refdiv_width) - 1) << clk->refdiv_shift);
> +	val |=3D refdiv_val << clk->refdiv_shift;
> +	val |=3D fbdiv_val << clk->fbdiv_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val =3D readl_relaxed(clk->ctrl_reg1);
> +	val &=3D ~(((1 << clk->frac_width) - 1) << clk->frac_shift);
> +	val |=3D frac_val << clk->frac_shift;
> +	writel_relaxed(val, clk->ctrl_reg1);
> +
> +	val =3D readl_relaxed(clk->ctrl_reg2);
> +	val &=3D ~(((1 << clk->postdiv1_width) - 1) << clk->postdiv1_shift);
> +	val |=3D postdiv1_val << clk->postdiv1_shift;
> +	writel_relaxed(val, clk->ctrl_reg2);
> +
> +	/* Last, enable pll */
> +	val =3D readl_relaxed(clk->ctrl_reg0);
> +	val &=3D ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |=3D 1 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	/* Usually the pll will lock in 50us */
> +	do {
> +		usleep_range(refdiv_val * 80, refdiv_val * 80 * 2);
> +		val =3D readl_relaxed(clk->status_reg);
> +		if (val & 1 << clk->lock_shift) {
> +			lock_flag =3D true;
> +			break;
> +		}
> +	} while (try_count++ < 10);
> +
> +	if (!lock_flag) {
> +		pr_err("failed to lock the cpu pll!\n");
> +		return -EBUSY;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk =3D to_pll_clk(hw);
> +	u64 fbdiv_val, frac_val, rate, rem, tmp;
> +	u32 val;
> +
> +	val =3D readl_relaxed(clk->ctrl_reg0);
> +	val =3D val >> clk->fbdiv_shift;
> +	val &=3D ((1 << clk->fbdiv_width) - 1);
> +	fbdiv_val =3D val;
> +
> +	val =3D readl_relaxed(clk->ctrl_reg1);
> +	val =3D val >> clk->frac_shift;
> +	val &=3D ((1 << clk->frac_width) - 1);
> +	frac_val =3D val;
> +
> +	/* rate =3D 24000000 * (fbdiv + frac / (2 ^ 24)) / 4 */
> +	tmp =3D 1000 * frac_val;
> +	rem =3D do_div(tmp, BIT(24));
> +	if (rem)
> +		rate =3D (u64)(6000 * (1000 * fbdiv_val + tmp) +
> +			=C2=A0=C2=A0=C2=A0 ((6000 * rem) >> 24) + 1);
> +	else
> +		rate =3D (u64)(6000 * 1000 * fbdiv_val);
> +
> +	return rate;
> +}
> +
> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				=C2=A0 struct clk_rate_request *req)
> +{
> +	struct eswin_clk_pll *clk =3D to_pll_clk(hw);
> +
> +	req->rate =3D clamp(req->rate, clk->min_rate, clk->max_rate);
> +	req->min_rate =3D clk->min_rate;
> +	req->max_rate =3D clk->max_rate;
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_fixed_rate(const struct eswin_fixed_rate_clock *c=
lks,
> +				=C2=A0 int nums, struct eswin_clock_data *data,
> +				=C2=A0 struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D devm_clk_hw_register_fixed_rate(dev, clks[i].name,
> +							 clks[i].parent_name,
> +							 clks[i].flags,
> +							 clks[i].rate);
> +		if (IS_ERR(clk_hw))
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops eswin_clk_pll_ops =3D {
> +	.set_rate =3D clk_pll_set_rate,
> +	.recalc_rate =3D clk_pll_recalc_rate,
> +	.determine_rate =3D clk_pll_determine_rate,
> +};
> +
> +int eswin_clk_register_pll(const struct eswin_pll_clock *clks, int nums,
> +			=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev)
> +{
> +	struct eswin_clk_pll *p_clk =3D NULL;
> +	struct clk_init_data init;
> +	struct clk_hw *clk_hw;
> +	int i, ret;
> +
> +	p_clk =3D devm_kzalloc(dev, sizeof(*p_clk) * nums, GFP_KERNEL);
> +	if (!p_clk)
> +		return -ENOMEM;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		p_clk->id =3D clks[i].id;
> +		p_clk->ctrl_reg0 =3D data->base + clks[i].ctrl_reg0;
> +		p_clk->pllen_shift =3D clks[i].pllen_shift;
> +		p_clk->pllen_width =3D clks[i].pllen_width;
> +		p_clk->refdiv_shift =3D clks[i].refdiv_shift;
> +		p_clk->refdiv_width =3D clks[i].refdiv_width;
> +		p_clk->fbdiv_shift =3D clks[i].fbdiv_shift;
> +		p_clk->fbdiv_width =3D clks[i].fbdiv_width;
> +
> +		p_clk->ctrl_reg1 =3D data->base + clks[i].ctrl_reg1;
> +		p_clk->frac_shift =3D clks[i].frac_shift;
> +		p_clk->frac_width =3D clks[i].frac_width;
> +
> +		p_clk->ctrl_reg2 =3D data->base + clks[i].ctrl_reg2;
> +		p_clk->postdiv1_shift =3D clks[i].postdiv1_shift;
> +		p_clk->postdiv1_width =3D clks[i].postdiv1_width;
> +		p_clk->postdiv2_shift =3D clks[i].postdiv2_shift;
> +		p_clk->postdiv2_width =3D clks[i].postdiv2_width;
> +
> +		p_clk->status_reg =3D data->base + clks[i].status_reg;
> +		p_clk->lock_shift =3D clks[i].lock_shift;
> +		p_clk->lock_width =3D clks[i].lock_width;
> +
> +		p_clk->max_rate =3D clks[i].max_rate;
> +		p_clk->min_rate =3D clks[i].min_rate;
> +
> +		init.name =3D clks[i].name;
> +		init.flags =3D 0;
> +		init.parent_names =3D clks[i].parent_name ?
> +					&clks[i].parent_name : NULL;
> +		init.num_parents =3D clks[i].parent_name ? 1 : 0;
> +		init.ops =3D &eswin_clk_pll_ops;
> +		p_clk->hw.init =3D &init;
> +
> +		clk_hw =3D &p_clk->hw;
> +		ret =3D devm_clk_hw_register(dev, clk_hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +		p_clk++;
> +	}
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_fixed_factor(const struct eswin_fixed_factor_cloc=
k *clks,
> +				=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_data *data,
> +				=C2=A0=C2=A0=C2=A0 struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D devm_clk_hw_register_fixed_factor(dev, clks[i].name,
> +							=C2=A0=C2=A0 clks[i].parent_name,
> +							=C2=A0=C2=A0 clks[i].flags,
> +							=C2=A0=C2=A0 clks[i].mult,
> +							=C2=A0=C2=A0 clks[i].div);
> +		if (IS_ERR(clk_hw))
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_mux(const struct eswin_mux_clock *clks, int nums,
> +			=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D devm_clk_hw_register_mux(dev, clks[i].name,
> +						=C2=A0 clks[i].parent_names,
> +						=C2=A0 clks[i].num_parents,
> +						=C2=A0 clks[i].flags,
> +						=C2=A0 data->base + clks[i].offset,
> +						=C2=A0 clks[i].shift,
> +						=C2=A0 clks[i].width,
> +						=C2=A0 clks[i].mux_flags,
> +						=C2=A0 &data->lock);
> +		if (IS_ERR(clk_hw))
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_mux_tbl(const struct eswin_mux_clock *clks,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_dat=
a *data,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D clk_hw_register_mux_table(dev, clks[i].name,
> +						=C2=A0=C2=A0 clks[i].parent_names,
> +						=C2=A0=C2=A0 clks[i].num_parents,
> +						=C2=A0=C2=A0 clks[i].flags,
> +						=C2=A0=C2=A0 data->base + clks[i].offset,
> +						=C2=A0=C2=A0 clks[i].shift,
> +						=C2=A0=C2=A0 BIT(clks[i].width) - 1,
> +						=C2=A0=C2=A0 clks[i].mux_flags,
> +						=C2=A0=C2=A0 clks[i].table, &data->lock);
> +
> +		if (IS_ERR(clk_hw)) {
> +			while (i--)
> +				clk_hw_unregister_mux
> +					(data->clk_data.hws[clks[i].id]);
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +		}
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_divider(const struct eswin_divider_clock *clks,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_dat=
a *data,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D devm_clk_hw_register_divider(dev, clks[i].name,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clks[i].parent_name,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clks[i].flags,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 data->base +
> +							clks[i].offset,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clks[i].shift,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clks[i].width,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clks[i].div_flags,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &data->lock);
> +		if (IS_ERR(clk_hw))
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_gate(const struct eswin_gate_clock *clks, int num=
s,
> +			=C2=A0=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i =3D 0; i < nums; i++) {
> +		clk_hw =3D devm_clk_hw_register_gate(dev, clks[i].name,
> +						=C2=A0=C2=A0 clks[i].parent_name,
> +						=C2=A0=C2=A0 clks[i].flags,
> +						=C2=A0=C2=A0 data->base + clks[i].offset,
> +						=C2=A0=C2=A0 clks[i].bit_idx,
> +						=C2=A0=C2=A0 clks[i].gate_flags,
> +						=C2=A0=C2=A0 &data->lock);
> +
> +		if (IS_ERR(clk_hw))
> +			return dev_err_probe(dev, PTR_ERR(clk_hw),
> +					=C2=A0=C2=A0=C2=A0=C2=A0 "failed to register clock\n");
> +
> +		data->clk_data.hws[clks[i].id] =3D clk_hw;
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/clk/eswin/clk.h b/drivers/clk/eswin/clk.h
> new file mode 100644
> index 000000000000..e6e0682ff39c
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.h
> @@ -0,0 +1,266 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2025, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#ifndef __ESWIN_CLK_H__
> +#define __ESWIN_CLK_H__
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +
> +#define APLL_HIGH_FREQ	983040000
> +#define APLL_LOW_FREQ	225792000
> +#define PLL_HIGH_FREQ	1800000000
> +#define PLL_LOW_FREQ	24000000
> +
> +struct eswin_clock_data {
> +	void __iomem *base;
> +	struct clk_hw *original_clk;
> +	struct notifier_block pll_nb;
> +	spinlock_t lock; /* protect register read-modify-write cycle */
> +	struct clk_hw_onecell_data clk_data;
> +};
> +
> +struct eswin_divider_clock {
> +	unsigned int id;
> +	const char *name;
> +	const char *parent_name;
> +	unsigned long flags;
> +	unsigned long offset;
> +	u8 shift;
> +	u8 width;
> +	u8 div_flags;
> +};
> +
> +struct eswin_fixed_rate_clock {
> +	unsigned int id;
> +	char *name;
> +	const char *parent_name;
> +	unsigned long flags;
> +	unsigned long rate;
> +};
> +
> +struct eswin_fixed_factor_clock {
> +	unsigned int id;
> +	char *name;
> +	const char *parent_name;
> +	unsigned long mult;
> +	unsigned long div;
> +	unsigned long flags;
> +};
> +
> +struct eswin_gate_clock {
> +	unsigned int id;
> +	const char *name;
> +	const char *parent_name;
> +	unsigned long flags;
> +	unsigned long offset;
> +	u8 bit_idx;
> +	u8 gate_flags;
> +};
> +
> +struct eswin_mux_clock {
> +	unsigned int id;
> +	const char *name;
> +	const char *const *parent_names;
> +	u8 num_parents;
> +	unsigned long flags;
> +	unsigned long offset;
> +	u8 shift;
> +	u8 width;
> +	u8 mux_flags;
> +	u32 *table;
> +};
> +
> +struct eswin_pll_clock {
> +	u32 id;
> +	const char *name;
> +	const char *parent_name;
> +	const u32 ctrl_reg0;
> +	const u8 pllen_shift;
> +	const u8 pllen_width;
> +	const u8 refdiv_shift;
> +	const u8 refdiv_width;
> +	const u8 fbdiv_shift;
> +	const u8 fbdiv_width;
> +
> +	const u32 ctrl_reg1;
> +	const u8 frac_shift;
> +	const u8 frac_width;
> +
> +	const u32 ctrl_reg2;
> +	const u8 postdiv1_shift;
> +	const u8 postdiv1_width;
> +	const u8 postdiv2_shift;
> +	const u8 postdiv2_width;
> +
> +	const u32 status_reg;
> +	const u8 lock_shift;
> +	const u8 lock_width;
> +
> +	const u64 max_rate;
> +	const u64 min_rate;
> +};
> +
> +struct eswin_clk_pll {
> +	struct clk_hw hw;
> +	u32 id;
> +	void __iomem *ctrl_reg0;
> +	u8 pllen_shift;
> +	u8 pllen_width;
> +	u8 refdiv_shift;
> +	u8 refdiv_width;
> +	u8 fbdiv_shift;
> +	u8 fbdiv_width;
> +
> +	void __iomem *ctrl_reg1;
> +	u8 frac_shift;
> +	u8 frac_width;
> +
> +	void __iomem *ctrl_reg2;
> +	u8 postdiv1_shift;
> +	u8 postdiv1_width;
> +	u8 postdiv2_shift;
> +	u8 postdiv2_width;
> +
> +	void __iomem *status_reg;
> +	u8 lock_shift;
> +	u8 lock_width;
> +
> +	u64 max_rate;
> +	u64 min_rate;
> +};
> +
> +struct eswin_clock_data *eswin_clk_init(struct device *dev, int nr_clks)=
;
> +int eswin_clk_register_fixed_rate(const struct eswin_fixed_rate_clock *c=
lks,
> +				=C2=A0 int nums, struct eswin_clock_data *data,
> +				=C2=A0 struct device *dev);
> +int eswin_clk_register_pll(const struct eswin_pll_clock *clks, int nums,
> +			=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev);
> +int eswin_clk_register_fixed_factor(const struct eswin_fixed_factor_cloc=
k *clks,
> +				=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_data *data,
> +				=C2=A0=C2=A0=C2=A0 struct device *dev);
> +int eswin_clk_register_mux(const struct eswin_mux_clock *clks, int nums,
> +			=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev);
> +int eswin_clk_register_mux_tbl(const struct eswin_mux_clock *clks,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_dat=
a *data,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev);
> +int eswin_clk_register_divider(const struct eswin_divider_clock *clks,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int nums, struct eswin_clock_dat=
a *data,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device *dev);
> +int eswin_clk_register_gate(const struct eswin_gate_clock *clks, int num=
s,
> +			=C2=A0=C2=A0=C2=A0 struct eswin_clock_data *data, struct device *dev)=
;
> +
> +#define PNAME(x) static const char *const x[] __initconst
> +
> +#define EIC7700_DIV(_id, _name, _pname, _flags, _offset, _shift, _width,=
 \
> +		=C2=A0=C2=A0=C2=A0 _dflags)						\
> +	{								\
> +		.id		=3D _id,					\
> +		.name		=3D _name,				\
> +		.parent_name	=3D _pname,				\
> +		.flags		=3D _flags,				\
> +		.offset		=3D _offset,				\
> +		.shift		=3D _shift,				\
> +		.width		=3D _width,				\
> +		.div_flags	=3D _dflags,				\
> +	}
> +
> +#define EIC7700_FACTOR(_id, _name, _pname, _mult, _div, _flags)	\
> +	{							\
> +		.id		=3D _id,				\
> +		.name		=3D _name,			\
> +		.parent_name	=3D _pname,			\
> +		.mult		=3D _mult,			\
> +		.div		=3D _div,				\
> +		.flags		=3D _flags,			\
> +	}
> +
> +#define EIC7700_FIXED(_id, _name, _pname, _flags, _rate)	\
> +{								\
> +	.id		=3D _id,					\
> +	.name		=3D _name,				\
> +	.parent_name	=3D _pname,				\
> +	.flags		=3D _flags,				\
> +	.rate		=3D _rate,				\
> +}
> +
> +#define EIC7700_GATE(_id, _name, _pname, _flags, _offset, _idx, _gflags)=
 \
> +	{								\
> +		.id		=3D _id,					\
> +		.name		=3D _name,				\
> +		.parent_name	=3D _pname,				\
> +		.flags		=3D _flags,				\
> +		.offset		=3D _offset,				\
> +		.bit_idx	=3D _idx,					\
> +		.gate_flags	=3D _gflags,				\
> +	}
> +
> +#define EIC7700_MUX(_id, _name, _pnames, _num_parents, _flags, _offset,	=
\
> +		=C2=A0=C2=A0=C2=A0 _shift, _width, _mflags)				\
> +	{								\
> +		.id		=3D _id,					\
> +		.name		=3D _name,				\
> +		.parent_names	=3D _pnames,				\
> +		.num_parents	=3D _num_parents,				\
> +		.flags		=3D _flags,				\
> +		.offset		=3D _offset,				\
> +		.shift		=3D _shift,				\
> +		.width		=3D _width,				\
> +		.mux_flags	=3D _mflags,				\
> +	}
> +
> +#define EIC7700_MUX_TBL(_id, _name, _pnames, _num_parents, _flags, _offs=
et, \
> +			_shift, _width, _mflags, _table)		\
> +	{								\
> +		.id		=3D _id,					\
> +		.name		=3D _name,				\
> +		.parent_names	=3D _pnames,				\
> +		.num_parents	=3D _num_parents,				\
> +		.flags		=3D _flags,				\
> +		.offset		=3D _offset,				\
> +		.shift		=3D _shift,				\
> +		.width		=3D _width,				\
> +		.mux_flags	=3D _mflags,				\
> +		.table		=3D _table,				\
> +	}
> +
> +#define EIC7700_PLL(_id, _name, _pname, _reg0, _en_shift, _en_width,	\
> +		=C2=A0=C2=A0=C2=A0 _ref_shift, _ref_width, _fb_shift, _fb_width, _reg1=
,\
> +		=C2=A0=C2=A0=C2=A0 _frac_shift, _frac_width, _reg2, _post1_shift,	\
> +		=C2=A0=C2=A0=C2=A0 _post1_width, _post2_shift, _post2_width, _reg,	\
> +		=C2=A0=C2=A0=C2=A0 _lock_shift, _lock_width, _max_rate, _min_rate)	\
> +	{								\
> +		.id		=3D _id,					\
> +		.name		=3D _name,				\
> +		.parent_name	=3D _pname,				\
> +		.ctrl_reg0	=3D _reg0,				\
> +		.pllen_shift	=3D _en_shift,				\
> +		.pllen_width	=3D _en_width,				\
> +		.refdiv_shift	=3D _ref_shift,				\
> +		.refdiv_width	=3D _ref_width,				\
> +		.fbdiv_shift	=3D _fb_shift,				\
> +		.fbdiv_width	=3D _fb_width,				\
> +		.ctrl_reg1	=3D _reg1,				\
> +		.frac_shift	=3D _frac_shift,				\
> +		.frac_width	=3D _frac_width,				\
> +		.ctrl_reg2	=3D _reg2,				\
> +		.postdiv1_shift	=3D _post1_shift,				\
> +		.postdiv1_width	=3D _post1_width,				\
> +		.postdiv2_shift	=3D _post2_shift,				\
> +		.postdiv2_width	=3D _post2_width,				\
> +		.status_reg	=3D _reg,					\
> +		.lock_shift	=3D _lock_shift,				\
> +		.lock_width	=3D _lock_width,				\
> +		.max_rate	=3D _max_rate,				\
> +		.min_rate	=3D _min_rate,				\
> +	}
> +
> +#endif /* __ESWIN_CLK_H__ */
