Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DEA1CD3F
	for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 17:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711474104; cv=none; b=AOqmcRK9hY1vqWG3AZ3r3kxxzVjhxWf6ybsPaUSjJPJWW4IqlD39Fgrao/jjAierQ27mqQgyVJ7oEZCfYmXZtTY+L0g06Jwz+WiuPb2g0b/4rn4edGTon0ANiK6OhTtaep8zffMC6iyKyvUhfrP4A1WIZst+qJx+wSE1M0ZiLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711474104; c=relaxed/simple;
	bh=ejFNoOYsh0RIbZh0gTh5AZFv4tIJYFy5C/80aIdfELc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fnWgKjYEn9t0nXWBIcIxmGQqDRSEDsfCGI27datz+0gG0cqpcAY2/LB/QojiuW58eEYORXPtEWUwLAJT+31ke8jgpFSJJu1XVPeOETMAxRTUnTxybj9FswmHe0B66Y/UIpKzzqnVx1i5Nqvet7qTdbHgm8d7SOE+yPdUZm4G7oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zNVz7tzq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zNVz7tzq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-414866f92beso16826925e9.3
        for <linux-clk@vger.kernel.org>; Tue, 26 Mar 2024 10:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711474100; x=1712078900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=34whjUG6Zl1XJm4VzRMa0tnbaz/35qwlfAZRIoFZ8E4=;
        b=zNVz7tzqjT6uL9hevDhszkTpJXvJPEmPmQ/fDlul7Z9e6ZIUR/EOdOgaqGeQG191Hu
         m5w/cSpMWbHY1oiaf7df2m9LRhOluzusnpdNrEN1xSPr+gTeW4RUMKD4RdLMjHIu9DHk
         Hb25+VjHk2SztvYOwU8n/JI5f+H2Sx2dD+joGPWfkexGo0ooCVEBRSJzRu0sOCSz7rZ4
         a4QR4egneqWpAgcKjJzafSmZ1wRVJgJX5jxrq3A6GIjMhxz3naZ/GVn8QOb5u1afOKp8
         JM/cgNyLMBdmC5KCzpux/PcCd54PTIR1so3B8eiBDKXRr3G9913FyUWix617VpwfTQmV
         /pUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711474100; x=1712078900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34whjUG6Zl1XJm4VzRMa0tnbaz/35qwlfAZRIoFZ8E4=;
        b=JXNDQdyb14LOc0Db9h2L7llnh5sfBjK91M1QODM49nLb9NAv8CtdSO7AzcdNj+Nj9o
         SaFC2yYYQOS9vNBhD50FIRlhZLwupY62Jf3sUp+NAYpSJLGTjqs+i+RIf6/aIvVSH6g7
         poMsIYMH1p8pUDyTuMj5HMPw4A5lHlDBDk93FtXhQaL3aGDd8rg9uvOhiKx6oUwk3Xmn
         MrY81dum8GSLNov3pG7So+mk483EjLCym8sGiAf9mozZmEo1TIizIFUMmt1EHMwKq19V
         LYaHjgC30hzh/htjlpwExEUsy9Kw6RoBTEFNYQjg+txWbhuvUdGTGjUG6VlL1FZaN0Kc
         XriQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWvq24FzqlL9vwJWuK+bc4ef39pwp+tYAG59xHbmzoYSgQayX1E6pshY2WSixfud7RieAqmkfJDihqTmZrEuuJGJUP4QupTBrt
X-Gm-Message-State: AOJu0Yy9/KHPU+GhuD6iWlylg6vkMTGgHcj0hirBgz1tN/6/f9ydeGHl
	i7QXR6for4vVBt2lLT1HbN1/AKbMwrpDaJSely2WXtDWn1aKU0TrOKpzPZfLBio=
X-Google-Smtp-Source: AGHT+IGVsI/cgzBwB19eGGlN8u5ea7DLBa4HSFT2VWsIzl7t0W0L/UkrdqHMsvGdc4yOzHzhWAb+lg==
X-Received: by 2002:a05:600c:3149:b0:413:3160:840f with SMTP id h9-20020a05600c314900b004133160840fmr201412wmo.0.1711474099691;
        Tue, 26 Mar 2024 10:28:19 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id fl12-20020a05600c0b8c00b004148f9c5822sm2063281wmb.22.2024.03.26.10.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:28:19 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	semen.protsenko@linaro.org,
	linux-clk@vger.kernel.org,
	jaewon02.kim@samsung.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 0/3] clk: samsung: introduce nMUX to reparent MUX clocks
Date: Tue, 26 Mar 2024 17:28:10 +0000
Message-ID: <20240326172813.801470-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All samsung MUX clocks that are defined with MUX() set the
CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
reparented during clk_set_rate().
    
Introduce nMUX() for MUX clocks that can be reparented. nMUX is used
in GS101 to reparent the USI MUX to OSCCLK on low SPI clock rates.

Each instance of the USI IP in GS101 has its own MUX_USI clock, thus
the reparenting of a MUX_USI clock corresponds to a single instance
of the USI IP. We allow the reparenting of the MUX_USIx clocks to
OSCCLK. The datasheet mentions OSCCLK just in the low-power mode
context, but the downstream driver reparents too the MUX_USI clocks
to OSCCLK. Follow the downstream driver and do the same.

Tested with USI6 and USI13 SPI.

Find discussion on MUX reparenting to OSCCLK at:
https://lore.kernel.org/linux-samsung-soc/d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org/

v2:
- reword commit messages
- drop exynos850 patch on Sam's request

v1: https://lore.kernel.org/linux-samsung-soc/20240229122021.1901785-1-tudor.ambarus@linaro.org/

Tudor Ambarus (3):
  clk: samsung: introduce nMUX for MUX clks that can reparented
  clk: samsung: gs101: propagate PERIC1 USI SPI clock rate
  clk: samsung: gs101: propagate PERIC0 USI SPI clock rate

 drivers/clk/samsung/clk-gs101.c | 225 +++++++++++++++++---------------
 drivers/clk/samsung/clk.h       |  20 +++
 2 files changed, 140 insertions(+), 105 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog

