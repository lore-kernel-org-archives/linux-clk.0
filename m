Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774113;
	b=kDjw1EBkSfgAgk/2qUXkT+rafp0QJ7XMo44MQmMmhTtH+dV6T84yueaqULPRxFfT4d8m
	 gOFoOSzL0JyMe+gfsHc4TzbU1V26kcbOOfpmaqhotPpobvTnAPXbwvzIS5Jtnq2Iv0dp+
	 jTcBWdHrhM+4wFsdIFiIhE9u0bxObW6g/OX3tlBBLFw5ffU299aWS9Ec8/E9yZ1Atmdpj
	 rBY3dgLkq7lfQuSjJuo801flYSPjfW2V/cP1GfDDdUHmAtRraqIW7yK0Y7xjUnr+89n6v
	 PSd/t4Sz0WCim2c3v9SXGAIybCdwAG0gNkbJuSs92egOjsfe2av3VQDBvMST9Y2rJaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774113;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=;
	b=wFw68GKrhQJ98CSCPSiQQzso463d85bh9G8JH1TX+bT9ap2kAUcAsNMT35BNFrJjLH0h
	 lCAU6nffLf277hzwd22JRmD9HjMSLPL8JdkfCT8yA5+ZvwzyRO7bARrvD1VXqF1i3yOG/
	 NpLR2j+ExbPepEJ4osGbnOLZOr6NEslLb+CPgCtqDX24sxh6zxMJfLsF8iRzlAzrKWD2G
	 ek1Q4Pm20pMr9XwhI9Maa5TOAyzSH3nV8WohKDm82b0IZV+nFuoP2p7x77m6RcV/V7+Fz
	 N8nAPYZ7sPGvpDUDctXmcgK1/Nw1FyThQfMD4yAMGF1LA2fgkSXlDuJMbup8fxuijfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=R2lKm9Fv;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B86606A323;
	Fri, 27 Nov 2026 10:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1B86606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=R2lKm9Fv
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3BDAD4C97E;
	Fri, 27 Nov 2026 21:08:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774101;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IHS463L7ZJsnVGIh6FhisLGYwFc0FaaTOlQZxZ0FPkQ=;
	b=R2lKm9Fv8PkvQg/ewGSztcOiQI4UZXZPmUC2YKQC6ywQMibApGivH/O45zacrC+KseXJsG
	P1NeO1jojdgD7mBvcl1ehd2PXosZciZzG/A29LMG2E4panA+OXsK6ZJQc5+vvWldQ36D1i
	gwPBBMtm3TRJRlETPaVY6RREKzgrT0La8VAsHnreLAGUik07+Tv8Kx2L4lSlXelrSRkgfo
	+CeU+RzTmfwCyAxD0eNtLXflcKRJa/yFU4hJNPdRkBy5PltCKJKLGFsC13Yt2nIYv0wHyj
	vQTDUnvuGPVWrRj3nPJkchLlVKYxVzuoPhu46KeyiasDvpK1KnWRGNKTRcSfbQ==
X-GPT-Reason: legitimate; the message is a technical software patch
	(Linux kernel style) that directly aligns with the personal/professional
	mailbox of the sender (alastair@d-silva.org); the From domain matches
	the recipient's domain, indicating a known entity; there are no
	phishing indicators, no URLs, and the content is strictly technical
	rather than marketing or scam-related.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 2/6] dt-bindings: usb: generic-{ehci,ohci}: Add Allwinner A733
Date: Fri, 27 Nov 2026 21:08:04 +1100
Message-ID: <20261127100808.2292229-3-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127100808.2292229-1-alastair@d-silva.org>
References: <20261127100808.2292229-1-alastair@d-silva.org>
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

Add the Allwinner A733 (sun60i-a733) EHCI and OHCI compatible strings.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 908b02d9175e..a63dc0eea80f 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ehci
               - allwinner,sun55i-a523-ehci
               - allwinner,sun5i-a13-ehci
+              - allwinner,sun60i-a733-ehci
               - allwinner,sun6i-a31-ehci
               - allwinner,sun7i-a20-ehci
               - allwinner,sun8i-a23-ehci
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 7a8c3c231815..565f41eb33f7 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -21,6 +21,7 @@ properties:
               - allwinner,sun50i-h616-ohci
               - allwinner,sun55i-a523-ohci
               - allwinner,sun5i-a13-ohci
+              - allwinner,sun60i-a733-ohci
               - allwinner,sun6i-a31-ohci
               - allwinner,sun7i-a20-ohci
               - allwinner,sun8i-a23-ohci
-- 
2.53.0

