Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B5C22E411
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 21:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963874; cv=none; b=mAz1Rzy5yJzkMBocSLlj8d085c+91Vtx27HvXXixfeFb1P4LoCI/tG9AmqHFYgEVgytoJgJr+wLyG3XQyghTLMSDaG38H69KjbshYj9xq6wdT3C+Ku0a+gWgwvOd+9QLK+iRVhwLDfLzXQL07I8ciLdvenAz0ikbjdxpHWas5TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963874; c=relaxed/simple;
	bh=VtQ1ljfmYtyXEA61aEiaZEeKdDz/H5SMisehIOwJ9No=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UtcwZtDhvVCnokDwPQ38jEbL5T/VBKeOlMKcenjdIeHfg7DWQN7T2Bwmp/lYzgQ8a+wAfALyZrcy/e3tdT4aAY4hbkncja/UlrVQZ04LSg5QBYp4I+82aY33ybJSlESbkLkRSa/sWDBB9sOYDPwR0+HNRMZOMBxkcgCY0LtRqMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XkxFHFuK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XkxFHFuK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaec111762bso608613866b.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 13:31:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963868; x=1739568668; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=XkxFHFuK/l9LvD5agP4n1Phkw4F9H+705BDsnlnkkZ/uslBVQPQtOxSDJbvlUEHlaU
         6AX5slyctm5J8ss92Qf2Puw427wTeAbihj4rFscP5I13rwsPLuv4iNakQQ0yXoY/Zog2
         PIHkQc/CUCILKbdma5Tfrb62k4qEbFtacTJqGrIlYWULrShf0dxZiMWaWebfGOK1CRsA
         x2SePYs6LyaYxlGm7JlcYGT2Auf/sTMck9amecpWg1t2a9P0FKD3NtGF0Jzv6KH7lzA3
         Qn7mPufNVBBB1ES2zaNgM8PCXFU3IK4yEGEfs7BVNsHVr0iXBiqCoH2G8E6bGidwwt6f
         fwDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963868; x=1739568668;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rB9s9VPJvR605hRqbfbYWWEdTsjP5s3VD85/JJVm1e8=;
        b=A27kglHzQFv6cJE2kt8qkHCI0ZI30vU4CarRc473ayfwS5DsooQCq2L9h6xlQNRmH4
         tbOi0oI5AbGWA6QFNKJJB/iUPFWAfdDTRWR3sFYPoGruq7oGjVcx4CJaTrP1I9nwdiqT
         LgEawG9JMfItAW/dpChGhrqxmO9xAHYM85kw3GZW5PQzcnDAya0JArwSWXg//chuGtFe
         67pBV3yb08G+KRpMZ9es8wj5vYE0BQSIlXn49QF6H+x1cbNee4M11JetGmSUtHNW1zxi
         ecRxc+VILOz5a98PNvBeHJDBmEV5/6UNNfQRyQ0xcoCdHujfzur22TcSTuRgOf1t8T81
         Tbnw==
X-Forwarded-Encrypted: i=1; AJvYcCVdFOYpEZVEIWlxk/EqeyLBamyu9gw9ImQ9iZYjYPENoY8Cy3dvTAk1oBP8YgzaLkCxxi0apb7LX3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxM4807K4DNHW7+w1nEL487r1/rqct1i1pU2TvpGfmnoeSCsPxb
	qIOSLyfYeNt4XGTU8/wxs4buE/ZQdwq/AeX1pjxLR8ipTuMldof6Yqfr67SIWts=
X-Gm-Gg: ASbGncsaM1iuTE1cfEQQ6fT4lNhrDCOsnp6PO4YHizLwpoWgieNLsgmzPRN/XWCAtHx
	bvyW7h5Z2f6snCB3id0SEBg4hoEQy362A+MRGPmSHdsqHxyEDiIY/EdT8c20wn3MPRUvIHU9Rlw
	kCFAbzfgQU5R4HqV09bWgJ4NdP5zjknZwVZrWzRRhKa6isgHh/q/e4esbjfuK2+jEjNs2cVZGGT
	GAbD14jloUnaMPnN3k/XC30fDcQSFWN6sP4Q+2tc8Myp3I+PeCmjjscfacfKqubymLiJlDn5uCl
	sCnDEwLGRSG4qAuI8cv2B9etbnnW30RXMSUu71ut5gvPGg508fiq60CyxuE=
X-Google-Smtp-Source: AGHT+IFnue8aM5uMyuzX6JhUGUVfjNquFfLUAy682QmcZWe7J/NUbnpi5Rbddmy7cdrZqcN/Fq3qvA==
X-Received: by 2002:a17:906:f5a4:b0:ab7:b08:dab2 with SMTP id a640c23a62f3a-ab789b39591mr578677566b.22.1738963868593;
        Fri, 07 Feb 2025 13:31:08 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab772f485dfsm333069866b.28.2025.02.07.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:07 -0800 (PST)
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
Subject: [PATCH v7 09/11] arm64: dts: bcm2712: Add external clock for RP1 chipset on Rpi5
Date: Fri,  7 Feb 2025 22:31:49 +0100
Message-ID: <d77f34885b21a1953a5a498d397432ef377bd6e6.1738963156.git.andrea.porta@suse.com>
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

The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
Add clk_rp1_xosc node to provide that.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index fbc56309660f..1850a575e708 100644
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

