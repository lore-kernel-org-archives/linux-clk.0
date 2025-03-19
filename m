Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B7C321D3C5
	for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421104; cv=none; b=Wgjx07VBP/EHyj0xDHPPE2JKOa0YSMIHB2//wG27QL4kIfDFsAmRxF+PgHRb4i4jI5YseYCH9iUm5T8tQsaORYJFURHf9yGhKRRIomZ6t/89fC+2lSS4fwsqEsWWTM1ovsPNbedlrlXUTUZaQldVHnX7MB3yIJ+inHgvJlPcn50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421104; c=relaxed/simple;
	bh=JzyPc2eVnFcS+iQ42poNnWKrz0ZGOrBKiISFuXs6lEU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HnSvfDJGBxHJ1gt/j50eObjxr0WcL9CZqRyBtTzQBuvORc1wrwusHPYZ6QPJkpc91UTE4JzKASLF0pex640u/g/Ls1vsY3dyaZK2za7rcH/fkTY5+Hm3P6csU1aGPFsQDHqfsetZRwoj3HsQrydEHQ0n0bo9hNX4z8FZQvrTpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DMu62Dss; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DMu62Dss"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so22473166b.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 14:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421096; x=1743025896; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9zRknf0FjRBxpKbN0jDt6ZYvci9VpLgXRRZUvC1VBu0=;
        b=DMu62DssN865n7qN0w3agvOKzw4si7sKsGDgEcT1ZdPGwrsgmNu2JF4UuMXA05iKxK
         eNiiboihB4sUu/yVFcvqt4QlXmhqb2gNgeT1+pPem/AgfIw+iCuLiI0oHB1eK10LHLOe
         aC+EhYOJ6m2oivCgmCmw7akxeWulSCvkb/6HqSbSGxiWNlIogEck457tAUG6Hnajf66o
         ba+5YMak8xA01pXK5uOrdCZmY9ydq+NMvTC2w2o5iD7SngG4bABTuT/4Yf7MihSx85UT
         5Z1FV23ZdW2BpkE4+IW6iqgTnhaeUvKd0N5IddoY0Ju+ly+f62ZZqoti030UazZRzXIq
         Tl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421096; x=1743025896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9zRknf0FjRBxpKbN0jDt6ZYvci9VpLgXRRZUvC1VBu0=;
        b=tDHQ1DqV5Y1LhXPsJtyVM17d0IWjQOtV9Zi8zYptsrQixX5Gtr4UEufc9OKpwooatY
         aCTqxD5W3HdyV89okYb4GapFYD9HAKJSZHnm/dBrdO+1lWctWHmzIaW+cDVj+fZU+yVb
         hks7KDUHEFygTkeJQaKU03ElS3uOb4Vw/2yWMn0LpJ0Mx9OznbI6TjFYOY7+dfDImceR
         q/j3EbAxburSXeLYXo9uZ7bsUTkDqLGL/RMJuVMxmFSAxRHOSQL5qSYD75lO2JJb+Ljt
         rYO61N3k4KUy1u6uPBxkGWPCoAIBhroD7IoSgg7LtgT0qgFcD1Krpoo/UJ7xEvnyaaoJ
         gsrg==
X-Forwarded-Encrypted: i=1; AJvYcCUn9gjaOMX6ca2EJlZ4qqz+AQ7zpoQZBh4TVK5aE03FKkLgI8yfu9K1fsaxIsI6VqizH+z8aX+XVQQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqpVFrJJwKHuHkw3ZmiStGOTdPD5GZ2x8g2wqLM71/km4T8hMA
	lUw4oMBWN594z2/hPR37UlXiI8GIbFRQe+HAbrU8XH9vPjJLi/q5SIsOfjiZt28=
X-Gm-Gg: ASbGncul5N7bmEV8SI5rpDkivOekhdKjzAF8giKAJNEyWB/dGFKuMlJRim6ohZ++yyO
	+tBLf9V+6aLdm5gnRUAz7o8qxBfumd2OWgLNryXyuLsMLxwaYtVm9zeazrWxaEY90aD9ts7b41H
	eC/rrwQot8tMUMpBXp5AbfibQfJyuLBNsnyujArPqpvXB1kqRV0DxmeIvmskNXKksPmI0O22xXP
	zxxvwlVxgOjKvoZX05aDgCvOrAQyPgMLV5H5uHqTQfx0sq4W6QR5nid+rshe5Gfky+YaBJyo68f
	lNy4lXKK+WFX/2rYBlDEcabmAcYpYu4v/qcKN2pK5KGGbA93uKIuSmf0z05cAAeNKQXeQMPRUMS
	CCEc0T6Ez2Q==
X-Google-Smtp-Source: AGHT+IGw/NXcD0AevUkNs1VSBpy8/11q8cX74Bk4rrh1yk8V0z4OkbmrlYn4A+xrU8r1pLSBvS/MMQ==
X-Received: by 2002:a17:907:ba0c:b0:ac0:b05:f0c0 with SMTP id a640c23a62f3a-ac3b7a9504cmr543431466b.1.1742421096325;
        Wed, 19 Mar 2025 14:51:36 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa5a46sm1057645266b.181.2025.03.19.14.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:35 -0700 (PDT)
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
	kernel-list@raspberrypi.com
Subject: [PATCH v8 10/13] arm64: dts: Add overlay for RP1 device
Date: Wed, 19 Mar 2025 22:52:31 +0100
Message-ID: <ab9ab3536baf5fdf6016f2a01044f00034189291.1742418429.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1742418429.git.andrea.porta@suse.com>
References: <cover.1742418429.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch can be considered optional, since it fills just the second
scenario as detailed in [1], which is the RP1 DT node loaded from a dtb
overlay by the FW at early boot stage.
This may be useful for debug purpose, but as such not strictly necessary.

[1] https://lore.kernel.org/all/CAMEGJJ0f4YUgdWBhxvQ_dquZHztve9KO7pvQjoDWJ3=zd3cgcg@mail.gmail.com/#t
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 4836c6da5bee..58293f9c16ab 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -13,7 +13,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
 			      bcm2837-rpi-3-b.dtb \
 			      bcm2837-rpi-3-b-plus.dtb \
 			      bcm2837-rpi-cm3-io3.dtb \
-			      bcm2837-rpi-zero-2-w.dtb
+			      bcm2837-rpi-zero-2-w.dtb \
+			      rp1.dtbo
 
 subdir-y	+= bcmbca
 subdir-y	+= northstar2
diff --git a/arch/arm64/boot/dts/broadcom/rp1.dtso b/arch/arm64/boot/dts/broadcom/rp1.dtso
new file mode 100644
index 000000000000..ab4f146d22c0
--- /dev/null
+++ b/arch/arm64/boot/dts/broadcom/rp1.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+/plugin/;
+
+&pcie2 {
+	#address-cells = <3>;
+	#size-cells = <2>;
+
+	#include "rp1-nexus.dtsi"
+};
-- 
2.35.3

