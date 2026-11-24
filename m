Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539167;
	b=dSBHKWjmp6fD3bwAyCVx59vHyEJBGOJYTLs05NkqbutaWww/ZVxj4T0ygckNSShN9/zM
	 WKOHExZmaRelzQukwBUlGVR2d7J/G9JFH6qpy5Zmp4E12JtInrGTUK5Eyp1xgMK5UDfuy
	 aHizDoG2Mps6msA6utzDlxzvKfLZ6ShtlBjJKXO8VXJ4gZVv9bWcnglchcoCJMaGvKi37
	 VEwR4lOnWWOwRWHl5uiIeuCFVdMMF7I3Sf+tpJsD8IAL7wojiu3ervHOAizp3BLe3x0na
	 YV9vwWNe6iBc0obzSPdcHR5GbDztxsLyZF/rfhW93JJXs/kwnaxV1R3f2ymxW8lJxyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539167;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=igbHTuoPwfTKerqjOa9VXSmFDOLc1ZStxBza7ySMTBPb12WinwRCq6PjxwK+7K28BqxY
	 igDX1B6lGMSKp7em+wKPPq52Ki/E7idZRFTwsnU080hv/bapMRIab9oSDIznAOr2LEShb
	 tHkEIp3QUSkWlpOHAY3tacJv4cXlYH8tubsAQG1qW+I4fYKiZoSBRbB8lM3qZnB6vOsC9
	 nuj6SaVZfG6H1n3/Kpklqfariwm6KkeY5yyPrbqtQI8umMgr79t97GBkV7r1LjaMhYTJ2
	 sKv7fi7MKgoAFwt8/fNuly+aJk7pyjroqPy7gVyiHHIC0kGNaChCiZFr4ArkzwOQmWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1tEEQ00E;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598DF606A335;
	Tue, 24 Nov 2026 16:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 598DF606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=1tEEQ00E
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0404F4E41723;
	Tue, 24 Nov 2026 16:52:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB771601E1;
	Tue, 24 Nov 2026 16:52:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DBAF11E69A91;
	Tue, 24 Nov 2026 17:52:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795539159; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=kFZC9tucpVhNJbgeqCn+d/WcROzjtP2rv0y3T4mg1tY=;
	b=1tEEQ00E8wAWGx1Rb1aP6SoNqj7b5DEy+Gj0nJWH2y5Xn7pkSBHe5fRGD8wok7yFJSunLG
	95MGVHIfbAT0VvBeTYz88IurZ6/TNWxfVBhANt9xzukZui5T+Uy5hgBRxf/EnhIi/oAic3
	B7kicFMbGlvNI/d69rwLymS/GWdgtsYyP6FTp0w7Jq9kVVgv02MQ8+iWMuwcNMh7G56tma
	Iv+Oi3eTQMlCcUyOBkgkQWVU+Ta+a/DnTr3b1iY9KrCR6TbNhzUispaoU7fL/gNMEsZahd
	g02LByqRKcz6cRBbcFSyiji6Xb8RjQ8+wpPjGxTom2Wd0WMbCNPMd3U00yUIpQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 24 Nov 2026 17:51:32 +0100
Subject: [PATCH v13 07/10] clk: Create
 devm_clk_hw_register_fixed_rate_parent_hw()
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-perso-ma35d1-upstream-clk-v13-7-c920f4a9f0ce@bootlin.com>
References: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
In-Reply-To: <20261124-perso-ma35d1-upstream-clk-v13-0-c920f4a9f0ce@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

clk-provider.h exposes many different helpers to help registering
clocks. Most of them expose both a 'basic' variant and their 'devm_'
extension (with just the last parameter of the inner function call
becoming true instead of false). Do the same with:

     clk_hw_register_fixed_rate_parent_hw() by creating
devm_clk_hw_register_fixed_rate_parent_hw().

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/linux/clk-provider.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index a355d1ee5189..c2b80cb3ab0b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -458,6 +458,19 @@ struct clk *clk_register_fixed_rate(struct device *dev, const char *name,
 					     fixed_rate)		      \
 	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),  \
 				     NULL, (flags), (fixed_rate), 0, 0, false)
+/**
+ * devm_clk_hw_register_fixed_rate_parent_hw - register fixed-rate clock with
+ * the clock framework
+ * @dev: device that is registering this clock
+ * @name: name of this clock
+ * @parent_hw: pointer to parent clk
+ * @flags: framework-specific flags
+ * @fixed_rate: non-adjustable clock rate
+ */
+#define devm_clk_hw_register_fixed_rate_parent_hw(dev, name, parent_hw, flags, \
+						  fixed_rate)		       \
+	__clk_hw_register_fixed_rate((dev), NULL, (name), NULL, (parent_hw),   \
+				     NULL, (flags), (fixed_rate), 0, 0, true)
 /**
  * clk_hw_register_fixed_rate_parent_data - register fixed-rate clock with
  * the clock framework

-- 
2.56.0

