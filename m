Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE69452ED31;
	Tue, 29 Sep 2026 14:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693162; cv=none; b=R3leZ/WZ/zGFhUpqcHOfColzgqRUuWLFF3n2JXS5ct4bgoMWyMFfP0roSQnS4RiBiYhzGeMJ56Ab1tTtTfeadx+jU54PUu2/aVpDVpE5lqbt4kKiJZwUVsLuJTtZPrfEG7CL52/8Tjft+Y1e4kEpepYZyO2iVjtl6GZa0tlD48U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693162; c=relaxed/simple;
	bh=PFd3CtyCCKQ33SeUSIu7xisYWzMCe9hoGSLIIsvT/eI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AQzxcqmgP7iySvvcWfZgPCGZ5ZtO3jFXBgNEa7ArjBv4nROMPCeDZrarHyH2D3V3b4T/7xHc8jNTwZk5EgGrjYcPQIU7OdGLScZm+1r/8gMjTMLnLqrJmgZyNqMrgJjUKi5J+ajhJfrS5Bx8T5n50lHfHRuOLmSQDh4G8T9qt9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ysFMK36c; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ysFMK36c"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 15C5D1A1067;
	Tue, 29 Sep 2026 14:45:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DDEC1601BD;
	Tue, 29 Sep 2026 14:45:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B544F1032976C;
	Tue, 29 Sep 2026 16:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790693141; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WeEQPBVGY+VcDDpf0IXeyoSfMlwDkJaa3weRCykKMWs=;
	b=ysFMK36cYyETRwxEEke0ihj8vgiPYUoo5OyPUo8TMAQhGLdxNSHFGicXhJT/Jo4KxybUuS
	y/KzNBXhbn2oQrLYA4Gp4e7cV9s4eoYIk6GhhSoyGf2lO2RdaeLbWfkUuVdLVFYqigxlPJ
	/mbrhcDj/e3jIT5EoDYK7PqG3SY2U6iXof1V9lbsIUQGE61x7hJYAYeWtaFprxL1mYpSz8
	3WG9Ffa7Kklkz2Mj1PXO+8AQJAJblHM5RZbFIL9s62WRtQU9ysa+gaztMZm4hSg0CBEM71
	Ihhk6IBCVR/DG1sDAEd4StphpJahWcnECGd1ouXk1OMV4GIzYXN4rZXjQWlNtA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, 29 Sep 2026 16:44:47 +0200
Subject: [PATCH v5 4/9] dt-bindings: clock: ma35d1: Add missing WDT/WWDT
 parent clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-perso-ma35d1-upstream-clk-v5-4-68533e935ee4@bootlin.com>
References: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
In-Reply-To: <20260929-perso-ma35d1-upstream-clk-v5-0-68533e935ee4@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chi-Fang Li <cfli0@nuvoton.com>, 
 Arnd Bergmann <arnd@arndb.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 openbmc@lists.ozlabs.org, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

The WDT and WWDT muxes have PCLK3/4096 and PCLK4/4096 among their
possible parents, but these fixed factor clocks are currently not
defined, even though they are needed to properly describe the clock
tree. Add them to the bindings.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 include/dt-bindings/clock/nuvoton,ma35d1-clk.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
index 2d6a44a7e55c..764d837d6162 100644
--- a/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
+++ b/include/dt-bindings/clock/nuvoton,ma35d1-clk.h
@@ -248,5 +248,7 @@
 #define ADC_GATE	233
 #define EADC_DIV	234
 #define EADC_GATE	235
+#define PCLK3_DIV4096	236
+#define PCLK4_DIV4096	237
 
 #endif /* __DT_BINDINGS_CLOCK_NUVOTON_MA35D1_CLK_H */

-- 
2.55.0

