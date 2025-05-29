Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EE328ECF3
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515697; cv=none; b=OL/cioatMtI/JOnALmcH9x3WdeK/OZ5xeOOIBh3LMg2fW40xy/6c3DJnn1XyfhHNDncQxH7tu0EerEnXG7TSIVuXBy/S57vn3NuY5TsBYxWFDKMQwOUWEsA2walkDIqD4knT+0DF8fRzdFYh01imtCZMXDR1pcof1pyMo+WKOew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515697; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p98WaUfJL6gGrBb/dwEwVqLIlS9/HMA081Fplxd1z94cU+ypEFMyITlwFTxp6Ekel6B+XtbUlPMJcT+vvXexzfOnfjbvdWT829hlqRnz1XbcL324O576s/S2L5OL9ncsSVxJix9o138Dzfpqpl3N321GoyqbhhvOqkHj6I4CCqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NicgD0hc; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NicgD0hc"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6045a3a2c5eso956977a12.2
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 03:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515692; x=1749120492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=NicgD0hcLgy6HhP4OZp0J0IkRCXImymRLlH2QGUeKC0+SkJtpwN60jgVSpWKp060vD
         6hoTDaU6VBFNWiAihQJFfpwVumzupQpN32vH7wXyqByzcN3wGkRRIy4IilRL9thniVMz
         JfU1yONPVIrCOTdJvveopWTUIjskKZFnoZsS38pya+5ZFg3KPQOrAb+mKB12XDcuC6sa
         ujUcFUmkMVBgWs+PthQ1BUU8iwqlZP9YjFE3fO4o1oZQ3Cyq0lD/eJ5Z7fP1wlfih8KW
         JPb0UMXTTS8ORaCHlQinep31n//VxOvpe3ka5IHPx/fskzgTk35+GmKH3h5SXf7r60fB
         b73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515692; x=1749120492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=RGkLycyqeq6ya2wATUBi6I9lfkEVjYonchmugyy3KryHCQEwE8fKoa9V0gFpLtN3Yk
         CtmTz3xhtxRaYOhzEy8w5qw2LzAFtehcHo/rk2U+2Rj5MoYAafrOgyRpQlsTQI3Giw3B
         ec7/zavc4cDNcKSF3LRW6rjWiun0UWuljhD/YoPdmO+Y/F3puXgdu0IlKzKiaAS3aUb7
         h1G99HOM1rO08MtURka0hQH5eJAc5EzmfKSRWA9AwM0j6CSXcbulv3zLrz4exDE95Cyh
         Smzbf6H/8pPVj8QUEVkrfuRwECTy80JsipHzj/GW4qPF1m3HcIRXu3fsAKdq6Jg8mazf
         tuaQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5fmCv6I/XPMa1tIz63Q3N4rkpzFl9htVF5Aiy5kAxDCGE/OAKfugrDD497MygDz+bHH+P70yC4no=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrNZcUUyGvZ4qi66sorhYag0jqshnNaH/4Y5UZK6Y9LhDmptaG
	BPqK94ylLfm6TbP6lDYnXv66vpDoGd/YmheKo7q8mFpRAQaiQMLd9nFmJsqcfQrugxQ=
X-Gm-Gg: ASbGncumDo5oKG2yG5Vl6yFx70VLTUkBteVrxFVHsSrnSX3g+A8z87N/Mo2WnoRzk3r
	wU6fyPazATlFmmti+UnIbCrYZoPYc7F0HS8pHfRTsp5ksvYkPZQevXu89hk//SztZwJXAqR9VQj
	iI9AHo60+RKoH48B5eMBfyHGzgSLAz8DvHkf6eI//UJR0s7m8yT6PAp5pjQx+pD88WQceGpZTvk
	uZuxR0sFkpDHMXEKss5yGYBiWY5HHEg0uAQHWTkxCpUrm6qjW4OI3s4czu0yGUgjXAw7y7QupFy
	vYTicoIyJ7THE3HCNQNb5vxdyu99OObx6r+jsYbfZ74QOVETgK+hQ+mQzE4hxQAM5pjC8bB7efP
	345er31JoQ9KxHpt7+qyM4Q==
X-Google-Smtp-Source: AGHT+IEOw5cpXlLDmXIJhM8OBLcgF8g3GUa1YjbEQIaeSF9CfzHeg4v+PZD6a/l5I2bu7UALxAndOg==
X-Received: by 2002:a17:906:2809:b0:ad8:9997:aa76 with SMTP id a640c23a62f3a-ad89997ab7amr545955266b.37.1748515691621;
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad3acf4sm118421066b.150.2025.05.29.03.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:11 -0700 (PDT)
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
Subject: [PATCH v10 11/12] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 12:49:28 +0200
Message-ID: <20250529104940.23053-6-andrea.porta@suse.com>
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

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..f6e9bb2a3578 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -620,6 +620,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -702,6 +703,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1299,6 +1301,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

