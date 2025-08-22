Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1C72F3638
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755855402; cv=none; b=EtLs4Dit3C5f/rbnd2WsuP+AB1osvW8avNFdnovfqikp0uBH21DvDQQei+KjgLjUyzYg3cJ1ZMVW87vG6OYAMTU5wB8VRwnRpXVyK1rVMUI+0VYGB3ABZeWFnhtIwu30P5F3v6wO5WPWV1i998yrph/0lWMA6pvS/uyT4mmU7mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755855402; c=relaxed/simple;
	bh=Ru72dzH6CcO3HdmshXWVQKHfLm0onn8kOzSjOBskji8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uovoKYz8rBt5yap194FxYrTnOIhI0z6FHJaAoZa1Y5AEDgVDUGq3P+PutcsJgHaHH97WGjZezksvQ9+ItQUquCg2yXm7AGkFz+FiDJJp7CgxXSACGaDxVL5VOuE8Br2L2KTMeizfky7r4OurCsQiybwJimKk/PTANl6IA8ymlng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sMhN6xSX; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sMhN6xSX"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e94f573e4f5so1469475276.2
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 02:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755855399; x=1756460199; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kf+CyVGh1QHS1PkbjKcHGY/6k+CR5O9UX200twaR+/E=;
        b=sMhN6xSXwPTTw9NPpysFiBYWXbZr0w0/DJYIdY5/HD1c02jYe9qp+95hIMv0kqHBCD
         aPbUheGinj+9KTmiJdM+e5tiXj4YtHhWlZnwrNVMYSFJ+X8e2s4cfVMQx+p6yA1VcVmr
         MHQ2hzzSXTAVrj3LJdrFjEebJhnFm7IW/eBXfV6vfbXTYp4B+GZ0ArLix7Bl1AhJQpCK
         perrDvpOCtyQ89Hx9abxTIKZiG7aNCrUM9fcSChGHQG/asEtg1cB54CSBO6gaHdf73A7
         oOc+WIHDunvBTOaszMgoDW/aGKG8ySQ2UEwwYzLK9/xpNcTmoH4JRNd8BqtXqkBgu1OP
         YeGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755855399; x=1756460199;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kf+CyVGh1QHS1PkbjKcHGY/6k+CR5O9UX200twaR+/E=;
        b=sWn3z8kDdkjmCv80P8xVSPJRpe9HbRs+UA1dwmcse20U9T+1S480Cr0z55kQkk9Wqy
         ifP1+JrSdoWAwFkW1ewfnmB+hND0HocZ2mhTlug1WG5RP0BxHd8soxOFgn18wsthuVhh
         zHaYq6WyZ0cxK24G8XxvDgdCTxw5J3eCR6qxpiHRS1ZW5fAkxNltz3OmyoyI58tXog61
         Us2FKBlndbCoFICK5fu6nEAi/Zso22ponKACDYg+lyy/PcLx24UxvxePqt6Kvc6TgQfz
         5aHprp3wU3Io/yJKbJA+Pv0YF/w28xMbqCgaE4Dl9vo5dbEP/cKDbaH8QVpw2HH9klUO
         zTQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWh8U4bBUAWmq3ZQunlPKTDDJGH6ZhG22bttbcZ7OD+F02AJCKFdH8sxGe3o7JpxDnQfDgxijxti2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvWDOEZouFG+U9YsBkwRSj1PYwuM7fnfuSRkHW60nZqCbxn3W
	eOKkqi0Wz/0q2Y8L3r7VMp7H7jZ7ooWMeJbKNgo2kkhn23kOWqjaMTOtx49SpzL3D5TSk5HRq3z
	bEIY9wq9uMHq5n4q9IsBbndqpbSKs4vCeBY4WkA8jQg==
X-Gm-Gg: ASbGnctFk5QFirnX0auFvvzvyKlLnK9YrrQ1qGxGnIt6yWlBcl8h9emuNgMT5QdJP2e
	1Ptwm2LO+zfa3oqowZijJBygjU35Idw6tBKFGcQYD75eOJv5ldIu1pxoNAhtI53ofl3zZL+7TNg
	/y7jQLQtET2CP1A1MYb5puopA1xe7y0l3NTApTm28u4YQ/ahXsa17wq/6L3zoupdzyG7pAeYwEc
	213zgN8
