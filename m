Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fWek+mEM"
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E08ECD;
	Mon, 20 Nov 2023 02:03:04 -0800 (PST)
X-UUID: fcd11294878b11eea33bb35ae8d461a2-20231120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=5cnBIGTFta30P7mscy72z68CYY3xkJ8c8wqppX2Iub8=;
	b=fWek+mEMdXrrEXd3HldEsWJgUSIvoAoxTP1IPVAFgb3hNChyR5V42IjmDwbXYNYki83IT+m8SR9q/Ik8qUbHMhMpm8GaEpv2xGizTae0fUu+Qmz6KVK5p0nv500fMuZGsN5fFOGotLjOJUWpNesdsZLot78ydMN6UlUyozBqufI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:9c4f0cf3-bb5c-470c-a8e5-754dc6da5237,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:b1d0da72-1bd3-4f48-b671-ada88705968c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: fcd11294878b11eea33bb35ae8d461a2-20231120
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 779686074; Mon, 20 Nov 2023 18:03:00 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 20 Nov 2023 18:02:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 20 Nov 2023 18:02:59 +0800
From: yu-chang.lee <yu-chang.lee@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Garmin Chang <garmin.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, "yu-chang . lee"
	<yu-chang.lee@mediatek.com>
Subject: [PATCH v4] dt-bindings: arm: mediatek: mmsys: Add VPPSYS compatible for MT8188
Date: Mon, 20 Nov 2023 18:02:58 +0800
Message-ID: <20231120100258.3428-1-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.349200-8.000000
X-TMASE-MatchedRID: BHLx0ZeYtM1eiY7hjuuIsm3NvezwBrVmCt59Uh3p/NVHZg0gWH5yUTP7
	OSqW2R7sUYCBevv5+axRS7xjEb+dxB9J5bZqJbIJe8FaKRfM2oOy4iyjvVWToqdrpTvh7T6o88Q
	4SiSCA0uVMlcqqHWd7fNdJKB44KmGkfRhdidsajMURSScn+QSXt0H8LFZNFG76sBnwpOylLOY9r
	8YLxxS4dgS604jgwkFQVackz7nDBjHrR5lGQU4zkV0FoTjxQgL0J69tGon+X3UgUmiG7ib0MxU6
	jcX1FK3fA2Q/royHVoXRoPmWO3jekxwdkPqCq7vDEyN+J8hd+jCS9WgDXVPCn7cGd19dSFd
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.349200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	A2E3637E6938936CF704E8E60C8754BE664BF24B380C333488BD6569875CF8BA2000:8
X-MTK: N

For MT8188, VPPSYS0 and VPPSYS1 are 2 display pipes with
hardware differences in power domains, clocks and subsystem counts,
which should be probed from mtk-mmsys driver to populate device by
platform_device_register_data then start its own clock driver.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
---
Change in v4:
- Squashed binding patches
- This patch is based on [1]
[1] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
  - https://patchwork.kernel.org/project/linux-mediatek/patch/20231117054345.15859-1-yu-chang.lee@mediatek.com/

Changes in v3:
- Separate binding patch from driver patch

Changes in v2:
- Refine commit message
- Refine commit title

 .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml        | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
index 536f5a5ebd24..50324248b965 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
@@ -32,6 +32,8 @@ properties:
               - mediatek,mt8183-mmsys
               - mediatek,mt8186-mmsys
               - mediatek,mt8188-vdosys0
+              - mediatek,mt8188-vppsys0
+              - mediatek,mt8188-vppsys1
               - mediatek,mt8192-mmsys
               - mediatek,mt8195-vdosys1
               - mediatek,mt8195-vppsys0
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

