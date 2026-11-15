Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794723083;
	b=1DWnA6JTtXAWZe25Eteamtr/vVi2SmNuK6itrnlzSTvI1BhCWKaMuhPkTNlNwtJaLB2X
	 DpfQN2Dg9DXK40JNxOmq3lgHlk5A761f1+0da4ATsSF4BBL1u88sOiMgH2vjUlNJYPjj/
	 vm3JNfmQdPUIA+lpDhB16VgFujhBApZkZ3N4YJB6OL7zf4R3shvd2SWlhQOoz+9gBCLFU
	 teKfuLJjjYE+osnImGj+uPLbwbHJFz3NxxYpdLmqNrZ8XEXplyBEXmF+YXYgSMzG3VgWm
	 4u53jebkxDI6Ug4h1p5SDCmDGkPFcJCUmP2xUXWW1t302ia7InuvTsN1Ahr3YLq5FJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794723083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
	b=FZh6yHV0Ml6T3iNTUnh41ysiUnTUiiWVWTWEaE3P0IBf3lP0OaN5gvvvXMxnryeZRnA0
	 ALnVnOUAcneaOw5PqWIFK84Yeb1eFoHcAagaGw/8TJAnzahf1Fej4NWHUDriMtu8OGZon
	 YFy7g+A2zhKVMEAuAywKCbXAKxLAmMDlmKqHdjAsaZFh6sKsbo1N4XcvAvzTXKlG7i2q7
	 CoNHDNrh2NCuuDGTdkEXtK5YnmlBmNvPfjvAkHR7pOyW88obAVouQo4r4ftdiLYeQS95F
	 hZbQiEbVrS9k6n5SdG4OtJ5sQhS34LiElnQmPwZdsJCzlplk1zIygp6N84gk+/uKuHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9766C606A332
	for <linux-clk@vger.kernel.org>; Sun, 15 Nov 2026 06:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9766C606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vlTlGXIO
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4b467581b98so18045775e9.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 22:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794723082; x=1795327882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=vlTlGXIOH7WEwDuXuI73oMjpDY1y+4bmEoL2DDdSjoaX/Gq2J+q7U/y1GObo0M41PN
         89Ps3BWtI76Eh3BSaGuOi4Bm8huVoWM7uEN/jfuSOS+8vuWNT7WpZ0VyUJQrwxjvHIAx
         AmZkh+X6uU7UQN+pj6Sjsv0thdeqR++v4H/sdHwEZyvpZ6gx3exJsEuzduW5PHaW0XtM
         B2xW7jTtfigZ4hVLLYhAUtxSjHg3hkVExtqqJAEmWC5KTwgzW/y2OoP3gf5ZmGGLQmRL
         cr5hyWG1lHEa8F/PrQ+sx9nUci3em/EVQDCtaPj0Lizy5Z87MCdAgHlXyCcUcDvpzenZ
         lAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794723082; x=1795327882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ahJXFdL35LJt7+dj7dVWYLqD2Vs+Z841K5O8NV4NEdc=;
        b=PdmkmhCCxsbTBr1ABiWQvG/h5Z7nWYoWv01YSY7POlrQxmUt7AnQjFu7qx/l2F1oUk
         9JLsLwVcroXsNmqZ/+Lo43BRKfFYXJEDrmrPLNCQY7swE4sEGuDP7q8Nvb938H/13l7f
         y66dTUa0smODE5QswWgaOLQ+hbi3MKbwWKlLBbR3q9prtv5UR/30VvrlhZ7eoVwQ+n7W
         +FfoqDBsrjNI86sstIOa2Po9kBZDPWSK0fgV12UlCSC60+o0vZ2hy4c/hT14wx/IqyFq
         yww5snCRY2CLP3lsd4QyjDjCFBkjHqwk3YApJHJxCGoMXdXyB6OTOV9QLaQ/M96lBaMN
         5meA==
