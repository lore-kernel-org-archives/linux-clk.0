Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C363274FCA
	for <linux-clk@vger.kernel.org>; Fri,  4 Jul 2025 07:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751612726; cv=none; b=autSj8LgYUEyzwryZxKRzSuy/ystom/Rmo8EiMdwlKSvlTLyLkg3vIdMGyYdA5K1ORuYlLJ8sbw4y4e+Ls6zrfBXvlEkOHBRA8zwEoz+dagoszDFxTbo0/c/LJtAE6zC0chOaImCrqCbaKnjot/bHvfE412tiuN5wJEYl2Ld3EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751612726; c=relaxed/simple;
	bh=UBn+LBjax9N4GZfXPTV/0yYRe68OpjEpS5e1cFYqyMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCz2Q65x3WelanxeE9VSJQCJz5HtfJXT5WcYJrESgtt7tGtkP8kEEj/GkfMWNDh370NPVOd9xXmYY0SEWHxiT4dB1uqx3Hf2yuGkAbG8lk+CxfDY/zmNnp8fm/EJtFjVhLsgr0iR8Xa3iJ1td9yDCsy24hsOgHVtmYPkilNSiTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=WZzBcgBu; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="WZzBcgBu"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso619520a12.3
        for <linux-clk@vger.kernel.org>; Fri, 04 Jul 2025 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751612725; x=1752217525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=WZzBcgBu3ZD0HXOm8MishoZ5Db2MopL/9n7SiiP3YxcOCcl+zii4Me+DJ9yW2CqbWM
         7GBQr03Ibg+IDrIEk1xMhrT6xC4KL9Mr51XUTCzrPR68Xz9+e2UQbF43VANMOUJcaebg
         k2zq/6lSHNOAEim/Jjyk419KPtjG9voJCItwKCGPiwgWmbKhb7/xR42SvhSvvqBD/pBV
         UFM9rmUtGQ/ZzaiJxMHR3Y9OmUB0FIECgepVVAdJg8oSV9gMAWjEOLnSuE38TLu8q2ZI
         bG6EZ0dT+ckdeMHUCObhWE8PEbJsz02T4w2cj/AdYr+mPrklXKtnblgJOAZc2gxf2A/P
         q30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751612725; x=1752217525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bl+ki3sYBLOuIZdWtmik+PFOlIYEBNco4Pu8AxHtczE=;
        b=vhfX4YPXSKby8jAI4tIwLzVR3qKsH2h4m0nZIWMcMPnMIfGnjbYjZ3mVX1qekdTyQC
         RbtKwq51ak6rc/R1Evif3hEXirLMqYxXuAKgh57HebYVqrVTUXMSw/Byy1vci+f2++Q/
         4FtUBk0XKf+ttI+Z+RWoMDHusZfUCu3eRHsMjPDnYgJBBq6jEl2N2zrkBiNcm/gRFEP/
         Qyak361N7ZP2uvLLX63+K4hKvNMI2aYAYBqh2P0/lNMLU2zg7gB3Y9oP8TtH13VTbw1E
         zFXwO0EjNwimsqFIzrnJdsHW45lfFjYhf4GN4KbbRZ4Y+6sN8+XD9yhxecz6DjSOtWda
         8KeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXItvS2ZnEsJiNnesvnCKUBhHqq7Y+VDtKIQkHSWi1oOvyJWtyvXbp1832PfVGokX8w4woRioKcrM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiF99CbKWJOw1eU+nQDzmqwFpuW3UI6ddGM8SQ1xTjiHWfybGf
	a7o2MWONFWuBLC8V9Bc5cWD822RegB8Ukr/jcRi2gjZozzb6wCrpWk0Jao9nJySPiJ0=
X-Gm-Gg: ASbGncuxGEVsuBl/rgbF87OZKr9FCfRxPyAywZoSLN9ZDLTpsqSGPnBc2jaq52Q45ji
	xpqusDb3kilmRsrHmUYzaUDQtRW+mAOnYp+SeSukL/CPlcH6RFG9u7KtsW0z9YaKI47Mh6Dg4UR
	4JyvDlK6kqFD+8V5LP9ggESY92jOV+5vufskbqQJoZ3/yh7Uo2BxSwhjhJKodwW6qep8ZGCUrwp
	pXXjv7OeYpSH9BnuWxyb+7HG5tBQQoTqouNnqjwlk7xm4zVUOgsd9FMBa180K4k+Hd/okVereSi
	yYCFUUakmGPx/u2VhTfUC6PwWqZKrg7Tf3qN2N0l7givoZ25CvMG8DtZnhxbvpziXb7HNlOx+bV
	SAmNB1RGf9a2hN18HBM3MvJBBIQ==
X-Google-Smtp-Source: AGHT+IG2Wztw0stW3yOl6KCgbq0+m25wabHOLxe0e4i/arpNNnZE0epPwB2VK7aaXsKsyXh0wihgNQ==
X-Received: by 2002:a17:90b:2f0d:b0:313:20d2:c99b with SMTP id 98e67ed59e1d1-31aac44b34emr2635726a91.9.1751612724260;
        Fri, 04 Jul 2025 00:05:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31aaae59a93sm1358697a91.12.2025.07.04.00.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 00:05:23 -0700 (PDT)
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
Subject: [PATCH v8 06/24] byteorder: Add memcpy_to_le32() and memcpy_from_le32()
Date: Fri,  4 Jul 2025 12:33:38 +0530
Message-ID: <20250704070356.1683992-7-apatel@ventanamicro.com>
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

Add common memcpy APIs for copying u32 array to/from __le32 array.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 include/linux/byteorder/generic.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/byteorder/generic.h b/include/linux/byteorder/generic.h
index c9a4c96c9943..b3705e8bbe2b 100644
--- a/include/linux/byteorder/generic.h
+++ b/include/linux/byteorder/generic.h
@@ -173,6 +173,22 @@ static inline void cpu_to_le32_array(u32 *buf, unsigned int words)
 	}
 }
 
+static inline void memcpy_from_le32(u32 *dst, const __le32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = le32_to_cpu(src[i]);
+}
+
+static inline void memcpy_to_le32(__le32 *dst, const u32 *src, size_t words)
+{
+	size_t i;
+
+	for (i = 0; i < words; i++)
+		dst[i] = cpu_to_le32(src[i]);
+}
+
 static inline void be16_add_cpu(__be16 *var, u16 val)
 {
 	*var = cpu_to_be16(be16_to_cpu(*var) + val);
-- 
2.43.0

