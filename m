Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF69A19884C
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 17:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724693483; cv=none; b=CVRsZ+GoiEhUNtsBCVXOb5ZxoBIJKnN5nmx3JzuBtTDl7fjt7IRZNqSB/PmSHNjl39/XU7ViAHKn4kGD0dXEmW9BYC9CvUuPSiswUmWwfcddNfVGOAJ3N0lIlldwbfv6Ndhs4zVs2wjpzR7IezYPzdzJnVMrtmltJt8CnOhibDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724693483; c=relaxed/simple;
	bh=6EPFMstT17CvrhQmN+sTCcfEDbYVO1ZcIZ5xV/q7u8E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZarFcUMHZ+AAmI8a/kgNSW03Ve0A95pGlZLeVac1e8hCFDJ4MxpbAeunFjF6/f/+nnXTFTnJKIpo0AqE8o2JbdfLz3ZE2VEOezEBOX8DositEae5X5Dd4UmuAwMTTLk/jBRkzkm7gm/YSLCJbXQ+v1pBT+73DrbRlvwU6VBGkRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=msJAr3GR; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="msJAr3GR"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86a0b5513aso355972266b.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 10:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724693480; x=1725298280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sdCwGFBcrT49Pisvj9J9Vzn1hnXxwd5sYiWDmNdzZNY=;
        b=msJAr3GRGYUMaWcgdjt5pyn+MMulnA1u8Zx1aFI0cjigMc6jppHun9oIeB1M72FxA3
         7Vqm3xz3AV0lQNqvW+AyyTxgrV6waJF4/Vc1VLD7+mgrRDsagHfesh3hINNMVBFmQE11
         gdYEPUbqcCDXsuQ/3a0hSJVxhZeHOT2N0a3RI6kuP43CV8AHS7oUkPeg7lb7wlhqk+3i
         MpYGJ8ppUD2VJQWRrZC6C1yDee6LcsQupAI1u6cGAqk7CPRKUdVdaReyttXqFL3USSmH
         iOxo8Cz+XDGzPunbyE1yIHdHssCn1BlJ3xyqnJnHHcAfaR8FXxqdYJ8bXYnpx15JwGja
         We+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724693480; x=1725298280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sdCwGFBcrT49Pisvj9J9Vzn1hnXxwd5sYiWDmNdzZNY=;
        b=v+lHFACBQ0XzHBMJGHmlfHAeltNxovjPZ6PpdfcAvKjg0IH+yfSgu5P2ci2NCPPH6r
         8aMjfGgdLz7dm5ILikrC5H+vUd56eVi5vK91LsOakv0vkftQZ0w/1zYcjv5qEud8sAQL
         96bRMQxlEngcF4j9ao5Y9kHFBUedk3psnlCLxfb2n4QmgIL/M0PSbqIUJ4eTdKCi77km
         Y24X2LW+FJPuEMeGjzdmPZRnQl1t3QQqMF+zfMrr/RYMXPs8xcfUiebx0+GQHk/YHU+I
         AtKHus3TGrXD1x2xFLWHTxfvAsHm/HneFp2N+pxxEWXpf2EsRWlBIZA0Qal0A1SpHMGe
         +Iew==
X-Forwarded-Encrypted: i=1; AJvYcCWw6peA+u8OGX6rKTI6p6SqM9UbVQGTBApR69lNK4sV9vd+donfeALL4FA+KPVe10B80ib4OxCctXc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8YbliDiPRHoPyOKvJqgLIfgBrVHHYQ29onb1jpnTgrHr928he
	jU7ugpUaweI9lx7A9E1Bo5A3kZJH8wlx098rY3EJWhdr9e7nfvLegaav4hJlB1o=
X-Google-Smtp-Source: AGHT+IERD9TGRmX/KhvrCUArHMw9rId0+3mqlQ6S+/Jy+Jl7phDihtOezbZJke0mH4gTsLm+tymTWw==
X-Received: by 2002:a17:907:1c0a:b0:a86:a90f:3025 with SMTP id a640c23a62f3a-a86a90f3de8mr781015166b.59.1724693480118;
        Mon, 26 Aug 2024 10:31:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e548781csm446566b.28.2024.08.26.10.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 10:31:19 -0700 (PDT)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: [PATCH 0/3] clk: at91: sckc: Add macros for the slow clock
Date: Mon, 26 Aug 2024 20:31:13 +0300
Message-Id: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Previously raw numbers were used for the clocks generated by the slow
clock controller. This generated confusion and wrong IDs were used on
device tree. To make it simpler and less error-prone series add IDs.

Thank you,
Claudiu Beznea

Claudiu Beznea (3):
  dt-bindings: clk: at91: Add clock IDs for the slow clock controller
  clk: at91: sckc: Use SCKC_{TD, MD}_SLCK IDs for clk32k clocks
  ARM: dts: microchip: Use SCKC_{TD, MD}_SLCK IDs for clk32k clocks

 arch/arm/boot/dts/microchip/sam9x60.dtsi | 18 +++++++++---------
 arch/arm/boot/dts/microchip/sama7g5.dtsi | 16 ++++++++--------
 drivers/clk/at91/sckc.c                  | 24 +++++++++++++-----------
 include/dt-bindings/clock/at91.h         |  4 ++++
 4 files changed, 34 insertions(+), 28 deletions(-)

-- 
2.39.2

