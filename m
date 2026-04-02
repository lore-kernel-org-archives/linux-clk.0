Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A640333121D
	for <linux-clk@vger.kernel.org>; Thu,  2 Apr 2026 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096429; cv=none; b=c+8LZDCr6xbn+P/KfwdhOVApL079n/jbF6F4VOLQIhO23hFb1K9vB7ksXQkrpi8bv4jHa93BL77DiEkKASMuzxZdp4ZcjHU58xaF1TAETybtPdhKYcT3IFmd+1ATHJct9SGlVOOlAImXK7Pb2kC0z7RmLLX/U/v7crDOGTbt0Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096429; c=relaxed/simple;
	bh=WY9gRm4aP98ntsWvJkYIkAqwVc/Juho8BzwfyqFKlMQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aB5U51lQpsXgTahpwp7IBCMrcKKdZqCgchtdxitQyKEpaZUGruft/yYxFDcxxTsAL/VD8Zal+VdPTlxuFcXwzbQ3DnohdX/GFiBa5W78oEFk8aANV+wr9wM/HWvEKj78lZyd7ESlKXSwZtM5/I4sErXAPG2YS5wG+5T+qAVnajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FNvhQc5B; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FNvhQc5B"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43cfb723793so236199f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 01 Apr 2026 19:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775096426; x=1775701226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=FNvhQc5B0w74VMgDKD6kxXTw2FglG9b3mATR4ZFwxrzvgZcZbi/+u0VYTFTQq4en0x
         9YrePKVBHkiv6YScy2xqaCRWstBo0P2Sxe7F7zDyC6F2w/vBFKIQSR7O/ARGxO/vW1b/
         YQ3sTvMGW4kwqpNJOd6g7i+q5+9MGa+QGPz+IqyQmJjBQAjk/CmpR1GQ0f9MPsuWs8cB
         iP0dMsGDVJoz2Sg0Q9xquB/OCBkWAYzYU4dcAGWOW/gbPrWB5fubM42lDHlkIo7FKByR
         zGgUJHaW0vEMz7Q/aSotJUjMoyghg50V4AHlQSO2K/pR0Bx9BindNkhPfyh2ISAURcEf
         ybAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096426; x=1775701226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Cd/iu/aYoTfiHEl0xBfUrFFloW9Th3t3xU+FRrPDwNE=;
        b=iK2AnhFJFwaVeCgoOooaj7u5fBxpyRqK7tX4n8j2U1LnrIKeltDBOnaf/cBO5ynlo1
         dicTOUeEImtljA43cgV3eNaFC6XCJOQwWWAqSdXn1MTwRuWrRzvQGgQ9GkVd/Urglb8i
         SjshpM52eXIYahkxMbsno49Wf5XfviKkVC4jCZ/AhYFE6AUdsaVBJYyK18Vlv+vJI5/c
         cDcytYMEb/kQu3AHZM7evkuEfy47K9RRNN9Utty9KUVCR44iP4dkIwDHgyMavSQog1Q7
         lekc2S/bjsAosSh1aW0JMiTftcjfrJ+/NS6nZPS8DhFB7vjNsqQumKX4DkgMRPHRvjJO
         B79Q==
X-Forwarded-Encrypted: i=1; AJvYcCVkcZXoyazX8twQW/GVoADkjJvbhXSOsSLFMLQEMTEvC/saNNbceTarE1bJUdxtptimIkd1ZcKDurk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNcCOiu8+xzYYLf3wX+cYFkun3QzqcGXZdYnsVR7YqtKhLfuMr
	m+Kk0M5OZ4WFfLxJrEgckk/ln7XFRf9q5ro4Ziog3h0pXicYALAKCAc56Lna2bUR8D0=
X-Gm-Gg: ATEYQzxYKchAzBBzCVir5WeNK+osGDjIhKOBJLzk/pAue5CxjuUcZ3Msqo+KxHTe73j
	jIWOXUKTyDNmS+v0of8blYgpFRqUe2zD6h1Kwvm8lh/YqhGxxdXlJSfcy0PJl0d0z7YqzHtKSPk
	sGDxIm0cbb/t1VMd4lpxuYSg+gYrRVa/L9hLQfdB51XkkYVW5/xV/jST9QI5RObxKNQQ5rK40qt
	YSqjlI4ErofmMvGD9q5hRjNm73pYDuA13xX3j7h7RvLumjxMcuTcJ2iBrAaRjheynkSpc2FnT9r
	AxbGe9kGiM6ADR+ob4rPre6frgNOqnc0bq6Gg63B6Yedk2TboF9FklAQcyJYDqKOECDRjE47xVK
	zLDaGO0CjsjfOTh2ZVBCbHHAO96ghZ2MgpcH/XAT39mCOuBFK0U+fJ8qHB4Sxnd8fziS+UB1UuR
	f5cGb9mJOQd/1IRibzqWn+cLy4SUZx4t7trYbEsfFlGH2U0DmfqJ3vX58Km8L1FDmR//tg0i7Dt
	QpfViPl8p2Pkk39
X-Received: by 2002:a05:600c:3421:b0:488:869c:eda1 with SMTP id 5b1f17b1804b1-488869cef18mr45133425e9.15.1775096426011;
        Wed, 01 Apr 2026 19:20:26 -0700 (PDT)
Received: from [127.0.1.1] ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887aacb88fsm56379725e9.2.2026.04.01.19.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:20:24 -0700 (PDT)
From: Alexey Klimov <alexey.klimov@linaro.org>
Date: Thu, 02 Apr 2026 03:20:14 +0100
Subject: [PATCH v2 1/3] dt-bindings: mailbox: google,gs101-mbox: Add
 samsung,exynos850-mbox
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-exynos850-ap2apm-mailbox-v2-1-ca5ffdff99d4@linaro.org>
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
In-Reply-To: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
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
The registers offsets are different from gs101 mailbox, but the
workflow is similar, hence new compatible.

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

