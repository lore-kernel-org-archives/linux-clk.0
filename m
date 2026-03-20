Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0C36CE04
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774041323; cv=none; b=t2I+FxQIAfi5iDUKhrUY7BqL4ZmNrA0vkU5mdJToMW55EDTX94nyOWGRmobgwZqxiP8/gr0cPvaOTnceAqd0blDrbfSSf3ScwBj7fG1wXcniY/hZCs7hEy2deqPj0TokK+ZwLjScAWRdrctncKP+hMAdaG2tL1GmbuB1xY8fmjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774041323; c=relaxed/simple;
	bh=tORFLLP5Z3xE+++LHG+od0OJITEzcIAfc8OUfQm3olw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/fbt6+6zZSgYeeQuRMoSUGYF36WENlbTHa8DdkG3WcwbNr9IaQpNJMunzYEkTkoQq4Ca1wkJkDNZKreJlHQHyO6osqfzkQuzOYoyMgj94RSpRd+DLPNaDruflNXLuaku6d/MMLr7DNz5FwQaMpANIpofTYUtbuWgzDfsjCWEA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GZcujz17; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GZcujz17"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so8887835e9.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774041321; x=1774646121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=GZcujz17vGvOmlznudcNKkx5oG0QauWBtI7sFBTY4Ohf3TvlyAeImWXXaKFCe2Yt1F
         wxHcq/7nZHjw+3gVSxFtfDZhwGDKZKYCxPBCyoZBmBTvFbBmXCSq4/YquEEOHF04BwSe
         gjQuXs7eomJ85Vn0FBGB5lj9B9WbXLiazT0/2QdSAorW/mdxZFX531PMAcyCtzSY+PYo
         bhkVAaAfqSP0NnI6dyThtQLU81HwIxuy8FI2MCxq2IF5v130SxpGNlGKFzdHC81c1/tA
         kiW+bb7HO0IFEoQ7QTcTym4DxGwZC/6/cb0inqMYx0U/+h+vcFkJDqbNrvJ0cnzkObyZ
         MwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774041321; x=1774646121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MPb6MVQqXHQI6kKZUWd24slmi84GBPiHvGvXcVqCJw=;
        b=CCObtMStYNXTmOk/Iqmi3vMVKSM5AQNjMFJn8ue5ytm5O+th7Zs/hzCFXRG9owMzJM
         XgNE94Et2UAtfZvMEmiLmkwt0E8O3uUkQ+zwhQ9+wB76iEseAJAfBDeFJICsHSZI/Jb1
         aZKHgcNrTiC7sKI/OE7xB8yQl+oyb7a4I+EoxlZ6aJJ9EK5dSJ1LJs3gSdbLViSHPdBN
         6a9z19sTcNcdMkMHV8nUby6uxPz+w4OsAPARH9oIQILPzJoB8jzSM83KB1G/KNyQUtkV
         giAvvkT0IpcAfxQ+F1VWIhGNqMoYwmPnfGaFap8XPr40j8YsYeez+EHRRNNXNVgAGp39
         gxow==
X-Forwarded-Encrypted: i=1; AJvYcCUe9+QuzYka6ysnheE0/DyvvKzNrgHXiPG+tm6v2Gt9j8cYtTfMOi/LzbN1TZ2dLoK1uhPFxHe27pA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdkG/YTDpOUulLBo2I2j3xwI+LWTd3pWxLIvkCAzww84jY4Maq
	QFj5qxlZwGCxlpCOjwDXbm4XeCfz/xMWuFgHz312GZNzc6Qd+2xK3E5RzoaiX6IIbZU=
X-Gm-Gg: ATEYQzzSIY3ug/HcT24HDIN184HptQ+cqQZrqJI3J0f4EWJ+OHjOCcNQitZcUPZXRuk
	5r+9NGaQ1sStqGc8MVe8sHD2FC89VyIJaOOX1uWoJIsQh9iu+iDs5JTMOW3CC8PrrN9Jg8+6aYv
	sY2IJVLZmMlNpOuOycFg4SFKCyqR3jfeYvhJ6a8/GZKnbK/B3ANGMBIGHUBrB2OrFysl189TX3m
	deROgLr/M52isuOF77fP3mvLh53hlMGNC3MyvplXRV2Cf1hK4pZ/Mwi5FYkIqiIDKvPtPHzq0Ly
	Lan6/8NiY1F8XpyIPN4Tp38Y0gjXvPaKkQS81Nck5P2pSJowqlY/N/2Vbscu+R6L6BPNue25hrp
	RsZrpI6Q6wpcKWcImCHfB2/O8Z4dzH8PSuimGLPGq+mImrI5468eQR7ftCGIsmTfKcBWeIQMQ1b
	SV5HVjxYBBZ0U8KxrSA085nf5A9NU8nOynxv4LLlZt1Zh9UorMmKa0xbvGd5Vz/Nj7WUcCAt70T
	ALyUjJCb3yHsfM=
X-Received: by 2002:a05:6000:400f:b0:43b:50d6:4f04 with SMTP id ffacd0b85a97d-43b64281491mr7630137f8f.38.1774041320661;
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.193.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b64703c27sm9702401f8f.18.2026.03.20.14.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 14:15:20 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Fri, 20 Mar 2026 21:15:15 +0000
Subject: [PATCH 3/5] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-exynos850-ap2apm-mailbox-v1-3-983eb3f296fc@linaro.org>
References: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
In-Reply-To: <20260320-exynos850-ap2apm-mailbox-v1-0-983eb3f296fc@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexey Klimov <alexey.klimov@linaro.org>
X-Mailer: b4 0.14.3

Document support for a mailbox present on Exynos850-based platforms.
While at this, convert the compatibles selection to enum.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
---
 Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
index e249db4c1fbc..c109c1f7af24 100644
--- a/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/google,gs101-mbox.yaml
@@ -20,7 +20,9 @@ description:
 
 properties:
   compatible:
-    const: google,gs101-mbox
+    enum:
+      - google,gs101-mbox
+      - samsung,exynos850-mbox
 
   reg:
     maxItems: 1

-- 
2.51.0

