Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEC2279DAD
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 16:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752598667; cv=none; b=e+J0TR4sDmyMERaewK1tOAQGz9Kwgq2pAJRfeViDaKsOUkLxR/evHpzPISfXhAbc0M6eOg8Zmv2vtXjIN6FWMcxpBD6KBYRwsLezTp9gr4B8cr6OcCvB58sm4qcu9qY2M2u9ms5GadFnnnjFeRF3Pvab85RkDv20v9F4rvG8pBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752598667; c=relaxed/simple;
	bh=yaOa616IRMmB1ZY4ENNb15BIh9SXR37a0/aWHNKLXQc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JmVMCdkgzYalkBu65+OhzzklULJ/UfBP9tIE2kvWW89aRZfBsu/0i7MEJHHBQuoj2V1kdO9AR7HFzGM2bBSN5UNk05NuyaybZra2H70kW/ch7npbmAgaq/enqstE3pfwAS7oMzkoK4Iq4uAS0ir+VCRcLNaxv9kULHRT5EFKyIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OP43ZbWG; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OP43ZbWG"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so50258f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 09:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1752598662; x=1753203462; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LV0FPBZomtvntf/vwUd57gNvAzJOPj4wrTCOSQLGhzc=;
        b=OP43ZbWG+4kFs2hm5qtbI0kV7gcFpnOXi4kmy+wosHCYkr+AGbfPNLAFmM7IhlPQZy
         6rDVTbbSKkL3myIFvj9mj4SIiYD4/iBci/fCWzQ62imW+IHYtdKDR7makGFUrDcYCjAV
         Jv2jokxcsipbWGaUrtLjii6nzxc+0a6JM+L7DEExMLP0Inkhkv38mkhfJpIWfcpsa4Xp
         mCBM4TdYuNjh9IJfMT1A9aK1Jajr1yOz8dNXWsK7pGoD17rS+jiM0rIu6FfaBT5CRSA2
         7PuEPiddokZ/2Th60bhgG9lg2KDtDBkiaWQy9ys8DU5q96B63kkRuWCJb3MU9Sf9MnCn
         e12A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752598662; x=1753203462;
        h=mime-version:message-id:date:user-agent:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LV0FPBZomtvntf/vwUd57gNvAzJOPj4wrTCOSQLGhzc=;
        b=gwsiG7Vsqs+pdtaI6UlzzuGca8VkLS1L4AAqozOg0SqaHac9T59YYJdJASu8Gop9xk
         IzfNQmcgUxA6EjUvyEMxTBk/l5NU9VMzQYIsKDfcmQvJsYn2OV9XeAhJ/CR5s6v9275F
         wcdd7ft2xIbRn0hjn9E5a0PZF1U5uXseZ5bXArBgf6uJvcP5OeDqti5UcIEVRzf5glcM
         re8iJtk7gxB1TyvJ93OPFoMwWGqf7sVApuaezTLWS55zXye70JwPHeO5GXtez89TBWlZ
         0nAQ/l22AZfURgmeNZVZ3zjGcZr04lVG8Aq6DBuxwtqSE5YFGQC1hBzoBfQqfztwHf4p
         ZkWA==
X-Forwarded-Encrypted: i=1; AJvYcCVnumy9aPyBQqMz5GzTKVRnJhqUaFlXthzpKqPoaEZTcwzGDybONc5owFxMGnfPbxmMfnwv3xsOLUY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrYBIYUH3xZtrve5QQfGnF5xMegshsW10NYvEm3iZEbX7kRGOz
	jn1sXbv/iPgdPmDy4PbZDAHx8wPC+bW38JOkt6ekH9bH6iERlvBSI9wAGHneWhOVzcA=
X-Gm-Gg: ASbGncublQgAygG9y/x/tmzo+IKqGplcMDv3RkHzl9JOd3y2iDL+PVH3PxWfcBOs6Vf
	uTMCPQ6NRfYcPLeGt0Dt1RdFC5xyz++yocQXe/lWANvmcpSiGp9+tT3Dze0hFF1GfcaOFLPozm7
	B78qFdSscecdVZr09oHgres+n47KifzTLzdzovXF/bwSVl28nEqu6cibyGup/Pz1o3oOdxl2FUs
	upzAKbcrGztJmyGceoFKji+fe58/OwT7oyMKNMfaw5Rs2F+7QaLQ0sf9/q5dAEszmV/1YJS8B4l
	/s2ifjlUoeavLzlPH74bzwgNY0oxufLp33MeiC0r6cedpVV3Lo0CveclrmRaiaBi4XB04cNrbi5
	WyhmQohgBAO75YFHJDcS2bQ==
X-Google-Smtp-Source: AGHT+IFkMjpRPbL3Z3s6MGUY7Lo/byMVJ21dog02Hs6C5qzMbnkvTqM9UF9SGdXHIwk61FaOOowxSg==
X-Received: by 2002:a05:6000:2307:b0:3a5:8934:4959 with SMTP id ffacd0b85a97d-3b609544322mr3520096f8f.27.1752598661792;
        Tue, 15 Jul 2025 09:57:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:a80a:840b:882e:14a3])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4560538da14sm109642575e9.23.2025.07.15.09.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 09:57:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-amlogic <linux-amlogic@lists.infradead.org>
