Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B60175B4
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 08:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706171149; cv=none; b=uIM2xWtdoyT75MMf0j6cgkbjLf/a3kNLYdxsCoehuXb39pairYE9pDtwfGl7obw+xuw+sRunyTQr+fAU5Lr5ZhfgwuB5dcLnTl/k9pWvg0o+q3ZJvwqqZIcFcQS744+wGLaP9BduUV6xMvT+s5VzSzbBbKiZ56UXTPqE2d3sIdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706171149; c=relaxed/simple;
	bh=i/YxA22uUKOt9Mxj9tEsMSlwM/ZWHky9Kq+vcJ/LWt4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c6mH/wjJWA3Rk7T4wvfdQ+xeL9CosVLxzB+nFdYopv1yAxHCjSzHTwKWoT7eZzrRb17MYPEiMadWngLlvVEIECMP1J/IOzdx7xlUodWfu6PoGGAy8rtcnljPsvO2XOeq8rNy/UoZzl6e94XkA3OfgMJMQTPMpm1LcBcgSvP0grY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W/ieXfko; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W/ieXfko"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55cec718c30so767264a12.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 00:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706171144; x=1706775944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pKFVClDiXcnUwHJNQzSINW1Ng7JFz+zFFzQPZ1gOOKc=;
        b=W/ieXfkod6mQubBPhGn/Fc8zscj3NRsAJKQ+QzmVDtCfB//UKulecQO4mC4OkEf848
         0HPZt7NVt7wMSa4Uq84yITJHCvu99r8zKSVTyWCCR7cepFD6ic7GC83f2E1oWvC/E5Cl
         xGkIdUxadssjF9WWWm3nvASMKZWiwWdZAxlhd8Ylg73A2Yr9DVpkExttBV3OdzkZZUEM
         oYJnIn0h/vVMr2JzDSM0a1bzough3kzkNEoFrlvt804MEgkx/jsQVAH+LIFa0XcLjQ/D
         xEx7WBKDGwFkhjFAwt1zm7ViHjcBEIMbLZUnZMYDRpC1jgj8AzC6EalHkPCt+j/rllwM
         Hjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171144; x=1706775944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pKFVClDiXcnUwHJNQzSINW1Ng7JFz+zFFzQPZ1gOOKc=;
        b=MZF2nynnCdrrF6AkqaEn5YyWzMtT2otkoS/iApXKzLvvjM3nmiX/PVg9na2pLMUL94
         HiPGoissqhWieN8xcLOxluXGm1V0l2QtWG6BmkNlVAxqbJEPUKqCqrg2rmEdvGP7476g
         1YizvwJODszAemS82/UModZ6nNSMHTO+eeZEwsTSoUhs61Me+1GNN/OK53uwrh0ddezH
         xl8AH1c5X1HWAy+yt23RAvzo/rAHNcW4t1kq0xp+2sEdwQ7xcJN1LYHT9oveOjhinT4/
         Pn3mSy1EKP9bYhFN2hFuvTSomoXcjLRp3l/ZSU3yorGPxpQEJewLqP2cWDqsrraP4Miw
         tSQg==
X-Gm-Message-State: AOJu0YwFjGMOx8/IkJKfEYe7bg2nD+F2/UWjvC86uERJ21xi6Sdo3JE1
	+wfkZqIGBhHZc0Cr85uFIBdaWW87Cv2WcMZrEpGbUWJz/FCh6ehsOaenpUyV3sY=
X-Google-Smtp-Source: AGHT+IGqQUtuSHWje/MYMaxTD+yDmIj28Z2QSF4AwCZVmw49gair3JT/qApQTITIOCjJSVbrKkf5qw==
X-Received: by 2002:a05:6402:45a:b0:558:4a2:42af with SMTP id p26-20020a056402045a00b0055804a242afmr362809edw.10.1706171144554;
        Thu, 25 Jan 2024 00:25:44 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id el3-20020a056402360300b0055c82e27412sm2486010edb.75.2024.01.25.00.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:25:44 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL fixes] clk: samsung: fixes for v6.8
Date: Thu, 25 Jan 2024 09:25:38 +0100
Message-Id: <20240125082538.164262-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-6.8

for you to fetch changes up to d76c762e7ee04af79e1c127422e0bbcb5f123018:

  clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names (2024-01-22 11:40:12 +0100)

----------------------------------------------------------------
Samsung clock controller fixes for v6.8

Google GS101: Correct the input clock names to CMU MISC clock controller
to match received review.  The review was initially missed and CMU MISC
clock controller bindings, driver and DTS was merged into v6.8-rc1 with
different names.  Nothing was released so far, so the bindings and
driver can be still corrected to match review.

----------------------------------------------------------------
Tudor Ambarus (2):
      dt-bindings: clock: gs101: rename cmu_misc clock-names
      clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names

 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml | 4 ++--
 drivers/clk/samsung/clk-gs101.c                                 | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)
