Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792479274;
	b=GctxQqxfrGLZfPeeXvznAtluO5ozQWKS37VCVBkj3//xr4E/SaGjOcadyX6dpsw6ebBL
	 wS5nuqy7vbZIwLteHcUTNp8y1qzfYxg1FAUguNhzhJCybv4NhZ/4sYIq5f1WiZ2caMs3e
	 ylCpqmKMdWnWNsiyJKXOJGTXwjzORSMwWGamhFroH/mGv+DQCuhh5wD7rxOEMldMA6WXz
	 7H9y3s4DJwMGuOKYzG+87U8bsMJKrFl1vGU7V42PcW/5fJ2DUvZ8rj3qWE8igGftCvIGG
	 3uxa9m7L2RTJew4YwQQhq4l9HOo5JS0bbsen4Tcl8LHLOcoh+EbSyc+xymQmIDhnX7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792479274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
	b=x1rXb/+8vY776Ogh5r+OlOHPZ6fE13oYg8OvyHnIavmiqQwJwipFx8akzI9W0acKZb39
	 kNajrJLNuDQMmCojBp2mwV9bMys8mQFz1bNXt9YS+G4TFrKFTK97ydR4xPqUir6fhM3Yv
	 UXyecWHdpGi0ePWX9rey/fDJX5SXq47Jo/geshCkpbbE2AlB8AeQu1eJmpvcBfvd1h5vr
	 9GdpAEuejBXd00PC3bqaHroTn0DjIrh0E2+g/zupzDR+Gj2Ab/q4eMGab4i1sw2GrkWlI
	 iD39i88NwokCeFeijsN2taiOt0Y8dIUMwo5mYYHtHHR6J4nY7nuYxK+ekp54h/e+/ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b="a2AMo/QM";
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43EA2606A320
	for <linux-clk@vger.kernel.org>; Tue, 20 Oct 2026 06:54:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43EA2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=a2AMo/QM
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6ae305e3bd9so4414851a12.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 23:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792479272; x=1793084072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=a2AMo/QMymtnv5ie+vYewdfNMKkN6lyKSHNxHHeG0rzLRfSkzkuxdawOZmNeGk0sV3
         PEaifSCIDOiXQEaQDQ4lERqky195FcAFGQlxwjd6pdaPlTQ5agX6VDBpIHviY1F8x/w3
         W4/bJmiZiHm0nlyEOeYGCuLc3XX/1xHtTjVb117Sw0+IE5TTN50P0XfZECym1ISC0AGS
         xwF47f/hehl98TI7P0Im8tSinnLKGs6WmnOFMt7mynGJ8hR7NJLiq9Kf45y5PHjv11av
         Oz6fy4PIpqzR3zKY3+WyyWlLp2Z5WCV+NuivX87S4oBIMz3KD/BCYKGbI3oTl0bZMNCw
         exww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792479272; x=1793084072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BJjTco/BBK0P9An74sSOm1tzYey1GPlNFjyOJY9OwIo=;
        b=mtm9IB2HOBbodxxFv8OX8bUL2TcKMpqyMRYJ/Wy/GKvXvoU7YBVd3DojejhHdQiQIg
         s43UeDHJstEDM80b7k4H9k9UPFVZmZig75h9zsxJnxJMLWuXFqIeW5shziRTF+5KyyFa
         bed47wk5Ew3NBPlQqyhIBsAWKlVo7sPG3cZcH7zq/60W20QszbJQNU27LmF3PB2dis2Y
         VIqMOwHXWHwo4AstaGiLtC00gsW+jEsaHvkBXm0SivLhb16KG9tbWFEEvcJ9398Jo4ng
         CUl3CLZuyPeINxe9RYOAqI8yGcUDztYo3kVcUbVvqIMCusjVXzBUdwcuG8bczpcG3Z13
         UOXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWbX1Str3o6R0vwHNn3V7WkwMdmb/1XA90KLHhUoOTrX2NxN8HfzR2Cuda75fj6vw4NdAenJWMWfQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXUoXC9sKvgV/9h/HFX+chC8H5wiyI2YcxThjQwefrEFHaTi9j
	5AHZbnsObOM/Ag5edo6Wd7RUBWGCdylNvazSpuDqSNDkdgKi+Vf1EdICpJ5P8m0iFg==
