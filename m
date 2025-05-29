Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CBA22B8D2
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 12:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522569; cv=none; b=dzfdrxdp6vn4ThwSPT6gzOah7ZgikBeY2qHIxs9gskhyYV2GXxuEpluMcAkV8aN/nP19/B8W6AZEEwcIkGHIzJeeeNqMj0iO8ptWi/avDQjytXYh1DabJlmiaGXLtZsrJcgruTpkgTCcqk28rR+kU/LRsN44J/8GZ6X9dp0DcqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522569; c=relaxed/simple;
	bh=tcS1OdtYYeMI7g/XHAbOHs513PqKnIFqXgFxXuW43MM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbyHxPKccBbZY2XrSCvIVY0MMDovGVsZyZA3Ag1HQMszs50pF/Yk29mwPDI0XYuRQQXJAIUsqL+oGctvwbsPcqcE5+zX5t42tq31K7ig/L/QK1BYyfgt3JmCi8rcyqV3NQKqfWPgRh5BYZW3hfbrzYFqYcBQAF3/SNVPvohkDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=MJm+XqXn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="MJm+XqXn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ad69e4f2100so128399766b.2
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 05:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522563; x=1749127363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=MJm+XqXn2SyFbhWOOfRlY6rtFiPKE9l8yoJuCRLLfqttrCiYBF7Tg5bvVqctcGTyJn
         TZ4uqQgb2pE+zeRrbrWUao33MZO6VAaN4PRyy3H+7jJavM8dpCm+pj1+uXRvLWo1RG/G
         /ZYytdEgGqL3y031XIbXX71SQSMYESCYk2bctOu00fBjX+RrZw65R8aXE40DfQWsOIyd
         06oXjNuOupKdh8NRkUwbLZnUiTbnp5I0dJ2N/3UeUDutJWX16H0ne0kZL8aqiD7b2pCM
         ofGUUVvqnln+agexJ7nLyRZwi7IVoFHVOPRcu99W20gbS121VxMw8r1N8eHcIygpKRKM
         w+Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522563; x=1749127363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLh4eS1a0IWerdW1Bha9yJdjwbF94WZ0emKgMLeoZKQ=;
        b=LUVAO/b4NBdOKM+k4+SGRKbdApEo5ZvoVAo9lDhK1W+pIXoFVz/a4YNgKY17WU0VlT
         /sKfJ+GqDwDBJYspS7gaJ8oASWA6TKv0Zl0icePwoJTTCgGiG7z45HsFGlDE2MVdFvrH
         G1fJ+6QOBKre+fb9IPcGvi2YN+4/n/Um9eQxuQoBrIqWfymjZ0Q4eO/3q4Voh4SHYXJz
         pjdaRYo2QbeoON1x4U2lBdB3JdpxAvS4Ed0OulVT9hy0DQcQPx0eK5LDbNUhL6VTC+zU
         +jjmyXXG1SYvZ/LiDKq7t46Dmj7BHy6EgY9JEXEJQEn9GFW2REm1ZlpKqtxDmmxRs+qE
         62JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdpy72ZVg9jbU7K9fQYcLw3pZm83AmnUGeCPi91J6sBZ6v7F9AQICXFk84s/jtBnoyTnSNXLpqTgk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAwkIm5LxgM69StA8A6rg0vcbW7rD6ACZh2AlU9Y4to+yCyBJV
	H9Q8dry/8wuLNLSSn9IXLapNzzXRxRjdGS92+wao2gq72RtXZgjt5N0kETznbTdkHSc=
X-Gm-Gg: ASbGncuwBLVUNVU6SeGGFwUvXM8icZDkC7JmmbkInfRsqS/f0iaV6K7UaN0Wywyha4b
	dV2GBPce10vZxNq+v442pw5F45xuax6ZjJT+qUCoFCWd4haWpRZDqtnxMPw1K1w9mo2vGwFVBC1
	timfyij1D0H/gUBm7M0NUQX6e84m3hRR91xdpXozhZ7EfnEB5Azn9MiDMcVg0BwxN7CGx+X+LAJ
	oni2vQ9IlcIZYH65BmBC7tGVb12e89k6hVkT+GB5LFjCpsjWcs12Yj63Fb/Vp/OSy7G1xdZMDF8
	cukG5iWYt3MOhzf0OW107nMnnjfUsR79uM9rUyn4aix/oJHWSNFrXM4zK4zXXhoaX82uZjWkJoe
	t1RlFEtshBrPunC5BpcPeew==
X-Google-Smtp-Source: AGHT+IHryfaMX1R4GUnBG1aUg7/5bkW4Kn1TXAXHNfS5nQo87GficabaeaZc6nwlybjG0MJv0P5uAg==
X-Received: by 2002:a17:907:3e13:b0:ad8:9257:5737 with SMTP id a640c23a62f3a-ad89257592bmr966243466b.25.1748522562865;
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39409sm137309066b.148.2025.05.29.05.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:42 -0700 (PDT)
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
Subject: [PATCH v11 11/13] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Thu, 29 May 2025 14:44:00 +0200
Message-ID: <20250529124412.26311-6-andrea.porta@suse.com>
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

