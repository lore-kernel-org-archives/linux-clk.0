Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F4147433B3;
	Thu, 26 Dec 2024 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735227018; cv=none; b=oXcI9thrkJ1g/Ju46M7TNUjh+05MLAZYUI/xEbhUDPQbs/NYqOXBb++u//qENFe0k/nwxcQjXEUMluZM6+n26tdYiYMhfBht1D8eKeoe5qaTfPyznsxS0XXcOi0lPx6r2fRECws0Bv0FMQwLB+5Ez9hQrTSrHUATLDRU88C9HZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735227018; c=relaxed/simple;
	bh=IM8PuEXS3YaAtrOGbaA3G/IgSgC/9b5SwSHaBwnBBbE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nu8mUkVuHyYTLUQ3M6ly41OyjfEuvCu9eD0iG7p/WjEUjsE7CZT3ijlBbiCwk1A8CQs6CBNTX8odO6h1yecsNdvzIhYLwLUSIM8CpNR+Uk0xsOLBqcLCP20Vez+0y1HrARoHLmA7cQ9Uukddvw8gTJDlWVkD/vHNr4ECOSbghjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=h3xvzHk0; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="h3xvzHk0"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F11701040DBCA;
	Thu, 26 Dec 2024 16:30:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735227011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CgAmUrrPv4ZDpYr8maKW90WpGsklNbEEtvRmVhbn8A0=;
	b=h3xvzHk0IqjDq7oHaniSVq4RR7v21q6iN5Uspv7S+cAy5DsQv3TJ3NiQK+TLVNgUWOlLm6
	cK7JxKI/w3loke0lF3DEofEBOoxdLPWxjdsCcvm09Z0V4AehJ1+NgBVg5ErDmHsK+kmnjV
	PfWk1tSAuBNbcjp6qLAS6saOzDjO8AO63eekGju4cEnUKb8Ptd3KVXUC01YAwriCnkCw3/
	VLxU2RAHQ1YMMspBCBbde7FkAdyAH/XgG04zrM7Idf6oBmQo+r9TZF0GqGIUzRP8xr/Cmq
	x7Ex8AgMpnMHwih6PnPXRbvijZ+UE0VBZg+TcTettrAjF506jut/33O0wj8DLA==
From: Marek Vasut <marex@denx.de>
To: linux-sound@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] ASoC: dt-bindings: fsl-sai: Document RX/TX BCLK swap support
Date: Thu, 26 Dec 2024 16:29:45 +0100
Message-ID: <20241226152953.36230-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document support for setting the Bit Clock Swap bit in CR2 register
via new "fsl,sai-bit-clock-swap" DT property. This bit swaps the
bit clock used by the transmitter or receiver in asynchronous mode,
i.e. makes transmitter use RX_BCLK and TX_SYNC, and vice versa,
makes receiver use TX_BCLK and RX_SYNC.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>
Cc: Xiubo Li <Xiubo.Lee@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: linux-sound@vger.kernel.org
---
 Documentation/devicetree/bindings/sound/fsl,sai.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,sai.yaml b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
index a5d9c246cc476..7a58df1e3f87c 100644
--- a/Documentation/devicetree/bindings/sound/fsl,sai.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,sai.yaml
@@ -132,6 +132,13 @@ properties:
       of transmitter.
     type: boolean
 
+  fsl,sai-bit-clock-swap:
+    description: |
+      Enable Bit Clock Swap, which swaps the bit clock used by the transmitter
+      or receiver in asynchronous mode, i.e. makes transmitter use RX_BCLK and
+      TX_SYNC, and vice versa, makes receiver use TX_BCLK and RX_SYNC.
+    type: boolean
+
   fsl,shared-interrupt:
     description: Interrupt is shared with other modules.
     type: boolean
-- 
2.45.2

