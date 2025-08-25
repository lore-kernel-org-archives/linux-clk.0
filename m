Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3221B2FCBF9
	for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 14:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756132034; cv=none; b=EixNVK9FdUJ1kEYvI+dmprZu6d1FcUsOyTZBcsCYWmu/lw2dUq4r49OKy6Ta66bfhX6u4o5RzYnSh3Q+qOlRBK9STaFEAUUquwYp2BwiGJz+gLksxhzOJ4o8QCQnnowF//mOOVObr7b9OUedbYN70WKineHZbFINs1R6ILu5jQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756132034; c=relaxed/simple;
	bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dwzzhsnp0NvRedOI9rzVV4t4mN/7UVr659CWMONjXHyyiFCbdvwlkXFwQ6H0N93VAgLzKT9gtu+ye+RvrctFrYGUMEeWWHK7GvwpfKa8J7R4xM78+t8TACKCm8f80rpTrQNUEv8gfOaoioHNJjXOmb6fJv0B0AeCCuMwRVRGUWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bHfKq4pP; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bHfKq4pP"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3c98b309804so869041f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 25 Aug 2025 07:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1756132029; x=1756736829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=bHfKq4pP1L8QXyHmrE3MH5F1giPmr7VN1c0rp2g3XX71LvD6vVill6AdNgOfY+sU9p
         XyjVtl9jA7R1vwZjqjbJNR2ZsIwG3/3/JIIGKwPQ5nNl88CBg+1lJUw4TlzihmGzwEvj
         XgYg2r6cAzh71SaMotH5QMCwrqYC44KmiRe62L0TA7Q+6LXmucpnVUmRSuDbryjACBFV
         st/ZG8ddhOewEKK7hYEHRXuBQT2IAk300lDxA22sZovN/UX6gvdUPhxbArFIbjw+CfEY
         i1wQFG4H7uP2Y2xJvqiSnQPS+l8JEc8XRDa5lDpoO5N4JEsDtRttQdTyId+cclSzb/rm
         jn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756132029; x=1756736829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKeGjfnHALhz/AAzO7aZ77kwy1JfZMTwKgyrIVs7M5M=;
        b=f/sIEKthfI6tANMyQLM3/5Bbjijdwf3SWd3faZBjq7xTX9LBpA8SmhYXxHyd+2L1zm
         wbfBVu7UHgplbjzPxdaOJ4/Oap0WF4rNOYGmOjiDKOi2kQKll21RBC+mZYIW+poY3G4r
         NANhe8L9FIislV0OF0jI53GVjsVLTI3a5krb2ytkPQE+3GmU4BMsdjtJI/+ktr7/mRO/
         o/ZsLe4UDrTKtoJ+rBhAlKyF8GHTLhBWzgzUB1QYaPpu2j9IIU/5ZyuPxtxZXQsaDTAQ
         IMGXLf9FUlAjZys81KCKZRLtF8FtdNHVXxic+AFUqnN8y+Qlj6X6C3khvgnPqExL+xmN
         lluA==
X-Forwarded-Encrypted: i=1; AJvYcCUE1iyUWUrnD8EX4J803AzyE87IHXY7r1c9Ll614UYQ7CE3QKwkcdrUFwtLTLP7J4aPVQOghFOaxHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YykK2zDkZeXCCG19uFADIOFaQGcIOhQGwSrpdlB5MWsPC34HGwf
	kVc2Ji5mQmyGrT64a6g+M8bf1uT3pk2A834M0cqxIJajwQKpVelLUcV60zqr23j6wEw=
X-Gm-Gg: ASbGnct19xAD+cjuvXwNjmtO472LUkcPVqJrlpalykQhjqkChaDd/BvJNmKe5zI8vWB
	MmHa/5WwJsC0iT//AnQK932DHq28PA9ExcXHV/QPNUCbZgx77/IxU5o8fuibKnpNaLU1W8BlHkJ
	57wA4JTWw0l05Wv04DUEnoX3Ibx2WnHEelj9tuo42Np5noMrvGYQBocgVpsp0SVu8sN8gl6ZH6W
	oykMA30JyhBevi304qQl5mdhYYMlqCkbA53MwxRrzBMaZhthNRHzOyEm1oTuwKIGH0sQFW3+zA6
	EUDhdgCbSO5Lo9NKs1Lwiuri4yilt20YPOHkhDGwMGb91H+O0mrJu1/pMhQC/3O9V00eOQ+TGlM
	CgZAcutZzo5LhejUyuJbN5+YXc5vPOiIgLX4t
