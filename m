Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383A51917CE
	for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 10:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732445496; cv=none; b=VbacNfxuvUOisBga8KUJ3+jw29tqzUMEUhEicdsDBQePMHuf7epbjBMpdsy+BUB1DTj4JX1FzRMorp+IlHVSnPWCW1x/IO9+TgFVZIxEFvDoWa2gEyd9guG2t8xIl0j1bQ9js2a9pO+Lq2ogyebb/JiBPSI2WzlDWjRGAs++zxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732445496; c=relaxed/simple;
	bh=klAcgY34GqH/PvyTJL1b7HVfq12XCJbjYpuQRIMPiP8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nn95S7Bgrkxqy/ErkAKLrIHs9Qcb1+1OcSbwrddo5L4oGgTiP7Oy7XZBLgOUABj67YaGia/abDM6ly9pgtv/jw/VtFWbFXntLVyt0N6eJK+dCt8Bjl77svkbhjVBdV5aKrHeU6PJoUCHJ4EKwlgDpdl/KbsGFUBk6TLMAIHESug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cfKgL7pK; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cfKgL7pK"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9f1d76dab1so577272666b.0
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 02:51:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732445492; x=1733050292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=cfKgL7pKq/TaeQyUHQzJgNkjjkSa3R0EUFaYbgm/qmryupMcUw5dH6jJ/vj8rODL3B
         uQEJIzOaq6SNFluln4Ejcw3YuFdTFBxLGgczCxLsM5cm2Qi165T52gS022DqfT3CsjsF
         wh3O3q4XgxLKlOvOi2ze/GRal/PL4IPRRVxjb37ucOg8ywRn6/5y4dMRk7p9OYfR+SWR
         hg9Z4Zn5OQ+tDrcsU1o+vFEdyHx0OJG9u3XLUVBt2pnKL5/UiAPWgTh5S5bb/n8DLeoW
         Rg8/NaOULEhJwz2DAuMKzzi8Oj9icCkcYF5tDmOqVMlowMalDpg936TZbHbeSAGGxYSO
         mnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732445492; x=1733050292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jfS2J6Orsal5tO8fun4tykDcHfrxbNiOzjaiamwU+4g=;
        b=i1oytd0jpO0YqwKVxLJIp+/g3HXAPRSLi+lXAKRZlTgRSvRMoIa0AenDFdxR3Aq/wo
         SIDZuhjc3CVI/5yvbIpvufpaGeoyD7T/gru6zGmz2zMuCXFHXRESAz+ztQwR2tD5yLHe
         cVg5LLpUbJecy14ZBEEgrAbEzGx4xM7RFvXByXJ8vUveT9tIDvBveRWchhrqIi/nQQbe
         7bYmd06ULVWxcaD8fwkIU/wQoxr/eSasK1uBP0C1s2CCvmZHGsHTAx/2W2Jn6FKWMsTB
         CUgJMqmtNerPIcjZo55qtYEZJGkHIaHzioyDoZfnanxNpi6EuwIzHKTGthGG6NJLntWY
         yj1w==
X-Forwarded-Encrypted: i=1; AJvYcCVzWUGpS72GCz+UiI9Qmlv9M81PBVg+GUvT6wR1JoyHELhDHSFcE4t4H+ciFycWpjzvWk4T3B9w6U4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBjyV6oHwDyyB/GrHJjcDKgeYbNfz4CjTUVpUhQqFmB7Y+Lx6
	uYQ9ScBom+kFDIfs+db2HrgS+9ygCO9BaXmiDru108uX3VzQ2t2b6kLatdcFmgg=
X-Gm-Gg: ASbGncv4jHp2m/iHu9ZsGt7tIfH0mqMdJNix3aw7WPTPsjZGKPapsGQvKDzPEVlYtEo
	61ohsc6rpR9jpvGL2ohle0wt4DD/WZisccZEU8/SzCFBZgHootheSv+uShftHfl0VYcEWUS1qLo
	GnY3LNTRlOU/7mWBahxaIi/KifdbzFDsm6fCIEjPYJrd7E8qcoDW8yUgN4GygaHOh1vW+owQfmK
	kdRcfYMFdo789SuzcEe1sYdaZt574cHB/zp2bCWfwnS7Ap6K2vNWQ1lqK1wKBghjEvb/uwbDpfS
	EeuCoZlfzYw200DRE0Do
X-Google-Smtp-Source: AGHT+IGSDpSzkP9o4gSgW32myd8F9uUlg7N3TWy1+co5rBtWhujU/hEjf312CRmk2+jz+0sdWz9GeQ==
X-Received: by 2002:a17:907:7758:b0:aa5:3591:420f with SMTP id a640c23a62f3a-aa5359144f5mr387240666b.16.1732445492516;
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa53d1e1279sm129418466b.162.2024.11.24.02.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:51:32 -0800 (PST)
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
Subject: [PATCH v4 09/10] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Sun, 24 Nov 2024 11:51:46 +0100
Message-ID: <8deccbd7ab8915957342a097410473445987b044.1732444746.git.andrea.porta@suse.com>
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 6e5a984c1d4e..b00261992b71 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -38,6 +38,13 @@ clk_emmc2: clk-emmc2 {
 			clock-frequency = <200000000>;
 			clock-output-names = "emmc2-clock";
 		};
+
+		clk_rp1_xosc: clock-50000000 {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-output-names = "rp1-xosc";
+			clock-frequency = <50000000>;
+		};
 	};
 
 	cpus: cpus {
-- 
2.35.3

