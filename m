Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6271213E76
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231066; cv=none; b=fUY5uRVlIz46kDazZbsG3o18IGqiM+habMm0G22T6C61AG4n+df/m77Tk8Obpl1FxowhJPIzjwctznAgr/0EdbtrW2PYW+Hg89mmhrrQ0/DDeLYKd4HfOJitEDmVzbF6Sm8JGSJJ7ma0GjFF6uDGqNEYdqPTyH3Ow46QhgcP/UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231066; c=relaxed/simple;
	bh=Hu3iyZXpRaCR0lrm+kXeKWpWaXUMVhvAHxoE8tYowXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k28718Y7qDjpcgQzrc4HseIQdc6Wh6Bt26Y4XFCz+V5hLz1AdObLiWT//xAqMQkPB08WszY0+TEn029RTnDmJPU9hXrcCbjvF9zpUWYGMyieHSHSlhZfXD4aeW633Mb3QSgC4+2jsMv1FGtspoMoN9jDOv/XUAl/Q6zciDIc940=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cj0oNcpr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cj0oNcpr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac7bd86f637so230715066b.1
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231058; x=1744835858; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=cj0oNcpr49Su8yi3o6BTtMZYy4ddzNWv02bHDkK61fPRVWEi0hRprBrQfbcoe4FfMb
         51bnRElKmINuLAl1Ru166txXZop5WvTPpG/UVIBafaKLATKEJJOl6oxGiFh9qM6aQfMg
         4K8zeI5dcfwPjfLTX/krWZrjVOndVc2RYbCDgs5rG/9KyAzlsFq6RHAa/ExwC+wCvSPP
         zzRWtRNCpV+nZmboXU+Asi7rjBkYJCR2xFCKvSnwhDC+u+iyeSCfIrLMyWkxYzLjlzuA
         LL7VXs77FscS7bX0e3EyJXU+f0PmzHuyXit5ZHWLM5LSHjw7obmNGx0SVB2ZX4k/HI03
         SR2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231058; x=1744835858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0giWyFiG2ehvT3dYEU+l2gt5I3uIIss9ANYfzm9oJps=;
        b=KrW/V0/mrSJXEjqHwcuHJbYYjGZSSYoRzaerbODYeWqfOggeNCGyCDETHocHrsAurR
         u1ZECoQDO0rymzOEri0bjQyqG2HZgQuO8DbyHGH1GPwbC2I51fB3gUtd4un/t6/tbYOb
         pUPby120nnGjdBnb8LcYQm9T05U5mH0D88HOnypG5xUJWBcuIG5pDBXy9Q5j78s2GKTa
         DjuKJWNJmE+rTWWxSQfaFpBFSJKrdJHAdDEPzbJxei6G6qc48iV+rRXOyBTWtXV+VMk0
         Zu8ft0P5KWNQvR5KWR5L9C+9nrTTIvs+RInYvNX8szkUxBAJshdjISyP9RNHSk6tt9mL
         4tlw==
X-Forwarded-Encrypted: i=1; AJvYcCXsd/119YeRcw3nDjttr9QwS/2j4KByftOgYBC91p6RHAkHDE35GDCQPz/V7zNaq6KEPBM01+jq1bw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6MufQJ9qu8pkZXBeSfeClNvCU+p5JYQJAMlttLF/sp/KcG57I
	GUqzaAipTRqbu/HpySpHWh7FLKkRpYhilIc1t3hwZqe4Trv/gIHsMGXIjRyrqfs=
X-Gm-Gg: ASbGncuHFYMMt+deJ/8OlT1HrythpEFr7ZLFjg1AsS2giBfmHEHqVzGw07V35BvHXC+
	Z5Fyi5/fSJHBSha304Cn7H7nUXbt0gCCkzdhPvZl2CBesBpGpCgp8RRMDehQc5vst/UxdszlIhG
	096BDJePmdEM9lvheqDXLLSphpAz/qgFUpH/R1w5ndNx3A/o5tm4pGxeoVeMlEobCBAtWF9XZFt
	7I3RwQ0fwauYTa292kp07PEGUqyr1pxAho/CCiVTgoNeHZgk04waP9VTdLlczicAqBwI0CF+Hgw
	cV5k6HFNxsGk93tKRJywBZiVo+8yPfTn1CKiNVIESh+nOHueikcFFXi1V/BDCLmvlEdg/ot+Vxv
	O+SsxN/8vIlLy8/FHt7COcfwBh/s=
X-Google-Smtp-Source: AGHT+IFs5jQKKi9PBtsfwcpWP0uR3pXLFKhxM09QGSN5rk/PWUonr2doF0wyNuXkGit6lSL1qy8RxA==
X-Received: by 2002:a17:907:1ca3:b0:ac6:d368:aa97 with SMTP id a640c23a62f3a-acabbee8c8emr16347466b.10.1744231057853;
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:37 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:37 +0100
Subject: [PATCH v4 16/32] mfd: sec-common: Don't ignore errors from
 sec_irq_init()
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-16-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
2.49.0.604.gff1f9ca942-goog

