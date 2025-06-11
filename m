Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5113D228C92
	for <linux-clk@vger.kernel.org>; Wed, 11 Jun 2025 06:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749623090; cv=none; b=XbWE6r4KPf8XLDBzBGsW52DVNuV7UQuBQ+ptbRmKnjJg6EWnu4vGiYwn7smavn+mXsHtkqncxtEIe8al7Yems4kVhXP82rR/KLC/xPLnXFpHouK0PbUodgsvMmntI7fVoBFDJ6QLLGNcyrXjsBBjRzFR6F4VLIi1xpCNGQqrFME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749623090; c=relaxed/simple;
	bh=SBjQlH46dBB3U+TixQzZp78z+Lc9Dr3istOOhSNwHTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rIXtueGlIutd03XKOt3CQGTIjHjJS56IiEzIjUolW5W1TlpBhU78SvJHMn41X+oFAIAUucM5UrrwppkhNhZHsTY+QcZX2lYwCvrRVB3pHwGmkzQvTEomRzlZIJk97KeYn4WmjIzfOqrb5aIxKBdM/glatHWX05B1TUVnizMXkCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=YU1zeda2; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="YU1zeda2"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2363497cc4dso18824665ad.1
        for <linux-clk@vger.kernel.org>; Tue, 10 Jun 2025 23:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749623089; x=1750227889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=YU1zeda2tIFcelRndbkIwjS5k0yLwD/umiPcti/Xnvs6jqKrs559LVi7/F+e/R0kfA
         wlPV+CaeMHGS9e95s+ToOYXF6/577gTeJsMnPpYPRNt7eX/y/oJGJdzOZVR3UGy6AKu5
         HPy+2XS+M0+isqgtUxZRe7yjiJvqM9Oox22Vj9amrz9vdXe+x+qLHFgEbAkAb4Tv4Ivu
         A+wgoRDPcEK+uIBrTMErshNvhjNaf7eSzJdErwrlLXXvIvsMKtaPor43H9/G9I8jYTIo
         J2uMYSkNvBxzMaJ8OfrnrUDybwo6y7H1jkuDNSjs9lXWFquWHW8EXj2BAEbTzQ9quBJ7
         vnfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749623089; x=1750227889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t/zEjMktz2Q+rhDOD+xT+f8Y23symCCnfKy+4Q372EY=;
        b=EGLGRMf6CwR5XS+BY8Duxnk/vXFpSFwM63DgTZtm2Ro/f7jZ/Burp4cgfhqx4ELHoz
         nvd1G7JMH55KJ7LXJn3z549g7/LWDspFF8qXeEQJFwL0r8yHyB8US9vQOHgDItp1hLZr
         oWtEyelPF5wOG1kYbV2iEDLJB6G8cAt0f27qNYZK8Bu7/CBkal8ho8liosF9vQfFq1b0
         WVAXHoDcltjMPqSIfe/+ryE+MxelXYeUrBT4yXbf8KjeZ/2VvdRBEqKdGMvEfb2Pzjc5
         7VrZNyIRjoDllfkpxqX0l6BlmrhKFaHBHC4/GxqWPz2ltp0cFIPfxVuvAYJG3SrevdCb
         62rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMPi7+9mSSBqEMyo1Bure7O1oWsUTFIsR/vzGXpu+/t5SIT7iViNmJZOXMh24aSDU7iGpa4MegABw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6BAThaU+Yywd0uStAvrqfxkDQ24uPZKZpmLebWy/BtMjUBkFD
	Og6BJRZfjMY2WAT+5FP4CEHVL0RKGU8gLcKrHLP9BX0tueOmb9VivHSNqvFmOSTwEtY=
X-Gm-Gg: ASbGncvw8rYFX0Aj1HwGp9lQqx2HYhTmzNQnjS8Dq3qWGQXZafO8+WApd3p63vbw3nL
	lundP5LJt3TlvoFjnXn63Lq1eY4WdUGDB2jb1W+piX1GGh3pdL4h2V7BKCvu4pm0NQMKYcyFWLD
	FmA8Y8WKBDSQoTTbT4hvGdbdKxoi5e6goT9LBworVXiTKhXJatIpIKRPvRHAv5a2l9G3Kh3XPSi
	PgPBpu6JsS+LWbmRUyCXIJgehu/SxNeGE9k6/xnHrVaQr8zTz7L+jUyOIXdISMkMdPjXU29FWT7
	TWdo2WfxlsfbfHxrkujINfnA7KdBqSTJs2Z/TVCBt2/RMC88Z4qmbycUjvPoCUMruqsLCa2bKo+
	M/+uOBuJ4F5H9WRVD6seMZUqgkw==
X-Google-Smtp-Source: AGHT+IGFgz5cLpjWkfSw+TNcCIGt07x932rHAD6olqu1+yonZJ7rvYlMViTlSj6mMRDGXjbPoi/gVw==
X-Received: by 2002:a17:902:f70f:b0:223:7006:4db2 with SMTP id d9443c01a7336-23641b1988emr28560705ad.31.1749623088442;
        Tue, 10 Jun 2025 23:24:48 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092677sm79976295ad.64.2025.06.10.23.24.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 23:24:47 -0700 (PDT)
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
Subject: [PATCH v5 13/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Wed, 11 Jun 2025 11:52:28 +0530
Message-ID: <20250611062238.636753-14-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611062238.636753-1-apatel@ventanamicro.com>
References: <20250611062238.636753-1-apatel@ventanamicro.com>
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

