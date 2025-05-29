Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FBD22DFB1
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526574; cv=none; b=BNl86GNW8AGV5Pc21GumGwwb+guuWN6yzh6KFcAD+mqSLq5yhAmiXXSiCShOkFehSqR4VvtcBpn+f8B937+/0FkrxtcwiRRPBL/zMrXffL8OPhII3HaHLXJRdmdXOpMaeGUoRdxT9y5TdjcllGL8j9i04qZaE9jn6h6LFctoD88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526574; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LsIskuscIzpnKF9rFAjry6Y4MoGfhDR9vd5lnl01FlFwdlOYdikscOGDJ3iHrg7ZyAmPyDiXvHVRwOv6O9Tdn5OcAEaTfG05rhE0ksXRgiQ+eqFuUC1s3Ra1sUtJg1QJbKN5m+Ikeimqt6/ljThUbrS0nba+cNLfdi6uTrLXe1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XZuInRcD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XZuInRcD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad572ba1347so137958166b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526569; x=1749131369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=XZuInRcDEzGWFNPYuYg71y3LUCbHB822XAXmtr3F0XXTI1wyeblNHFgyIMe8vqovL+
         UMapZzqHD9iqfdaebnqTu/NBleLBFKAk4GxNrXkhi7XHMb9kw0pi4wx3cDZGe/TzXozL
         CRYenAlQ9Yy7vf2kTKPZ6e3RykHIdgmhnljXPdQ9H6til0uJbO17mwL1wXvteJcuu2yV
         v2T0ywPJAJvN+CXFB7lyJyhCfKCCjNXHgYSfROQox04A1KRe0sXD3iuifVoE+8n/TE38
         Hfv6aHFGP8BGoNRS+dmWdqA3ImwUk8JNRHStWLhNFqCJJ9csFdzeiq+zL3k42uk2HIKv
         +rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526569; x=1749131369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=swnxz9nHhYatB1CVv+/yCMZI155vZ5iYAIkigp9usFVA9BFT585J7GUnPnkmZ7V5Fj
         ejaHfzWs1aM0gyOSCFwc7cYRKdmcyHW+fFgd3OdPcxNo5m0oHf544HZKySmFmV9htiuD
         EEwPuL9sz0qmAv2Z+ITU9q/zDCL91AWbNAIZqOpQwjg6IuRgQsebIuVXi2uTHsYkOcew
         EVy0M2qsnr7JVydTg50CTlB3MqFGaX7wHdQPgkKeZFSayZRSqVt/k4gPwXPyOyB7jpiG
         AmbYUlIko9Fqy10UU0zLzakKloNq3uEPGUVglq3RrBk0FZvBzKfd9oCWsEzBQxPOeAwa
         muyg==
X-Forwarded-Encrypted: i=1; AJvYcCX9vmTb0Hiu3oFhJSX7rANJ26DQjfOLOaj+tDbsL15SKw7gHsIUkb2Uu9t+/NHR22mwdqjH6cbvKeA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG+9IEoID//fSSessn+z/owy5KcoKm1GpbPqYd1q0NbXDTX3D0
	q7cOOopdnhJNLhWHWZ2dnpgsHbFxOfDCHc85h7TKkl3JjAnMDjdu4W8XYqehor1WZS4=
X-Gm-Gg: ASbGnctYe3TUxVp1GXk70KVOhl8D9OOjP6q8EvAjyC4s6XAswJj5jOb3phSnacedmmT
	29X6jyTEzgiNrufuCJufqcig6U7mbYhJ0PnhnLMCW0atkiJfLnMNuUj6ZPX8INbC558fuT9LSdX
	I8uCkFerBparP77178HBJlHzPU49S+ZGNhmDQzlneLXr0PifZ49O+j++maWGgen9n2cx0sKc4iQ
	CZce8S39pZqNitTJ8rWPAu45V6zoaNf3bfOHCwAzv2gfQ2n5DZ6V7ytlRN/D4oCsZmQ0SNARbNT
	zNZcj4xxFy3oshUmWQx7oWEdwMeYRQTl1uqeeG/W0uYp9FAGV48eydYnVYBSebDnmo4MtDsVvpv
	7qfMfZPhPEf1EfWhdy9SdHA==
X-Google-Smtp-Source: AGHT+IGVz4lZI380iOeZ0sAk76r1bOVlu9hZAX/4jbO1OiKLTkmzMHxAI8gYVfXoqODUDof6526HpQ==
X-Received: by 2002:a17:907:60d2:b0:ada:99ed:67a3 with SMTP id a640c23a62f3a-ada99ed7fd1mr251769666b.27.1748526568650;
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adb2e220548sm26619966b.109.2025.05.29.06.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:28 -0700 (PDT)
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
Subject: [PATCH v12 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 15:50:48 +0200
Message-ID: <20250529135052.28398-11-andrea.porta@suse.com>
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

