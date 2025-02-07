Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E49922F167
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 21:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963874; cv=none; b=Ob5I3MfAUMAMcCh+uWAYMDD1RjPIZ20R4G7z0x4kihNHoO3dpgcDuEyG/aNA228F8tAeTH8c2k19yyvwo1E7Jqzp0FKPVL68qQo7voqJc+BvM1pXPwHIbRZZlR9OEy0btDGKzE+15ocb4OJEQ1WtuQf55Mi0Se6p/RqjqKI8I5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963874; c=relaxed/simple;
	bh=6A227ZHcLwmH34Uyd7dFlW31JXsgCCsAPJaGw3Nto3o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Eoa9uf9ZDUweNmgIBbV3AF98gw4VN6etZuz9YTEmC4c9BOdgjIctmvn+uwHvmXjXCZ3K8ikCEy/t2UGgGejKbUH0gUxP87og1Wk8EsfJWsQZMxWw1DlldIUuW+3VHxpvWS2Vzy3bIDEYbjWG6qCp+el8teYSt6VucpvBFDkHWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=akxOe2Yy; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="akxOe2Yy"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a4f1so5321950a12.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 13:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963870; x=1739568670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=akxOe2Yyq1JtGh5VxMvlsR+ntcOQ9QXTOUGCRcom1rd3zvb9tUHl9tlYciimNSq/bw
         dtjADaiqD8i5NEwEf3bMCAwpX4qTlk/TvW48yd2D03d3S+LqDiHbABG4e5COkNu28apd
         Iu+02NGVd2v1AFvHGPqwYjo1x8QWZz14AbnFFO1iCdWyOf3IMxBOz/G7sL2F0jFEkjxv
         /GMB2lw3HHyoY3ReqvBq3LrRWtkazXzQZNsQ66Th13XJ2Bg84QrOG2i3pThRzO0TdV34
         XkJ0+4dj0w6M7Lx7Nadp88ueYGh31YfgWoagPhjnfTtGNj02mi7z9oJtdOnMK2/bTB7t
         QUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963870; x=1739568670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2FlX2bXYTfLPxWNvFOZ2OVVRCbqnN5Q4yt/8rIDVkFQ=;
        b=HOCgA/mtQrRwRalZfd20ydgJ6TjQYydVoCOrhwmgDKLjZwCfzc/61b3k1SBPHiiAeQ
         A+QGJZCmQXPlJplvenS6b8B3oAxcfFKBvSYCxB9N583xIfs+FkjP2+Ys0oh2O+054ZDE
         i+pE2rudAo2rXZ6QLUaPGZT12di5JPxn+0IFhKkPKkXHriK+BQ3ZsQbbfQfAuaia9Yor
         SWCsqBsgUBxdeJz5EmeFFiFg9a7o0LrdZcnvr1WdnR8exp45E6OtBRK4n1MFAiNidNr7
         8GSmXMqRh1qPedez6JRxxTxaSiYTObattB5nnAVk0z5c2eCdaniLC+ftXrcBPFWxPup1
         BNCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDGTDgSU+8FzLq+fq7wHmpwHt71G4sEbwGURjqaoMt1sPaMJla6A2eLlsT8nRzK9aC+gv/Xc0nJK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGT/HxNLGubWzJ7I0Ck9ZMonrE2AOBQPrmKZTD8ark85zC28M
	duyJkS+PO+J7KmnY2npJsIbAl3t4Qs/k1RPXNZuIam9aUBTzYYem2chjDb4U2iY=
X-Gm-Gg: ASbGncuRP1nDnLwzRsRctIi8Co6Hezz1a9dk7VKca7TZsbqkzdfUt3xsAfW4oL5iS9n
	TKQOk+x/0DJAENpqu1A6MuqsDANIYHcN2fyJLbUwmeAX/A0xHLe5ZxkE9wXgMZ83FKs/NOKtvzs
	FoGCARQ6tGvFYB4GywdC9HPFDWuOfOQWFiM/5tFcefdoMs0wvItU++Y/eP/BfDDvYT4eM5yGaee
	+N2km6r0rhtlW3chKtQVAdZd5PZgqkbk/3lG2HGe0NANkcDpogvgJ970IHi57N+bCPfCK0l6HTq
	SABQqktNh6a31JOLNcMWB0mIg/WAB31mKecHAYg2NTOtvlQQ4/RS8Lif47w=
X-Google-Smtp-Source: AGHT+IGqkLo0lI36PtNVD5Cy94zl3v7p9AH5vVE/OdrL5N+bHa3ei/O+q+8oK4gR/8Gmpzk1d7rM+w==
X-Received: by 2002:a05:6402:5290:b0:5d9:a62:32b with SMTP id 4fb4d7f45d1cf-5de4503ff1emr5658453a12.7.1738963869994;
        Fri, 07 Feb 2025 13:31:09 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de51768762sm970455a12.61.2025.02.07.13.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:09 -0800 (PST)
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
Subject: [PATCH v7 10/11] arm64: defconfig: Enable RP1 misc/clock/gpio drivers
Date: Fri,  7 Feb 2025 22:31:50 +0100
Message-ID: <4a84775f3dbdc0d66882563598b837eaf6328d9f.1738963156.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1738963156.git.andrea.porta@suse.com>
References: <cover.1738963156.git.andrea.porta@suse.com>
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
index cb7da4415599..cc70793e97ef 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -618,6 +618,7 @@ CONFIG_PINCTRL_QCS615=y
 CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
+CONFIG_PINCTRL_RP1=m
 CONFIG_PINCTRL_SA8775P=y
 CONFIG_PINCTRL_SC7180=y
 CONFIG_PINCTRL_SC7280=y
@@ -700,6 +701,7 @@ CONFIG_SENSORS_RASPBERRYPI_HWMON=m
 CONFIG_SENSORS_SL28CPLD=m
 CONFIG_SENSORS_INA2XX=m
 CONFIG_SENSORS_INA3221=m
+CONFIG_MISC_RP1=m
 CONFIG_THERMAL_GOV_POWER_ALLOCATOR=y
 CONFIG_CPU_THERMAL=y
 CONFIG_DEVFREQ_THERMAL=y
@@ -1289,6 +1291,7 @@ CONFIG_COMMON_CLK_CS2000_CP=y
 CONFIG_COMMON_CLK_FSL_SAI=y
 CONFIG_COMMON_CLK_S2MPS11=y
 CONFIG_COMMON_CLK_PWM=y
+CONFIG_COMMON_CLK_RP1=m
 CONFIG_COMMON_CLK_RS9_PCIE=y
 CONFIG_COMMON_CLK_VC3=y
 CONFIG_COMMON_CLK_VC5=y
-- 
2.35.3

