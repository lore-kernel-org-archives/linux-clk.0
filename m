Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C5E3AE712
	for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 23:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789427158; cv=none; b=RdmBDShbeZJBsFdX6d0dqOEuxJv9rQNgckgLKS4FmCz2zkgLhsRYHuh+q9L1nt6u7YAz3veuJw00kAZp9TdxL7jtLqnyzIBm3gP6pDsfnsAP787oIEVx7EqzTe7pMR0kvjW0A3hN2o4LfDQ2uYqLZzl4TMpKYeOA2+AZqfiXojU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789427158; c=relaxed/simple;
	bh=DvM2FkkMtgzT44eWEOzcORIQVcJFd8w3S1+EpLGxZqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BffJ7oB1uecOyRoua3j0dhCmA0PxfjoPBA7lnVpOge2necWodwtxzbc4lphOXeaC2c6rfU5kGNFcWyndg+lYIkwGiyJPGJOXymC/M8OIWNvcCHdwx+PzuVnh+UbU6z49a4PkjJBLNEX3xwRAvK1qWunczhHGhXE59jYeUpvitF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SemjL3oW; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SemjL3oW"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843378fb37so1218732f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Sep 2026 16:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789427154; x=1790031954; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qr3IeifLYnQtsZlKRfNbzaoLm9KRiE+SR2X6IM4IlYo=;
        b=SemjL3oWdqs3K+qZsBPg+sql2eii3WJ933j8Dqnc+BM8NecVd7WsAsJmZ1lWrJfR7a
         CoD2lmFJdAK9nbhJs5DMtOpFXLlKTebAle6yKyuc49DoVtl/6PzAE/cu36Jw7NyGDp3t
         tIi4MlF7yb6rYEApsQArPW/zkRW1E+j9DnGU2ZeulvRA7Ifp7j2jcj4/KkQa/ZG/VhqU
         aNMIeYsUSmEJq/9/GlFmvuttCtlklgnFKDI9ZfT9hVy6+maeofq5w06UsFFsxnh2BV6/
         vnLJGteiupQOaUkiE0LBXD2sKXXXYGz18/pN1zYaZtQNCt7r1ihJhxrXFNvMXN5M4t5t
         45fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789427154; x=1790031954;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qr3IeifLYnQtsZlKRfNbzaoLm9KRiE+SR2X6IM4IlYo=;
        b=KOkUoqU3LvnXCKUThYCDR9ZTglDNKFb+Ei7qCN2xoV9eHkYZjnSjWQLqTV9eHSqQxA
         Ly+Qg2m5rKP7UKFBkGrOX59qBsdNjcmZC6ZcrzNtZG33g4qnO1kohGMK8f+vbtcGXVp0
         viGKdiI6HUB85fhMqEH64SqbeCXWxsxmYpT21e/eK4dxDIHLj2bZsBQY5fforEAKHK2w
         3akNAIUaDqYk0QZr3YFEEPvN/kcP3KdpDZpjrVT24dqKS3fBwEmiGWmuwTtKzRA2YQtA
         dDVKeUca1RDPBWeF8ZeClffRnUMDGvkLwH6Ne7828OrYG0e8E+A9uFB6fnqDmZDfl0t2
         sFFA==
X-Forwarded-Encrypted: i=1; AKwUvBySw9IPdwnUC0N3axweg+zeHmIG059q29se1YsbVFkEoQf2BPeqebbAXgDoSnDcFUUornPhIpf5aUI=@vger.kernel.org
X-Gm-Message-State: AFuF++nff8HBZyxiBD5z4yvNtZledzeyd5wRhTo7KZdV00qi9ufix/t8
	Moh/9dp9pqPwa18PN1BoqOINlfBvDZcKqp/XophIsYxiy5S1kMwuo3RrrNXN+5QUEmY=
