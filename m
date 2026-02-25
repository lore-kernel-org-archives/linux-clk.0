Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43C9126BF7
	for <linux-clk@vger.kernel.org>; Wed, 25 Feb 2026 01:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771981771; cv=none; b=RvEduHbq0qKgznbSH9facFXOh1R37zWeQInywXHx0XY4CRe00QLhX59Z4lj73MZBWLQgQ1xN2qf9fgUl+mE6TXh74KewZfJrFV/lfI+CnfpzdkUWSHETfAnYUsAFLSqWQIIQwLjjF+GFg3yxgQBK1e5RSHqbu2EE9X704s07odc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771981771; c=relaxed/simple;
	bh=RukPKz1Tt3CmlbqbIlMxFcr4FTZWd9Ir9RojSVsJO0U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=QcwJfs/IAENFOL3gpcN45Ow1hjrSBPHkjQZ2zyndWLw7ocNHaUJ0AFZWGFQ43XFHgSy91LgwDPxW4Po7FvkyNq67PV8XfEL+RaMWjaIpfrIF4cHvj/mn7DRDvqlKwdE2Y8r6ftEo9xXKwNwyFUuu4wHMZ7S2m8UXmHcGsvmecnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROFGp9JQ; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROFGp9JQ"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2ad21f437eeso2944835ad.0
        for <linux-clk@vger.kernel.org>; Tue, 24 Feb 2026 17:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771981770; x=1772586570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eM+hcX0WJiN8fwhNPYgVInvSLdtAH1Z3iHRCYxgcmmc=;
        b=ROFGp9JQcazEPd0GoqDULp/04mWYCvMXEdxRJ3dU8zUQ51Nnj9hLrHDjJn2mkqxWUR
         DyhFrvpVODNcXrSVD1kmM0kEvucb42u5niJI1bOU0KnvdXnzgj4qWhe9jPtuZremD6J0
         il5P1JVf0c8qd1+Fy5M/WWtLs82WRq8DZk7TsDDMjc3pPzfa678X+vKp4RBB9Sf/UMfD
         eHYUg/A2uIjQJWouduSlsSK+wB2xcbqcpwFM7xqQriuT/Xx/MO6kXFWrxndO8VqkoqON
         iLMeXCuSRVg1fMjJlgJp6i7iXcwYb9GGGvWeFiwRMKqqIkaj/LkT0Ir5/Rmy3xemwYhO
         YYYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771981770; x=1772586570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eM+hcX0WJiN8fwhNPYgVInvSLdtAH1Z3iHRCYxgcmmc=;
        b=Y4e3AEtlTrwkJfNq2jWai+Qmixcgi/CYOBUUB9Hm8HowRu8fnRbfrMWl2szCfZKC3Z
         FbCi9+6qA3qc9JdjgmXk0j/mXwKrc/JqsbJuze5TDwbHQatDsX6SrvR6v7YcU9f1QNUP
         UNuXBgJB4C2HJ9XR4X/QRlbIn/28SAKFgSoL+tlfVWml5T4mOw12h9pF/wvzZ3Afu56u
         ESWZqk995+sgTx8x/a7cuz5OVynMKKKwQgmJfIb1RoEqqEXVz1bsjNDIBo8d/ALaU8IV
         S7aasekvG5sGmvm8EcEC0EBjZiz0WRZA0mdxa9q6pUOIzIPjNtD0Ise59i3L/G7JFUJC
         Dcrw==
X-Forwarded-Encrypted: i=1; AJvYcCUGPA9jZ8Zfpwm0lyJ2T+ObdP3ifxDhgON5iRW+2dfnAIoPMqkGKPkhwuFm0i+IRaPjr60JyuxI6tA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIiq1hcjRJy5p08hU7DP+n6IKiNiHXJ0Tfsu8o3N+j0eXdBOxq
	HYU+aCG9ASA03t4uZvlcBGijU5mTuYKuhfFE2PjH2FGBDzKdeKcfugfK
X-Gm-Gg: ATEYQzxmJsLn0PeVyaHq2MmRVkqSmSTZBioN25gwGyrPFdJoAUVqeE2cjvOPTWFmCGg
	kOZBZ05PigdnhqMyLUvenFcWLuW1aR8BOyK8grRiG70Y+AQtd3+uG/sOngiEovL25zPG6byqa5Y
	QwtLePARDd9UJDrIcF8jv/dPPJj3dHAKk5i8PtU4knsIMk/rQHMrmrxaeAw6aox7oUTfIP38NUu
	2+xIh1f9/xwzDoIcYG7h3dVOvLP7tZRrB1toIvlSTZ/Ddeg0Dpkqubx4I/18x/8kIkrV/gbZm3A
	8/chIBt2GirLRvJNA4IP60ZzzIVGojbGxRT8mShvGpDJP0DO1BXbE8rDm8XEwq7erN6R06flnK4
	DWmhBaz/Q5LsF9hziqT7htJ/pTsVQBvescr9qHyakPwUzsGR8rnfkFql4LXZWfL23uL+6oPawCJ
	83dVrDj2Df/XSO812yZwro0MmKMGEOiQ2/CxAgMwZJd4Lw
X-Received: by 2002:a17:902:c946:b0:2aa:e817:1bda with SMTP id d9443c01a7336-2adbdc8e34amr15003465ad.12.1771981769944;
        Tue, 24 Feb 2026 17:09:29 -0800 (PST)
Received: from k.localdomain ([120.229.13.36])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5e0f2sm119350245ad.31.2026.02.24.17.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 17:09:29 -0800 (PST)
From: kanadenadi <kenadicanady@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kanadenadi <kenadicanady@gmail.com>
Subject: [PATCH v3 0/2] clk: sprd: Add support for Unisoc SC9832E clocks
Date: Wed, 25 Feb 2026 09:09:18 +0800
Message-Id: <20260225010920.757793-1-kenadicanady@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series adds clock driver support for the Unisoc SC9832E SoC.
It includes the device tree bindings and the driver implementation.

kanadenadi (2):
  dt-bindings: clock: sprd: Add Unisoc SC9832E clock controller
  clk: sprd: Add SC9832E clock driver

 .../bindings/clock/sprd,sc9832e-clk.yaml      |  120 ++
 drivers/clk/sprd/Kconfig                      |   11 +
 drivers/clk/sprd/Makefile                     |    1 +
 drivers/clk/sprd/sc9832e-clk.c                | 1075 +++++++++++++++++
 include/dt-bindings/clock/sprd,sc9832e-clk.h  |  177 +++
 5 files changed, 1384 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd,sc9832e-clk.yaml
 create mode 100644 drivers/clk/sprd/sc9832e-clk.c
 create mode 100644 include/dt-bindings/clock/sprd,sc9832e-clk.h

-- 
2.34.1

