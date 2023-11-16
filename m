Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FDkNYtsp"
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42F7A1B8;
	Thu, 16 Nov 2023 00:01:43 -0800 (PST)
X-UUID: 5c02cf52845611eea33bb35ae8d461a2-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Y9d7TXQIk3+RrPTfENZLQsTLYBMK0/HZ3yBRZwqiBzg=;
	b=FDkNYtspbE0IgZqQJrwFlgddtzYut1OghpkU0Y04k+YSyL52lnWpC/i5ubXiCqfrPR8ITogbz2tC7RJ/tDwNAMh9prpSOpyCSGZTCg4teTn2uzp0izeNRhB8OBHZocBDkhCXSS/lti+rklNIzwhAzWuv/mcMdDLbyKMDTUk2gZk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:7330e7cb-33a1-43a1-bf3c-c7efe1187ba5,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:364b77b,CLOUDID:5c3a99fc-4a48-46e2-b946-12f04f20af8c,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5c02cf52845611eea33bb35ae8d461a2-20231116
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 271569127; Thu, 16 Nov 2023 16:01:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 16 Nov 2023 16:01:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 16 Nov 2023 16:01:32 +0800
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
Subject: [PATCH v2 2/3] dt-bindings: clock: mediatek: Remove compatible for MT8188 VPPSYS
Date: Thu, 16 Nov 2023 16:01:28 +0800
Message-ID: <20231116080129.20617-3-yu-chang.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
References: <20231116080129.20617-1-yu-chang.lee@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--2.043400-8.000000
X-TMASE-MatchedRID: Ot1QB8gGm1gQKuI1NEGZQRWCVBr+Ay98PZmbnY2qDInfUZT83lbkEA0F
	DzFL1GEo4vM1YF6AJbbGJQ3BiiLAggtuKBGekqUpnH7sbImOEBTSpd0hmga4zp8Fot46YbXYd9y
	mTdOmg6JVHgGjvtJvdFNRG3MBWsYcNOaXFu8svTn1xAwvzFHhRyE2EcaDHQ/UlJ2a0It1u9ZJmt
	82E/eyBQGH0CAFIQWsmb5gmylW+PbGS+seVPx64j6Qrn3xh/cy
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.043400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BE4296F2674A09CA42AE309399C1EFCF975177F8B1DBD697B12B72AEE86BC5A32000:8
X-MTK: N

MT8188 VPPSYS 0/1 should be probed from mtk-mmsys driver to
populate device by platform_device_register_data then start
its own clock driver.

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

