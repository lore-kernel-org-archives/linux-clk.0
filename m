Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5242223335
	for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 21:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750715095; cv=none; b=IdrM5LfXWgrR8EcoGz0MO41UuptRDOMmIVXK5/K9GeM8lRjvoAcXH0JQFMM25LlX7TlIK4TA8PNfBDxge+WNbdnQqwoKJmwEjqyOOKsdP8sFwduc702hkniGhyCYxUjPX6LbtkNo3v4Dni3sKnaUKLGCET7Ttwgi+25+FeibJ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750715095; c=relaxed/simple;
	bh=HqA16LR6HAWvdlEy3wx9eZOBIMB7ZcD4My374Vzpq4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=a2CPFIMg5fQnRhfOY1FWJriGM5DG7iji2IwunGnIShXHBasvBKJSwNCvY7KH8DOiN4Ct2u3Q8ptBRDs2N7PTdxweL6AOMpnH1nWmCO8/2Y2U6rdo2mdCWT63ckGwMUGLA2YGW6WAF3UD6OVZtLTc6L8S8Lit2syEPDpYFGPR2kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rcj+I9n6; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rcj+I9n6"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6084dfb4cd5so11099385a12.0
        for <linux-clk@vger.kernel.org>; Mon, 23 Jun 2025 14:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750715092; x=1751319892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=Rcj+I9n6/EFsI+vmFncrrNcRdNIfIA7o5h7TRp/9WTye5ZWZApO66hmwdk2THD9tSw
         zV90QuwmYmyio1L1m/JvPHuzQYdwpRHUXVmwv85munbhL02OmDrjdj4dDb1HIbCgEc+T
         W4cwZKnLdaiOmJ1WVsDfFbEADG6msDZ+zGHHU8R2H8qj0Wh8vExF3j4Lvu+cErjGgDlb
         BfH/3S6/4JuYBszWG6ISV5JQPf9Zu7YkCySy9I80v/ih+KtN+oQDy2Mez+3BY1aJc8Ls
         xlIerZ3PVudz+L63s/J2AsUM0wgT8295jicFY2Kvid4Rse8NBY8ckObsENKtftBvBQWR
         4t0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750715092; x=1751319892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tECQ70x1JM1SCckuRST7a9aJYN9UOBuJJP77Z07Vo14=;
        b=CSI3GrShl4KKgTDekZBTNBfoBVlgOx/leGY0GWsWKjG+OE9J2FplwIS2RG/fhNw5wZ
         T9VmNFD0q05CjeefsZsWMmvtRJXidwMgg4hu8GFY8mKt0Yz/NnHJzw39PqCQeiyEIrYX
         fVW+8v6YkJUrSZ5K7CbN2wymNO3KZ2DjMpGajqwpZYK595mHtHpLkNA5X8nS4CQaCCBT
         aqraYfQNh1oAc96JVrXCUmJh6JWiG0twCLalEvEyvjXMwkGeYg854XA49DN1VRRT/pif
         1dO72vNWgTAe9ndHe8RK878VK9awd/VSZBY2N2Bs65wFvLuUwPufXXD16Ndf6dZhMohD
         wqhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7UqJej55zP+UhADk6mQGhvJ8COLttl7YrT2CFJq0zbbxfP5xBiofY9ZGQatwXHeBHFDOKL1ETlzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xCz3t2GuFYQpL6+sTYcU0CU4qHLkdOJc6Gd4p2qGspt5C3jd
	gSnYPMvgLVwe2EwDYmCAivQC5JIHsyEmdBTLNTFoet+zRhV3IAIVdohriInsbce82uQ=
X-Gm-Gg: ASbGnct4T2SPrGzhtdgfCbrjXHvQagFtosbl1RXA+dNwy7rxd6adqKC1SPo1RnlWBDn
	FDyYB7duzejDeaUGS/JNQGNwzbWr3iNY4TIUzHJu3C4kahd4G3rN+NZxP7XpCfeVMWYjUYXkwAl
	QGFw8gFwhSs/JFOhAX+AU01gdSytQCXxCCI1L6yhoytNyv3m7fBNCIbfx54ALCRhuiKblzJFI4Y
	92qGgSFH9O9WKShTfvD28Uwe4j5cGO+3jBUzFUbFUCwOTzslh3PU3tHKW2fMbeKl+xrGFGrUMuD
	Kwi1SOY0dcU9Q38AehpeNIhehaNHB96g6R+rgj9NMSWx0HR/Vry/yRphyfuILr6400wP/eiyqKT
	M3d2BzL+bBsiqyfJ0bOku+wa1RJAsYghUYzuhg+vKhFQ=
X-Google-Smtp-Source: AGHT+IFCBGEMw6diC/0MRBmRK+mfhHRRzOPyJ8RG9tL1So/53qQwBJoVq147ne0xzxnIzQxsdYUCdw==
X-Received: by 2002:a17:906:d7c6:b0:adf:3cb9:e3b9 with SMTP id a640c23a62f3a-ae0a71f4c6fmr113325866b.3.1750715091959;
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
Received: from localhost (host-79-23-237-223.retail.telecomitalia.it. [79.23.237.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0540849a5sm778326766b.99.2025.06.23.14.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 14:44:51 -0700 (PDT)
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
Subject: [PATCH v2 stblinux/next 1/2] dt-bindings: clock: rp1: Add missing MIPI DSI defines
Date: Mon, 23 Jun 2025 23:46:27 +0200
Message-ID: <c20066500908db854aa4816b40e956296bab526a.1750714412.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declare the positional index for the RP1 MIPI clocks.

Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 include/dt-bindings/clock/raspberrypi,rp1-clocks.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
index 248efb895f35..7915fb8197bf 100644
--- a/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
+++ b/include/dt-bindings/clock/raspberrypi,rp1-clocks.h
@@ -58,4 +58,8 @@
 #define RP1_PLL_VIDEO_PRI_PH		43
 #define RP1_PLL_AUDIO_TERN		44
 
+/* MIPI clocks managed by the DSI driver */
+#define RP1_CLK_MIPI0_DSI_BYTECLOCK	45
+#define RP1_CLK_MIPI1_DSI_BYTECLOCK	46
+
 #endif
-- 
2.35.3

