Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7AF44E040
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527155; cv=none; b=SXjDfXtOr3hJwkVQ6njqmvQwgA/5Edq2/Yn0qYhgCcP59WZn8nCFxK8IDAtWEmbkIav2/qP4X8dNMsP88ifAyPEgpaz9d4Cn0eMmoDrSAcWBT/okq463g5FK/Uh/h5rKSyizOskQxrOpWXEPg/NiyH7kc+o0oaOpnwgu1FTw40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527155; c=relaxed/simple;
	bh=amfR39GXM/RYwIJ89TLxwC1xDMx9DOHbmIVZ1T6/tow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CA7iwK08zKwFkgo+tJCeFttxPb0ohMOIeL5m+p4iET18/cy84zKFemiYGaMr22n1yT5E4MidlZIzqetGOS9QvyaNmWC7AdrLuRItlHwlT7mRGKDd7NWJaRnYTRo27Y13m46jsLYG3HCibEkXBzG6IrMz5FJsQi8MQO3HDgbUZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZSCtR/15; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZSCtR/15"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48d146705b4so58168425e9.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 12:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778527152; x=1779131952; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0VBMYUO8iwKdjLIgQm/2QKqt/0wCxzU8CXHOfJiBo+w=;
        b=ZSCtR/15+Xn0OJxpi0QnZYkmVo7yzHs3TCpK1W9IPuZZQCtwxH4H8Dv11DtzHGNQJK
         RTQb5kCsyDQnTFVWKo4EaVvh3cLW7lInIzI2Qbrho8l1aurg1FACjaf6yemeCIiWjnR1
         AA5poUyoLjDQ/GG3JK++iDhVxSIQJfwVGSIJLoxAnxoq3WAI1r4B6o1t7gwASOJ2fmuv
         yPY6sW6xGePPhdyb1pZ3vb4t7KyQqZ7lPzfSjqaRJLMu3TZmKUs4pdb4hnp1KLX8GdtR
         8zp+s393lL+szXW9lMAdegE/mt4/1DKRhOySwGWvKDX8aSuNWt3WcTtcxaqUKrBW8y53
         doig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778527152; x=1779131952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0VBMYUO8iwKdjLIgQm/2QKqt/0wCxzU8CXHOfJiBo+w=;
        b=Mr0ozXnwuSDtoQwuxP/vqOqNXFwJWvuA/O9kWk/2PfyOdsjRao8vE512A4vx6pzv6F
         Bno25C56uL96KCi/DTdAXPh9RWjpQE2zv8PgwpSF4FjBc7MxMgQYaDnmkxBdquJ1QlkK
         2fEgv4o+J3CXtTsuH2k7JegmzArfyRIU0wBu/d/pJCUpQDV60z5x54DwsTO4jNkAaPJu
         AmnaI/kG2B4RBlgN6FOALOyK4FkwLIDglqGbmGPsiMlW5qEg/Qua5cFDh3yq4VQTaXbm
         jzpwWx06gi8H4h8zIWeC5QsdeRbw4bRgbuGRz7NxyUYzdFZF2vy8nNn6KBYF4NkWM0oq
         S3zA==
X-Forwarded-Encrypted: i=1; AFNElJ9W+PIoyl0MZI92sBtJYCH92YXIjZqo4P7hpu53THf+PyiezBlJJzoSF39e4vvEnf2KIcuw5pwhV0c=@vger.kernel.org
X-Gm-Message-State: AOJu0YycXhyMX4S2LBg1QwX9lbpPzQ2owubJvlXrCWS1Rh6a8OlIm3tF
	LwkTB7Y2gJQjI+FiXVn6ciF5w2tHP8m+8R0B+T+6c5jGig3qx+OxW52R
X-Gm-Gg: Acq92OEyjQYxE//pm56xwdl98GthSu6dwYRxmV0Y//SZOgzYMxjaU0myrun17ZXe4ZQ
	YSo7bdNqHlSklqQqOfesL6tZLBrDk7HUt30OH2HSu1+cIexfiebcADKWfdBlq/BBgDEpFgArB+J
	ohdw5oaNhKE/sUqBoXJEI/k4PKVwpDfHlKLTlRFRBxl0IkiyFgWFZ5nMwC/SZw0AfU+gy63uJZJ
	j4//ewl4qvryn35DKblTsDR8B8Ho7WBUNH5kvXZf9RRLmbMrI4dl24rfoOOyVOqQxe86ZVkYXOA
	UN4BpWk73dcpLUqEYIePUzU1k2vP8W+EyXY8gNBtolBdhAZZ1vrqYu9NN1LhQN73In5dWRVRhcA
	8IC3LXK6vnZpuVr2mziOfblAhrcoBpWFvFMAXpRAvYGHwMMKi9oDXImTTVErRDthSsZm27qpWLf
	ZkxvowUMCNOwAGQ2ri8wmIOn6MaTxR6tiTyP2fwpD+bTVcyQdl2VLfRJ78z38+9VEYzSgmPp3AF
	5+fO5etYakQw//yD43YHmqPApbg6PjzFAiMzg==
X-Received: by 2002:a05:600c:c096:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-48e51f50982mr315270505e9.24.1778527152357;
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e687:6094:b849:9886])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e7e45ff89sm150350725e9.8.2026.05.11.12.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:19:12 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 0/4] Add PLL3 and LCDC_CLKD support for RZ/T2H and RZ/N2H
Date: Mon, 11 May 2026 20:19:06 +0100
Message-ID: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi all,

This series adds support for the PLL3 and LCDC_CLKD clocks on Renesas
RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs. These clocks are essential
for the display pipeline, specifically feeding the LCD controller.

Key Changes:
  - PLL Reference Flexibility in  the RZ/V2H(P) CPG driver
  - MSTP Dummy-Read Mechanism
  - LCDC implementation in the RZ/T2H CPG driver.

Cheers,
Prabhakar

Lad Prabhakar (4):
  clk: renesas: rzv2h-cpg: Use per-SoC PLL reference frequency for
    calculations
  clk: renesas: cpg-mssr: Add table-driven MSTP dummy-read delay for
    LCDC on RZ/T2H
  dt-bindings: clock: renesas,r9a09g077/87: Add LCDC_CLKD clock ID
  clk: renesas: r9a09g077: Add LCDC and PLL3 clock support for RZ/T2H
    display pipeline

 drivers/clk/renesas/Kconfig                   |   2 +
 drivers/clk/renesas/r9a09g077-cpg.c           | 369 +++++++++++++++++-
 drivers/clk/renesas/renesas-cpg-mssr.c        |  65 ++-
 drivers/clk/renesas/rzv2h-cpg.c               |   7 +-
 .../clock/renesas,r9a09g077-cpg-mssr.h        |   1 +
 .../clock/renesas,r9a09g087-cpg-mssr.h        |   1 +
 include/linux/clk/renesas.h                   |   5 +
 7 files changed, 444 insertions(+), 6 deletions(-)


base-commit: 5fcbbc1fcc4fa78bb5a184caa2c32db423676577
-- 
2.54.0

