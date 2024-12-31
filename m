Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A89D199EBB
	for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735651199; cv=none; b=hdoQw+W41ZW+oYkMKW2CrnT+mZAJguYhDA5g4W+3HgTm+eavUs4csCok+VLwbM09I5G6UXnrWRzSTZebgGlqTvNTek6RCyFSSbo68BYJiqSNsze2MtLrSDUdDrm4em0W17KBOMCXLcb06ddeeXKF7TAOVhoIdZehEnGgqgXBxts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735651199; c=relaxed/simple;
	bh=CgIbH6Gkiqif9/9gV2lWCiOf4KXEYqwfeJhtK1qm2Ic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ATT7B+V7JG42T14mgzyk/MsSKrTRXdz29iaWdYU4/uR0KDVebz+VtIBU8GtpbbwBdrcwxLB+3Tsj6v8+JxB9hK2Id+ZUdV3y0l/Tw5mjl+1C/uyRjSLe4SzVYO0PflJbdsqTfBqqQ9ajcpCbLMA9g5wD/OVuIaFTcFspFFdE0cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Of96EeMZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Of96EeMZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436284cdbe0so15971295e9.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Dec 2024 05:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735651197; x=1736255997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsIg+Mcd3VhuGN1xLJZdNOnDNUO1L1uY5LDyhY+2IAE=;
        b=Of96EeMZIma/uTaprRJUFryKH1araYS0E4EzuKMq1nFZ50LWCKLCZ/PM9cd3ufzqn/
         96i5aY6bKM2t8xSM1O3pr9r45jhFxKTueWLVMsfFpTiysFG/Yg9WHeGgX/1eiXT7PeYn
         Ke3YBXhWNRh43zpfmssfHkSHE3GQzQzFYkPdKVByhaoTm2wf1R6PjsEibEkjAsf26BQW
         qN94YBUZ4O/YPmcDjrK2dTZrjaFcvS6UgkNTGVPgaAj0O3scL1BKyD0MgD3wfDIV0owc
         53jQ5AM72zCPxKUlVpMK+flXpVIOHg9vGprt+r3+FXCWXo414vkqyGnD6+gMZVfVw58N
         BVjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735651197; x=1736255997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsIg+Mcd3VhuGN1xLJZdNOnDNUO1L1uY5LDyhY+2IAE=;
        b=QchSA2vU/DFLJ03JpYsQt6HhBtx3Zz5I0mpY6HAM8Q/tFrMs6AKV8hYJOMEb6EGKSf
         7iJc01eZaMJ7BzF+u6KRJpxcoZSd56BetOcgCqDok5OFbm/3nZNonvBlj6eCox1JKWOq
         /RDbGatljtYeZ7qGPrzZC0qwFirV4SmDgqxL84thQt3NlTmfB606HBTckg8PmOD6DDC0
         UsNv+MkiSmRQzCTULZKMu9U875GkPmWDXhwvuDVVYA4v4fRJP4ihkOx2Tf2sb58x/SrA
         wrUURjSfe4ztmcK162olwNqgQBnppzPZkeLdFJ9Ps8X0UWoszC04zsX58spEQfyi8jAq
         AiDw==
X-Forwarded-Encrypted: i=1; AJvYcCXX5WKaorvZtYa4LhUqXvIh2hzBWmlSQ43JD6OWc8FogEhHsV0wgCVbmKIwMw1It5aLd2YILBAeVB8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0c47Nf3Km761cVGVW/UCyX9tqWuXHa5WJNiN268MfbtMYfK5B
	/ORCGAT6Fgqts3PB6YUyPOLnexrUiwegrKgaZXMpUzv35Of3O0ylhhIIg7Bwkyw=
X-Gm-Gg: ASbGncu+x8TTzo/Fg4OcBN0zs6p/UrOJcfKIWON1woGqsweh1jQu4R51a0FlAANb+Xx
	qE73Vq0ONmL4ZyBNzhOBf4QacI9ioVZrvGl8WerxrPzT5nUFMOJ8bI2Hl6puwkd0cK7Gzz3PRRS
	+o+UJB5EGR5W2q59TN2cRqKlbbwq2+yuAYVZz5T/WYDtRvNfaN/tlOw7sshQ45DZ9b5HfXz53Pz
	RzLV449O57QEWcN9CvqzG+Fzy6t2WSFuichAIbMfMlrPhOEcDIJ7Cd3Os+xjnTjNl/zKK0=
X-Google-Smtp-Source: AGHT+IFdVsUX0ato8elnQIAS4IkMtXA5th/MOoBVgOBpYTxoY2gUKvFdkQGLMpAxiE680U/eW2BAkA==
X-Received: by 2002:a05:6000:71b:b0:385:ea11:dd8f with SMTP id ffacd0b85a97d-38a221f780bmr11631694f8f.7.1735651196674;
        Tue, 31 Dec 2024 05:19:56 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8a6abesm32818468f8f.90.2024.12.31.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 05:19:56 -0800 (PST)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.14
Date: Tue, 31 Dec 2024 14:19:53 +0100
Message-ID: <20241231131953.134834-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.14

for you to fetch changes up to bdd03ebf721f70df1458a720b25998a489f63297:

  clk: samsung: Introduce Exynos990 clock controller driver (2024-12-14 11:39:02 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.14

Add clock controller for new Exynos990 SoC.

----------------------------------------------------------------
Igor Belwon (3):
      dt-bindings: clock: samsung: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  121 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1716 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos990-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos990.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos990.h
