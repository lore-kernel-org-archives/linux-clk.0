Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955F62F619C
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 12:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257857; cv=none; b=nEx7kfJF6MNMsQeWMDpo4oNDjGiFtlyZhcd9Q7xto7FZrgHoZTVlikC6qGwnNO//eLffGPTzyuq5II8k5LQHEglWKwlUmfkXztlLKbxM60wsw4aJDZbCA/tfSRLxSusDCWgvhKPtfLTdDkBGIdWVkyw/lf9v5ZYNF8YSGsVBgfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257857; c=relaxed/simple;
	bh=v9PIaHoOGqn87lRlESH/AuFgCy5K1+8Bo9hGHBVSeHs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OdLpYNehc/6fygWFnrO5mG9RxL/Esa3duLYnCUW89sKm5lDaFHJ0wiRTokjxp5A32Z2OBTcXwYU+Ry07yJ5CtHRPN7wdWEAe/G6O6veIsUJHp0jAbJzeauS+GuLp1kh3X2i97yGE0K966oETAuzktGHNZmeXetJcaWpFs9VL1gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l9VbWWH+; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l9VbWWH+"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b4aed12cea3so977820866b.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 04:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257854; x=1762862654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=l9VbWWH+WWl/zAn/ZQ2nCs+THHbJlBUkZ+oz8GiM0AkTgtNMk1Qi7bprLFhnpkN2fi
         9g5ByrfbwmACZi2dciDAIbHYdyrQCjqeperr6Pvzphfns2Q3E3kcWucR1pcaWrkS8SkA
         H3gSM1JOShq4rmKmOKnfq0EOe+yH81r5gSHt25O/wd/5EQnFKza3bTNLOXMdby1+5CJO
         Nwc8gH/FunX0a2fryHbqddbHaNLiEqom9JMKOwq/NCClJbRz8ln4DzsxhHf/Ff6P6olN
         4JQ1X8ZsSIXqRRQnS7/LwL7aE9MFtV6j6S1of+I/MiyQACX/nV52sFmHSFRT+7sNshCQ
         1hIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257854; x=1762862654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHtOrvUe+VoHbx7eNPs1dlQDZqVpXM8AHRrOkF3QMQM=;
        b=g7dF+G87yUupde04pVO0bQfLqOCThfj6TmT5uH/SOBldgz8A8KvTxG0jyTFBqyI1Tu
         Y8qchWgy4cfizgkz0eFV7ldOupxlohXwE3++8SXRch9vYBmPL58wkaURcJvgEskc8w9n
         1JhlzDWrtTTxNtR7vd+dauqai+o9rdtbEGLSz7Pm4tQH4Aj+fWrt4y4zTSIEMxksj+cu
         402D9FH3LFtXoJREwPigHjZb8JkG8/dq55an96wUMvCZW9WrG6XSMdsY7UkrcsKrmU9i
         eQaiGS3tsQNoUXpjv9Cs0u6/wLuQdOCaN+3zfi/NH11iqShrb3javfr2qCDyAm3l5nGN
         1pvg==
X-Gm-Message-State: AOJu0YzI+pLXYqx4eileRIFWRCHIRs3tt9M3TMpBCyPKoUgfDYwE2Jqx
	U+tkK97PQ0G529ZUi15aDIbFbzqJ3hWeh2bCamAKyEsvpzHNHtGDgdOD
X-Gm-Gg: ASbGncuI+CcI8Z3tkVo7scOk0dSpORMGV/gj/8MsGMGHFpRToC5kadBmCzxsITnUuXv
	rlD05NL/kRmDB50eJ/Qb/cTXCPXtRAqXr2X9SqirIsrg5JE/qHX1cGj66BNoR/ZQluOh9ASMxT3
	D1cHKFy+A0blqI7IF3OjJvbqM8sj21c5QQ4Z4aq/OxZ3duesxNvgUuXEkFNTlOMo+nbV0xUpHgw
	cUX7V1SF5f2EoOMSV4OrkynIluzhki8Ck/ziu089c2dgTmmdoQwxGDyD4K6d/Qu41gv4et14axG
	cvI4u1NOwCTmUT0z18UimccGEvxvOnO9b8SbtcARQdPso9Laz+1g99TBZzmt9RVIM83GGTXXfV4
	B/V4ONnN6hU8Dgsp1XMNhhru+gOMnvDHL0lASIoZMYGRf4k+Nstikzu+Z7vRURAn6NlBr5CSdeX
	8c5jBS/WUeWB3Bk9KfINFXOBc7yA==
X-Google-Smtp-Source: AGHT+IGGkO48Aav2aGVAeolzrPvhX0A2pS6by5Y49cTXFSpgxjQYcLbUpUeQ6msVNN8zrd86kzhCLg==
X-Received: by 2002:a17:906:a24f:b0:b6d:6c8f:6af6 with SMTP id a640c23a62f3a-b7070139726mr1396558966b.16.1762257853806;
        Tue, 04 Nov 2025 04:04:13 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:04:12 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 8/8] arm64: dts: imx8ulp: add sim lpav node
Date: Tue,  4 Nov 2025 04:03:01 -0800
Message-ID: <20251104120301.913-9-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add DT node for the SIM LPAV module.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index 13b01f3aa2a4..9b5d98766512 100644
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
+				clock-names = "bus", "core", "plat";
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

