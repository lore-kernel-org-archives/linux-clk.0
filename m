Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84ADD1FE44B
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 11:19:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138360; cv=none; b=ep98+PnvWKRv/5r4uHRFmufp9DrFjy6qwyCHTeObuy/q22tZ9wLkt+X6pGR9dHbdBAhpEzH4LuuIgHzfj7RnfhdYfGBhjVOisozAa9Jd2UUZ+Vy1/w/V1ogdy2A3lEuVO7yPV3wowt3RhcYKNXoyjKwQB27MUOYcFWKvTxtTzW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138360; c=relaxed/simple;
	bh=5wKv3990qTqArMWxDC8JoNsA96O0HLgsLUAOsCHU91I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQHKfXR+zFui5QHnf/AbXTmHrHqxcKSCY8nUE0CakXBYIPv2hbqSY/JJPYRiv/9Yzgan9h5XcldlyP00XSHcVm9rSpzdrLT3BnIGEPNT09ViBI/I3FfokXKthiSl/qQnlNzeDKFUGohsAX1Ch3morvC2sct4w38jhWQvJfJKoJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NCFyGBHm; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NCFyGBHm"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aaddeso5232217a12.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 03:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138354; x=1733743154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=NCFyGBHmPbQC4JUKeBrMhZOaLAN/tRkmQEf4rq9AA0EF05KaaLWXSJA5PNxHJGfzMZ
         oM7omQU6QTQ4yBVY+t3BXoO6Xeb2/HyTV6tIFBwuPX7LyZdjYBfTBMMgTcYffpBmLW1Y
         bdsKZm+f5kmiqZx9zR2ws2rnoDDRQlsut4UD54zNmnYrN4ZnYIxwUyuvEg4/ph4L1kyp
         LFFGo6LdYu2ihJFSYeGLmprgVyIlBOcQPVbaPsRdS9dMAmltZ32VGjLPVg9+e4pnUFFK
         XEv0jGt4Ou99JJWeJfp1a4F47uP6FuHwXzqD+gkEDtEciLESka60XQ46nhpuADsFqjDC
         df8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138354; x=1733743154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=StjA0nfVXZuKV4c1lAt0Le7M0Vo2pVYC5/+aYP4VPFLumE4EOmvPGlE51eY4DvEq6k
         7qx1dvY1lQ12ePfhHTgZ3+n7dDh56HYfmIIZu+J3A4R32tVrEF+37lv1yX0JHob8Jphl
         RKLVsQljhCPFqPMQvDyauUUIied3cMetZkI4dtVkZiBRE5LUASUiVZbxlIrf6RQf+E9A
         QCbndGxVbqFOZ5dv7HEgubLbf9fWSZjGqBtHkJv4sTeQPHl1JK7QbW14qXcv2GmyvAco
         SDIrFJJ/UFsOkd30Ll2PNj+LO2kf44ZAq0QQHlAv1VBYkaQTnINPtrQwSQ6axMKIxXV5
         mXHg==
X-Forwarded-Encrypted: i=1; AJvYcCUHpZg4SEJKp526mTOCDgbmr3uwctJV9wk7KrLZHLByCODcytZsNlIEJqkMiA1kL5LMol0su3MCvaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Tq3PTbIcv56uAuaj0fpfuKvsFXCogUH72nEUM2YcdSzhv2Ef
	iLhcHKPhpl/U4wM78QRzUsF8FgpgZCmxakeNvaCduvoliqE+dbhDKTnfZv0TgCw=
X-Gm-Gg: ASbGncsZyDERi52TDAFZAvVBl98w55MZBfHEuXGvuPClYrMK0OtpGIKmhK21xhiulxf
	0gwLmkBv9ooGGOWF3eiQHDyGmtQKcwfI2GIqZxkXhBHLOz4R+t9YaAkV/huIrzIUqYlBTy7wJ2X
	alAFk5nMTDHs/q/T/Vyf25aLmfCdaY2XyanOO0Y08PRpnMD7VcfuzWAVIgDeaQRh2T5gw4WvAKJ
	EOIA15d8TxCZ/32QS+hkYJNaDfPbFxmAqFHB6DcvT6jwBwWEk+SfB62unORy83OoW4r2ytMdgwR
	TXgfuctfLr06Wr17mZ9s
X-Google-Smtp-Source: AGHT+IHeFnhQVvvNV6Unz5SbIu5RmIoxGk3I5zBFBtPc8jG8aJ1mwarpKQV7x9LB7y94ybUWdyYebQ==
X-Received: by 2002:a05:6402:5206:b0:5d0:f088:c675 with SMTP id 4fb4d7f45d1cf-5d0f088cc59mr2379116a12.21.1733138353742;
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0e1b6903esm1763679a12.19.2024.12.02.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:13 -0800 (PST)
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
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Stefan Wahren <wahrenst@gmx.net>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v5 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon,  2 Dec 2024 12:19:33 +0100
Message-ID: <8b4dda91fae156a7f28f2807cd6d64ac2ec07dd7.1733136811.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1733136811.git.andrea.porta@suse.com>
References: <cover.1733136811.git.andrea.porta@suse.com>
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
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2bdbb6780242..ae3c0c153cea 100644
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