X-Google-Smtp-Source: AGHT+IHt4lgpYTFRKVUdHW44E3mNT49oLGAxgQr8oV91u9YCleboiVtqxtigsGd/l4FjIi9FOMDqlA==
X-Received: by 2002:a5d:64e4:0:b0:3ca:6a35:13f4 with SMTP id ffacd0b85a97d-3ca6a3516c3mr1642673f8f.46.1756132029030;
        Mon, 25 Aug 2025 07:27:09 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:b261:baab:ed3d:3cb6])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3c70e4b9e1fsm12634462f8f.14.2025.08.25.07.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 07:27:08 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 25 Aug 2025 16:26:29 +0200
Subject: [PATCH v2 04/12] clk: amlogic: aoclk: use clkc-utils syscon probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-meson-clk-cleanup-24-v2-4-0f402f01e117@baylibre.com>
References: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
In-Reply-To: <20250825-meson-clk-cleanup-24-v2-0-0f402f01e117@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5340; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=ey5cZdSnxDBMQWblcJDibJDA5OZgFBnUd6WG9uhMGLo=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBorHKxESzysED9LwfQG3fV63KVp0SL8l2UgmZXi
 8CCokopy0WJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaKxysQAKCRDm/A8cN/La
 ha3yD/9FcCX7DiK/3I/l/3yH9yWepYrt+n+X3Gsl9mHQ0mS1p7l2/X+flH6m5LUNMEZDZj3203n
 +XvvAepAIKNwsGiqA00GHEmFIHZZmb1zgbjUx5zO80SjyPOMrXyxh5Ur0yM/9Jq6D1c0XqBbb7Y
 vpr+z7bmk2PphcrU+eA4R3aJo2EJFsHxSyQvtiNO/wAsQQMM35SM/goZyXvG5sUSND1FZuw9QMF
 lURAPl8N8+OmKOIrHbRndwoNnyRMM2MzZpoE+mh4i/x8ObxZisk5hn1its81dCEXuct3CxRdxPi
 K/IOo62RiY3lZGIhJ0lIubUW5fWLE+26rnwq7qfyqxmvZ68ifUzLMvJbYc5gU1sTSLRYdKiSVVG
 fdX4jgbLi8iWJbUd64Z3Qf5fJGlWlqWzcroWZIGciOM2+lI+Tp54TX2x+SiKcBbbh8Q714YoiTt
 pfkladXgNyTMzwJLYsPl3/8YDTDS8SOzrXtb/P3eq6Inb63FyTjl+FfwvXE3qg5pV0hpHoxT8Yb
 CAbnwrPNULHYs9jzbGFSZ88sl2Ds8KXNn9IcYA19LULt9Yji+Od+YwBJvM4cfbhT22/hLSK8XbG
 +agSjfpjdmbbzE3WHEIndXwlvrYZxYiVxeAAjEE6DOtZVQpl7eePNCi0vSTKHEJaeyQklyofR0p
 xu7N++N9VE+YEyA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

The clock related part of aoclk probe function duplicates what
the clkc-utils syscon helper does. Factorize this to have a single path to
maintain.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/axg-aoclk.c   | 10 ++++++----
 drivers/clk/meson/g12a-aoclk.c  | 10 ++++++----
 drivers/clk/meson/gxbb-aoclk.c  | 10 ++++++----
 drivers/clk/meson/meson-aoclk.c | 32 ++++++++++++++------------------
 drivers/clk/meson/meson-aoclk.h |  2 +-
 5 files changed, 33 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
index a0c58dc8e950a05c340c3427af4f6ff7661fa84e..efc33fd18c197df233d537e5f8244a376d4d0924 100644
--- a/drivers/clk/meson/axg-aoclk.c
+++ b/drivers/clk/meson/axg-aoclk.c
@@ -300,16 +300,18 @@ static const struct meson_aoclk_data axg_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(axg_ao_reset),
 	.reset		= axg_ao_reset,
