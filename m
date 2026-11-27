Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774118;
	b=FyOIpYSy3e0gx8tJnu6J0E6GP2caKkiMQF4EdQBNly20vtyQZuIOnoZtmQgB8ZSwXfBA
	 8kMu8K2ycEU8kh1IdRF4cA4QRFLMJXTQ3tiOoeicuJcD9ASjATu5UJO5LeFmM+VldQk83
	 VVZn9xSAXQVFYpI9JXKlT+x5pB3gVxIv0QuWc9aEBJCivY/rwKiioYuUPdW8m3Uuznj7S
	 tnn7lZH+don97HcfefLRwKadHGj9+HthZp9kg5IXPVoLX6/vWTeYXG3hrIHaYkV/wN30K
	 oQU3/gcjI5F4kVQdWYY5p8VHkfErcfsX2gTwSJ3nMfl4I5IMfYj9NvT8LKlgcbIYsRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774118;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4IV3yRHhQQZGklGZH5PN/o6RqZMOoboQKYnTyajhFCc=;
	b=xc8Jl/eueigNTxxhVeswNbIwVinFnMZTNm/g60yMUs2vfIXpR/eVu1ktUeHcBjBRG4ZB
	 1K7vNSWe5Fs27ax9wx7lTJt7T/y3vWYKIAh4pkwEdOOE4+dWurn6c61B3gb9h41JYgQzq
	 kNpe4Ntff6OcYike3Gnfkqqy4QBv6boD8TJ/0Gw2ClIr2BnmfB+3KMvkTZr++f51iaTUh
	 4GkRBlXoVt08vnx6DfEJe5hDPO82p5cQc3sGf2Lnd8SYLCvCHkhbnxJY71NGPxayC6NeS
	 RagBFRBlWBRtQjYL+VkqEK2oAZs5UTdJw8bmBYvtlq1i8UsR7pBlG2tM5b4tTiqjQbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=a2sR3URN;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F49606A327;
	Fri, 27 Nov 2026 10:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9F49606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=a2sR3URN
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 2E3E04C989;
	Fri, 27 Nov 2026 21:08:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4IV3yRHhQQZGklGZH5PN/o6RqZMOoboQKYnTyajhFCc=;
	b=a2sR3URNNvwmqriKJQLlHQsXDuT/MNX4DpVkNpGoiJp6Hr2aKNmtCz0hVJbcUkMSbwuhkv
	r7k849qq2iVbWCiWjKT4+ai2IKp2P3Ltf1wu86KzsZ+1cJq9BUthaiqgErQzFdpw4aBxk0
	MezMGMJYpOTbXbe96qpzdTTfHT1quXR6+SIjpqyvJefGLk8Is/UhJb5By36C2iVfkTbYw4
	7X8wQtWrEoq1F49cBI6zwfcJNTKEYXB/zyPzpz6hdZiA71KYgp20qu0dYsaUm6wCgy3SNT
	SJZAcZGswnTQTroGbFq9UCBKqF9NbTYaJp5dh8wniNpz2e7lIxJPeINr+qs73Q==
X-GPT-Reason: legitimate_personal_technical_communication. The
	content is a technical kernel patch description related to hardware
	clock gating, which perfectly aligns with the sender's identity
	(Alastair D'Silva) and the recipient's domain (d-silva.org). No
	indicators of spam, phishing, or marketing were found, as the From/Return-Path
	domains match, no URLs are present, and the subject line follows
	standard open-source development practices.
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
Subject: [PATCH 3/6] clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as critical
Date: Fri, 27 Nov 2026 21:08:05 +1100
Message-ID: <20261127100808.2292229-4-alastair@d-silva.org>
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

The mbus-msi-lite2 clock gates the shared MSI-Lite2 DMA fabric used by the
USB controllers. Without CLK_IS_CRITICAL, clk_disable_unused() gates it off
and breaks USB 2.0 host DMA transfers.

Mark mbus-msi-lite2 as CLK_IS_CRITICAL, matching mbus-store in this driver.

Fixes: ed757071ac3d ("clk: sunxi-ng: a733: Add bus clock gates")
Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
index 958a2a2bcf76..fb4ca4ef3992 100644
--- a/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
+++ b/drivers/clk/sunxi-ng/ccu-sun60i-a733.c
@@ -605,8 +605,9 @@ static SUNXI_CCU_GATE_HWS(mbus_store_clk, "mbus-store", mbus_hws,
 			  0x5e0, BIT(30), CLK_IS_CRITICAL);
 static const struct clk_hw *mbus_store_hws[] = { &mbus_store_clk.common.hw };
 
+/* Keep enabled for the MSI-Lite2 DMA fabric shared by USB controllers. */
 static SUNXI_CCU_GATE_HWS(mbus_msi_lite2_clk, "mbus-msi-lite2", mbus_hws,
-			  0x5e0, BIT(31), 0);
+			  0x5e0, BIT(31), CLK_IS_CRITICAL);
 
 static SUNXI_CCU_GATE_HWS(mbus_dma0_clk, "mbus-dma0", mbus_hws,
 			  0x5e4, BIT(0), 0);
-- 
2.53.0

