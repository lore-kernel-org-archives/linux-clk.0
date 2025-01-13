Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65B323A112
	for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 14:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780260; cv=none; b=XtFi8vfLUbXzK0ecO3WchEoe3A32rrx4BqEimFuo51qLInadB1XP54Vosv+BMKRo8k5MjtpFocacJ+dhvnSa/NDuD61A8Xbolrt25pzqv0sEV7hDCFj9pvLM5JLs/2JZQdYrEUItcHf25zYKnohI2m5DULhwf2p8beGiQGuQ3yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780260; c=relaxed/simple;
	bh=5wKv3990qTqArMWxDC8JoNsA96O0HLgsLUAOsCHU91I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SODFr9+oxRcvIseDk9a5yBt29aSiCrYIle4cxmqUg99XKFiepNi5ecfwednpZUWWW4IXOL8M1k7TyWWdG9WSrGVVbgekry6xDBrhYuMD2M49smqwK+i7u/n1HFgRbG3v9d96ZR+U7FsQEcilFcJsLgWfXhACVvXYgeyc1+O+PYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CkmuRw2X; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CkmuRw2X"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3d143376dso6300626a12.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Jan 2025 06:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736780253; x=1737385053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=CkmuRw2XzMLlZwjZ9zGu9CZpuML8FdnKHajbeX1llmFmbJbKUZ8TVsEVJrMK4nZImb
         yRIX1015ZGzAHhL0ZN2tHpEapGmJ6hsVXnoKLPuuwh1GNIJHMCRqRK0Rme3S/zJK4+5G
         Hm9hbkRrMd3NDPvbPb7VJl+XUOexrJKyXDWr9nl2jXesVMb18BOqoUWlw08B53yFryji
         86McpYfc+x5/7+GkuJT0oGOnIaX+sy/xp7z3lR2POj7a4WukFOAaJ4kqJz1ESX9hNUnr
         r6ld/DRXMLknQyT1a5qpKc8STXo/Nmf/eOE1yyZmUA9kuFwACOYC0Ltj/2viGjLx0OU5
         ZWkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736780253; x=1737385053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P/DXYP0gmkoHCujxUnsFn55701rZVWVknkTyMB7ADmU=;
        b=j9gg4MFRK6wur57TcnACQRV5YEMc9QdBb0ReWSm+qy0AjLU7ZJ1a8+VHUnIECNMyKw
         DQKbXaVmsZ6sGl6eXDRIMPE/JWnHIBagZsTRaT6ow3SS1TtkryrHlCWJ3GAhW7eaJ8Iy
         fJBX0O8xoMtcFzJz9xqrZ3MmGQ+I6Xm4pjkcEmt5cgJJy6hrVp/JXMrDUJ+06Ui0WtCI
         nNp+uMJPHM5dy3+TWqF/io0AlXQqayQfxbAcMvfp9vSbvi5t2PfcGNusrBIDangwWNti
         MEoka31KAvP9gz+bU7YYaaUmFPuYBxKWlsnW4HN8YSUGUmc9zVZ730UTFliSs09MgfMN
         WjrA==
X-Forwarded-Encrypted: i=1; AJvYcCVIE11BghIxlryOQHYJNDl+d4DFwmCeOWUqNcQMaQsmHv/k28qSdASOipXMAVyp/LjjoFmGYj4kRb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu0iq8bIw0+4NPQc0teWqjkgOW02n3PioAf0I8O4I7NbDFJa+y
	FMOaL1VCCONTiNOkmO53e9CCzAPCXjwS7fCNpNFNrgJv/RzaCZEamwPOQ+54ew8=
X-Gm-Gg: ASbGnctMrlPVMlYw3DiJ9sVVPCTxnhyw5hsbZejI7hI9+rz9riD896csHp6mXrYiY6R
	EHllyMiTtxjyXO6ZkGpd7pJ5xTiv+RkUByQD8uGInaRD9C/J8aTZTKmbxbRKB9ABwPL+F+fHRYV
	5/VczfumkIBBKnWM43H12oIs8GFWS0/vCQ1+V9huK98TxJ6s8zXPnGRG6AAVgvRBzQYnXHy71uw
	huJCFznAwoqjG1o2foSyDzWqQaUFjxkRoxhOjAtxOrJWw3kUnDE2YjCORhNDTHsAT92PPk88qBB
	tUCootXWWqtoa198QxeZP5IMliQ=
X-Google-Smtp-Source: AGHT+IFIxrNKB7bGJmJiodj5rOVrMgbeQ6c2Dm+g2BvJJIffbh6/B3xYKNDCOnj1PjUeZNJ5q9pnWw==
X-Received: by 2002:a05:6402:40d5:b0:5d9:f21e:ff5 with SMTP id 4fb4d7f45d1cf-5d9f21e18a0mr256894a12.16.1736780252625;
        Mon, 13 Jan 2025 06:57:32 -0800 (PST)
Received: from localhost (host-87-14-236-197.retail.telecomitalia.it. [87.14.236.197])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d99046a07bsm5052479a12.65.2025.01.13.06.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 06:57:32 -0800 (PST)
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
Subject: [PATCH v6 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Mon, 13 Jan 2025 15:58:08 +0100
Message-ID: <bb69c32871d162a06dfdd26ba958ea0a74b592d5.1736776658.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1736776658.git.andrea.porta@suse.com>
References: <cover.1736776658.git.andrea.porta@suse.com>
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

