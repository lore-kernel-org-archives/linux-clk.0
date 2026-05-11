Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FD3402BB3
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 15:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778514183; cv=none; b=U5rfM1yX+I1B7/8g5PWweug0CmFjFCgwLJUAR4wbwqxLfDdRPT158ywD/Ig13xkq+lS/zIKO+7ADB6KvPCnAtugpPkmhP1IzpTONrPgiXF6InzKkDuyTKkf7Z3hzSeJ5yu6thpvOZpP2q/y9JPY0Mqkn+Hh5CWwg/2Dtw62k5Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778514183; c=relaxed/simple;
	bh=S9cJ8FkFT6JT8qEDBPENmCE51KJ92g/ShTFV1EdDFf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFc8gfFyqjBPJ0vO+WTJuRTQR9trUXW/FS9Dt0hffgawfLf20thENVXnD/LPMIscu2QfaEm2e8tT2zl3Bj6UTtjJLrAkEMtwalfBJlbCnlSMZc+0J8lyANX610Ts5+XPGw0IVfs6Tx8ZgYu8wZS07GIoquYNlA0KYoMiAF5o1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=evGILRwB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MFdhdSix; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="evGILRwB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MFdhdSix"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778514180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bpfOYAfhxaho32Y3Oxw5vJvJkJp0w7dPiCCTyuEFxhc=;
	b=evGILRwBxOp0TM2hwI1HEKsVHgNXjjC+f+rSEMNtiwyazd+CRMc26+ykSeebUgauNjAkW1
	/uAOz72yXxRoDgc+ueewN98soBqvN708mmvc2O1cN8a2iOSAIcadIx77t9mgahcgdSZL/Y
	6i5QwKaG6l3UZsp+thoIg1VReLd+D8I=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-30-_I0QToImOfCLutlJ_fYL5w-1; Mon, 11 May 2026 11:42:58 -0400
X-MC-Unique: _I0QToImOfCLutlJ_fYL5w-1
X-Mimecast-MFC-AGG-ID: _I0QToImOfCLutlJ_fYL5w_1778514178
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8f461b583acso811757185a.0
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 08:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778514178; x=1779118978; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpfOYAfhxaho32Y3Oxw5vJvJkJp0w7dPiCCTyuEFxhc=;
        b=MFdhdSixT4VbRsmS+zfe9sP49V4/a+q/5ZLCBKkNvcWFOTAFm5zpRK8VWoDTwTG/tr
         /hu8XOdBY07hww6JplK8UL8HGuDMnhm0GfXrl54OAKkRpCUmW0mE5Wxjxt/B5H3dxfDh
         +HP7WChpq0HJKy6oyiynEnLEa9SowFlE8OVllNZcJgudbYfecQioB9Jfsmui7mZcRzsH
         Ihib3PnZMkiUfSjM8XkrsPam4Mw/4MOoIDS0JtOjGzxHhj6N3y2wGagEAXauzEbKGKRE
         y2RG5BkBMLpnWar/nLP6o4Gt8xsKx82bTWofuc1T3aXZQqHj9TjPLc0I8L0J/4Fo35Pa
         F9bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778514178; x=1779118978;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bpfOYAfhxaho32Y3Oxw5vJvJkJp0w7dPiCCTyuEFxhc=;
        b=MxHGtsrpXml94paA4BzY2pKz3+Onzfav0Go68eutU9IaOt0ehyzttbMGrR41QPuU+0
         eTyLPnA0WWx8vcDGYPxfECpPWS3+ZLFOku0AghEnVQTHdOzcN1J+DToSAewL1TpM4wDM
         uZevrqQxm6J+312UMwFZxtELpc8Ixts8Zu5Qe2MtiWfbZlTrU+JHLBeQDbYAcXmLt/LY
         dzx+Hqq1f5uR4aoqxRf7CY99UJ6Mo0Y1jLzhzLYJ8Gu6Impf+6QPb6mAPzAejr5GkVgM
         lhSCrN8OwMDIl15yrHHFSMOfzvYUUgRHaZc/5yhIi/mBVIRpPbhvoVCpgm/Alk3eba9Z
         NEHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v4/RTL383soZGVWNNL6pzr+ZqBEzECBFk2oG7lZaG9MILAPrsuYvSgyi6Nr61gfb/RnxKZEQ8XSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgYhX/1BL4nOpF/LHwTQkkkhgd+0oOOBjr74sJOV78TEtmEFvB
	jG0tvtW8gMlK9vG9QdSlsk1r8gtTOJzchOz8pTAf4uR1vVqRft5ZiU2iI6I3u4JO4iDNBbEwI+R
	Wb1IZvCLdsZzPJKLYJiDbftZqXs2I1prueDATGm4NqWVaS4Zdw1PgyzKOjAUvzw==
