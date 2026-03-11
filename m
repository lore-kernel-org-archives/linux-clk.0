Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082721FA272
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254401; cv=none; b=LPNwnDwX5kY0zn2nYwGrm11NA/RgEqFX2+tT/NKis2Ugt8cN95JVC6iRE9WlUSmkhGDZgKDSe/rVtv6fzv73wr7gLD/GMU9S29OJqt9xyYU5BDEvKmzCDnbwTgj5lTWhbiBGAzmgq9Z1eKMmaIRiYnh6VnPJMXYgyef9OrY+WEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254401; c=relaxed/simple;
	bh=l1kAITtOZcQOmSFLzPmQl3EIsJ/gX0Hpg+PJUyHpctc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O4qRTbtxoI2ksAnz+XSzMW4SXFEof8qGyDd9WQOaq3E/XlotbThhAZIq2b55rGuDrb5rgu9wsnNr70uTTWgS/X+Qya7c/bMKyXI7p7JBufQ14gzEGnVWYB0hzfbHte2QatnSjT+DuxME5yczLvba+Cn50d6gq0KtdxyUw/X5rdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsIX5GOj; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsIX5GOj"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso1423355e9.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254395; x=1773859195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cm4Ve62f3rcwFTWsVQvRStE/hVreGVU1FcOWBt3eIAU=;
        b=KsIX5GOjYv/S8g6KCjuks1wZflpCKL1EH1okeJbbsWk9xPSk/B+D/EUYIP8rfS/nu7
         NY8z6QVpUhyq+O46PPKCq5WVOeOJ1aez6GxGMmDuzngFD5G1mjvE1zREQ9x75uEmzNqi
         LB4FdOrDlSO1OJxLYcKLpD0QO7KHAnOx7H6vhimK0RUZ16QsRnBMD/bHPcpFpNMfL2D+
         7DxvqWa4vqYCt7focD+xufcIb4nIDqfIFwjjDN41X8Rt7db1yzoNqzNGprypHSEtBkNf
         scZ6V7a6ilcLOdtFOnwlqVhSckmT8KyMjPucnsStUtGR+x3pN1I51qJdAKzErCvozxVo
         Ujow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254395; x=1773859195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cm4Ve62f3rcwFTWsVQvRStE/hVreGVU1FcOWBt3eIAU=;
        b=LHyNC1nm8+DBVVDnUKWAztMf756eyeiS22iY0+e9T9Sgmh7M6xmLyD4n27h/tAKcer
         MslpAohqywzZWaFgxlxzO4pLG6+dZ+PsCHyfgNUizEeMh0pU+ntI5i41+iNO6nQ884ME
         Y+4iXU6R/qduiJxJN1TAQQiX0G5wUce/KWWo73PeaCzR3pfhczjLW2II/DJ/Bj5isH8w
         bveMkuAO+79zHqnQJflVwEhtTUgg6GpPvH8TPh5Z928rqU5DqFiJGwZbSsOdMNNXJ24c
         Btsgn5IfWXgO6o+Tw8yvmyeBP+7OWf+U3u7w0jx1HTkBhZkEBoqvfrKxT6uRyDY+4Ch/
         Dqug==
X-Forwarded-Encrypted: i=1; AJvYcCWPh9Uy0Jw4jVxj9EJzvA0T0NUtDcSAnEuGKtBOZxP5fjlHn1exeyi76+MGpqiaeKJS4cZdvvinapM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrPKMJp0M0rw5imNeSaP4X0qpCzEKEe6yg8F0/ykXVUrpbIE2a
	oi/qN6CKrnKznikXACtXkKxsu95HYw1aYVWs3a1NTCivBE/4Cl8jPNrh
X-Gm-Gg: ATEYQzwD4lyHlHdPoS21uQywcOelaKc0XeYHSoSxTzm+XCd3a6d1jYWm5sM1QWL3V62
	83xge3HbJ4uiNWhNjrDe5Ril3udHUubPdTPAeZaj8m8/A/KHmTCpy7Ad/MHpq1LgOO6xkuXkReX
	TOtMUuHPFoaLFI6zobKN0I5Q94SpJFHsZHb2Rs6V8NooqSOrAo2GwJNKYKIgWsTFjrBDBB2biLg
	yYHhDHvBfdagHOZlYvQGCYz6xdT2bCmS+60rKwRKWu6Mp64hLA1w80Zt/K+WR7wwG9XuVoNbqx+
	XGRshkvLiU9E6oTKYuwFvqUfhBz5HsfkdNuYV/5Ai23ZaOEgqSLKtk97VGDuwjMuMRXnz3YXsRl
	+99rH6JGb+aUSs48F6sd8Nndrxf0/3CMCy4+XGt+w7jFK6Vt5RB/pLIwcL9BtMe24sQcRv0Rv03
	sFAPhFmHjiOBsgQ33Nw3vyZMyQbe5nnjKwQlw3b7YsKsGdDf1XZWIKt5s=
X-Received: by 2002:a05:600c:19cf:b0:485:49c5:8eb7 with SMTP id 5b1f17b1804b1-4854b1012b7mr62036215e9.22.1773254394912;
        Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:54 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Luo Jie <quic_luoj@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
	Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 2/4] clk: qcom: ipq-cmn-pll: Add IPQ6018 SoC support
Date: Wed, 11 Mar 2026 19:39:39 +0100
Message-ID: <20260311183942.10134-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260311183942.10134-1-ansuelsmth@gmail.com>
References: <20260311183942.10134-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Crispin <john@phrozen.org>

The CMN PLL in IPQ6018 SoC supplies fixed clocks to the networking
subsystem: bias_pll_cc_clk at 300 MHz and bias_pll_nss_noc_clk at
416.5 MHz.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dafbf5732048..28d655d6320a 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -52,6 +52,7 @@
 #include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
@@ -117,6 +118,12 @@ static const struct cmn_pll_fixed_output_clk ipq5018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ6018_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
 	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
@@ -448,6 +455,7 @@ static const struct dev_pm_ops ipq_cmn_pll_pm_ops = {
 static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
+	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },
 	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }
 };
-- 
2.53.0

