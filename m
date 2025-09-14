Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992831DFCB
	for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757852482; cv=none; b=AH/+ahMRWjnjwsWtM1kfSimAgagqpLlMoN6i1fOAJyYFpTahS4gHz2/IvUFLGtvX/V/D9TudcQntL1LzsVpGIOglbAzwaQhMO+atv1rHrLkTbWdLa4ifKd8Z4Mfu8jM793+6Utb1o9k02RjddQgotIVOgPrBETMcdl0MRUWn+FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757852482; c=relaxed/simple;
	bh=bDv9gzB2l+sWC8tMgu06CrB9Mc3zq0b/cIxffjhmvHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LTB2QsX8SSQGDAMyZg6cBPx9kJ02uPDlBSYxmQY5ndL4tcU+YFyOnSBNs6bhVHkhp8OahDRPH0gyfOve88swTBwxYmL+P1t3rtvZLDSXNDbZadfEro7sWB497gzqppbOquBQUbFlxk9B8nWI5ilLXO3UegcJ6uFffnzpBIHgc08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=akXhhK9u; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="akXhhK9u"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso27098735e9.2
        for <linux-clk@vger.kernel.org>; Sun, 14 Sep 2025 05:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757852479; x=1758457279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9hU2kDwn8IFHpbOTDX+dG8pysyvJ8KjOOASnN49MHHM=;
        b=akXhhK9uFBFghQrX/Jpwvf9a6/Zx4zFHCExG9TYCQ5dlGZEYbTsYjF5TxOV5iehvnq
         T1ahkXm8POKKZZLvNR/myfUQN2Pjp5JqtydUJrPhUowdxLPA27RTCJoNgu/Q/R/wsfNM
         ezMOpewOcDvj16mhFIJER4iBjcLDAnPGfxxPT9e7IUCon+SUbpX2y86MOYAtbcXrehj3
         jXbVKzfoDHSf+3Nj+GUdCVcTl2OUfCkJyTOKL+sZ01KFMdW5bMPLZJYEiQxSseeUQIfk
         BkOzsbCPOGlcUXJCJ4NX+ANMDcsF3BEY0TYKKhJI/d1KQy7Jh9a6V6vhs6XpYbm+SEWd
         G8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757852479; x=1758457279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9hU2kDwn8IFHpbOTDX+dG8pysyvJ8KjOOASnN49MHHM=;
        b=sDAob4LPAp2kW7/G9ZbVFxu0Z0sED9uj6MWadGpJ3jwBD57fXOY1jHyB3lIoLQPrRl
         X5zMhU6vCOIZoscrBvozukWx7OM6J+HYQMjYmZNJQTDxFSRY7cPsoFTEB0cSZIZmW9FC
         VTqJdfbz1ABIImPEN4ixFH8W3cL5S0GQ6jcY8F84e5z/JSTGtOXSt8+VJUUIMQvoMCjg
         llCZ0jv53Jvbb3BCXPkQEv/2I+fiXlVXXANgUwuOLa8s5JbkxI639s24t5XQCkrbVypp
         opKCPDONsyajbwyi/DeeMrobcslo4V94UD6nTtrxcwAj6oVDtYlIHJMpGPUkU80/XNK2
         whjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXpq1hetnR7F5RekZYiQLGdtZCsQhxH+8lw1xlbOmeh/oaMSR/gn5lmL5Xkm6ib0uNLgb0WhSVkhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YybTcMBkgdHfprD8RYds26E48ofFcp2/e7Ru0tVV/9NSzdGz0kh
	EK5WvVQh7YhWFxaKlkoDIX7eqB2lCjWIsVsH/4o+yGJ5tAjUDhbynKbx
X-Gm-Gg: ASbGncufMVu4dR7y/n9ffecU3JMg/PNOTEhQSCEKZ4wCShWR1Av6yPUItpeUu21/YVa
	tyDJnjgr3kIqmh6dEt+BAxoSSRZDExetzdKhijog0s/njzABeIwnyO5YehkQ6vYIf58zsInFFIp
	WRsMyoD3Rk2I+q3usbQBiIMWmWdYkviGDa8gZPFR/6/K+v4GmjTDb11r2vuuMPxoHRGHOp/Y0/d
	MEBkdI1HE8zTNoma3Yfehv0z9cZwx9L76MXwJpB1RxYX3J2jthaVIsncONlKamem2YA4qu5YMKE
	4fDhe2vV/5M3z+RiXCNHosSle4sQyt0vsEqP2D+50IrXS8P1fbia1spb/GNhseO2bFpH2EHR6Xt
	4MHEZHIlVlTerrd+oNaYF/vp/4tkRMNIeCOBEIyOCLKS5+Q0Lnwn/x3NSSyoKMDXZexi5gAOVFA
	qkKIEH2yvOkXzS4FrEpkE=
X-Google-Smtp-Source: AGHT+IHNLBsatSIb71J2GFQncSTA+a3kyt/UTKwYcV2O04qKu+uELYeEsk/eGdFPUJLCbm3RtTdvwQ==
X-Received: by 2002:a05:600c:5742:b0:45b:8f11:8e00 with SMTP id 5b1f17b1804b1-45f2120592amr59760815e9.37.1757852478915;
        Sun, 14 Sep 2025 05:21:18 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e017b4222sm136476615e9.20.2025.09.14.05.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 05:21:18 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] clk: samsung: introduce exynos8890 clock driver
Date: Sun, 14 Sep 2025 15:21:11 +0300
Message-ID: <20250914122116.2616801-1-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hey folks,

This patchset adds a pretty much full (except for ISP and camera blocks)
cmu driver for exynos8890. It's configured to run with gates in manual
mode, which is done differenetly from other exynos SoCs.

Best regards,
Ivaylo

Ivaylo Ivanov (5):
  dt-bindings: clock: add exynos8890 SoC
  clk: samsung: clk-pll: Add support for pll_141xx
  clk: samsung: clk-pll: Add support for pll_1419x
  clk: samsung: clk-pll: Add support for pll_1431x
  clk: samsung: introduce exynos8890 clock driver

 .../clock/samsung,exynos8890-cmu.yaml         |  477 +
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8890.c          | 8695 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   13 +-
 drivers/clk/samsung/clk-pll.h                 |   12 +
 .../clock/samsung,exynos8890-cmu.h            | 1279 +++
 6 files changed, 10475 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8890-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8890.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8890-cmu.h

-- 
2.43.0

