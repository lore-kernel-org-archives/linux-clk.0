Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FD727454
	for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748162963; cv=none; b=KVOMDWtRmIE5Skgdo5OFvlecCQNhaqWpNYbVmi8HeYmG+p5FdOVB+kuS3RY++wHfwMHJBNh6nseuFP3OMDKpBEwequnxHb3qEAxjafVSJXOk2zn9WQ3pjQwt9d+Api/SSOxH5WZJi2ThdWx0Pz42njf8s4m4xP8FwSjzMfZ74Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748162963; c=relaxed/simple;
	bh=GHGvIRMABFHZz8Rip9kEWuDjGkE4igVxIjdR6SESrL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZoOtPPhkrEOZLTc8LPPSevSnvfjlLQIEOklVdanEZGKCq0UDiNw+yL/RYuKqN5Csrd+ineGb/5dB+lxmpwxR+i4v179NKy0UTu0226Plxjnyo5LniqkcgeIhsqCe7ThncD7oAszo0PT+tgy2oPB279/wCpb6AJ4YUblEOkq3W7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=gOPP3hwx; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="gOPP3hwx"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so799670b3a.0
        for <linux-clk@vger.kernel.org>; Sun, 25 May 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1748162960; x=1748767760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9FunaAXszvTG8F9NxLwtJcRl/JdpmfQ2Wvu5HorrkT0=;
        b=gOPP3hwxGyimoV29gUujyL43MqTpNNaRRP77u1KLu3AsDUFmiLFlNaraw8JdvFehpd
         FZjiLxwtayxwpcMt3NDF6sXUpZqpODcS2t6p+0112f0x9xVxKkjrDhtYk8iU+MNO/rYr
         6r33vvq5nZYIp+YSelWFJA4JqkX/YQZ+S139pkgdNGBfhWGvoYpNwiNEXhkK5wXFhb/x
         QF99FSsM5o1lRmkIFA5rx18mocSLXD8fF7iBsCfUM26URtmSm2Nu0epbc2f9d85Y3P23
         TenHxbot77ziK7SkYf1gKgDa3x67zKOwEDi89urtwzqb0nE85Hac2uOy4l6LXtDF0FMH
         Gc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748162960; x=1748767760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FunaAXszvTG8F9NxLwtJcRl/JdpmfQ2Wvu5HorrkT0=;
        b=eE0dA7RO0d5Pnhu4J4LT8R3HLwNl/4sJTEoME3NRJn80z69aAoLf9xxA98yIUxRUuy
         O/5l7lJnrR7a/+R4hJCwmL58AtWQUl0lNUZHZi6ZuxPM/KAUSe5h23+W7hdDOe+lSbB2
         TJRgXZ+GztbDoIz3hwUKHBaMJN0AI3H4ZmumK9xUMaC9M7U5Hiln+vUs75ii4he3yfKB
         ElcTrj/fQ8ju9Ui7o4WPTZt3sDdF9QvHUKM2bp4xns+oLFAiVnElcQqCG5lK/RIGOiqn
         ATeqwk/+xSZHrZoBiZZTsOdfC7bqhcO06GZDmkNshFGn0lhG4U6zroSTUEOOg1PUnyif
         BnOw==
X-Forwarded-Encrypted: i=1; AJvYcCUI6RHJ15vJQ6ncnP6THFxM2kqzWTI4MvX1Yc5+husYGazRw+PfQV0GaieQqQv+6W3HPY9tayzFr9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrvKmGX6d0cidpV9jPUqG0KGg/seGa4d54niXbSGemils6LNZP
	mb3kDjBD3WLQCmhi4HQSy4T1qhrBkVlFZilhKcBFrpGj4NNENC5tXWyr5oab9FD5N0E=
X-Gm-Gg: ASbGncvW2nZAUtEmJvh5AYBJU5xm7IWI4yYrdjg01Hxfzj93Yi9hbscn4YqZMLs+8hB
	D2+7DSvf89JAq8trgjUBUPxE6JTq15HXhE8qVu8JCPaxjsKPVidyVTftLZcRLY4HWVS5q6LxIS7
	5J1ZIsOraJtp9HJNKRzxspe1N0p4fBpjVu1iPN236yKYHIy5XPxcCf76xt2Bk0p3N7KS8uD2sUI
	zlnWBpngXDiI7eCWtMC6NYZFohVstxAV/cmknLrQjgpRKv8MaXsunFiFPlde2iKYsGD4sMNhv/5
	srUQgKsEhWASfsMhM+//xObMe+S8ZsDuBNsaH9yBsEZ652Om9y3crlyaUIGB9KsdS6o7784ghPN
	0PhVm0qJz
X-Google-Smtp-Source: AGHT+IFfQ4GlwBOm5aqf9abJJ6GzdowEpxdV3jxJWk+baMuesDsuJ4xVL+L2MQeiT0KLZQBJG7FJ6Q==
X-Received: by 2002:a05:6a21:100f:b0:218:75de:d924 with SMTP id adf61e73a8af0-2188c22eb79mr8067987637.19.1748162960471;
        Sun, 25 May 2025 01:49:20 -0700 (PDT)
Received: from localhost.localdomain ([122.171.22.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf6dd83sm15250627a12.18.2025.05.25.01.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:49:20 -0700 (PDT)
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
Subject: [PATCH v4 14/23] ACPI: property: Refactor acpi_fwnode_get_reference_args()
Date: Sun, 25 May 2025 14:17:01 +0530
Message-ID: <20250525084710.1665648-15-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525084710.1665648-1-apatel@ventanamicro.com>
References: <20250525084710.1665648-1-apatel@ventanamicro.com>
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

