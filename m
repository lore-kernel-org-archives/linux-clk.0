Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50F22A4C2
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522564; cv=none; b=b23+kYvEacNz7pF0Vpuphmm6Dkd9m8dCqP4RaA1aaKC/a26y/g6jHOZybEo7N7wVMVDByxoSG/hJ/PtwDMZ2iypsmgcJElv4nh4pUG74yYZkOxSEf98HNoyfqZyLtM7Ib8Nk1fVOPCnCwJa+LmmKqkG7kWhJLwp2KdE/ovvpMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522564; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjeufiI+jhvWqEPn3ggsOehOdH5y4rcnbYcb6iPUg2WtH5uwFE3RkMtSFZp2xb/0oHeRtj2r9Q/oS0WAkgt+ZNSIf8gkl2ilgFcY+rpFRRFNCRWOAW4an/vv0Tj3Z9V/9619H8Cs/eRXOZ0oQIT0EzBgPc32ipe8pK88DjCF3Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IXoLPF06; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IXoLPF06"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-604e299b5b6so3794820a12.0
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 05:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522560; x=1749127360; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=IXoLPF06Wtm1mnRmNiZ2E7CTph3qpAYt7GTealiijdfLvygXpdrTf3j3tDZSy4ncJV
         ZPmWXCGat8spdaQNQIaGo28iw6s3YuryGuJVrtdxX9mlaso24PPiXVWjCourLn91X157
         FuAe/c7HV2CAkB/AxNNYyGDl7TUJspRTw34oWtXaceEW5EJfqrj8l6STbcq0mQHH8cub
         BY3H4G84Y8wtnO1qXZdhfeXkp7TCFjUrQtH/LircMTpoI610A4GGz1y9tu5kRzg3y76l
         vX9A/AL87HwNk7R1vmdH1A2NMmwi1t2B00u2N66qGsLOI8cjn0x+ztXknwyLOEuU0EET
         99bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522560; x=1749127360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=H67sp6j4gxE5/lAqjpBlx6OMNSwjAgigiEE8RuIEyyIX2mmSl7/pqeHf47VeTxQprb
         KAx/uclapa+OUSHWM49xk4xy0bwuiYQ8Yy+1i5qM1Xid6KffqnFAak6WqkgNsZ3csDnu
         GArulxw5Rm4kVXoWJ6wMW9Iw+oXAN73PyyEOLEesKj0jx6pIlhGuB/mD85vQSVgRSTox
         SQ2ZXfu6eKrMu1qckVfUDM31CpY5NqJ1T1xtxifJYAX0eFzQmMHP+Em79UfbjqR/robO
         vBJCqZFMkMZKb29IImFw20y/aDFyGQogMLwnhKh4f3iaG4bjg5qCOk3JCs/wH+m4YTZ5
         URGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkq5qvfsNq2tS2/D7erFZkRI87AiZGiHBbK+wSMuUxt0KyiwkR2Hbtk8d34vl0UYCBVv00XbdQN2c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3oC/J9ZQ5/7nxvd4jA06atOL8hd03AbPKQk/0KmRAieu9+kgA
	wPE8joF9iYe6sAPRZeoaYD2Pp48uCTkHrdPHJxDu2j7DwcKIB1va/psLapdq2igcZwA=
X-Gm-Gg: ASbGncsj5574Kj8DuiYEIb2LaRx3C8LdtGgdoUcXwd+L3YuYGkT8gg5Y6a+GSP032Py
	ii1Obx7qt8TqjJ4e58peSprx9AufDRxCXhsCXQKWxQwKs28O0kjZrt8weau7OL4whZeelSi12ax
	9g8GD/1WPYh0l5O2cH+kMXQJNVb/2G/GxI65gHBzixzh7FCiW6xormXLIkt4qh+FiyOr2Hc08OO
	/Sw6Et0wosXh744iTDFmvqEoIDGP07vgpscwG7MkPfO8hJqu00f1Pi02Gz+Nxp++IEifNjcInQT
	K6WI2ohF1FV/Y4PcqhKqPDXoSOAq/PNB4FP6zSWrTfX0dX+UKnxdHNChu6+RN0bxbEiSAZYKNAE
	7SdjhFsSft4ToCsnPRf4Y++vsJ1kLULuZ
X-Google-Smtp-Source: AGHT+IGmBWL+ssQiDerV1S1/XxydSfAjqd0NvxPIChK+RKZPzFhr3ejbEm+LE6gwooRX73fUz2rmnA==
X-Received: by 2002:a17:907:3d88:b0:ad2:27b1:7214 with SMTP id a640c23a62f3a-ad8b0e63c34mr325370166b.17.1748522559741;
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fecebsm138373466b.1.2025.05.29.05.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:39 -0700 (PDT)
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
Subject: [PATCH v11 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 14:43:57 +0200
Message-ID: <20250529124412.26311-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748522349.git.andrea.porta@suse.com>
References: <cover.1748522349.git.andrea.porta@suse.com>
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

