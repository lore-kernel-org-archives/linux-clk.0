Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB1F1459F3
	for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 15:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715872133; cv=none; b=rvTSFfVk7KclZbQlJ1Np4fDaFQdwkeLJRCXcWaKclhLVrVCo4a3jI4uBBYT/wjYxjlaD/FFg6Y1z+detVHr8RNKI2XGZDN1T7BfHF8as02t2QGdwaICjmVaR+7mZH46AsYcfL51a+jiTVX8izkmMG+tnDisU9HY7C0jaWxaJens=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715872133; c=relaxed/simple;
	bh=we6lbVPR1oC6Gjni/0inzK6tb5qWDsUccHkewq+P1B4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rA+L/gT7tR5LqeB4go2vrd3ipoG2W/nqrIrKXODxyaLV76Eu2O5pwmFYN18JABvInfO8bu6Emnd/Rsfc0d0EjQDXTg36xyC56Df8DgtLYthFOSy9UumGwv4HnvpP6lhgv/Ww0PnZle3cYmWa4qZ6UcJHpFX55vl1xof9FO/1+6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tLq3oeZx; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tLq3oeZx"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2e43c481b53so10197701fa.2
        for <linux-clk@vger.kernel.org>; Thu, 16 May 2024 08:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715872128; x=1716476928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioxEy7SZPKbhBowmAqXOs3HJ/6GyUDvxxnPo9F3uNU=;
        b=tLq3oeZxCaCNzKGURu5K7x5Ai0VxzLyGpn5p2sR0zr8s7gc+2/sM0b5ogjvVDY3vNT
         xp2y9NhdZRzGWHLuOpiVXM+7EypwGqEHMVjWlh3YzXjGap6Hq86fXuLPOEK/3eKYit+c
         q+6y4N7gt05tnR8ZitYVsRIb5kgRV3PMtnC2/rhkOroR+AVjt3H9TGjawqCGtHSIuImH
         lLvJZmU6ExW4vqpUD3ppeQmdj1kvnGkGQG+7sN7kJKS997QKTFBSRsxqWPtI9VCVxDrA
         rL+qpEXx023uS8v6kT7kwc+kjOrGKgqZwktPQdnva2CG1v4HmTUvRP2GUGZDKqxsSSto
         ZLsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715872128; x=1716476928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ioxEy7SZPKbhBowmAqXOs3HJ/6GyUDvxxnPo9F3uNU=;
        b=ZIoOufggpjPFGdzXvsAl3FqPMSekY2Tyowx9Wz/+zHfbObb6plDv7JC95UiVCh66NC
         ZC4ArJV6VFzbr7NpLyBdfQY574zKt7y1DFkoOyuOnPHgoRi70RA+W5Lh+9lU29BHOMlu
         pBswS5Za8JLgOD6oBmLJi5cOTWoxxhIZVgFeKdRH4XR5DRGhbNatUY3yQHKXh8ia5HXh
         00FFrSo6aR1TgLilxjTVVwdMNrQM8U4Fg54Nj3hVK3XKI22/Fw+r622Vz0Ou96flJw+Q
         JCmqjhGRDuN4up02Htsy3RNkls8HiYFrlOIBCAgF9AwcMPsRqKxhCpSdl9IipBGfsr+A
         AcpA==
X-Forwarded-Encrypted: i=1; AJvYcCXqWclIw5dFh93db7BkQigk2Ywok665MgLA0j9/fREaWKrpWKBqRmsV4DEXenAzy6NvkFpMCoVLHVK/IKBLhH9GP/3IV4ARz2wW
X-Gm-Message-State: AOJu0YwrzmLAbQb1lPsKWZMifryTPmBD/0TdtAYyA6tOC+fcduAPUY8n
	qK9BiZ618GJ96FTeOMFZ+lWFBdp95fssHExyhXbter/FW86esKXzp/tdloallRM=
X-Google-Smtp-Source: AGHT+IGKctbnPBmcJ2QPLjHUp6edy8mIEVUT9pkFFtdxGM+N329/NRHhlQe7LdHxvECgOEtFtlKB4A==
X-Received: by 2002:a2e:4a11:0:b0:2e5:8720:50d2 with SMTP id 38308e7fff4ca-2e5891d3b9dmr83515781fa.0.1715872127572;
        Thu, 16 May 2024 08:08:47 -0700 (PDT)
Received: from toaster.lan ([2a01:e0a:3c5:5fb1:1fce:7e5a:e201:edd5])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-41f87c25459sm309351725e9.18.2024.05.16.08.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 08:08:47 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Jan Dakinevich <jan.dakinevich@salutedevices.com>,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [RFC PATCH 0/9] reset: amlogic: move reset drivers out of CCF
Date: Thu, 16 May 2024 17:08:30 +0200
Message-ID: <20240516150842.705844-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Patchwork-Bot: notify
Content-Transfer-Encoding: 8bit

This RFC follows the discussion about having reset driver in the clock tree
[1]. Ideally those should reside in the reset part of tree.

Also the code of the amlogic reset driver is very similar between the 2 trees
and could use the same driver code.

This RFC moves the reset driver of audio clock controller of the g12 and
sm1 SoC family to the reset tree, using the auxiliary bus.

The infrastructure put in place is meant to be generic enough so we may
eventually also move the reset drivers in the meson8b and aoclk clock
controllers.

[1] https://lore.kernel.org/linux-clk/e3a85852b911fdf16dd9ae158f42b3ef.sboyd@kernel.org

Jerome Brunet (9):
  reset: amlogic: convert driver to regmap
  reset: amlogic: add driver parameters
  reset: amlogic: split the device and platform probe
  reset: amlogic: use reset number instead of register count
  reset: amlogic: add reset status support
  reset: amlogic: add toggle reset support
  reset: amlogic: add auxiliary reset driver support
  clk: meson: add auxiliary reset helper driver
  clk: amlogic: axg-audio: use the auxiliary reset driver

 drivers/clk/meson/Kconfig                     |   6 +
 drivers/clk/meson/Makefile                    |   1 +
 drivers/clk/meson/axg-audio.c                 | 108 +--------
 drivers/clk/meson/meson-clk-rst-aux.c         |  84 +++++++
 drivers/clk/meson/meson-clk-rst-aux.h         |  14 ++
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/reset-meson.c                   | 210 ++++++++++++++----
 include/soc/amlogic/meson8b-auxiliary-reset.h |  17 ++
 8 files changed, 293 insertions(+), 148 deletions(-)
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
 create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
 create mode 100644 include/soc/amlogic/meson8b-auxiliary-reset.h

-- 
2.43.0

