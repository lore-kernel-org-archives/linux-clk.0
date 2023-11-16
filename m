Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HUdj7gm+"
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 571FF1BE;
	Thu, 16 Nov 2023 00:01:44 -0800 (PST)
X-UUID: 5c31c564845611eea33bb35ae8d461a2-20231116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QcIt3Ktz1gHsq31U3t8nwgEd2HLHtn9TZ83PuMif8Ls=;
	b=HUdj7gm+5i2azkVpENrShlhHXHIYLnZw93BG5VVn9f+eye5wSUKFIuvJV+Iq0Tt7JwVYwnlPbq9XEZ0djXXuJKg2p6k20odkG1+Aw0PhbuvwGszdqims7QGIgktkNNIXFGlEjkPdhXtCir3VwMMCnjIo839fP1DONirjN6+m0eM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.33,REQID:97bfa807-643a-4fbb-bdb1-17d628204ad4,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:364b77b,CLOUDID:15dd7595-10ce-4e4b-85c2-c9b5229ff92b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 5c31c564845611eea33bb35ae8d461a2-20231116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <yu-chang.lee@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1031165500; Thu, 16 Nov 2023 16:01:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
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
Subject: [PATCH v2 1/3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Date: Thu, 16 Nov 2023 16:01:27 +0800
Message-ID: <20231116080129.20617-2-yu-chang.lee@mediatek.com>
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
X-TM-AS-Result: No-10--7.284600-8.000000
X-TMASE-MatchedRID: uVuWzlu52Rk9S3IiQd+eNWNW0DAjL5p++OI6XsK3BWHfUZT83lbkEN6M
	yUV+2+DZ1uNt11toaXuY15VWej9HL49oUcx9VMLgFEUknJ/kEl4YSQiB0ZTudfoLR4+zsDTtD12
	T7q2dIUtXrpfaEp592sEs23TMfRYzaUMui/AN0TAJvAy8Uf//ww==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.284600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP:
	22197197BC75FEF9C92F11DBEDC754E481B97EFF5F5FABC70E59ADEDC18A303E2000:8
X-MTK: N

Add MT8188 VPPSYS0 and VPPSYS1 driver data.

Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-mmsys.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 88209102ff3b..1e5239cc5445 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -89,6 +89,16 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vppsys0_driver_data = {
+	.clk_driver = "clk-mt8188-vpp0",
+	.is_vppsys = true,
+};
+
+static const struct mtk_mmsys_driver_data mt8188_vppsys1_driver_data = {
+	.clk_driver = "clk-mt8188-vpp1",
+	.is_vppsys = true,
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -429,6 +439,8 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys0", .data = &mt8188_vppsys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vppsys1", .data = &mt8188_vppsys1_driver_data },
 	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
 	/* "mediatek,mt8195-mmsys" compatible is deprecated */
 	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
-- 
2.18.0

