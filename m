Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A38274B33
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612832; cv=none; b=eoamqulo2CIZW9pi8HUMhj8npahdkU+pe1UST6fk9SeApokGT961YIc8ibqkQ+Vkt5gOHGz8g1mlIo+Pv0p17Rda//2LGvzb46jGKR4kfTbMBv8Z1TcwrQduqaaxBaSc5kQBd0WEONZUAIaqu9UednD1mLj/hzUDo2QAqaj64Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612832; c=relaxed/simple;
	bh=169PDjupJ8pNp0wACYdaBOi2G5j5ACOyZXywYUb0nJM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F69ddnY68c9v8reH++WHAGrmBFN9BStCWYOF/z3qJaXjWEiAZWiGt+BCQbBv8UddwsNKsXNjc0QsNXXrx5Sa3Pxr3Omvsx6ONTn+dSOv9KBnY+qqWSXUtw1CgyKrEJQOr1Fms22Q5vJModBvPM7wUp8U1/O/+vJ9R26r8GeZYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=Xpycg0q/; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="Xpycg0q/"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-315c1b0623cso907784a91.1
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612829; x=1752217629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qNcclU2G18Bdovh3QAsek7AK/q114CkADd+BrTGwXao=;
        b=Xpycg0q/HWdHHvv6tbsoU/uiBy2tEVhatOJsw2uoaL537pgNT6y/0lQTeJ8jx03irM
         J8AVhXk9X7foqKcXvc+TOjkTgztEX1JVr9ykZ/Ug+jf8+yswhgGgW5GtFd5e4UdPt8Sf
         fUQOerbOqr4cUz3Q70fK06TPZhB/u5V955dm72PdR5sBWuqEn0JwAr+puO5STOgTRrRE
         rkjvdBF1zAAEO+bbvr1UnYMGcfeKBAafUI3cZwmK0MfJVCISeCtW5yWxUPOJApH5riZh
         itctuYTqXaOFnV95nfzH1CAgtveSbbWS9CHLQG4gIVzsNUUN///KRPnpTCopQrnCnuf3
         o3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612829; x=1752217629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qNcclU2G18Bdovh3QAsek7AK/q114CkADd+BrTGwXao=;
        b=f5AgFWwnlsNwBzRGRjfQyxK5wWR2Y/3kmLa9y3goUxC4s1u4QFcuHhJd7JQ2J+9u7S
         4cjTo9DCS1bFDyv+sHgX/hWJjd1KaShuGoq4y//Y1g31FNhVUjm0KcKa8N9Sxhvgc7Uj
         auPGx+gIpCU54HwtHZCHlGf/zItw6V7TG0QcA3wLbnZ/Lol+5jyQ5cKT25Oticg2yBNX
         HQNU2JgHYJcAin9kQEj1SVNOt7EqEjC4E1+RZ8bMN2E/ZtmLvgRkaOsdgg3gf9Jov208
         sDy0oku50gcX1W1TiI9EK1lTXRZwiqJ/DGBqzx/f6+UKLZuR0/wnxW8pO/acsjJmuDsX
         i7iw==
X-Forwarded-Encrypted: i=1; AJvYcCVyei5xXQ28dhUv2dNKCo/kn8NorAgc3ICRc2TXH6IsxQTOHTKJYYrqKPnmaKCLqP+tO3mkDNFARg0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzwd6vdLxZupOSkTq9UJ1Z1ZzRfffVZ/yJ8lGSN0he6EP5CxzXU
	yuCT3M84JMeG3xx6Y0IIJEVuoHZtsupnZtxYi2HE2WQTjqUvLqL8Jdhm/U4CofFsIx0=
