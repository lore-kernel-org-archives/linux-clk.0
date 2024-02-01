Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5381F17B
	for <linux-clk@vger.kernel.org>; Thu,  1 Feb 2024 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706783774; cv=none; b=EQmEfSjXGAy+6OwE2/ac1hVyPR7cz7nasKo2kjFV9Tmn5NQ8rtkqM3SHjFk3NZXqIYpGFcmpeX+oTRImP7PRU/2dDRRbXUR0kuPOhXsNiCA6uKwWO6wln2/vywS61v3rTod2fa3rKA/4RM95r2y6KujGmqtkMKK28ZRGI7vPFS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706783774; c=relaxed/simple;
	bh=hke+AcsGSJc4QX/LANnvQFD9/kVcMq16pY1/yHnO/B4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iHB0L2pxi1j1cMG6FI3cW6p2olGUvzuAPrH8juijUnpmnCnpt4aY0I6M7ovpIA5C4oF/X/FSUraZo494IHTuoRCRFJ6E5Up/Fa1soHmLZglhmGP26e0QzRp/WEPBxzE98iQpsfeVEbBcmIX4T2fvr9SMyoDjr9/JrHMCnoWCHZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ju2WgEPp; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ju2WgEPp"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-55ef4a66008so779026a12.3
        for <linux-clk@vger.kernel.org>; Thu, 01 Feb 2024 02:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706783769; x=1707388569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O9bW5DWKZwEm3XWa3arzOrQZClJJLst9IgsA8gjEHUE=;
        b=Ju2WgEPprqwHxfJ8/T6ilxYwgHxQQkfyipXik1MhVdQ6PlpBNpyg7RgHDftMcN7+k3
         7xYi39Sf83Xa9H14wqxjJcRPhntg8IMTZRCTpwk3Pn9L1qvNm3ixSdi8BmS4HM6vj+Gw
         +EH47pPBUoZEuOX4OxnED/gzSSpHZ5zyeoPU8kRryTt3ll2++au5v1jaKWneJsGILcqj
         HqdzSea3LbxU+YFhLKOySj06HioXTzWS/6ltkgraLHYQh/rLekXXUPNJfCS1p5XQWyo7
         VpXmMPP7RdLEVckjIerYVZ4m1BVZTwIau81Xuxo7sAL9X2exvpiUENtbWChCQaeOe5/u
         dKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706783769; x=1707388569;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O9bW5DWKZwEm3XWa3arzOrQZClJJLst9IgsA8gjEHUE=;
        b=fQsnJed4hvzTftyslSnD9PM+m7mYfb1tHLzcYG6wLM+T6K8da8isFvtrImjM/IaDa8
         OX5JSl9LX4Vvx92cabV5PTlUaGYUn1wIE3UGeZaJWK7SQ0NBNTr6InJdKSztf0NKiKNh
         8c9J6yasQZ196PvtXg4nPRdrQiMS52HJDydpChyqDQOcNCHAG8rSKdYq2Mk8Xe1+O7I/
         lr/ffZQfgViEKQaIfuNEdEE9ahlzQMQycGPLo8J7T7JPjdOjTl8Qkqv4X7X20oDRSxSn
         u1r9quqQX9PX1o2C25W8ez4BZVNrc/Jw39EXwDi2LyAxGBaGmMqwUGqsCimxSmb1EgfP
         Jtjg==
X-Gm-Message-State: AOJu0YxviPypSy+8n8tk7s5RKg8boEQ2O4KQzvKjoDRI4r0B9060Ev50
	FH7D+mbUyjMAm73ZygNTWjYSgT5w2LTXCHlY7VHmz3297K4cZ96fwwgyhE9BzpM=
X-Google-Smtp-Source: AGHT+IH0PEtxtdLjw0ROF0VltCVw5n5mnSK/kesalTaXz2Q0NcDj/fGcH9Qh1lX1fUcDEcV6k4E5PQ==
X-Received: by 2002:a17:906:688d:b0:a36:72f5:af5 with SMTP id n13-20020a170906688d00b00a3672f50af5mr3475965ejr.11.1706783769344;
        Thu, 01 Feb 2024 02:36:09 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW1ZdWP5vVe6GXZKwGv0eleCpoPE9D5supFbviv5vsvqLias0vAsT8XvaCIlZflJRIbwZBcOD53aj1WaerF6+ZnY7O+eB/SuVidU3N6WESgXKJYJLoDMAG3yhTNOcWHubs5PUTrV+IIhmpY/3s+PTgWPEo4LS7lna7nrBKfzkPUijWD1eTG/TLfh7OkhvxW+InHmIsumoJ2LBLtKtEaL2PqAIXRdNDF7FH45YipsYTZGC71NuioEWEJn5d8Jxipg2VrCwfn/lw4KcB1SJc3bx0k/UCGgHKQQJHB483e+Fa6fJfQKO7Mgb85No4xh7omxwSa2Hnp+ZkFgi08k4n3BNBPodQfIyjgK4J+n+BjBTFhg+wf53/Ahpzkyx0Hq7lMmhQvrqkh848TAUgW7mVUWbuDzQUjSp4kcQUuspSqaBGamrt5YB5fI/SQ9GFpzA+yJlkqCn5OMSFDQrScKRZPbnrzuQQcQLxusgONa77KZOGR6381Z2WkSdgfC8OE+UyxNGjuphT3wig4pX4bTjZaDeniSkohhz0Xn8Mfku5YV7L3keHmszqgA9oFQDVIUr6dp0HBWXtqnySJxOLGjpbVS/98XJwMd4mpllSG9Et69dIwYsb2ydzk4dgq+tV2IOa3v5zeVJ2tcFWw74pR0x2lBhkSoEB67y3iU5QgU+eAlMNM1IMmgnQN+A==
Received: from [127.0.1.1] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id hu17-20020a170907a09100b00a3603b49889sm3041749ejc.21.2024.02.01.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 02:36:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com, 
 semen.protsenko@linaro.org, alim.akhtar@samsung.com, s.nawrocki@samsung.com, 
 tomasz.figa@gmail.com, cw00.choi@samsung.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20240130093812.1746512-4-andre.draszik@linaro.org>
References: <20240130093812.1746512-1-andre.draszik@linaro.org>
 <20240130093812.1746512-4-andre.draszik@linaro.org>
Subject: Re: (subset) [PATCH v2 3/6] arm64: dts: exynos: gs101: use correct
 clocks for usi8
Message-Id: <170678376730.179918.14593646521347774739.b4-ty@linaro.org>
Date: Thu, 01 Feb 2024 11:36:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.4


On Tue, 30 Jan 2024 09:36:42 +0000, André Draszik wrote:
> Wrong pclk clocks have been used in this usi8 instance here. For USI
> and I2C, we need the ipclk and pclk, where pclk is the bus clock.
> Without it, nothing can work.
> 
> It is unclear what exactly is using USI8_USI_CLK, but it is not
> required for the IP to be operational at this stage, while pclk is.
> This also brings the DT in line with the clock names expected by the
> usi and i2c drivers.
> 
> [...]

Applied, thanks!

[3/6] arm64: dts: exynos: gs101: use correct clocks for usi8
      https://git.kernel.org/krzk/linux/c/512b5a875cd8b8352257fefe71513097ee97be77

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

