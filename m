Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE223143886
	for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905418; cv=none; b=CYc9A3eceRJPOqW3g6InTKDl2yi63x9YU1L/dby2k8ivFL/TMUnpDkCAixzKxNxmnELV++CndFHT2aIMjXrL2bgCG05mTghmzgkjCM5+8jZFB2jyduBz/GxwtTU0jU2wGqJli3SZS60zverXEdM6PlZ3L1jCz0uloixjZPgSw+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905418; c=relaxed/simple;
	bh=WARBLKc8IIwkOZR1KT6Pc8Nf7x5S3Qw6DwX2PgELUbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CW3zBpREseUs/8kWrPMm3x0u+VQevnr5g10DUFw+D9+kqKgQR5+hBQVaOFi1I0grUW23N+LrqEpVKldE8hsy7TMEYq3e7irw3BQQOFrA5Ccvx3ssiVX9NoX3s0FVW8e1ndXfKyxIzZx/xIjPcyRIu7myL7VsHIEViU5HcPoqHNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lj/CgTBX; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lj/CgTBX"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-41a5b68ed4fso21754355e9.0
        for <linux-clk@vger.kernel.org>; Tue, 23 Apr 2024 13:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905415; x=1714510215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=lj/CgTBXWD5CQMfW4dzCG4gJ6scB6ECUYUscs8fay/vFE0fR3JZRJ5l07Ai4gxO5/q
         wyzHUTJ1lpwBRc5niZ7M/66a1t+GE73GuSp+DCLRSNRSF4ykHIdYqUq6Y0E/S7wMDM8b
         LUxXhfF5+YlO7zQzsc/Sjihh70NDrq079eS3WYyR22lMfAKJ8TDMbw6qg8oRvuUc7h0k
         HIeZWcoUYnTyGOQ0pCFSjTBEJqnGH2w63T8V153+dNTFuGgF4bO6QEVn6/ARlkcZ2ch7
         ZI99JVXs5akUTQPO2jiiILFm7qV1Zpeyj5O0eglSfZTRZZzFV/tKA0bqtOgHfj0fSLRI
         7qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905415; x=1714510215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B7YOs9puuo8onPpvdQ4CfanEhu1eADekMseFBdt3Sao=;
        b=ZnLC1sI3CeDvEijjf0RJqRGqeFPwuMMhSBY4J4KHxVGilo+lgaUL22TyrXU+dvWXOv
         qdMY2YMrKpwr+L1SzGR5I0sdenzvkWnb+4cv4F31yLkbuczniERcSKflUACXvFlgfvE+
         +4CkkpJ0w7dHyqJhOjfWiCm63zXPJLKK1mlLympCn5hvYJ5ZazX/FNJTimBDyimDHxiW
         7jqcHok9LtZdzEinSYDqoDD7Q40Hw9gzMOg9lg38r2NBOcW6AFM3eVY6WdvVjRl6r4CB
         8wlp3s+z5jhplMQLAnymKzzZLFSc/+yZ1LCCEU51qNT05Q/u74SUMPin4UP36yNjhtUP
         uNow==
X-Forwarded-Encrypted: i=1; AJvYcCU97sC8FIq2Ov806yROKkOsaKHSs28zCdbtm6JtjJewqf6jpeDiZ5juUw0W7rhwJfSZh9HSnz5MVVyd+GZda58c3w32qpo2YEPV
X-Gm-Message-State: AOJu0YwPrkce5g18DC+UdrRf0NtEntgj8tmGMB1uB1+BnqQqfcArMN4m
	ZQxZJbmf7GMY2T7OOoNCtiSmdLupp6490djk8fOa+QAH8t9XP0lgn1XpbKCRsts=
X-Google-Smtp-Source: AGHT+IH9p7rRQpyh3qjFY22JgIFm5zaFqK/Hn2YUUXTMJfPhSR4r4a+glqPpxsEltfaY8s2J4KBqIg==
X-Received: by 2002:a05:600c:3ba7:b0:416:9f45:e639 with SMTP id n39-20020a05600c3ba700b004169f45e639mr225716wms.20.1713905415398;
        Tue, 23 Apr 2024 13:50:15 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:15 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	James.Bottomley@HansenPartnership.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 02/14] dt-bindings: soc: google: exynos-sysreg: add dedicated hsi2 sysreg compatible
Date: Tue, 23 Apr 2024 21:49:54 +0100
Message-ID: <20240423205006.1785138-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update dt schema to include the gs101 hsi2 sysreg compatible.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: André Draszik <andre.draszik@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index c0c6ce8fc786..3ca220582897 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - google,gs101-apm-sysreg
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos3-sysreg
@@ -72,6 +73,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - google,gs101-hsi2-sysreg
               - google,gs101-peric0-sysreg
               - google,gs101-peric1-sysreg
               - samsung,exynos850-cmgp-sysreg
-- 
2.44.0.769.g3c40516874-goog

