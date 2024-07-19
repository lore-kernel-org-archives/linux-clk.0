Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7167F487
	for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721381990; cv=none; b=VZGTuy3aOBlvas6qRSIXh6ovHYcLuFlRfNurJl2QJRk0v8qgfXa+lTCpTH12l4IZZXCkGcFcinY4VS+apCclzeS+XkqPA83fItuVshVIKGAKDSj9+QQ1WCFABHsEYpCW1HnSOPYvRJNcTL8UrnKK/iegmaPC1vwXzc528/kpz0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721381990; c=relaxed/simple;
	bh=ci+KcHwAigtpkpMNemilRAChZcTSbPV2xvcRYGetHnI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T4y1SOYuPa87pE9Pzn65TS+JXFrzVgNelAIKuvjHDmKxa3xv6Uf5Oxqthm6MFDlBv7j4h7H/Z58GD3/g5y2Gbqqkti0UzLbho9Dw3KKj23a6KVKE2Q5A8T6+hBZ+SdJT8zRSD8wB7nw4SGraqUuApbENC43YDXf7i5vWc6U4z+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=ZImnCz6Q; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ZImnCz6Q"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4277a5ed48bso10651565e9.2
        for <linux-clk@vger.kernel.org>; Fri, 19 Jul 2024 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721381986; x=1721986786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rEbHlu47gMjntr/0lWZ1HMtnTqXHStCt809hwXsuo8g=;
        b=ZImnCz6QdOO94SYv+5u/IVcyKMeeqTBSXtCgIJc3gq+EbRk39g5uhO2hPjtLtXqoTZ
         V6WIUrksnZ8uJ2+MoRJuJP8VU7IAgu8oC/VMH5nILnOHRgV1KArPJ0SHH0gv7FPg/o7d
         JKVtBaKYT7mz0sOKmbaPrImMQPalRd4kyndrDnl7KBqcAFwRBsLFDDWbmnXdDK9RbY3e
         iPZTUVutIxqtIoLmr+B0An289Dg4Ehy0oEFHUkw1/s/1AGdU+8TFTBtnZDOa8UwpF4vM
         CCWi2i8rowy256NEnm2vFYco9YNV3pjiN4Q9f/97zd2WCGf2pJLOAN8V5U4KAOT0fQoM
         aqDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721381986; x=1721986786;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rEbHlu47gMjntr/0lWZ1HMtnTqXHStCt809hwXsuo8g=;
        b=WODDssxqjoINzCWpbYfKn7tYRIG8onXf+k//QD1cdLMkfKcj3PWIK3ryWHi080+g1s
         h1szRohMY7hm97sGIYprazjpNYMnFafn2p/AqfjBurp2ixZxLsKqx9SWVGcxr/SPspli
         8kRstDtvlw786azYm0B6PoJqgfM07Psx9uCQtwB8HvJYydy2pFoxy4VIxDcD4kZXOz6/
         Qcn3FQ0DEFsGvaZvbZggMySPvB8t8TSmt5x2mYbqK3f3mRsfHLVpPFUOWPjvusIdaOvR
         i7XHRoB8mm2uCpbNqKcuPEZWHlqkDe9oVJrqcDxB9/XS8ZQk5pnmI9+RuwZ4PQ5UXVWA
         kjSg==
X-Forwarded-Encrypted: i=1; AJvYcCVTgHi6RaA1hIu+sid7njdbCUMag5toXy1K2rTs+BLIEkOdIx+yJk0W3GRpeJzlJtRmsH6m+RXYFvOeFo1MnhpXPD1A9YqlIf0l
X-Gm-Message-State: AOJu0YyKmbqW0xW6APmL04HnF/djL4sC42l84QKJY+mbAjRa34S+GnOL
	mxLEVFZRZw2OjQb6KAq/srMChHaOD1kHdgtZUxCg7JoR+cp+3S6giBVV32yel6I=
X-Google-Smtp-Source: AGHT+IH4BxZr7nNiWWbM+lEJPkijyLd0iYBXu9qVNkbqOH0Fb5f61iPqIYleOo5sy/iDP8q/46Z88A==
X-Received: by 2002:adf:a112:0:b0:368:71e9:4ee3 with SMTP id ffacd0b85a97d-36871e94f3dmr1106799f8f.18.1721381985670;
        Fri, 19 Jul 2024 02:39:45 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:5ac4:5655:4dfe:ce97])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3687868bc91sm1100956f8f.45.2024.07.19.02.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:39:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 0/3] clk: meson: sm1: add earcrx clocks
Date: Fri, 19 Jul 2024 11:39:29 +0200
Message-ID: <20240719093934.3985139-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This patchset adds the eARC-Rx clocks on sm1 SoCs.

This pushes the maximum register of the axg-audio controller up
again so a SoC parameter is inserted to handle that correctly.

Jerome Brunet (3):
  dt-bindings: clock: axg-audio: add earcrx clock ids
  clk: meson: axg-audio: setup regmap max_register based on the SoC
  clk: meson: axg-audio: add sm1 earcrx clocks

 drivers/clk/meson/axg-audio.c              | 38 ++++++++++++++++++++--
 drivers/clk/meson/axg-audio.h              |  2 ++
 include/dt-bindings/clock/axg-audio-clkc.h |  7 ++++
 3 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.43.0

