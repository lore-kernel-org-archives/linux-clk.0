Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B14C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 05:58:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234605AbiL3F6k (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 00:58:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbiL3F6V (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 00:58:21 -0500
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A28896331;
        Thu, 29 Dec 2022 21:58:04 -0800 (PST)
X-UUID: b3a214bd837247ce8a762e5edb0e9103-20221230
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PdhLdC1JSmSwnnt97TiXP6Gti1HSuLQBE8MO18Jar3w=;
        b=Gu0zGkk+wNn7xeG8BYUK0HIYyRueczPpfu8lWJktpVyd/86O4x8Ckexbc3772900saPFSqWh6gxYEO6VltPXkcdTHGM2bFvpJy3r3b+d86YtFLsjY+UygjCynDNtPIlbiEIb9QMMpx11HhRSh/19AIIo6KxlBCO/Ui11tb64DYE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.16,REQID:5000ea12-34e7-4903-a57e-45c41f9e0d73,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
        release,TS:0
X-CID-META: VersionHash:09771b1,CLOUDID:72513653-dd49-462e-a4be-2143a3ddc739,B
        ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT|NGT
X-UUID: b3a214bd837247ce8a762e5edb0e9103-20221230
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by mailgw02.mediatek.com
        (envelope-from <miles.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 5588775; Fri, 30 Dec 2022 13:56:45 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 30 Dec 2022 13:56:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 30 Dec 2022 13:56:43 +0800
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
Subject: Re: [PATCH v2 21/23] clk: mediatek: clk-mt6795-topckgen: Migrate to mtk_clk_simple_probe()
Date:   Fri, 30 Dec 2022 13:56:43 +0800
Message-ID: <20221230055643.16176-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-22-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

>Migrate away from custom probe functions and use the commonized
>mtk_clk_simple_{probe, remove}().
>
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>
Reviewed-by: Miles Chen <miles.chen@mediatek.com> 