X-Gm-Gg: ASbGncs/0U6t5th5SAtIpBHVlmR59jCc/jjU5AjWRQSkc1tyyikjVpe+s9A3NzHfgDG
	sgajPnDFsrs2tiLyopEGXiAmuy8HSRbinZ97zI7ymSbce5cl3C1/qptAlZ9asRYAUaU2l4KfWZS
	b/oRvAwuulv+HHFFT4oWNn4CyD8TzaPcmUTe1bTTimgbEJGuhVxKNpzIRSauR+EuB8MEqE6EbZH
	hU46G+iY0ZxFE457YlVBK46z/immrLqSmynuFf/s0UCXAarBhe8nqWyq1BZfVsgJRmJ0GgeesZB
	KGOmRPhQbTqW4a1lWJAgfakA5SHDwdI2JyVyIvh2ckknQ40lYl1hPUSZFMjw77rnZYX7xE8RL+6
	uvzIAAV6vZ3kfb6V94KDhWwZGNw==
X-Google-Smtp-Source: AGHT+IGrP/l0dKEOOpvLsvS4JGiMBKWICRCAtYJOylbaG7ycll8dUnb8u46RulbU17ZZf/1gB5ixPQ==
X-Received: by 2002:a17:90b:33d1:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31aaddb4ac6mr1562105a91.28.1751612829169;
        Fri, 04 Jul 2025 00:07:09 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:07:08 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v8 15/24] ACPI: Add support for nargs_prop in acpi_fwnode_get_reference_args()
Date: Fri,  4 Jul 2025 12:33:47 +0530
Message-ID: <20250704070356.1683992-16-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250704070356.1683992-1-apatel@ventanamicro.com>
References: <20250704070356.1683992-1-apatel@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sunil V L <sunilvl@ventanamicro.com>

Currently, ACPI does not support the use of a nargs_prop (e.g.,
associated with a reference in fwnode_property_get_reference_args().
Instead, ACPI expects the number of arguments (nargs) to be explicitly
passed or known.

This behavior diverges from Open Firmware (OF), which allows the use of
a #*-cells property in the referenced node to determine the number of
arguments. Since fwnode_property_get_reference_args() is a common
interface used across both OF and ACPI firmware paradigms, it is
desirable to have a unified calling convention that works seamlessly for
both.

Add the support for ACPI to parse a nargs_prop from the referenced
fwnode, aligning its behavior with the OF backend. This allows drivers
and subsystems using fwnode_property_get_reference_args() to work in a
firmware-agnostic way without having to hardcode or special-case
argument counts for ACPI.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/acpi/property.c | 29 +++++++++++++++++++++++++----
 drivers/base/property.c |  2 +-
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index d4863746fb11..e92402deee77 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -804,13 +804,35 @@ acpi_fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
 	return NULL;
 }
 
+static unsigned int acpi_fwnode_get_args_count(struct fwnode_handle *fwnode,
+					       const char *nargs_prop)
+{
+	const struct acpi_device_data *data;
+	const union acpi_object *obj;
+	int ret;
+
+	data = acpi_device_data_of_node(fwnode);
+	if (!data)
+		return 0;
+
+	ret = acpi_data_get_property(data, nargs_prop, ACPI_TYPE_INTEGER, &obj);
+	if (ret)
+		return 0;
+
+	return obj->integer.value;
+}
+
 static int acpi_get_ref_args(struct fwnode_reference_args *args,
 			     struct fwnode_handle *ref_fwnode,
+			     const char *nargs_prop,
 			     const union acpi_object **element,
 			     const union acpi_object *end, size_t num_args)
 {
 	u32 nargs = 0, i;
 
+	if (nargs_prop)
+		num_args = acpi_fwnode_get_args_count(ref_fwnode, nargs_prop);
+
 	/*
 	 * Assume the following integer elements are all args. Stop counting on
 	 * the first reference (possibly represented as a string) or end of the
@@ -961,10 +983,10 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 				return -EINVAL;
 
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
 						acpi_fwnode_handle(device),
-						&element, end, args_count);
+						nargs_prop, &element, end,
+						args_count);
 			if (ret < 0)
 				return ret;
 
@@ -979,9 +1001,8 @@ static int acpi_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 				return -EINVAL;
 
 			element++;
-
 			ret = acpi_get_ref_args(idx == index ? args : NULL,
-						ref_fwnode, &element, end,
+						ref_fwnode, nargs_prop, &element, end,
 						args_count);
 			if (ret < 0)
 				return ret;
diff --git a/drivers/base/property.c b/drivers/base/property.c
index f626d5bbe806..6a63860579dd 100644
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

