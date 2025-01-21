Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 027921AF0CE;
	Tue, 21 Jan 2025 06:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442257; cv=none; b=geEGhR0/B3ItmBNrRPpA3i65HiK4xP1daFUYOGzwjhYaYswOeUtm+Myot0dSSnK/GG0N2TTlcAacZJ11NNW39m8WdNMvjerbKD+38Ey2tl7pdUveqyyKu2dm4MLx+Rzm8yG3Qo+cn1MY5thzZvgL5aI48KqDeKjvYr+sx0mRbBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442257; c=relaxed/simple;
	bh=bpM9gd4KUtUoXbltuw/boJI01H6fy4ZeRpQoHVD7MjA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZnQ+3/8bCsgUJjbrFMP8DVo58oLEAWoo87HZS9k8A8zfEAnQDknwVyolLno1/l1VL6BQLPE3f/caey6bSw/BdMeh7Ht+BXsjxb86kt1+zCzlk1RzgiO/mel1cr6s/qGQe/cUiad50qq1SL9wXZtbd5A9eDhkOgL0FrTJ1aY5NX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PKkIEaUw; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PKkIEaUw"
X-UUID: 0c4e34cad7c411ef99858b75a2457dd9-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=jv6bm7w1r44ux8eiNECNysQZlsA1xSn76XPifRRWIXI=;
	b=PKkIEaUwff73irRow7/sHH3Xzlaaval/rXCw+GWt0CLl0tLfJlCHTQoll9j7nMW0c2vFa+IfX8y/8dnVIfB4q9pxqovoZKJ8o/Yy+rgahjQmUPO3XhUuDEGL8CMb8fiJKt7io8WipECS8Uqk4koYy/2JaxzeuGYV3Aq5oKkQqVo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:4af5887f-8b16-4e19-b966-77ecf4f60d6f,IP:0,U
	RL:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-30
X-CID-META: VersionHash:60aa074,CLOUDID:088e5d85-0f10-4f52-bb41-91703793d3e4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0c4e34cad7c411ef99858b75a2457dd9-20250121
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1343794263; Tue, 21 Jan 2025 14:50:49 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:47 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:47 +0800
From: Friday Yang <friday.yang@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Garmin Chang
	<garmin.chang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>
CC: Friday Yang <friday.yang@mediatek.com>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: clock: mediatek: Add SMI LARBs reset for MT8188
Date: Tue, 21 Jan 2025 14:50:40 +0800
Message-ID: <20250121065045.13514-2-friday.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250121065045.13514-1-friday.yang@mediatek.com>
References: <20250121065045.13514-1-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

SMI LARBs require reset functions when applying clamp operations.
Add '#reset-cells' for the clock controller located in image, camera
and IPE subsystems.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 .../bindings/clock/mediatek,mt8188-clock.yaml | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
index 860570320545..2985c8c717d7 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8188-clock.yaml
@@ -57,6 +57,27 @@ required:
   - reg
   - '#clock-cells'

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - mediatek,mt8188-camsys-rawa
+              - mediatek,mt8188-camsys-rawb
+              - mediatek,mt8188-camsys-yuva
+              - mediatek,mt8188-camsys-yuvb
+              - mediatek,mt8188-imgsys-wpe1
+              - mediatek,mt8188-imgsys-wpe2
+              - mediatek,mt8188-imgsys-wpe3
+              - mediatek,mt8188-imgsys1-dip-nr
+              - mediatek,mt8188-imgsys1-dip-top
+              - mediatek,mt8188-ipesys
+
+    then:
+      required:
+        - '#reset-cells'
+
 additionalProperties: false

 examples:
--
2.46.0

