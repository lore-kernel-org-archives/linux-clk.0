Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578D122D783
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526571; cv=none; b=LT1TD+zpSkXxhbZqNUchWokrfi9rXIhITdwtJomwIfcJ4dsQGqYMQ+eHryZMQXyk7MHimmY8BDTxMd9MmPyg6UWiY3GOXNG8BlRfnyJ1is1w3hGBwBm15nicJao3PC6k6py2KSuZof47Z1eR4La85bHX7Y5q14cRrvgtWOU/b/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526571; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=efqCeubUlvxhuYE+R7CtazwjJKKJR51Qqwtp1sDTYToAv5QWtrW3wGaXOK8MB5wFFuX49hO0tmlgzNy/l7E3EmPMxyD+xD9H/3CG3/0/6SNNnzviMNCcydCc3ICjKY1K3Xqq/4mROjBBc7mWhlUBtuirYoApb3fABuFypCE+kiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HATLB0e6; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HATLB0e6"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ad574992fcaso161420766b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526565; x=1749131365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=HATLB0e6dVjhkr7Z8px3MKY1ov9tb4ftfukTCoh9i2lksHUn6WyqesEt/4Fov7CRvZ
         MkA6P5VO5/4RPTZc7kgaA81aWRoR2NMogJgH5HHxq2MVCbxzGPfhHGSQdyIgH4x/HZQy
         NAPBKY/h7wZPJMywNfWBfo4CLuVi+lsvRmFXOMkSupLaj6rh7CiuADjLdzZu/XXNd95l
         xdao2BdhRP7NmsRk03rlK34bsI4b3Ums/D0l3Y72+TiqUEEtJC+D32vUPoB5O2665xCy
         UwmRmGxr2XrT2PC9uhVRYxGmQTTsuVwDOVXRIwnz07lDvONk8mWCNA+SjNdDnhLB/F2E
         tSbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526565; x=1749131365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=rjcl8cR4lskKhkQC5vyNge+ww2Vs3FPO75XduvBbKrr/xuC8ViPZPifMmA+aKmyAB2
         +l/nHUg0z3YQIhGVI3rxw5pcN5UsUjA0fIVJKYsGy6sUIa8NQGHYqb+nZ6w6jO45EsHb
         2vvHOFsevUhvDEpFln3RsJ8WTyjWu9LBnkRkRnip+TKkCDaD1j8dBShuwuezfP3hWLog
         ZMvu+K4mSnSg5Qvsn8WHYJIeY2h/goKdFQ3K5rC9XdHzlwD+3Lc1fk6otRiFSGjzMdtg
         7TEmqmt8DGw0MyBizWC4oa68VU2HQj7EOOw+svrvgtU+drh8zA3lLd1GHBdSIG8j61nb
         C8kg==
X-Forwarded-Encrypted: i=1; AJvYcCX7Eu09lH98rwWJg+nHuLEG516oQOkd2EHFIrLanyL/Rg+ikLigU4zBEqcrfKgAcAGOsQz4F7UmN5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRHzFaDTLvOsfO0/q8yT+GFCHM5nOkUxN9xg1YlMOy1ZSdXARU
	yoGLbiuDgNal1vogbcFINRddNjTKhfU7s0vuvuoo8qhVGzvy/QiDaYGggLjun6gfKq0=
X-Gm-Gg: ASbGncu+OuM23OdnAqeTCRUMRMJYB2dFGcT8Im1RDRDLpzyvI55Npc6TOKdps9GQE5X
	SWb1KTYse8Eqy4vXZTqz/pWYGis5XUKE33geGTH20/9OYWvVEGAUoK+Ig4FaB0rzcUh43mWB4BQ
	jYv3xKs1/gk01N51CVc64kx0ahqL0ONaFO6LIV9l7e6NX0x22LgpfFiLXJFeIJ3vOYE+kFfZZz3
	XasO2bIrEhqgCPsGp7/TMj/isrS/JKItRX7z2LBlJwcPKo553/Sr5Ab9En3BdXfwEkbzZIJa8nA
	8+gQ0TI6dgrihGdh/VjsJx1KTszJjXDaupbHxavcNBAzliwdwxDAW8Yh+MHs2lyA5vt9CtLuxQE
	RYBR+KF8EnR1LSBh3N0rkeg==
X-Google-Smtp-Source: AGHT+IFaYnKDP4OR65WeNJFXd2Qcwxypx676SRlwxR+m7cKcv9QtiqthZ5su11rGaYFNLwt9bEtnuA==
X-Received: by 2002:a17:907:971a:b0:ad8:9b5d:2c2b with SMTP id a640c23a62f3a-ad89b5d2e71mr801614666b.25.1748526565369;
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2fb63cdasm4600266b.120.2025.05.29.06.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:25 -0700 (PDT)
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
Subject: [PATCH v12 08/13] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 15:50:45 +0200
Message-ID: <20250529135052.28398-8-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748526284.git.andrea.porta@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
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