X-Gm-Gg: Acq92OF6Do19lYSdPeynuf1G7xeLjX/gEWiYoYFMuGP9mzFsoDHe/V63hlrfKdWmQnT
	5T3VL27HW/B9J0XzFrz2rd+chRHiF3hkfYfZx3QYTVbxZITf0RE2ns2JHWxuWFyqluVu5XXX+Bo
	7yH/Q6SBqvMR28ILXXxlqb8eAEfZMm4syjRPCEduhh8vaDad+ORcxdWwv+1yeu59K59mepWi/w9
	TFrIiqFOgPk/f9jwhLVtD7olOCoV76QG9gjByPyCLovgRuz98ZyiG6E98EgrVEYo6IuM4drsCFB
	lvSkfAUFgTR9pVInuXrgCw3UaH4PASsFvJ0/5mLATD3EH7Q0wshn0G01/Tf0lb124WjnwiFNA3k
	vnAEA1alm+xRm84WAfUnD0RMewSSbhNu4TkKqHB4iVoaKarO2eNQM80hbJXlk9jIfNKs=
X-Received: by 2002:a05:620a:408c:b0:909:b197:4692 with SMTP id af79cd13be357-909b197494emr1308069985a.62.1778514177689;
        Mon, 11 May 2026 08:42:57 -0700 (PDT)
X-Received: by 2002:a05:620a:408c:b0:909:b197:4692 with SMTP id af79cd13be357-909b197494emr1308062385a.62.1778514176979;
        Mon, 11 May 2026 08:42:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c3db21d23bsm42160056d6.15.2026.05.11.08.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 08:42:55 -0700 (PDT)
Date: Mon, 11 May 2026 11:42:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: jian.hu@amlogic.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/10] clk: amlogic: Add A9 peripherals clock controller
 driver
Message-ID: <agH4_gClJW8CVV75@redhat.com>
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
 <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-b4-a9_clk-v1-9-41cb4071b7c9@amlogic.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Jian,

On Mon, May 11, 2026 at 08:47:31PM +0800, Jian Hu via B4 Relay wrote:
> From: Jian Hu <jian.hu@amlogic.com>
> 
> Add the peripherals clock controller driver for the Amlogic A9 SoC family.
> 
> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
> ---
>  drivers/clk/meson/Kconfig          |   15 +
>  drivers/clk/meson/Makefile         |    1 +
>  drivers/clk/meson/a9-peripherals.c | 2317 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 2333 insertions(+)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 3549e67d6988..48a15a5e1323 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -145,6 +145,21 @@ config COMMON_CLK_A9_PLL
>  	  device, AKA A9. PLLs are required by most peripheral to operate.
>  	  Say Y if you want A9 PLL clock controller to work.
>  
> +config COMMON_CLK_A9_PERIPHERALS
> +	tristate "Amlogic A9 SoC peripherals clock controller support"
> +	depends on ARM64

depends on ARM64 || COMPILE_TEST

> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
> +	imply COMMON_CLK_SCMI
> +	imply COMMON_CLK_A9_PLL
> +	help
> +	  Support for the peripherals clock controller on Amlogic A311Y3 based
> +	  device, AKA A9. Peripherals are required by most peripheral to operate.
> +	  Say Y if you want A9 peripherals clock controller to work.
> +
>  config COMMON_CLK_C3_PLL
>  	tristate "Amlogic C3 PLL clock controller"
>  	depends on ARM64
> diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
> index 77636033061f..2b5b67b14efc 100644
> --- a/drivers/clk/meson/Makefile
> +++ b/drivers/clk/meson/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_COMMON_CLK_AXG_AUDIO) += axg-audio.o
>  obj-$(CONFIG_COMMON_CLK_A1_PLL) += a1-pll.o
>  obj-$(CONFIG_COMMON_CLK_A1_PERIPHERALS) += a1-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_A9_PLL) += a9-pll.o
> +obj-$(CONFIG_COMMON_CLK_A9_PERIPHERALS) += a9-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_C3_PLL) += c3-pll.o
>  obj-$(CONFIG_COMMON_CLK_C3_PERIPHERALS) += c3-peripherals.o
>  obj-$(CONFIG_COMMON_CLK_GXBB) += gxbb.o gxbb-aoclk.o
> diff --git a/drivers/clk/meson/a9-peripherals.c b/drivers/clk/meson/a9-peripherals.c
> new file mode 100644
> index 000000000000..338a91c473ea
> --- /dev/null
> +++ b/drivers/clk/meson/a9-peripherals.c
> @@ -0,0 +1,2317 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/amlogic,a9-peripherals-clkc.h>
> +#include "clk-regmap.h"
> +#include "clk-dualdiv.h"
> +#include "vid-pll-div.h"
> +#include "meson-clkc-utils.h"

Sort the headers.

