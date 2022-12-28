Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748E4C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 08:31:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232225AbiL1Ibd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 03:31:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbiL1Ibc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 03:31:32 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62A216551;
        Wed, 28 Dec 2022 00:31:30 -0800 (PST)
X-UUID: b6cc379d00bc44399e34b83d95cd5a9a-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GcaUuOgVIhiyz19WJXVeJeBFNH9yp3Z0VXXuo9zLxwE=;
        b=R2xxp2UmDyyobUZ8BvIrb3wAqgq6lA2PzJcjaKucTsEmAqjUhs47HQbUPjJ2o63v6CXMKRYvhMdbL9nPN+eFmC15d5kCAzvq00Edm2dEMXhQAr9O0M2AXty9KdQrKWf5UMfs+kBZn2mpn1psB2Yg9uWPC9NLTFKbQ2klZxE6phQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:f6a07d0e-40a7-424d-9fdb-3c77808d55d2,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:92330453-dd49-462e-a4be-2143a3ddc739,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b6cc379d00bc44399e34b83d95cd5a9a-20221228
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 290507137; Wed, 28 Dec 2022 16:31:24 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 16:31:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 16:31:23 +0800
From:   Miles Chen <miles.chen@mediatek.com>
To:     <angelogioacchino.delregno@collabora.com>
CC:     <chun-jie.chen@mediatek.com>, <daniel@makrotopia.org>,
        <devicetree@vger.kernel.org>, <fparent@baylibre.com>,
        <ikjn@chromium.org>, <johnson.wang@mediatek.com>,
        <jose.exposito89@gmail.com>, <kernel@collabora.com>,
        <krzysztof.kozlowski+dt@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
        <miles.chen@mediatek.com>, <msp@baylibre.com>,
        <mturquette@baylibre.com>, <nfraprado@collabora.com>,
        <pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>,
        <robh+dt@kernel.org>, <ryder.lee@kernel.org>,
        <sam.shih@mediatek.com>, <sboyd@kernel.org>,
        <weiyi.lu@mediatek.com>, <wenst@chromium.org>,
        <y.oudjana@protonmail.com>, <yangyingliang@huawei.com>
Subject: Re: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
Date:   Wed, 28 Dec 2022 16:31:23 +0800
Message-ID: <20221228083123.15298-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

> These two are both mtk_composite arrays, one dependent on another, but
> that's something that the clock framework is supposed to sort out and
> anyway registering them separately isn't going to ease the framework's
> job in checking dependencies.
> 
> Put the contents of top_adj_divs in top_muxes to join them together
> and register them in one shot.
> 

In mt8192, we can join top_adj_divs and top_muxes:

mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
		top_clk_data);
mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
		top_clk_data);

However, there are other top_adj_divs[] and top_muxes[] in different types so 
we cannot join them.

For example:
in drivers/clk/mediatek/clk-mt8167.c:mtk_topckgen_init():

mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
		&mt8167_clk_lock, clk_data);
mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
		base, &mt8167_clk_lock, clk_data);

So we can join top_adj_divs and top_muxes in some platforms, but we
cannot join top_adj_divs and top_muxes in some other platforms.

I'm afraid that this will confuses people.


thanks,
Miles
