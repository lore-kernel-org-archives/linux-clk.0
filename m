Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB26E24E00C
	for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 13:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744897479; cv=none; b=D63dnM0lG9Rbl9I5h/NhQkz023nPMTE7EPtCUErpo44KmiHbKH2x4eez+FnJywtHgz0r9IqsylgnMgW1Aod3x87v+IdQJGqgDHllfMxJijdDpETCOe5DUjeIZd0f0CfaTlyjOpB9FnU14D9szv0ytZXccp6Q2/lH6m7hvS11/Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744897479; c=relaxed/simple;
	bh=tU3V05jhQullaooJeoNgHG/weKtABakyMeEGO6lArHo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HKxDB1GAW8aZPemQxKZ/ImXRR6Plm8s6s4E1Ea1Kf7DPGz8s8H3cwxo4GnMfURvO7I1NQ0IWUF6o+7EcRxmvaMaqK0qS4QRbLyELOoYbzdCVZSFknaMce1cxg5UxGj83YC/Lkfos7xcN62g8ZtrnM5qnr6VGuIxvY+cSsB1lilk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QHIsRFY7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QHIsRFY7"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso5978315e9.0
        for <linux-clk@vger.kernel.org>; Thu, 17 Apr 2025 06:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744897475; x=1745502275; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nU83/Q3lqWGLR3UHxt7XR3/5paElPjXKNr8qPQv0P+I=;
        b=QHIsRFY7fbmJKaSz1h1JoBmcfJQ/LOpSkXP7rBnPnial4jQVjQ4VNDTk9KjBolPT1d
         y+Ty8Gs5BClk1hOccmvRVlRG+wOYG6irkDxCo4Yr5YbLCC4RIXQczQ8aVITixXzeGmP0
         DczBcPkM2huWa3yxZCALoyo2zb6xUPSeP8ou42Ih1THCxm1GvqsEYyCjONulMd+f59Ae
         gXk8bYnwZh2WU++z2oftiQkTrODnRYB2N5mu0W0bPSEbrV4pmWKeHHBrbPQ1PtjA4LFk
         QBiYwzUPkRY7olQUv5ZVktUdZlZjoyK3JBpXVvPcu0gYqXxfUm4q/1Lgk6pKR+huGT5e
         4oxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744897475; x=1745502275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nU83/Q3lqWGLR3UHxt7XR3/5paElPjXKNr8qPQv0P+I=;
        b=aNatzgYc3OQaYAQncR7oHWl+m1DIfcMPNBOxgubG9NSY/9AX2/1MT3iIoAMQrur4X+
         Y8GlYmQoED3nA4dZR0sDbWic0sHEE3FqYllDk1O199ncq1/Nb9i07AuwB+uTpGH1v7vq
         tkppp/+iszEvSm0uIQZaitLiC21oUDMnw/I8+cIGZSqy6ydtr/bjG5jw6komqcVcWRez
         1Oht139n2fYbYYsA0jKE5myFMju1M0r3CDyN9iBfROsDss7cSn/Rf1nGpo4raTXqn9Wa
         gEP1Uf1HkwlYnSlwgUKY/NN3G0Iizogg9EA4eEr9g259Pwt0rkDocMcD3dnCWcu7VqqK
         uMnQ==
X-Gm-Message-State: AOJu0YySjTV+1i/3F9Prlul1TcGGEdT0MDgIXo2yrnXGQmyPkldRx7ga
	g/sf3gFIOCFCfl6IMueKNLjEJhbTh5timey+kv8CJe8hqTUmU39URn3BUyG7G7XojCmWETV46e1
	w
X-Gm-Gg: ASbGnctiNPUyoX2Kk+stp+YKMYwhLoKZacOJQB+IQeVSTVw5T71DJu+g7I1ITNNaKFb
	rOQu2KLSZOmuy2++a/oUbg9B/2UiEjZrgtStqXK4B5qx6BussT6WWLwyfRiIsJqiqjPVoJvnnuA
	SrGx0QjiiLRm6fJd5S8DoL4vt7RrJZYSLhPFkygCLjwNIk+rGCwZK9Zk8nDtgMBSKL5n/Qrs4vT
	7jbShaE5vUNtskJyhBzubH/i3jzg2DXBkq5IeJTgFNjT70YbgrjjFKpHSfB7PNxswRVKxEtzD7c
	Byly5Vhfo6M+3MYyyMj0vHLa+C4HqloLJ6s4DFnJdh7/Z6xY0rfKZt0=