> +
> +#define SYS_CLK_EN0_REG0			0x30
> +#define SYS_CLK_EN0_REG1			0x34
> +#define SYS_CLK_EN0_REG2			0x38
> +#define SYS_CLK_EN0_REG3			0x3c
> +#define SD_EMMC_CLK_CTRL0			0x90
> +#define SD_EMMC_CLK_CTRL1			0x94
> +#define PWM_CLK_H_CTRL				0xbc
> +#define PWM_CLK_I_CTRL				0xc0
> +#define PWM_CLK_J_CTRL				0xc4
> +#define PWM_CLK_K_CTRL				0xc8
> +#define PWM_CLK_L_CTRL				0xcc
> +#define PWM_CLK_M_CTRL				0xd0
> +#define PWM_CLK_N_CTRL				0xd4
> +#define SPISG_CLK_CTRL				0x100
> +#define SPISG_CLK_CTRL1				0x104
> +#define SAR_CLK_CTRL				0x150
> +#define AMFC_CLK_CTRL				0x154
> +#define NNA_CLK_CTRL				0x15c
> +#define USB_CLK_CTRL				0x160
> +#define PCIE_TL_CLK_CTRL			0x164
> +#define CMPR_CLK_CTRL				0x168
> +#define DEWARP_CLK_CTRL				0x16c
> +#define SC_CLK_CTRL				0x170
> +#define DPTX_CLK_CTRL				0x178
> +#define ISP_CLK_CTRL				0x17c
> +#define CVE_CLK_CTRL				0x180
> +#define PP_CLK_CTRL				0x184
> +#define GLB_CLK_CTRL				0x188
> +#define USB_CLK_CTRL0				0x18c
> +#define USB_CLK_CTRL1				0x190
> +#define CAN_CLK_CTRL				0x194
> +#define CAN_CLK_CTRL1				0x198
> +#define I3C_CLK_CTRL				0x19c
> +#define TS_CLK_CTRL				0x1a0
> +#define ETH_CLK_CTRL				0x1a4
> +#define GEN_CLK_CTRL				0x1a8
> +#define CLK12_24_CTRL				0x1ac
> +#define MALI_CLK_CTRL				0x200
> +#define MALI_STACK_CLK_CTRL			0x204
> +#define DSPA_CLK_CTRL				0x220
> +#define HEVCF_CLK_CTRL				0x240
> +#define HCODEC_CLK_CTRL				0x244
> +#define VPU_CLK_CTRL				0x260
> +#define VAPB_CLK_CTRL				0x268
> +#define VPU_CLKB_CTRL				0x280
> +#define HDMI_CLK_CTRL				0x284
> +#define HTX_CLK_CTRL				0x28c
> +#define HTX_CLK_CTRL1				0x290
> +#define HRX_CLK_CTRL				0x294
> +#define HRX_CLK_CTRL1				0x298
> +#define HRX_CLK_CTRL2				0x29c
> +#define HRX_CLK_CTRL3				0x2a0
> +#define VID_LOCK_CLK_CTRL			0x2a4
> +#define VDIN_MEAS_CLK_CTRL			0x2a8
> +#define VID_PLL_CLK_DIV				0x2b0
> +#define VID_CLK_CTRL				0x2c0
> +#define VID_CLK_CTRL2				0x2c4
> +#define VID_CLK_DIV				0x2c8
> +#define VIID_CLK_DIV				0x2cc
> +#define VIID_CLK_CTRL				0x2d0
> +#define MIPI_CSI_PHY_CLK_CTRL			0x2e0
> +#define DSI_MEAS_CLK_CTRL			0x2f4
> +
> +#define A9_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
> +	MESON_COMP_SEL(a9_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
> +
> +#define A9_COMP_DIV(_name, _reg, _shift, _width) \
> +	MESON_COMP_DIV(a9_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
> +
> +#define A9_COMP_GATE(_name, _reg, _bit, _iflags) \
> +	MESON_COMP_GATE(a9_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
> +
> +static const struct clk_parent_data a9_sys_pclk_parents = { .fw_name = "sys" };
> +
> +#define A9_SYS_PCLK(_name, _reg, _bit) \
> +	MESON_PCLK(a9_##_name, _reg, _bit, &a9_sys_pclk_parents, 0)
> +
> +static A9_SYS_PCLK(sys_am_axi,		SYS_CLK_EN0_REG0, 0);
> +static A9_SYS_PCLK(sys_dos,		SYS_CLK_EN0_REG0, 1);
> +static A9_SYS_PCLK(sys_mipi_dsi,	SYS_CLK_EN0_REG0, 3);
> +static A9_SYS_PCLK(sys_eth_phy,		SYS_CLK_EN0_REG0, 4);
> +static A9_SYS_PCLK(sys_amfc,		SYS_CLK_EN0_REG0, 5);
> +static A9_SYS_PCLK(sys_mali,		SYS_CLK_EN0_REG0, 6);
> +static A9_SYS_PCLK(sys_nna,		SYS_CLK_EN0_REG0, 7);
> +static A9_SYS_PCLK(sys_eth_axi,		SYS_CLK_EN0_REG0, 8);
> +static A9_SYS_PCLK(sys_dp_apb,		SYS_CLK_EN0_REG0, 9);
> +static A9_SYS_PCLK(sys_edptx_apb,	SYS_CLK_EN0_REG0, 10);
> +static A9_SYS_PCLK(sys_u3hsg,		SYS_CLK_EN0_REG0, 11);
> +static A9_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14);
> +static A9_SYS_PCLK(sys_glb,		SYS_CLK_EN0_REG0, 15);
> +static A9_SYS_PCLK(sys_combo_dphy_apb,	SYS_CLK_EN0_REG0, 17);
> +static A9_SYS_PCLK(sys_hdmirx_apb,	SYS_CLK_EN0_REG0, 18);
> +static A9_SYS_PCLK(sys_hdmirx_pclk,	SYS_CLK_EN0_REG0, 19);
> +static A9_SYS_PCLK(sys_mipi_dsi_phy,	SYS_CLK_EN0_REG0, 20);
> +static A9_SYS_PCLK(sys_can0,		SYS_CLK_EN0_REG0, 21);
> +static A9_SYS_PCLK(sys_can1,		SYS_CLK_EN0_REG0, 22);
> +static A9_SYS_PCLK(sys_sd_emmc_a,	SYS_CLK_EN0_REG0, 24);
> +static A9_SYS_PCLK(sys_sd_emmc_b,	SYS_CLK_EN0_REG0, 25);
> +static A9_SYS_PCLK(sys_sd_emmc_c,	SYS_CLK_EN0_REG0, 26);
> +static A9_SYS_PCLK(sys_sc,		SYS_CLK_EN0_REG0, 27);
> +static A9_SYS_PCLK(sys_acodec,		SYS_CLK_EN0_REG0, 28);
> +static A9_SYS_PCLK(sys_mipi_isp,	SYS_CLK_EN0_REG0, 29);
> +static A9_SYS_PCLK(sys_msr,		SYS_CLK_EN0_REG0, 30);
> +static A9_SYS_PCLK(sys_audio,		SYS_CLK_EN0_REG1, 0);
> +static A9_SYS_PCLK(sys_mipi_dsi_b,	SYS_CLK_EN0_REG1, 1);
> +static A9_SYS_PCLK(sys_mipi_dsi1_phy,	SYS_CLK_EN0_REG1, 2);
> +static A9_SYS_PCLK(sys_eth,		SYS_CLK_EN0_REG1, 3);
> +static A9_SYS_PCLK(sys_eth_1g_mac,	SYS_CLK_EN0_REG1, 4);
> +static A9_SYS_PCLK(sys_uart_a,		SYS_CLK_EN0_REG1, 5);
> +static A9_SYS_PCLK(sys_uart_f,		SYS_CLK_EN0_REG1, 10);
> +static A9_SYS_PCLK(sys_ts_a55,		SYS_CLK_EN0_REG1, 11);
> +static A9_SYS_PCLK(sys_eth_1g_axi,	SYS_CLK_EN0_REG1, 12);
> +static A9_SYS_PCLK(sys_ts_dos,		SYS_CLK_EN0_REG1, 13);
> +static A9_SYS_PCLK(sys_u3drd_b,		SYS_CLK_EN0_REG1, 14);
> +static A9_SYS_PCLK(sys_ts_core,		SYS_CLK_EN0_REG1, 15);
> +static A9_SYS_PCLK(sys_ts_pll,		SYS_CLK_EN0_REG1, 16);
> +static A9_SYS_PCLK(sys_csi_dig_clkin,	SYS_CLK_EN0_REG1, 18);
> +static A9_SYS_PCLK(sys_cve,		SYS_CLK_EN0_REG1, 19);
> +static A9_SYS_PCLK(sys_ge2d,		SYS_CLK_EN0_REG1, 20);
> +static A9_SYS_PCLK(sys_spisg,		SYS_CLK_EN0_REG1, 21);
> +static A9_SYS_PCLK(sys_u3drd_1,		SYS_CLK_EN0_REG1, 22);
> +static A9_SYS_PCLK(sys_u2h,		SYS_CLK_EN0_REG1, 23);
> +static A9_SYS_PCLK(sys_pcie_mac_a,	SYS_CLK_EN0_REG1, 24);
> +static A9_SYS_PCLK(sys_u3drd_a,		SYS_CLK_EN0_REG1, 25);
> +static A9_SYS_PCLK(sys_u2drd,		SYS_CLK_EN0_REG1, 26);
> +static A9_SYS_PCLK(sys_pcie_phy,	SYS_CLK_EN0_REG1, 27);
> +static A9_SYS_PCLK(sys_pcie_mac_b,	SYS_CLK_EN0_REG1, 28);
> +static A9_SYS_PCLK(sys_periph,		SYS_CLK_EN0_REG1, 29);
> +static A9_SYS_PCLK(sys_pio,		SYS_CLK_EN0_REG2, 0);
> +static A9_SYS_PCLK(sys_i3c,		SYS_CLK_EN0_REG2, 1);
> +static A9_SYS_PCLK(sys_i2c_m_e,		SYS_CLK_EN0_REG2, 2);
> +static A9_SYS_PCLK(sys_i2c_m_f,		SYS_CLK_EN0_REG2, 3);
> +static A9_SYS_PCLK(sys_hdmitx_apb,	SYS_CLK_EN0_REG2, 4);
> +static A9_SYS_PCLK(sys_i2c_m_i,		SYS_CLK_EN0_REG2, 5);
> +static A9_SYS_PCLK(sys_i2c_m_g,		SYS_CLK_EN0_REG2, 6);
> +static A9_SYS_PCLK(sys_i2c_m_h,		SYS_CLK_EN0_REG2, 7);
> +static A9_SYS_PCLK(sys_hdmi20_aes,	SYS_CLK_EN0_REG2, 9);
> +static A9_SYS_PCLK(sys_csi2_host,	SYS_CLK_EN0_REG2, 16);
> +static A9_SYS_PCLK(sys_csi2_adapt,	SYS_CLK_EN0_REG2, 17);
> +static A9_SYS_PCLK(sys_dspa,		SYS_CLK_EN0_REG2, 21);
> +static A9_SYS_PCLK(sys_pp_dma,		SYS_CLK_EN0_REG2, 22);
> +static A9_SYS_PCLK(sys_pp_wrapper,	SYS_CLK_EN0_REG2, 23);
> +static A9_SYS_PCLK(sys_vpu_intr,	SYS_CLK_EN0_REG2, 25);
> +static A9_SYS_PCLK(sys_csi2_phy,	SYS_CLK_EN0_REG2, 27);
> +static A9_SYS_PCLK(sys_saradc,		SYS_CLK_EN0_REG2, 28);
> +static A9_SYS_PCLK(sys_pwm_j,		SYS_CLK_EN0_REG2, 30);
> +static A9_SYS_PCLK(sys_pwm_i,		SYS_CLK_EN0_REG2, 31);
> +static A9_SYS_PCLK(sys_pwm_h,		SYS_CLK_EN0_REG3, 0);
> +static A9_SYS_PCLK(sys_pwm_n,		SYS_CLK_EN0_REG3, 8);
> +static A9_SYS_PCLK(sys_pwm_m,		SYS_CLK_EN0_REG3, 9);
> +static A9_SYS_PCLK(sys_pwm_l,		SYS_CLK_EN0_REG3, 10);
> +static A9_SYS_PCLK(sys_pwm_k,		SYS_CLK_EN0_REG3, 11);
> +
> +/* Channel 5 is unconnected. */
> +static u32 a9_sd_emmc_parents_val_table[] = { 0, 1, 2, 3, 4, 6, 7 };
> +static const struct clk_parent_data a9_sd_emmc_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "hifi0", },
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "gp1", },
> +	{ .fw_name = "gp0", }
> +};
> +
> +static A9_COMP_SEL(sd_emmc_a, SD_EMMC_CLK_CTRL0, 9, 0x7, a9_sd_emmc_parents,
> +		   a9_sd_emmc_parents_val_table);
> +static A9_COMP_DIV(sd_emmc_a, SD_EMMC_CLK_CTRL0, 0, 7);
> +static A9_COMP_GATE(sd_emmc_a, SD_EMMC_CLK_CTRL0, 8, 0);
> +
> +static A9_COMP_SEL(sd_emmc_b, SD_EMMC_CLK_CTRL0, 25, 0x7, a9_sd_emmc_parents,
> +		   a9_sd_emmc_parents_val_table);
> +static A9_COMP_DIV(sd_emmc_b, SD_EMMC_CLK_CTRL0, 16, 7);
> +static A9_COMP_GATE(sd_emmc_b, SD_EMMC_CLK_CTRL0, 24, 0);
> +
> +static A9_COMP_SEL(sd_emmc_c, SD_EMMC_CLK_CTRL1, 9, 0x7, a9_sd_emmc_parents,
> +		   a9_sd_emmc_parents_val_table);
> +static A9_COMP_DIV(sd_emmc_c, SD_EMMC_CLK_CTRL1, 0, 7);
> +static A9_COMP_GATE(sd_emmc_c, SD_EMMC_CLK_CTRL1, 8, 0);
> +
> +static const struct clk_parent_data a9_pwm_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", }
> +};
> +
> +static A9_COMP_SEL(pwm_h, PWM_CLK_H_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_h, PWM_CLK_H_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_h, PWM_CLK_H_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_i, PWM_CLK_I_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_i, PWM_CLK_I_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_i, PWM_CLK_I_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_j, PWM_CLK_J_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_j, PWM_CLK_J_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_j, PWM_CLK_J_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_k, PWM_CLK_K_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_k, PWM_CLK_K_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_k, PWM_CLK_K_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_l, PWM_CLK_L_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_l, PWM_CLK_L_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_l, PWM_CLK_L_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_m, PWM_CLK_M_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_m, PWM_CLK_M_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_m, PWM_CLK_M_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pwm_n, PWM_CLK_N_CTRL, 9, 0x7, a9_pwm_parents, NULL);
> +static A9_COMP_DIV(pwm_n, PWM_CLK_N_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_n, PWM_CLK_N_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_spisg_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "sys", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv7", },
> +	{ .fw_name = "gp0", }
> +};
> +
> +static A9_COMP_SEL(spisg, SPISG_CLK_CTRL, 9, 0x7, a9_spisg_parents, NULL);
> +static A9_COMP_DIV(spisg, SPISG_CLK_CTRL, 0, 6);
> +static A9_COMP_GATE(spisg, SPISG_CLK_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(spisg1, SPISG_CLK_CTRL, 25, 0x7, a9_spisg_parents, NULL);
> +static A9_COMP_DIV(spisg1, SPISG_CLK_CTRL, 16, 6);
> +static A9_COMP_GATE(spisg1, SPISG_CLK_CTRL, 24, 0);
> +
> +static A9_COMP_SEL(spisg2, SPISG_CLK_CTRL1, 9, 0x7, a9_spisg_parents, NULL);
> +static A9_COMP_DIV(spisg2, SPISG_CLK_CTRL1, 0, 6);
> +static A9_COMP_GATE(spisg2, SPISG_CLK_CTRL1, 8, 0);
> +
> +static const struct clk_parent_data a9_saradc_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "sys", }
> +};
> +
> +static A9_COMP_SEL(saradc, SAR_CLK_CTRL, 9, 0x7, a9_saradc_parents, NULL);
> +static A9_COMP_DIV(saradc, SAR_CLK_CTRL, 0, 8);
> +static A9_COMP_GATE(saradc, SAR_CLK_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_amfc_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "sys", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv7", }
> +};
> +
> +static A9_COMP_SEL(amfc, AMFC_CLK_CTRL, 9, 0x7, a9_amfc_parents, NULL);
> +static A9_COMP_DIV(amfc, AMFC_CLK_CTRL, 0, 6);
> +static A9_COMP_GATE(amfc, AMFC_CLK_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_nna_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "gp2", },
> +	{ .fw_name = "hifi", }

