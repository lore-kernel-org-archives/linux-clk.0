Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83B52036E1
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730903345; cv=none; b=SqVqTo9O2CfYwzQEF6bwkhOYXok0R7MZaQ0kybPVfgqpOel5RLqRcfW+keQ6eYSCwgZ2sVVm9qOTXYwzCixwfVXIac8wM4mEvT7H8X2i7CW0N6qBHZPaA6ogWXS1AlW/Ib+MsVmE3FPbPSOTh1k7lLt5Xq/EzJBSJ73PfW4atV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730903345; c=relaxed/simple;
	bh=K94SiCVSkFaIN2s7YzYdWlAONyn4+MCAn3Pt17OpqgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CN0acyr0Eg4xa+0GxpU8TduMOTSo8TDAqy0UNTtEMRJuRmEyuztjeFEpjdaDumyQLwwaFOrC3PBGU83O2L7t12JcOrnNJsEsoBggeV2/kFUaVYHE7OBcgq4rcPV0l3ie6/KS0wZ/7miXjelz8vPkEkg4E6jT56Ah3FPf2/ODh7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PJ9wynX8; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PJ9wynX8"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4316cce103dso79190605e9.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 06:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1730903340; x=1731508140; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fR07OvAKZCcn4c5fWCDFwwdic4q9vTVULluh2TSx4BY=;
        b=PJ9wynX8ogDVrmdrXubrI5bHeNhuRAUksAflhqK4d79qFeQChgYuTDqeO/rgwz9tkg
         41waWuKLlESywqTKEcMaKCpNo35+fGgDUxBSbRc2JxcVHX9fqic0QQiRgSvlke4qosc+
         0OqVLezcHQQg66/s+EtMCvUEFZdcanQ9vJixcn8TOOlaUptXm7JIyRSzR7Y0Q+5k/71Z
         f5q6nMz0oHRFX58ibGqxljJK7J/JGIB9Zr2JGenrsjs5310Ybgkan6OdOK990ym6lTnP
         vtuZ5INw0iuxvCTspQIvSl3/nnp4B5mPW6+nEG99fJBOCRTOe46psIBhkguBvzYKoJAK
         /mWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730903340; x=1731508140;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fR07OvAKZCcn4c5fWCDFwwdic4q9vTVULluh2TSx4BY=;
        b=BMqhmD2ySMlFBk1TykYOp+YRm1tuYWbH9ajnnuKuQEXGnvhK1F8iVTyt/E9Bo0YPXK
         LNmLBTi+zCYV3Ba+8y5nZnWKgRJ5JNByrvxRw8I0WSUOQEGHmTctZVxlRJQ1ibQT6U3N
         Xso9RSw+n6Pj9ZNiR5gFqUKK88NXfyY8z+fx39s86d1PhH4zb2awnzhflU8XZSZqqmDk
         i0xptdc4LAk+CmYtppbpU75MGOVp39+huYeAgy2sVmaNH8cKUHJIN51zkoQFjxHGrSiF
         xPQ2H7p5goizjBSjDSc+bdyswJFIauWkYYLBdk3uchVFa5ZVpG4B1zdU7IPHkxS7kZeE
         2d6g==
X-Forwarded-Encrypted: i=1; AJvYcCUtplXc5xCRAfsje5surnYhZMtW7ItJYs3JCQg48KGBb/tn7jTHQwsLO0F8ZGByFftjQx7BAAc/qYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPsCQnkHkCXBkSB58c5p0/cfi14NtrOG2nfYRxnHZZQzHZ4SO4
	ZwVYvKFdYR+apEaPvMdHGuWY0DADn6v0PuiqlL27uYaou2zWRA+EbvSN42ITZk0=
X-Google-Smtp-Source: AGHT+IGstdQ9A4MrGynIfGTZqv+ah9OkeHbjRp/dz/mM+KY45mCPilbar4JgbcfnSu8Wz5uGPgy1Uw==
X-Received: by 2002:a05:600c:444d:b0:42f:75e0:780e with SMTP id 5b1f17b1804b1-4328324ad00mr207455705e9.10.1730903339920;
        Wed, 06 Nov 2024 06:28:59 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:aefe:7cf1:a25f:8f85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10b7a9esm19251468f8f.21.2024.11.06.06.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 06:28:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "linux-amlogic@lists.infradead.org"
 <linux-amlogic@lists.infradead.org>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [GIT PULL] clk: meson: amlogic clock updates for v6.13
Date: Wed, 06 Nov 2024 15:28:57 +0100
Message-ID: <1jy11w307q.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here is the Amlogic clock update for v6.13.

