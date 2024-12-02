Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D7B92040A0
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 11:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733138360; cv=none; b=LbVcJXjHHsq6zCFp8lJJx2wjQbRGbM73sFczAW7NE5ZQ01uUgzc6ebMmXTZ2iSnJLVsYDHF371g/wxEC3+JGmCKaDOP59dAzudfyEtJA9T1gSR/Wo9wRxU5Wx9LXSlI7gxMAeeJGIYVKmAk6y1Ypef1/Nj06naH0D3uDsD/yKDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733138360; c=relaxed/simple;
	bh=QMBFXNqBpFgYP2yitTOgzdsfZItshvzAST6FqjQRjNM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hfSPAlEdYL6CcMopg21ZrFOCji3vaCHQeJLjPoxSqT/piXhZPSQMN8pd5nZ7cswTyuwjdkb8ePoif3zXF8PN33fFUjVR8YiuCIY3SGtHcEKO0zCumFOF9GRR26nNW70A2xWeOpIAV7n9Nn4hnIHDo7upGPCU5zLzN3ZXjBbNBI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TRUClMXb; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TRUClMXb"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ced377447bso6610219a12.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 03:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733138355; x=1733743155; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=TRUClMXbT/BkEMucbnwqj8OcamE/lxRppa4P432szv42fzZY4uemRAU6iOZ7lsvAc/
         fwPFwx1PMfCtYKXQ8kfySDfXiki98a6L7hP2mDvg6NYBTSK92eHCHTkM5/dxnsxhnDVh
         9czhw0Zfjc9gR7ITOO3D8PJRVXyqkCwRu6VBq3gKr4fkkTBa4pc7n1W7bWHGio2Gco/l
         4cnH37V3kw8znEEAlmF3wv2i8gTG06ijbVp8lk3WHkawjM7ibZTM3dLei6KNr/FlPGx5
         jlA7CO0nA7UDUIr87WQu1nuM5wSUEZQ828yYv958AZPjqFj8pdzljNItiO9x4OfVCUgK
         fHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733138355; x=1733743155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dNlxUlq/zQec54ENuov38IuayLoY+NtEDaFnmM1inQ=;
        b=a08bFkygSTOhIc1UtHYrWaqYIiuuo/eXTT/CGV2cqm8wEqiN2oLRqslTUyW+AO0eqY
         cPRaMiRA+rG0wsga9evrWVuoiyisvzBWaO5d4ot2XTqFtQrAdbYHR0/Q2HZvGoWybknS
         /u7GeVS/FXH6IM2NM2CTgixLNLT/ZOeTrEtf8dPxs+3uw7MBEa1iThKcglH2TC6K5pKC
         as0TRRfG18JIagktR5TDdVNHvaBrkFD5Mfav6Y1W24pmGaX5yNRVVVt9/oN/LIhw7D6V
         rsGSzbuM+UJDApKUJ6lFUd7tPnGe4TfnckNgMRB4m3IhOoVM3gMz9wvUeEpdkieCEKfJ
         5ciA==
X-Forwarded-Encrypted: i=1; AJvYcCUi6znBdPkajWmhYvKp5yHguLhAvt1qK58YU+0PI5Ju3KbhiEjwSDWGCk5CqycqnrI8/o7+yQCVza0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbSCkeAvVSg3M5dkNyzRwdwfTPqygb2pT4SBwgOERfsEDKh59H
	co9uLnkCyj5eOV9cusb1Rb2h1IaYCQoo1J7RQs79hLdAf8yIuf99vh9xn4mPNbI=
X-Gm-Gg: ASbGnctze7AAsPVpH9Ws6eWUhnKetmOnZfEiPr3MHgAafycyrRhZ266S8miWN2gAuPg
	QfSNCxMLTWbdS0MLTElmBnUm3h7bYoqT0St6bM7HSI1Ryahje+09o5nNgUWbu0EyfuhNOk94sQi
	xXp56qT0D5m3n/FINA/V+Ey0UQvfn9Oun19a4Zlft0i4ufGT7WewlKMXZ/+oAJZYu7tvfpjpp8l
	K5FFz1xZ6OnYpbPCoJRpx+enFd+rNimGkahI1u1McMtSZxMeN468jtBPESXs7FeTMJ/NyIGTpwp
	i5sgwjase4xyHgkmaWgR
X-Google-Smtp-Source: AGHT+IEh8VAXDJC3bTBBrwDpqq8+bh66QBF8HuQqB3DA5Y6Ne4IKysOOgMjNIKrVqzCRG1epx5t5JQ==
X-Received: by 2002:a05:6402:3484:b0:5d0:904f:710b with SMTP id 4fb4d7f45d1cf-5d0904f726amr20592659a12.34.1733138354832;
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
Received: from localhost (host-87-20-211-251.retail.telecomitalia.it. [87.20.211.251])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d0d2f0652bsm2371980a12.25.2024.12.02.03.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:19:14 -0800 (PST)
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
Subject: [PATCH v5 10/10] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Mon,  2 Dec 2024 12:19:34 +0100
Message-ID: <2dc27b08d82e5257a831026c963ac148d11cb6e8.1733136811.git.andrea.porta@suse.com>
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

Select the RP1 drivers needed to operate the PCI endpoint containing
several peripherals such as Ethernet and USB Controller. This chip is
present on RaspberryPi 5.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index c62831e61586..91b39026dc56 100644
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
@@ -690,6 +691,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1272,6 +1274,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