X-Google-Smtp-Source: AGHT+IFtZm0nX+xRr8RW0qfpHEY69OZaCbvVJ/866PACgwrK/SM+ZJkdegmJ5AGlfTMTegyA/+Qb1g==
X-Received: by 2002:a05:600c:450d:b0:43d:82c:2b11 with SMTP id 5b1f17b1804b1-4405d69b537mr44482305e9.23.1744897475010;
        Thu, 17 Apr 2025 06:44:35 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:2167:2c91:1c64:6619])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4405b4f3227sm54667495e9.20.2025.04.17.06.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 06:44:34 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 17 Apr 2025 15:44:22 +0200
Subject: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device or
 device_node
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
In-Reply-To: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2566; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=tU3V05jhQullaooJeoNgHG/weKtABakyMeEGO6lArHo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoAQW/+d+R1tHoBukmIrCSQUS5wX5OiAescwxps
 5h09qL7j46JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaAEFvwAKCRDm/A8cN/La
 hSk+D/0dt5Pe9H+FVd2tbtrSD5RuJY5tMEE9KctFOZOj8rZ0H+ttnv0fpdDLV3+wcLCTyU0e7EM
 T/lKbyk09LYwmuRz3y7JdFDhsEQz0w1kdeuot7+MpuZpMKcBod0I2U40iwOIgTbp7ZBSf1M/dmf
 2xQ4icBMJyKdAztcHIRhgZdkdoRbH4oe1PLxF7vE6g+fK/ikGzPqhWq9Dsabovp/dQQRH9EBn6D
 gqYPCY7ZTr0D3Zdci18xCjZ/+Q1qNNzjpGkCIxOMU1wdsJTL9WFiZdW0hmvUba3mqadw/AjY7g/
 NypizNOKZWMXq115vAIzVLJhJmf2AnKOrux6f8SDzPn/W6m7AB/+NX4qszJlXvmgsqH3igwU7Sn
 lWrpcC1g7CTjUBvjlJu+RukcIhf3xnSE8iIQ/kVUrvW1AUT3sQDHce4iCm1v50kcC4t5bLB1+cT
 kgejLocI6Yx9b5pitpj/o8EVOODWdU6EBy5IKq/FZsrROcJs04xb5bWiAICKV3Hhl8yqvc9HhnI
 mHbtKbflqVtE0RebkTwlnUIl5K2zBSEIWQ2PxS/J+xapqPFKT6U86Vzq52hYRAISJKrT8P4txDT
 a+fCJD0mSdf6bqeOxg4OuimjAaqmFON5yBSvbnDJx8EWVdXMHO3+ULxJUsOKBgWZGQ4bB8MGSQm
 T8emD+tvPjhV7CA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

Add helpers to get the device or device_node associated with clk_hw.

This can be used by clock drivers to access various device related
functionality such as devres, dev_ prints, etc ...

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk.c            | 12 ++++++++++++
 include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..b821b2cdb155331c85fafbd2fac8ab3703a08e4d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -365,6 +365,18 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
 }
 EXPORT_SYMBOL_GPL(clk_hw_get_name);
 
+struct device *clk_hw_get_dev(const struct clk_hw *hw)
+{
+	return hw->core->dev;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_dev);
+
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
+{
+	return hw->core->of_node;
+}
+EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
+
 struct clk_hw *__clk_get_hw(struct clk *clk)
 {
 	return !clk ? NULL : clk->core->hw;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2e6e603b749342931c0d0693c3e72b62c000791b..630705a47129453c241f1b1755f2c2f2a7ed8f77 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -1360,6 +1360,32 @@ void clk_hw_unregister(struct clk_hw *hw);
 /* helper functions */
 const char *__clk_get_name(const struct clk *clk);
 const char *clk_hw_get_name(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_dev() - get device from an hardware clock.
+ * @hw: the clk_hw pointer to get the struct device from
+ *
+ * This is a helper to get the struct device associated with a hardware
+ * clock. Some clock controllers, such as the one registered with
+ * CLK_OF_DECLARE(), may have not provided a device pointer while
+ * registering the clock.
+ *
+ * Return: the struct device associated with the clock, or NULL if there
+ * is none.
+ */
+struct device *clk_hw_get_dev(const struct clk_hw *hw);
+
+/**
+ * clk_hw_get_of_node() - get device_node from a hardware clock.
+ * @hw: the clk_hw pointer to get the struct device_node from
+ *
+ * This is a helper to get the struct device_node associated with a
+ * hardware clock.
+ *
+ * Return: the struct device_node associated with the clock, or NULL
+ * if there is none.
+ */
+struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
 #ifdef CONFIG_COMMON_CLK
 struct clk_hw *__clk_get_hw(struct clk *clk);
 #else

-- 
2.47.2

