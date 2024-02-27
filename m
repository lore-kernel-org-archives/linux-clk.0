Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8502A8C1
	for <linux-clk@vger.kernel.org>; Tue, 27 Feb 2024 11:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709031933; cv=none; b=gHQMDkiwza7RMWHRKP39rTVXTWEgr22NWu4dhxKyMv7Zbqt1syUNLguRzlqZ+tHgnVGnRXFx3EmV6mQdhw0781DJw9U9YVoxoag2m4gAsxATAonuMIeeCRJkNiI2/9mRQTDyBoMBKAVXUqwsoQQkacG9LwvL2f8JWXilt1Nm8uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709031933; c=relaxed/simple;
	bh=0RYBig305OHqvLLkrKNyAb2MuH/1VgLPeQ2Uv68/Eoc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r5amTVbNbzmiPXA4ZIAHkngXR3yK+vppRoaaUkcb3g2ez9RlhF9ytHzMLMODZ39pb0tRYFEfoyhZLH/oNqcbbO9sbkZQr2EoFL7dum9YUfmLAfAKWwh/z5hO17qq7eynXlXI+59j1WzZ2LZJAlpDvxiAdXM5BC+pAQfEI+cvTJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LEmUNOZh; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LEmUNOZh"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a4395b7bfe5so134123266b.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Feb 2024 03:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709031929; x=1709636729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JK61QB9o1xWii2ErgvXw3zRrKGKsozSxgEdvjx0laIw=;
        b=LEmUNOZh/3Quf9TE4JWyY8JAacOyGLiWaylwSZb1czQ9C7W8oPcSeDzg2ZEbU4p+mf
         +0hz8PE7RRJlb7Yc0VWAICo8nF/ukH2fs7E+NqVWhV85k8wocienIgGkFyvZQXSgzR4q
         thc/JXJmzRLwSCA+2IB5PaVxsYw6z1oTW4yptORC7aw+I5faLI72+wSq4tU+6gNNHnrk
         oWXcQQorTXMbuzkOmvPV5hD+RfHRKTPwGcUcJL0Y6lLAfGL0xbU3rj2dpRgQZ1c0z4ER
         bWueGeHjuTxMt2x1bY0bMJgNLR7rAMOKrqDpEy7rvTC7pROUhTE2CXaCThJtlK8mT8K3
         il7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709031929; x=1709636729;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK61QB9o1xWii2ErgvXw3zRrKGKsozSxgEdvjx0laIw=;
        b=Lxozq1pUxEqZdAjbKdJzY0zWThisoszIvZ+dDMD1APmW4heJdFWOSRnidbtv8AndgS
         lTHuzXDT+TK5e71xzAMg8uO3LldsR02kOYmEysF0DXb8Jfeud1Xfs9uVxoEIywIznt3e
         BvKO+vHzIzy8IcHAokCOan0VoXhXCFiBWyoz3VRHsJwLkmZQ0eHGXJ6VZHb6C2dA9QM3
         S85ZKAXhLRF0QtRRpq+EcjD2Yt4ujAjaLq5COy1x0FyW3PdUaoJuUq55+GbdqY4g5Mpt
         NLR51Krc9CfQBvB5/NdxCSaiiuD/ejImNalONiVSJw2Vi+WBscIe2k+IVhLH9Xolk8SD
         VR8A==
X-Forwarded-Encrypted: i=1; AJvYcCVxnGFjEbE4Sy+mN3z3DMuZc3/LgENIwmBQ6/+WQVWCDi518/n7Fsy2BmGSIZBJodEH/vtOhAHHa4UYGlwMjF57KcHjj767STYF
X-Gm-Message-State: AOJu0YxN20V0CeYvDIFtRFhM1vhqoIKIifKcWc8d3heSGUj27kjTSJXV
	MRBUfKIX7pskM/hKshng7UCM7s2PEYvBS4yQebk84gCtePhb9aj+BkzQc5Vu7E8=
X-Google-Smtp-Source: AGHT+IFkYbx8S7y1b8p7Kwr6a013ebLwdNvpHNqD9tmb0yy8Mo7cYn4LsFkmA1ywlo+7gQwmHMxqqw==
X-Received: by 2002:a17:906:1808:b0:a3f:56da:5a40 with SMTP id v8-20020a170906180800b00a3f56da5a40mr6701159eje.23.1709031929608;
        Tue, 27 Feb 2024 03:05:29 -0800 (PST)
Received: from hackbox.lan ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id rs15-20020a170907036f00b00a3ed811cff9sm643504ejb.154.2024.02.27.03.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 03:05:29 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: imx@lists.linux.dev,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] clk: imx: Updates for v6.9
Date: Tue, 27 Feb 2024 13:04:16 +0200
Message-Id: <20240227110416.259133-1-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/abelvesa/linux.git/ tags/clk-imx-6.9

for you to fetch changes up to 13269dc6c70444528f0093585e3559cd2f38850a:

  clk: imx: imx8mp: Fix SAI_MCLK_SEL definition (2024-02-26 11:05:58 +0200)

----------------------------------------------------------------
i.MX clocks changes for 6.9

- Minor clean-ups and error handling improvements in both composite-8m
  and SCU clock drivers
- Fix for SAI_MCLK_SEL definition for i.MX8MP

----------------------------------------------------------------
Markus Elfring (3):
      clk: imx: composite-8m: Less function calls in __imx8m_clk_hw_composite() after error detection
      clk: imx: composite-8m: Delete two unnecessary initialisations in __imx8m_clk_hw_composite()
      clk: imx: scu: Use common error handling code in imx_clk_scu_alloc_dev()

Shengjiu Wang (1):
      clk: imx: imx8mp: Fix SAI_MCLK_SEL definition

 drivers/clk/imx/clk-composite-8m.c    | 16 +++++++++-------
 drivers/clk/imx/clk-imx8mp-audiomix.c | 11 ++++++++---
 drivers/clk/imx/clk-scu.c             | 22 ++++++++++------------
 3 files changed, 27 insertions(+), 22 deletions(-)
