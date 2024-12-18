Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4091ACEC7;
	Wed, 18 Dec 2024 10:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734519266; cv=none; b=pFqzZqxLlxGAAZ9Q//POjp26JMYHHOYWa+kMHRjED7CXW6Ch5rn436Ijw9oyHAZBBU7tXgx79Fjt4V53Hwwih4aRXtrn9FmjojgVMItdBVwRP232RlOilbbHMZ7gNeuGU1LJtHnAIiEZZkvRig5pxrOoZLV4JejFzrRCiGiTduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734519266; c=relaxed/simple;
	bh=yk77vsE3x+ErK6MEuD/5lMiwXMA2ViIKn58pIYLQzzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=awhmAlaMqKlqeu6cBZEtbypE3B0t7BQCeZJB2/2+m0ULJL7poMmz7IlrUL8hrOShrVyqzF1CPXITBIdul16xe4xOQc80k2eUZ1MZcJoICuQtfCr8mgXG0ymMb898FcOghSoY5ZUTi9S+RG33Bsn+jRoD/y6zzy8C9kfPv2rjA5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nA/PFay/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nA/PFay/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734519262;
	bh=yk77vsE3x+ErK6MEuD/5lMiwXMA2ViIKn58pIYLQzzc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nA/PFay/e+qHE2doEAtO/o++UwgxL6X6OAkHLQENJKWgwwfG0PuhXK3M9lQq0Flb3
	 ORjEnDWksk0BWoSXFEoyN7e0YkoP09NK6Q9kmsinYKccRL5lImCc86dNRdPR3+yapk
	 TJQdRWZjEtyOEPr84Smav6f+dKEBF2KU0Li0Wxyglv+hbAQ8BmDKO4GwN16IpK4W7a
	 HN8zngZuEMiIPtfc/ECnNtSna9AivqYQaD2ZULOpFWCFqhUF5wyrCx9uAipA377CwL
	 TL7wcp9VoG+3s+j3T1biZlPjaSeqHOD9Hw3k5AAp/i625cqLEBVdQRfCRqpUUANdGy
	 PbV5QnO4jflHA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A19D817E361E;
	Wed, 18 Dec 2024 11:54:21 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	u.kleine-koenig@baylibre.com,
	amergnat@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	kernel@collabora.com,
	macpaul.lin@mediatek.com
Subject: [PATCH v1 2/2] clk: mediatek: mt8188-vdo1: Add VDO1_DPI1_HDMI clock for hdmitx
Date: Wed, 18 Dec 2024 11:54:15 +0100
Message-ID: <20241218105415.39206-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
References: <20241218105415.39206-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a missing clock found in the VDO1 controller for the HDMI TX
controller over DPI1.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8188-vdo1.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt8188-vdo1.c b/drivers/clk/mediatek/clk-mt8188-vdo1.c
index 4fa355f8f0c2..f715d45e545e 100644
--- a/drivers/clk/mediatek/clk-mt8188-vdo1.c
+++ b/drivers/clk/mediatek/clk-mt8188-vdo1.c
@@ -43,6 +43,12 @@ static const struct mtk_gate_regs vdo1_4_cg_regs = {
 	.sta_ofs = 0x140,
 };
 
+static const struct mtk_gate_regs vdo1_5_cg_regs = {
+	.set_ofs = 0x400,
+	.clr_ofs = 0x400,
+	.sta_ofs = 0x400,
+};
+
 #define GATE_VDO1_0(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_0_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
@@ -62,6 +68,9 @@ static const struct mtk_gate_regs vdo1_4_cg_regs = {
 #define GATE_VDO1_4(_id, _name, _parent, _shift)			\
 	GATE_MTK(_id, _name, _parent, &vdo1_4_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
+#define GATE_VDO1_5(_id, _name, _parent, _shift)			\
+	GATE_MTK(_id, _name, _parent, &vdo1_5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
+
 static const struct mtk_gate vdo1_clks[] = {
 	/* VDO1_0 */
 	GATE_VDO1_0(CLK_VDO1_SMI_LARB2, "vdo1_smi_larb2", "top_vpp", 0),
@@ -129,6 +138,8 @@ static const struct mtk_gate vdo1_clks[] = {
 	GATE_VDO1_3(CLK_VDO1_DISP_MONITOR_DPINTF, "vdo1_disp_monitor_dpintf_ck", "top_vpp", 17),
 	/* VDO1_4 */
 	GATE_VDO1_4(CLK_VDO1_26M_SLOW, "vdo1_26m_slow_ck", "clk26m", 8),
+	/* VDO1_5 */
+	GATE_VDO1_5(CLK_VDO1_DPI1_HDMI, "vdo1_dpi1_hdmi", "hdmi_txpll", 0),
 };
 
 static const struct mtk_clk_desc vdo1_desc = {
-- 
2.46.1

