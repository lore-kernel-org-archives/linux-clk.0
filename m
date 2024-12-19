Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3A1A218AB7
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 07:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734593293; cv=none; b=pK2/aAd56UAAMerBidbFcFalUF9XwRxT9uyxKe7jw/0pbZpeSlnXmbYj9dsJV5ITVPRAeM+PXgNfjX6Bm7Zyk3aNoICCJFszg/9ZTKjiRXO1gFkWfIelDqMjLw1c6R4LKchW9wR++dbpYKieUZEK6urV+mPZFzg4yfN7b060NsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734593293; c=relaxed/simple;
	bh=TYtwdPjSTuL+w065ebq0Jx6PYDr/qnE3TnwfhwToEFY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K6EJ57S7govhci5LcN3n1sLWLM8c54hvGkX57IdTktrTKQxI0fGEuz8/ZTKZdS+JdSD0fMxQ6xOHQv9y+1Aormdna+5FDpfaX6mzWdd9M2CalmCMuP3qApMoq59dPTcrCKjPFIffpFruxPfkldSPD0wjaxpfvNT+gcldnyp2Ywg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00072D-Mx; Thu, 19 Dec 2024 08:27:33 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwW-004APA-1S;
	Thu, 19 Dec 2024 08:27:33 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tOAwX-00Gewn-0N;
	Thu, 19 Dec 2024 08:27:33 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Thu, 19 Dec 2024 08:27:36 +0100
Subject: [PATCH 5/6] arm64: dts: freescale: imx8mp-skov: operate SoC in
 nominal mode
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-imx8m-clk-v1-5-cfaffa087da6@pengutronix.de>
References: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
In-Reply-To: <20241219-imx8m-clk-v1-0-cfaffa087da6@pengutronix.de>
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

To reduce heat generation, the Skov i.MX8MP boards should run in nominal
drive mode with a VDD_SOC voltage of 850 mV.

At this operating point, not all frequencies that are achievable with
overdrive mode are possible, so import imx8mp-nominal.dtsi to clock down
the clocks.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 59813ef8e2bb..9dc36517e90c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 #include "imx8mp.dtsi"
+#include "imx8mp-nominal.dtsi"
 
 #include <dt-bindings/leds/common.h>
 
@@ -237,8 +238,8 @@ pmic@25 {
 		regulators {
 			reg_vdd_soc: BUCK1 {
 				regulator-name = "VDD_SOC";
-				regulator-min-microvolt = <600000>;
-				regulator-max-microvolt = <2187500>;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
 				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;

-- 
2.39.5

