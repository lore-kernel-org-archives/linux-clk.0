Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B1C1C282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 21:54:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 083012184E
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 21:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1549403643;
	bh=EF6oAov4FZsZUEZApD4/9VD0zWAzFZK/cN3cC9KVRdY=;
	h=Subject:From:Cc:References:To:In-Reply-To:Date:List-ID:From;
	b=v5aNQbM2wFOsj2VBtFVOmBWcZIHiRqEYKCYt+P1KzOkooxvxrdp7JLQUgWPyz/FVu
	 +Cd9fxbonSuoYsOuwgCl9MHWu2pqYBtCE+qUwvP3Jsuz0UBNFSEt2qXEjBRb/8EsuX
	 J0mH+JtpRtAAzTSSPo/T2v7krpRkKCATY7+e2GSc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728300AbfBEVyC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 16:54:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:46362 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726114AbfBEVyB (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 Feb 2019 16:54:01 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 831632077B;
        Tue,  5 Feb 2019 21:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1549403640;
        bh=EF6oAov4FZsZUEZApD4/9VD0zWAzFZK/cN3cC9KVRdY=;
        h=Subject:From:Cc:References:To:In-Reply-To:Date:From;
        b=2KRqsde47ZODgl9H79npxY2hIfJwFaBPO+YLsY/RSsPEgcbcdCTzVK9+aTqP86/V7
         KXRDI77QqlkS4rUmdZT12JNQCpf4F1trNyNwI5N+RIuwgWdKaRHNUiDgGgcqLCzR3d
         dHx1sF7SLgpP3Xvg8g//54uVEvGOcJpBYt6FhZ5U=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 4/8] clk: qcom: Add WCSS Q6DSP clock controller for QCS404
From:   Stephen Boyd <sboyd@kernel.org>
Message-ID: <154940363974.169292.12160904228403236091@swboyd.mtv.corp.google.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
References: <20190202152626.1006-1-govinds@codeaurora.org> <20190202152626.1006-5-govinds@codeaurora.org>
User-Agent: alot/0.8
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
In-Reply-To: <20190202152626.1006-5-govinds@codeaurora.org>
Date:   Tue, 05 Feb 2019 13:53:59 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2019-02-02 07:26:22)
>  drivers/clk/qcom/Kconfig          |   8 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/common.c         |  20 +++
>  drivers/clk/qcom/common.h         |   3 +-
>  drivers/clk/qcom/lpasscc-sdm845.c |  23 +--

Please split this into a patch that pulls out the helper and uses it in
lpasscc-sdm845 and then this patch that adds wcsscc.

>  drivers/clk/qcom/wcsscc-qcs404.c  | 282 ++++++++++++++++++++++++++++++
>  6 files changed, 315 insertions(+), 22 deletions(-)
>  create mode 100644 drivers/clk/qcom/wcsscc-qcs404.c
>=20
> diff --git a/drivers/clk/qcom/wcsscc-qcs404.c b/drivers/clk/qcom/wcsscc-q=
cs404.c
> new file mode 100644
> index 000000000000..20306b494b2d
> --- /dev/null
> +++ b/drivers/clk/qcom/wcsscc-qcs404.c
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>

Is this include used?

> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,wcss-qcs404.h>
> +
> +#include "clk-regmap.h"
> +#include "clk-branch.h"
> +#include "common.h"
> +#include "reset.h"
> +
> +/* Q6SSTOP clocks. These clocks are voted
> + * by remoteproc client when loaded from
> + * user space, system hang is seen when CCF turns
> + * off unused clocks. As a temp solution use
> + * CLK_IGNORE_UNUSED flags which prevent these
> + * clocks from being gated during bootup.

This seems similar to the lpass clk discussion that Taniya and I are
having. The comment makes it sounds like we're relying on the clks being
enabled out of the bootloader again and thus we're not disabling them
during late init so that they can be left enabled until some later time.
Is that the case here? If so, why isn't the remoteproc turning the clks
on that it needs to be on before it boots up the remote processor?

> + */
> +static struct clk_branch lcc_ahbfabric_cbc_clk =3D {
> +       .halt_reg =3D 0x1b004,
> +       .halt_check =3D BRANCH_VOTED,
> +       .clkr =3D {
> +               .enable_reg =3D 0x1b004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "lcc_ahbfabric_cbc_clk",
> +                       .ops =3D &clk_branch2_ops,
> +                       .flags =3D CLK_IGNORE_UNUSED,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_regmap *wcss_q6sstop_qcs404_clocks[] =3D {
> +       [WCSS_AHBFABRIC_CBCR_CLK] =3D &lcc_ahbfabric_cbc_clk.clkr,
> +       [WCSS_AHBS_CBCR_CLK] =3D &lcc_q6ss_ahbs_cbc_clk.clkr,
> +       [WCSS_TCM_CBCR_CLK] =3D &lcc_q6ss_tcm_slave_cbc_clk.clkr,
> +       [WCSS_AHBM_CBCR_CLK] =3D &lcc_q6ss_ahbm_cbc_clk.clkr,
> +       [WCSS_AXIM_CBCR_CLK] =3D &lcc_q6ss_axim_cbc_clk.clkr,
> +       [WCSS_BCR_CBCR_CLK] =3D &lcc_q6ss_bcr_sleep_clk.clkr,
> +};
> +
> +static const struct qcom_reset_map qdsp6ss_qcs404_resets[] =3D {
> +       [Q6SSTOP_QDSP6SS_RESET] =3D {0x14, 0},

Nitpick: Add spaces around { and } so it looks like { 0x14, 0 }

> +       [Q6SSTOP_QDSP6SS_CORE_RESET] =3D {0x14, 1},
> +       [Q6SSTOP_QDSP6SS_BUS_RESET] =3D {0x14, 2},
> +       [Q6SSTOP_CORE_ARCH_RESET] =3D {0x14, 12},
> +};
> +
