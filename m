Return-Path: <SRS0=daJW=WW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6277AC3A59F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 11:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 340BA2184D
	for <linux-clk@archiver.kernel.org>; Mon, 26 Aug 2019 11:54:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nLBZKlrp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729813AbfHZLyx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Aug 2019 07:54:53 -0400
Received: from mail-wm1-f43.google.com ([209.85.128.43]:36624 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727182AbfHZLyw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Aug 2019 07:54:52 -0400
Received: by mail-wm1-f43.google.com with SMTP id g67so15544778wme.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2019 04:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=mIqaLu1SfbTpcrgwTVGCf5VhKM6jJiI/OPInMvNVNQk=;
        b=nLBZKlrpvXm1nWOcbAsECca5e0S2Ae/0uyRtQYoXtsFLBnsa2+6YrtEt7b1adoQdrQ
         pv2PWNPeyCm9jX6k5iPXbVDs4K49YAtBcVG6OCWIiU4Ih3P47bimIX/ZB2W0pDx/Phbv
         r3jYbGsbC1ilCY4PpFU2krNt1Q9RAAKQjEcKSaBp1oBtmP5zToFNrootvjxWgq7vJwe5
         Hp2PvnsUz+KIOQ/vUFptnZNee3tC6vm9ZluGib9JQmWotzVr7SpHn9clwtL0nb203BQA
         mjJvqlgGOth3gUiRFj3jB+OWaIQszRibZ1mdkCQgXWr2cnM0dfdEPX7uxsbGVa+uiCtR
         xhmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=mIqaLu1SfbTpcrgwTVGCf5VhKM6jJiI/OPInMvNVNQk=;
        b=CtP0coZpG8rWL77+vuk3BoDK8hlR2U8pF7KDSBpofBU7GVh9ohiQP+UR7Tvwv/xtVD
         rr/9HpYyvc43kPCVdVQQZydyZldj6uTwszRIzwfznoEYlKNoIhKYXvKt3Cmj1LNDyM7X
         8hQhUDqPJ0NAy/wn0+X9opX2C3Z+TxNpUaxBEXwNde+ga5G1vnwvAXIWNeVl6fwA943/
         9Mbc5S+xRF6Ui/dRG5oySwNxlRXF5M3rwUmyCowYCv64M02AXnkwFmTCmYTU2ZJFDeEc
         DR7iDV/KJd0+9TrsuA2suAlrTDUnLLIADC/Mp1TllP4YIwr1xZj/IqMH76q6DDovZgDy
         kFew==
X-Gm-Message-State: APjAAAXaL4pG/E5tg1nLlw1rMMrX4E/F9lXALJUH4NKJ7SqVQktyU013
        M0SWnOhhOmn6L8NSzCGvv1X1Jw==
X-Google-Smtp-Source: APXvYqwZZ+OBS8TLO989Qm5py1pa4UCf/gKyA4eL6sJJOOXQTSkJpV+ttv3x/MrQpX4ILXdpkX3nmw==
X-Received: by 2002:a1c:9e4b:: with SMTP id h72mr20358120wme.99.1566820490663;
        Mon, 26 Aug 2019 04:54:50 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f134sm20897712wmg.20.2019.08.26.04.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2019 04:54:50 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: [GIT PULL] clk: meson: 2nd round of updates for 5.4
Date:   Mon, 26 Aug 2019 13:54:49 +0200
Message-ID: <1j8srg6t12.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


Dear clock maintainers,

Below is a request to pull another batch of Amlogic clock updates for
v5.4. It brings reset support in the for the g12a audio controller and
sm1 support in the main clock controller.

Cheers
Jerome

The following changes since commit 1d97657a4794ab23b47bd9921978ddd82569fcf4:

  Merge branch 'v5.4/dt' into v5.4/drivers (2019-08-09 12:12:58 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/clk-meson-v5.4-2

for you to fetch changes up to da3ceae4ec9f581a50dc0763710078f22d3bc72a:

  clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks (2019-08-26 11:04:54 +0200)

----------------------------------------------------------------
Amlogic 2nd round of clock changes for v5.4

* Add g12a reset support to the axg audio clock controller
* Add sm1 support to the g12a clock controller

----------------------------------------------------------------
Jerome Brunet (4):
      dt-bindings: clock: meson: add resets to the audio clock controller
      Merge branch 'v5.4/dt' into v5.4/drivers
      clk: meson: axg-audio: add g12a reset support
      Merge branch 'v5.4/dt' into v5.4/drivers

Neil Armstrong (4):
      dt-bindings: clk: meson: add sm1 periph clock controller bindings
      clk: meson: g12a: add support for SM1 GP1 PLL
      clk: meson: g12a: add support for SM1 DynamIQ Shared Unit clock
      clk: meson: g12a: add support for SM1 CPU 1, 2 & 3 clocks

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |   1 +
 .../bindings/clock/amlogic,gxbb-clkc.txt           |   1 +
 drivers/clk/meson/axg-audio.c                      | 107 +++-
 drivers/clk/meson/axg-audio.h                      |   1 +
 drivers/clk/meson/g12a.c                           | 544 +++++++++++++++++++++
 drivers/clk/meson/g12a.h                           |  24 +-
 include/dt-bindings/clock/g12a-clkc.h              |   5 +
 .../reset/amlogic,meson-g12a-audio-reset.h         |  38 ++
 8 files changed, 718 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
