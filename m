Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5149046D54F
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789986333; cv=none; b=UrAObN0sKhZVZ4bc0jNowcSB+9Aa6KgiDcsesO4VANwHlzrfs0FcGW/4FF3VPZOX+mfJ3k9NpcP38+X5MZzw6h0DIusdamxDrEqW7naJfYNZsabdYWo8OHTexqJM4ILxrA/+wNRQm4nIXhrNXOgHWzWIAu0d5utd1LkTA8WVGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789986333; c=relaxed/simple;
	bh=hxR49B7RQPbJ/d0d+ntWb/hxk2eeZJ7iiyVvihgn58U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5abfLZGHbVd98qtGd2Bhh6nJFu6BrQkyGoGFjIhafCs269ddEcG4VXuDHSb24NmE1zl4HkF4FAY404Jm0D2f9r1AF+t34VKyFqgFCkR4Vu8vhp8F3WYn0WbJxNQ/zU0d885nIu/i+bmyExov6izN5NB3pfFWix7HkuznTtt2GE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsq8sCx/; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsq8sCx/"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8692a8568e9so2333840b3a.3
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 03:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986331; x=1790591131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HfP1uEXGcD/7otSfEPp8la4bNX0YkoLMLW/Ix00hlGk=;
        b=fsq8sCx/J0sEfUh9BhCM2v8ooJP5nBDhi8HI6AoqcMJv/rVLuKimbBW+XXV5s+xR6D
         L11pxTw/4v4rp4+EE6HGc9G7fAMfHblOZ9YQRgI/Fok7F2GEi2HiAmzqqN7tdp8H745l
         YgyFEE+pHKfjefAeKcDzor/9Xq4qI+RWE52FiPA5hZPIgeCQvadjlqebDsTakjlkpP8V
         QjG8KrW7l5r+F4WbZFHeuqHxHfeqzVswVrHraYSSnKsADT2uN7LSVkoyDw5epsdTooy/
         OKEJonTRusbYwXD0wvWWaiLR8o41kUcweBJGVwRpNHP8joIkli/kJdFsqneis8Egmn8+
         T/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986331; x=1790591131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HfP1uEXGcD/7otSfEPp8la4bNX0YkoLMLW/Ix00hlGk=;
        b=maZ64PWbnm7k+ybWjQgrY/26n8MSzUmxKPM8ITntGXkxLN6WlHmL9k6pqN4naJiqzZ
         uMFi6cxYjhXLR1Pcm8jxOacLXrqFZQjChUzVDAJv0rR3gxRmfiTMWrxbQi168b/ZGUHt
         rsv2fHSNJDMqdArBZ3ODupGF62dhdMQc4LXRbuUUSUO/G+fX0GLBgC75ATvUust9xCql
         espGksvD3MtXyL5WpSCd7QxucvYRoODT+VQQocIbC1TcYALGG8Lu631fKBv0wxfrsCA7
         qpMvMD/7zXUAI3Xv3um+9MDJqYPvYMro2prhoRmmZKoxFurLbSzKFdxubQiIDOJVaXI5
         kzOw==
X-Forwarded-Encrypted: i=1; AKwUvBwmfCrLkhVNWNyX7rav8aCbeWraMUs/pTCKw4hZk+GjZiHD8iDZxKqvo2RzrkzAJnoM16psRIt/OrI=@vger.kernel.org
X-Gm-Message-State: AFuF++mUD+Nlc3rfGENv/eMk25rgfZ+n/8CCyFxrY8UDQzVBM8oX80Hm
	/61n+F2P7UsEDsziuvCTj41KiMlvGijOd5CmpmfttNyki9n6OjdaDCah
X-Gm-Gg: AYBFou2EhoF4K1fVcJwcaaptLposdXg0nMJz6f7cekL51UgyAC9ybqfWifrZ1Bp+4nT
	OQzpf0nk9cTEFMktKK75hCMH2yRgvm+qJNKYov70B/BIPPNajEAXZd7hZ3kqwvg3+U7naXHxdtU
	zY5w6xqk+MFsCnUYPxir9TS9a/9F8VcJfBTxwEGUiQZZI4XVUsNFoFKvVKXU/upq+uawHHQiEBW
	m7dghYPU/4hvbH7RQFepJs6sb+stWO2W7bjvsdu5f5YGKbvhraXOl915q11CxrVu8KgW8dw9ZEn
	FifPBIJlagPtywxsyDCnzc3abzaDs151uh46a0HwFZKOo3GNWpkzGFQcjh2Ex471Hu1f4tNMreJ
	OyNpX11YJTRL00/Zl3ZwVgsTlrqFOksPYZgYoYLcqUkMGgzo8jFWv+cSre1Rb3wI3Cn+MTVUmTG
	MUD8f3gSUo8mVywjyH2ZuHBK2Q7fpzdkPOwFL1BN0z1x+XLF98DOxBzoKwUKaBez1S0IelJGGvK
	uLH2dnIKYBT5xDAgFbWjTCNgddO5P8Ev3VpLyI=
