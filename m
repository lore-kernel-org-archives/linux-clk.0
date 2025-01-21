Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9621B0415;
	Tue, 21 Jan 2025 06:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442258; cv=none; b=AtXN83+y4Bw5TmBPOfbQrVD8vYwS6n4eElVtVPM+rSAFCXfRMTjGXIunj5PSv2Lvt5JGNBC6usgoLms/K4AdPdPLuvMFJ7Wlx/E1blR8dGz8vcuEKuutXzlvd4u01QmUcHnbM98gRCoRRzI0ndT69b4LYCJtM+GHR7JNak7A2NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442258; c=relaxed/simple;
	bh=crT3UkNHDMmrmJ0xIMFGb/sJp8PxdYIxrjak1NcHUbA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FCQeZvNR1fBWDQAPv6or3RGnqgQaLTHrniskfiDpckrbGpVLbURoNiVFfPJI72cMqtcvKfW8hQlMJCnI5Z9/K1u76tzbb0vl0Aer7XwsnrwITx3Zk2CQgZqAiUWNQZOrxqYP7EhbiwWq8WycLzogPhuhEiVW64qIHr2ezYbRjRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=PGmKEFta; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PGmKEFta"
X-UUID: 0d7c300ed7c411efbd192953cf12861f-20250121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JYPAX7LoVN1/JdJmBbS2hnQMHCw7Autq/Ry7rigjYjU=;
	b=PGmKEFtaO94yD+kI6vRoN8lDW00uBqL6XQk5eza4HZVu6RAdRuhMVNc0h6SQwocaeOq7V1sBgRsDwhJq2YClrfzzVX3Klf9xp+WpVg11G+nnckQfti8PiCsSab5ZtGmMujLRpWEiqN6bnykEWF5QeoX/HRQbAZ7m34wvI6jCtGs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:89c066e6-f059-4668-ac97-b2af5c773802,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:30c3380f-078a-483b-8929-714244d25c49,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:5,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0d7c300ed7c411efbd192953cf12861f-20250121
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <friday.yang@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1009262644; Tue, 21 Jan 2025 14:50:51 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 21 Jan 2025 14:50:49 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 21 Jan 2025 14:50:48 +0800
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
Subject: [PATCH v3 2/2] clk: mediatek: Add SMI LARBs reset for MT8188
Date: Tue, 21 Jan 2025 14:50:41 +0800
Message-ID: <20250121065045.13514-3-friday.yang@mediatek.com>
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
Add reset platform data for SMI LARBs in the image, camera and IPE
subsystems.

Signed-off-by: Friday Yang <friday.yang@mediatek.com>
---
 drivers/clk/mediatek/clk-mt8188-cam.c | 17 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-img.c | 18 ++++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-ipe.c | 14 ++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8188-cam.c b/drivers/clk/mediatek/clk-mt8188-cam.c
