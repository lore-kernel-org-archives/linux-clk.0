Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F368F22CBF1
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 12:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522569; cv=none; b=i9FrIg2gQtr6kxcPEWbSMHKwKTDh7nAL+/M6amldUnvaNOY4j48seFXYfg9lT117xruoduArVo8cXujm8Vcez58j57tyHvMB0JxrBIOJ52GXSebE5JLb5GlYbj95s2yExt0ahlV2hKrtwn20s0uHMc/q7t9Pya1XN1gg53C8l2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522569; c=relaxed/simple;
	bh=RRM404hdZVflbCbuZ7OBxFTgWWaneCmtEfkgg/Xp1Lk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gtWXeZ0XeVF1dRSVA7LI0NkT95MD1mYiR0RJIDPAAGvLRTnPxz+GnV+amyjNX9WzIasIRttkBiOKCuH25hQiNfWSfztwZ/qPS2dXcr0ecP2K37+lBHjyf5skO4u0eXFqqA7Okzn3KLDJXWu+GFq0uu8DsYXI4us7mZoA9z71AJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ERBtpWvS; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ERBtpWvS"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d35dso1755713a12.0
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522564; x=1749127364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=ERBtpWvS8RaK3IDnvbLxoGyt4ZJvpGUlaYT1QyeLhP3NJSw/kcd27AybBz19pQPXPm
         gBxFyO7qANgLs+8cBLhqXKWlYl8RE7jwiWKvWg1bLJRpv4GESZ+fdlm0ycar/chJ1kkS
         xlHL8r/b8D8k12l3zbVn4YaXEISZ2uQ3Ifsbdo5fn2yJmFxrSBiEcIKe9SisQgzm/sf+
         6MXVjvL3BgupsdQt8/aCWUnDiJuMAKD4hWMH/Bqj094ABNbFmmQG3Wbdhd5l39Fsn1fQ
         gC47kEU47CeOWjkRNOdMwRm3RfQqJ+UsJ2HjwhGJoIyU272vLlI8o/TbsBWxDyq2HwX+
         q1AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522564; x=1749127364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hTCgL7Vlc0a5ielumzwkk7bjVhaA3TYeVWaUN3CkeyQ=;
        b=odu0yYJRToWfIUzsWUUtFPooiEYnx9KBffm4oDBdBZM+9kWmLvKOGkuzJXKOsaJ2VQ
         xzHDeAGfyPvJMUrg9x9oDRb9aZDLKF1sfOlWBSw6so9+oP+dBuMKNUMmHXjt7j9ueyMK
         THMlk13CAVQptVR4MMA7s4Yrf7Xyix/QCLU6DZUGE9b584PFGcDAzN7ro3JkUQlePlzv
         SkkZyHoib12XSlo2W8g1vzeVP36ohbD1Hl1VqIHxpisw5hbTPUmITrt57eOosqMrElC9
         9G8bgM6DCEJZXfbL/4gx/aCt0cgAKBkTJBCaGuWg1uOxWRCDTZeMaGzyj09V8SgGIhxo
         MQQw==
X-Forwarded-Encrypted: i=1; AJvYcCXoWTsgh+pIKQH5zMBKgW4Ceir8USvk+WYzCe5fcPzK6P3VXXn91C+GPxlXwVw7a6uKJrRe/fAvMz8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtWpYw4BJtu3Dwj94hH9l1EetYop8oXUAjJ3PC/TVbidqENtY
	MKbcyLbqPtkCksR9xRgrhzkmnqTTWOYWIXZ+26Ku7RZEu11XitLh6+qXvpptVoMnKZQ=
X-Gm-Gg: ASbGncsXqUm0dugMPh22vcQKlVCetX9gpx/8CllwVkkmAUrONKmrU82tAWBjwGV//vh
	OG4YU4cycP5EdAIOjNWXtdzlp6sNfsK8m5v/4VndCBeioB2ROeeLjaLTe2soT49UhEJKn5O5UHt
	JSEF6AjduWVtg/gkJrV8mReegoSnNGFScaO8BT3Slr1hmuriLusUQ256yJ/6CsAzfbX8DAhJo40
	VFqIeUbNVydSteIqYgA+BTgvrotmztaxt5ESUII1n98VNSoUkIoKhcYjn6k7uMSaKvGng6AoZ6s
	FluANZo+QIz8Uj4nNUmmmGVuhXpO+zv7XjmCsqFJIDBUCm3yLgSbH3qEk33r8kZpqa5njrAuPZT
	P82bQi8jqmBiNfenuk/ZzwCE2GuNtcFUt
X-Google-Smtp-Source: AGHT+IGU0cArmNGBE3alDxaSeS0c7kho0TQ3gbduZH4lCYtigEniaEd9Y5YqaiqYC9HAzb90Z71eXw==
X-Received: by 2002:a05:6402:510f:b0:604:dcba:dafd with SMTP id 4fb4d7f45d1cf-60536c20f82mr2597026a12.15.1748522563913;
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6051d79e940sm2308553a12.67.2025.05.29.05.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:43 -0700 (PDT)
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
Subject: [PATCH v11 12/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Thu, 29 May 2025 14:44:01 +0200
Message-ID: <20250529124412.26311-7-andrea.porta@suse.com>
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f6e9bb2a3578..ccf2f50673a3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1659,6 +1659,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3

