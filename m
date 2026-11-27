Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774099;
	b=GAeWlqIWZCWwaWHuvl3BZu0RMLaC1/x2mz1SppA4V8mBt3zoZIGsFWAXlJxZ25peA4qw
	 6alQmQthcHP8gItb5o/4bjm12TZ+G01qb502I8rt1Wk5iUYUv7IGgyZiq3UwvRjS5yRze
	 N+K2Kya5YKJgxnVnqXvYP/exXWvlvJp6raFyW9GW041vhGHTsAnVPeWUlkbngN5UI/UXv
	 YmKADYMq6td4b++Qfi96vNIr9200knVOlmZ6OYkZl54+DbwpRoO6l9Hw8JgU+Fv/SOXus
	 1IUrm5fm1ZvkKf3CsIobEhOaGZaL9VK/hszD6hi3+3MSPXOPRFAbKtkikv8ufp2/4wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774099;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=HRyaekjRkhNgArIFD/le5my/BFv/PKpDbGvsEYtTGa8=;
	b=Ooa5Dlq9IxpR1Tyn6RPVndA9D4uMUbBLkhRdnjYwqHXdkVs8GTCoCHLzzx7TLQ7DGbNq
	 MBO47EJ/gistZRuX27ZYq7GHgjN0O/sth82Mei4z4r7IeyCPU6a+T+ciYOHJa/s6849wM
	 MHkS4SqKZ1vDAK7r9w6dEBmuTtFJ85Kix+jGFLsm0SmiYz+L/1UL87cMGI+2QJgsHoQA+
	 bbgqdZRrw8oVTer+6cBjyK93HJrH2zQMoaS9r/EsCjS/adolojPIqJRtw3vlALZro56aw
	 HShLmx4B+blcz9Pk96/OMikI+IWnNQBSCUcqsSUWNvRjGJJrWspdvaj/LPCK10GIokg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Q6mJxVPH;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F709606A31C;
	Fri, 27 Nov 2026 10:08:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F709606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=Q6mJxVPH
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 3EDE24C963;
	Fri, 27 Nov 2026 21:08:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795774088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=HRyaekjRkhNgArIFD/le5my/BFv/PKpDbGvsEYtTGa8=;
	b=Q6mJxVPHh2FEeguOcRqFUb6Ccq295M2PG6f727IicOeWjkvIgCTJp+gPUBNyltccfgzPm/
	Ko2p6mz7dWIVgYt0fD6FfqTlyfsKCR4541MnO2vNeLnztFR0tB+dR5xZJwcyUq7HnbTNT9
	qbLxE4LqY2OpnmITno9syPKkVEl3b5A3WwjtBJxV10EksrK9+FqYwC2haNN4SO0vD+u3JM
	DeTVKFJZ3Xvs4huXk3IpheQ2YTvQOKK8gQQV8+bI9yx2cEE6TETUT7yABH9ttAGmdBpSWd
	d6682GcQkWg21LpTejeh9rMWSpgDermBmsvPHnO5HzE8GUeBcDk5tFndIK0WRw==
X-GPT-Reason: legitimate. This is a technical software patch notification
	(Linux kernel development) which perfectly matches the recipient's
	personal/business profile (alastair@d-silva.org). The message
	contains specific technical details (Allwinner A733 USB support),
	links to a reputable domain (lore.kernel.org), and follows a standard
	development workflow with no signs of marketing, urgency, or phishing.
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
Subject: [PATCH 0/6] Add Allwinner A733 USB 2.0 host support
Date: Fri, 27 Nov 2026 21:08:02 +1100
Message-ID: <20261127100808.2292229-1-alastair@d-silva.org>
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

This series adds USB 2.0 host support (USB PHY, EHCI, and OHCI) for the
Allwinner A733 (sun60i-a733) SoC and enables USB1 on the Xunlong OrangePi
4 Pro. USB 3.0 (DWC3, u2phy, ComboPHY) is left for a separate series.

Expected result: the A733 USB 2.0 PHY, EHCI, and OHCI host controllers
probe without clk_ignore_unused, enable the USB1 VBUS regulator, and
enumerate USB 2.0 devices with full DMA transfers.

Tested on the Xunlong OrangePi 4 Pro with a USB 2.0 hub and a SanDisk
Ultra Fit flash drive (up to 32.0 MiB/s sequential reads via dd).

Prerequisites (on top of linux-next next-20261125):
- arm64: dts: allwinner: add A733 SoC description
  https://lore.kernel.org/r/20261126172253.1097838-2-andre.przywara@arm.com
- arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support
  https://lore.kernel.org/r/20261127065343.1449675-1-alastair@d-silva.org

Alastair D'Silva (6):
  dt-bindings: phy: allwinner,sun50i-a64-usb-phy: Add Allwinner A733
  dt-bindings: usb: generic-{ehci,ohci}: Add Allwinner A733
  clk: sunxi-ng: a733: Mark mbus-msi-lite2 clock as critical
  phy: allwinner: sun4i-usb: Add Allwinner A733 support
  arm64: dts: allwinner: sun60i-a733: Add USB 2.0 host nodes
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 2.0 host

 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  24 ++++
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../allwinner/sun60i-a733-orangepi-4-pro.dts  |  31 +++++
 .../arm64/boot/dts/allwinner/sun60i-a733.dtsi |  82 ++++++++++++
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c        |   3 +-
 drivers/phy/allwinner/phy-sun4i-usb.c         | 119 +++++++++++++-----
 7 files changed, 229 insertions(+), 32 deletions(-)

base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
prerequisite-patch-id: 0279f281cd59cf54bceee39b0fa4d0b6a7b87c48
prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
-- 
2.53.0