X-Google-Smtp-Source: AGHT+IFrNSo/L6uEHcDP8r2F6liyi1v4cmZgTHZpa0LIkug04eoxV4wP2Ed9/DxooBcTty3gQ4cziEUnYQDUIX8w/ww=
X-Received: by 2002:a05:690c:4493:b0:71e:841f:6799 with SMTP id
 00721157ae682-71fdc3294d0mr22283917b3.21.1755855398395; Fri, 22 Aug 2025
 02:36:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250821-pxa1908-genpd-v2-0-eba413edd526@dujemihanovic.xyz> <20250821-pxa1908-genpd-v2-3-eba413edd526@dujemihanovic.xyz>
In-Reply-To: <20250821-pxa1908-genpd-v2-3-eba413edd526@dujemihanovic.xyz>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 22 Aug 2025 11:36:02 +0200
X-Gm-Features: Ac12FXwTIkzJKtDqOTwBi8LGRZbQGotFqgLm5vzl0UBnThOpGCgdrIxuC96gIxg
Message-ID: <CAPDyKFoHWNuSmnN0e=QR73r0Ea-XJogbB8S3K+_=VRovzXL2Sw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] clk: mmp: Add PXA1908 power domain driver
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Wronek <david@mainlining.org>, Karel Balej <balejk@matfyz.cz>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Aug 2025 at 13:19, Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz> =
wrote:
>
> Marvell's PXA1908 SoC has a few power domains for its VPU, GPU, image
> processor and DSI PHY. Add a driver to control these.
>
> Also create a separate Kconfig entry for the PXA1908 clock drivers to
> allow satisfying the driver's dependencies.
>
> Signed-off-by: Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> ---
> v2:
> - Move to clk subsystem, instantiate the driver from the APMU clock
>   driver
> - Drop clock handling
> - Squash MAINTAINERS patch
> ---
>  MAINTAINERS                             |   5 +
>  drivers/clk/Kconfig                     |   1 +
>  drivers/clk/mmp/Kconfig                 |  14 ++
>  drivers/clk/mmp/Makefile                |   5 +-
>  drivers/clk/mmp/clk-pxa1908-apmu.c      |   2 +-
>  drivers/clk/mmp/clk.h                   |   2 +
>  drivers/clk/mmp/pxa1908-power-domains.c | 253 ++++++++++++++++++++++++++=
++++++
>  7 files changed, 280 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index daf520a13bdf6a991c0160a96620f40308c29ee0..309090a5ba6c03a2c00d3e39a=
896748958ffa593 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2869,9 +2869,14 @@ ARM/Marvell PXA1908 SOC support
>  M:     Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
>  S:     Maintained
> +C:     ircs://irc.oftc.net/pxa1908-mainline
> +F:     Documentation/devicetree/bindings/clock/marvell,pxa1908.yaml
>  F:     arch/arm64/boot/dts/marvell/mmp/
> +F:     drivers/clk/mmp/Kconfig
>  F:     drivers/clk/mmp/clk-pxa1908*.c
> +F:     drivers/clk/mmp/pxa1908-power-domains.c
>  F:     include/dt-bindings/clock/marvell,pxa1908.h
> +F:     include/dt-bindings/power/marvell,pxa1908-power.h
>
>  ARM/Mediatek RTC DRIVER
>  M:     Eddie Huang <eddie.huang@mediatek.com>
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 4d56475f94fc1e28823fe6aee626a96847d4e6d5..68a9641fc649a23013b2d8a9e=
9f5ecb31d623abb 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -511,6 +511,7 @@ source "drivers/clk/imx/Kconfig"
>  source "drivers/clk/ingenic/Kconfig"
>  source "drivers/clk/keystone/Kconfig"
>  source "drivers/clk/mediatek/Kconfig"
> +source "drivers/clk/mmp/Kconfig"
>  source "drivers/clk/meson/Kconfig"
>  source "drivers/clk/mstar/Kconfig"
>  source "drivers/clk/microchip/Kconfig"
> diff --git a/drivers/clk/mmp/Kconfig b/drivers/clk/mmp/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..9dca5b50fd15a1d2ca71163c6=
49a51592da15021
> --- /dev/null
> +++ b/drivers/clk/mmp/Kconfig
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config COMMON_CLK_PXA1908
> +       bool "Clock driver for Marvell PXA1908"
> +       depends on ARCH_MMP || COMPILE_TEST
> +       depends on OF
> +       default y if ARCH_MMP && ARM64
> +       select PM
> +       select PM_GENERIC_DOMAINS
> +       select PM_GENERIC_DOMAINS_OF
> +       select REGMAP_MMIO
> +       help
> +         This driver supports the Marvell PXA1908 SoC clocks. The SoC's =
power
> +         domains are also supported by the driver.
> diff --git a/drivers/clk/mmp/Makefile b/drivers/clk/mmp/Makefile
> index 062cd87fa8ddcc6808b6236f8c4dd524aaf02030..0b9ad29087ff23b8dc247bfd3=
8f0e55382e16759 100644
> --- a/drivers/clk/mmp/Makefile
> +++ b/drivers/clk/mmp/Makefile
> @@ -11,4 +11,7 @@ obj-$(CONFIG_MACH_MMP_DT) +=3D clk-of-pxa168.o clk-of-p=
xa910.o
>  obj-$(CONFIG_COMMON_CLK_MMP2) +=3D clk-of-mmp2.o clk-pll.o pwr-island.o
>  obj-$(CONFIG_COMMON_CLK_MMP2_AUDIO) +=3D clk-audio.o
>
> -obj-$(CONFIG_ARCH_MMP) +=3D clk-of-pxa1928.o clk-pxa1908-apbc.o clk-pxa1=
908-apbcp.o clk-pxa1908-apmu.o clk-pxa1908-mpmu.o
> +obj-$(CONFIG_COMMON_CLK_PXA1908) +=3D clk-pxa1908-apbc.o clk-pxa1908-apb=
cp.o \
> +       clk-pxa1908-mpmu.o clk-pxa1908-apmu.o pxa1908-power-domains.o
> +
> +obj-$(CONFIG_ARCH_MMP) +=3D clk-of-pxa1928.o
> diff --git a/drivers/clk/mmp/clk-pxa1908-apmu.c b/drivers/clk/mmp/clk-pxa=
1908-apmu.c
> index d3a070687fc5b9fb5338f377f82e7664ca0aac29..3d4494cfc9bc28e1e614a11f5=
6aa3d211fb6ec26 100644
> --- a/drivers/clk/mmp/clk-pxa1908-apmu.c
> +++ b/drivers/clk/mmp/clk-pxa1908-apmu.c
> @@ -98,7 +98,7 @@ static int pxa1908_apmu_probe(struct platform_device *p=
dev)
>
>         pxa1908_axi_periph_clk_init(pxa_unit);
>
> -       return 0;
> +       return pxa1908_pd_register(&pdev->dev);
>  }
>
>  static const struct of_device_id pxa1908_apmu_match_table[] =3D {
> diff --git a/drivers/clk/mmp/clk.h b/drivers/clk/mmp/clk.h
> index c83cec169ddc5e3fcd0561cf857f248178c25b68..6d3d089a0372fa48c8f61acea=
cdd1b2059f2c8dd 100644
> --- a/drivers/clk/mmp/clk.h
> +++ b/drivers/clk/mmp/clk.h
> @@ -258,4 +258,6 @@ struct generic_pm_domain *mmp_pm_domain_register(cons=
t char *name,
>                 u32 power_on, u32 reset, u32 clock_enable,
>                 unsigned int flags, spinlock_t *lock);
>
> +int pxa1908_pd_register(struct device *dev);
> +
>  #endif
> diff --git a/drivers/clk/mmp/pxa1908-power-domains.c b/drivers/clk/mmp/px=
a1908-power-domains.c

By looking at the implementation of the power-domain code below, it
seems to me that this code is better maintained within the pmdomain
subsystem (drivers/pmdomain/pxa perhaps). May I suggest that you move
it there.

I guess the easiest way to do this is to export the
pxa1908_pd_register() function - but you could explore using the
auxiliary bus too, to instantiate a power-domain driver as an
auxiliary driver.

Other than that, the code looks good to me!

Kind regards
Uffe


> new file mode 100644
> index 0000000000000000000000000000000000000000..9f698a17e5a920d0472b74fce=
137b42cae0569d2
> --- /dev/null
> +++ b/drivers/clk/mmp/pxa1908-power-domains.c
> @@ -0,0 +1,253 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright 2025 Duje Mihanovi=C4=87 <duje@dujemihanovic.xyz>
> + */
> +
> +#include <linux/container_of.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/regmap.h>
> +#include <linux/units.h>
> +
> +#include <dt-bindings/power/marvell,pxa1908-power.h>
> +
> +#include "clk.h"
> +
> +/* VPU, GPU, ISP */
> +#define APMU_PWR_CTRL_REG      0xd8
> +#define APMU_PWR_BLK_TMR_REG   0xdc
> +#define APMU_PWR_STATUS_REG    0xf0
> +
> +/* DSI */
> +#define APMU_DEBUG             0x88
> +#define DSI_PHY_DVM_MASK       BIT(31)
> +
> +#define POWER_ON_LATENCY_US    300
> +#define POWER_OFF_LATENCY_US   20
> +
> +#define NR_DOMAINS     5
> +
> +struct pxa1908_pd_ctrl {
> +       struct genpd_onecell_data onecell_data;
> +       struct generic_pm_domain *domains[NR_DOMAINS];
> +       struct regmap *base;
> +};
> +
> +struct pxa1908_pd_data {
> +       u32 reg_clk_res_ctrl;
> +       u32 hw_mode;
> +       u32 pwr_state;
> +       bool keep_on;
> +       int id;
> +};
> +
> +struct pxa1908_pd {
> +       const struct pxa1908_pd_data data;
> +       struct pxa1908_pd_ctrl *ctrl;
> +       struct generic_pm_domain genpd;
> +       struct device *dev;
> +       bool initialized;
> +       int num_clks;
> +};
> +
> +static bool pxa1908_pd_is_on(struct pxa1908_pd *pd)
> +{
> +       struct pxa1908_pd_ctrl *ctrl =3D pd->ctrl;
> +
> +       return regmap_test_bits(ctrl->base, APMU_PWR_STATUS_REG, pd->data=
.pwr_state);
> +}
> +
> +static int pxa1908_pd_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D pd->ctrl;
> +       const struct pxa1908_pd_data *data =3D &pd->data;
> +       unsigned int status;
> +       int ret =3D 0;
> +
> +       regmap_set_bits(ctrl->base, data->reg_clk_res_ctrl, data->hw_mode=
);
> +       if (data->id !=3D PXA1908_POWER_DOMAIN_ISP)
> +               regmap_write(ctrl->base, APMU_PWR_BLK_TMR_REG, 0x20001fff=
);
> +       regmap_set_bits(ctrl->base, APMU_PWR_CTRL_REG, data->pwr_state);
> +
> +       usleep_range(POWER_ON_LATENCY_US, POWER_ON_LATENCY_US * 2);
> +
> +       ret =3D regmap_read_poll_timeout(ctrl->base, APMU_PWR_STATUS_REG,=
 status,
> +                                      status & data->pwr_state, 6, 25 * =
USEC_PER_MSEC);
> +       if (ret =3D=3D -ETIMEDOUT)
> +               dev_err(pd->dev, "timed out powering on domain '%s'\n", p=
d->genpd.name);
> +
> +       return ret;
> +}
> +
> +static int pxa1908_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D pd->ctrl;
> +       const struct pxa1908_pd_data *data =3D &pd->data;
> +       unsigned int status;
> +       int ret;
> +
> +       regmap_clear_bits(ctrl->base, APMU_PWR_CTRL_REG, data->pwr_state)=
;
> +
> +       usleep_range(POWER_OFF_LATENCY_US, POWER_OFF_LATENCY_US * 2);
> +
> +       ret =3D regmap_read_poll_timeout(ctrl->base, APMU_PWR_STATUS_REG,=
 status,
> +                                      !(status & data->pwr_state), 6, 25=
 * USEC_PER_MSEC);
