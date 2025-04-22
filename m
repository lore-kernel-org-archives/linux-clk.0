Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D65029B220
	for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 18:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745347940; cv=none; b=c+DE+Xm9vbDluWJ7JtYVCkDx79/VdVdNYwzyL07GyXEzrGxuKN/DEpn64Ib7pehn91gmcdXA0KiwbbD20mTvlWs7fDmO84bPe/GiBwTm758sqisJd4+E/LPlrhL0mLN/GPHVwanZ2xHuyadMbDWcyvayuuc5CbPs/zW+8CaJzCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745347940; c=relaxed/simple;
	bh=tljGp2ZGKwz5xKjRNtfJTi8eXf68cWZGNi4Xd9Pss8U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qFqqzZPrV3/VYn9e5r212+DSYSCJqCAb09C001uAffUCxSmc4jX+IzoynNSR6PkISRD6EWFzGCCKBlGGzvHz/gDFepMucoE4d4JE0YnRfvI8uqKtCbGwaIyodB6po5kWqr5G570lnLJkJyruT+ABlg9gaeLH82tXKWjpwwHBOpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eSgnqTod; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eSgnqTod"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39ee5ac4321so5950584f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Apr 2025 11:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745347935; x=1745952735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=eSgnqTodInpfl9trHXd+Ua1Dbb35Sgi71tHW0zp6JsG8x1omRxZOCc/yRljPKBMQdj
         rZODUSU42Ip7InsMn9V7swpgWOYCnbcgWtqyfKynXlBWecB0CLfayfvvuefyaxs5wS79
         WbsO6R5AIoDKYhXf76uYm4vPhMtfoSEqeoSZUegzQ4IgKG2V4UVpP89BLjylb4yiZ/Rn
         KIgSVweyKEqqlZOJb+7mBZtPSnhTGqMkZwiICHvdv4Zl2H7Z/KBr/B4cU9aee4EGB2xe
         fQc69KAtBA/emofCZPCvPZXqZ1jW8T0Y2d2+MCuq59SQiCGwZzbNp90VBko5w7MazvDz
         Wuvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745347935; x=1745952735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yYOOl2kWPUOmT3lYpRPa0NBvw7HXmwvyakqo8gvrf7U=;
        b=MAHe1x7Tk1R++CStPf63yIGcNBEy/AWyEg1yqqeZtVx9MP+dQ3Azfm2WdJgyAqF+zo
         eZUujiDrAjKUMBn7wgpUupeCxdC9z3DNGQbxQDM1q5KElo0+KosW6OOI38xeuYdryXD2
         O/Z3n1S4BLVWBSTcFKAuY8LJRFv96QYJHTHEZXWXvT1/zEDJX279IcCQIKOZgJ6y61Vd
         hKequIRrtYCgwIgY3u/736Znphe3VXmsiEaWPmonGk/3uwmKntzFeYKWeMgmbq5oZCZR
         AbE13KTcVmfSA9yqGMXmMCqKiCSMK9Up3PUPe5NCh6rRgbsmHKIKLR8Q6EtoWKd1owYH
         9KJw==
X-Forwarded-Encrypted: i=1; AJvYcCVHykJdV0VSWkzzBf0yKRr+rNq+ynBmIvRynBQrO31dgV9r1odkBXoBdhBCp0HxUhS3Gzf9oj2N1ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpIdjP6Wt6dTyIMFZsN01FDARZGzKSk2C/k6IxXv9oG245aovz
	SrOIxAxnZHR184oeLSRSGeJ5slSzfOinQEpkupem6trcQuhlqi1pPxb6tIhKsDo=
X-Gm-Gg: ASbGncu+XRVs7MI3dSdAk7/7e92pbVzubt3fLWE+WaDNnWfoNrGieCVJg/NyV/6dgq7
	hn1m7ALXp/AfN7p7VemYeA0XsTTdyeaxLtBwStZ1ctmGusIyGR+BLIES+dvhcUPWkDqnkequGt9
	saiuGY+6LCTpud/kX7vnbmfz9RE1E9t8zkVMlQAnnjq3gusacRZaFS3S7C2JRVUS+j1UrYic/Ya
	pU6+4XO3jgNlbynNXV8DkiMlPY0uPwArOkSC44fn7hGI0ewxdxZrkG3rVDX5FJjceNn4zPannP7
	tuqCaDy7ohZOh0z1dLR/+7mYtl23SjDkISPmA8jd6ehcfdJ6nHcLr3siHtM9E5uP9SO9IGY=
X-Google-Smtp-Source: AGHT+IFJkUzhohlFWFD4tnJxylRaHX8kyBRjPpJLd4zTyh/XarWYhUWFDm8KDecIRtmuP1EH+CI8eA==
X-Received: by 2002:a05:6000:2509:b0:39e:e75b:5cd with SMTP id ffacd0b85a97d-39efba2c98emr14139193f8f.3.1745347934622;
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
Received: from localhost (93-44-188-26.ip98.fastwebnet.it. [93.44.188.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39f069df9fcsm10861464f8f.16.2025.04.22.11.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 11:52:14 -0700 (PDT)
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
Subject: [PATCH v9 -next 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Tue, 22 Apr 2025 20:53:20 +0200
Message-ID: <928679d1511a43b8dda150009eb023b4eaaff5a2.1745347417.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1745347417.git.andrea.porta@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e..53748ea4a5cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -622,6 +622,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -704,6 +705,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1301,6 +1303,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

