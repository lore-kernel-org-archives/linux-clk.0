Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DF11DF247
	for <linux-clk@vger.kernel.org>; Mon,  6 Jan 2025 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736173316; cv=none; b=TvgNwdqev/jeZbSM7yoIfPiX7Sb6WnXDbmQJFCQ1PaXXRN+2wSpiUvL6d9GNWhsdPPRd2SoiJqUAOSjTW+qY44xn4dKB22RhDe//c/B6JJG6EaKRw/cSoSrAN0auu4pkzQ9co8r/RjoYxFG9tApRAGVHmJDNsFWQZU3L8880f6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736173316; c=relaxed/simple;
	bh=NacTOPMnDCCkp3IeiYAgXrTyd0jLgYE4qgPr6BR0jQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=syALjYBmx6BnLt8Q9pSJIg77/4wYGzxhhZF1bTX3BUi5J/uNwFSPWudFcU7u4rN9yh/DLYfb90vck0PHA9db9nGqfEX1X9Cs1HnN/kj9CdVyv+h4pJ4Xdddo5BzbVJP2AgmlvPLp4D9INEPp07K+CVi8unFcEpKfFFxKw1dbSuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUnzF-0003vS-CM; Mon, 06 Jan 2025 15:21:45 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUnzE-007BR2-0S;
	Mon, 06 Jan 2025 15:21:44 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tUnzE-008rLw-2Y;
	Mon, 06 Jan 2025 15:21:44 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Mon, 06 Jan 2025 15:21:44 +0100
Subject: [PATCH v2 3/6] arm64: dts: imx8mp: add fsl,nominal-mode property
 into nominal.dtsi
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-imx8m-clk-v2-3-6aaeadac65fe@pengutronix.de>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
In-Reply-To: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
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
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

The imx8mp-nominal.dtsi is meant to be included into boards that want to
override the default overdrive clock settings with settings suitable for
running in nominal drive mode at its lower required voltage.

Specifying fsl,nominal-mode informs drivers of this fact, so they can
sanity check runtime clock reconfiguration to observe the limits imposed
by nominal mode.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
index f9a82a663033a1dfb72163eebb62e4aee66cee2f..532eb049c7e87b562e91c70722434166a21f19dc 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
@@ -21,6 +21,7 @@ &clk {
 			       <800000000>,
 			       <600000000>,
 			       <400000000>;
+	fsl,nominal-mode;
 };
 
 &pgc_hdmimix {

-- 
2.39.5

