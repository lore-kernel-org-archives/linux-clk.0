Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=119.15.109.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764763;
	b=3KjGJGwAK7E2hDyyRxT7MuHM649n7lEMxH1BpSaM5HcjZFRXL9v+SJPPXrRF0cLq2cV/
	 /9WBcSgCMHUa+Gfj/YYFJFh5bobin3HmyT6xzIulzFdVbOCoNF9iNgudIn1mx9VOpBcso
	 IrZNJbWhed7u0w/GscwOPqrq2uYv5kXlBCZWYnTKVpaZMLDzk+vTL7wkxH2GBhOKuNOJ0
	 uHMy5r4193wDiQ7R2FEZcjGXAbLpktcNe65SuXdr6fqnS7TFl7YlsMrtlZBbi1kCuOsb8
	 27co3Ji1UxEJI7laH7ZoKQwuA94QLH5BxYo2MmaDH0+TTLSneRDmhsGRtW2zWcD/TjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764763;
	h=DMARC-Filter:Received:DKIM-Signature:X-GPT-Reason:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=EdN5PePvwqnR5e4iJ9uZ9sjTrBZADoIpDliss9XMc9M=;
	b=E5umRvlydRnqApRw3qvFeAOIewy++YoVGSiDHMCQWVisBUN9ZYZk40MJIFf5OPQqb59/
	 pwGS1hZVBxnDUb9iX2a5xNqrrFY+inTP5kQh5CeOsftfZWok1qAVrTBWEcGolbuzy7flb
	 5Mmy47TbNXgBJ83yim6NF9jITYiiIjrR1wpXdrDXNvoauKvfMBFggXJtLd2ZnNetsCFIL
	 qpew9/Byi5zQ0gM+gnmTUyr/dm8fcqe6cAOk1Eon801J60w83w7iszRzXVah1IE00Gusy
	 Gck9OpPzGpnYSxs9q91kFGr7wH8t6uWXoZMCjtLyw1gt8Fo0gAt/KyhEQMzkfljCTXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=d-silva.org;
	spf=pass smtp.mailfrom=d-silva.org;
	dkim=pass header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=cKh8YSZI;
	arc=none smtp.remote-ip=119.15.109.137
