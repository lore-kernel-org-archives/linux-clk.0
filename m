Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F95202F8D
	for <linux-clk@vger.kernel.org>; Thu, 10 Apr 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266441; cv=none; b=sGE0yhz1qQECg6siap5+3qKd0NYCYiaOHCG3xpJBinl1/APJLlgV53t3UbKeMaFOBw7c1TH6Ox5b+Y//vnrSBM9us/Y+bJ6GtKYSA+2DxnN7xFqunU3e1xD2pqCWEu7QI3A0ikjxYFxg6nrsL7JcAtooVZ4PzU7uoDaR+wCnqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266441; c=relaxed/simple;
	bh=DbAUYbu5Va2xJQiy7VvKkV4e/4jPiHlqCkXhEFbYoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=taPdmm9u+TSY+nsWwTVzvZW+J02Khk+q8a4R8bPWetbwyZgsEzrIq8xnvFQNOAjkuTT7IJInBQlbPV/pTJy2UhanIikCNB4RCBAsyy322bNsTmVkGz03DaFQ74pCEcQNWxm8gttfztJYTDUo72iCwGrtlzlsQwYjYSBS+LnzWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diOq5bPQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diOq5bPQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf861f936so756225e9.3
        for <linux-clk@vger.kernel.org>; Wed, 09 Apr 2025 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744266438; x=1744871238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=diOq5bPQ41tWsiC7hQG9OTkhh5pHHEMaAnADGSF/ewK7twX/K/8M4iV+MSyqXKM7fd
         UESkRuyOxvcKWybN6KtU9tR309fUL53knl4hJ5oDUrpdKr8JWPLqIj3iSL/ChhbV13Xl
         vFoFpj4m+sut8p8h6HmV+EYnnS5nDvuSp+iRZpHPUog0pooI/ZJdfgcwW4HCud+y5q6x
         Vv0/3Iz6/gZoO87oUhU1eUd14DfdSRcEup/Sj67qpeEDbI8B/W599isJosvoAgul0wqm
         ksRfFe9iNLvGKGUg3pYFCJoLqws7QFpIjz0bFfqT7Q2vyYtKv66Qgz1CvfozWqHYL5WF
         V3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266438; x=1744871238;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=rZ9XClyb3qFAjoDUgM0F7FYPr/S2geKPaIYM+Co4Xiu+hJNriK7TYOGiMJ5gQko4Dm
         dm3wL22p9dncAs4DEYBsht2VHFwUo6x6x15vMDPyD5Ws5DtGORr0pqNP+5fEb5XfWECN
         sMAMXn+Dd9ffIEYBlfZDy/d4DiJt+ApwfprREwjS5y4fc196thwMEfrCKyJSopkpPlMS
         9IV+MTMHhCWHTBNSJLWWGZrqJlzFucjGlgqK5T/wcs01IdQ4jNaDOA6pLGJuNSmDRC5u
         Xi/m0k5gHF24LFNeUew0PbNnMWyw+pLLHgCVx6PciPutyFKapEEAfazeDJFp6cvrCxHG
         pAtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbn1rvEiG00Ohfy7m2oKhhn3DWNwOMZkWIsuXs0aKHW8CcGqh8oQPQOPSYIXlC041zN6gUFNxJvS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwHDUqlmGdwqreFphvGlFcMmyL88K7sAuu/E+y4NfF6dj+nTdT
	9FawtOYA+7bkTO9CMLxNEMl+gJ33rzDtPNJCIpmQi9/yrVH3EsH+U4m06iXToG8=
X-Gm-Gg: ASbGncvRklyEYhtWF4AdJrfTdrV6JSCHrWRcNzk7xdemHknjM4OXBXommXxdkThTiwP
	X+C7XhKCCGAGfAi546a/jRo8rPuVtjvxtkgGtZcd9tFv/twYnHlK//aF+IAD93Msg5lm4if8WEd
	h+q0GDu2qmCq+HH8s61UnYKpe7t6fdcJP+v5zAl4WdKOWLw6xkjdXWla2IWgmErWDD/mvwGjIe7
	hgaai23LaciKc40RjJRUz+j5A5zZ6jY80eAeFFSWGQRgU+VZqklIiks7eA232AYMN1mCvdRrjVg
	JR5T2lOTtbHBbT4cs8ZVxo1EsfgRgSlzXcTeztulzSzjxeYJUiOgALx0I0U=
X-Google-Smtp-Source: AGHT+IFVRI+eHYzRePN86bPROJmtppmFeI/4qAEBjgxUHImff0Q+A3BjR9d8MWHmWJZEinQXV/yX6g==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr18061085e9.0.1744266437939;
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm39520695e9.21.2025.04.09.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 03/32] dt-bindings: firmware:
 google,gs101-acpm-ipc: add PMIC child node
Message-Id: <174426643614.15856.3555538804191184531.b4-ty@linaro.org>
Date: Thu, 10 Apr 2025 08:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Wed, 09 Apr 2025 21:37:24 +0100, André Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
> 
> 

Applied, thanks!

[03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
        https://git.kernel.org/krzk/linux/c/935e5bd95df2c79404630a691caf42c3d7bc3a93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

