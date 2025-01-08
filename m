Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7BA1F7589
	for <linux-clk@vger.kernel.org>; Wed,  8 Jan 2025 12:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736339826; cv=none; b=WusDgVHy/IpROBDNs33qf2yu9W2Lu5WsdvJ8tcdOB6MllrxXwyiv+RQmW6ZK7u42fHL9PZ1zATnF5SDUrhoU3MrF3Xxk46DFvDxhKboJFLQ/AG4PVP3SK2frNa6IB50s2GRL5Lx1R8JHL2Z+j6z4AX76CeZVOuIPyOC4B2pQgoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736339826; c=relaxed/simple;
	bh=CDf9a2m0imE6fmCPPuDkE3P+yBsJZwYlK7mp2qPDVJA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mjrQNxOfx19gOPa7HG7dMs9K2yMPTAF3kjmoZTrAWKSTpYM+84RkRaFCtAbuil4unjHEgwB4QGRUP8e+sWkbVXtJ2cytcKaUcHJFLFZXWP4VuFN7fxhMlMJCk51fnzxaTHKjFvW1G8Q1xrPEl3hnwd3pimsPjYDYtDAvFg8TLog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=us5p518G; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="us5p518G"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43635796b48so5201455e9.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Jan 2025 04:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736339823; x=1736944623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0I9+VC2uPEBNPBTJjj9DiA9XkKjLM+nkrhkEM/H4bW8=;
        b=us5p518GT0901cXf0To1GSDjTQdlMm6ZqYyrcsWpHhYTPZ3mPrEewW9IWYmCoPA8gP
         CvHeAR1boKymmAHyJWlE4Z4BpTQm9QGeWVcdCqX+sn7jJ6hBWIX0bLu3c1VyX+H2zJu/
         bc6Ji5F4x0lmgyEQDBKuWyot1lxSIfIuLXjiOx8yM9wU4zMplojiCZhGNtDeJEsb81jE
         fRfm+0kDIcJrhvO8QyYH1MfECE1zryRZSmK0qm4k/F0agMCIFMlwPDLV29r0cW6SXztB
         71vvr9Nw+OJ8YnJvQ6jzUKtLA4L7ebF+W7NDf1kKv+38t7Cje+y45UxLu/CjwJANkXP2
         SG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736339823; x=1736944623;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0I9+VC2uPEBNPBTJjj9DiA9XkKjLM+nkrhkEM/H4bW8=;
        b=v6XBeO4pzzVy1uwg6CoGLde38vTeR+LzdbANdrssB4a1xWHPYKxbiAu3aqvotwh+eU
         PZs1o7oA4pDiNxggPouTFWw9qHla7M4+aO2989f9MW1xFnBM5KVxCo85fBOtID2kgpgd
         y6Yzems14vn3TOIpBRTaFfi5Q9yq/ceDC8HRMlUZbpU0afoA602JrsaswnBo5JnRW3hr
         MXqlUoHciTQSj5eIfoXgcoDtA2xwvdyjZT06d0j33IZEzHMMH+gefRjKiSM51lOUvGxN
         cMlvzuDG85psYRA1LYIDOP6g35NlPTIzBdzZBnDwQpgGnQzPfkaNugXW3tSAnylwydlj
         qVqg==
X-Forwarded-Encrypted: i=1; AJvYcCWQpZHvXIMeN91cD9SPphEsZjByu4/E7CnxrPNiCOijth36svjt4OSV/zoMzZiluw60FFzHLG+d4so=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaoXJuEoCEAN17Qe1qf/IzVmkzR7ZMblQWQOZkLHml8ytGGLjn
	ch5vbnPpXO1J9cZx+cy14abTrQFHpiVr6+Nv3/q3grSKI06e6iqtHaqCk/ynjA2u/Ma56UcHv32
	Q
X-Gm-Gg: ASbGncsqRoPmaCaoClQ5f9hTeGJkP2pI/IaHeY41djLuW5n9bgGZ9tmUmCnM/DI9WbJ
	YpZ+GAb1ndAUx17NiKUJ1J5GRmhC8/vhuTiWDpDTIapf49Jnt5n2yvb2Ov4Im1GTKNauEYv5m7S
	Yc7EqoXjuXjI+UEaFuj/SLTuIIVPCxqWDBAy4wsguRgZm7iSDnPJivwtIdASTNP4/QRW/SHik9G
	o/ypd2dOJdZKb7+clc3dWxX3iTgZIAp1qALDRiDu0jCMn6NmCrEnotz
X-Google-Smtp-Source: AGHT+IG7/5cPf2PXps78wifVaZOeskzey0wLtVNJQ9pTQA6HY4831o/cwKfWew1xSu4tBYNeqfjruw==
X-Received: by 2002:a05:600c:a03:b0:434:f3d8:62db with SMTP id 5b1f17b1804b1-436e1dcad1amr22413055e9.2.1736339823091;
        Wed, 08 Jan 2025 04:37:03 -0800 (PST)
Received: from hackbox.lan ([86.121.162.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e96365sm19377775e9.43.2025.01.08.04.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 04:37:02 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.14
Date: Wed,  8 Jan 2025 14:24:31 +0200
Message-Id: <20250108122431.3063396-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
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

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.14

for you to fetch changes up to 48806be086360846bb308c5ee21fcab8405a3da7:

  clk: imx: Apply some clks only for i.MX93 (2024-12-26 16:46:03 +0200)

----------------------------------------------------------------
i.MX clock changes for 6.14

- Fix the i.MX8MP clkout1/2 support by using sys_plln_out instead of
  sys_plln as parents
- Add 208 MHz and 416 MHz entries to the PLL1416x
- Fix the i.MX93 provider by adding the SPDIF IPG clock
- Fix the i.MX93 xcvr DT node clocks by using SPDIF IRP clock instead of
  BUS_WAKEUP
- Filter out LVDS, MIPI DSI, PXP, FLEXIO and MU clocks to i.MX93 only

----------------------------------------------------------------
Marek Vasut (2):
      clk: imx8mp: Fix clkout1/2 support
      clk: imx: pll14xx: Add 208 MHz and 416 MHz entries for PLL1416x

Peng Fan (1):
      clk: imx: Apply some clks only for i.MX93

Shengjiu Wang (3):
      dt-bindings: clock: imx93: Add SPDIF IPG clk
      clk: imx93: Add IMX93_CLK_SPDIF_IPG clock
      arm64: dts: imx93: Use IMX93_CLK_SPDIF_IPG as SPDIF IPG clock

 arch/arm64/boot/dts/freescale/imx93.dtsi |  2 +-
 drivers/clk/imx/clk-imx8mp.c             |  5 +++--
 drivers/clk/imx/clk-imx93.c              | 32 +++++++++++++++++---------------
 drivers/clk/imx/clk-pll14xx.c            |  2 ++
 include/dt-bindings/clock/imx93-clock.h  |  1 +
 5 files changed, 24 insertions(+), 18 deletions(-)
