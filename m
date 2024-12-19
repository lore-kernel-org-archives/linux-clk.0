Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B055F218AB7
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 07:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593301; cv=none; b=OyGHkgjrXyY+eS5fEqIerFC2rt9xiHq5fW5WPsTADC0yhm4yC+AsscyW5Aow2cyBueX7DNkhHmosxiIw20SHxtf9Q0+sjV0qZUiN76C988PyQO9w89Lx3gVsdbNRWBOrX2SVKOyOhRyf45qhklAtl/bYAo+zT0nsydk52NoKFyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593301; c=relaxed/simple;
	bh=rfvpn1pfEekZZhLEHjOu6jZCZm59cxk6zu8y9TSiWyo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T2AXkx5R+F4ZlvLlz+rRCidqGRq3uzGYK7f5hcDf328MdIarQim3wboIeewfTyZykE9eU1CjC20jwbbLLpUSxCcmxfNxkX4tSAD/rnq06OcaN5ssJKD1p+Oqp8EBr4fLAAhJKsKdGD4oZ7DC79J7O+oJXJGQ8d/aEL62GEjMQFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-000727-NA; Thu, 19 Dec 2024 08:27:33 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwW-004AP5-1G;
	Thu, 19 Dec 2024 08:27:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00Gewn-0I;
	Thu, 19 Dec 2024 08:27:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH 0/6] arm64: dts: freescale: imx8mp-skov: switch to nominal
 drive mode
Date: Thu, 19 Dec 2024 08:27:31 +0100
Message-Id: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOPKY2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0Nz3czcCotc3eScbF1LEzNzczPjlLTkFAsloPqCotS0zAqwWdGxtbU
 AOf4Rq1sAAAA=
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, 
 Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.13-dev
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

Unlike the i.MX8MM and i.MX8MN SoCs added earlier, the imx8mp.dtsi
configures some clocks at frequencies that are only validated for
overdrive mode, i.e., when VDD_SOC is 950 mV.

For the Skov i.MX8MP board, we want to run the SoC at the lower voltage of
850 mV though to reduce heat generation and power usage. For this to work,
clock rates need to adhere to the limits of the nominal drive mode.

This is done by this series: A new imx8mp-nominal.dtsi reconfigures
the imx8mp.dtsi clock tree to be compatible with nominal mode, an adaptation
to the Linux clock driver makes it sanity check the actual clock rates against
the SoC operating mode's constraints and finally the Skov DT makes use
of it.

Actual configuration of the VDD_SOC rail continues to happen prior to Linux
as well as PLL configuration that needs to happen earlier than the kernel
running. See the corresponding barebox patch series[1] for details.
Note that the barebox series didn't yet include VDD_SOC reconfiguration
to 850mV, that would follow once the kernel changes have been merged.

[1]: https://lore.kernel.org/barebox/20240503103717.1370636-1-a.fatoum@pengutronix.de/

---
Ahmad Fatoum (6):
      dt-bindings: clock: imx8m: document nominal/overdrive properties
      arm64: dts: imx8mp: Add optional nominal drive mode DTSI
      arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
      arm64: dts: freescale: imx8mp-skov: fix LDB clock rate configuration
      arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
      clk: imx8mp: inform CCF of maximum frequency of clocks

 .../devicetree/bindings/clock/imx8m-clock.yaml     |  14 ++
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |  64 +++++++++
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |   5 +-
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |  19 +--
 drivers/clk/imx/clk-imx8mp.c                       | 147 +++++++++++++++++++++
 5 files changed, 233 insertions(+), 16 deletions(-)
---
base-commit: 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8
change-id: 20241217-imx8m-clk-9467763dfcd8

Best regards,
-- 
Ahmad Fatoum <a.fatoum@pengutronix.de>

