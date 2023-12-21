Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDE46519F
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 13:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sy3gvo9/"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d3ae326f6so8080895e9.3
        for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 05:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703165209; x=1703770009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SMPrASf3ODXGRhZpHsz7iXMp47vCIZq5ovBAGA4a71o=;
        b=Sy3gvo9/EHraSGUSEoHDLjQGleobDL/EEQrRYLNwytsCliPxT/AOws7pt0nItHBBE3
         dYKM0gGlg/bdIgj8nQzkPHndkgyRhsl13vTFA3idLFIsq/BiPvmrq3tVtnBFIahHxBWQ
         B7opeDt/gzfDb6t/pQc07Ex9pdCGYxvYta1XGf9mHdXrlmqz9j2C/U2XprjDP1utuFJ/
         +kPSantktg5HsO+YAVWYph9jMonlnCWVvB99heChfqc342XTXpOf8Mfxv69YB6z9HIx4
         7BWqTETMb75ZWEUpbXsNV8RwZwEAm1WhmSO2e34jKeU7nv4qFYmCYmVbZQ2XWTi6H9QS
         8Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703165209; x=1703770009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMPrASf3ODXGRhZpHsz7iXMp47vCIZq5ovBAGA4a71o=;
        b=s3k13vT0fk+3SP3AeQTb8HNYfAatIAl7MsqULHFZV0DxaPGAc8boyDaTIgC+BSqn9h
         qfIQ7T3SBjAcwcqAFNAyxKMvyPOR+jMDIRIXtpV9Ytzaj/fKs+feXcmefHUx7hnQn6Gp
         biQ7zXghyi+Bi0R6kY2jSNRynFJZCS7hqLjtOO6QJBEI+wAVdpNk5i4737D4SAIptBKM
         xbT/nJpnEw5D/U9pXT5VdSxqUetKALYM3e3ZL3qGc3Gw3/BY3e7GVHfjvMvVFp7mb2Nw
         Yx+nyKaxE3T3qCSGdBtWn/g5gU4l0ThtrcPzqpi9iTP82ex1sxgEi54+PEfME/cSPhfS
         NWbA==
X-Gm-Message-State: AOJu0YzftO5j9dQLxygV3fxb/3x05s6V6jx4tBkKxBKEuNchxEaSVxGL
	2/6R3yycQ/BWo5robl/DrTM7EQ==
X-Google-Smtp-Source: AGHT+IEeghN5G3QXjl0IENGXHhTPSRqw9N5h3DGK3ORdaEBST8xwxARBbpDbhVI/iDBFrRNCqI6lNg==
X-Received: by 2002:a05:600c:3d16:b0:40d:1748:d0b7 with SMTP id bh22-20020a05600c3d1600b0040d1748d0b7mr763385wmb.101.1703165209533;
        Thu, 21 Dec 2023 05:26:49 -0800 (PST)
Received: from hackbox.lan ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id u4-20020a05600c138400b0040c03c3289bsm3338756wmf.37.2023.12.21.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:26:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.8
Date: Thu, 21 Dec 2023 15:26:34 +0200
Message-Id: <20231221132634.3008144-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.8

for you to fetch changes up to f52f00069888e410cec718792b3e314624f209ea:

  clk: imx: pll14xx: change naming of fvco to fout (2023-12-21 15:00:00 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.8

- Document bindings for i.MX93 ANATOP clock driver
- Free clk_node in SCU driver for resource with different owner
- Update the LVDS clocks to be compatible with SCU firmware 1.15
- Fix the name of the fvco in pll14xx by renaming it to fout

----------------------------------------------------------------
Alexander Stein (1):
      clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks

Kuan-Wei Chiu (1):
      clk: imx: scu: Fix memory leak in __imx_clk_gpr_scu()

Peng Fan (1):
      dt-bindings: clock: support i.MX93 ANATOP clock module

Shengjiu Wang (1):
      clk: imx: pll14xx: change naming of fvco to fout

 .../bindings/clock/fsl,imx93-anatop.yaml           | 42 ++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c                      | 24 ++++++++++---
 drivers/clk/imx/clk-pll14xx.c                      | 23 ++++++------
 drivers/clk/imx/clk-scu.c                          |  4 ++-
 4 files changed, 77 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/fsl,imx93-anatop.yaml