X-Gm-Gg: AYBFou3korNfSIVaZZGpHVd5d28muiuW9b+knF8DVp1C6PiGG6Ano+W+ebZNYBQSsEj
	hmqKPrF2YktJDv6XPt6vIfNWgNBnHdJfDolO2SX+K5NWQtYdBJlmsPq+ZNeChK88W06i4xXVSOe
	3pngi+mqZtlQseHoeo2zrprKfe21iYojitm6V46egJQVgieGbdpI74BwcxQJBEkf/SeYkbSl8LN
	V/2cSU1MCQRs32HfektAMgi9hcKO62u4m7ygQjRtBKiYEwg2DzKagfMb80vbX4j2V7fxL9zoVYs
	wXG4XmXyNStJBCg7FxX+mRaaSq+jE72bfrsqM2i8BM/9CKuj78ZFWPGXGBMgfxf0Vp3REJjHYsI
	Rk90WY/zdYEzo1R6yrw2YTxCcQDBZISXQaL3cA1oK89RxFXgwdhyispKyfoV8BfERkiZahiZ7FV
	kaKUX0xwimMtoExtFmXZcyfK1YXPWNF9KDeLgF3SCyMMu4P0G+z6BEcaumZg3diiY/g2magPyTU
	R6hIDKmocboMODMoLZlCltEDDHwnbj+MuAlOQB2ozYCWaTVOzQ6YQ/hrqrAhXRGIg1GWMUDtKh3
	9Z6e1rKBFDKzVEWg7ftSs4ajAPYW3/8g8VgVYXaHlYBGV2sY1fd87IUdWWVl11wud/KTgkT+Bsd
	p4pdL94kUyF3eVWo8tkLs+2MHuXs93lnGZ7nrr6xgGm9c2j2ErI9A2ojwBqnzTi8Yfwp0MmdNEb
	Pd8L1aEg==
X-Received: by 2002:a05:6402:1d54:b0:6b1:b1b9:482b with SMTP id 4fb4d7f45d1cf-6b3a8155676mr6443778a12.14.1792479272378;
        Mon, 19 Oct 2026 23:54:32 -0700 (PDT)
Received: from Desktop.fritz.box ([217.26.232.99])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1d6280sm4689846a12.24.2026.10.19.23.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 23:54:31 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vladyslav Andreichykov <vladdrako007@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-ipq6018: add fallback names for the bias PLL parents
Date: Tue, 20 Oct 2026 08:54:30 +0200
Message-ID: <20261020065430.1251541-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vladyslav Andreichykov <vladdrako007@gmail.com>

bias_pll_cc_clk and bias_pll_nss_noc_clk are outputs of the CMN PLL,
which takes its AHB and SYS clocks from GCC, so the device tree does not
pass them back to GCC. With only .fw_name these parents never resolve,
nss_ppe_clk_src stays an orphan, and setting it to 300 MHz fails with
-EINVAL. The NSS clocks below it, such as gcc_nss_edma_clk, read 0 Hz.

Add .name fallbacks so they resolve to the clocks the CMN PLL registers,
as gcc-ipq8074 already does.

Tested-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Vladyslav Andreichykov <vladdrako007@gmail.com>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 drivers/clk/qcom/gcc-ipq6018.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq6018.c
index 6943dc511534f..f58000407d015 100644
--- a/drivers/clk/qcom/gcc-ipq6018.c
+++ b/drivers/clk/qcom/gcc-ipq6018.c
@@ -360,7 +360,7 @@ static const struct freq_tbl ftbl_nss_ppe_clk_src[] = {
 
 static const struct clk_parent_data gcc_xo_bias_gpll0_gpll4_nss_ubi32[] = {
 	{ .fw_name = "xo" },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll4.clkr.hw },
 	{ .hw = &nss_crypto_pll.clkr.hw },
@@ -539,7 +539,7 @@ gcc_xo_uniphy0_rx_tx_uniphy1_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -594,7 +594,7 @@ gcc_xo_uniphy0_tx_rx_uniphy1_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy1_gcc_tx_clk" },
 	{ .fw_name = "uniphy1_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map
@@ -733,7 +733,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_rx_tx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_rx_tx_ubi32_bias_map[] = {
@@ -769,7 +769,7 @@ static const struct clk_parent_data gcc_xo_uniphy0_tx_rx_ubi32_bias[] = {
 	{ .fw_name = "uniphy0_gcc_tx_clk" },
 	{ .fw_name = "uniphy0_gcc_rx_clk" },
 	{ .hw = &ubi32_pll.clkr.hw },
-	{ .fw_name = "bias_pll_cc_clk" },
+	{ .fw_name = "bias_pll_cc_clk", .name = "bias_pll_cc_clk" },
 };
 
 static const struct parent_map gcc_xo_uniphy0_tx_rx_ubi32_bias_map[] = {
@@ -1920,7 +1920,7 @@ static const struct clk_parent_data
 	{ .fw_name = "xo" },
 	{ .hw = &gpll0.clkr.hw },
 	{ .hw = &gpll2.clkr.hw },
-	{ .fw_name = "bias_pll_nss_noc_clk" },
+	{ .fw_name = "bias_pll_nss_noc_clk", .name = "bias_pll_nss_noc_clk" },
 };
 
 static const struct parent_map gcc_xo_gpll0_gpll2_bias_pll_nss_noc_clk_map[] = {
-- 
2.53.0

