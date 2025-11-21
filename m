Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C44A3019AA
	for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 20:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763755480; cv=none; b=KKPRwBGTvi/b7jk4QFCfPUs/+D3U0tSRjovwlkqbSRZsfv7MUe18R+HETBLbUi03se8QNk0q6sI1j7lX6Mx30rQEeXbmjsR4nb7aM5QvgRKQ5y8zFjafY21m21K68MQbQR2fxYBrAulgXE3pEgWWInNPDARRPrLh3FLr/L+Ncf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763755480; c=relaxed/simple;
	bh=o2EfFCrX8W5dA6G3cDIzwd8t7+x6NZN1RVg611RPcTU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fdwUghNJ9gSL51Fuj6EDJwYGhbnZiaSdpBJYN6858N0YL+w7NYGlopLtjl5n0khWjNYusC4XWrIlAzASg/TtF9w3Ag4CYti+atKDR1NRyFMstOzSNtcvI71Q/jUryfoDTZbA/Ca97wMUZ4wOlJiYdiuMukrZEPYWbHN35yzOyGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U1VVeQJp; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U1VVeQJp"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477563e28a3so17019625e9.1
        for <linux-clk@vger.kernel.org>; Fri, 21 Nov 2025 12:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763755476; x=1764360276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6FGHceVsISY0k8J53LDocWP6PbaDYKUZ6Rfr10O198=;
        b=U1VVeQJpltHRZnoIAqdAf4AnbBilOWEgQXc6UVS4+5pko4sYwvY8AmB6hNNLAw7T4L
         0IPeCX7W8TRw8sJhPRtPrFmDwq69Petiuho81EnZTicPAZwrsJNhi1PHn82ZaO8naaOX
         ibpw+DnJkhnv5ZLE4Y1Qi46rboBs16xrTldX6TdqBo9SKZoVxhrLoy2Q5uGepFSnokK1
         Vdn5x21/avTRlIWsMuT1/QQtNqSCieMpKWAaXqlJeKNOijU9GMYaNDxvAOyQfl0G8U5F
         ht9u8GcGpvIMIeBm/w0nKBV2whmXF1ipgNypRcxkgfTocPGw2NomHNt70LWwGzc4wYi5
         tbKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763755476; x=1764360276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q6FGHceVsISY0k8J53LDocWP6PbaDYKUZ6Rfr10O198=;
        b=AlfaUq+vFRdQl1/ZWVUIbcv1iSZsLPq/x6TGOdWu3iezEvFCC7G9YdAIVl/5wzuUE8
         j3REfJ7aRwVX5pU6G4ORLdju5LrQMvTzLtviqk0uZ79iDSTn1LBcU+rWtGeRQf7PSQLq
         HZY77XFHKylSnoXXspeYdmqluk7p27BWowc23fjYKrgMqAsSMXaRtIpWuFuJytTuBqfj
         UUPqHNHSj8CPlau0HI7mTHOfPIH3wlrRA8yai47q7TppVc5Mg+WRmGzFsTED10dqvDfd
         gkydZdVEJBHOu3q0GVL8JdfCNaOpCO1q+v4xXgxWqV4cFDEaTzG6R+ii6M1zcbahVpYo
         v1hg==
X-Forwarded-Encrypted: i=1; AJvYcCXDtV7HSAXMV5v5qlzz3QXaGK5FDnWdXAgoblNOGLb2JDYeeCu61lDwyT5mmd7uATf88QqaevqHWyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxye08TdWct9qfZpS1DoB5E7RR770oOwwzMPN18NggmUBQ97buf
	DgOVW9txosgdD68MdgDg7I2W3OnYIXRVy7NexE55+eek2KqfmhT3PV1Y24dRQZ8dqxc=
X-Gm-Gg: ASbGncvFNsQC02AqQBJ/EJ9BtNuQFdlUt5Qp198KCoDfZJxNyzUlTb9CSbkX+XpW9aF
	yFmtGZRFFvatCjsosZBwRdr0nD2dzryiM5Hv7mkvQmBIaXjZDXGHhzA4TXieAsTuU0W4ytA+Vlw
	cv1DVsqHJfVrlD2Jfosr0YJ8X/XQVh2U6lnXFU1CitW51uto7Bdyt7+j/y4gYs5N6qcOiCN1jL3
	qqTXx4JcVLFw6zbW2pQbZ7P27ymmxP2FjqqkGn9rYOtaI2YY59GZdredB40o+nD7ZU1bIeX5iq1
	EMnBV8Kp+YXsc3cGs04Ha28BUswlUBEd/s/TwG1ZA42pjmgdKC+rQJ7qQmPGAuctWE1VDuSNwb9
	cwXpQOo7pnMtBouUcTxiwWFQotrNRMQ+9y0HcjiT/ucZO/9mIXOgRgiGr5VwtqQPEAwcRb2JXQu
	xHTRPRdE7BFdxxwn8F0nd+7sPIYPPf9A==
X-Google-Smtp-Source: AGHT+IF3FXFOW2Bih09/Ls41ofMWnW8L7NRsRGlVhJXbe54VtWhmHWhxZMIEDKzidHNiiFk3x5ma7g==
X-Received: by 2002:a05:600c:642:b0:477:9a61:fd06 with SMTP id 5b1f17b1804b1-477b9ead384mr45984625e9.8.1763755475783;
        Fri, 21 Nov 2025 12:04:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf3b4fafsm60894315e9.14.2025.11.21.12.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:04:35 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: sboyd@kernel.org,
	mturquette@baylibre.com,
	linux-clk@vger.kernel.org
Cc: claudiu.beznea@tuxon.dev,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	conor.dooley@microchip.com
Subject: [GIT PULL v2] Microchip clock updates for v6.19
Date: Fri, 21 Nov 2025 22:04:33 +0200
Message-ID: <20251121200433.2005639-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/clk-microchip-6.19

for you to fetch changes up to 781f60e45bdfe351aad692ac0fa89e36f8bf4a36:

  reset: mpfs: add non-auxiliary bus probing (2025-11-11 16:47:24 +0000)

----------------------------------------------------------------
Microchip clock updates for v6.19

This update includes:
- PolarFire SoC clock driver updates to use regmaps instead of iomem
  addresses; with it, the reset control driver support for non-auxiliary
  bus probing was included as it now depends on the regmap registered
  by the clock controller driver
- a cleanup patch for the LAN966X driver

Changes in v2:
- updated the tag description

----------------------------------------------------------------
Conor Dooley (3):
      dt-bindings: clk: microchip: mpfs: remove first reg region
      clk: microchip: mpfs: use regmap for clocks
      reset: mpfs: add non-auxiliary bus probing

Robert Marko (1):
      clk: lan966x: remove unused dt-bindings include

 .../bindings/clock/microchip,mpfs-clkcfg.yaml      |  36 ++--
 drivers/clk/clk-lan966x.c                          |   2 -
 drivers/clk/microchip/Kconfig                      |   2 +
 drivers/clk/microchip/clk-mpfs.c                   | 227 +++++++++++++++++----
 drivers/reset/Kconfig                              |   1 +
 drivers/reset/reset-mpfs.c                         |  91 +++++----
 include/soc/microchip/mpfs.h                       |   3 +-
 7 files changed, 266 insertions(+), 96 deletions(-)