X-Received: by 2002:a05:6a00:1943:b0:878:3811:239 with SMTP id d2e1a72fcca58-87838207541mr6896051b3a.53.1789986331385;
        Mon, 21 Sep 2026 03:25:31 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:31 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 1/6] clk: mediatek: Fix MT6779 clock onecell IDs
Date: Mon, 21 Sep 2026 19:25:17 +0900
Message-ID: <20260921102522.1640072-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the missing dummy slot for clock ID 0 in the MT6779
audio, camera, image, IPE, MFG, multimedia, VDEC and VENC
clock providers.

Also register the missing SSPM infracfg clock and reserve
the binding-defined MDP WDMA0 slot in the multimedia provider.

This fixes the onecell clock data allocation so all registered
clock IDs are within bounds.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6779-aud.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-cam.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-img.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-ipe.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-mfg.c  | 1 +
 drivers/clk/mediatek/clk-mt6779-mm.c   | 2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c | 1 +
 drivers/clk/mediatek/clk-mt6779-venc.c | 1 +
 drivers/clk/mediatek/clk-mt6779.c      | 1 +
 9 files changed, 10 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6779-aud.c b/drivers/clk/mediatek/clk-mt6779-aud.c
index 30c290fd6b84..6be054816a4b 100644
--- a/drivers/clk/mediatek/clk-mt6779-aud.c
+++ b/drivers/clk/mediatek/clk-mt6779-aud.c
@@ -33,6 +33,7 @@ static const struct mtk_gate_regs audio1_cg_regs = {
 		&mtk_clk_gate_ops_no_setclr)
 
 static const struct mtk_gate audio_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "aud_dummy"),
 	/* AUDIO0 */
 	GATE_AUDIO0(CLK_AUD_AFE, "aud_afe", "audio_sel", 2),
 	GATE_AUDIO0(CLK_AUD_22M, "aud_22m", "aud_eng1_sel", 8),
diff --git a/drivers/clk/mediatek/clk-mt6779-cam.c b/drivers/clk/mediatek/clk-mt6779-cam.c
index f397b55606de..35c313b48b16 100644
--- a/drivers/clk/mediatek/clk-mt6779-cam.c
+++ b/drivers/clk/mediatek/clk-mt6779-cam.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs cam_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate cam_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "cam_dummy"),
 	GATE_CAM(CLK_CAM_LARB10, "camsys_larb10", "cam_sel", 0),
 	GATE_CAM(CLK_CAM_DFP_VAD, "camsys_dfp_vad", "cam_sel", 1),
 	GATE_CAM(CLK_CAM_LARB11, "camsys_larb11", "cam_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-img.c b/drivers/clk/mediatek/clk-mt6779-img.c
index 474a59a4ca9e..b5efc2cfe189 100644
--- a/drivers/clk/mediatek/clk-mt6779-img.c
+++ b/drivers/clk/mediatek/clk-mt6779-img.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs img_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate img_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "img_dummy"),
 	GATE_IMG(CLK_IMG_LARB5, "imgsys_larb5", "img_sel", 0),
 	GATE_IMG(CLK_IMG_LARB6, "imgsys_larb6", "img_sel", 1),
 	GATE_IMG(CLK_IMG_DIP, "imgsys_dip", "img_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-ipe.c b/drivers/clk/mediatek/clk-mt6779-ipe.c
index c2314654f43a..284d5adb8a6e 100644
--- a/drivers/clk/mediatek/clk-mt6779-ipe.c
+++ b/drivers/clk/mediatek/clk-mt6779-ipe.c
@@ -23,6 +23,7 @@ static const struct mtk_gate_regs ipe_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate ipe_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "ipe_dummy"),
 	GATE_IPE(CLK_IPE_LARB7, "ipe_larb7", "ipe_sel", 0),
 	GATE_IPE(CLK_IPE_LARB8, "ipe_larb8", "ipe_sel", 1),
 	GATE_IPE(CLK_IPE_SMI_SUBCOM, "ipe_smi_subcom", "ipe_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6779-mfg.c b/drivers/clk/mediatek/clk-mt6779-mfg.c
index 21793cb6e6e3..dd7d98d7de7d 100644
--- a/drivers/clk/mediatek/clk-mt6779-mfg.c
+++ b/drivers/clk/mediatek/clk-mt6779-mfg.c
@@ -24,6 +24,7 @@ static const struct mtk_gate_regs mfg_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mfg_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mfg_dummy"),
 	GATE_MFG(CLK_MFGCFG_BG3D, "mfg_bg3d", "mfg_sel", 0),
 };
 
