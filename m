Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB9883A00
	for <linux-clk@vger.kernel.org>; Thu,  7 Mar 2024 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709820470; cv=none; b=UDPvagWQmKkKUF/93IP0S++2kl6Bo/JfwXW9QDD+AjUs4SptW6HMfKNbZA0J+h+RVnFEQcMTFuxLDwg6gTAiCbhLJWF/qNoi8WfL1/6jLNBm1IKCjz6Z3MNIK1sUSc+HUvXceyTnKCoB2vwWMgSZ+KtocTXEvyI0ApeN81+/zI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709820470; c=relaxed/simple;
	bh=o+isOLC/TWDf8QBrYF6fFqPfwMGPbt0wSxpYHU+dD5U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g45SQwswJ3IYC7Q6xUiNLhlHKSp6rHk3g2VN3k4SOf1jOE710oRI0CBOezcGmHvVjSxz4Pym+07GT+63aiZkiPJIoCNS7I4L+/8YL9x4XkekE/kU+KUmnoWqUdjAj/MGu/UKMfR94cLP3LnaSok27c6xuSqxsJ5z37NO1ETorLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=o4GPTDTa; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="o4GPTDTa"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d2509c66daso13154041fa.3
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2024 06:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1709820467; x=1710425267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfoIgw8Unv2o4Ref3vnexmJsmRhKE911tIs07l/4sdo=;
        b=o4GPTDTaF1bqNc+dkKdV3IclpqmgzvUNnQQrp/0abpnpmdkbAMl5UenRMEinSsdtkJ
         YwSsN+MShVCNJkNyPAdtzZaccCkFHFEE/0ag6SxctCg7BMtRVADw885S05nzepo9mN0U
         BNfYl8xzG+FqnmCUQCYEsIu60/mQSMf4P0Yu17Wq0akhb4p6ezcni3Jf0YvtMGLj3lY3
         XWVIjrlY7q9klJQg5VioDrBE/Ndil+fE29fmM+dI4/0tFMuEw5mXZUmscyiYFS0OBjHV
         H0vtQcL6FVE0XYIzqNFSzhZ3FlQxunmY05Wy1SmAVNi+yWZwduFiyzDcHqtEjpHZsddi
         IQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709820467; x=1710425267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MfoIgw8Unv2o4Ref3vnexmJsmRhKE911tIs07l/4sdo=;
        b=ilVYA9DHo8SEFfwHWJq0QVl1JXD4GVFYKD+Eoi+/BvXSFgVpkbtcZ3IEBszT0UzAbK
         mhKDjwNPv83pRlaaNAVXEQuV/tQK/bczSqu3jRowLy0PnNOiHCzv1RRXm1Io+pxnZnxF
         kog2SB7L475f0bqPHkCfJwborTvUvpDwP0oqRJh7Gc2w+m8jl4ewhoVmR9lnq9Jrktmj
         GzUaK0e31jtZyjPLZAqY69X5AC2+CCH5yu5wH+cFndTSqzxyHpsRc3H/uwcjq6iqKNqX
         +JMRR+wMOUqgbE8Dc9jaz3y342yIftbA/07nJakKo6JDVHLJn0TYnu8tpn6ZmhkZNos3
         SXaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqjJ40dWFnR9HWFmH9mP1qGx2DxoQwomoT98JR+jXI9qGcVnmux1q32ufSB8lbqQZwYXNDJTvWyJAGG3Z0+GwN+b5xYrXkeR2t
X-Gm-Message-State: AOJu0YxmHBjnnSEgtd5HaQ0duOwn7OenEMUYLbcZk6V0sBvnbaSWtnV8
	rQDUUHz4TBf9OQN0WSViuJMtxYl60I37LRQWkqnBIJ4sXDs17rRwdOvQB0j3fdM=