-	.hw_clks	= {
-		.hws	= axg_ao_hw_clks,
-		.num	= ARRAY_SIZE(axg_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= axg_ao_hw_clks,
+			.num	= ARRAY_SIZE(axg_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id axg_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-axg-aoclkc",
-		.data		= &axg_ao_clkc_data,
+		.data		= &axg_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
index 3eaf1db16f45a0adf0acd901ed7ae1f51a9c8dc1..872a7b800bb86bdf1ead56c3eec7e47f30637dbd 100644
--- a/drivers/clk/meson/g12a-aoclk.c
+++ b/drivers/clk/meson/g12a-aoclk.c
@@ -424,16 +424,18 @@ static const struct meson_aoclk_data g12a_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(g12a_ao_reset),
 	.reset		= g12a_ao_reset,
-	.hw_clks	= {
-		.hws	= g12a_ao_hw_clks,
-		.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+	.clkc_data = {
+		.hw_clks = {
+			.hws	= g12a_ao_hw_clks,
+			.num	= ARRAY_SIZE(g12a_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id g12a_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-g12a-aoclkc",
-		.data		= &g12a_ao_clkc_data,
+		.data		= &g12a_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
index 11b11fa7791eb1903938c0d3ee46121a23b94a46..ce8d2e9e071759ab8b8aa8619ad7400f1513c319 100644
--- a/drivers/clk/meson/gxbb-aoclk.c
+++ b/drivers/clk/meson/gxbb-aoclk.c
@@ -258,16 +258,18 @@ static const struct meson_aoclk_data gxbb_ao_clkc_data = {
 	.reset_reg	= AO_RTI_GEN_CNTL_REG0,
 	.num_reset	= ARRAY_SIZE(gxbb_ao_reset),
 	.reset		= gxbb_ao_reset,
-	.hw_clks	= {
-		.hws	= gxbb_ao_hw_clks,
-		.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+	.clkc_data	= {
+		.hw_clks = {
+			.hws	= gxbb_ao_hw_clks,
+			.num	= ARRAY_SIZE(gxbb_ao_hw_clks),
+		},
 	},
 };
 
 static const struct of_device_id gxbb_ao_clkc_match_table[] = {
 	{
 		.compatible	= "amlogic,meson-gx-aoclkc",
-		.data		= &gxbb_ao_clkc_data,
+		.data		= &gxbb_ao_clkc_data.clkc_data,
 	},
 	{ }
 };
diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
index 894c02fda072ddd0733165d5f60efe1d0da2388d..8f6bdea181197cc647398bd607d8b004ac81f747 100644
--- a/drivers/clk/meson/meson-aoclk.c
+++ b/drivers/clk/meson/meson-aoclk.c
@@ -37,15 +37,23 @@ static const struct reset_control_ops meson_aoclk_reset_ops = {
 int meson_aoclkc_probe(struct platform_device *pdev)
 {
 	struct meson_aoclk_reset_controller *rstc;
-	struct meson_aoclk_data *data;
+	const struct meson_clkc_data *clkc_data;
+	const struct meson_aoclk_data *data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np;
 	struct regmap *regmap;
-	int ret, clkid;
+	int ret;
 
-	data = (struct meson_aoclk_data *) of_device_get_match_data(dev);
-	if (!data)
-		return -ENODEV;
+	clkc_data = of_device_get_match_data(dev);
+	if (!clkc_data)
+		return -EINVAL;
+
+	ret = meson_clkc_syscon_probe(pdev);
+	if (ret)
+		return ret;
+
+	data = container_of(clkc_data, struct meson_aoclk_data,
+			    clkc_data);
 
 	rstc = devm_kzalloc(dev, sizeof(*rstc), GFP_KERNEL);
 	if (!rstc)
@@ -71,19 +79,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/* Register all clks */
-	for (clkid = 0; clkid < data->hw_clks.num; clkid++) {
-		if (!data->hw_clks.hws[clkid])
-			continue;
-
-		ret = devm_clk_hw_register(dev, data->hw_clks.hws[clkid]);
-		if (ret) {
-			dev_err(dev, "Clock registration failed\n");
-			return ret;
-		}
-	}
-
-	return devm_of_clk_add_hw_provider(dev, meson_clk_hw_get, (void *)&data->hw_clks);
+	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(meson_aoclkc_probe, "CLK_MESON");
 
diff --git a/drivers/clk/meson/meson-aoclk.h b/drivers/clk/meson/meson-aoclk.h
index ea5fc61308af14c63489b7c72410d9d981d8745b..2c83e73d3a7753c2094d2acc7c75b524edb5bb9e 100644
--- a/drivers/clk/meson/meson-aoclk.h
+++ b/drivers/clk/meson/meson-aoclk.h
@@ -20,10 +20,10 @@
 #include "meson-clkc-utils.h"
 
 struct meson_aoclk_data {
+	const struct meson_clkc_data		clkc_data;
 	const unsigned int			reset_reg;
 	const int				num_reset;
 	const unsigned int			*reset;
-	struct meson_clk_hw_data		hw_clks;
 };
 
 struct meson_aoclk_reset_controller {

-- 
2.47.2