index 7500bd25387f..9b029fdd584e 100644
--- a/drivers/clk/mediatek/clk-mt8188-cam.c
+++ b/drivers/clk/mediatek/clk-mt8188-cam.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs cam_cg_regs = {
 #define GATE_CAM(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &cam_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define CAM_SYS_SMI_LARB_RST_OFF	(0xA0)
+
 static const struct mtk_gate cam_main_clks[] = {
 	GATE_CAM(CLK_CAM_MAIN_LARB13, "cam_main_larb13", "top_cam", 0),
 	GATE_CAM(CLK_CAM_MAIN_LARB14, "cam_main_larb14", "top_cam", 1),
@@ -72,6 +74,17 @@ static const struct mtk_gate cam_yuvb_clks[] = {
 	GATE_CAM(CLK_CAM_YUVB_CAMTG, "cam_yuvb_camtg", "top_cam", 2),
 };

+/* Reset for SMI larb 16a/16b/17a/17b */
+static u16 cam_sys_rst_ofs[] = {
+	CAM_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc cam_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = cam_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(cam_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc cam_main_desc = {
 	.clks = cam_main_clks,
 	.num_clks = ARRAY_SIZE(cam_main_clks),
@@ -80,21 +93,25 @@ static const struct mtk_clk_desc cam_main_desc = {
 static const struct mtk_clk_desc cam_rawa_desc = {
 	.clks = cam_rawa_clks,
 	.num_clks = ARRAY_SIZE(cam_rawa_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_rawb_desc = {
 	.clks = cam_rawb_clks,
 	.num_clks = ARRAY_SIZE(cam_rawb_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_yuva_desc = {
 	.clks = cam_yuva_clks,
 	.num_clks = ARRAY_SIZE(cam_yuva_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct mtk_clk_desc cam_yuvb_desc = {
 	.clks = cam_yuvb_clks,
 	.num_clks = ARRAY_SIZE(cam_yuvb_clks),
+	.rst_desc = &cam_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_cam[] = {
diff --git a/drivers/clk/mediatek/clk-mt8188-img.c b/drivers/clk/mediatek/clk-mt8188-img.c
index cb2fbd4136b9..d44bfbd8308a 100644
--- a/drivers/clk/mediatek/clk-mt8188-img.c
+++ b/drivers/clk/mediatek/clk-mt8188-img.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs imgsys_cg_regs = {
 #define GATE_IMGSYS(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &imgsys_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define IMG_SYS_SMI_LARB_RST_OFF	(0xC)
+
 static const struct mtk_gate imgsys_main_clks[] = {
 	GATE_IMGSYS(CLK_IMGSYS_MAIN_LARB9, "imgsys_main_larb9", "top_img", 0),
 	GATE_IMGSYS(CLK_IMGSYS_MAIN_TRAW0, "imgsys_main_traw0", "top_img", 1),
@@ -58,6 +60,17 @@ static const struct mtk_gate imgsys1_dip_nr_clks[] = {
 	GATE_IMGSYS(CLK_IMGSYS1_DIP_NR_DIP_NR, "imgsys1_dip_nr_dip_nr", "top_img", 1),
 };

+/* Reset for SMI larb 10/11a/11b/11c/15 */
+static u16 img_sys_rst_ofs[] = {
+	IMG_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc img_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = img_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(img_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc imgsys_main_desc = {
 	.clks = imgsys_main_clks,
 	.num_clks = ARRAY_SIZE(imgsys_main_clks),
@@ -66,26 +79,31 @@ static const struct mtk_clk_desc imgsys_main_desc = {
 static const struct mtk_clk_desc imgsys_wpe1_desc = {
 	.clks = imgsys_wpe1_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe1_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys_wpe2_desc = {
 	.clks = imgsys_wpe2_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe2_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys_wpe3_desc = {
 	.clks = imgsys_wpe3_clks,
 	.num_clks = ARRAY_SIZE(imgsys_wpe3_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys1_dip_top_desc = {
 	.clks = imgsys1_dip_top_clks,
 	.num_clks = ARRAY_SIZE(imgsys1_dip_top_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct mtk_clk_desc imgsys1_dip_nr_desc = {
 	.clks = imgsys1_dip_nr_clks,
 	.num_clks = ARRAY_SIZE(imgsys1_dip_nr_clks),
+	.rst_desc = &img_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_imgsys_main[] = {
diff --git a/drivers/clk/mediatek/clk-mt8188-ipe.c b/drivers/clk/mediatek/clk-mt8188-ipe.c
index 8f1933b71e28..70a011c1f9ce 100644
--- a/drivers/clk/mediatek/clk-mt8188-ipe.c
+++ b/drivers/clk/mediatek/clk-mt8188-ipe.c
@@ -20,6 +20,8 @@ static const struct mtk_gate_regs ipe_cg_regs = {
 #define GATE_IPE(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &ipe_cg_regs, _shift, &mtk_clk_gate_ops_setclr)

+#define IPE_SYS_SMI_LARB_RST_OFF	(0xC)
+
 static const struct mtk_gate ipe_clks[] = {
 	GATE_IPE(CLK_IPE_DPE, "ipe_dpe", "top_ipe", 0),
 	GATE_IPE(CLK_IPE_FDVT, "ipe_fdvt", "top_ipe", 1),
@@ -28,9 +30,21 @@ static const struct mtk_gate ipe_clks[] = {
 	GATE_IPE(CLK_IPE_SMI_LARB12, "ipe_smi_larb12", "top_ipe", 4),
 };

+/* Reset for SMI larb 12 */
+static u16 ipe_sys_rst_ofs[] = {
+	IPE_SYS_SMI_LARB_RST_OFF,
+};
+
+static const struct mtk_clk_rst_desc ipe_sys_rst_desc = {
+	.version = MTK_RST_SIMPLE,
+	.rst_bank_ofs = ipe_sys_rst_ofs,
+	.rst_bank_nr = ARRAY_SIZE(ipe_sys_rst_ofs),
+};
+
 static const struct mtk_clk_desc ipe_desc = {
 	.clks = ipe_clks,
 	.num_clks = ARRAY_SIZE(ipe_clks),
+	.rst_desc = &ipe_sys_rst_desc,
 };

 static const struct of_device_id of_match_clk_mt8188_ipe[] = {
--
2.46.0

