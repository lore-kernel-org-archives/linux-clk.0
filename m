Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F0245022
	for <linux-clk@vger.kernel.org>; Thu,  3 Apr 2025 08:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670757; cv=none; b=hCpzkK7nTc5z5PzytqIO6fSmTGoFilnp9n98xMIFZ1+AsdKWgRVIdkbcvD9kwHTxkRFNbotihRI2DFBJNoESjUIz4GRLAIh9GUpKPYFnT8/hHjPV3ZlNiBt71rFuEtOmkGn9bVYqYhpO/Pq1n0j9LCf+kQHAJW2EwYeW9ML8N30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670757; c=relaxed/simple;
	bh=cUTy7Xx1YiX1UnRa4JT4b9qKBeo7MuQLQSe/ooLtKqM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=No5o9aU1Dp6SfmXEel6VxfV0RMSQvHNwioBAksGMaMBk716law24cr4SLxDVa3nvivtYjP4OgBFY9jxYtTf8azsUH5AofVgKOV8xi230aNdbZ07Bbnt1F5WVXuWi8V5l+uSCv++LhPjxQlZJcIfN6MIwUDJQKO9wmEasXXaYNyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjHHOqvH; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjHHOqvH"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so1179703a12.2
        for <linux-clk@vger.kernel.org>; Thu, 03 Apr 2025 01:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670750; x=1744275550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=AjHHOqvHENCRlXPk94D5ol/0f3FDlfN75O8DcrWoeUFpHApwRG1syizNhakbRO5fd9
         TDldk5wN9yEWwM91+A/7wrcsgtlYWH7NJclHDGw/YCmoqq34vnKJxKf+kf2XGsUvQ4U0
         xiZXtlcQoLA96MXAestzlj1qh/U/HKvumc3cqkvpe9bbs3UUNrR/qHXiqQKOpZjjtGhU
         tfiljiY5j7J4O5kzHSEbShO0vzTEAuvMqPYHpWM8baPIf/a3LCoYpZp9U/SJhxWlT9yH
         sJbeHa2m7EI+TWTyBHbqcp3TiIR+ZiHXMsrV4zLwEbJ3RMyOlU+POuNiyufq7N57pTrx
         Pz4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670750; x=1744275550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOEB7IVKZaW1PZ6sIgI8umGsLZ0fzThiODmAgEs2dvM=;
        b=dpbl8jjNNUB5oW1TdMpsQM+BJa0RfPmhKQ3KWb7zpZ+pTruRaGGVSLrcVATKWy7bpF
         ye8WQMX2EB5fIFst/gyxTHKrJdnFIS00VZSMj6AKsLkhpeKOMIVJBtFBbJpnXeyMFnl2
         iDWZp7rId9nn/avDNsTZYTpgdkco2tiF4xXo8G3b/xTzlOA6Uo91Vp7hZt0LP3ubnrZ6
         BFvkzAip/7t5GLoAYwCY3EgIOZ2PlisvsubN69S6xt0qIhg9pFpva9TdEMj68TSiilJq
         JpiorBQYHJ52Nmji5VFUCyEMeTqHcpr/Ttc9yz/GrsprGKU98XugMuMG37oB0CqVNTBo
         WkFw==
X-Forwarded-Encrypted: i=1; AJvYcCXanr6W7MTyDXDYTJnf5BpTw52Lww7tr+W1QZ+zM0LMZryT7omhceW2ciMIswx7VS2eAX9zwW+bSnw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJDFgTwHlc7UfqLpOktSBbQiiuo8VBDVvfVYIucPmImGGlTJDi
	y/4aPGpl/wvpFXbq+PviA1RI/WAgCT4u6tTApei+9+VJXAGUfsxXaXPEXM+FWEY=
X-Gm-Gg: ASbGnct2LXwXB13vu6vnIWsWrNyNSFubkik4YKUNww5v2g9FH4nIBDobGTfw15jaM5r
	LVZXVWscUrR4gsbHWlDsGQleFZSa3H3JzINJVZ1Kuy2Ja674BBuH5hU12c0fH2JM7c1hS+krrDM
	z0lWOCfWtpyHVRWbFY71cH8/KBYbJZdgjjP9AHm2XwBTVfoeBXm0+gBikCAUrUNe9ITTFlkUceF
	XXF3RI6D1v4uZjgQsRrpn2k7eD2/A3kFstVK6knsQ2xbkM6fa9OneL/Y7Ak+GA3IxiNxlMgnOk0
	ukZ8N2FrZd7nU/sx7xhR4d7V3vnLcq3J0Hb6/ax/g8SDsF/gvKX+S18NMcsumMDqJDFF/pHay+E
	fIMAJEG81iiUe3Ze550SKampdANqo
X-Google-Smtp-Source: AGHT+IF/mj/FrJ8Kxms7tCENqFVdFFdcidKVA2nEXR0Y75YsHneWseB8Fi5sl71j96aNLNBmEO4yJQ==
X-Received: by 2002:a05:6402:2682:b0:5e7:7262:2b75 with SMTP id 4fb4d7f45d1cf-5f087184cddmr1440611a12.11.1743670750284;
        Thu, 03 Apr 2025 01:59:10 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:09 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:08 +0100
Subject: [PATCH v3 16/32] mfd: sec: don't ignore errors from sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-16-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

sec_irq_init() can fail, we shouldn't continue and ignore the error in
that case, but actually error out.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/mfd/sec-common.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/sec-common.c b/drivers/mfd/sec-common.c
index f4c606c5ee5a809a106b13e947464f35a926b199..bb0eb3c2d9a260ddf2fb110cc255f08a0d25230d 100644
--- a/drivers/mfd/sec-common.c
+++ b/drivers/mfd/sec-common.c
@@ -183,7 +183,9 @@ int sec_pmic_probe(struct device *dev, unsigned long device_type,
 
 	sec_pmic->pdata = pdata;
 
-	sec_irq_init(sec_pmic);
+	ret = sec_irq_init(sec_pmic);
+	if (ret)
+		return ret;
 
 	pm_runtime_set_active(sec_pmic->dev);
 

-- 
2.49.0.472.ge94155a9ec-goog