Subject: [GIT PULL] clk: meson: amlogic updates for v6.17
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 15 Jul 2025 18:57:40 +0200
Message-ID: <1j7c09pf23.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Stephen,

Here are the Amlogic clock updates for v6.17. This one is a bit larger
than usual. It depends on the changes in your clk-hw-device branch and
is based on it.

There is the conclusion of a long standing topic around reset drivers in
clock, this time using the generic helper to create the auxiliary
device.

There is also the beginning of clean up of the amlogic controllers with
more coming in future releases.

Nothing is overly complicated in there but it makes quite a large diff
since it touches all existing controllers.

Please pull.
Cheers

Jerome

The following changes since commit ac32d031f508e46c19ab38d6ba8b53fc28df9945:

  clk: tests: add clk_hw_get_dev() and clk_hw_get_of_node() tests (2025-06-20 00:15:39 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.17-1

for you to fetch changes up to 8a65268500b00ecee5402ef9f80618ff73f30707:

  clk: amlogic: s4: remove unused data (2025-07-02 15:38:19 +0200)

----------------------------------------------------------------
Amlogic clock updates for v6.17

* Use the auxiliary reset controller implementation in the axg-audio,
  instead of implementing the reset controller in clock.
* Drop unnecessary clock controller headers
* Drop clock controller big regmap tables

----------------------------------------------------------------
Jerome Brunet (5):
      clk: amlogic: axg-audio: use the auxiliary reset driver
      clk: amlogic: remove unnecessary headers
      clk: amlogic: get regmap with clk_regmap_init
      clk: amlogic: drop clk_regmap tables
      clk: amlogic: s4: remove unused data

 drivers/clk/meson/Kconfig          |   4 +-
 drivers/clk/meson/a1-peripherals.c | 194 ++----------
 drivers/clk/meson/a1-peripherals.h |  46 ---
 drivers/clk/meson/a1-pll.c         |  28 +-
 drivers/clk/meson/a1-pll.h         |  28 --
 drivers/clk/meson/axg-aoclk.c      |  22 --
 drivers/clk/meson/axg-audio.c      | 603 +++++--------------------------------
 drivers/clk/meson/axg-audio.h      |  70 -----
 drivers/clk/meson/axg.c            | 218 ++++++--------
 drivers/clk/meson/axg.h            | 105 -------
 drivers/clk/meson/c3-peripherals.c | 210 +------------
 drivers/clk/meson/c3-pll.c         |  32 +-
 drivers/clk/meson/clk-cpu-dyndiv.c |   1 +
 drivers/clk/meson/clk-dualdiv.c    |   2 +
 drivers/clk/meson/clk-mpll.c       |   6 +
 drivers/clk/meson/clk-phase.c      |  11 +
 drivers/clk/meson/clk-pll.c        |   7 +
 drivers/clk/meson/clk-regmap.c     |  49 +++
 drivers/clk/meson/clk-regmap.h     |   4 +
 drivers/clk/meson/g12a-aoclk.c     |  34 ---
 drivers/clk/meson/g12a.c           | 372 +++++++----------------
 drivers/clk/meson/g12a.h           | 130 --------
 drivers/clk/meson/gxbb-aoclk.c     |  19 --
 drivers/clk/meson/gxbb.c           | 492 ++++++------------------------
 drivers/clk/meson/gxbb.h           | 115 -------
 drivers/clk/meson/meson-aoclk.c    |   5 +-
 drivers/clk/meson/meson-aoclk.h    |   2 -
 drivers/clk/meson/meson-eeclk.c    |   4 -
 drivers/clk/meson/meson-eeclk.h    |   2 -
 drivers/clk/meson/meson8-ddr.c     |   9 -
 drivers/clk/meson/meson8b.c        | 267 ++++------------
 drivers/clk/meson/meson8b.h        |  80 -----
 drivers/clk/meson/s4-peripherals.c | 388 +++---------------------
 drivers/clk/meson/s4-peripherals.h |  56 ----
 drivers/clk/meson/s4-pll.c         |  60 ++--
 drivers/clk/meson/s4-pll.h         |  38 ---
 drivers/clk/meson/sclk-div.c       |   5 +
 drivers/clk/meson/vclk.c           |   2 +
 drivers/clk/meson/vid-pll-div.c    |   1 +
 39 files changed, 639 insertions(+), 3082 deletions(-)
 delete mode 100644 drivers/clk/meson/a1-peripherals.h
 delete mode 100644 drivers/clk/meson/a1-pll.h
 delete mode 100644 drivers/clk/meson/axg-audio.h
 delete mode 100644 drivers/clk/meson/axg.h
 delete mode 100644 drivers/clk/meson/g12a.h
 delete mode 100644 drivers/clk/meson/gxbb.h
 delete mode 100644 drivers/clk/meson/meson8b.h
 delete mode 100644 drivers/clk/meson/s4-peripherals.h
 delete mode 100644 drivers/clk/meson/s4-pll.h

