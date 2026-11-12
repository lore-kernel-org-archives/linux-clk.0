Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499103;
	b=IY1MDeP4V9NiG90MY6Jw0SsLo85y/+n4tgGk3949WBsKjSRST5eL17N7ONC24GHX7g1Z
	 jYD9FTgQC7FtulnO4qbGuIeXCPMAuSfEKomz22G34W0gnRy70wnUu5lwhm08A3JH4pQCe
	 LmoNzRyr/slBz6c1F205yAGr1oqibsHD4f7ZrgG3YVQLze6Vwq4dtVUD9bFZ+KkDmwUHL
	 ZrsU1jZMv08aj29ZKuu7wZTdqrH9NyqJu1RhX3S6JQRLHqcXTP+3+mh77FizLfZoTGLcY
	 PqiopH5KQ9w2tnO4F1MrRuqv7++6K28ZBQaK410e0Km1DciXu1NpR8JdMvx+UoW3Gkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499103;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2ZK3Xt5KyUIXmWiuSN114/bnjD6MZrQYAmtxv4m7uMc=;
	b=eQwWARIct+Y6bFc+rdWnhLWgFwN0MxIcOGnsdWtK0EwEGwRSH4Zvd4k3QZbeEGRTJPiW
	 7nBPpKIG94OtZe6vtZMi3FPyrCfj+vIwn7aH+bo+NzheUaox+IhQdoJ0BUyhk2dybroor
	 tx6ILgwEmJhNhMXdp/W0sVCy7fCUpVox1Gdi+Hvs1Uy98DK2fURwo4hIk+nVPOJFEOH7n
	 sNov2N7bnZAIkgFsnBOfohCBUrpiQ/F+vAN6toQeOo4OTP3QwTcnJsf0S3d6tqdhvuYQ3
	 VM8sOVZkiwTii12SwxUpJpkuc5FlAEX4bHfwRl3q08v7gtj8zUL+zvV/S+ukGdFgv3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dsg.is;
	spf=pass smtp.mailfrom=dsg.is;
	dkim=pass header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=B7bM5rOb;
	arc=none smtp.remote-ip=185.70.43.170
Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB5F606A32A;
	Thu, 12 Nov 2026 15:58:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB5F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dsg.is
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dsg.is
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dsg.is header.i=@dsg.is header.a=rsa-sha256 header.s=protonmail2 header.b=B7bM5rOb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dsg.is;
	s=protonmail2; t=1794499099; x=1794758299;
	bh=2ZK3Xt5KyUIXmWiuSN114/bnjD6MZrQYAmtxv4m7uMc=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=B7bM5rObGn1sQow8KG62ryMWfDcCV6gNrsqcqoxAP8qG81og4UdANP3Bjs9a/1Q2u
	 jW4ejcB68VnxaJmqUUoyviOslh4TWeXSxWmOHIaGAD83xc0L5Y9k5UrLgfNeTxtVjt
	 X2DLBOWdXb57T79e7LvBRDE3J637m0KFPRrhEdQf0kAj16+SfeqRkVGf3w6npaK5X+
	 qXr0QzYW8PamqTisom+Pb0MOXSVv5bIyt+TywFA65K4bNdbghUrz+IklGOWykWcKB2
	 pVKXvclf2YyhYxBvNKCasIxeNmXCMldNbcZL/8kwSdVgsu49vNbrXDYnJe0upPe2zF
	 Yo1wOajuW17rg==
X-Pm-Submission-Id: 4jQQ602Kk3z1DF5P
From: =?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Dav=C3=AD=C3=B0=20Steinn=20Geirsson?= <david@dsg.is>
Subject: [PATCH] clk: qcom: gcc-ipq5018: fix swapped MDIO clocks and resets
Date: Thu, 12 Nov 2026 15:57:55 +0000
Message-ID: <20261112155801.610730-1-david@dsg.is>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The GCC has a block reset (BCR) and an AHB clock branch for each of the
two MDIO controllers. The pair at 0x58000/0x58004 belongs to the
controller at 0x90000 (mdio1 in ipq5018.dtsi) and the pair at
0x58010/0x58014 belongs to the controller at 0x88000 (mdio0). The driver
maps the GCC_MDIO0_* IDs to the first pair and the GCC_MDIO1_* IDs to
the second, so each MDIO node gets the clock and reset of the other
controller.

ipq5018.dtsi enables mdio0 and leaves mdio1 disabled. On a board that
does not enable mdio1, clk_disable_unused() gates 0x58014 and the
controller at 0x88000 stops responding. Its registers then read back a
stale bus value, so MDIO reads return garbage instead of failing.

Observed on a Ubiquiti UniFi 6 Pro, which has the internal GE PHY on
mdio0 and nothing on mdio1:
- Gating 0x58004 leaves the 0x88000 controller working and every
  0x90000 register reads 0xffff. Gating 0x58014 does the reverse.
- Asserting the BCR at 0x58000 resets the 0x90000 controller and halts
  the 0x58004 branch. The BCR at 0x58010 resets the 0x88000 controller
  and halts the 0x58014 branch.

Swap the clock and reset offsets so that each ID controls the
controller it is named after. No in-tree DT uses the MDIO resets.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
Signed-off-by: Davíð Steinn Geirsson <david@dsg.is>
---

Tested and confirmed working on the Ubiquiti U6 Pro with both
OpenWRT's v6.18.60 kernel and `qcom/clk-for-7.5`.

A comment in OpenWRT's `ipq5018-archer-ax55-v1.dts` indicates this
bug has bitten people before:
https://github.com/openwrt/openwrt/blob/main/target/linux/qualcommax/dts/ipq5018-archer-ax55-v1.dts#L273-L279
That workaround should become unnecessary with this patch, though I
do not have the right hardware to confirm that.

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 37ccdc44a8..bf1a4745d1 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1969,28 +1969,28 @@
 };
 
 static struct clk_branch gcc_mdio0_ahb_clk = {
+	.halt_reg = 0x58014,
+	.clkr = {
+		.enable_reg = 0x58014,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data) {
+			.name = "gcc_mdioi0_ahb_clk",
+			.parent_hws = (const struct clk_hw *[]) {
+				&pcnoc_clk_src.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch gcc_mdio1_ahb_clk = {
 	.halt_reg = 0x58004,
 	.clkr = {
 		.enable_reg = 0x58004,
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data) {
-			.name = "gcc_mdioi0_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]) {
-				&pcnoc_clk_src.hw,
-			},
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_mdio1_ahb_clk = {
-	.halt_reg = 0x58014,
-	.clkr = {
-		.enable_reg = 0x58014,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data) {
 			.name = "gcc_mdio1_ahb_clk",
 			.parent_hws = (const struct clk_hw *[]) {
 				&pcnoc_clk_src.hw,
@@ -3585,8 +3585,8 @@
 	[GCC_GMAC1_SYS_ARES] = { 0x68438, 1 },
 	[GCC_IMEM_BCR] = { 0x0e000, 0 },
 	[GCC_LPASS_BCR] = { 0x2e000, 0 },
-	[GCC_MDIO0_BCR] = { 0x58000, 0 },
-	[GCC_MDIO1_BCR] = { 0x58010, 0 },
+	[GCC_MDIO0_BCR] = { 0x58010, 0 },
+	[GCC_MDIO1_BCR] = { 0x58000, 0 },
 	[GCC_MPM_BCR] = { 0x2c000, 0 },
 	[GCC_PCIE0_BCR] = { 0x75004, 0 },
 	[GCC_PCIE0_LINK_DOWN_BCR] = { 0x750a8, 0 },
