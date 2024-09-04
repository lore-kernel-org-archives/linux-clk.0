Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8852B1CEE88
	for <linux-clk@vger.kernel.org>; Wed,  4 Sep 2024 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443845; cv=none; b=u8RO6tzlK1YDDcNe2eqKF/wZp9GBPOKRwI49EAGw67bIKhpMYhEh56q3kovCwDnUDdTWBlmpntoPLIVAc9AXulES6UPMzVusWQt5EnjvXP/4NH+qwwIt61y69AgFkddZsUy1wCIUm/Q1AKbQRiEvefl2tjoVnbY28JdnaXsTXcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443845; c=relaxed/simple;
	bh=FTjiDZN9yInQz1hWZ/h7wkmO4TF9Z15WUfoej4IaTi8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ua046fhMe40lNbwkBVH0/PGIIS9f7iywZtTnOgEqHjRLVAff1smZjq5lMPi+iwxY+jVCbAzNQd6JBpbUop8ZM4/NBWqt88o8CFrAMAVFGq0N5kNUMz5FkNAHU1EczxrqoZcK/YV52damZ99WA8BIdxKrwNUtqffN12dCbrZzZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rD4X1bCw; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rD4X1bCw"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a8692bbec79so730410166b.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Sep 2024 02:57:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443842; x=1726048642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VG3SCtSxXoO9kJ5qHjWCI3Ghtvll31qds48f+pV4lgI=;
        b=rD4X1bCwGOBvitJHen45c4x8u46QDcFb1O+/cG8Yp7e6P3PkWs0zrLPKe8uzKZ1XBK
         DusovKHjjLPg/ZUYDiT69KunU3kICUh/VEf4iBVaoHJGXpXDjouOxB9383Dt1p3MFQIH
         f3giDMJko1rwrlOs2lt/gGTnGO2Jjv7w/Q/K0Uteb5OK8wqry1em3hleSKUUkzc1pBA9
         SqnmCEMA3aRqDfmv7HmmtklU9ad0whi9XZX6EGX1e+RsJ9p927mX5335xbIMMNZXSyEX
         Er56b33fUdVYF57JYcLmp9AkcQEOgyp+N3nQmg5JuMQl4qkVtGkNR0EG6ROFn+d88nAB
         FYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443842; x=1726048642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VG3SCtSxXoO9kJ5qHjWCI3Ghtvll31qds48f+pV4lgI=;
        b=gq+TLAPGH9K4VdUsGC5zjD0sUBHDUUTiu7NmgrkPbInh4P8bgh3B9LiFxpQHD9IVSl
         ulvLdXZYvcdz0Aq4+6shnl92P4heNZjZQZniN271jispshSA4uP2/EHSpez6p72ERHhS
         xNiXGgL32tQR5sDSFfj6knBSROFYyPur+mkbtvz3eAfJlYPbuW4bnrUm1Yv8M4leW2MT
         id/1j0bgm8qfgPT3ZQo9eBp6nRCVgFeWJB/i8ko87lZ/wrTHRcYzeDOTsw4JRJUwo1tq
         tuhRKZ+2d5SKPQBCteRFZ+Hi0bXHrpPYcqot+ZWYXALmFqvG+4art7TcVJZFu3I8Y6B6
         +sCw==
X-Forwarded-Encrypted: i=1; AJvYcCXD15qctyx/mJxTOaVdTG5mJC4E9AltYXH3qD8AL37P1YTxXoKxwqCoEXlEE4G4OWSTk3cy9Zv8bak=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoGaZrbutdSjvhk3w5Q6TpXGpSv3EBs/r5WizLys6Bc6vYlklf
	Ks/1eJPmLzRiK7wSjo9uTY7mbqIknQSm3OH4/7NL20w0/NbI2r82/Fiv85Xh+zo=
X-Google-Smtp-Source: AGHT+IE+2W/EhIoP1awAXccexwE4Hd7T9R6Il9R6pyNmD5WD6nEZ6n3i30rCZtmi+ObSIObIoDmtIQ==
X-Received: by 2002:a17:907:72c7:b0:a86:a30f:4aef with SMTP id a640c23a62f3a-a89a35dee4cmr1210183566b.22.1725443841806;
        Wed, 04 Sep 2024 02:57:21 -0700 (PDT)
Received: from hackbox.lan ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefb26sm788422666b.1.2024.09.04.02.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:57:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.12
Date: Wed,  4 Sep 2024 12:57:10 +0300
Message-Id: <20240904095710.2813541-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.12

for you to fetch changes up to 32c055ef563c3a4a73a477839f591b1b170bde8e:

  clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL (2024-09-04 12:39:38 +0300)

----------------------------------------------------------------
i.MX clocks changes for 6.12

- Use clk_hw pointer instead of fw_name for acm_aud_clk[0-1]_sel clocks
  on i.MX8Q as parents in ACM provider
- Add i.MX95 NETCMIX support to the block control provider
- Fix parents for ENETx_REF_SEL clocks on i.MX6UL

----------------------------------------------------------------
Michel Alex (1):
      clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL

Shengjiu Wang (1):
      clk: imx: imx8: Use clk_hw pointer for self registered clock in clk_parent_data

Wei Fang (3):
      dt-bindings: clock: add i.MX95 NETCMIX block control
      dt-bindings: clock: add RMII clock selection
      clk: imx95: enable the clock of NETCMIX block control

 .../bindings/clock/nxp,imx95-blk-ctl.yaml          |  1 +
 drivers/clk/imx/clk-imx6ul.c                       |  4 +--
 drivers/clk/imx/clk-imx8-acm.c                     | 38 +++++++++++++++++-----
 drivers/clk/imx/clk-imx95-blk-ctl.c                | 30 +++++++++++++++++
 include/dt-bindings/clock/nxp,imx95-clock.h        |  3 ++
 5 files changed, 65 insertions(+), 11 deletions(-)
