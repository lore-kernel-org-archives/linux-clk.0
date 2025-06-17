Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F2E2E3AEF
	for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165740; cv=none; b=sfb4lu6+094u9laaOQonwi/4iigE76GW7fZxuVqaPCw3ckneE2hALiD4vX+kynf2sv9gX4WxyX39MGiRGZjmgqqRpb13/lLh3yUp11grntBywSzzvnM5lDR3Px8SWcKUj45jJcMlXnjYbJek5K531mhEQfpMtdNmeUM40cn8JQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165740; c=relaxed/simple;
	bh=HqA16LR6HAWvdlEy3wx9eZOBIMB7ZcD4My374Vzpq4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=iZ6KzN6ugjCPKTKfFxjX7woPbt21E9AEE8kwEVj/K10EObWELQ+/oeU+49RyxAf2WUkaQCDsHSf7edeCLeJNIrBSQ96CNY+6b7q/cKFKSHGbwOxql1b7XdKSth16i1itGlb9mYKm+Glm8ap7R4F6vVmPiklxuWczawCstOYVy7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fxxssrhM; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fxxssrhM"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-adf34d5e698so783774866b.1
        for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 06:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750165736; x=1750770536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=fxxssrhMMMtloRbte8jFYgwZwRz0x9WPzcBCEeJJ3z9GSI5aNGJqiXao5fduiv9PYg
         jC/uw1LuR7xpPkJ9ZEz7H/ADFjwVHmOmsC+ptrRK17NEKpHjaNizduKxlgaUJNouXRmO
         E4MO1d4RoHbJgc/ZYNmiWjOJ/W65qLswLJqMdMVk8vNimZCaA7QcLDTPQoXf/XQdjQB0
         VvZ9j/Q8xVkV6ivNtdP7eBgc8QXhoBOWHElphbhAb8emde9eifCgH4cVFoJ20X1fmdi5
         AMtLR9R7uVhiCqk+QsMcrGoX5FonzVoAnXelBg2HZ4fgy7nDZvHHmkgevErR1dXEcJzr
         ItGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750165736; x=1750770536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=sJLD3/jjKYizDOw3yUOiD/bwXHgLFprpqruP0eSJq7MnULDzhWaQETkEVTrAy7pZeX
         rKeGfNw+gFRfFVKkncuaGW19fMnbYRHpRipk3xVU2ydznWfl5bSLFLMhOO0F1W36F35x
         DbNnQZTsb0lgTjLzCOeYBs/b02LUF84TjhJARQXx1y985884Iib7cZzjKaePt10op3ze
         qbWVACBOjYVHhQoJ+3a9pVovTfKUjWe8uHGCRfNnpqhexN/awH6vcqrAqQ+Zp3+Kpegq
         UgOh3pe0ghwAF1GR++HF5D9H55RTLSweQ6xj/xkCuwf1mFTwDhXFsXuGZcvlYr2S1c/I
         jQAA==
X-Forwarded-Encrypted: i=1; AJvYcCWf9Hs2Z6mevJl2RWfx06WGPJiMaw5kdszLQS6fNiFpB8r88VmpbIkmLk9zL26WoS6NzvJGVr1FrUo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBK5YOj2aHLCr7aAhSDg/CAcj5GInjy6PrOKLXxstDHCAUHvWB
	SXGlfHt1USiA/7JMbFn7SqTNxuNV/wmhCZrbplk9z5uivW48F45HFZ/rQc/+vMN89iA=
X-Gm-Gg: ASbGnctReHL7F+xbgp6LCjtCQyJ5TnfU5b1ctqGhWDDGOGrMauK0LmTYJEpbbJxhlyg
	bcv7KHtdzXe8byvLKCGxd3O452aCWNgSQy+Dq4Anej/AKrs6JVjddkUZWsb55J0dT7k0tudD4Rh
	7La6X/lf2oQ0xym+R8QB2WhHMA2hpZJECWjklfHLBeQLutlGN38+j1G4GpdjYffSZ+ZEgviBeoF
	CsfjGl/NP8Hjd4A3KHnyE/MAl4k+vHan16SYQ/hb8KHnhCi5CcKT1eh2rZGN8jwZiQc569dEHOw
	Qx0gj5raWE/eLsFvGoBcdcLFJKjF+dz7J/RrqpuhYaJm6trhdCKI+tOIoUOZLDojrA7iUEDQc1x
	FITnvtQcbHGLJhiHkb2iJL//TMs9aczK4
X-Google-Smtp-Source: AGHT+IHZb/sVwRJgA/UO9fRUeHQ7VVUZbqfIWG3k9c+U7l75XFG3Nw9yzuD9XOU45EDledJ7H6W3zg==
X-Received: by 2002:a17:906:c143:b0:ad5:2d5d:2069 with SMTP id a640c23a62f3a-adf9c458189mr1334205766b.13.1750165736215;
        Tue, 17 Jun 2025 06:08:56 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81be674sm873602666b.53.2025.06.17.06.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 06:08:55 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof Wilczynski <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Derek Kiernan <derek.kiernan@amd.com>,
	Dragan Cvetic <dragan.cvetic@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Saravana Kannan <saravanak@google.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Phil Elwell <phil@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Tue, 17 Jun 2025 15:10:26 +0200
Message-ID: <b8a54f41f6393e3b3cae6dee561fcd040e3e5fd0.1750165398.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare the positional index for the RP1 MIPI clocks.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
index 248efb895f35..7915fb8197bf 100644
--- a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -58,4 +58,8 @@
 #define RP1_PLL_VIDEO_PRI_PH		43
 #define RP1_PLL_AUDIO_TERN		44
 
+/* MIPI clocks managed by the DSI driver */
+#define RP1_CLK_MIPI0_DSI_BYTECLOCK	45
+#define RP1_CLK_MIPI1_DSI_BYTECLOCK	46
+
 #endif
-- 
2.35.3