hifi isn't in the dt bindings. Should this be hifi0 and/or hifi1?

> +};
> +
> +static A9_COMP_SEL(nna, NNA_CLK_CTRL, 9, 0x7, a9_nna_parents, NULL);
> +static A9_COMP_DIV(nna, NNA_CLK_CTRL, 0, 7);
> +static A9_COMP_GATE(nna, NNA_CLK_CTRL, 8, 0);
> +
> +/* Channel 5 and 6 are unconnected. */
> +static u32 a9_usb_250m_parents_val_table[] = { 0, 1, 2, 3, 4, 7 };
> +static const struct clk_parent_data a9_usb_250m_parents[] = {
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv7", },
> +	{ .fw_name = "fdiv2p5", }
> +};
> +
> +static A9_COMP_SEL(usb_250m, USB_CLK_CTRL, 9, 0x7, a9_usb_250m_parents,
> +		   a9_usb_250m_parents_val_table);
> +static A9_COMP_DIV(usb_250m, USB_CLK_CTRL, 0, 7);
> +static A9_COMP_GATE(usb_250m, USB_CLK_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_usb_48m_pre_parents[] = {
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv7", },
> +	{ .fw_name = "fdiv2p5", }
> +};
> +
> +static A9_COMP_SEL(usb_48m_pre, USB_CLK_CTRL, 25, 0x7, a9_usb_48m_pre_parents,
> +		   NULL);
> +static A9_COMP_DIV(usb_48m_pre, USB_CLK_CTRL, 16, 7);
> +static A9_COMP_GATE(usb_48m_pre, USB_CLK_CTRL, 24, 0);
> +
> +static const struct clk_parent_data a9_pcie_tl_parents[] = {
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "gp0", },
> +	{ .fw_name = "sys", },
> +	{ .fw_name = "xtal", }
> +};
> +
> +static A9_COMP_SEL(pcie_tl, PCIE_TL_CLK_CTRL, 9, 0x7, a9_pcie_tl_parents,
> +		   NULL);
> +static A9_COMP_DIV(pcie_tl, PCIE_TL_CLK_CTRL, 0, 7);
> +static A9_COMP_GATE(pcie_tl, PCIE_TL_CLK_CTRL, 8, 0);
> +
> +static A9_COMP_SEL(pcie1_tl, PCIE_TL_CLK_CTRL, 25, 0x7, a9_pcie_tl_parents,
> +		   NULL);
> +static A9_COMP_DIV(pcie1_tl, PCIE_TL_CLK_CTRL, 16, 7);
> +static A9_COMP_GATE(pcie1_tl, PCIE_TL_CLK_CTRL, 24, 0);
> +
> +static const struct clk_parent_data a9_cmpr_parents[] = {
> +	{ .fw_name = "xtal", },
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv7", },
> +	{ .fw_name = "hifi0", },
> +	{ .fw_name = "gp1", }
> +};
> +
> +static A9_COMP_SEL(cmpr, CMPR_CLK_CTRL, 25, 0x7, a9_cmpr_parents, NULL);
> +static A9_COMP_DIV(cmpr, CMPR_CLK_CTRL, 16, 7);
> +static A9_COMP_GATE(cmpr, CMPR_CLK_CTRL, 24, 0);
> +
> +static const struct clk_parent_data a9_dewarpa_parents[] = {
> +	{ .fw_name = "fdiv2p5", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv4", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "fdiv7", },
> +	{ .fw_name = "gp0", },
> +	{ .fw_name = "hifi0", },
> +	{ .fw_name = "gp1", }
> +};
> +
> +static A9_COMP_SEL(dewarpa, DEWARP_CLK_CTRL, 9, 0x7, a9_dewarpa_parents, NULL);
> +static A9_COMP_DIV(dewarpa, DEWARP_CLK_CTRL, 0, 7);
> +static A9_COMP_GATE(dewarpa, DEWARP_CLK_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_sc_parents[] = {
> +	{ .fw_name = "fdiv2", },
> +	{ .fw_name = "fdiv3", },
> +	{ .fw_name = "fdiv5", },
> +	{ .fw_name = "xtal", }
> +};
> +
> +static A9_COMP_SEL(sc_pre, SC_CLK_CTRL, 9, 0x7, a9_sc_parents, NULL);
> +static A9_COMP_DIV(sc_pre, SC_CLK_CTRL, 0, 8);
> +static A9_COMP_GATE(sc_pre, SC_CLK_CTRL, 8, 0);
> +
> +static struct clk_regmap a9_sc = {
> +	.data = &(struct clk_regmap_div_data) {
> +		.offset = SC_CLK_CTRL,
> +		.shift = 16,
> +		.width = 4,
> +	},
> +	.hw.init = &(struct clk_init_data) {
> +		.name = "sc",
> +		.ops = &clk_regmap_divider_ops,
> +		.parent_hws = (const struct clk_hw *[]) {
> +			&a9_sc_pre.hw
> +		},
> +		.num_parents = 1,
> +		.flags = CLK_SET_RATE_PARENT,
> +	},

You can use CLK_HW_INIT_HWS() here.

Brian

