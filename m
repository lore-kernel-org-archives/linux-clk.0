Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 501E5C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 214DB218B8
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 15:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565277506;
	bh=GBreKkzgwLBpfgFjLLgpU1KqC2MjQOWS3c7usXsHeh8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=a88yEVUmtMvxrmybfD6zfwv9AYO5cEszHWn568OEdqCKr2Xy0qqi9eWYl4hLeKFlw
	 KY3abtLuSL4djac8wAzTtdFsSiKxqzxD9aSaG6BTsvnMtse1Toplt/dvwggN+HcQKa
	 hwSZyzhe3TK2YsCJJzKzpLFr1TmiS6io5p+Xmj2E=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732577AbfHHPSZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 11:18:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:47196 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731038AbfHHPSZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 11:18:25 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 97D9E218B6;
        Thu,  8 Aug 2019 15:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565277504;
        bh=GBreKkzgwLBpfgFjLLgpU1KqC2MjQOWS3c7usXsHeh8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=izYzRRnCgZ34ZB9Xp6roK3Vuykt0YcaFUjxA15Wlcnx8p0+ClBJoAh5gcErapUjkf
         nF9sO52BI2j4PEVO0FUVwE0/6IQHnRl/6XgempRnSqFtquMcfSRvyjieRoxnutKeLT
         y4d+GO3xn7dbQnvB8WHjJzhSS2e0t+eZMWRNAaac=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190726070135.14347-2-yong.liang@mediatek.com>
References: <20190726070135.14347-1-yong.liang@mediatek.com> <20190726070135.14347-2-yong.liang@mediatek.com>
Subject: Re: [PATCH v5,2/2] clk: reset: Modify reset-controller driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        "yong.liang" <yong.liang@mediatek.com>
To:     Yong Liang <yong.liang@mediatek.com>, chunhui.dai@mediatek.com,
        drinkcat@chromium.org, eddie.huang@mediatek.com,
        erin.lo@mediatek.com, jamesjj.liao@mediatek.com,
        jasu@njomotys.info, mark.rutland@arm.com, matthias.bgg@gmail.com,
        mturquette@baylibre.com, owen.chen@mediatek.com,
        robh+dt@kernel.org, weiyi.lu@mediatek.com
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 08:18:23 -0700
Message-Id: <20190808151824.97D9E218B6@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Yong Liang (2019-07-26 00:01:35)
> From: "yong.liang" <yong.liang@mediatek.com>
>=20
> Set reset signal by a register and
> clear reset signal by another register for 8183.
>=20
> Signed-off-by: yong.liang <yong.liang@mediatek.com>
> ---

Applied to clk-next with this squashed in

diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-m=
t8183.c
index 3f1428ed619b..94bbadc0d259 100644
--- a/drivers/clk/mediatek/clk-mt8183.c
+++ b/drivers/clk/mediatek/clk-mt8183.c
@@ -1198,8 +1198,8 @@ static int clk_mt8183_infra_probe(struct platform_dev=
ice *pdev)
 	r =3D of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
 	if (r) {
 		dev_err(&pdev->dev,
-			"%s(): could not register clock provider: %d\n"
-			,__func__, r);
+			"%s(): could not register clock provider: %d\n",
+			__func__, r);
 		return r;
 	}
=20
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index 17df8f8b57ea..cb939c071b0c 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -90,7 +90,7 @@ static const struct reset_control_ops mtk_reset_ops_set_c=
lr =3D {
 	.reset =3D mtk_reset_set_clr,
 };
=20
-void mtk_register_reset_controller_common(struct device_node *np,
+static void mtk_register_reset_controller_common(struct device_node *np,
 			unsigned int num_regs, int regofs,
 			const struct reset_control_ops *reset_ops)
 {
