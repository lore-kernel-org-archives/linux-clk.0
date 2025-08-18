Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251A26A1A8
	for <linux-clk@vger.kernel.org>; Mon, 18 Aug 2025 04:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755490325; cv=none; b=igrNOVtJ9UO+QJr4BESypKd/AT/1Z6xviD1DTkPyrFPM3Wma0w5f+5qT+r7f0og9dLOuTYPHR21gWHjB9NVwovhRoKpw00rX+ZKbrdUwTIb8ylWRgP+MklVkvejNLcuOrJJ29cSD47Cvf2faTSo/ErQoSDkBxq993i2KYZ7V3NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755490325; c=relaxed/simple;
	bh=AzDnkvkLdRyeS7VDWrPZhFEpyPeN7AYdoKFUiRxG/uY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vut1/Vy3WOAXc9hafDTodOeIZrpHkNKiI7y2VLfuTKCwK0gxYoRqpM1Geacx0q5w9xGWDiVMvx8BMX7v/sTlYoMJPPZHgiuKUKVF4RqKFgw57eZG0noJUAwef3BUNGXK1Do+JWjTpE879/HutO3NO82XiO/I/dFe01C+hC2kxJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=X6N1i9LJ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="X6N1i9LJ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-24457f53d2eso43564025ad.0
        for <linux-clk@vger.kernel.org>; Sun, 17 Aug 2025 21:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490323; x=1756095123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=X6N1i9LJRRwkSHQjScOAm8e5LM6Pd5XiOcace7p/nxNK+mjhqw2cBWmqh4/RCYKJ2z
         EY2yz6TzLKHghCaymlVCk1OTiGkOeVSnIcWlqBy2Aec23t2MY2/4m/v03cGdlxyyAjWx
         crbdrv01LSZPGRDra2xW0bJRl8hIBvmdsL3+cNw7owibqobA6bkWtkT32IWGvOSR03RK
         umUN2lLwpaXGmYasz65KaJjfawD+RGdJODDNK6/715CT2BfW6QRccaQ1LOUGWGJqZci4
         TkifEpZH0a6B9qSy5W7IvftBmKjNgS+j7NdhQvMCFDbW4uCfMp5FhZ7QGhDadOjzF3Ob
         jb+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490323; x=1756095123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=psS8/HGvEcGOGsMgWWXg1B2q2pSduh9TsFVsTLXCZt8=;
        b=pHuaWtcED2FuMlLpzc/wnTIPLU/1sko5gfWfJwhq6bsK55lKbSuto2Nhx2+Anl2nb/
         wMTGxPOrJj4q1J785N+fOE8RFkdeIs6IgXFXtV6VENzkldIrPEmoOKI6jJvgLb85PYW9
         SP5PRb52Xc7uK16KqVVfpFRCuJbFhz97fRrjKLKY/uI6nGDIs5tEKXerzGrxNAE/1Ib6
         UQkb/tLTxBsDnwpUS60yxmvoiiof7Cc6HjKApg4gB6u8pgCQ4w2AAOVHzhcZjyGNxrk+
         zVbTvZJNRPs87mQyG1/C3mfcQXYqCBHlS/a+IfZMKzFSAFSu8EffZH0lycVHkz8EtGH0
         kX0w==
X-Forwarded-Encrypted: i=1; AJvYcCUjFY/DLcV8pKOsvuWA6IWKE39Ez5dcgCjBkeaYb22Rk3PHYMyhtfJTB/PtTDtC8euCulaVQbHhzxI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws7CqKlg8jsXE0BhL0AcxU1puRiU2n8+lcRwrNmJ1Z56tAIa3C
	eAL50I7Hz3rdBz0OHVSu0rftjPjcJ71t5bIrbFM8WptqMXp4HUIu5MyB1Uq04SWIIJs=
X-Gm-Gg: ASbGncvD/hr5GTYPigRK36r1XwRumRrZmRJlNMbBn5I1S0Q+bc8VC45V5vSjVJLff34
	oCT9O6VmXH9SUpbjEpor+AXXZD7aAcVq2T8hwD+Cq2XXY/ZNoKAh6w667i+O7G5jwHrsmt2dv2i
	aUV1EniA8TXowq23/yC/D3Rny37m5Mb3fVMbUzwiO9CBh75GlbDoGVZ5OiHBSExD8qWg6zXsCbb
	mWc8B9YNb7buNsDqwzlSO8NS07VIEwt541P1ywG2MwaQoqt8KZictiakSdnxfLX19EoUdfraIJ6
	wRhozvSRQUtY3Tz0zb78NmUhI9vdmycyMe/indSWr+RiP3oPhEb6LzLuk0JhRPacJTmN5EGy8q6
	+VgEb0ZPZUAyKbIFa9t8qZrrTv0KTRyYbqA475onxLeWH12RR0IyiJw==
X-Google-Smtp-Source: AGHT+IFg2JaZydXsoz3oTb0p0Gh/5FN3+0FJRvvXtyYYz3C7r58Enx6ENab6eBnXqudj+8YWHETz5w==
X-Received: by 2002:a17:902:d58f:b0:240:5c38:756b with SMTP id d9443c01a7336-2446d710a8fmr130054555ad.14.1755490322531;
        Sun, 17 Aug 2025 21:12:02 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:02 -0700 (PDT)
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
	Alexandre Ghiti <alex@ghiti.fr>,
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
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v10 14/24] ACPI: property: Refactor acpi_fwnode_get_reference_args() to support nargs_prop
Date: Mon, 18 Aug 2025 09:39:10 +0530
Message-ID: <20250818040920.272664-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, acpi_fwnode_get_reference_args() delegates to the internal
function __acpi_node_get_property_reference() to retrieve property
references. However, this function does not handle the nargs_prop (cells
property) parameter, and instead expects the number of arguments (nargs)
to be known or hardcoded.

As a result, when fwnode_property_get_reference_args() is used with a
valid nargs_prop, the ACPI backend ignores it, whereas the Device Tree
(DT) backend uses the #*-cells property from the reference node to
determine the number of arguments dynamically.

To support the nargs_prop in ACPI, refactor the code as follows:

- Move the implementation from __acpi_node_get_property_reference()
  into acpi_fwnode_get_reference_args().

- Update __acpi_node_get_property_reference() to call the (now updated)
  acpi_fwnode_get_reference_args() passing NULL as nargs_prop to keep
  the behavior of __acpi_node_get_property_reference() intact.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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

