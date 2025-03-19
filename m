Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 915E4221556
	for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 21:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742421107; cv=none; b=smSYRGHzt9/+NFFH0/1hlykXGEbx1HRPVdiq3C6bPknXLxvSa3U0E8GbflJQHz3UtNDzBVIxT6brRdNmLnWNyELASv2Mv6+DQKLSxc07se1uCeVEHOvsDCAU48J98yZs/FWpD8PcbMk+Fx2LGrPWI2HmnivHgybtjwK9wQhoDUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742421107; c=relaxed/simple;
	bh=ZHGs6I7q3Tsyi9kzoh4U5cxC19XY6HnWZ9uwmmvUT2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GxrFbDHxTZok39BuGmOFflEuHb2ONaf3E/+VENILB/xpo2RXbQoVQeEzlvxbKAOrmnuHAiVipTUzPdZm3/GXudcAImw/5F1rV0oalS4w3XarkpEp6c2T6vG8XwqlbzchIMGwyOeCS5QjGgy+16nplUMdnx5Qhqbf/jB6QzwGojo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=P5V1HG+u; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="P5V1HG+u"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso35370466b.3
        for <linux-clk@vger.kernel.org>; Wed, 19 Mar 2025 14:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742421100; x=1743025900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hon0A+RaNlvqPfqyKNkIXyr+XGvXZKWonIIqQqeswT0=;
        b=P5V1HG+ulPDbgraGKjpTHEUqniY1hrRZcEWRfY5LXZCbLbV1qm1sJs9Z+YUkaW7OLW
         Wo4HnKDwoRzDrNNL7XHWZnjSJ4726aJfMsGKc9rQDK89HH6rW+oAGqycuujxOAeMJoNB
         clSXIA5VC1S0ZcR+quBpJef8B4mTb3PQuUouXFfB1X/raCnWP7esAUa1GkPL2xB3sSTs
         DD4waHVdpUreOlQfYAaEPDSUWi87WnmmywL8R+lT1cV19iBx1sSx8BtTjQQ61xm/mWoA
         LvS+f65F9K+ghEt2BA1HaLbLKhXAbVdZbyTIiuz7HuDwscIJm2NuesiE4A9DUoIXgSJ/
         acag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742421100; x=1743025900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hon0A+RaNlvqPfqyKNkIXyr+XGvXZKWonIIqQqeswT0=;
        b=vJLvK6cOdmq75s2mzCKP63xdf7+TRXxBJaBq3hHPaKbyzs0EkUBOHBU89vUXUyrdJf
         elkOqk5RsctXEG6tupxuDQM6aPH1xUK/KAU1oXWxlpITVX42xLqKUQgA8g4R5V5bCyzm
         biOPUp1QoGQ7yWh9tN5i73RJlVa7b+GIN7N6O1zrwx1kriaaIUBVrhLd/EnS9wHZTr0Q
         nh2f1GUBFtnbXL14hPQeDefplCS8/8BR60gOfYva9mVNZ5hWHZPsJGPps+T2KWPIdct0
         inYWmyaX+eVHWHsvUK660MzUvTdfew2ZMbLez1PzbQQR7la2Ot8vQTvrUKVIQUBrzycS
         Z3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCU1IgGMuLDCRw0UfywMZ0icseZHJyqc/gi/f3sg645Vt8O9IMVdvnmsSTGwiw/GCn2mHLrMDUnp7X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7rQiMJMj3Ky0PCKbiM1T1r4cMbtes6cH5cvfjxb65qp5+pJ1U
	jRGe6OshdVnqDOP+iz8pK8DmXrGWM2T5o3Nev2cdkOtMnkQWGkLJWgxGs9Bwdik=
X-Gm-Gg: ASbGncugz2q/sPDMtwKEBFwh26ytSp3tulTGP2LUd4SuZYbBMDNiVseHQWEFVl1sPxo
	qPRAimCK5M3iMbAZRZSXJLKYje2bkMcj2YDoqqWsIVjJSKD+puF7BhOFOYEDL2SVJQ4p1D7Rnak
	VuanpntEn7oIpnzxeQbv8WzaD2EsuW+sJC4Tligev+3dNCPQpzmk/C9mpakv83NGIPLJ634bMIG
	ogY5EtMgkayvfKgexQSy7iCl0KNjx8HEvDSGZsWowet6X9/frTWEdumuVEEbxKZxI0vLNdkR55N
	P6JDZS+jwMX2MG/5uvMFbX2+2NwZf+N+td+ZTWzlluFCUjlanXMb4PxfjveGUZofsBMOEVqxNuH
	kztpHvqnmBw==
X-Google-Smtp-Source: AGHT+IEubZjv6HNcMkLRF8KIKKnDt5E7yfE5umLCedVB6lCh54dmHwyuBtrf8bjfetPJOMQZhmUQZw==
X-Received: by 2002:a17:907:96a8:b0:ac1:e1da:8744 with SMTP id a640c23a62f3a-ac3b7ed0692mr400259166b.38.1742421099920;
        Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
Received: from localhost (host-87-4-238-14.retail.telecomitalia.it. [87.4.238.14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3149ced82sm1045348366b.123.2025.03.19.14.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 14:51:39 -0700 (PDT)
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
Subject: [PATCH v8 13/13] arm64: defconfig: Enable OF_OVERLAY option
Date: Wed, 19 Mar 2025 22:52:34 +0100
Message-ID: <9d5b41bf6d1565f0de96c7c1680bd404cba40189.1742418429.git.andrea.porta@suse.com>
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

The RP1 driver uses the infrastructure enabled by OF_OVERLAY config
option. Enable that option in defconfig in order to produce a kernel
usable on RaspberryPi5 avoiding to enable it separately.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
The following metrics should help to decide whether this patch is
acceptable or not. The defconfig kernel with CONFIG_OF_OVERLAY=y
added (wrt to the defconfig one without that set) has:

- same uncompressed kernel image size (due to ELF section alignment I guess)

- ~7Kb bigger Image.gz

- 3 new modules (all related to RP1, i.e.: clk-rp1, pinctrl-rp1 and rp1-pci)

- 27 added symbols, of which 5 exported
 
hoping this is enough to gather a rough idea of the impact.
Please note that OF_OVERLAY has to be defined in a way or another,
otherwise the RP1 driver won't work correctly in case the dtb overlay
embedded into the driver is used.
Another way would be to add a phony target to the arm64 makefile which
just add that config option to the target.
---
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

