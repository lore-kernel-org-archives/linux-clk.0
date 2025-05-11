Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF0A2571DD
	for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 13:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746970935; cv=none; b=DyaIweNQUOX0QI9+GU1XZbN3Uan8kc2H6Llxva6oM+F0a1nFbFjEZrBm4jQS0rPkUlgJw+MZTHzz0SwN3NclsubEeD8s4ths+ahdr6aZpD/vT1nRAGrXoVUrgyoBgevMfEfnxkFeAoj69TUeV/hiE7EthLemboK+C+UMsAafaC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746970935; c=relaxed/simple;
	bh=/NGx6vVyfAmL2H7PdAWj8+6zweqVE236nRfnQRAZ3A8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jVGyiOfXTPv1sZFlk5apEnCMMQBQmRNngAwVoC/dvD1pgr9NEK3Dz7qjc3geOxp+3tusS1XsjO+1wp2dm5OW+MdCT6k+NQYRTRiOHWmSkRthWRfcbIh/cPv6Ge6mXNaW0ukqtoN3FZULmQCxJUcvVXegYOIOv9O9BCsIYW/3EBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IMPtSRjg; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IMPtSRjg"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-30a452d3b38so3238050a91.3
        for <linux-clk@vger.kernel.org>; Sun, 11 May 2025 06:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746970932; x=1747575732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=IMPtSRjgBr3i68nOc4EDEZbJPW8Vw5AEGAmIgRqGtmMib/ISIN/ibdNU4FRteTq+0D
         BzVJVMfUkAOLA37bVVtEmS2zYwaApPjFVZyH+yQlbcJ7M/Fs1IIajoMh6xrGxlWG+qiB
         C7DNtjiuMMClNtSk0/flvuA/vcEIUHZicNCztTy3BUfRcXsc3hU7G+ZYyWC3/RJSQbRc
         6yOt4wBLkpFtbtGpAavlFQZIM4hHO8dbxbyvHkoiyKuJJ0CjWteNyBiIKUznOf+8KkVy
         iSbsnsK9FaoskHjEwGNsr69i7gJvetDH9auckeuQgPWOuXK5I2T7uJOY06k+zW3Sqr+7
         nTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746970932; x=1747575732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGByiNcbOS4lR4Bfcs//4xBTg2VCmvMstvJytXn1tOs=;
        b=b3Z9z0IPIw0rBndrb4NvZpjzCIqOWlsZVg/B/UBOoYnra/vm/VsuSYDwwHMXWmUF2h
         Q7PV9GISaOJDR4i2SE62MsP7phK4iJTzQgW47CYrdfbWJywkgzGgoNsKn6sgtCE69Dz8
         3dSZ8MoW53TBJYlpPQvdY3QtmCA5PyMmE42Ds5a0AvCQPpNT4NWqlqTazr2qcJjFbd16
         ZGaH+v706XAYHJaEpoTR3ccYfmWkGAze1vd4lJ9KBtS7DYgwu3ucaFjLmFaCzegBkXCU
         xapOVOKlCESeT76RJqvXYVjcrkNXR0t1OFVcllnnyj6S3ZnewNpbWg4GUJxHRnsqVDzx
         pMdA==
X-Forwarded-Encrypted: i=1; AJvYcCV14BIc/0V7ECArR9fYPwPxbTm01rY4EHXhWPorvTTSW6TRvAFqiKjIm7JnNLZI6pyrirGj29SdRb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQuTJXy+5eas8vSwcjJqAVI97xk/ICpXBR8hz7dIaYygKnaSaW
	pXRzImSvcK3cdSN9GrUiQWTSdnxfg6KP0t97LRCbh8QjCmBRCnE9383zMX6GkFU=
X-Gm-Gg: ASbGnctmhiDVIAcKlwdWoks4dQgtIPSfnTp3LxbCEoIj+z9FQhuCriVBQc4NpT+33Ys
	uchfpJSk1I8rNZ2TlflGMVs2eSmzbazA/F4JSy9TFSpjmKmpFoPwyjV/m6gIlZUQNdSgut31kJo
	2lvedFx3xM567Ls9igkg0mnK8wOjEIBYIgUnT47MHhTcTHyWYHcEV87Wlip785XoxCONAu/oYE+
	TZgEA9RGCNjQF8oAJsmWDP6ytUrg9OyPHTTpHg7YGtAzrU3UaB5aASud9khDrf2kIZXoqKe5Jn6
	XORqPu8Rel3s5OSq66c7JI+ODQyAXfuZ+/nwCsWuwB+r+jABsxi0zFe2H7qKqK90XkcWL4Efec/
	ymYvVlUrkj+OSEw==
X-Google-Smtp-Source: AGHT+IEVz2y4z8RabHXmB0ZMFkEbguqpeJ841vPD4v6JLrHHmpUprIGAeUTqvLaFFNsGdONbOeY4pA==
X-Received: by 2002:a17:902:d4ca:b0:220:eade:d77e with SMTP id d9443c01a7336-22fc9185ef8mr159540425ad.40.1746970932037;
        Sun, 11 May 2025 06:42:12 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([122.171.17.86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc754785bsm46665805ad.20.2025.05.11.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 06:42:11 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Len Brown <lenb@kernel.org>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Rahul Pathak <rpathak@ventanamicro.com>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 15/23] ACPI: property: Add support for cells property
Date: Sun, 11 May 2025 19:09:31 +0530
Message-ID: <20250511133939.801777-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511133939.801777-1-apatel@ventanamicro.com>
References: <20250511133939.801777-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, ACPI doesn't support cells property when
fwnode_property_get_reference_args() is called. ACPI always expects the
number of arguments to be passed. However,
fwnode_property_get_reference_args() being a common interface for OF and
ACPI, it is better to have single calling convention which works for
both. Hence, add support for cells property on the reference device to
get the number of arguments dynamically.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/property.c | 15 +++++++++++++++
 drivers/base/property.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 364c58faf13f..51352bde617a 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -960,6 +960,13 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!device)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
@@ -978,6 +985,14 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			if (!ref_fwnode)
 				return -EINVAL;
 
+			if (nargs_prop) {
+				device = to_acpi_device_node(ref_fwnode);
+				if (!acpi_dev_get_property(device, nargs_prop,
+							   ACPI_TYPE_INTEGER, &obj)) {
+					args_count = obj->integer.value;
+				}
+			}
+
 			element++;
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..172dfb950328 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -578,7 +578,7 @@ EXPORT_SYMBOL_GPL(fwnode_property_match_property_string);
  * @prop:	The name of the property
  * @nargs_prop:	The name of the property telling the number of
  *		arguments in the referred node. NULL if @nargs is known,
- *		otherwise @nargs is ignored. Only relevant on OF.
+ *		otherwise @nargs is ignored.
  * @nargs:	Number of arguments. Ignored if @nargs_prop is non-NULL.
  * @index:	Index of the reference, from zero onwards.
  * @args:	Result structure with reference and integer arguments.
-- 
2.43.0

