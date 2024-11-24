Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4FEF191F85
	for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 10:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732445498; cv=none; b=Uilevaer67byCemL97J7Ob3dNOMim8Pes0KqBZJotcyluLN/efn6A9rOE32ppobwg6BFkYIYlDeqGpXQf6EzyT04OSYuTZS0ubMrJoOgERUD6MtKI3ImML+9hMb15GjPt2rKKc87RZ8xfkyMfoQEFwAwwxVaQcX66YGDlyu7JYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732445498; c=relaxed/simple;
	bh=t5mH22vOPTQPTUILy+w//FEAgDrx/+HJYbcUWeq1WtE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZFNJ71ZhTQHYtIpG5UlC28RRZfj+agvSYQ9STA6FNm5kzq64acjrYMP24xjQM/bya6eNuVhOLQAX467yEGDNfWYv0OB1uf8bJreXbNYXTAWX5guZaW/dztxN/Q70ieRWLh7i0O75DHFtKmRNLBBFd9r3EHFiHmSNu5U6Bf6TXaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XBrJQIO6; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XBrJQIO6"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa549f2f9d2so41187066b.3
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 02:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445494; x=1733050294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=XBrJQIO6TFOrhqJqChpvemq8eyuRlb8SF7xLzm22CQ3h7+Jnz8CPYYDHLjx26DX1RW
         6ApASgXuIFEm6DhHhkDUQAWTWqIAA1LDrcR1mdihtdczKBjTLNr7t4efGzMNI2+aUSoX
         US9+FrcX0s0VZkQl7ejfBesJfrPTi5WbmmAYVxRH83iQTdoN/3xu2LVVKs9V677A7BFy
         J43V9f6jGw3CbZgb3Em5S7gjohYs9BqQdBiPXl/z/I7MalBvmBQzxTDtJismy7qYlC4e
         nSdqrISk9U7hkSe69WmLgs2RGuV2F0wTXR0l2150pilqyVfkbQ1wLm5UC7GyBjndB5ED
         YtYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445494; x=1733050294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFDhd9Wyt3Hlc0wulj/fO0SlrgobJnK/8PJIrWrttTM=;
        b=xKxuCSPEsSOCe/vn5wPNCX+mDnnNP6tCZdIiY8rJWzqIeHoTAYETMoe3/j/Ty6CedO
         734+SGf8XlT8x5PTAtFzQfvZPY2nHn80XkOKWzFinXJmQxz14NtqXDFUC41xYBI/9/5n
         fJjkj90vHL1TkhenJm0iSgpUtdbx3f6MGAUtOhVAu4CFcG0YHZe2psuFafienzsnwktO
         gdyg7JV5PHK6CQ2kpI0eO/txrTh1GV3obVgTKTXsgguyvY9uMfu/vc45zeLTOXXmpXMw
         0/e5FRFw6xMqauLIxpMipInBX9clM0BiE3YGAxlIRNNex0ILDQL10WJG3cGl7p+9nS1R
         REeA==
X-Forwarded-Encrypted: i=1; AJvYcCW+AVLUSrUQ1IVbHmbijPkBPldoeh1ovhSVAHrPfH4PnRwJyDgZlDnDZs2/Z6UZnhIrbGfn0MwHz/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtdsrFAW6MAMMm9Sq3hajb1Ya1C/WZdQZI67Nc7x8rsuGO01x
	U3EHZv7KxmiJdddCl4OMjqbE6xq6onc8xi7j95ggACpYmbEPmzbt+dxmOwb8ltc=
X-Gm-Gg: ASbGncuDpPRjdwcWxSOBxmFsfmo5Nd15M0MLIg5nra1LASInkHfOZgk/LUvuWGAZ35y
	Uf3pCs0ItA2zDS7YlkTRQxr0ziaI/lNbQfaOc2Zmlz9OQ4SLV3xICFEl0FkescOOT99b4UHSih1
	QePJhH+OV/e/ewyZVTqZN5OdxvLN616h2hQSpNV/ns5AoFqPDilpz6gEkM6sRW64fSUVzSWO9l6
	tk87UvIvTb9eQ6a5L5IZ7foaGSnRb6ninSnoJw3oln2v7ToyCe3GzcvFtkxT8iqjK6QiQKJy8NB
	NWvHpRujK9ZqXciARwG2
X-Google-Smtp-Source: AGHT+IGkXmpO8F4Dhl0EGpNxs7dSonbb3C4mmRh0iCiEPq5mTBcYlRE2EkQKpKCjp2nit8IeufV0YA==
X-Received: by 2002:a17:906:18aa:b0:aa5:4cdf:4a29 with SMTP id a640c23a62f3a-aa54cdf4a4emr66028666b.31.1732445493808;
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b2f9e25sm328892766b.78.2024.11.24.02.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:33 -0800 (PST)
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
Subject: [PATCH v4 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Sun, 24 Nov 2024 11:51:47 +0100
Message-ID: <2292350a8bcf583129f93996c8a6ad5572813d9a.1732444746.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732444746.git.andrea.porta@suse.com>
References: <cover.1732444746.git.andrea.porta@suse.com>
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
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..7c3254b043b3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -609,6 +609,7 @@ CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -689,6 +690,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1270,6 +1272,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

