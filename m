Received: from mx-relay10-hz2.antispameurope.com (mx-relay10-hz2.antispameurope.com [83.246.65.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8493559D6
	for <linux-clk@vger.kernel.org>; Thu, 18 Dec 2025 15:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.96
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071338; cv=pass; b=hF+bw1woZKIVa1Jsj4XUNAmAG6D88s8WYwiqTvbDlcppbi5S4MzdmLz9gVcW+o4bFp8eR2G48VlNDpe9MAXdLBCro79Cz+uupYcr232JWKrf0NaJGApKvGQzw02vifo3vJK0ir3C2hwO7Wp18U4jPAyXNtrG6pCiL5WWaAEU2yc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071338; c=relaxed/simple;
	bh=XQ46J/0Q/s1txq+6yOGv2tGq9CYnPBG5axSq5J5swGE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OcZyl0OZzSVMnZ0vGxLQOFkw/6B+KjyNfdrn5IYF556yqFNPYZgNVVpNZVui65e9psczeeOQh2efChYUUvYDc5ClK9L/moAsj663Iyzd9AAM4IBaiee8KmrNZojk1kXI+LhBS14eLWTm7VTsuXXKkobrf/CDPm3WASC+VERCLEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ck1uHQw6; arc=pass smtp.client-ip=83.246.65.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ck1uHQw6"
ARC-Authentication-Results: i=1; mx-gate10-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071297;
 b=W0IF6ri/GPIL3LCUhz16LP0KDyjRFank0lc58Hff/1w7D6GHsgDkuRIIYMM6/vmz2A9+x3YF
 xOFa0moT1ESOgI92RiwhSZ/3vHzVLPgi2YbJXGIaMA3dCQb3WoTdQLZ340d1m4zdwTwPjlt0aHF
 MvR+QjHK2AWkv5fJIBCDaTRvCy8Y7h2OdKNLd0WCfYE8ZaVCPo24ft6AYbVTC/8DY5sGULGzWYC
 +jCsGXVHuHp+tWi4wWY0xvMwabb8h1C1ZiLkrMw8uUWiA8R5h/JrUTEJ7jmihrx025E8BaJxqo7
 DLbgRsTXz9T5JM/eM8BcSePlByTlEczsSZg00K1QK+v4Q==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071297;
 b=Qdnyrl49RTk3xxIm1EQpO7H8ZkJDavzrJIjZ4gLuKZhAoicB7IGgSPkQdl4bRNaTZxuQginG
 mr9RGuXXh57nXDOWTO3qNmm5/8ou+KWnjv8i8gcI7D6kK9DLQkOi6WTCFP1O/Znk5JPWt+a+HON
 tMbPeQaBSOdFTt2w87BCiUm5v9Klphl7ERPa4xoNOjmbQs5ebLFd5Iu+QRutIkhdjKN4msRIwW5
 T/JPxUTR4wX1jFeHePJz6aAMWs3zjx6ffnEGWMHb/ZNG3f55qUC575vCjKA647MBt5skHoNKIaV
 9BG74VI1NAqyDjj6m4HeZWLx0MfwtDR4gW9EsQt5vEuJQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay10-hz2.antispameurope.com;
 Thu, 18 Dec 2025 16:21:37 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 16D9ACC0D31;
	Thu, 18 Dec 2025 16:21:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/6] Support TQMa8QM
Date: Thu, 18 Dec 2025 16:20:47 +0100
Message-ID: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay10-hz2.antispameurope.com with 4dXDrx4SHSz4F929
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:836eb70413c5acce62e457440dd9da8d
X-cloud-security:scantime:4.420
DKIM-Signature: a=rsa-sha256;
 bh=7AMuBMEfhIQw9FVyiKx57RUqUljgR4wYmPvn8hqi5T4=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071296; v=1;
 b=ck1uHQw6nHbs1dtG1Xxl4rFRGuyMtoHYu6W9OLfCSGZmPKT1afrzD1H8pFACHaU8TZJoQ0Nf
 PSW+MlmFCOWhSKkXilP5OxcRLw9KEDw792aE3sl2AyRqcorO3IFS05Cl6zBax+MvBoSdy0VVdtL
 CJV5rVrS9X7qH8m04KWxgVfI2H4c7WLcAGTnVuY7xTPJQK+62UriUufr5d9YUZnT+R7IBPHF8fU
 tSXzkbczan0ScINdOU06tn0OoHBryaSGKTDfrZvGl2bUwWqwrxgtdbyynWinJoBrl0DbQw+NVdo
 QQupe6Ni7rIMW5m3+clUTv13lDCTTECkubsB5dM4I5pTg==

Hi,

this series adds support for TQ's TQMa8QM. The first 3 patches are prepatory:
1. Add support for clock-output-names for clk-renesas-pcie. This is necessary
as clk-imx8qxp-lpcg.c (driver for phyx1 phyx2 clock gating) reqiures that
property on the parent clock.

2. Add support for USB devices in cdns USB3 host controller, namely
onboard-devices as USB hubs. Implemented similarily to snps,dwc3-common.yaml.

3. Add DMA IRQ for PCIe controller. Similar to commit 0b4c46f9ad79c
("arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe") which was only tested
on imx8qxp which just has one PCIe controller.

4 & 5. Device bindings and platform DT

6. Workaround for missing "ERR050104: Arm/A53: Cache coherency issue"
workaround. See [1] for details. Split into separate commit for easy revert
once an errata workaround has been integrated.

Best regards,
Alexander

[1] https://lore.kernel.org/all/20230420112952.28340-1-iivanov@suse.de/

Alexander Stein (6):
  dt-bindings: clk: rs9: add clock-output-names property
  dt-bindings: usb: cdns,usb3: support USB devices in DT
  arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
  dt-bindings: arm: fsl: add bindings for TQMa8x
  arm64: dts: Add TQ imx8qm based board
  arm64: dts: imx8qm-tqma8qm-mba8x: Disable Cortex-A72 cluster

 .../devicetree/bindings/arm/fsl.yaml          |  10 +
 .../bindings/clock/renesas,9series.yaml       |  37 +
 .../devicetree/bindings/usb/cdns,usb3.yaml    |  11 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../boot/dts/freescale/imx8qm-ss-hsio.dtsi    |   5 +-
 .../dts/freescale/imx8qm-tqma8qm-mba8x.dts    | 869 ++++++++++++++++++
 .../boot/dts/freescale/imx8qm-tqma8qm.dtsi    | 322 +++++++
 7 files changed, 1253 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm-mba8x.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qm-tqma8qm.dtsi

-- 
2.43.0

