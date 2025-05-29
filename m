Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C155D28FA8A
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 10:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748515698; cv=none; b=HGPvGE60gzzowmj9/dP17Exj7tzK63v8uleFurnZRDz0QvTLUUK4HbdTaLJ2SlZ1cbneo6xgIrIVNKonFD4qClSyueidbBnGYcierH5CAY4miJ47+orIqCyVU7prWYmuii5JD6RCh92PMR5ISQWVs0R7r54PRhadwfFwEAgpJ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748515698; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ogf7fBrgditU1QdEJebVFuuVnKZ7MaDyIQ6wsWMwcc3eGbgCtJkdmuSPtIeHkh7WGPwdmhyjH2jtOfgnPI81clN5vuuUHkJCvMicywZlGgga4gU4HdD2yABSzFH2tT/pPDsNI5xx3SE36eKAiB0TN9D23BDDfJU8qr4ckg9ciok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Q3CtZRCJ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Q3CtZRCJ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-acb39c45b4eso106472666b.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 03:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748515694; x=1749120494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=Q3CtZRCJowoXIw9k5V+3iZoCTdugPF58iaqdfcqz80heP0XsjGP0ABOSveurgOuHYE
         GHm89aeuaU7zghhvq9/WpfhwyhDFWfsHIiBIpUc8JZcguiJTz3BJ1cqwpyGZS8dhzP4F
         drGimBhYTxl3t3ALgQMncORgvKX9iE4HO4/S45E822yfoGb2EPnmH0fCz3x0DD5MAOSc
         ezPmAq4UAUU+JbT7igdYJmMiAWShIssFwVNUlFlIUPLwewCpL/bC8H75h8z21TcPBl2z
         77ZhBj0KvUfYH9+5oOfpBpMnenj70rKWikvl9R0Pp8fwbkUS1ju5hH2DHoIozYrLH1Gd
         xKSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748515694; x=1749120494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=URWxAv1aSwMUXX/xLeZo1hv0dbKAQYTHftXJnFUJClZHOhuabP52ShnFhWRvS7OfJu
         I0RbfKEB8wuv5tlgHG/X9apOo0fSrdXyJVCH9Kxv12bNgJtUTfpZmLhLluDGUzlalOkG
         F9Z+YUPei7jLpPjaR2GJOkSjN5panosgN5cMyLUtR64DJ4yMoY4XoZsMIMj01w6vI7jH
         rbsYGG1Qcg/1iPx8njpZcL9gAv5QHbJiPwFEDtxPjGzSEg5gael0JXeZpIv44t4B1xIQ
         vgthDUz11+dkjnUVZdpI42q4IZ2GmhNjEsWq453ay3wpDTuCNC786LFwZ8XcJc3EOg4v
         oEVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVA3afB42M1PVD3eCf/fXVQyWQ392kn1wAkW4uTbIIh2lvMMCjoijNsnak3WSq/V2CNY0EqmIB5MYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6FVFteuFzrfhgRuJV4Naw3F0atmBOKsOGNrgJFK8FjEbCI7Xi
	lEPSt2j5Lh4lGYUmPy+dLb3PavgeN8Ax0CB3KruQepeSOPGxcZwlofa6HSUY8sP6yUo=
X-Gm-Gg: ASbGncvGcSPjG5uCLtvTe+YfkJ+5DcY1OhLdCzLvWXrB73LQHXCWxFDoquE5epIHl2Y
	eCSIME5ivR7YTLvzVz0hQJdJgzHONu3eEMiI18ln6BLVbCTE0DMkXuL2EwnIwJ+v5gihFZEBA0D
	gz4EeXHRK3NGkOZyXgVYoOuEkR3yWy2Vt/Ss5eP7ebKRL2KOXIrDpuANQSXuIjycQZ07pB9IU0s
	4MnYEsTk0qwCSBysZpaqxwDtE8+Y0bqslwtwaIV0VUimycaGOSScRMzyQX1Bct+rplFyx6N2aLN
	lvJARM3550jDzgJE4i+QIvG41UjNbVg8iFFmAd4ixAZi1kSWrsuI8lxKX75VpYcoiYQYrh19gqn
	dYQS5TqUAMm2HPxLVIDjZaQ==
X-Google-Smtp-Source: AGHT+IFh2Bjt/nqjLOv5kZdMBtyzXg8Cp6AwiLw6gyh2kIz8WiLSbkCwXlnCYcseB95A5qV9519CkQ==
X-Received: by 2002:a17:906:c152:b0:aca:c38d:fef0 with SMTP id a640c23a62f3a-ad8a1da7029mr467304966b.0.1748515693881;
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad6aa17sm120147166b.175.2025.05.29.03.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 03:48:13 -0700 (PDT)
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
Subject: [PATCH v10] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 12:49:30 +0200
Message-ID: <20250529104940.23053-8-andrea.porta@suse.com>
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

Raspberry Pi RP1 is a southbridge PCIe device which embeds several
peripherals.
Add a new section to cover the main RP1 driver, DTS and specific
subperipherals (such as clock and pinconf/pinmux/gpio controller).

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2b16ba4eb1ce..2add073f5bdf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20197,6 +20197,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/media/raspberrypi,rp1-cfe.yaml
 F:	drivers/media/platform/raspberrypi/rp1-cfe/
 
+RASPBERRY PI RP1 PCI DRIVER
+M:	Andrea della Porta <andrea.porta@suse.com>
+S:	Maintained
+F:	arch/arm64/boot/dts/broadcom/rp1*.dts*
+F:	drivers/clk/clk-rp1.c
+F:	drivers/misc/rp1/
+F:	drivers/pinctrl/pinctrl-rp1.c
+
 RC-CORE / LIRC FRAMEWORK
 M:	Sean Young <sean@mess.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.3