> +       if (ret =3D=3D -ETIMEDOUT) {
> +               dev_err(pd->dev, "timed out powering off domain '%s'\n", =
pd->genpd.name);
> +               return ret;
> +       }
> +
> +       return regmap_clear_bits(ctrl->base, data->reg_clk_res_ctrl, data=
->hw_mode);
> +}
> +
> +static inline int pxa1908_dsi_power_on(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D pd->ctrl;
> +
> +       return regmap_set_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK);
> +}
> +
> +static inline int pxa1908_dsi_power_off(struct generic_pm_domain *genpd)
> +{
> +       struct pxa1908_pd *pd =3D container_of(genpd, struct pxa1908_pd, =
genpd);
> +       struct pxa1908_pd_ctrl *ctrl =3D pd->ctrl;
> +
> +       return regmap_clear_bits(ctrl->base, APMU_DEBUG, DSI_PHY_DVM_MASK=
);
> +}
> +
> +#define DOMAIN(_id, _name, ctrl, mode, state) \
> +       [_id] =3D { \
> +               .data =3D { \
> +                       .reg_clk_res_ctrl =3D ctrl, \
> +                       .hw_mode =3D BIT(mode), \
> +                       .pwr_state =3D BIT(state), \
> +                       .id =3D _id, \
> +               }, \
> +               .genpd =3D { \
> +                       .name =3D _name, \
> +                       .power_on =3D pxa1908_pd_power_on, \
> +                       .power_off =3D pxa1908_pd_power_off, \
> +               }, \
> +       }
> +
> +static struct pxa1908_pd domains[NR_DOMAINS] =3D {
> +       DOMAIN(PXA1908_POWER_DOMAIN_VPU, "vpu", 0xa4, 19, 2),
> +       DOMAIN(PXA1908_POWER_DOMAIN_GPU, "gpu", 0xcc, 11, 0),
> +       DOMAIN(PXA1908_POWER_DOMAIN_GPU2D, "gpu2d", 0xf4, 11, 6),
> +       DOMAIN(PXA1908_POWER_DOMAIN_ISP, "isp", 0x38, 15, 4),
> +       [PXA1908_POWER_DOMAIN_DSI] =3D {
> +               .genpd =3D {
> +                       .name =3D "dsi",
> +                       .power_on =3D pxa1908_dsi_power_on,
> +                       .power_off =3D pxa1908_dsi_power_off,
> +                       /*
> +                        * TODO: There is no DSI driver written yet and u=
ntil then we probably
> +                        * don't want to power off the DSI PHY ever.
> +                        */
> +                       .flags =3D GENPD_FLAG_ALWAYS_ON,
> +               },
> +               .data =3D {
> +                       /* See above. */
> +                       .keep_on =3D true,
> +               },
> +       },
> +};
> +
> +static void pxa1908_pd_cleanup(struct pxa1908_pd_ctrl *ctrl)
> +{
> +       struct pxa1908_pd *pd;
> +       int ret;
> +
> +       for (int i =3D NR_DOMAINS - 1; i >=3D 0; i--) {
> +               pd =3D &domains[i];
> +
> +               if (!pd->initialized)
> +                       continue;
> +
> +               ret =3D pm_genpd_remove(&pd->genpd);
> +               if (ret)
> +                       dev_err(pd->dev, "failed to remove domain '%s': %=
d\n",
> +                               pd->genpd.name, ret);
> +               if (pxa1908_pd_is_on(pd) && !pd->data.keep_on)
> +                       pxa1908_pd_power_off(&pd->genpd);
> +       }
> +}
> +
> +static int
> +pxa1908_pd_init(struct pxa1908_pd_ctrl *ctrl, int id, struct device *dev=
)
> +{
> +       struct pxa1908_pd *pd =3D &domains[id];
> +       int ret;
> +
> +       pd->dev =3D dev;
> +       pd->ctrl =3D ctrl;
> +       ctrl->domains[id] =3D &pd->genpd;
> +
> +       /* Make sure the state of the hardware is synced with the domain =
table above. */
> +       if (pd->data.keep_on) {
> +               ret =3D pd->genpd.power_on(&pd->genpd);
> +               if (ret) {
> +                       dev_err(dev, "failed to power on domain '%s': %d\=
n", pd->genpd.name, ret);
> +                       return ret;
> +               }
> +       } else {
> +               if (pxa1908_pd_is_on(pd)) {
> +                       dev_warn(dev,
> +                                "domain '%s' is on despite being default=
 off; powering off\n",
> +                                pd->genpd.name);
> +
> +                       ret =3D pxa1908_pd_power_off(&pd->genpd);
> +                       if (ret) {
> +                               dev_err(dev, "failed to power off domain =
'%s': %d\n",
> +                                       pd->genpd.name, ret);
> +                               return ret;
> +                       }
> +               }
> +       }
> +
> +       ret =3D pm_genpd_init(&pd->genpd, NULL, !pd->data.keep_on);
> +       if (ret) {
> +               dev_err(dev, "domain '%s' failed to initialize: %d\n", pd=
->genpd.name, ret);
> +               return ret;
> +       }
> +
> +       pd->initialized =3D true;
> +
> +       return 0;
> +}
> +
> +int pxa1908_pd_register(struct device *dev)
> +{
> +       struct pxa1908_pd_ctrl *ctrl;
> +       int ret;
> +
> +       ctrl =3D devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
> +       if (!ctrl)
> +               return -ENOMEM;
> +
> +       ctrl->base =3D syscon_node_to_regmap(dev->of_node);
> +       if (IS_ERR(ctrl->base)) {
> +               dev_err(dev, "no regmap available\n");
> +               return PTR_ERR(ctrl->base);
> +       }
> +
> +       ctrl->onecell_data.domains =3D ctrl->domains;
> +       ctrl->onecell_data.num_domains =3D NR_DOMAINS;
> +
> +       for (int i =3D 0; i < NR_DOMAINS; i++) {
> +               ret =3D pxa1908_pd_init(ctrl, i, dev);
> +               if (ret)
> +                       goto err;
> +       }
> +
> +       return of_genpd_add_provider_onecell(dev->of_node, &ctrl->onecell=
_data);
> +
> +err:
> +       pxa1908_pd_cleanup(ctrl);
> +       return ret;
> +}
>
> --
> 2.50.1
>