X-Gm-Gg: AYBFou3wqiCBsMmZEb6kdPJSb6i7vSKG2qR2OgcQZNNSJZDZoUepnPksoqDP4wOEBOo
	V+MsjrcpS6Vq5RPZWh/jul7BGhw1k8QfAa7YF0yKlMGapQJrnKeedqra0TpzBBQuTrEFkXa9FSz
	mPT7g0AR5lnlesKjo6jqiSdwBBdzoTLawHnXxWDX12A0zvc0rHqqXj1k6kDjdA7O/trFDAYwg2C
	LItbSWHxBblFFwwYd3TsKqKSuqYjgpi0DR5KT9BZiQLpMZu7addn4juLQ7omn7gweSDFCY0bs/W
	Kume+9RxiH+excvB3hYcN+k43Med9bUzonbGnTTuyxZAo64h++aSbvTG78klkh6loAxr7jnM6bV
	9PAYR09tVw2uC0r7qnZwxqxG3RzCLQM1a05lWNGgT/7fXcHT54rjNJRWwA4eksWFCJXca2VAYXm
	T9BZfeXoKDtOlVltdRBoBbPSeueZk2FSgLXEVPdqLPXxk9ONCch1EKuRxla89jcEdUSGXWTthXK
	UUxcbZGlUGhF/LqdXYLFUJbAo6GcdV7+VS84r+k4raPrNgrHBynl6kNlcBAv9KWhu9wPBk6xw==
X-Received: by 2002:a05:6000:46c6:b0:487:342:d141 with SMTP id ffacd0b85a97d-4870342d1a0mr3551783f8f.23.1789427153803;
        Mon, 14 Sep 2026 16:05:53 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.85.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d5f1sm32098817f8f.12.2026.09.14.16.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 16:05:53 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Tue, 15 Sep 2026 00:05:43 +0100
Subject: [PATCH v2 1/2] clk: samsung: acpm: introduce driver data for
 SoC-specific clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-exynos850-acpm-clk-v2-1-ffad4a6b3fb1@linaro.org>
References: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
In-Reply-To: <20260915-exynos850-acpm-clk-v2-0-ffad4a6b3fb1@linaro.org>
To: Sam Protsenko <semen.protsenko@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3

Currently, the ACPM clock driver hardcodes the GS101 clock variant
arrays and counts directly in probe() routine. To support additional
other SoCs (for instance Exynos850 SoC) that use the same ACPM protocol
but have different clock trees, the driver needs to be more flexible.

Introduce driver data attached to the platform_device_id table.
Update the probe function to dynamically extract the clock lists,
number of clocks, its names and mailbox channel id based on the matching
device ID.

Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 drivers/clk/samsung/clk-acpm.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/samsung/clk-acpm.c b/drivers/clk/samsung/clk-acpm.c
index 7680bc8c5275..4b68b44fe615 100644
--- a/drivers/clk/samsung/clk-acpm.c
+++ b/drivers/clk/samsung/clk-acpm.c
@@ -12,6 +12,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/firmware/samsung/exynos-acpm-protocol.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/types.h>
@@ -101,6 +102,8 @@ static int acpm_clk_register(struct device *dev, struct acpm_clk *aclk,
 
 static int acpm_clk_probe(struct platform_device *pdev)
 {
+	const struct acpm_clk_driver_data *drv_data;
+	const struct platform_device_id *id;
 	struct acpm_handle *acpm_handle;
 	struct clk_hw_onecell_data *clk_data;
 	struct clk_hw **hws;
@@ -114,8 +117,14 @@ static int acpm_clk_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(acpm_handle),
 				     "Failed to get acpm handle\n");
 
-	count = acpm_clk_gs101.nr_clks;
-	mbox_chan_id = acpm_clk_gs101.mbox_chan_id;
+	id = platform_get_device_id(pdev);
+	if (!id || !id->driver_data)
+		return -ENODEV;
+
+	drv_data  = (const struct acpm_clk_driver_data *)id->driver_data;
+
+	count = drv_data->nr_clks;
+	mbox_chan_id = drv_data->mbox_chan_id;
 
 	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
 				GFP_KERNEL);
@@ -142,8 +151,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 
 		hws[i] = &aclk->hw;
 
-		err = acpm_clk_register(dev, aclk,
-					acpm_clk_gs101.clks[i].name);
+		err = acpm_clk_register(dev, aclk, drv_data->clks[i].name);
 		if (err)
 			return dev_err_probe(dev, err,
 					     "Failed to register clock\n");
@@ -154,7 +162,7 @@ static int acpm_clk_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id acpm_clk_id[] = {
-	{ .name = "gs101-acpm-clk" },
+	{ .name = "gs101-acpm-clk", (kernel_ulong_t)&acpm_clk_gs101 },
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, acpm_clk_id);

-- 
2.51.0