Received: from www.nmnhosting.com (watt.d-silva.org [119.15.109.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A25606A323;
	Fri, 27 Nov 2026 07:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7A25606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=d-silva.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=d-silva.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=d-silva.org header.i=@d-silva.org header.a=rsa-sha256 header.s=2025a header.b=cKh8YSZI
Received: from Hawking.lan (hawking.lan [10.0.1.4])
	by www.nmnhosting.com (Postfix) with ESMTP id 070444C955;
	Fri, 27 Nov 2026 18:32:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=d-silva.org; s=2025a;
	t=1795764752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EdN5PePvwqnR5e4iJ9uZ9sjTrBZADoIpDliss9XMc9M=;
	b=cKh8YSZIzLt5Uc639i/UDbw9GzdXJf0nxSgyy45sOkyvdTej2GTM3EfWixiXNRcKV9KAKi
	4Ej55uhZxuZB1ff5tEWtp7+Xrbuzx33vjic77Rt8dC/hn/FBh8zweARZpZ5gqFky5v9+sx
	CjYyPFIEMpWGbe/jw4aKI9Ladn3l/EVAMuMqmJTB40on86NBLxVq55sJP+t76mFLy3fpJm
	arjtJuEKOat1b2jp/uC5w4/NJrmXRpH7CCAXFw98Bvvp72lSUvRkxHAih2A28plEH8qTQw
	fpch6/fe07M/NW2rG48HAvVAZ8X8TtcREBh5Yume+urdqFEZ/6PVrYm3c/stCg==
X-GPT-Reason: legitimate_transactional_technical_notification_content_matches_the_mailbox_purpose_and_sender_identity.
	The message is a technical kernel patch submission from alastair@d-silva.org,
	which aligns with the recipient's domain/identity context. The
	content describes specific hardware support for the Allwinner
	A733 SoC and provides detailed file changes and prerequisite links
	to lore.kernel.org, a standard domain for Linux kernel development.
	There are no signs of phishing, urgency, or marketing; the formatting
	is consistent with professional software development communications.
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
Subject: [PATCH 00/11] arm64: dts: allwinner: Add Allwinner A733 USB 3.0 support
Date: Fri, 27 Nov 2026 18:32:20 +1100
Message-ID: <20261127073231.1776847-1-alastair@d-silva.org>
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

This series adds USB 3.0 host support for the Allwinner A733 SoC and
enables it on the Xunlong OrangePi 4 Pro.

It adds the USB 2.0 UTMI PHY driver, USB 3.0 mode for ComboPHY0, USB2
CCU gates, DWC3 glue support, an xHCI W1C port change quirk, and DT
nodes.

Verified on the Xunlong OrangePi 4 Pro with a SuperSpeed (5000M) USB
3.0 flash drive.

Prerequisite series:
- arm64: dts: allwinner: Add Xunlong OrangePi 4 Pro support (v2):
  https://lore.kernel.org/r/20261127065343.1449675-1-alastair@d-silva.org
- Add Allwinner A733 (sun60i) PCIe and Combo PHY support:
  https://lore.kernel.org/r/20261125062948.1234677-1-alastair@d-silva.org
- Allwinner A733 PCK-600 power domain fix and DT node (included in
  prerequisite-patch-id below).

Alastair D'Silva (11):
  dt-bindings: phy: allwinner,sun60i-a733-u2phy: Add Allwinner A733 USB 2.0 PHY
  dt-bindings: phy: allwinner,sun60i-a733-combophy: Add combophy0 USB 3.0 support
  dt-bindings: clock: sun60i-a733: Add USB2 bus and sys clock IDs
  clk: sunxi-ng: sun60i-a733: Add USB2 bus and sys clocks
  dt-bindings: usb: allwinner,sun60i-a733-dwc3: Add Allwinner A733 DWC3
  phy: allwinner: Add Allwinner A733 USB 2.0 PHY driver
  phy: allwinner: sun60i-combophy: Add USB 3.0 PHY mode support
  usb: dwc3: Add Allwinner A733 DWC3 support
  usb: host: xhci: Add W1C port change quirk for Allwinner A733
  arm64: dts: allwinner: sun60i-a733: Add USB 3.0 controller and PHYs
  arm64: dts: allwinner: sun60i-a733-orangepi-4-pro: Enable USB 3.0

 .../phy/allwinner,sun60i-a733-combophy.yaml        |   5 +
 .../bindings/phy/allwinner,sun60i-a733-u2phy.yaml  |  58 +++
 .../bindings/usb/allwinner,sun60i-a733-dwc3.yaml   | 103 ++++
 .../dts/allwinner/sun60i-a733-orangepi-4-pro.dts   |  31 ++
 arch/arm64/boot/dts/allwinner/sun60i-a733.dtsi     |  61 +++
 drivers/clk/sunxi-ng/ccu-sun60i-a733.c             |  10 +-
 drivers/phy/allwinner/Kconfig                      |  17 +-
 drivers/phy/allwinner/Makefile                     |   1 +
 drivers/phy/allwinner/phy-sun60i-combophy.c        | 573 ++++++++++++++++++++-
 drivers/phy/allwinner/phy-sun60i-u2phy.c           | 233 +++++++++
 drivers/usb/dwc3/core.c                            |  18 +-
 drivers/usb/dwc3/core.h                            |   8 +
 drivers/usb/dwc3/dwc3-generic-plat.c               |  15 +-
 drivers/usb/dwc3/glue.h                            |   6 +
 drivers/usb/dwc3/host.c                            |  10 +
 drivers/usb/host/xhci-hub.c                        |  53 +-
 drivers/usb/host/xhci-plat.c                       |   3 +
 drivers/usb/host/xhci.h                            |   2 +
 .../dt-bindings/clock/allwinner,sun60i-a733-ccu.h  |   2 +
 19 files changed, 1177 insertions(+), 32 deletions(-)

base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
prerequisite-patch-id: 19691099774bd3dc41f56585c03ddefb7bdc6f9c
prerequisite-patch-id: 85db03df3394cdcb2780a0da122a74b2c1fe220d
prerequisite-patch-id: a3e883da50bf03e8f522444def66fec7f996ffbe
prerequisite-patch-id: c6889699a6dc13c336ce4cf4659e21b551e9a9fc
prerequisite-patch-id: ef2f0344452092edb2221b93c44a3e82cb896a2d
prerequisite-patch-id: c598480f753e36b7f6230129b864c559b9f185d5
prerequisite-patch-id: f86b468a896a40f132adfcba885700327dff1bc5
prerequisite-patch-id: 079d60101e1b9e5425458060314bde3e9cc2fe4c
prerequisite-patch-id: 090c5ff78d4e2150804aa8d294581cd338b1e971
prerequisite-patch-id: af0aebcae7c38d58354925119c412178b5821b5e
prerequisite-patch-id: beb8a098ba14724e316ff243bdf8e00e729243c1
prerequisite-patch-id: 63342c5ec38e8eb9e55c8c74d3c5a81a630d5f69
prerequisite-patch-id: 1dc8d70f80674c98b2b15d09556dd27f643b20da
prerequisite-patch-id: 4555860586ef50f27bf787a23f6ba693e9c3b0d6
prerequisite-patch-id: 0279f281cd59cf54bceee39b0fa4d0b6a7b87c48
prerequisite-patch-id: 14424bd8324b6cae2b8c4d6840df0db626d1385f
prerequisite-patch-id: 7b42728bc8271e5dfd57fffec47a7f5745eff357
prerequisite-patch-id: 74f5c7d066477024a374a789b3180e841398fb07
prerequisite-patch-id: 309a5a3ca5b216915907263dea7024263abf1d1c
prerequisite-patch-id: 55e543b9854c7ae2fa86969233d05ccadd3792e9
prerequisite-patch-id: cfcad85224e288ec2168e7f245b4a1c63e9a34a7
prerequisite-patch-id: 18dadb9c1e41141d015422b658b7dd0d153b7d69
prerequisite-patch-id: 47a863f533ee9ae1589e25618f27a7282a0f8d37
prerequisite-patch-id: 54181ce00a78f9f69031d3964f14bf800dd98e0f
prerequisite-patch-id: 5a6d6dac4f6b42edf911fbca2078508e977bdce9
prerequisite-patch-id: e919d9591e97e3b69fa86625a868583ee74d16db
-- 
2.47.3
