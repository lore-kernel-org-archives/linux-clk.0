Return-Path: <SRS0=7G01=VW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C697C76190
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 21:11:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E57B521951
	for <linux-clk@archiver.kernel.org>; Thu, 25 Jul 2019 21:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1564089067;
	bh=CYo3ibcqoLW7F/S9064H4yTGj2/Ywl1wI1KXI8cO9jQ=;
	h=In-Reply-To:References:Subject:To:Cc:From:Date:List-ID:From;
	b=IG8HrAxlJ3WKO2WiwUWOqoraXFDKiitWkCQYcaE/wguC2v0R3QTVAl0VrKjhGLVd7
	 FEMVVZHbmoCpG2Xvf4Bg+JYNhDTBaUgsca4AokNA1cYabZkUXlQBqO/q5+w4t1jJZm
	 5b1HoUfNnLmt82t82sWqwR6qYKfS9I+7VLOkcolU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfGYVLG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Jul 2019 17:11:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40522 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbfGYVLG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Jul 2019 17:11:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0FD50218EA;
        Thu, 25 Jul 2019 21:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564089065;
        bh=CYo3ibcqoLW7F/S9064H4yTGj2/Ywl1wI1KXI8cO9jQ=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=wT8fbumh0wwybnsdU10c8jzKx0Z9uNF4KXmcnkTksF7ry3psFzsnrn+nlVPw9DyRT
         FPIfNzGFt8T1QQyEt8oAynRh4g7wAGeQWv77AVRPtyKlvq3tFI2409ySyy2PCD2tJ3
         r2D/no8G4Os9dQqO3qiC9TZVQaWd5F7TZWsGujo0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190725082002.17400-2-yong.liang@mediatek.com>
References: <20190725082002.17400-1-yong.liang@mediatek.com> <20190725082002.17400-2-yong.liang@mediatek.com>
Subject: Re: [PATCH v4,2/2] clk: reset: Modify reset-controller driver
To:     Yong Liang <yong.liang@mediatek.com>, chunhui.dai@mediatek.com,
        drinkcat@chromium.org, eddie.huang@mediatek.com,
        erin.lo@mediatek.com, jamesjj.liao@mediatek.com,
        jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com,
        mturquette@baylibre.com, owen.chen@mediatek.com,
        robh+dt@kernel.org, weiyi.lu@mediatek.com
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        "yong.liang" <yong.liang@mediatek.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 25 Jul 2019 14:11:04 -0700
Message-Id: <20190725211105.0FD50218EA@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yong Liang (2019-07-25 01:20:02)
> From: "yong.liang" <yong.liang@mediatek.com>
>=20
> Set reset signal by a register and clear reset signal by
> another register for 8183.
>=20
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---
>=20
> Base on https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git bra=
nch clk-next and https://patchwork.kernel.org/patch/10856987/

Use --base=3D in git format-patch instead.

> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk=
-mt8183.c
> index 9d8651033ae9..f695eb7eb5a1 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1204,13 +1204,24 @@ static int clk_mt8183_infra_probe(struct platform=
_device *pdev)
>  {
>         struct clk_onecell_data *clk_data;
>         struct device_node *node =3D pdev->dev.of_node;
> +       int r;
> =20
>         clk_data =3D mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> =20
>         mtk_clk_register_gates(node, infra_clks, ARRAY_SIZE(infra_clks),
>                 clk_data);
> =20
> -       return of_clk_add_provider(node, of_clk_src_onecell_get, clk_data=
);
> +       r =3D of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +       if (r) {
> +               dev_err(&pdev->dev,
> +                       "%s(): could not register clock provider: %d\n"
> +                       ,__func__, r);
> +               return r;
> +       }
> +
> +       mtk_register_reset_controller_set_clr(node, 4, 0x120);

What is this line doing? Maybe add a comment so we understand what 0x120
is.

> +
> +       return r;
>  }
> =20
>  static int clk_mt8183_mcu_probe(struct platform_device *pdev)
> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> index d3551d5efef2..fccc8fcb6a20 100644
> --- a/drivers/clk/mediatek/reset.c
> +++ b/drivers/clk/mediatek/reset.c
> @@ -95,3 +131,18 @@ void mtk_register_reset_controller(struct device_node=
 *np,
>                 return;
>         }
>  }
> +
> +void mtk_register_reset_controller(struct device_node *np,
> +       unsigned int num_regs, int regofs)
> +{
> +       mtk_register_reset_controller_common(np, num_regs, regofs,
> +               &mtk_reset_ops);
> +}
> +
> +void mtk_register_reset_controller_set_clr(struct device_node *np,
> +       unsigned int num_regs, int regofs)
> +{
> +       mtk_register_reset_controller_common(np, num_regs, regofs,
> +               &mtk_reset_ops_set_clr);
> +}
> +

If this is an extra newline at the end of the file, please remove it.

> diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/inclu=
de/dt-bindings/reset-controller/mt8183-resets.h
> new file mode 100644
> index 000000000000..81136c932f75
> --- /dev/null
> +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> @@ -0,0 +1,88 @@
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> + * See  http://www.gnu.org/licenses/gpl-2.0.html for more details.

Please use SPDX tags instead of this boilerplate.

