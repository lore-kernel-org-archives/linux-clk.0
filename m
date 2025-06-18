Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5762E425B
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 12:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248968; cv=none; b=tiHK189SC0icwZE9r1v9IvJoED42QuQZEgumG7Eg3o/zluiDiPABekA4EFT08I2KYo8ywqGcbRPOqGGq9tH9HDRRW5Aq2LHqUbV6U63zm6XxIBMwDUPhMuc25ETuzc2gURzH95RMGmQON+Oq/aGJwcOTElsAyzmhI+tT4M000Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248968; c=relaxed/simple;
	bh=SBjQlH46dBB3U+TixQzZp78z+Lc9Dr3istOOhSNwHTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JmaOE7L/asCCXQtHHud5J/2PmZxQ3LVXueMTzh4WDSX9l0BwF2HHBd1Fqj7pxXbKKcOWjbM0ZLuxgzyNSJvO+1Y6LZ9SdiPb2KyIupuMrOhXa0AYJs5GJcc8MpIRH0s6Ga/gqbhX1xRh0m5pOiEo0mD4s62I7/EPGog3WJrBY4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=FmutcZ5i; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="FmutcZ5i"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso5094572b3a.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 05:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750248966; x=1750853766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=FmutcZ5ibJCM7wgjI991vyO1uq4Ptv6YdfmjzS5gS+zFauK9+At/ikXU3P2cd+RsJa
         v8Gspvci6Uiku4BKTLNCFQbjjc4SkXHWRhZBDyjiC6Q7B6XE9NDpUDHjF/ZgO+tucUS4
         iD+pghY7EVDlR9qWLWW6AA0CmlR8SqGCoHpShlAEs8a4Y4LwnwBcKWUVCjcyYm8M9CGb
         dqkMVtmv6vS3pP7w5iyFXIk9uGdoO2hhrB+36thGkKDIEUY4hwgLSUFP3YOM+KkWU1Y5
         ytXw08Yu8sw+yNQ6+QDCHAarxiWmpI4KstaouBZaDeXFkQK+BAqdF5PiT7sLvgKmMb3S
         UetA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750248966; x=1750853766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=WhWBk/JHW/9/TDhuK+T5FqmaDWZgwnH/J08FrqOlSO4dAMYQDZpmu2uMXrzfUixLFi
         2m7b+kzo7ScWKAxMocJkiDf/8jAmuw8kqK5eI0mk77clCw6vQ8k/3waMpxChOoKlXzvv
         GfsWGLKk4LjF5fMr3CfXy/QhO1N3sln8jbVNm+G5p64pYPXdp39A5vFrIPUTZCNX0lEj
         KOuxcYFQFQxyYUsEQX7+t7208Z2JO+lXZ05WUCGA3l/xyN2nOoCAgCT6eSlMKphzDscz
         6GC8NmJ7xYH2TiC0HnaT9aPZdumwZLt1kg6FIyTgbtPSoX8bERryhDn/BPklGX8rKJVV
         yBwA==
X-Forwarded-Encrypted: i=1; AJvYcCVlc1U23IdtQRS/00ZVU/yscAF5eru1ChuyB2O90e4KiuhFUryduiJx2Pndm+r45t1JqoinqarKA04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoX4Rsh7HrktRPahDGOxDzBz9BNKo6fRs0J+zTl84jePPPnyAd
	JhtWG0NDSV0q3rPjaUdeDbmYCk7ZNQjwkiQnF8dzatamyn6wc1DAIdNEBWgY4p/AL2I=
X-Gm-Gg: ASbGncsvnkzM3Oibg3ckajZ7Jsq93leeDnBR5XgALwfb4jAAIqUDtTgxH2sXRKody6T
	+P3O83U1ykdU+tUxcfiGHsjTkKvUWi5vQ01hShUjpS+6u89ja03vTLYcIutwemnXBOVno3rwRWw
	Q0/fsvq1us09nVNoplh89lVOnyftbEi5aDaDlfVparaqmrLO1C1MMomquRltiR+htfZV6/dI4Lh
	C28UVH8COuwgfw9ZuiNy9A7RQZog/sQViX4I6nbKtQqKwno3uukNxBWCSJca7W+VMXqsIeYvXWY
	sbx36/0Ar4OQvZyTG+pGK9GSqBTNVe+1pkP7tlgSBOpEAsg9i8qnDr1i4XXzh+GlcncTXkao/hn
	l4zG8fB4Yaby72DnR7g==
X-Google-Smtp-Source: AGHT+IGoMyew2ejAt7Lr7ji1BBEmYh0srRqGPcfXFixzpRQROZE2QwCLEt0GO1Sh7RlWtJaJUne8nw==
X-Received: by 2002:a05:6a00:4b4a:b0:736:54c9:df2c with SMTP id d2e1a72fcca58-7489cfbb3b3mr21175650b3a.15.1750248965820;
        Wed, 18 Jun 2025 05:16:05 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748900d7e0asm11201177b3a.174.2025.06.18.05.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 05:16:05 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v6 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Wed, 18 Jun 2025 17:43:48 +0530