X-Forwarded-Encrypted: i=1; AL+hErFMztAZqo2oRmgjjTS2D/drZFDtACo/RE70YAv2KJ7iVZsHwvomJ0ZmqLO8wCOQOCizg88VLdNlMk0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+M+hM2EhE19odUFc/hnsYvSfBl3QR0fc/IpuXrEISwO2XoY9pg
	9xc8cpLsgTQzyzgdupSda9+fqGompDnqVjSlQZAARseVIsQtrzXEb2EI
X-Gm-Gg: AYBFou3DaO/wo8ZunA5r426rXCcTvHvKHMOi5UrpGMK1eeQ9voSzTK8oLq9cfxxt/RF
	iVgzEezE/EQw/asamiplo1YWqnmfxIsxlgu2kkIWpFKzLs16XxYzSRNY9iZSckI3eEIHXQ1ThW7
	qboDXgwj1vkT+isdWJrcyxTsFzqxeKZ+2qoWVDizHHluwUL08wnKPs9MaIknBK6HK/6G+muCS1x
	CHxPnXvGsW9eIWEzV4O2o5Ym+XQFGKCNkVCC0UMlNvTJlEjLIRzAs35HuI8ud1HuaoUPovFJfdH
	cox+SQOlO3Ypt+exZU9GXeQnb4FDsEZ2X1yzJ0R/Ni+UYhCUb/FR51I1iY2wCFiZKk6NLM0jaaL
	Cm3wXTLT9dFkBW/dt6uji6wz8KW/3ZwK75w0SxYA3JZ+ohXg28ReOiiaNxminAODt5L7o3U8sLc
	uGVm/+6bYsQ9viGbmk94ST6er+eZdsnWdgxBw5amBwdjRGD92Akm76KVp3L5jhp1hc4LOZ1ljwP
	RIxIpPP5KXuFhnrVRQMupDYgAKsBXZUnETTwLOCxCj4AgceDGsx7xkiAuJ/5idiSMpudcO4bO4v
	WfuQgiIySBgqkyi3Mxp3heGtN1db8zMhUqGI3bYf2i14Z9kXPXj2uG7ZLR+HPrJPbdDzt5eMyhS
	jsTQSujOTaUdhb01mpGJIPYujlySfO8YUd1239Nufm+8KhV9kfUUpNxK1BmcObeIVx0aTUjAtJW
	pEPGXQmSZoB58b6LaDaQOtdxrB9aa6fao7T3cWrzRawIHqUsZW71KsT/aeYh9gK6a1gODwAQvX4
	erfZnn/e3r/nTJbCqkInIVwPSibMWSkyCw=
X-Received: by 2002:a05:600c:4752:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb55ab2b89mr152010325e9.22.1794723081993;
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
Received: from jernej-laptop ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5ba25b50sm139331075e9.14.2026.11.14.22.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 22:11:21 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: mripard@kernel.org,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	sboyd@kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v3 1/8] clk: sunxi-ng: de2: Fix Display Engine 3.3 definitions
Date: Sun, 15 Nov 2026 07:10:55 +0100
Message-ID: <20261115061102.229680-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115061102.229680-1-jernej.skrabec@gmail.com>
References: <20261115061102.229680-1-jernej.skrabec@gmail.com>
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

Positions of clocks and resets changed when version 3.3 was introduced.
However, old positions still work, just by luck.

Note that DE 3.3 actually has only one bus clock, which is shared among
all cores, even though it is named BUS_MIXER0.

Fix Display Engine 3.3 resets and clocks according vendor driver.

