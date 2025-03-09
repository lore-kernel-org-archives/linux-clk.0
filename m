Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61E51EF395
	for <linux-clk@vger.kernel.org>; Sun,  9 Mar 2025 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741542722; cv=none; b=YFUUPny9uQf9RBuZFVnkqXnPieCNBi1u/Omjvv30LE4ZZcbP7z12DIJJ+ON3oMkux9vjgG4u0wYMmdLjCCSOgPu3As8BxPvysyth5/EBvP7F8t9g165jRZ3dGsXENlXdGQKpBcd8a7LbKznLaDe2vlhGO7BeNk+b7UBPT2Zqpu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741542722; c=relaxed/simple;
	bh=qUhJTHxhYSGPM2ivbiGZV8niqI9IljfjERFihuPePoc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQEgHw/gNZRjWEdrQueggRQMrBpc2dGrKO9/RAGXozWi1nicPw+dN+WCm4UOjV6w5zHfr7jzGqcG66btm9zAA86930eNYMFCZA3p1xMGHJrRBdDveiMYuu1SH6J8WbwmMSgY+4a7pAOKqznqtBB5CXK/nx53ucxf/mTzdwWF5Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkhWgUI3; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkhWgUI3"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3912387cf48so109236f8f.3
        for <linux-clk@vger.kernel.org>; Sun, 09 Mar 2025 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542719; x=1742147519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jo5cZzus0FAHnZneWz5yvUV4j+MaUQTnWxm1PiFIAZI=;
        b=lkhWgUI3jwTbJKxTZIRENYWztV/B9WAOo6rSS6zyA0scpOkfMKDQAvBeUf4nU+fw3m
         9ZT2iqrmbHIpmS4QExJQgiIftbDyGTf88JtwESwyTyT3rvT92hBUOfLklK5LsJqvr8JW
         BsMpXJZbIMZ2z2FCr11R0Y54/sv4e8611nF3ElCNYalmRSWUVZ3fVVmqI3qGrVhm8xEU
         EW6Q4Gul1XVOi5LrbbAoX6k1bHwNoachAfQk7qOPv5vhDCKEoRV6ZeLKgr4T05PDl75W
         Tp0f2p6chobBh/EcUceFDSwB6QrvjxXKOaa+Euq2RPiaL/ekAL0Zx+wqKxFiLpX9N19t
         Gssw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542719; x=1742147519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo5cZzus0FAHnZneWz5yvUV4j+MaUQTnWxm1PiFIAZI=;
        b=ey9C2W3L06iksoju/Izz5Z27WJFZ1yEMa7Vyqcl0hzT7CX3PxtaToeBEqdYCJYFY1s
         28dkRvdecS2zMfILyCptSKG+3xnJjsbU6j449P73gS6CzXTdE/nqQpcS4QVJC9X0/Yjm
         8nQN5lRY1puo4HlekCI4Xpjfn3bTECBHi5i13C3axKhRmZ5+iVdU4O7k/4xVH1yDOfas
         3YxC03hfVYGx1wgqnls6kjQV7fDwqndbHhWvybosaphCMSU7gNxtH2TLDQXJXTBKhj1t
         gUHiKDcmCqD6Ow2kdHq9tHGBh+14TajiEyqCi0dkQf5Gmd+5O4Id9eLJR9PFZD9wPgPM
         49Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWxdYzmdqVd2rNLT8o/ivTxiO8WGAtswT1c9kFs90yeY02Y5FmNVOV5QumhZQxOqyeHQ1/cqrpC/cE=@vger.kernel.org
X-Gm-Message-State: AOJu0YylsHdM51sf+W0JkZLm+zwRbOEuqLexBrSsjs1/m6/5z7IeQg/N
	4RGYCW3MvNKlkMTxmFCFHM2JCQnpvoXYdoOn+ExI+GsJIoSR5MHcb+fpsp70GM0=
X-Gm-Gg: ASbGncvbELyqOIyuLNNJ7Q3geQArbJxdAKLOUKzpT/rV9jeZ4rcrMZyy0/eAVUlCNPu
	2U+Yca6ZiaobbdnbVicaVY4nI2poF4taXTNt5gMzu0TFjPOeWLGJD03Hu1r4nqEdtiXqHW9T+op
	cwXP039gp9eyAX2dQ5FiJzsVrU5guukplZFrwrqLCuJ4tmA5z7uwJ4R96lDWnhzTQUmwKayHq93
	sV1JvCUGL5hJOy6Xual0JTqPv8sHG6Yi8f1dpAIcbmqBR2NfpivIO9OcwffDwT586oIVGPPhoPd
	7TlQ9hBK9XH5dqz7BOUyNBAVfJXs8pjiHryF05pTREKEoSZSfy7OenuoSo4=
X-Google-Smtp-Source: AGHT+IHFXC5otRZ7F4yGnhvywHvWeRyg1x0RiP0aY2UeNSAgYGd4FzPX32gmebfW67foinZiceGAog==
X-Received: by 2002:a5d:64ec:0:b0:391:2acc:aadf with SMTP id ffacd0b85a97d-3913bb4709bmr1218934f8f.6.1741542718937;
        Sun, 09 Mar 2025 10:51:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7934sm12638173f8f.12.2025.03.09.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: Fixes for v6.14
Date: Sun,  9 Mar 2025 18:51:53 +0100
Message-ID: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Fixes for current RC.

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-6.14

for you to fetch changes up to 53517a70873c7a91675f7244768aad5006cc45de:

  clk: samsung: update PLL locktime for PLL142XX used on FSD platform (2025-03-05 20:13:25 +0100)

----------------------------------------------------------------
Samsung clock controller fixes for v6.14

1. Google GS101: Fix synchronous external abort during system suspend.
   The driver access registers not available for OS, although issue
   would not be visible in earlier kernels due to missing suspend
   support.

2. Tesla FSD: Correct PLL142XX lock time.

----------------------------------------------------------------
Peter Griffin (1):
      clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()

Varada Pavani (1):
      clk: samsung: update PLL locktime for PLL142XX used on FSD platform

 drivers/clk/samsung/clk-gs101.c | 8 --------
 drivers/clk/samsung/clk-pll.c   | 7 ++++++-
 2 files changed, 6 insertions(+), 9 deletions(-)
