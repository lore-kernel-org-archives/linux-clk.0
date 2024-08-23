Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A7C18E346
	for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 15:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724427540; cv=none; b=fUFer4Vd0ZNGIruLhCuNIUIpctBgwwlLhGciN3e8y3o5mlHm0x/hbX0BJz5UzSCi8F79q6PlImKlbgBpEDmvvLYKZBSwTs3m2pzkrn+uXVsp/zOMJKYeVLK0aEOof+tGgDIpYTesjBpiw3s6H2Ce+WTi9wZykZ6LoqHlRRJ02uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724427540; c=relaxed/simple;
	bh=l7a7u0My53bkxxah+iS3TThVKBAYiSLyEhlPU4rJbTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EkCmPdbn9VXXVpegAMCvIHLTZtF4gHD4FTrejl/t+sugr8KxwxO7r8RuqHufxxTJ2U02xmjsA1IuyfvY+UUqyhwZjEQcclDLFMkTei+te0l4a5J0PkNCqpsx/ZpflcjGxpEc5/fRIN7Y3kNytcSMLYLUWZ9X5Y1ebmBCYhmxt28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjnAJi5+; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjnAJi5+"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f4020d2c65so4242231fa.1
        for <linux-clk@vger.kernel.org>; Fri, 23 Aug 2024 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427536; x=1725032336; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy0emVGM/pZ3IFD6JVSFNjd9kWRX/zwsWuupwTClnF4=;
        b=tjnAJi5+zyTXNKSD/NDeZf99d7kVL60aPzEiX3GhNY7OuQz3rFi7JBLZUODCbgGG2x
         j1zLgqJ0cbgurO30k+a327ybvvQN6TI9YwUShrEUTKP3BNxfSRseImyxZeJUyKhziMSp
         SCY20U5vKZPzsvR4t9+WuO3Z1ELFEC9fWcY823aPate08OfT3zOWLHZjllcDN8fI7o7Z
         ixxyE9HAXzSOzureTsBiL6yls9WAnIoar0SJjua6IG+P/aI/434LzSYx7AM/UXsG1E16
         PBpde/NfxygoVEaqYqcM6JHpQTlSLkx9LrKvpEDqImKI52aj/a7Pvl1iZ3ci85AMaj5h
         i7Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427536; x=1725032336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy0emVGM/pZ3IFD6JVSFNjd9kWRX/zwsWuupwTClnF4=;
        b=I9ej3zw2sYdO7V9fOjoWWdCXmc30mOFoepzbuNwvQHeHxFVqN8iuqK78qRYDTH0Ddn
         lizOE2jRd3EnN9NbEVeaerecAbXtYXxNM3nFqlC3pTHqCL5LuiKRngfr7h4c3c8rPFoD
         yylbgDb6LsbiVqqzp3oQufWB2RZVkkBws0wXas05c2qkunYjJTqo86ItongJrVHD3P5U
         2ndXbZKeZQ/b+OHfd2T3PMxMDjS+geid9YPfVNlXhwZfzle9/Bpue6KdCi3t050LK/bW
         s3vJDHUFjkjCabMCKxr/SRh4UdwALNn/ajZJ4PP7urXYFBC5GVicJdP52SbkDDjUCQIi
         Jk7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW9gX1RRwDHN5eryM5ddgN7SJXE7mrkNI6/RS/ydbIlpfcVQ1csRJq53g/ezEJ68Eu9eW85ZpNJ3HE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLFFVtqYc/iPK8WhZPfzHiJGbIE/yKK95AcvJJrYGI+07pER7
	HYF27qTBPtOsFsaLmioO9fK8k73eP32AqBRTRmApXmFMxvc5YeM1ZLVAANAy86s=
X-Google-Smtp-Source: AGHT+IH95pyx++0+x6r3b0ylOn5qoAmOpJPJk+X3WWJ82zLdKPCwrw5O0zep2cGh4t1vgStIsiNa/Q==
X-Received: by 2002:a2e:a592:0:b0:2f0:23f7:8e6d with SMTP id 38308e7fff4ca-2f4f49493a5mr10725521fa.8.1724427536341;
        Fri, 23 Aug 2024 08:38:56 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2e6722sm273279866b.91.2024.08.23.08.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 08:38:55 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 17:38:45 +0200
