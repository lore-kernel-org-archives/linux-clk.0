Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92EA518871E
	for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732442715; cv=none; b=O/6tjUBc2iqNh6q1xYaKPEnWkViLJqD5ro3/2JS8CiVyh0qtBsSxQ5IHIEeMP3ZL031bCG65e7DhkFRQQloFkiMu3gJ0XzbdfnXSEulRvGqCk4iNVqnzTbYjM0aARys/dCpmcO4UWS6rsYI2TdsCTJvDOGGiAf3Y4OBDNq5ixeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732442715; c=relaxed/simple;
	bh=00GKzIkIov7sWC7YYf/fsmzjuTtHwftcYafHQRVNIQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0nRCCYSf53o0IcXHWfbkcjWKxUTOeDgaJcR6AtRxuhmHNxJ1KT8X2mwiN0MAzddbeAAFzeO3PBd5usyqvdTSiH2TcDMLo4zNnUvc4Y3qkbAfkMgP2qi6rD/oDUCSN1PyhmX/AoVdZVlvACHJMpBe+cSm/2CF4ihfb3DbTQC8jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A0CZfEhQ; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A0CZfEhQ"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso260096666b.2
        for <linux-clk@vger.kernel.org>; Sun, 24 Nov 2024 02:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732442712; x=1733047512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lk2GE1arbul51a1ynLU7Q9xhqGMt1ZdTPnPwO47t9KY=;
        b=A0CZfEhQgZuNQ8XUXPzjnRT3zv6xBUgrbIEApsB8YDOs+8YIt6aLdgPxacHdQ6fGrE
         4rbfMu2q8qqYnuLIAR1xVGQ9TpkMSD0a2KZh3sQp6U8s85NT1p6PzRiDkCkcxacIPULI
         PpyvC6I2LjBos1zcw2mVC3LUUUKHC7J65nGvJZfOsfIeULRJyQyWZxMRcDKWVhB8hCG3
         jyJM+Ee0ouYLEjtxx49p3j3PxwwUv75dSK0CSD725e4iBtgnBuarA8bLlmM/ZWv+uNTR
         FiJGb/+P4PLKzu9MD7zgH900QuuWIWC04chcWChMeq5TUNYpN6x14sCDQiQf1UNgirm2
         JSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732442712; x=1733047512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lk2GE1arbul51a1ynLU7Q9xhqGMt1ZdTPnPwO47t9KY=;
        b=msym+H+v2GCnPzdzMUmsoIlj5PgSSDfDSd7EnrsyrXEFtJqGmrxaK26zXI/cm7TWMz
         D+tkLSGdZjBGlKwNLYSk9E0zgJGC3oRJz6Q9PEZev7nbVUcIZFdyMTRgkXsz59IIUWN2
         /d58l04l1pR3D+npecshhpxaEGy2v0JXcdsaW7vzFhD5SnmGmdggLK6sm2scG5WaSeoC
         miVDyeYz5HLpQa4X5QUs9qXAW/DZd32qomPr1kWTXG0oCogCG30mltPEts6gDug/ab0X
         2DprosqBcUnpONo3xEe2HuzjPI9mWp7z5rIHMrMzRCj6HlDHVKkYaYKyfHqWxMhvmzF5
         R3Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUIUKN1b65D5EtgUlwuIe1+vIwQeZUh1kUChHnr0ldzT4dDTODaU9JKQ3YK8fz8gAp/usCx9TVm904=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOynJVPMV2ichPmv+eUM5XcoAwUTPUOTOPBs5MeIZuhEPJUupm
	LSpOKkz+kGd2m0kY+l4jj/PHkNkVP1+U4KPLw+6FfHaQdqdGYW2JagDJgcL+iaM=
X-Gm-Gg: ASbGnctknOGYGzboEjJVBcJ3n0Ur5GPGFfBYiNC5XZjNxqqT9xahsrVl6myghzf5FMs
	h8WVNNQ34sfc3QOGjCdc2fhqATBOtPKBxMVaBVGO9ztjh6lFxMbTgC1rdq9akZSRFiZM7VF3Zop
	xEc++9By14UqzFgPJStCilHsSoeUudlWxmdDfGhM8Rafd/YyvPrNA1jsfViJoBroFJFOGoweZ3+
	7OJTksI63I/TWUWGmZqIahbS1f2U55xauZ69LW4n3+qCWjqdgwljt/KNUneeQ0CRIKZ14ca90q/
	fvr3OpUQ7x4UFlPddZUP
X-Google-Smtp-Source: AGHT+IHzhjRJgC4zyn46rADf4coPj01YWTVyf6AHNKqiCSQA366o1m7GZGOpC6OvPXD6QZ4IdkHEbQ==
X-Received: by 2002:a17:907:770d:b0:aa5:29ef:3aa6 with SMTP id a640c23a62f3a-aa529ef3b9fmr468828366b.23.1732442711875;
        Sun, 24 Nov 2024 02:05:11 -0800 (PST)
Received: from localhost (host-79-49-220-127.retail.telecomitalia.it. [79.49.220.127])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa50b57bda2sm325822466b.146.2024.11.24.02.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 02:05:11 -0800 (PST)
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
Cc: stable@vger.kernel.org
Subject: [PATCH v2 2/2] of: address: Preserve the flags portion on 1:1 dma-ranges mapping
Date: Sun, 24 Nov 2024 11:05:37 +0100
Message-ID: <e51ae57874e58a9b349c35e2e877425ebc075d7a.1732441813.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <cover.1732441813.git.andrea.porta@suse.com>
References: <cover.1732441813.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A missing or empty dma-ranges in a DT node implies a 1:1 mapping for dma
translations. In this specific case, the current behaviour is to zero out
the entire specifier so that the translation could be carried on as an
offset from zero. This includes address specifier that has flags (e.g.
PCI ranges).

Once the flags portion has been zeroed, the translation chain is broken
since the mapping functions will check the upcoming address specifier
against mismatching flags, always failing the 1:1 mapping and its entire
purpose of always succeeding.

Set to zero only the address portion while passing the flags through.

Fixes: dbbdee94734b ("of/address: Merge all of the bus translation code")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
Tested-by: Herve Codina <herve.codina@bootlin.com>
---
 drivers/of/address.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 286f0c161e33..b3479586bd4d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -455,7 +455,8 @@ static int of_translate_one(struct device_node *parent, struct of_bus *bus,
 	}
 	if (ranges == NULL || rlen == 0) {
 		offset = of_read_number(addr, na);
-		memset(addr, 0, pna * 4);
+		/* set address to zero, pass flags through */
+		memset(addr + pbus->flag_cells, 0, (pna - pbus->flag_cells) * 4);
 		pr_debug("empty ranges; 1:1 translation\n");
 		goto finish;
 	}
-- 
2.35.3

