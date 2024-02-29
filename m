Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDB17D069
	for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 12:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709209229; cv=none; b=HUe2R0o9iqA1UiF4kuuWvSL4XKBAtjK10AwbEEtpZUduySDvYknwmihuawotBCaPHQR6c1nUSD78NGehNgJaUjDvJFXpj/c1cd/38S1BIMcLSwK3V8HNabuhUhkbgCksFAV+4WdDYdRsdMaCwOvMg79UvvdvVtIf667WhbilHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709209229; c=relaxed/simple;
	bh=t3T3nzjH4yLLDmY7ceHX7NGlnylBse4d450fwq8jtb4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUz4JBW927PLoMj/yqzSFHl4vUE4TtZhGw0n+SFsv+bE3Ge7lStOSblyR4j2SiMBn6n2gBR0XqZxlwldC3I4wjufAXA+GBbDQgh0L5SHA9vPzLNlRYW8Ug11zb8AulJ+nC8MjyNmeccHwkWt9cQyOOcr4gAkI6nHapMUkLcH7CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bV0ljLJs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bV0ljLJs"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so9217801fa.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Feb 2024 04:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709209225; x=1709814025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vjzIB8u0IabtEYVRJzJAEQ3mD04zR5ijVvS5JF9Y6Y=;
        b=bV0ljLJsnKGd2TcJdvZm1mPKKYlRZ/EiYJjfHVuMoIUDtNy+/4KBDX4JMOpZr+MDUX
         8JAVwS0kvP4QdXbt7QPYgvbcSYEsTPtMG1JTkkFyFpiFzssSOZoIlCDBPGWZwJzu8Zav
         sWAKtYDtPkq+PvcVDpsnnRzsCwbWIP9PyubVkRrPt0HAL+0WFvT8B1SFRb4rFUcULhsQ
         lPrs/bzhh/sf7fNo/tRv16WCGmzx4ATc6pgOvbt8R6eravEcpJJJEzmUqqfZdym6bamY
         2i3n87OtH0JPXpUbZuyhUtiar19u18mA1PHnp8lZiQ33MjAiQsJ/ltPtqpmi4EemwdsG
         8AlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709209225; x=1709814025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0vjzIB8u0IabtEYVRJzJAEQ3mD04zR5ijVvS5JF9Y6Y=;
        b=ryqOaORk38JgQ+wmmbQB/NiJwBEIAkZ/uFJ/oTFBntwWV1AIv6wiNEzyA001flYG9o
         ATA3wR9duZRYN884jo3jVXrQlJM5pfLL79Qmo1nYme1U9LAcN8Pou15O5jOizyOMVzc0
         OJR/5GaHwO7myNn4b/YPKJjK3BGp555ImRUJ+2o20xGdPEY8ay++1WKWj26SraTpvTxn
         EoxyaHA5q4og78Pzw2PrK9bwtThFIcs+PPujKxQnYazJz/E5Va/0mGSBaIOpCxxT8Z61
         Ddqj+ODp4ExA6UaMODGxp8lmpka5mXNNUQyvpQ4X9KT2H3BAvnwTxCZoknsidQOlin8m
         /x2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXaZDHYB73srQylYRKSCTPvuPoJLQPE1I00Umw9h28uyOiTGHjJ/bmkpDUyyjsDaQXtYduYd+VS27wQ7wJ2j2RphjhCjXI8hFiR
X-Gm-Message-State: AOJu0Yx63UL3rFzzrv6WIbzCo533SgdnlY/ZXz/oAWIrqfYBSCTwEut9
	3Z+k5l2ODrKkI7P10HWr09OVhVj1FXFwLbv0ipDT76KgG0fXGOzcOubHBi2MiL8=
X-Google-Smtp-Source: AGHT+IG8n5Uwvbvs8YE19xuHslAxDWVpeTnYjInoghHURNZKQMGqmCLjO4J8AQclmPxxrOwq2z/Afg==
X-Received: by 2002:a05:651c:19a3:b0:2d2:6c75:9a67 with SMTP id bx35-20020a05651c19a300b002d26c759a67mr1670331ljb.38.1709209224600;
        Thu, 29 Feb 2024 04:20:24 -0800 (PST)
Received: from ta2.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id dx14-20020a05600c63ce00b004129f28e2cdsm5009121wmb.3.2024.02.29.04.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 04:20:24 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org
Cc: alim.akhtar@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	peter.griffin@linaro.org,
	andre.draszik@linaro.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 0/4] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Thu, 29 Feb 2024 12:20:17 +0000
Message-ID: <20240229122021.1901785-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce nMUX() for MUX clocks that can be reparented. There are MUX
clocks that are dedicated per IP. The reparenting of the MUX is
safe without affecting other IPs.

Follow with 2 patches for GS101 to propagate the USI SPI clock rate. nMUX
is used in GS101 to reparent the USI MUX to oscclk. Tested with USI6 and
USI13 SPI.

Fix USI SPI clock propagation in exynos850 by allowing MUX reparenting
for the dedicated USI MUX clocks. Stop propagating the rate change from
the USI muxes to the common bus dividers (dout_apm_bus and dout_peri_ip).
Other leaf clocks (HSI2C, I3C) are no longer affected on SPI rate
change. USI SPI clock range remains the same. Exynos850 patch is not
tested!

All 4 patches can go as fixes, since they fix the clock rate range for
gs101, and stop affecting other leaf clocks for exynos850. I don't mind
however if K choses to queue these for next.

Tudor Ambarus (4):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate
  clk: samsung: exynos850: fix propagation of SPI IPCLK rate

 drivers/clk/samsung/clk-exynos850.c |  15 +-
 drivers/clk/samsung/clk-gs101.c     | 225 +++++++++++++++-------------
 drivers/clk/samsung/clk.h           |  20 +++
 3 files changed, 147 insertions(+), 113 deletions(-)

-- 
2.44.0.278.ge034bb2e1d-goog