Subject: [PATCH 3/3] clk: qcom: spmi-pmic-div: simplify locking with
 guard()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-cleanup-h-guard-clk-qcom-v1-3-68bb9601c9dd@linaro.org>
References: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
In-Reply-To: <20240823-cleanup-h-guard-clk-qcom-v1-0-68bb9601c9dd@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1550;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=l7a7u0My53bkxxah+iS3TThVKBAYiSLyEhlPU4rJbTg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyK0JqhID/6P4SXswjPo5SrAFWoJ/fFS0z1WoT
 bdQrdHJG+CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZsitCQAKCRDBN2bmhouD
 1+EuD/sFCwblV55kzx2hxQvstFtApCUTcYo7f42fCjD5l/BlJb/gmQs1rc5c8lhykaYCYv0dJMu
 pcoYJGTCSWVGNYyQdMA6sdCopvePTiV9LcQlUFHgWhel6fVE1hjMw7b/1qOvRy8jZHLyStfHAuD
 6yOZUj5sxiWoIdd5OBhfLR5L3f/bIQAhmXipjFyRP5+XBTs2i0FE0H3QjCMEQWlbiGWXrMyoir7
 yxy3TVMm8qCxa1Gn46X+DBJFaWv8NPZqeoYw6H7uiUsygC0DmEg87QhfM9LfrwRSPN7A9GTmlYX
 4ZTsHKChnvRjR8s7q41QRbvTTg2oocdQAKEkmpzhn/Glwi5BhIUaYcWFTCeamFjoYKPgva5hwX/
 ypR5jLmfq3z5TwuVQrU/9lMKJjDCc2rHFamBXKPdUHEtcbl1DSOajkOkD4HRfg2UxE4hgz5jMtu
 aybAFGTCMe8LELrE+D8yzuE1FkPygBuaI7MAGMsyMkXjabd1+0U+3AcLw0xPZVelJVSpiIp58AY
 bz8dzxazK5/sw9O18fzU1ngtlz8jU+WLBQJCKieKvpBXFbr5p8D/eScnosU5y4nVP0J2inB74CU
 LMM4KAvCYMN5z27m2dgYll808UyIgRvfkS5uI8T1kA8sWsoQ6Wv8fUOGkrsi30cWppFtw94S3im
 iyUosGRr95XLSAg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-spmi-pmic-div.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/qcom/clk-spmi-pmic-div.c b/drivers/clk/qcom/clk-spmi-pmic-div.c
index f394031eb0e5..41a0a4f3b4fb 100644
--- a/drivers/clk/qcom/clk-spmi-pmic-div.c
+++ b/drivers/clk/qcom/clk-spmi-pmic-div.c
@@ -3,6 +3,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -140,30 +141,26 @@ static int clk_spmi_pmic_div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clkdiv *clkdiv = to_clkdiv(hw);
 	unsigned int div_factor = div_to_div_factor(parent_rate / rate);
-	unsigned long flags;
 	bool enabled;
 	int ret;
 
-	spin_lock_irqsave(&clkdiv->lock, flags);
+	guard(spinlock_irqsave)(&clkdiv->lock);
+
 	enabled = is_spmi_pmic_clkdiv_enabled(clkdiv);
 	if (enabled) {
 		ret = spmi_pmic_clkdiv_set_enable_state(clkdiv, false);
 		if (ret)
-			goto unlock;
+			return ret;
 	}
 
 	ret = regmap_update_bits(clkdiv->regmap, clkdiv->base + REG_DIV_CTL1,
 				 DIV_CTL1_DIV_FACTOR_MASK, div_factor);
 	if (ret)
-		goto unlock;
+		return ret;
 
 	if (enabled)
 		ret = __spmi_pmic_clkdiv_set_enable_state(clkdiv, true,
 							  div_factor);
-
-unlock:
-	spin_unlock_irqrestore(&clkdiv->lock, flags);
-
 	return ret;
 }
 

-- 
2.43.0

