Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3FD146A8F
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 10:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713783248; cv=none; b=Yn1g2BSuwLD8gMfB8xQVf+V8KGAGx67RNnQ73veHENz4OA5gRNi959JHK56PfLzCOsjc2bD+iHMvMAQw8RDS9LWPa+w0c6Kg9sSeOTZKznQht8BU+EFvE+j5dnDDMaTjBeb+GQGsWKIe2+qV4HyMTAD6Y/ZQ9Lh2b18SxYxzvp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713783248; c=relaxed/simple;
	bh=DAURA/SctP3A5mGX8sS9JbsxOWN2+gRI7JV51DX+W2g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iFQztWRg3xaY0VsSn0MFPtnEAO/z25ZswL+iVPY6eWV+6ckXiKopRAWDn1VAWmfNVMGwV7X7Od+BOUuc6csiFgeJE+b3NpoIIvrBmNLt5VAbfwo23Z1WqXhQbLrvJgNqjpdPHADOmSeg5vlD42mL4tnOu+XgRzjPiaZsZAM/oYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=PiCsSLE6; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="PiCsSLE6"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-34388753650so2094591f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 03:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1713783245; x=1714388045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtPB6ctP7od8zgdwyqg5bLwGVgQvxXp2ISVh1oG7rJs=;
        b=PiCsSLE6ERJ6uUPCKaqo2i3bd8ho/Qd3PJGqRkMU28FM9uLuE3NaTuCYz0DUKc7Ifr
         30r/r/VROkZIERpjSF4P2wtURQxhaAlOMGIVZ6Iamn2CGICvyxaJAHl4xyEN/nsA/C7G
         QmgZzkAWAxUK9XlE3dYinQqaAHLro9dHBo2/+o80snczC+1c360DINIeB3mPgGxZA6Th
         BLfIXdixJNvpKVE7jVsQHTR4qWcWzIVtJHtUJHcnxIV+C94X1mUUgBR6Jq6IwDQB6oLH
         KH1RTy7+u7P5mQLTYLx5OoHX7TrlzBH3Rq9u+F+cFR7rieqqlE+DE+KNUy6V7zsXbnfG
         EkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713783245; x=1714388045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YtPB6ctP7od8zgdwyqg5bLwGVgQvxXp2ISVh1oG7rJs=;
        b=erkr3ql0EDqsW2inQUD8HYHDt1mLeEWli58Vztlj6oPNtkeFqqo0FbIyifPEtEHyjv
         sdcPuXThHj6M5EsKWd7scZ/JpcNoHRem3y3pF+zCHqNoFNcwmmOQGpdsZQMgH7u8AiTY
         525EEX3rbja48JkqxlqXG6t5S4/fr1UuGl7kgdHuPvHOgLPHKkQ2LjZFj89Jatx0CUoI
         novOT/lVOSgnEh8ypq9V+frLUmcniQkT3SlKCVHYnLHZ8d/LubIQwC1uuH/XB24AbmHy
         2B/iZuMUjMvA0zZrD3r5jNTx3FsLFQDg6cGEInPo0JSq7CNV5JI6IyolnB2S10Hw6TzR
         WuDw==
X-Forwarded-Encrypted: i=1; AJvYcCXN2Tf3GUhAY5qDDsoVkgjexJswDmOx+QX3N0BtvOZvH+BFhF7Q1E95kzzAaQNRb9niPvvfkc83dreybwArK5/YARII78olwGlk
X-Gm-Message-State: AOJu0YzX1XDX/FHDVP6sprL7r3Y7ICiaSCtqz3S5pE6J4ojPOqrHaeqd
	fu0WvezkS/lbSbtY0oZRnIIqovMvCHjoGUH/eJYkTWsX9bqgyOhLuXL0cTPPx2M=
X-Google-Smtp-Source: AGHT+IFLCJwMoJjU6D0NWaWvNE1gp038ynHMSy1TehAKgDSlKi/ffr0hQ2I4cGne8RszfNJgK/2ZdA==
X-Received: by 2002:adf:ed84:0:b0:34a:e6bb:bd9e with SMTP id c4-20020adfed84000000b0034ae6bbbd9emr3145768wro.46.1713783244989;
        Mon, 22 Apr 2024 03:54:04 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.53])
        by smtp.gmail.com with ESMTPSA id v13-20020a05600c444d00b0041a3f700ccesm4321037wmn.40.2024.04.22.03.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:54:04 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	ulf.hansson@linaro.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v4 3/8] dt-bindings: clock: r9a07g054-cpg: Add power domain IDs