Message-ID: <20250618121358.503781-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618121358.503781-1-apatel@ventanamicro.com>
References: <20250618121358.503781-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently acpi_fwnode_get_reference_args() calls the public function
__acpi_node_get_property_reference() which ignores the nargs_prop
parameter. To fix this, make __acpi_node_get_property_reference() to
call the static acpi_fwnode_get_reference() so that callers of
fwnode_get_reference_args() can still pass a valid property name to
fetch the number of arguments.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 101 ++++++++++++++++++++--------------------
 1 file changed, 50 insertions(+), 51 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 436019d96027..d4863746fb11 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -882,45 +882,10 @@ static struct fwnode_handle *acpi_parse_string_ref(const struct fwnode_handle *f
 	return &dn->fwnode;
 }
 
-/**
- * __acpi_node_get_property_reference - returns handle to the referenced object
- * @fwnode: Firmware node to get the property from
- * @propname: Name of the property
- * @index: Index of the reference to return
- * @num_args: Maximum number of arguments after each reference
- * @args: Location to store the returned reference with optional arguments
- *	  (may be NULL)
- *
- * Find property with @name, verifify that it is a package containing at least
- * one object reference and if so, store the ACPI device object pointer to the
- * target object in @args->adev.  If the reference includes arguments, store
- * them in the @args->args[] array.
- *
- * If there's more than one reference in the property value package, @index is
- * used to select the one to return.
- *
- * It is possible to leave holes in the property value set like in the
- * example below:
- *
- * Package () {
- *     "cs-gpios",
- *     Package () {
- *        ^GPIO, 19, 0, 0,
- *        ^GPIO, 20, 0, 0,
- *        0,
- *        ^GPIO, 21, 0, 0,
- *     }
- * }
- *
- * Calling this function with index %2 or index %3 return %-ENOENT. If the
- * property does not contain any more values %-ENOENT is returned. The NULL
- * entry must be single integer and preferably contain value %0.
- *
- * Return: %0 on success, negative error code on failure.
- */
-int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
-	const char *propname, size_t index, size_t num_args,
-	struct fwnode_reference_args *args)
+static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
+					  const char *propname, const char *nargs_prop,
+					  unsigned int args_count, unsigned int index,
+					  struct fwnode_reference_args *args)
 {
 	const union acpi_object *element, *end;
 	const union acpi_object *obj;
@@ -999,7 +964,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, num_args);
+						&element, end, args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1017,7 +982,7 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						ref_fwnode, &element, end,
-						num_args);
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -1039,6 +1004,50 @@ int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
 
 	return -ENOENT;
 }
+
+/**
+ * __acpi_node_get_property_reference - returns handle to the referenced object
+ * @fwnode: Firmware node to get the property from
+ * @propname: Name of the property
+ * @index: Index of the reference to return
+ * @num_args: Maximum number of arguments after each reference
+ * @args: Location to store the returned reference with optional arguments
+ *	  (may be NULL)
+ *
+ * Find property with @name, verifify that it is a package containing at least
+ * one object reference and if so, store the ACPI device object pointer to the
+ * target object in @args->adev.  If the reference includes arguments, store
+ * them in the @args->args[] array.
+ *
+ * If there's more than one reference in the property value package, @index is
+ * used to select the one to return.
+ *
+ * It is possible to leave holes in the property value set like in the
+ * example below:
+ *
+ * Package () {
+ *     "cs-gpios",
+ *     Package () {
+ *        ^GPIO, 19, 0, 0,
+ *        ^GPIO, 20, 0, 0,
+ *        0,
+ *        ^GPIO, 21, 0, 0,
+ *     }
+ * }
+ *
+ * Calling this function with index %2 or index %3 return %-ENOENT. If the
+ * property does not contain any more values %-ENOENT is returned. The NULL
+ * entry must be single integer and preferably contain value %0.
+ *
+ * Return: %0 on success, negative error code on failure.
+ */
+int __acpi_node_get_property_reference(const struct fwnode_handle *fwnode,
+				       const char *propname, size_t index,
+				       size_t num_args,
+				       struct fwnode_reference_args *args)
+{
+	return acpi_fwnode_get_reference_args(fwnode, propname, NULL, index, num_args, args);
+}
 EXPORT_SYMBOL_GPL(__acpi_node_get_property_reference);
 
 static int acpi_data_prop_read_single(const struct acpi_device_data *data,
@@ -1558,16 +1567,6 @@ acpi_fwnode_property_read_string_array(const struct fwnode_handle *fwnode,
 				   val, nval);
 }
 
-static int
-acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
-			       const char *prop, const char *nargs_prop,
-			       unsigned int args_count, unsigned int index,
-			       struct fwnode_reference_args *args)
-{
-	return __acpi_node_get_property_reference(fwnode, prop, index,
-						  args_count, args);
-}
-
 static const char *acpi_fwnode_get_name(const struct fwnode_handle *fwnode)
 {
 	const struct acpi_device *adev;
-- 
2.43.0

