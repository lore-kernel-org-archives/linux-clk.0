Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82221CA1C
	for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 21:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421106; cv=none; b=NECcejCuUs9f7zyJzwNUEMnBzfXoApvnTU82+68R1B+N/dQpsD5MbO2Z5JicilnaXerx9vtyB6ybmXacJXrMblc6eN8x8E7KeJhWhZH/e2h/RMpsahg15mY4H49nTMkbKxiFwsZ5yTlI8y/HbjcZ/PnqCL30tjMRyT2g2GM6+uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421106; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qr6KHaRcDaB72iXrBXDJyb8ZBdrpemlGbeXIaN/YTkCtjAezunzuSiUuq0OK1u4ZHYvlDFS/es0JDvsw40j2jMGwfq0cfZAwWgJ7yF3BUNf+90xLiJw19Uarw7aK4mHKP1/xMILPHLraNnbUbgXBJocrY6AaxsNqk6nDtT9KSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BCBLDxTS; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BCBLDxTS"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac29fd22163so28924166b.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421098; x=1743025898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=BCBLDxTSCQT4MxWH2kbXJnfyq6M7A65z9TGlIyVlrP8ebPzdIzyFe8K8N/p8gWMTOE
         sXDt0mdr0+wB3B6u4ZR4NAUPVF94C5D/7UNGstLrZfA4YEZVQ4cPxciITIZdUqTRju6r
         iIRrzAhT0zE5BPt7PVVIpPiobTuwn4ho+ybGoBeEJ5ghO05+5VoxDxRxYHsKlJ6FTBJg
         S8LtDc4SoATPzBxYCn9N0/vOqdPx0KKkmjeqF9Iv7H1BTM6LgOx4zTzpOrntnQqYseKg
         1ETxAPB/5yEYo+Z6uXwS2QvMmmzgAvd7940+BO8Twu3ajlC/A/bA3CHvH9R4/fSFjlk+
         SGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421098; x=1743025898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=OmRj16jJtqoDT1aN4Nta3h9VbHubBI6sVTGz2zZ6q1XA/zwFvnPARaeOqoXCdqqB12
         mpQl/jibvOyLh9uAcRfHd+ARvMJ17yOmE2nOBAkXjWi9eJ/kc103hEZfa99m8394u7mg
         B+QwpefxTYCfHI7ifBjHsXwkFJyqHfEbmO61tywJkKck9C6L23ryDpYucVDzhng3ZJvq
         JBnqmNil5BLBwynr9VURZ139CvclCTsZpa/O0kaa6ATCuS0EV9UCUZnAVuYGQfnQYNXK
         SKjqercc65zqgtRKw5Xq1aVkMaVblFhWrQU2qEsJ3oVD6nZpqs2a8/7YYGJxs103iQ5C
         j9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZI0Fi84phZcvKrhJUsW5faLmwIIROmKzsWnMkhKl9qLoxwfHgHk81Kas6pERYkvPJEHTLN2Rjm5I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1zaAydD2PQKc3wF2xdtD3CAuSXR0i0bPcwy2UalYNhfu/dGmU
	pS8RKKFIi7XwRYUzzSbsEvr4xudOC5Kl7zrZC5Urf6IKfQwPYkQOBPB8VcUDwXU=
X-Gm-Gg: ASbGncsf83Cqa980zASZa8suN2ZDc6rOecVhIz/PMfwYv/xiErlSi7UyslJovxNerwW
	KZSWyZrKk7kG6wQLHipbVpwuebNgiYvS3RSS1MAt4CLpYmNRRbUWIrfL4FMQwqU/02ZPbszxDYx
	6ZjNy09EOIJnqf3yIPEu4QgSjoob7hRXZwaugFM6H18OWoc2No92vgSJQGG9YRPcwbcqJ3T5AwJ
	8NiG8I//cZgsPA7VP7xgRISv6anlPTphtts+YxOzpe2abhf1r9xp1RpI6VwXVga5dKHbJyzbw1O
	Q1IRttbAjct9s8HZ7HvGOxPywQoPPm7xV6ZqG/w32RR75Qn0TmcCjFzyJ+o5dQKrZCbjV7YACeW
	r3EysPc9DXQ==
X-Google-Smtp-Source: AGHT+IHsXCV0Z4XO+FTHe2MtBSqBnvYKMJqwPN2z2yjiElWrSE6yFE9vrDz/hzrfrSjNw1oWh2GCjg==
X-Received: by 2002:a17:907:86a1:b0:ab7:bac4:b321 with SMTP id a640c23a62f3a-ac3ce064603mr127290766b.29.1742421097635;
        Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aecbasm1051077266b.37.2025.03.19.14.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:37 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 11/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Wed, 19 Mar 2025 22:52:32 +0100
Message-ID: <7c26a0b52e00a39930ba02f7552abdd1be4c828c.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..1850a575e708 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -16,6 +16,13 @@ chosen: chosen {
 		stdout-path = "serial10:115200n8";
 	};
 
+	clk_rp1_xosc: clock-50000000 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-output-names = "rp1-xosc";
+		clock-frequency = <50000000>;
+	};
+
 	/* Will be filled by the bootloader */
 	memory@0 {
 		device_type = "memory";
-- 
2.35.3

