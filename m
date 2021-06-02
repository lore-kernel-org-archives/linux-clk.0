Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0595EC47080
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 01:50:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D225C613D0
	for <linux-clk@archiver.kernel.org>; Wed,  2 Jun 2021 01:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhFBBvv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Jun 2021 21:51:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:40746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230106AbhFBBvu (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Jun 2021 21:51:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 924BB613C5;
        Wed,  2 Jun 2021 01:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622598608;
        bh=QEXBABBddJQHkiD30zUYBfXYfySP/tA8d7kXCCfAwxY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=RXoeSGL7J9yi8W/2qRywWCCmeSbYr6VaKmumaKVkrz1E/fnynpAgyPZrtM//xowim
         upevPlvhl+Cw7NLCDy3wB31otd+bQLIugPaFSn/q45dl+Yuvsg9jioDGKgU2hPsHLz
         7E/f9OHTqyyoIrbw8yj4JTsRrkrEu/zrbR5B+ya5mlNKr2xzXtdnn0CtbYHs+pZE+X
         WHRdE31f91B7eHxhwQX+Ld6FJDulFYSPypVZYGKMQPrDnRSEvysJjpsKjsliod3zIe
         ZDUwIcJzOCtK1f07SC0NDx4VJyQHAUzUBfznwY8UEUMx6O7xeAYuf9azr8/OAI+UcE
         6z5uuwuWA3Bxg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210423033334.3317992-6-aisheng.dong@nxp.com>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com> <20210423033334.3317992-6-aisheng.dong@nxp.com>
Subject: Re: [PATCH 6/6] clk: imx8qm: add clock valid resource checking
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com,
        Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Date:   Tue, 01 Jun 2021 18:50:06 -0700
Message-ID: <162259860630.4130789.2941110953953498194@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2021-04-22 20:33:34)
> diff --git a/drivers/clk/imx/clk-imx8qm-rsrc.c b/drivers/clk/imx/clk-imx8=
qm-rsrc.c
> new file mode 100644
> index 000000000000..183a071cbf20
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8qm-rsrc.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2019-2021 NXP
> + *     Dong Aisheng <aisheng.dong@nxp.com>
> + */
> +
> +#include <dt-bindings/firmware/imx/rsrc.h>
> +
> +#include "clk-scu.h"
> +
> +/* Keep sorted in the ascending order */
> +static u32 imx8qm_clk_scu_rsrc_table[] =3D {

const?

> +       IMX_SC_R_A53,
