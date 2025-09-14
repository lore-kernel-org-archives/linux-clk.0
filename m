Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C93525A334
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757832013; cv=none; b=F5TiGnocbgk7RVButzr+d1FeWhNla+/kIJgi47PiQnnZss3IG3yNGMJtkmCOUrLGOXYUNn09pFUh6B+FGYuJE0O33IMD61vgx+4WCgRDwjDK1drOLnWrDQjLYH4upc6h9zr44pmVn9FDUBUBfzCVwG/m49CxvdvvqgCwet8qCeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757832013; c=relaxed/simple;
	bh=9OIG5orqFsNwab6LqC4uN8hef6QGTi9NSan+WeIbQu4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=XI1SQYQStu4eBaDV3WJ4xw9Mft+Mb5PLczpMgWuiKBfhLUtbudQzeOu45HPFUkJAtTllmcyDtF0OY0qRZ6OfHUbyvT3TDJoAZDp2PEbibDI0bV8se1LViowtqQ5lNohHjFWW4iy2ZzPA5XvQhG4plcEFpyP9rvS1xvnFBUhgfcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Og5oG9Yp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Og5oG9Yp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3e7428c4cbdso2128646f8f.0
        for <linux-clk@vger.kernel.org>; Sat, 13 Sep 2025 23:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757832010; x=1758436810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mGq6925/jIdr2ZHYK/3/QTpUPif8QL9XSz6t8qLpUGs=;
        b=Og5oG9YpbYzNpCuki7TA79vIrw7ug+aWCFkUlCPUUm7SEFocs+OkDnoRFr4ZU7ZpSI
         WB5WEkmtWslv0mgt3TuuaAepagLClWUAj1KEsYSMeuLtQX/WIUpEvkSwOkJJ78c1+xFH
         jipaeElv41VHggVe2WohmVTtF3uqa5aqSfLCadOmYd8/TJ6VbrtCGmPCyRC0azi1YQz7
         bwmOEozkX00Etv1xNv2wncyky4PJcVzwDgc7VJSpEpS7ZUH0tQLqf5KnJ+NP8MFmYnif
         npTxxp4Kus/oMfvDDB7j5s75eHB23jzlfIxOn7nxLiYWGuz8wR3EZX0f4LTTZoAIE6NX
         q/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757832010; x=1758436810;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mGq6925/jIdr2ZHYK/3/QTpUPif8QL9XSz6t8qLpUGs=;
        b=T2rOuwqXEJjzoUoP0KjQB9W4tSR4sTI1BIA/eRag7fUp6t2uZ+E0ALBekVlTFggahM
         vS4pP1ugUBfSmLwxnLDrzi0eLPDEJ/49yTNLPVtqLGYYTAIZCJbKWsFhtfp2yMUfxjLc
         MBmdAZEev+26rI1sajV+1t9JyZWk/3nqb7VA1GES7Areq7XXIHGabgjbQSJ4reOwuaod
         2rWhC11JJbG3Nga224CO7hrvwboAnNod7hc3VZ442T2nx1CJBMf3ewYety0kd0DxI45M
         YLi7OQygPoGGy+viCWRwd/GLj4FCdTQbe3rp1RpVOQGnsY/yrjsCwc+g1Pptg/S3m65r
         yfuA==
X-Gm-Message-State: AOJu0YzQMZ/byQn0BaUC3/EM5GOtyUCJC2EzDp0welu8GBDlN5KW7RTg
	Gw7ueCWTeZhnFEoD8bMCJBiL403rv/kXS5qXDNz8dMrfNHHVTA+JKvQ0lGjUNg==
X-Gm-Gg: ASbGncte1osnveegWDmjlef16MGL0q0bOSPWQevnosibIDHva6l2YTnAbFoNMszm1Eh
	tvbDORNtv6CdlcIJu59LfmfWod6g00LeSply1GE3estzJrK7yJzc4capHdbTbLkrAo4zC4Vphp4
	o3LaJLW8yu0mzExUwda13FVeFJmaRvaCuS80MveE7vRlJ2bXsL7ehf/5eeGMu7N7c5enrp26u73
	sqJIo6Z1ADGv3JrDuHRmphM5ZUQ6386MDAXjEB4MLhkehitbnOARk/7Rr/SANeIyYLudsKzGLWe
	pzayuLNcJ8Yu+dPYBRiT/tOC8EXfcCXhgWWQ49Q1p9HZdn0jwXWVxOeDjummZ6XQLbzctlTIeK9
	uSjcXTPzC0Wq8tDAuLo4pS1guOO2KHTvS1oDPo6dngPqAQfmkTuhSTVY4jGVOS/Q35EfS0HtPEK
	xp+ungmvCx9QHS2A==
X-Google-Smtp-Source: AGHT+IEkwFzC+MAQUOBOjx0qfNXQf1qYrih4ukqOKlPrqTVHxFCuNkIgRI4Eu4SBNCQ28PSsd3XSvQ==
X-Received: by 2002:a05:6000:2489:b0:3e0:34f4:31f9 with SMTP id ffacd0b85a97d-3e765792ff9mr6535584f8f.1.1757832009742;
        Sat, 13 Sep 2025 23:40:09 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e7607cd43csm12396259f8f.29.2025.09.13.23.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:40:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: [GIT PULL] clk: tegra: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:40:04 +0200
Message-ID: <20250914064006.90225-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Mike, Stephen,

The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72af8:

  dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-6.18-clk

for you to fetch changes up to 5aba939e80f439c1a67adb6d9cae23cc72db7ef9:

  clk: tegra: dfll: Add CVB tables for Tegra114 (2025-09-14 08:23:28 +0200)

This depends on the dt-bindings branch because of the DT header file
that the driver includes.

Thanks,
Thierry

----------------------------------------------------------------
clk: tegra: Changes for v6.18-rc1

Add DFLL support on Tegra114. This is quite similar to the existing
Tegra124 support and most of the code can be reused, except for the
CVB frequency tables.

----------------------------------------------------------------
Svyatoslav Ryhel (2):
      clk: tegra: Add DFLL DVCO reset control for Tegra114
      clk: tegra: dfll: Add CVB tables for Tegra114

Thierry Reding (1):
      Merge branch 'for-6.18/dt-bindings' into for-6.18/clk

 drivers/clk/tegra/Kconfig                  |   2 +-
 drivers/clk/tegra/clk-tegra114.c           |  30 +++++-
 drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 158 ++++++++++++++++++++++++-----
 drivers/clk/tegra/clk.h                    |   2 -
 4 files changed, 158 insertions(+), 34 deletions(-)
