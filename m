Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826B421CA12
	for <linux-clk@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231076; cv=none; b=a3bJU7dnOTP9Wle3qpASXwo0gWgdL0SVx7efo8/dpEDgGdG+vuUkDwb1+fvmHkZdoa6mj6f6055H5O/PMu04YZuZ16lj4FIowt87lsFcmUK7/zzEKKTjX+K3qV2i9+NUaS0vEGhiQqbBUxB4OtK3Oqln/swGl2OlbbLDHhzxeW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231076; c=relaxed/simple;
	bh=AQOh1SAmTjWO6vzJ8CZkmZ+2uws48CsZYe/GOw/fK5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mkH8MRULLMEXEX57lHu8BamPZPf+6KM0+AH8W+GbF7wk+Tm87XH2UJKJUXrNTb7rS9GFBdpJszgpct4COobt+atm7+ZRc5q6VAF61qLSs7iLMBT/s1XN0pjzoTpw+N+5DSqa6s1bePuUdNDziWT76t7e3w9iKT/TJwYbXMpTaqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWvQaglg; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWvQaglg"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso191716a12.2
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=qWvQaglgLv2lTaKwxS+lfEzU8PLEEPSwpZhB8yOV5+a4qJvgRYG4O37f5tzZWZPqla
         OLTr20EO3qW96L7iGj2qKI9Z9Q5MmG15dYUtsP5VwoWnpbv2X5ruOon3QunQk7ETp/OA
         F1ZmsA7OcDzf89HOaPwm5sTZqgClRg/869lniWKsBIRbOtHwpxCoYq2IcvUZTYHZfg4Z
         Tq+4WppFDucsk2p9QNhttj8dx1ft47D7ul0UJYq6yRtWis3rI8DGw7QcTrm3wZkAm3yr
         Sd/jKbmTmBUHGH0ui3/QIMCs1chenKUEb/PUVwr2lQwLlVCMW+cY7U31W2TlImumNmGm
         v5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=OFuKiLT8ttu8Uk8lUXytYSvSkqYTYgM4XLvLCQtyYvhGIpc0dsX00b2jsWVtQieloF
         /VHtBZ+IkfWSn+sP8SFyJSDWrAhlwz/MSSsfp5+7m6nuzDY25KVoDHeLuSdN3ZxCzFf8
         SrH8aeVJByeNrf86cJgarwE23Oj+x48nhalg6JUrxY16IUgsvjLexUrb0Qgm060lXi4K
         V145LQz+s3WupR0qqJksy9HnefLPZbaoHwhGjRVnl08pIjsbmIS+/2eZ0dAZ8ZcdgQ7R
         bLQapGsTsFU0GZhxs35sWIU4FJAVY5R1WpVF90o9XFQN6fxqI5/x9YB4J7cvP39ChVUu
         ct3A==
X-Forwarded-Encrypted: i=1; AJvYcCWE8giWblLvT8pEGahGz1hdMpozt0l/OZVU15+cgplZL2G3u4ejIBX9uNt0lwaQO3QGElqOTMAAkjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxweT/D3YoGB14dpaVWqgwrlDj8Ifmuei7vVwaaqHWy4kdM5tiY
	J5wKJlIzayV1nYn6sfqyA/JYNV7GBoiRFBkpIwOVzr6+hLMT1pdP6/kLQwRR3Yo=
X-Gm-Gg: ASbGncv38OB7L1xOwxH9/YsRsnt2YuOgy8JGa6WHfibOgTs41drTjS7km8mNfAjBft6
	pTstM5Jb5+qq2SPMZ6Oty3GP1NBXJ+wDJxTmTzT5kvGqKCuUp+Tk+ZFzqbb74lYmGwO+6tO1x7Z
	26oZFaevnBJp0warN5hXnkJJhidBNKi24E6lltGcp0W+npFhm1SvfD7EGiaFMmjqV4KWcEcpwM8
	I5n40KyPbubluAuDmpcEgoxdi/uwfu5ZiyVRDPb0IuwdTpsZt6gZiahgEry9TQ7nvSAcKf5YKtC
	x3lnMHyLFaLzYnFqDLQZA6zTPt8fHtDGXVRb+QAnuRagydJe9cpXtXiHLHwWVenhOvLf3fw6MHq
	vGVKJ86TleBWekrpX5GvxcXkE2rM=
X-Google-Smtp-Source: AGHT+IGvuuLoVK2j6sMyyQsZa8p1VCqZY8y0EZ8duJvRWZG85z91U/cgYPqYUZihq20x9iTbe4XZTg==
X-Received: by 2002:a17:907:7203:b0:ac7:19f0:aa5a with SMTP id a640c23a62f3a-acabd2517dcmr7867666b.27.1744231064521;
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:50 +0100
Subject: [PATCH v4 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-29-d66d5f39b6bf@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 095b090ec3949e0e8074cc344105daa00b795245..f4caed953efdd23fd0132d74d5199dec9cdfd294 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.604.gff1f9ca942-goog

