Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826AA37166
	for <linux-clk@vger.kernel.org>; Tue,  9 Jan 2024 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R81PcQwa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40b5155e154so37113435e9.3
        for <linux-clk@vger.kernel.org>; Tue, 09 Jan 2024 03:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704800951; x=1705405751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZRbCk8qoWzhrWr+jjYycVBUYFG/5QcQa9WqigCq1eg=;
        b=R81PcQwa0KNKPY0Vc1BO6PuyQslYA5y4lJT9xfie5s2z0/RYCRe9WqLmwoe7mAoIl6
         F01EEs87vhh3MXUsrvgPUdudQbXT0SO5qIkmTfabUrdlJiK0ChkE8cgdwY0FnGuwsBoI
         zGLjmTUj/PmQP2c6ismG6mCAwbSpI1oa4qPgKuLeZ6mCa6T56V66Aqo4mQ5Ps3+lLvE8
         NIBdGUFm6Y+QHTxrN2nIrSKUEl8tHVV8QiG5TsHLgUcBzi8uX4EgoxdTOgPjifUlCLA5
         zAQ40zt82Hz21u4D+PAnerKVbiHTAlHaGLDAGxBOO5PnwbsLku7GX24J4w1E4lslAuPp
         DOKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800951; x=1705405751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZRbCk8qoWzhrWr+jjYycVBUYFG/5QcQa9WqigCq1eg=;
        b=qLtZLdElzVEVQ/17AqQaVfg62Zj2ozH8t9JpUxBt6yUTDmFgXqi7baqzL1M5RtyO6s
         kfuvfCxnFsy7PlIe+82fnxIjhwN7pFEl5feDNVVwcc2YxSjnlNSyC9xjwQkIVrdXKRXT
         FQCMO5ZfWpL8F6xcEsSZo1y2OIdUA2SDCpMeT1AOdMw9W1j5+o+svjjA7Wxh5qP9u+Hu
         rVmc2zCFM8VZOXHjcY49gnIrByw3H+PsbAnOsXgQTthKGDXn3W0AurB4gMxliUWfi9LN
         u7+d/0xBpBXTz39YnecePYPBUSXnm3tFfwZ+3d4SGARh87pW6/h53i5zXqBx7rg/6jsv
         nc2Q==
X-Gm-Message-State: AOJu0Ywhfq5JlPLw/67vYw1EOiQApEtCM8U41OKHvWg7bJq6rUD8bTl/
	lNpNuYgWBu7ZCCx1MZKgj7crIFGQQs+6pQ==
X-Google-Smtp-Source: AGHT+IG5OZPESaiv3ZJWZ9aXTp1QjbvbftLSyzmc38Bl8NUiHJ5JLWEB88jZiBz1GZutTuBFPpSVgA==
X-Received: by 2002:a05:600c:4d26:b0:40d:73e3:41db with SMTP id u38-20020a05600c4d2600b0040d73e341dbmr2534565wmp.56.1704800950770;
        Tue, 09 Jan 2024 03:49:10 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b0040d62f89381sm3335699wmb.35.2024.01.09.03.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:49:10 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	peter.griffin@linaro.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/3] GS101: rename cmu_misc clock-names
Date: Tue,  9 Jan 2024 11:49:05 +0000
Message-ID: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the cmu_misc clock-names to just "bus" and "sss" because
naming is local to the module, so cmu_misc is implied. As the bindings
and the device tree have not made a release yet (v6.8), comply with the
renamed clocks in the device tree and the clock driver.

The patch set is expected to be queued through Krzysztof's tree as he
was the one that queued all the previous gs101 patches.

Changes in v2:
- comply with the new cmu_misc clock names in the clock driver

v1:
- https://lore.kernel.org/all/c6cc6e74-6c3d-439b-8dc1-bc50a88a3d8f@linaro.org/

Tudor Ambarus (3):
  dt-bindings: clock: gs101: rename cmu_misc clock-names
  arm64: dts: exynos: gs101: comply with the new cmu_misc clock names
  clk: samsung: clk-gs101: comply with the new dt cmu_misc clock names

 .../devicetree/bindings/clock/google,gs101-clock.yaml         | 4 ++--
 arch/arm64/boot/dts/exynos/google/gs101.dtsi                  | 2 +-
 drivers/clk/samsung/clk-gs101.c                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.43.0.472.g3155946c3a-goog