Date: Mon, 22 Apr 2024 13:53:50 +0300
Message-Id: <20240422105355.1622177-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240422105355.1622177-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Add power domain IDs for RZ/V2L (R9A07G054) SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v4:
- none

Changes in v3:
- collected tags

Changes in v2:
- collected tag

 include/dt-bindings/clock/r9a07g054-cpg.h | 58 +++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/dt-bindings/clock/r9a07g054-cpg.h b/include/dt-bindings/clock/r9a07g054-cpg.h
index 43f4dbda872c..2c99f89397c4 100644
--- a/include/dt-bindings/clock/r9a07g054-cpg.h
+++ b/include/dt-bindings/clock/r9a07g054-cpg.h
@@ -226,4 +226,62 @@
 #define R9A07G054_TSU_PRESETN		83
 #define R9A07G054_STPAI_ARESETN		84
 
+/* Power domain IDs. */
+#define R9A07G054_PD_ALWAYS_ON		0
+#define R9A07G054_PD_GIC		1
+#define R9A07G054_PD_IA55		2
+#define R9A07G054_PD_MHU		3
+#define R9A07G054_PD_CORESIGHT		4
+#define R9A07G054_PD_SYC		5
+#define R9A07G054_PD_DMAC		6
+#define R9A07G054_PD_GTM0		7
+#define R9A07G054_PD_GTM1		8
+#define R9A07G054_PD_GTM2		9
+#define R9A07G054_PD_MTU		10
+#define R9A07G054_PD_POE3		11
+#define R9A07G054_PD_GPT		12
+#define R9A07G054_PD_POEGA		13
+#define R9A07G054_PD_POEGB		14
+#define R9A07G054_PD_POEGC		15
+#define R9A07G054_PD_POEGD		16
+#define R9A07G054_PD_WDT0		17
+#define R9A07G054_PD_WDT1		18
+#define R9A07G054_PD_SPI		19
+#define R9A07G054_PD_SDHI0		20
+#define R9A07G054_PD_SDHI1		21
+#define R9A07G054_PD_3DGE		22
+#define R9A07G054_PD_ISU		23
+#define R9A07G054_PD_VCPL4		24
+#define R9A07G054_PD_CRU		25
+#define R9A07G054_PD_MIPI_DSI		26
+#define R9A07G054_PD_LCDC		27
+#define R9A07G054_PD_SSI0		28
+#define R9A07G054_PD_SSI1		29
+#define R9A07G054_PD_SSI2		30
+#define R9A07G054_PD_SSI3		31
+#define R9A07G054_PD_SRC		32
+#define R9A07G054_PD_USB0		33
+#define R9A07G054_PD_USB1		34
+#define R9A07G054_PD_USB_PHY		35
+#define R9A07G054_PD_ETHER0		36
+#define R9A07G054_PD_ETHER1		37
+#define R9A07G054_PD_I2C0		38
+#define R9A07G054_PD_I2C1		39
+#define R9A07G054_PD_I2C2		40
+#define R9A07G054_PD_I2C3		41
+#define R9A07G054_PD_SCIF0		42
+#define R9A07G054_PD_SCIF1		43
+#define R9A07G054_PD_SCIF2		44
+#define R9A07G054_PD_SCIF3		45
+#define R9A07G054_PD_SCIF4		46
+#define R9A07G054_PD_SCI0		47
+#define R9A07G054_PD_SCI1		48
+#define R9A07G054_PD_IRDA		49
+#define R9A07G054_PD_RSPI0		50
+#define R9A07G054_PD_RSPI1		51
+#define R9A07G054_PD_RSPI2		52
+#define R9A07G054_PD_CANFD		53
+#define R9A07G054_PD_ADC		54
+#define R9A07G054_PD_TSU		55
+
 #endif /* __DT_BINDINGS_CLOCK_R9A07G054_CPG_H__ */
-- 
2.39.2

