Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2F528EA66
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 10:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515692; cv=none; b=cBK+pqBQtG28NjPapi+f6lBabDDNqR2vBq/hXdQCAOKUPZaGlR5+/I26F+sCNO91m4EzwzqhUNOqOtvB/EZVK7JejKDClXEZSzjHhusmp2AQOZ/oWhXGFQGRkOI+FlMsmwIIzV7VdP0HxmCla4GeIFjanbX5rAo4VJpIxdLIBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515692; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hYM0+deNQct75RSPwzPVkOwSAwpSJTI+jBaQJX8YlfOhbRwfPxG3IcTnMinq5gWt+fdBFL6GKonyf5k+XA5sVSXGYG/PMUn1Vd0nDSCbIt0byq73fkloZS+zEyUHktbejYDT4d79WiSgH6RBCzDU4zZhg+xzZerXrUKcGMQMrwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Fkp+QuPB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Fkp+QuPB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fff52493e0so1114807a12.3
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 03:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515688; x=1749120488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=Fkp+QuPBK4GWbFuu1Pahspby51rSD3uS3W2X9cQDg0Gswch/zFWPnDuud1D/6c0rMv
         w5GvAV1w7xnI4hVE2+T9m5VYCDOllLd22UNy79x2GK2dZT9xL7gz4nQ6vLikQ4/tNu0q
         XImdT06OeC/4yGTHiFJPRPRNI0wwQesgtZgIsvc0C5hKlyY1LXuDOQTwOWTOxvCP+0S6
         MrUdQUjJRzPu6ueQ/JwnsecxSoQ4vQr7rHBBD4OJekeAv1087h6a3zj5z5Qz1dSmg2An
         wZWfGOpiijO+Nz+HQT84sbJ2JSt7lyPkyBiArbdoXcjDvdRR69tAGSsp1ibiTY1KnQEx
         8nVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515688; x=1749120488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=huqDnBv3yAJZkau2XRHSlu1j5S1B6DzTbK8lckofqHuaaMl2LfK5ITV6OLmmncmmHA
         LEOYK+s499AOxlREikOg0PIKRJrcLi0ea6unGyiV/NdApr1L66oPq18NhQmbdBVWfOhM
         3wjzlYM9EWn+PilU3vOVMx0KjhgAL131ENw95xOt2ODbMXeuFFK2Vnt17OBaDkX7tEwT
         bI0J5WKg4Le+xR15bGUussbEmf9xz1l6seLfhp+6tBXfxFuxTYabbOz/Crh8deQqQ0n6
         3eMSQzfDi7EsVghaLDtcJ2chgCP9zrhufiWp25MP7gI8acOqgTwNGYnytgJQ/7KpmOSw
         4erw==
X-Forwarded-Encrypted: i=1; AJvYcCWTALhu3O5JvV3A6WRg9tKxRcG5LWGI2Ck25zFKQNMQCr86rqOITkPWN3bkV4ytuicS1aJHta5dew4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9CAJjwzQVqK1PT5HVtnfw5+mOmu6GRosmGJUQz2La22PftkeO
	EMHBzuKQvlp2wcFVCRhTXa3IzBS8mPImuAxkJuXWbE5q4AVBGXNbEigSCsAE1RVSex4=
X-Gm-Gg: ASbGncurUWPUBYGa14by7HEwgARBISLir+WXSJQlqV8JVf7InlulmfBCrb7Vm9nNw2E
	N2/EoxNa0EpSgPoAjI6WN35kXZC7SYXAZYs/yy0v0qWtKiACUZId3l5gTk+1smCfB3SHh9xTSBx
	aeneXDJ6s3xuDPQaksqBvnFiZlW1QYWORYJiRcS+6jTf22HC70o4WRodlJcm53f/mBMT6Vhn10a
	exQ5f+fLm6Qp3EnUMkP1AkMWJPd7oaFARSOTJmRwP52y1cRxEMOG7erXamPwAsk0k+uryGhK1pg
	69NVZRvAw3H6C2qs8wF04n80BiSTRTc7R2KrGjXBg0UQ6+bDlW+F5zyvDlUlBVtIDMsahi/X6px
	Z8CJqdoRIhImem5Q2HYkJWw==
X-Google-Smtp-Source: AGHT+IEUoRzh2zTeQG5yMgxNNzsY26nnUhyjPcEFO1UqoG+878XF9t9s26ZMRJo1VML2M8CmoU+PSA==
X-Received: by 2002:a05:6402:254a:b0:5fb:f31a:df83 with SMTP id 4fb4d7f45d1cf-60545ee95a8mr1317809a12.3.1748515688256;
        Thu, 29 May 2025 03:48:08 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d5f22c6sm2175505a12.18.2025.05.29.03.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:07 -0700 (PDT)
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
Subject: [PATCH v10 08/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Thu, 29 May 2025 12:49:25 +0200
Message-ID: <20250529104940.23053-3-andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1748514765.git.andrea.porta@suse.com>
References: <cover.1748514765.git.andrea.porta@suse.com>
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

