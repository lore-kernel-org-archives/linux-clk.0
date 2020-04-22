Return-Path: <SRS0=SEET=6G=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E93C54FCB
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 20:23:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FE4B20767
	for <linux-clk@archiver.kernel.org>; Wed, 22 Apr 2020 20:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587587025;
	bh=NfYIymhT5oWGyg/YrRLc65Jqe+ehrP52z6HvFPRKxrI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=qHeNNLTVlkr8o6fzmsiKoLFgAoH5DupdoDyO9C5NO29zgVcEC3dqZC9bEoNheRDtO
	 +eiLidBWXQvIStbEzcC4eh3F5LRDfmMdHZ00q/opKNhfVcuhKbIo5NXikFwJUn9cxk
	 Vf40xosMvPgicEXj4bDlozKCmndM+8axYYD5o+E4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgDVUXp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Apr 2020 16:23:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35034 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725779AbgDVUXo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 22 Apr 2020 16:23:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B6B020767;
        Wed, 22 Apr 2020 20:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587587024;
        bh=NfYIymhT5oWGyg/YrRLc65Jqe+ehrP52z6HvFPRKxrI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=Nv7TrJZxEcje1jAyusOdSw0AT2sTjg87vAS8mIsO0/8496AEvjg9e9DU+yQX1f38n
         MnJjfcxMcL02nNt3bSXnk/AYGxUdZQw+axDhA3wcQ0sxIX662pBOV7wtU+sq/jHahe
         LftQDJ5iUCLpCTVmH7OVl5Hp99a+hmEtI0pDTnds=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1585224008-15730-2-git-send-email-loic.poulain@linaro.org>
References: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org> <1585224008-15730-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 1/4] soc: qcom: Separate kryo l2 accessors from PMU driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Ilia Lin <ilialin@codeaurora.org>,
        Loic Poulain <loic.poulain@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>, bjorn.andersson@linaro.org,
        mturquette@baylibre.com
Date:   Wed, 22 Apr 2020 13:23:43 -0700
Message-ID: <158758702339.163502.6382911440089423525@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Loic Poulain (2020-03-26 05:00:05)
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 9fb35c8..1c76901 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -25,3 +25,4 @@ obj-$(CONFIG_QCOM_APR) +=3D apr.o
>  obj-$(CONFIG_QCOM_LLCC) +=3D llcc-qcom.o
>  obj-$(CONFIG_QCOM_RPMHPD) +=3D rpmhpd.o
>  obj-$(CONFIG_QCOM_RPMPD) +=3D rpmpd.o
> +obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=3D        kryo-l2-accessors.o

Put this after QCOM_LLCC to keep it sorted by Kconfig name?

> diff --git a/drivers/soc/qcom/kryo-l2-accessors.c b/drivers/soc/qcom/kryo=
-l2-accessors.c
> new file mode 100644
> index 0000000..75fd07a
> --- /dev/null
> +++ b/drivers/soc/qcom/kryo-l2-accessors.c
> @@ -0,0 +1,56 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/spinlock.h>
> +#include <asm/sysreg.h>
> +#include <soc/qcom/kryo-l2-accessors.h>
> +
> +#define L2CPUSRSELR_EL1         sys_reg(3, 3, 15, 0, 6)
> +#define L2CPUSRDR_EL1           sys_reg(3, 3, 15, 0, 7)
> +
> +static DEFINE_RAW_SPINLOCK(l2_access_lock);
> +
> +/**
> + * kryo_l2_set_indirect_reg() - write value to an L2 register
> + * @reg: Address of L2 register.
> + * @value: Value to be written to register.
> + *
> + * Use architecturally required barriers for ordering between system reg=
ister
> + * accesses, and system registers with respect to device memory
> + */
> +void kryo_l2_set_indirect_reg(u64 reg, u64 val)
> +{
> +       unsigned long flags;
> +
> +       raw_spin_lock_irqsave(&l2_access_lock, flags);
> +       write_sysreg_s(reg, L2CPUSRSELR_EL1);
> +       isb();

Any include for barrier.h? Or it comes from spinlock.h?

> +       write_sysreg_s(val, L2CPUSRDR_EL1);
> +       isb();
> +       raw_spin_unlock_irqrestore(&l2_access_lock, flags);
> +}
> +EXPORT_SYMBOL(kryo_l2_set_indirect_reg);
