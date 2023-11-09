Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAA2199B4;
	Thu,  9 Nov 2023 11:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pG+8zthk"
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05134272C;
	Thu,  9 Nov 2023 03:11:38 -0800 (PST)
X-UUID: bc3f2ba67ef011ee8051498923ad61e6-20231109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=r/gVQFGVlacPBsIQMNEYYQEGxfnioZXeupCs3lgN+3o=;
	b=pG+8zthk/+TpggngZC299ExBcyK4yHr3arXvbUMOcSi8fUVWlIuDL8O/WTlN6jiQHdNzJHMZ8aehBsWVuv17DZaVOgXW1jI5qpw8UINs17F9hyu7f5XERbsLKAkabgxo2J1ZjDZaXrDO7o3vZHiTHlDWBZcI+Hajkxjl+mPe+XY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:eea198dd-a890-4121-bbcb-d14aa6c9d1bd,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:e87857fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: bc3f2ba67ef011ee8051498923ad61e6-20231109
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 240022405; Thu, 09 Nov 2023 19:11:31 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 9 Nov 2023 19:11:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 9 Nov 2023 19:11:29 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: "Nancy . Lin" <nancy.lin@mediatek.com>, Nathan Lu
	<nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Garmin Chang <garmin.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, yu-chang.lee
	<yu-chang.lee@mediatek.com>
Subject: [RESEND 2/3] dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
Date: Thu, 9 Nov 2023 19:11:21 +0800
Message-ID: <20231109111122.371-3-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231109111122.371-1-yu-chang.lee@mediatek.com>
References: <20231109111122.371-1-yu-chang.lee@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N

Remove VPPSYS0, VPPSYS1 compatible on Mediatek MT8188.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index d7214d97b2ba..860570320545 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -43,8 +43,6 @@ properties:
       - mediatek,mt8188-vdecsys
       - mediatek,mt8188-vdecsys-soc
       - mediatek,mt8188-vencsys
-      - mediatek,mt8188-vppsys0
-      - mediatek,mt8188-vppsys1
       - mediatek,mt8188-wpesys
       - mediatek,mt8188-wpesys-vpp0
 
-- 
2.18.0