diff --git a/drivers/clk/mediatek/clk-mt6779-mm.c b/drivers/clk/mediatek/clk-mt6779-mm.c
index 30bbab308388..3b3053385021 100644
--- a/drivers/clk/mediatek/clk-mt6779-mm.c
+++ b/drivers/clk/mediatek/clk-mt6779-mm.c
@@ -32,6 +32,7 @@ static const struct mtk_gate_regs mm1_cg_regs = {
 		&mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	/* MM0 */
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
@@ -76,6 +77,7 @@ static const struct mtk_gate mm_clks[] = {
 	GATE_MM1(CLK_MM_26M, "mm_26m", "f_f26m_ck", 7),
 	GATE_MM1(CLK_MM_MM_R2Y, "mm_mmsys_r2y", "mm_sel", 8),
 	GATE_MM1(CLK_MM_DISP_RSZ, "mm_disp_rsz", "mm_sel", 9),
+	GATE_DUMMY(CLK_MM_MDP_WDMA0, "mm_mdp_wdma0_dummy"),
 	GATE_MM1(CLK_MM_MDP_AAL, "mm_mdp_aal", "mm_sel", 10),
 	GATE_MM1(CLK_MM_MDP_HDR, "mm_mdp_hdr", "mm_sel", 11),
 	GATE_MM1(CLK_MM_DBI_MM_CK, "mm_dbi_mmck", "mm_sel", 12),
diff --git a/drivers/clk/mediatek/clk-mt6779-vdec.c b/drivers/clk/mediatek/clk-mt6779-vdec.c
index 458d012f023c..1e4922f8a037 100644
--- a/drivers/clk/mediatek/clk-mt6779-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6779-vdec.c
@@ -33,6 +33,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 		&mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	/* VDEC0 */
 	GATE_VDEC0_I(CLK_VDEC_VDEC, "vdec_cken", "vdec_sel", 0),
 	/* VDEC1 */
diff --git a/drivers/clk/mediatek/clk-mt6779-venc.c b/drivers/clk/mediatek/clk-mt6779-venc.c
index 70cebc274031..0d3ffdf50beb 100644
--- a/drivers/clk/mediatek/clk-mt6779-venc.c
+++ b/drivers/clk/mediatek/clk-mt6779-venc.c
@@ -24,6 +24,7 @@ static const struct mtk_gate_regs venc_cg_regs = {
 		&mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate venc_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "venc_dummy"),
 	GATE_VENC_I(CLK_VENC_GCON_LARB, "venc_larb", "venc_sel", 0),
 	GATE_VENC_I(CLK_VENC_GCON_VENC, "venc_venc", "venc_sel", 4),
 	GATE_VENC_I(CLK_VENC_GCON_JPGENC, "venc_jpgenc", "venc_sel", 8),
diff --git a/drivers/clk/mediatek/clk-mt6779.c b/drivers/clk/mediatek/clk-mt6779.c
index 4b9dcb910b03..70d8a970b5bd 100644
--- a/drivers/clk/mediatek/clk-mt6779.c
+++ b/drivers/clk/mediatek/clk-mt6779.c
@@ -1014,6 +1014,7 @@ static const struct mtk_gate infra_clks[] = {
 		    "fufs_sel", 13),
 	GATE_INFRA2(CLK_INFRA_MD32_BCLK, "infra_md32_bclk",
 		    "axi_sel", 14),
+	GATE_DUMMY(CLK_INFRA_SSPM, "infra_sspm_dummy"),
 	GATE_INFRA2(CLK_INFRA_UNIPRO_MBIST, "infra_unipro_mbist",
 		    "axi_sel", 16),
 	GATE_INFRA2(CLK_INFRA_SSPM_BUS_HCLK, "infra_sspm_bus_hclk",
-- 
2.55.0

