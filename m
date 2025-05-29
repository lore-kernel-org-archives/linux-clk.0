Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0579B22D4FA
	for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 12:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748522569; cv=none; b=FpJVszc/ivcjAbPK2mo2GgcGlWErz908D/UHQGFNwCwF1RnoE+GUunvekhZ41EC7pLzsab1jkYS678JJnpPOVupRFDmOjXVwSciyaToOYWy6ZYUxOWzbNrARYtFWsVKAAKMjbr0F2gGNC4NYCIfLdh8+VLbQm3fvQUaeUJRRhiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748522569; c=relaxed/simple;
	bh=Cxv3DdNSTbG6mkWW+XlQDzM5M3k//FCq7uG/9MGjWvM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cH3SwF3XeApnPkorgrmwTVoe/Rtx06ZnYr6z6YCpx4rysDpVvVXvWCTr4Nj8jQ9TtXkckhWGhlUclk3oZ4aJ6/HTL5TZACQMVS/wkACKErrSwAsrXxF1qZldDq9btpz7VKMYuhDTI8lQrGW6qaO+zFQSi/jsH+MOlRtKpHp43lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZS5zncOf; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZS5zncOf"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-601f278369bso1675528a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 May 2025 05:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1748522565; x=1749127365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=ZS5zncOfC+K7c9w1dnbJRv6ieLVSoQAPrRkjhVg60LhgyGuVHQ7FO+jREy4JVcZsZf
         wUaohrPRRPCxex9EznSVNEWLE297C90KV73nVMKFqMaUoXwzqB8HYsvLOM2oQnZ42N0y
         6VvAp4BryHzZQRTqOPHh6aIIX/Kuue8Sx7e/m3GEhZrkHVMg4ABmRKtP8g20NBD8F1MG
         NmGmMZBi2Lc4wyI0g4kMyB3Z5QaVpDoORuJbmrAxi8lMGmRhAcjcyAzE91gPRfXIHVFE
         a7IMY9I+Z0xXgbWV5YLC3bWMRrX65sl2KAtNegTxnaabqfoVoM/fCPEjzxbOzP0NP+NR
         iR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748522565; x=1749127365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i8LMEHYmovrRN8zYWQwYy5+2ddqvSDMDQcnZraZcEHI=;
        b=AHGkttO3/yzfpaUiJWve9GK/OSepvEPe3A5hsSRjN0eSdHKG84rdLpoELGWetca6v7
         DSz1/XLBTnBuuII+WmjqjgKBf1FsEoo7i8MgmXxRtE2W7oZdEdn192OVRg/XM6CpPQnc
         itY03aXuqtNnzpY/cMYdjRYj/X66Goe5Eqkj7RvblE7pgXli7ahAw07FdQ9LUCKHF2zP
         OIJ7FCCSU7C/MUTmSnr9U6EXaoB1JgDpBr5PBFYZWPESKFlRfqMTOhdV7wn0zGWWBbQX
         sYCcYtiNkGhIcEwAaLx+thjO5VpdKjrIfVCalIz9z/CniI80O1V00akuZaGRjCaj1Xor
         RUgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmHfOSShJ0Dv7kcZ3wlmJvqPjjiIHdqMX4KsMNro3KluFUMVy+bInOfKGYB9XVww0jc+JrZ3cZ4qs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS3lKB2XU7vAP4VWwuy1F8whc+NNwSrBKrSBet/zMvzd9YuwQu
	JIv9euQzEMdWJ4fPuJe/H3stNeYGUCwJ8QQHTQ/fOivbLCLnLRRjuLFkD9fx4vUx+p8=
X-Gm-Gg: ASbGncu4X/sgYPgWW72UgyR/At3zdmOuWMR9/NMaDFdrhJgGnAUZv8WJQBM7yWqrh06
	PZifJH81x61zMmjDYych/SjQJBN4+kVACHvxCtw16GDA7ijcuf1w2hownHDLZ5/Q2yp9NgUYxww
	wL3l98ZArk5xBQrqY0HFkKt4Th7oO0L603aj3X7LPDsZD2SZ5wFTPFsWn1FeSEZvtL7R8HZS0uU
	znwrPNLWaqT4rpoeYMVBLWFHZzZM00LhFsSd4RD52ZHtEV+ESjZ3VTckSsVedORw3z+LdIHDmVE
	6i3n1R3vI/J5t3AfZkKl8hE6JARagN8m3eftqXFjuxuf6oSax9Jn8ROnUjuqzNcC8ookkeTZLCZ
	a8O5xe94Pv6nWzAL12mYGX+2zBjjGk4Ng
X-Google-Smtp-Source: AGHT+IGSKPwPkYLca5xt4DTsp41XrvIAXEH42/7GBMAHBHwSDsKU5tUb2elBTXwGWSigWuI5ixWpNw==
X-Received: by 2002:a17:907:72cb:b0:ad8:9909:20a3 with SMTP id a640c23a62f3a-ad8a1fcd782mr609032066b.43.1748522564992;
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
Received: from localhost (host-87-21-228-106.retail.telecomitalia.it. [87.21.228.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d7fed3dsm139572166b.12.2025.05.29.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 05:42:44 -0700 (PDT)
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
Subject: [PATCH v11 13/13] MAINTAINERS: add Raspberry Pi RP1 section
Date: Thu, 29 May 2025 14:44:02 +0200
Message-ID: <20250529124412.26311-8-andrea.porta@suse.com>
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

