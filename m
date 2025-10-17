Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8D134DCD0
	for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 11:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700124; cv=none; b=GI8LVZMPIdsiOPcIsLhlZt+iKBox7kpzCXLqbuCrLJKwkWLRjL5W17RBYoX/58mzAdIlgGzSBybYfgfY+cnf0Cdx9AQxsBBqGMl7qfA+yaQD/3I2qyXAZcKIk7sh3lsTUQNn2zgBHXmvAMj2FdUA+nCKMYRBNQ1r4wYyWf5QpYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700124; c=relaxed/simple;
	bh=y613Fibuye7rvTibD+68qb4oNwl+ydXU9k6h+6Dna6A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xz3DAS+fd3ER5yOohTE8wRb9u2YM906iXh0CPjsY5ziWAOePTUkxusP4xVGpJusZz4KP+3OJ4EYgs7QmlxTEzBMKjyMMqJF84qW8L4MaWQ3FHDT5IExqvKaXnu8PICPRmS3ZXckqTPZAzaZ+MMs4enjQPFlXTbC/5j2e50Z4wyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=niyy5DtK; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="niyy5DtK"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3c2db014easo398813166b.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Oct 2025 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700121; x=1761304921; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=niyy5DtK/jIqiA/dpFcGD8XGY2TG1/EBgwRWvMgT44+eZ5c40GsYOxjZWgK9xMx3oJ
         Ub8ppWIKnhpL6mFxaHI7eVX8M+d7R9ThA3MaeUDMqPecxRXxCYqLewPINElPIZgufd4J
         CxgiDjEBtHdlyczcz2/x+y10CmJmL+jiQFjudfTN64G1bJvHofnY5h4eZEPzRJhHQEPs
         qwy4GzPp+9srKAdaOVD9o9ZAREt/yd7xn7kkDN5vjWKYb+yl8olWCqsDQRShre42SEEo
         T+Pr/HabeP5C3YDNcyXxK8O8zBm8NGZNRB6EIJpdgDmERmtVOJ36eQCIFUSB1cBdtTOM
         1umg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700121; x=1761304921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=07Toi2vUIU+MWGlot8kMIQ1ee07JBmL9YfZNkL4sfI0=;
        b=TBGtSz22N3diEIIja1hr39aGyL68OjjCurwyv6MNIVFfNJjfX+lpFKkCGLYJdAxBYH
         APEoHLLyCxagzc2smWfkZ3fnV5yj3iRaNZvdT2aMlC8clYuluvBL2MHDXfGSbRNt3USP
         37H9QFyPbNa+5PHp0W7ogbgYQdqSMe4XAIkx2EtqpJMSuwGHoFRrxq3Izf3yYCB1jqcC
         3eRS7uf1oeNWq/K1qVYZ0i1mx/8diN2Xsigwa1wtC5U7aS+rViOce5vAHZfck2e7vMqW
         2lQIHbKXu2OWgP/ctpdJyV6UxVMihziQVTy/d8NVz+kvbw3kqL6ZxwuFhTdZeZjr9eRT
         mwpQ==
X-Gm-Message-State: AOJu0Yzmj1xvrSzIPEYJdV52+ybLcUTUAjbJn/7PmLS8lk6EZjzJacup
	JHW5mLudJrymkP4W31iNhu5UmqbWzHrWdtzLJIeti9FU0+8g1GKorM+8
X-Gm-Gg: ASbGncvzWPom2EUCzgLBOCuEAjVLB+0K4u41W4aKc9vUtpvVjTojcIaqz6Z3AKcgCgh
	tVHL6pgZ+cCswU4CsJGN6wS/1MQdQLXQk04bIbHxtde0HzE+7DKkAwGsuE6PJ2VQfRd2yMCvEBu
	oc6sBSd1iwJ/dA2P5WmJw6lveY5NBr9JPASIK8cd6uADFygHpzEdKfz4yxdzgOebHJv+/V6PHcf
	7qDWDvB2wY5wwXn0vxxWGxCoPfwRzfRxuEylJ6zWPKsd+Brlp0IbYsutslolItHJbIN7V+tYI+3
	cFYBo17VSYHbVNyoTP7Gs3WcTJVNr4lYUd3/NoChI01Qsc3VWFL8gSqhx8UZTJTM2dcmJEd5/QJ
	AalVf91CHtwpF9GGYygiUxgzidApOXxPZwvI/NV+YvblytRlRpeKcRWzWRauFq8dYQ6JblNUYb2
	MXIp9kdrjqjFSpA6qpq0x+uIMyRoGZdyXEJVHdyA==
X-Google-Smtp-Source: AGHT+IFm4WIQFISVomrAFV51FZBLIpyrii3K7EFFJhRI3QtwYUrQCPmRYno3c3emRFDyrsQdPdKFXw==
X-Received: by 2002:a17:907:7ea3:b0:b41:873d:e220 with SMTP id a640c23a62f3a-b6474f18597mr313933066b.50.1760700121004;
        Fri, 17 Oct 2025 04:22:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:22:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v2 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Fri, 17 Oct 2025 04:20:25 -0700
Message-ID: <20251017112025.11997-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..676535c3fc84 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -776,6 +776,23 @@ edma2: dma-controller@2d800000 {
 						"ch28", "ch29", "ch30", "ch31";
 			};
 
+			sim_lpav: clock-controller@2da50000 {
+				compatible = "fsl,imx8ulp-sim-lpav";
+				reg = <0x2da50000 0x10000>;
+				clocks = <&cgc2 IMX8ULP_CLK_LPAV_BUS_DIV>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVCORE>,
+					 <&cgc2 IMX8ULP_CLK_HIFI_DIVPLAT>;
+				clock-names = "lpav_bus", "hifi_core", "hifi_plat";
+				#clock-cells = <1>;
+				#reset-cells = <1>;
+
+				sim_lpav_mux: mux-controller {
+					compatible = "reg-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.43.0

