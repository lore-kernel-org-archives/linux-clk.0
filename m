Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792588244;
	b=XMLyPAJHDQ5o1p+2JBaCP86JtS4ZB3aAjR2FM+GJDgDOKE2fymBwDrYGsKP5xyhU1iXS
	 xd06DBXDeEBX+XqtGPAiIJn+7YdqNNmZik8dQu0+svYNbMmfB7gTmpNg2uKONkmEpd4fl
	 S0Nst55fnevXRKRxNpFeqeVE0FeuvoYFLCz1IodC1i//zBNJSFDBt3Mnps/7iqswTbQUQ
	 YtMcd0g7sJIfZ4vpD56kXIRd7hkvH+1/YZHJ4BgHRzGYGq8sFT/IfPiljdbICrSe2hU0S
	 uqpj60RSy1A15WdxJBxYA/IKchNFTimnAeQ9LNFiNP3oOKqiGhLQSOsr1yfza1L0Q3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792588244;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=p45uZWS6r+fa4kUICgrgUA0w8yqag3p0NNOZUwZi7wM=;
	b=k26gPuIkn0imftkaEzB+iM7FdM20krbF3tsIPDYQsGCzqU1iDv1cPjFeKVN/3hAkCBRB
	 UL+iDPNoasQvZODPccUmZ0Gk7aW+MpAkbpRvTvwb/IH8P7FQCUwBRIvVAwZEindaCfnTU
	 CRWnJB2AEWiESjsgy0bzm8VKQSprX4cE/hvaDz0qtgjEmfK0QNca7PheH+xNkkKLtlSHW
	 t82Ys/ldYq4Qt6sxLTs470IJlrGYKgbBmZk3+7FnCnrd2R35/SobnLmUk6NhE8JdOrOhw
	 2mfMXHSjWyqDPqAUhWdN70JVRtl0X6fSpONLgnQLVydjTo88envhJNYFGtmUvXdBynw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s7X35nOR;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79394606A320
	for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2026 13:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79394606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=s7X35nOR
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5D5CF1A12AD;
	Wed, 21 Oct 2026 13:10:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C21D606E3;
	Wed, 21 Oct 2026 13:10:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6A2FA10328E6F;
	Wed, 21 Oct 2026 15:10:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792588240; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=p45uZWS6r+fa4kUICgrgUA0w8yqag3p0NNOZUwZi7wM=;
	b=s7X35nORMe3Plo0FxJ0tkB4CXl/lwHTWKBepyvGE63ClvLCIp67QxZoey2tZr4lk1I1Wmo
	o009ruqSpHMbMQh0IsTCVUoppBnioyuNRhrxlJAY1nyqtrS3didIKN1Yrq9K4H1d23q/Mq
	EiNkXupk7zHjab9dPnamiwd5VGzLux+Q/RLvYrCeW4dMEphJmr5LvI0HVy0IUIywws+Cu8
	dfys6SBPs/GrGOb3BsojDn+Ef7g5ldmvWstngxdqAK2KlfSw1cI2RUKjlnpPJSr5NsE7qx
	dT/rHjpA7g5EFuqdSOvQ+Bimd75AqgTMZJZ78hLj//hCkjaQegi/nAvuVkMxKQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Wed, 21 Oct 2026 15:10:01 +0200
Subject: [PATCH 5/5] arm64: dts: imx8mp: Drop VIDEO_PLL1 assigned rate
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261021-ge-clk-lcm-v1-5-246cc35b5ffb@bootlin.com>
References: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
In-Reply-To: <20261021-ge-clk-lcm-v1-0-246cc35b5ffb@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
 Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Ian Ray <ian.ray@gehealthcare.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This rate has never been assigned for good reasons. It was assigning a
frequency only adapted to the panel of some evaluation board, while
allowing a rate division by 7 and 14 for the needs of the LDB.

Linux now has an LCM-based divisor calculation that allows us from
dropping that inappropriate assignment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

I believe most of the users of this DTS set their own frequency in their
downstream DTS, just because the existing assignment won't fit their
panels, so while in theory this change could break bootloaders/other OS
pulling this file, in practice it is unlikely it will. I don't know if
we really want to do that cleanup or not since at most it is an
incorrect and useless assignment, but at least one should know that it
can (should?) be removed.
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 9cf9f6f08654..7691d917646e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1988,16 +1988,14 @@ media_blk_ctrl: blk-ctrl@32ec0000 {
 						  <&clk IMX8MP_CLK_MEDIA_APB>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP1_PIX>,
 						  <&clk IMX8MP_CLK_MEDIA_DISP2_PIX>,
-						  <&clk IMX8MP_CLK_MEDIA_ISP>,
-						  <&clk IMX8MP_VIDEO_PLL1>;
+						  <&clk IMX8MP_CLK_MEDIA_ISP>;
 				assigned-clock-parents = <&clk IMX8MP_SYS_PLL2_1000M>,
 							 <&clk IMX8MP_SYS_PLL1_800M>,
 							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
 							 <&clk IMX8MP_VIDEO_PLL1_OUT>,
 							 <&clk IMX8MP_SYS_PLL2_500M>;
 				assigned-clock-rates = <500000000>, <200000000>,
-						       <0>, <0>, <500000000>,
-						       <1039500000>;
+						       <0>, <0>, <500000000>;
 				#power-domain-cells = <1>;
 
 				lvds_bridge: bridge@5c {

-- 
2.56.0

