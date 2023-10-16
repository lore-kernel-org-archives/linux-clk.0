Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9206CDB465
	for <linux-clk@archiver.kernel.org>; Mon, 16 Oct 2023 10:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjJPKEM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Oct 2023 06:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjJPKEM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Oct 2023 06:04:12 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BE9EAC
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 03:04:10 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4066692ad35so44360495e9.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Oct 2023 03:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697450649; x=1698055449; darn=vger.kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wb1oiiRjqSYXQAYJjh+FbOcPJMELpmSgM8Er487gtFY=;
        b=xEFed9aF6SnRqlWFZ090VOTK2xdzBnWetzI+hPNXdblTVlVy3jmiO0CgXy/h61bDvl
         jBY3C7bWJj4JKzD/p1IpHmJb3XDeJ8SfJUPhPZd4TipqcTPagHiuQuTyX09ctnJH9WQe
         87aHfwXkUo96HfvM+Fyz3lhY++lRB7dDo/SXvJp03/CE0GThBXCxYj+8zKEsWQvtlVF6
         s7XfObzXz3b3l7leh914AnH1QhG5fq5porHBE+QHwOiUJ41sX+r7IAW5txvKgRqwqxTH
         oC6K2PyJoiyPcLDU/hq5BCjyr1qetn8h4Z3xJ0Swsp56GzklqdcWdRpJzyNUza0swu+i
         ah7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697450649; x=1698055449;
        h=mime-version:message-id:date:subject:cc:to:from:user-agent
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wb1oiiRjqSYXQAYJjh+FbOcPJMELpmSgM8Er487gtFY=;
        b=e8yP09t7yv1UztbTb1yCrSqvBUfACX3hf8tbx+DyBOWaP/LGUBdE8IkOS61UFRxmiS
         gEweJRCMcUzgzwvCjXHtXFAAGHYA3eIHUS+J6R8O4iYzOCzIfu7L1GKZJEQoSWnK84jn
         dG7eBJDX/+mE1t0IVrM2E9ct+raD+/UopbflOtmaPVR/IgoTniZsGhs3f4Xr7QlWACRj
         J6fkS9oG0afuyMNixbWGoovv3H+VEsYdqF0osChGpVpLPn094e0DTtRYZHGFxNR/YUk9
         LahhxxrOAh1H5UaGT9zuDOtDExDGKLb/dLuDVYpZI54Y0u8mWmVRFWibZhxQRfNbAN8D
         JGwg==
X-Gm-Message-State: AOJu0Yy8IoS3KcsyM9bYRyoA2X7OJ/40QpqIzyDBUjSKwmlRgaMpqhYG
        G5YEzz9eJ1Kb1zjU0N9v6OwwgvfRPU18Qga2un8=
X-Google-Smtp-Source: AGHT+IEUR+149m3SpjfXg9XKzVTWPKRv+3L/7tEv7v0IDdtCVK6lLC95YPMVa8oezQFXyUelCuoz1Q==
X-Received: by 2002:a7b:c8c8:0:b0:401:906b:7e9d with SMTP id f8-20020a7bc8c8000000b00401906b7e9dmr28643611wml.18.1697450647959;
        Mon, 16 Oct 2023 03:04:07 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:d161:b45d:c978:eb94])
        by smtp.gmail.com with ESMTPSA id m21-20020a05600c4f5500b003fd2d3462fcsm1380039wmq.1.2023.10.16.03.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 03:04:07 -0700 (PDT)
User-agent: mu4e 1.8.13; emacs 29.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: [GIT PULL]: clk: meson: amlogic clock updates for v6.7
Date:   Mon, 16 Oct 2023 11:58:26 +0200
Message-ID: <1j1qdux4rt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Hi Stephen,

Here are the Amlogic clock updates for v6.7
It is adding 2 clock controller drivers for the new s4 family SoC.

Cheers

Jerome


The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://github.com/BayLibre/clk-meson.git tags/clk-meson-v6.7-1

for you to fetch changes up to 57b55c76aaf1ba50ecc6dcee5cd6843dc4d85239:

  clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller (2023-09-27 11:01:03 +0200)

----------------------------------------------------------------
Amlogic clock changes for v6.7

- Add s4 main clock controller support

----------------------------------------------------------------
Yu Tu (4):
      dt-bindings: clock: document Amlogic S4 SoC PLL clock controller
      dt-bindings: clock: document Amlogic S4 SoC peripherals clock controller
      clk: meson: S4: add support for Amlogic S4 SoC PLL clock driver
      clk: meson: S4: add support for Amlogic S4 SoC peripheral clock controller

 .../clock/amlogic,s4-peripherals-clkc.yaml         |   96 +
 .../bindings/clock/amlogic,s4-pll-clkc.yaml        |   49 +
 drivers/clk/meson/Kconfig                          |   23 +
 drivers/clk/meson/Makefile                         |    2 +
 drivers/clk/meson/s4-peripherals.c                 | 3813 ++++++++++++++++++++
 drivers/clk/meson/s4-peripherals.h                 |   56 +
 drivers/clk/meson/s4-pll.c                         |  867 +++++
 drivers/clk/meson/s4-pll.h                         |   38 +
 .../clock/amlogic,s4-peripherals-clkc.h            |  236 ++
 include/dt-bindings/clock/amlogic,s4-pll-clkc.h    |   43 +
 10 files changed, 5223 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-peripherals-clkc.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,s4-pll-clkc.yaml
 create mode 100644 drivers/clk/meson/s4-peripherals.c
 create mode 100644 drivers/clk/meson/s4-peripherals.h
 create mode 100644 drivers/clk/meson/s4-pll.c
 create mode 100644 drivers/clk/meson/s4-pll.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-peripherals-clkc.h
 create mode 100644 include/dt-bindings/clock/amlogic,s4-pll-clkc.h
