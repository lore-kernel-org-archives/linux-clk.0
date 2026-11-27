Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764785;
	b=ICS6DJMxBRtETSC6wPmSiKcMBA4acYW+IjKBBDfP4rXY/ngUyuZU7GW9HZduoPp4L6VH
	 scyiu+dt4fJpjBZYHvhHPJ/sr9gZ0ApXsqayOVv58mXmCzF1UeQtBwl4ilvDCPbwMTVpp
	 Ij6bgy9zz0KZLeGcAHcj4UaVZJoPunfZSpE82fTdtvIo9c2vsYPJExNA+ahkIAi5JifAa
	 YKCzcs7Grih+WpAmdoz4KfmieWjtsggX2d+gqK31DwP3s8CeLoozigFz8MhcTVSh6VTcC
	 CzZN606xLxjWSiLmwIb8/lHIhoZXY3DzHwpA1QGda+cWohvu48CI0s8IT8xJM/BXxdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764785;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=;
	b=4yAYfTxznbfQh6+Q0xoibQKkhAlCQzBs476asb6fAR8l564i3H9GDTyDNBbznuapbd4g
	 rUshVTGT4o9noMQgYuNYBV3BIAPvFHDvLpay3aYET5s9dWhCJETNLmz4tTHuag2UtWqg0
	 UfTokNJ19KftETs8+XXE3Ts3RcMyynifIsGGJxI/aD9FukIFri92ZzTnAQlrOaL8UpRkm
	 Xs3rqI+s+h+WKBMCuQgbY66eO+mQVPUCxkDBKhQKGwoaeYTFjKyi7x5uKpzJBrKVjmHkb
	 Poif+mSReITkaAllTzi8dX0usZiVtwO2PlR9A4D34ug730Sa0Nq5Yw53/R4qayjjDfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=BjMGwce9;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFC9606A335;
	Fri, 27 Nov 2026 07:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFC9606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=BjMGwce9
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id BEEB44C966;
	Fri, 27 Nov 2026 18:32:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sUGpOschMgKcNOmhpOl6DU1Uf2oJ2iJXfUMTPyLb7GY=;
	b=BjMGwce9c3BvKfzqymvhn5IZjfMvWIs0nrdnoDN0PEwrDh+iYxBSnqSygFsj5ZBs/RnyjA
	PimBAaSzQCc5mM9+Rp68anzdoDnw2QdRLR/+5MRfT9uAAgupa3jEzdB3416o6od4fPiLB6
	ESwvZPemGUx/21TwGIRwJpCGCBkNeVflB/ZPYCBS0noKJvWwtB3mNi/Xypp7TXbNYl36Vj
	Bkg72jrbW7pN3IkIY3Ibm0i3C+goi2tzP7Qs4ATSmhsGfu4CM7pfQfFI+RfXClylLlpd3G
	yHdSfO8ORCmUbxiRE0FOztwpb3Uy95VAQptJKGPkDDUFDzM5z9cUH1cq9Fcyqg==
X-GPT-Reason: This is a legitimate technical communication. The
	email is classified as personal/professional correspondence because
	the sender (alastair@d-silva.org) perfectly matches the intended
	recipient mailbox (alastair@d-silva.org). The content describes
	a technical patch for "dt-bindings: clock," which is consistent
	with a developer workflow, and there are no phishing indicators,
	urgent scare tactics, or suspicious links.
From: Alastair D'Silva <alastair@d-silva.org>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alastair D'Silva <alastair@d-silva.org>
Subject: [PATCH 03/11] dt-bindings: clock: sun60i-a733: Add USB2 bus and sys clock IDs
Date: Fri, 27 Nov 2026 18:32:23 +1100
Message-ID: <20261127073231.1776847-4-alastair@d-silva.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127073231.1776847-1-alastair@d-silva.org>
References: <20261127073231.1776847-1-alastair@d-silva.org>
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

Define CLK_BUS_USB2 and CLK_USB2_SYS for the A733 CCU.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
index 81924cba58ec..1e751cfd75e3 100644
--- a/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
+++ b/include/dt-bindings/clock/allwinner,sun60i-a733-ccu.h
@@ -287,5 +287,7 @@
 #define CLK_FANOUT1		274
 #define CLK_FANOUT2		275
 #define CLK_FANOUT3		276
+#define CLK_BUS_USB2		277
+#define CLK_USB2_SYS		278
 
 #endif /* _DT_BINDINGS_CLK_ALLWINNER_SUN60I_A733_CCU_H_ */
-- 
2.53.0

