Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380C115EFA5
	for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 12:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720701257; cv=none; b=RWyrRtpsnmWED2/enW0xxEgcdjR9kR/coZ5KaRF7r9DvaLzIrGKwd7e0LvxeiqdFogNBGYFkNrkUG3DdPbmiiIx39EXer7q/hEUjIGv2fkBbNKX2ZJ/uLp0z8DcsmdipwvtoeqNXW3FJCtrpVJ5rvi8Mm5l49pVDZmAO4KoiVig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720701257; c=relaxed/simple;
	bh=Lnw6WVCoDGYqJbevISOZOc2dPUdG1/4V1rq5VXcFSC0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gizBtaY4QqzufdbgZCmbXi9jgphRmtJyDoK5VgD8WT3nyitI+7dEUCAW/p+bWC1hXIDU5IGLSgbB2xouFzk4K2OUTu+/Vblj4TVwcmItLbIZ/CHZVXQi32gAGgM5rHRvICkMgTEOugY6EkQZPEgMrtgE7cK1TNvXbfRC738ID/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=WYMHyBRd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="WYMHyBRd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42122ac2f38so5151205e9.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2024 05:34:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1720701254; x=1721306054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TMSDdjSHMMbfEYs+qwLdoVucqWbdqXw+KkemXAy9e8=;
        b=WYMHyBRdD+WcpJEKJhfjq24G/cxaxKn+6PbBsHZ/frENsbH+MQgqMgB3lmuEZvIv/T
         BiGUfJASyaz0NtJ2e4G5eajoltVHGceerqVAbkCc5/VliQKjTHXg3k0UXJLCTWKJUIC4
         QNNnyTQetHRc+3abPeVq2GFzR9Lz2OXdwWdYqmink4LFNYEYYV1D7HYWsxAGfMDfe0i+
         ZnBtHCN0ghD2FFijBXEHWfxgNwoXRweEPrLRL3CwqbwOBpuHGhfdHtnM7uTJzXm1YZbU
         aJZiTIMN9vEwlJzTUK4OYFpVynKMswCrvgoTuartJOk+sxHjvW4Kolv2yikrdnBgt+I3
         5TtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720701254; x=1721306054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TMSDdjSHMMbfEYs+qwLdoVucqWbdqXw+KkemXAy9e8=;
        b=K5oP4zGFFbRGfSv7Il/9VZ4I6cpQtch0AgiPj3X2VpfIi7oIZxaMy9cUODVf48hXnj
         TM8KtOgBCS38+G9huZLvE0pj5JBe8Py75dpkyw/P6pT62cKvE5bNAOa8AJZmBavZEAVE
         XZSKBD1HsQ37Pdm1zPTe66tMiaSvdiJZC7s0vMkdtwQ1TZ01vLHfphxFTXgJU9nwseV2
         b2noo6/RpCaizgYeywHlm8b8UjQnZEqtdB9nI1yHYYaKZYYj2f9IiPOKpfjzj26qJSK4
         5JwZj9QWR+PL24rItfPIqmPF02khxbfvV5PakQrEXHX8TdnAT68wWsO2WkZ3sZ3qeAK1
         e+LA==
X-Forwarded-Encrypted: i=1; AJvYcCXnlHTH8cEq2FKxJvZEaURJqAlvbcm1+TXgfR57V9TleiDLQ6YGHg7ZWw/mD1iA9oQAV4eE+6kP+zY/lwbbd60mgo/9zBabCPdb
X-Gm-Message-State: AOJu0YwZMJBKIXrGHf4mLv9NRvnL96yqFJYFD6seMriTVXSS06+esW++
	q8eRA4rJ0t3HmC/he3oexEq4X6uO6ZQ1BpRJmkVeRM/FNzYAHcy3ZYWr/y2EzvM=
X-Google-Smtp-Source: AGHT+IG3ie0L2yQcBYNCkX1wFuOkYRefHCR78VISFx6nmwufdVRAZ+HS8zHmnFUi0sv7+fPHPwtL+g==
X-Received: by 2002:a05:600c:3b93:b0:426:5b19:d2b3 with SMTP id 5b1f17b1804b1-427981e0751mr26099585e9.14.1720701254480;
        Thu, 11 Jul 2024 05:34:14 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f741fa6sm118583955e9.45.2024.07.11.05.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 05:34:14 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: r9a08g045: Add DMAC node
Date: Thu, 11 Jul 2024 15:34:05 +0300
Message-Id: <20240711123405.2966302-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add DMAC node.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
index 741c9226581f..b9114d1714c9 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
@@ -363,6 +363,44 @@ irqc: interrupt-controller@11050000 {
 			resets = <&cpg R9A08G045_IA55_RESETN>;
 		};
 
+		dmac: dma-controller@11820000 {
+			compatible = "renesas,r9a08g045-dmac",
+				     "renesas,rz-dmac";
+			reg = <0 0x11820000 0 0x10000>,
+			      <0 0x11830000 0 0x10000>;
+			interrupts = <GIC_SPI 111 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 112 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 114 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 115 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 116 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 117 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 118 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 119 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 121 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 123 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 124 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 125 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 126 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 127 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15";
+			clocks = <&cpg CPG_MOD R9A08G045_DMAC_ACLK>,
+				 <&cpg CPG_MOD R9A08G045_DMAC_PCLK>;
+			clock-names = "main", "register";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A08G045_DMAC_ARESETN>,
+				 <&cpg R9A08G045_DMAC_RST_ASYNC>;
+			reset-names = "arst", "rst_async";
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
 		sdhi0: mmc@11c00000  {
 			compatible = "renesas,sdhi-r9a08g045", "renesas,rzg2l-sdhi";
 			reg = <0x0 0x11c00000 0 0x10000>;
-- 
2.39.2

