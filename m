Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB56639768C
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350184; cv=none; b=oyJMiBIq9MZIab5bXyFWwY8sO5i+XBIZuXnaMWnuiAvLQgD1Rpeouwz0XdzWc1Bdlo9bs/6GZcyfA+0eYMPY46WXhWFrpq/OjVaPajP1IBemIAQ0NrJD4cnVsIsUQvbu02lMX2pU1mU/SSeYwJQTo3P9qYUYt0cnKNiv/32teWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350184; c=relaxed/simple;
	bh=frWnPQsAsHwq1WTd/9q6n1j47PwQpCWFOmdGfvwQGoM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GcwVpIX1ai6QkKokKvv7W55YIFR31O1xfVIyIAnPYYTUuh37xZ9nH+UCX6U+fD5mydz3XpQTjCphZu0a92CX1mf9dIdGT02WC9ZYiBP164X+LL72++wDso/FH5VbV89I02pZtZWQ+0+C2YLYubhzvCCy+UEFeuFlIqs6hEXpMPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzw7nhTy; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzw7nhTy"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b6f1b14bso12659715e9.0
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350181; x=1783954981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=nzw7nhTy/5xylWKOrJpqlTzVixQqZ3nxvMI3/7ONNGIYD1a24xMiXS/KKvLuzguJek
         8T0HLE43ZH66vUFZvssK1d/pbJmdbXBHAkwOyaj73xmdyZyxxqbwfHLzxlkKRPiXPlHb
         ckeUZCnufADPlDYV1LyYaQgP405jxL84UaWKy1eZ85Iw+kEw/GgI/kOdQly6vVbJd2ip
         R3qHCIQrTksmbA6ptUsryd66qLNxv5FbeUnLxVpaNIalHVzTX4szkMb74CbOp/ai38Qk
         Yovkvc6etOhs4oBiNiKxDIHhzkn3MNQnNWXPmo2hfklYjlZGr7oNIU3BJM6crRPP7pOW
         XHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350181; x=1783954981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LoayvTOy8B3Va9ZlXEOzucZkBIfqtEfrLl72tyzTD0I=;
        b=JviSCIqRq3mxN3bsLq/3fYn1BEJSuK3bGcNJpOEHCmrWarBTt1VDmcZYyUar86fr1i
         i39fm4Jrv2XvHx143ROTAvL36cwWId/yUSL+tfJbFeJiuvQ84Vc05fNr27xkScLYkgqo
         goSy3jzcngZyNjjEEKIdAZVJ51dg2ZuWTBXHWLzguXwxpY+GO8Tzm8Oseq9IByoP2JY1
         q2De7ZVWjXjWPTsI+XL1m5n8qtwxElbP3Dj5mpMsKo2mIyH0UMU2y96gt45m7fZgOAl4
         o7rBdXxOSgY26fc7psUzHuFEM7NdjrnU0E6whq4RiM4f2z0zTk95Yj1UFplgdydfNYp6
         SyYQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXN7yaOlfKFvceVKjJ/JnIqgRWVe3Pq+Cu2cmqTdnbSHCIJN6JsuE09h7xz0tXlQWIatcfMjScDvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9nMn8y+1iEXD0t/WXrCjD3NjUUElFZbrgjFCDJXJr899/GD5T
	3KFIzA1HQy6VBe/VMfkE9NM8kaj6QXBNqp5EVPpuS0Lrur6duxH8HIX0Sf72LsGVtlA=
X-Gm-Gg: AfdE7ckTXWE5hM7uaQfKoNI1RsWtN9uYAf6lgJPf14V8w5QpXSG+5FXR0KTOIv8b0/m
	a2QvXlMO2MPqUrsaoAPYdw+RxFQJhWpl7YcJ74tKDm/CsSPd1I5q28HGjmB9qYZ9udwmNw9wPA0
	YpF4kHSfOg9De0Xw7YauYQYJtNbfzdJwVv1BkUdE1dOwfoZ/vJwuz5gLSLLAGp648M84GK/L4iD
	bodI7vJdKqnuYMKZkECMdUNWzFHw0on4YCS+CGPnvNg9enaz+uE3l/OWegOFhit2RYo1LNIZkm1
	FeYCnCnUTuZWtS8dEycXTa/bSNKWDGUBfO6nPr+iETKNmc3TRLTTFl2dEEYSPdeZRx56qFNq8hQ
	K7znywY5yQuf5C5Wft5nvQLYLfaGCPBm0h5fFMegOrUqvw4h+KbJINFAh4Os1ea5c2SKMK1g0PJ
	KpmyZ7SRSPuPv9jMlHk81UBxKOuL/LSx3h0cj6
X-Received: by 2002:a05:600c:4a21:b0:492:63c3:8eeb with SMTP id 5b1f17b1804b1-493df09b53amr7429595e9.35.1783350181202;
        Mon, 06 Jul 2026 08:03:01 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:16 +0200
Subject: [PATCH v2 09/12] dt-bindings: clock: qcom: gcc-mdm9607: Drop
 SYSTEM_NOC_BFDCD_CLK_SRC
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-9-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2

From: Stephan Gerhold <stephan@gerhold.net>

This clock does not exist in the hardware, it has no consumers and
reading/writing to the registers fails. Drop it from the bindings.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 include/dt-bindings/clock/qcom,gcc-mdm9607.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/dt-bindings/clock/qcom,gcc-mdm9607.h b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
index 357a680a40da..246bce28137e 100644
--- a/include/dt-bindings/clock/qcom,gcc-mdm9607.h
+++ b/include/dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -13,7 +13,6 @@
 #define GPLL2							4
 #define GPLL2_EARLY						5
 #define PCNOC_BFDCD_CLK_SRC				6
-#define SYSTEM_NOC_BFDCD_CLK_SRC		7
 #define GCC_SMMU_CFG_CLK				8
 #define APSS_AHB_CLK_SRC				9
 #define GCC_QDSS_DAP_CLK				10

-- 
2.54.0

