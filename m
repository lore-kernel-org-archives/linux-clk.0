Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CBE3E4C93
	for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 18:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254403; cv=none; b=jjNRWMb5sbuBpVnh1fHxWd9Y89+2RPW6BXP7/6gk70ynZpbKVAxZ7+1pggo8qwVXIiy+3uWCJIeSIiIGVIUJom3qNq2tQAer27/GrL8cqwkZEeSJ386dOWVtq+V6OfTyTnlwGRNmYJ3cqhLi894u00KNGtj/e9XIB2cy27i4F00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254403; c=relaxed/simple;
	bh=92W5DvG9FEXKhrA60xxOmYpf4C0d4pC+Igs6Svr1LnQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K48iAVePxhVjqBBVPWjlLO1DOP/co0q3gOKfrY1rRpLT32Ht4CNQpN0QzEC/jolLqWPcXaZlWPPtDpK6BasxwHVubfYk7MPo14bw4YhGE56+BbMVz2RnqkqEK0bWazhJtAOnEjE0qvZjq1yBhUaB8Y2kQc+Ieqyat/T6pWLW1Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lnPs4ndL; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lnPs4ndL"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4853c3c2fe7so981165e9.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Mar 2026 11:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254397; x=1773859197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O11MQpTjXi0IhfBZB+y8IoMQOgCJromeEtSBGPquchA=;
        b=lnPs4ndLHy9zYBfDDo/Gr0ICAfY3HBF30YVphuFe+K5DCPkK0cEGry5Dyc33l449tY
         4XJJeKapHXitxMrZaQf48G0wis3XEh4DO+NW1YuLuqdyBtoLJUMoCQG1iQHrtBRe/Ffs
         0zGLVGT1FrK/6S/8ylwA4WkE8rixueAUMtImatwefnjxbmyvVkfvEzLK4pgefC70jr7G
         PrMqD05WASS8FsjjKo481ENKpQI+3DKQ4Nm1k3zmSbNyq2+gaiY3nQo+l7i895ljPEEg
         1WJly0M85hWt1ab9GOrMc/SvZv0S1hS+B1xItvZrLVgX5mFumtrhIZrmaJuUxnwBnWlX
         OZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254397; x=1773859197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O11MQpTjXi0IhfBZB+y8IoMQOgCJromeEtSBGPquchA=;
        b=S77gAkeUXaXjAD8uj1TZNyr7QTSCKJDAKGbrEMYIoCXGTJRAttDkPcrBkGPdS3T5uE
         uG2UStrilu9YjRik+kK5X2JZO9xTqBtr2tyTTe7GOtUB0ySNPeekaepX/qv0wxFArVcO
         gqkbemTVlxcO1ftNSRkPi+eJUBUMj9nMSNa9+rK1JNWatfwzyhafFAhwfkx2d3tm8o7U
         wjT+fvC5OseorzRU36oGc5OUJVFMuupcn9muOwExG9Hph9fhysDeAv/gbjfKzgzPXorc
         8J0J/tIqs0XMZh3+miQaxVBrnA4ASEBSacFRlLL0E9rg0jLddp/sH1WiuqofWgxbFUHo
         BgzA==
X-Forwarded-Encrypted: i=1; AJvYcCXDGTmFUBkxMB/igfJfsejRYhEhNr5lwofRwzh5FGsu4kBHDZy88LlF678PVAaYUkINtObOjNH5r4Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMfX+2fSYnZknANOeR/TWDFy/T1FKdEp9q2pV80Evst+f9uaQs
	rGRHUhZTmsliJj3vojK+wUfLunnQ6xMPCTmj01piNvrtMcojcZiEKIWO
X-Gm-Gg: ATEYQzxwTqY8SQTa6AE8lFG1RVjN0ELSGC8AvUlDpiU/PCrljKFU/yllf/lKheHjiZ0
	HQhDCvVKs/BKDaQ+v8dL6+7Ln5LLTgfc9N6/tLItEvm2yXKurKuL72NOTE7z3tWBNQU+dIFHy8v
	hu7zn/mUCocf85OeqwMXlQwEpry+l9nGZEtaLLf1n2IXNOnEhYLU6oaxTtF59Lnbu6XuSVMW1xH
	G+MoyIoMNDAAJldWs26ClFTwvo5mPe/8M+x/xS/SCFsPdGCwpO4UFKy/OSXlMF4NFk/2ruB8eSt
	32S0lQ+m1lFJMGnES8rcfuSD7naxZHEz/YWM4B01ux9F+SGK4x/HsSJjrqEcWaYV9qtY+cggIQS
	FUCHsaw+jFZKdn2UfjkQnlpL2KPxuVynD8y6R9/52S1rHTknCRT3hrncu+RM+H4nJ+GzSDPKb55
	mbxc9Xj7B3jiVpNEd2myl0iQnInc9eWU1cI2NYolvDJtcDciDIjviy/Cg=
X-Received: by 2002:a05:600c:4fc9:b0:485:41c4:e2e4 with SMTP id 5b1f17b1804b1-4854b11acfamr64729515e9.23.1773254397353;
        Wed, 11 Mar 2026 11:39:57 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541aac28bsm161176675e9.1.2026.03.11.11.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:39:56 -0700 (PDT)
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
Subject: [PATCH 4/4] clk: qcom: ipq-cmn-pll: Add IPQ8074 SoC support
Date: Wed, 11 Mar 2026 19:39:41 +0100
Message-ID: <20260311183942.10134-5-ansuelsmth@gmail.com>
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

The CMN PLL in IPQ8074 SoC supplies fixed clocks to the networking
subsystem: bias_pll_cc_clk at 300 MHz and bias_pll_nss_noc_clk at
416.5 MHz.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 28d655d6320a..5763e4df59a1 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -53,6 +53,7 @@
 #include <dt-bindings/clock/qcom,ipq5018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
+#include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
@@ -124,6 +125,12 @@ static const struct cmn_pll_fixed_output_clk ipq6018_output_clks[] = {
 	{ /* Sentinel */ }
 };
 
+static const struct cmn_pll_fixed_output_clk ipq8074_output_clks[] = {
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_CC_CLK, "bias_pll_cc_clk", 300000000UL),
+	CLK_PLL_OUTPUT(IPQ8074_BIAS_PLL_NSS_NOC_CLK, "bias_pll_nss_noc_clk", 416500000UL),
+	{ /* Sentinel */ }
+};
+
 static const struct cmn_pll_fixed_output_clk ipq5424_output_clks[] = {
 	CLK_PLL_OUTPUT(IPQ5424_XO_24MHZ_CLK, "xo-24mhz", 24000000UL),
 	CLK_PLL_OUTPUT(IPQ5424_SLEEP_32KHZ_CLK, "sleep-32khz", 32000UL),
@@ -456,6 +463,7 @@ static const struct of_device_id ipq_cmn_pll_clk_ids[] = {
 	{ .compatible = "qcom,ipq5018-cmn-pll", .data = &ipq5018_output_clks },
 	{ .compatible = "qcom,ipq5424-cmn-pll", .data = &ipq5424_output_clks },
 	{ .compatible = "qcom,ipq6018-cmn-pll", .data = &ipq6018_output_clks },
+	{ .compatible = "qcom,ipq8074-cmn-pll", .data = &ipq8074_output_clks },
 	{ .compatible = "qcom,ipq9574-cmn-pll", .data = &ipq9574_output_clks },
 	{ }
 };
-- 
2.53.0

