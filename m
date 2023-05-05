Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35284C7EE22
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 13:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232366AbjEENN2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 09:13:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjEENNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 09:13:25 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 184C71E988;
        Fri,  5 May 2023 06:13:23 -0700 (PDT)
X-UUID: 98783304eb4611ed9cb5633481061a41-20230505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fR5zPRr6mGaPjBEV+8bAJ+j1tXb4IEd8qsOXLOLPyjY=;
        b=jdElmPlncml4I6S6PLDEL5UbBaabr2T7NeeYFOQTdPGy6rSURDRLdX9uHAH14s+Fy+h1ltsUwVeHoWjbm/aggDY92nmjswucfzZMQYQa23IDmjnTXz7DmNK5s1D0lhnegBOt61CC3SMh5vB4wZnrfBLS+oaGa2JgAaNf/8hymBo=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.23,REQID:8fcf0bc4-0387-49cb-baa3-b57acc2cf018,IP:0,U
        RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
        N:release,TS:100
X-CID-INFO: VERSION:1.1.23,REQID:8fcf0bc4-0387-49cb-baa3-b57acc2cf018,IP:0,URL
        :0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
        N:quarantine,TS:100
X-CID-META: VersionHash:697ab71,CLOUDID:35c5de30-6935-4eab-a959-f84f8da15543,B
        ulkID:230505211317ZLQ6Q49H,BulkQuantity:0,Recheck:0,SF:29|28|16|19|48|38,T
        C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
        ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 98783304eb4611ed9cb5633481061a41-20230505
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
        (envelope-from <runyang.chen@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 1448119291; Fri, 05 May 2023 21:13:15 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 5 May 2023 21:13:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 5 May 2023 21:13:13 +0800
From:   Runyang Chen <runyang.chen@mediatek.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
        Runyang Chen <runyang.chen@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: reset: mt8188: add thermal reset control bit
Date:   Fri, 5 May 2023 21:13:07 +0800
Message-ID: <20230505131308.27190-2-runyang.chen@mediatek.com>
X-Mailer: git-send-email 2.9.2
In-Reply-To: <20230505131308.27190-1-runyang.chen@mediatek.com>
References: <20230505131308.27190-1-runyang.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

To support reset of infra_ao, add the index of infra_ao reset of thermal
for MT8188.

Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8188-resets.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/reset/mt8188-resets.h b/include/dt-bindings/reset/mt8188-resets.h
index 377cdfda82a9..ba9a5e9b8899 100644
--- a/include/dt-bindings/reset/mt8188-resets.h
+++ b/include/dt-bindings/reset/mt8188-resets.h
@@ -33,4 +33,9 @@
 
 #define MT8188_TOPRGU_SW_RST_NUM               24
 
+/* INFRA resets */
+#define MT8188_INFRA_RST1_THERMAL_MCU_RST          0
+#define MT8188_INFRA_RST1_THERMAL_CTRL_RST         1
+#define MT8188_INFRA_RST3_PTP_CTRL_RST             2
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8188 */
-- 
2.18.0