Fixes: be0e9a372787 ("clk: sunxi-ng: ccu: add Display Engine 3.3 (DE33) support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 39 +++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index a6cd0f988859..6ec6c0dc4c26 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -36,6 +36,13 @@ static SUNXI_CCU_GATE(wb_clk,		"wb",		"wb-div",
 static SUNXI_CCU_GATE(rot_clk,		"rot",		"rot-div",
 		      0x00, BIT(3), CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(mixer0_h616_clk,	"mixer0",	"de",
+		      0x04, BIT(0), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(mixer1_h616_clk,	"mixer1",	"de",
+		      0x04, BIT(1), CLK_SET_RATE_PARENT);
+static SUNXI_CCU_GATE(wb_h616_clk,	"wb",		"de",
+		      0x04, BIT(4), CLK_SET_RATE_PARENT);
+
 static SUNXI_CCU_M(mixer0_div_clk, "mixer0-div", "de", 0x0c, 0, 4,
 		   CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M(mixer1_div_clk, "mixer1-div", "de", 0x0c, 4, 4,
@@ -54,6 +61,9 @@ static SUNXI_CCU_M(wb_div_a83_clk, "wb-div", "pll-de", 0x0c, 8, 4,
 static SUNXI_CCU_M(rot_div_a83_clk, "rot-div", "pll-de", 0x0c, 0x0c, 4,
 		   CLK_SET_RATE_PARENT);
 
+static SUNXI_CCU_GATE(bus_mixer0_h616_clk, "bus-mixer0", "bus-de",
+		      0x08, BIT(0), 0);
+
 static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer0_clk.common,
 	&mixer1_clk.common,
@@ -74,6 +84,12 @@ static struct ccu_common *sun8i_de2_ccu_clks[] = {
 	&mixer1_div_a83_clk.common,
 	&wb_div_a83_clk.common,
 	&rot_div_a83_clk.common,
+
+	&mixer0_h616_clk.common,
+	&mixer1_h616_clk.common,
+	&wb_h616_clk.common,
+
+	&bus_mixer0_h616_clk.common
 };
 
 static struct clk_hw_onecell_data sun8i_a83t_de2_hw_clks = {
@@ -147,6 +163,17 @@ static struct clk_hw_onecell_data sun50i_a64_de2_hw_clks = {
 	.num	= CLK_NUMBER_WITH_ROT,
 };
 
+static struct clk_hw_onecell_data sun50i_h616_de33_hw_clks = {
+	.hws	= {
+		[CLK_MIXER0]		= &mixer0_h616_clk.common.hw,
+		[CLK_MIXER1]		= &mixer1_h616_clk.common.hw,
+		[CLK_WB]		= &wb_h616_clk.common.hw,
+
+		[CLK_BUS_MIXER0]	= &bus_mixer0_h616_clk.common.hw,
+	},
+	.num	= CLK_NUMBER_WITHOUT_ROT,
+};
+
 static const struct ccu_reset_map sun8i_a83t_de2_resets[] = {
 	[RST_MIXER0]	= { 0x08, BIT(0) },
 	/*
@@ -180,6 +207,12 @@ static const struct ccu_reset_map sun50i_h5_de2_resets[] = {
 	[RST_WB]	= { 0x08, BIT(2) },
 };
 
+static const struct ccu_reset_map sun50i_h616_de33_resets[] = {
+	[RST_MIXER0]	= { 0x00, BIT(0) },
+	[RST_MIXER1]	= { 0x00, BIT(1) },
+	[RST_WB]	= { 0x00, BIT(4) },
+};
+
 static const struct sunxi_ccu_desc sun8i_a83t_de2_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
@@ -244,10 +277,10 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_clk_desc = {
 	.ccu_clks	= sun8i_de2_ccu_clks,
 	.num_ccu_clks	= ARRAY_SIZE(sun8i_de2_ccu_clks),
 
-	.hw_clks	= &sun8i_h3_de2_hw_clks,
+	.hw_clks	= &sun50i_h616_de33_hw_clks,
 
-	.resets		= sun50i_h5_de2_resets,
-	.num_resets	= ARRAY_SIZE(sun50i_h5_de2_resets),
+	.resets		= sun50i_h616_de33_resets,
+	.num_resets	= ARRAY_SIZE(sun50i_h616_de33_resets),
 };
 
 static int sunxi_de2_clk_probe(struct platform_device *pdev)
-- 
2.43.0

