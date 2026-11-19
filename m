Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795083213;
	b=UndikXnLYrL4Tl37p36Lv6EBY9Zt/09KAGhnlkJAShc/YGF90m2Sqz3BmygRzsJO5ty1
	 5Okf5vtSLJe9ubmxQofQIc8nfh8lmxPN+s2f+74Ndycskt4OsfXyrgNnhuU58Z1/T4NQq
	 kgF9PYqNUlQnjpyrAoseUvGdwiiBbReYJQfwz2HmuHsr1aKuE2WRf0xx704K6TIrUxDP/
	 c0k5PU0oXYAauyw4qcXpYbk9OTMWtMOUxzs0zRd8hm7jJ8pb654io+b29il2zXlA/GAfj
	 8+yYT7UumZTS0r2h8alxLXvTNeOZLmR+CrT1s2ZL5XtmCSXFEsXYC+3Y01r2FnahbNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083213;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=K8VijydsZS+ELt9hPJcUR0V1bzmS5w3x1rOheZ5SHrYov1tIHceLyRDuBtnEQrancP5v
	 cCwkVlLDUW2aJcB+XX3lz9GwW/6wuzbOx4gPlub29jZOVYxQ58P0S2qOCafcqsN1EwXkm
	 52bq38I7Y5Js0/OhT0wL9SZ1ZgDRh05xodTB/GPZ9Q1r82YTTiW553ijNNp1hDC2JMz4o
	 m4mG9VVKwoqhGNn7SrqdAaaP1ZlH6a2S5LOGlOuWTKqRSA+xL9Ie9zpIphL4WQ0K8pmMB
	 xp4DnHcXbanTczDo4s2dXVEV2ZVb81snunSH6vXsN94f13VzngNzelxRSMnL9DdWyUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+Clnyg5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC3B60A2608;
	Thu, 19 Nov 2026 10:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O+Clnyg5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795083213;
	b=syAUVodjAqYS6ly2L3l2kHhb5so2yAqK1Os/k2rGs45jGF2+heOsO4iZ9msCLe8MWtoA
	 UxG2FGaRH3lkOOXZp062KR+sGGqoQaVsQnDG1YE9gujRO0461c+ansmA5kpqgkKjKUjMO
	 CYafMjOz7uR98uris0e6Z2nbjg7XF4E9wr2tIL5VG90EN7kyqOyHijuAKf0UXUVeuYVNv
	 1RJiQC/w6qxswFWDyy/CmBSvItrZ9jr+JiLdFMDZdZOjeIHAsBuzao/8oMR/9MU2rTGGo
	 3uHGTk9dP/zfFAWEaNW8fEP/MYxZx+jUVVmSX8dFt+VI7qiLVFFiOzKDjbSD1/4komg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795083213;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	b=ETcsbrssLZsWQXJ7vWS/F5h8dh5ueI+0wN0+4PgI/AWNkSZonevGejDLyXVUSiR3LwZL
	 xR3FSqX3d50SEP4RGZdWsd+NiDc4463OUTcKV7NrbpmmFExnPOFTbHyXEsJAFjEAh6oO4
	 AaSmVGuMKPm2h6ZuwAfGWHOiz3YlA4hH6H5gRBr3HIPK/HRydbDrcNvCb9B2canIfGpiD
	 yXpprU0qswxFm3lLRdm7VMG2a2AtZfe625n0NefcN5u1zNh91wbl/HvPH693W8fDCsgBK
	 5E0FSe4mCGk4vBEtPeY5W+1YYBFU6Q3BZG0z1zZ53tyX+ZamCyTHyMslMywPwV8AZVA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 700931F000CC;
	Thu, 19 Nov 2026 10:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083213;
	bh=Na+yNwADVHtT0+06vQ945iPzbZLRjZ92Pxuevq6zNF8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=O+Clnyg5nVIcDjO+G7rudtguFcm3kcq0yW7bByGxke9FjI3V7v78VVubcMjUvlXdg
	 GBjrU9bHscKyW/Xdd1bpy03WoGXW6MXABfxKXUrp5FpdYy0WKMEReHoZdt3vkkaJof
	 p4C5dPhLrfsli4pax9OLv/geGrFKynGZJuRCgrtpKgZwKT+pgsUEFgFfWK+R7TTJMo
	 qP/G/6plSOS3Jyb/2UuiCGkC+guQZ+00Mczca/hnREudkop95VHezsHPUaFD8Bbzqv
	 ewSIG/Mbib/3eSo64CSsufB2wOsQHbludCy3wi5JI78eVrhFSxtydRLety+RIFkIn3
	 3wgMjaKr3z16g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6B95B4B240;
	Thu, 19 Nov 2026 10:13:31 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Thu, 19 Nov 2026 18:13:24 +0800
Subject: [PATCH v12 6/6] MAINTAINERS: add ARM/AMBARELLA SoC support
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
Message-Id: <20261119-cv75-soc-v12-6-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
In-Reply-To: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, soc@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 devicetree@vger.kernel.org, Long Zhao <longzhao@ambarella.com>, 
 Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795083209; l=1241;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=66/FpPmSuU75AtQewU8cj7mu+Qa/5qamx4Km8ySoeYo=;
 b=R3YlfECIITeopX7N2IEbgRSOL4CEONiWDW+hJvLza+ROw+U+svEleBw6kCXQ7YwdndIxTSZUH
 ezo04rCOAnkDybT3uTsR7gnqT7MtXT0tXu+jCyY89X+gjclnSVaBa/9
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Add a maintainer entry covering Ambarella CV75 bindings, DTS and
related drivers.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 MAINTAINERS | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 803b60ad628f..59e5b32d7a02 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2502,6 +2502,20 @@ F:	drivers/clocksource/asm9260_timer.c
 F:	drivers/rtc/rtc-asm9260.c
 F:	drivers/watchdog/asm9260_wdt.c
 
+ARM/AMBARELLA SOC SUPPORT
+M:	Long Zhao <longzhao@ambarella.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/arm/ambarella.yaml
+F:	Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
+F:	Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
+F:	arch/arm64/boot/dts/ambarella/
+F:	drivers/clk/ambarella/
+F:	drivers/pinctrl/pinctrl-ambarella*
+F:	include/dt-bindings/clock/ambarella,cv75-rct.h
+N:	ambarella
+
 ARM/AMD PENSANDO ARM64 ARCHITECTURE
 M:	Brad Larson <blarson@amd.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)

-- 
2.34.1