X-Google-Smtp-Source: AGHT+IFnmZHrky58RFBMdeu65Vl/I30y/4ADskPAIE5LOhPBlg6oJCaN2YulY/RMs1cYItpqq2bOeQ==
X-Received: by 2002:a05:6512:20c9:b0:513:ece:1fe1 with SMTP id u9-20020a05651220c900b005130ece1fe1mr1339326lfr.54.1709820466719;
        Thu, 07 Mar 2024 06:07:46 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.38])
        by smtp.gmail.com with ESMTPSA id v23-20020a1709067d9700b00a42ee62b634sm8200648ejo.106.2024.03.07.06.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 06:07:46 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 01/10] dt-bindings: clock: r9a07g043-cpg: Add power domain IDs
Date: Thu,  7 Mar 2024 16:07:19 +0200
Message-Id: <20240307140728.190184-2-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240307140728.190184-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/G2UL (R9A07G043) SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- added "RZ/G2UL Only" comments to some defines
- added RZ/Five specific defines

 include/dt-bindings/clock/r9a07g043-cpg.h | 52 +++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
index 77cde8effdc7..ba9ea276c4a0 100644
--- a/include/dt-bindings/clock/r9a07g043-cpg.h
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -200,5 +200,57 @@
 #define R9A07G043_AX45MP_CORE0_RESETN	78	/* RZ/Five Only */
 #define R9A07G043_IAX45_RESETN		79	/* RZ/Five Only */
 
+/* Power domain IDs. */
+#define R9A07G043_PD_ALWAYS_ON		0
+#define R9A07G043_PD_GIC		1	/* RZ/G2UL Only */
+#define R9A07G043_PD_IA55		2	/* RZ/G2UL Only */
+#define R9A07G043_PD_MHU		3	/* RZ/G2UL Only */
+#define R9A07G043_PD_CORESIGHT		4	/* RZ/G2UL Only */
+#define R9A07G043_PD_SYC		5	/* RZ/G2UL Only */
+#define R9A07G043_PD_DMAC		6
+#define R9A07G043_PD_GTM0		7
+#define R9A07G043_PD_GTM1		8
+#define R9A07G043_PD_GTM2		9
+#define R9A07G043_PD_MTU		10
+#define R9A07G043_PD_POE3		11
+#define R9A07G043_PD_WDT0		12
+#define R9A07G043_PD_SPI		13
+#define R9A07G043_PD_SDHI0		14
+#define R9A07G043_PD_SDHI1		15
+#define R9A07G043_PD_ISU		16	/* RZ/G2UL Only */
+#define R9A07G043_PD_CRU		17	/* RZ/G2UL Only */
+#define R9A07G043_PD_LCDC		18	/* RZ/G2UL Only */
+#define R9A07G043_PD_SSI0		19
+#define R9A07G043_PD_SSI1		20
+#define R9A07G043_PD_SSI2		21
+#define R9A07G043_PD_SSI3		22
+#define R9A07G043_PD_SRC		23
+#define R9A07G043_PD_USB0		24
+#define R9A07G043_PD_USB1		25
+#define R9A07G043_PD_USB_PHY		26
+#define R9A07G043_PD_ETHER0		27
+#define R9A07G043_PD_ETHER1		28
+#define R9A07G043_PD_I2C0		29
+#define R9A07G043_PD_I2C1		30
+#define R9A07G043_PD_I2C2		31
+#define R9A07G043_PD_I2C3		32
+#define R9A07G043_PD_SCIF0		33
+#define R9A07G043_PD_SCIF1		34
+#define R9A07G043_PD_SCIF2		35
+#define R9A07G043_PD_SCIF3		36
+#define R9A07G043_PD_SCIF4		37
+#define R9A07G043_PD_SCI0		38
+#define R9A07G043_PD_SCI1		39
+#define R9A07G043_PD_IRDA		40
+#define R9A07G043_PD_RSPI0		41
+#define R9A07G043_PD_RSPI1		42
+#define R9A07G043_PD_RSPI2		43
+#define R9A07G043_PD_CANFD		44
+#define R9A07G043_PD_ADC		45
+#define R9A07G043_PD_TSU		46
+#define R9A07G043_PD_PLIC		47	/* RZ/Five Only */
+#define R9A07G043_PD_IAX45		48	/* RZ/Five Only */
+#define R9A07G043_PD_NCEPLDM		49	/* RZ/Five Only */
+#define R9A07G043_PD_NCEPLMT		50	/* RZ/Five Only */
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.39.2

