Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB1722F175
	for <linux-clk@vger.kernel.org>; Fri,  7 Feb 2025 21:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738963875; cv=none; b=hPtHgMrd5D35guX3RkQ2A9kDhEDAJSeciQXP2sR5UnvOmy9sVVqYHzWzcq2a0ldhtp2GokpGLZ9bfMO4AnCT4vIDhqFK8nYzbJosBf0wWiF6MhTe99J+ErcJqgAzdp3zKvTdqHtN2CO641jFCOY3AJ8vI7qnWCDP+Kv5Bkj8ib4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738963875; c=relaxed/simple;
	bh=5diM764rlIrZ33bn0o7GEofG1BlmyM+xQV0fM6MfU5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uiz1u41TgZ7aOiegtMsVijVVHSQkXAF2scaUNsVkt1leu3uqXH1/OyBgvuxTnaAd531MS2lAva1MqUjrt5wzGsMn5oWON+h7k5L2Kx9rhz53ZjIZQ2jH+1DrVhMWtb1DGBcoXFnR45Jz00fvatYHXF0vZzkxm5HAgxPM/cb8jrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rx+qiwG5; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rx+qiwG5"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf3c3c104fso452759766b.1
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2025 13:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738963871; x=1739568671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=Rx+qiwG5aW2JUWXPgHmm6QUqupktcHrf/QTNSpoAR2oYEwiA8hjBzndbhKx/znYEhp
         pSJPvLMiqtyNhuXZL90dr6S8Q1lYhNpBxYMVQMTY2GZ3Xn73ETKqH88/Rq6qFnM/c4ll
         lWQNkJk/0oT8KQSlQ3mhuJyS+LJB0SwwfUVbXxipQat8RdDXRc7oIubD8M7RCNve/G2e
         vn8X6jdRZob/MgVM5+2F2r8/H0CRn9z2phFNgk7H0DlE6hNwh4lBEkzcMwLkBqI9yjMq
         Rx6BsUum+FFU6KKx6qJJ26oFp4zVcbi4Vb9Myd94D6o13lLxYU4wldsqChXEK4aErGwK
         SN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738963871; x=1739568671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3BopDih7yHOpwj2R0KkzxFkHGfVydC8fjj8lntQcg48=;
        b=iyq1TmBk+MdyRjFKbjTxZ7H3ykFQ9njkqopKtWuFV1JHtJLgrXO9vQs2xTa6+B53Ie
         0chbZ3aUPALhnWKkDYBGfxHGOaHWbu0UQfu6DTXc2cTWxLkMyQ0UjNbDQcUOglouYqj8
         G/0YBdZxzx/IhgTL185gU6KDTnqwccu0lGqPYri5oIwbamr5sOJhNlJN0pWxuY5SwvFf
         BgZ2YywpaMYYd9J13Qa7D4Jvm/uFULfsDqmSWELob2Rhw2zc+ZnL4TgfYbxyOGOygiQB
         okZjeVU1AdzH7qkrl8sK8CkhRrhDuJSmf9e27xukd87uAa1+xgzhihjJG/S47jsjGw9m
         /qKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrM3sfzTASiTuOadxY6059bSUru2DqptUGH/CKRQUEfD5r+lyHRDF/sRUrRxJkyGnTOdt5wevmLUw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4BE4GPQGNhhp2+Bej9yPJyZNnQ7N3JvpgOObI8zudzPc+RfKE
	iyDRHzpjJLrxhrqtzukvElKT+u5HeDD/bfhAAjqUjw50i75k3m8RFSq7Iap7pKs=
X-Gm-Gg: ASbGnctdz1aPv8uSv3mdJXqryZnLsaxcO9N0lneL5GbLgimZ+ZOM243iKQVq0SmPjQ/
	w7CDffR90shIq4+ISeIDXTaMKM3AY7RXOZRn8tMRN73m/PXW+g4DzJWqv9rENgZogrNTp14UGx9
	TE2tyjj86+kCrivJwhcoEBvKpaZOsvtIhBbK5Sbr4ovTRjq3IWgGTf0R1RxXRHlMIqKQAdHHAeO
	IOOsPWLKIeWrtEw1u04GBPQpEbiJ/HpRy8SavuggwWTR5GYniaENVWHdkHzes3Kpl4kEvnGfpHN
	kRgqbvq9b/PbNGPYKYmgHmOCPNaZtNGyjewqD2BguiHY9q3d+NPR70lCQTE=
X-Google-Smtp-Source: AGHT+IGwqrzJl2/ax1uP9MqR28vcjX4PkKe1oIs/IEEQv3qf1oee6es3/KbGoTL6JWHdxGwK20xnJw==
X-Received: by 2002:a17:907:c285:b0:ab6:ef94:6054 with SMTP id a640c23a62f3a-ab789b2886fmr568618966b.33.1738963870964;
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
Received: from localhost (host-79-41-239-37.retail.telecomitalia.it. [79.41.239.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77365fc7dsm330339066b.182.2025.02.07.13.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 13:31:10 -0800 (PST)
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
Subject: [PATCH v7 11/11] arm64: defconfig: Enable OF_OVERLAY option
Date: Fri,  7 Feb 2025 22:31:51 +0100
Message-ID: <49da5d0cf961fef23a1622253825443eb51d660d.1738963156.git.andrea.porta@suse.com>
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
This patch is *OPTIONAL* since I'm not sure if OF_OVERLAY is a desirable
feature to have enabled by default. It would be advisable to have it included
so that 'make defconfig' can produce a kernel config that will work out
of the box on Rpi5, otherwise OF_OVERLAY has to be enabled separately.

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index cc70793e97ef..ca492fbd2773 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1643,6 +1643,7 @@ CONFIG_FPGA_BRIDGE=m
 CONFIG_ALTERA_FREEZE_BRIDGE=m
 CONFIG_FPGA_REGION=m
 CONFIG_OF_FPGA_REGION=m
+CONFIG_OF_OVERLAY=y
 CONFIG_TEE=y
 CONFIG_OPTEE=y
 CONFIG_MUX_GPIO=m
-- 
2.35.3