This is one is a bit out of the ordinary. You'll notice a fair amount
change in drivers/reset. We completed the rework to take the resets of
the axg controller out of drivers/clk/meson. This code will now be
maintained where it belongs. This will also allow to not duplicate reset
driver with the new audio clock controllers coming up.

The reset change present in this PR come from the following tag provided
by Philipp:

https://git.pengutronix.de/cgit/pza/linux/tag/?h=reset-amlogic-aux

One of the change present in this PR depends on these reset changes
which is why I pulled it.

The rest of the PR is business as usual.

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.13-1

for you to fetch changes up to 664988eb47dd2d6ae1d9e4188ec91832562f8f26:

  clk: amlogic: axg-audio: use the auxiliary reset driver (2024-10-14 10:11:05 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.13

* Fix hifi_pll rate calculation on s4 and c3
* Move audio reset implementation from the axg-audio clock controller
  driver to the reset directory, using the auxiliary device bus.
* Remove the unnecessary spinlock in the mpll driver
* Fix meson8 clock controller DT bindings

----------------------------------------------------------------
Chuan Liu (5):
      clk: meson: s4: pll: hifi_pll support fractional multiplier
      clk: meson: Support PLL with fixed fractional denominators
      clk: meson: c3: pll: fix frac maximum value for hifi_pll
      clk: meson: s4: pll: fix frac maximum value for hifi_pll
      clk: meson: mpll: Delete a useless spinlock from the MPLL

Jerome Brunet (14):
      clk: meson: meson8b: remove spinlock
      Merge tag 'v6.12-rc1' into clk-meson-next
      Merge branch 'v6.13/bindings' into clk-meson-next
      reset: amlogic: convert driver to regmap
      reset: amlogic: use generic data matching function
      reset: amlogic: make parameters unsigned
      reset: amlogic: add driver parameters
      reset: amlogic: use reset number instead of register count
      reset: amlogic: add reset status support
      reset: amlogic: move drivers to a dedicated directory
      reset: amlogic: split the device core and platform probe
      reset: amlogic: add auxiliary reset driver support
      Merge tag 'reset-amlogic-aux' into clk-meson-next
      clk: amlogic: axg-audio: use the auxiliary reset driver

Neil Armstrong (1):
      dt-bindings: clock: convert amlogic,meson8b-clkc.txt to dtschema

Philipp Zabel (1):
      reset: amlogic: Fix small whitespace issue

 .../bindings/clock/amlogic,meson8-clkc.yaml        |  45 ++++++
 .../bindings/clock/amlogic,meson8b-clkc.txt        |  51 -------
 drivers/clk/meson/Kconfig                          |   1 +
 drivers/clk/meson/axg-audio.c                      | 109 ++------------
 drivers/clk/meson/axg.c                            |   6 -
 drivers/clk/meson/c3-pll.c                         |   1 +
 drivers/clk/meson/clk-mpll.c                       |  11 --
 drivers/clk/meson/clk-mpll.h                       |   1 -
 drivers/clk/meson/clk-pll.c                        |   8 +-
 drivers/clk/meson/clk-pll.h                        |   1 +
 drivers/clk/meson/g12a.c                           |   6 -
 drivers/clk/meson/gxbb.c                           |   6 -
 drivers/clk/meson/meson8b.c                        |  10 --
 drivers/clk/meson/s4-pll.c                         |  13 +-
 drivers/reset/Kconfig                              |  15 +-
 drivers/reset/Makefile                             |   3 +-
 drivers/reset/amlogic/Kconfig                      |  27 ++++
 drivers/reset/amlogic/Makefile                     |   4 +
 .../reset/{ => amlogic}/reset-meson-audio-arb.c    |   0
 drivers/reset/amlogic/reset-meson-aux.c            | 136 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson-common.c         | 142 ++++++++++++++++++
 drivers/reset/amlogic/reset-meson.c                | 105 ++++++++++++++
 drivers/reset/amlogic/reset-meson.h                |  28 ++++
 drivers/reset/reset-meson.c                        | 159 ---------------------
 include/soc/amlogic/reset-meson-aux.h              |  23 +++
 25 files changed, 535 insertions(+), 376 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-clkc.yaml
 delete mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
 create mode 100644 drivers/reset/amlogic/Kconfig
 create mode 100644 drivers/reset/amlogic/Makefile
 rename drivers/reset/{ => amlogic}/reset-meson-audio-arb.c (100%)
 create mode 100644 drivers/reset/amlogic/reset-meson-aux.c
 create mode 100644 drivers/reset/amlogic/reset-meson-common.c
 create mode 100644 drivers/reset/amlogic/reset-meson.c
 create mode 100644 drivers/reset/amlogic/reset-meson.h
 delete mode 100644 drivers/reset/reset-meson.c
 create mode 100644 include/soc/amlogic/reset-meson-aux.h
