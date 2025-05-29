Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A122DA04
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 13:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748526572; cv=none; b=kyfkSAxSFYMfQNDGKXC5L148P6I/0XxO9fjFY22t5t/fT09yOpNKqEe6qQOW4uPaBOx/eWbNz+U7HSFKiIz2VSjzEuhPWjCbpHK+6Uo7ar2J/A6J49ECT+9WL4aAZ9iaYIFHj07tYeQ+sVcixXyy/LYMBXl/hDoCibCVgUIGodg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748526572; c=relaxed/simple;
	bh=e7L18GWSgyaQx+VyeKnctdC1G5/fpSrazf2H4MTEiJg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PDdJq4BcGDqkX/b/AEDuN1uTmQBkuuMaZJdaS9bqsLwerYz5PSbv9soL4fPz7e8NlLxiSFH84ULI7P1AS9GWS/0KQVNLqTTcONHl8j5WQW4jMalzZieq0CnhvwVdWRncHhyhphRAq5nTcCaVyAcG38VMSx1bsKBgNunnQ7X3K9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JGjzvJw3; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JGjzvJw3"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad5566ac13cso138610666b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 06:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748526568; x=1749131368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=JGjzvJw3+nuRvpt2PfYG+hCuvGaJQpoUMQvBk8zQGAt5ZiRT6sQm/pbVGdcQVXaHQi
         hl9APZs7Hef6GfDgGRota/TXN+9Ew0QgJJ/0/NSKPZgWWYw5D6JGitDNogdcwn5GZtvN
         eLBEwfDOmdWAm5ZJUfZ7hQkGVIJLQfJXTs3dFbwYYssueJ5HsfISb6rfgbgshAN/6Q+x
         +FcvsmUYltKuO92HHX4J7PImES33JEiQTAXK8G27xaOBT6qnsWPW2YBFNPr+GEV0eoNW
         n636Rv4iPh5ipC7kjzMygqVk3FnrS/AZ1xbD2taU02kVvOZVP5eDEtgkAPsqyxbzWnSc
         NHhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748526568; x=1749131368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ppscN5NV3cw5VQZVyMsIjJdGBSstz2S2TJqiSK9iSsw=;
        b=f8MB7QUNZkCeG8Is8+vs4bd57d7itQRzm76JjFnDfDPekntDUXrw5EZSxOi4mUdjOK
         gRzcuqld9odVRVCRAYozpLEWG6ATF65DhRwNwB5/5DYHRoSQDHvEnVM0ZhB15oVyjZw6
         FUjZ7uEBVh5+5bsOpkEs3fGYnbGMks/EUtqak/Ip/hkllc5rLj6rbYOAlrwDqcZswANT
         l5Ep4bMImtOsG4J2flpca4PxPiqXkswWTngT4TuSNwZyi2fIGJvnejewL2W9fpt1tiEV
         wfWcQhFs0/Suh1qOOf51ho/H5KztQLLa7Ew0GkwgMp375WI8VH8cvyI7nPyLeJZuJaYg
         kKcg==
X-Forwarded-Encrypted: i=1; AJvYcCUg+dd5jr16slDwW7hwsiLCBN0UMseVnVHHrswo1Oc3fc71QSFgqzRu24B8WbXeKg+p1r683DsLTOM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjkksYauePAPvaSlRuZ9qK46Fn44ArL0x25/4WClOpQ9ew9A40
	SWM5K04YkRAuCeAn1LcQV1GLzTrfi8WY5ZbEE6DmOlSLb/GVFSmQptjhcAZfwKMrA7o=
X-Gm-Gg: ASbGncswNJlxKBHuMOMXINIZwbTK1wRTPydqGDZ6lYJIADOL/Ny8acyj/jY5O+RIlUf
	Weqo605OXLaOwtHmIxpeO16IjkSMBvZkELbQGM0PujYlgxlvTKGmP0BTukR+Cq7oNY+ngYVhfC+
	3uIITUka/PQJ5GxIUdkMV0BNp/wfZlQaJpXCiMR5oxDhfbPvYBrbqSxFYFddGbSfQnZg/+zWXoX
	IwMtX7SUWfMIg3oBC12fyUhhAYdtqLD0bHErZ8QrDMx/MCYv1lbrlDMZr3Dv0Cjsj2ppm+xEYgq
	uuMt/tSps3Uy/izuQd/mNA8dZH4UyRkJF2qa6fHfrKtEX232GKphWbbOnUr4kyT2gJJd5AD8Vh2
	o9E8AJywiN7NeMAWxvaW5NQ==
X-Google-Smtp-Source: AGHT+IHauMo4PO8x+p2QJnQMGgglReuXaviinUw97Q2Scu+s04RkVaYUYy8ri/br/b6wUWptGayevA==
X-Received: by 2002:a17:907:3f9f:b0:ad8:9c97:c2da with SMTP id a640c23a62f3a-ad89c97c73bmr736928566b.40.1748526567679;
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e88csm149038466b.62.2025.05.29.06.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 06:49:27 -0700 (PDT)
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
Subject: [PATCH v12 10/13] arm64: dts: broadcom: Add overlay for RP1 device
Date: Thu, 29 May 2025 15:50:47 +0200
Message-ID: <20250529135052.28398-10-andrea.porta@suse.com>
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

Define the RP1 node in an overlay. The inclusion tree is
as follow (the arrow points to the includer):

                      rp1.dtso
                          ^
                          |
rp1-common.dtsi ----> rp1-nexus.dtsi

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 arch/arm64/boot/dts/broadcom/Makefile |  3 ++-
 arch/arm64/boot/dts/broadcom/rp1.dtso | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/rp1.dtso

diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
index 031875a277d7..83d45afc6588 100644
--- a/arch/arm64/boot/dts/broadcom/Makefile
+++ b/arch/arm64/boot/dts/broadcom/Makefile
@@ -14,7 +14,8 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
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

