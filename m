Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:46138 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751269AbeCTSmj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Mar 2018 14:42:39 -0400
From: <ilialin@codeaurora.org>
To: "'Stephen Boyd'" <sboyd@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <sboyd@codeaurora.org>
Cc: <mark.rutland@arm.com>, <devicetree@vger.kernel.org>,
        <rnayak@codeaurora.org>, <robh@kernel.org>, <will.deacon@arm.com>,
        <amit.kucheria@linaro.org>, <tfinkel@codeaurora.org>,
        <nicolas.dechesne@linaro.org>, <celster@codeaurora.org>
References: <1518616792-29028-1-git-send-email-ilialin@codeaurora.org> <1518616792-29028-2-git-send-email-ilialin@codeaurora.org> <152148150406.242365.14021083340615345047@swboyd.mtv.corp.google.com>
In-Reply-To: <152148150406.242365.14021083340615345047@swboyd.mtv.corp.google.com>
Subject: RE: [PATCH v3 01/10] soc: qcom: Separate kryo l2 accessors from PMU driver
Date: Tue, 20 Mar 2018 20:42:23 +0200
Message-ID: <016d01d3c07b$34fa84e0$9eef8ea0$@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain;
        charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



> -----Original Message-----
> From: Stephen Boyd <sboyd@kernel.org>
> Sent: Monday, March 19, 2018 19:45
> To: Ilia Lin <ilialin@codeaurora.org>; =
linux-arm-kernel@lists.infradead.org;
> linux-arm-msm@vger.kernel.org; linux-clk@vger.kernel.org;
> sboyd@codeaurora.org
> Cc: mark.rutland@arm.com; devicetree@vger.kernel.org;
> rnayak@codeaurora.org; robh@kernel.org; will.deacon@arm.com;
> amit.kucheria@linaro.org; tfinkel@codeaurora.org; =
ilialin@codeaurora.org;
> nicolas.dechesne@linaro.org; celster@codeaurora.org
> Subject: Re: [PATCH v3 01/10] soc: qcom: Separate kryo l2 accessors =
from
> PMU driver
>=20
> Quoting Ilia Lin (2018-02-14 05:59:43)
> > diff --git a/arch/arm64/Kconfig.platforms
> > b/arch/arm64/Kconfig.platforms index fbedbd8..78a103b 100644
> > --- a/arch/arm64/Kconfig.platforms
> > +++ b/arch/arm64/Kconfig.platforms
> > @@ -145,6 +145,13 @@ config ARCH_REALTEK
> >           This enables support for the ARMv8 based Realtek chipsets,
> >           like the RTD1295.
> >
> > +config ARCH_MSM8996
> > +    bool "Enable Support for Qualcomm Technologies, Inc. MSM8996"
> > +       depends on ARCH_QCOM
>=20
> Is this really the proposed approach? Doesn't the PMU code use these
> accessors? I would think the accessors are compiled if ARCH_QCOM=3Dy =
so
> that the PMU stuff keeps working. Drop this Kconfig addition?

I'll check whether the kryo-accessors code is SOC specific or not.

>=20
> > +       help
> > +       This enables support for the MSM8996 chipset. If you do not
> > +       wish to build a kernel that runs on this chipset, say 'N' =
here.
> > +
> >  config ARCH_ROCKCHIP
> >         bool "Rockchip Platforms"
> >         select ARCH_HAS_RESET_CONTROLLER diff --git
> > a/drivers/perf/qcom_l2_pmu.c b/drivers/perf/qcom_l2_pmu.c index
> > 4fdc848..8cece9e 100644
> > --- a/drivers/perf/qcom_l2_pmu.c
> > +++ b/drivers/perf/qcom_l2_pmu.c
> > @@ -1,4 +1,4 @@
> > -/* Copyright (c) 2015-2017 The Linux Foundation. All rights =
reserved.
> > +/* Copyright (c) 2015-2018 The Linux Foundation. All rights =
reserved.
>=20
> Sorry, this makes little sense. First off, code is only being deleted =
and more
> than half the file isn't being modified so why update copyright dates?

Agree. Will roll back.

>=20
> >   *
> >   * This program is free software; you can redistribute it and/or =
modify
> >   * it under the terms of the GNU General Public License version 2 =
and
> > diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> > index dcebf28..4e91e2a 100644
> > --- a/drivers/soc/qcom/Makefile
> > +++ b/drivers/soc/qcom/Makefile
> > @@ -12,3 +12,4 @@ obj-$(CONFIG_QCOM_SMEM_STATE) +=3D
> smem_state.o
> >  obj-$(CONFIG_QCOM_SMP2P)       +=3D smp2p.o
> >  obj-$(CONFIG_QCOM_SMSM)        +=3D smsm.o
> >  obj-$(CONFIG_QCOM_WCNSS_CTRL) +=3D wcnss_ctrl.o
> > +obj-$(CONFIG_ARCH_MSM8996) +=3D  kryo-l2-accessors.o
> > diff --git a/drivers/soc/qcom/kryo-l2-accessors.c
> > b/drivers/soc/qcom/kryo-l2-accessors.c
> > new file mode 100644
> > index 0000000..6743848
> > --- /dev/null
> > +++ b/drivers/soc/qcom/kryo-l2-accessors.c
> > @@ -0,0 +1,64 @@
> > +/*
> > + * Copyright (c) 2014-2015, 2018, The Linux Foundation. All rights =
reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License version 2 =
and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
>=20
> SPDX tags?

Will do.

>=20
> > diff --git a/include/soc/qcom/kryo-l2-accessors.h
> > b/include/soc/qcom/kryo-l2-accessors.h
> > new file mode 100644
> > index 0000000..e9a5eab
> > --- /dev/null
> > +++ b/include/soc/qcom/kryo-l2-accessors.h
> > @@ -0,0 +1,22 @@
> > +/*
> > + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> > + *
> > + * This program is free software; you can redistribute it and/or
> > +modify
> > + * it under the terms of the GNU General Public License version 2 =
and
> > + * only version 2 as published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + */
> > +
> > +#ifndef __ASM_ARCH_MSM_MSM_KRYO_L2_ACCESSORS_H
> > +#define __ASM_ARCH_MSM_MSM_KRYO_L2_ACCESSORS_H
>=20
> Maybe change this tO __SOC_ARCH_QCOM_KRYO_L2_ACCESSORS_H

No problem. Will change.

>=20
> > +
> > +#ifdef CONFIG_ARCH_QCOM
> > +void set_l2_indirect_reg(u64 reg_addr, u64 val);
> > +u64 get_l2_indirect_reg(u64 reg_addr); #endif
>=20
> This ifdef isn't doing much. Drop it? Or provide the inline nop =
alternatives.

Right. I'll drop it.

