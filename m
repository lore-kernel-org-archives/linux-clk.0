Return-Path: <SRS0=IRPH=3N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C7B4C2D0CE
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 07:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3964820709
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 07:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkZgtU9i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgAXHcV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jan 2020 02:32:21 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34943 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbgAXHcU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 02:32:20 -0500
Received: by mail-wr1-f67.google.com with SMTP id g17so751983wro.2
        for <linux-clk@vger.kernel.org>; Thu, 23 Jan 2020 23:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=HQccjgtMAc0SPlWyaIc43CbCQuVgkEsK2j6Xvgc8lAg=;
        b=nkZgtU9icywvA3T6BT/bG475Xw0LheKWzeZpVLLSQmEGChDzWK+hs5Hh3GLBtHuDKl
         jF3u/Ho563lTX8w560DptupOy10UeQy95s7gSR+s+nF/+TrAZibsi8ylxfPGEtmd/3hd
         Ej4f1ppXhiA6LtxFa3xufMfD3Qj0rVauLHA/JOZFEEb2HKM1rmBnNXenQfE9A/+2Mo3L
         gTVafIsvVkz0AxYFEBmfESzSV12cgdhaoweVADlWzNE8AGJIMsBGHGt69QJCNKfs89+w
         cNUr3zq+rGV+EA9YLt3zGkO2tvtFnJVYfDGrXotllIb/qKmLEp2wSu19pktpNUiSMARc
         /GXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=HQccjgtMAc0SPlWyaIc43CbCQuVgkEsK2j6Xvgc8lAg=;
        b=HgDnSbpA3lrKCij/ZQ8SFVOJ+T1rZUkLUD/4L731XmRw+QZ3ga52xSNmMQqcokumPf
         GXu8KmSizntYWzon0hqylmv1bm+xvZlOHcNT0/hPWcQyCrwnUDyqlKIGAny5xaSIVRU9
         J8qi9ubxRwnuukAzLletrz4wUek+qL3krZaepZ0h4AWpyhRGvMMGd7UgpHFjvpBy/bv6
         SO8SauLn4xWUFCqMLW0kL+F65YNK1hDeAB2zpeekd26atxPD7WRaN75nu4w/oxcCp1m0
         SShZCv/w816b40yG6YdbN1rsHk55MlMeHWXWOT9S1AJ0TbUUnvob5F4TWEviSwnHrwYk
         xpRw==
X-Gm-Message-State: APjAAAUuWgcsyyK1pBR31STIabWsCMgwwqAQINnYCdZnzbeuH6QuypKk
        vOlXMAdyvQZU3dP8INH3uzkHBA==
X-Google-Smtp-Source: APXvYqzSyGspiLTQd3s7PHphq1fUdHq17gU1ICAWacJUBySQIOldM4PuKzvWEqgQZKbVzXS9I+8gfA==
X-Received: by 2002:a5d:480b:: with SMTP id l11mr2484444wrq.129.1579851138213;
        Thu, 23 Jan 2020 23:32:18 -0800 (PST)
Received: from dell ([2.27.35.227])
        by smtp.gmail.com with ESMTPSA id s10sm6222860wrw.12.2020.01.23.23.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2020 23:32:17 -0800 (PST)
Date:   Fri, 24 Jan 2020 07:32:30 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Mark Brown <broonie@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-clk@vger.kernel.org, linux-gpio@ger.kernel.org
Subject: [GIT PULL] Immutable branch between MFD, Clk, GPIO, Regulator and
 RTC due for the v5.6 merge window
Message-ID: <20200124073230.GQ15507@dell>
References: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1579527444.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Enjoy!

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-clk-gpio-regulator-rtc-v5.6

for you to fetch changes up to c31f625d06c9166f753a2f21ac9c3f859647ca9f:

  gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs (2020-01-24 07:23:10 +0000)

----------------------------------------------------------------
Immutable branch between MFD, Clk, GPIO, Regulator and RTC due for the v5.6 merge window

----------------------------------------------------------------
Matti Vaittinen (11):
      dt-bindings: leds: ROHM BD71282 PMIC LED driver
      dt-bindings: mfd: Document ROHM BD71828 bindings
      mfd: Rohm PMICs: Use platform_device_id to match MFD sub-devices
      mfd: bd718x7: Add compatible for BD71850
      mfd: bd71828: Support ROHM BD71828 PMIC - core
      mfd: bd71828: Add power-key support
      clk: bd718x7: Support ROHM BD71828 clk block
      regulator: bd718x7: Split driver to common and bd718x7 specific parts
      mfd: bd70528: Fix hour register mask
      rtc: bd70528: add BD71828 support
      gpio: bd71828: Initial support for ROHM BD71828 PMIC GPIOs

 .../bindings/leds/rohm,bd71828-leds.yaml           |  52 +++
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml | 193 ++++++++++
 drivers/clk/Kconfig                                |   6 +-
 drivers/clk/clk-bd718x7.c                          |  50 ++-
 drivers/gpio/Kconfig                               |  12 +
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-bd71828.c                        | 159 ++++++++
 drivers/mfd/Kconfig                                |  15 +
 drivers/mfd/Makefile                               |   1 +
 drivers/mfd/rohm-bd70528.c                         |   3 +-
 drivers/mfd/rohm-bd71828.c                         | 344 +++++++++++++++++
 drivers/mfd/rohm-bd718x7.c                         |  43 ++-
 drivers/regulator/Kconfig                          |   4 +
 drivers/regulator/Makefile                         |   1 +
 drivers/regulator/bd718x7-regulator.c              | 200 ++++------
 drivers/regulator/rohm-regulator.c                 |  95 +++++
 drivers/rtc/Kconfig                                |   3 +-
 drivers/rtc/rtc-bd70528.c                          | 220 +++++++++--
 include/linux/mfd/rohm-bd70528.h                   |  19 +-
 include/linux/mfd/rohm-bd71828.h                   | 423 +++++++++++++++++++++
 include/linux/mfd/rohm-bd718x7.h                   |   6 -
 include/linux/mfd/rohm-generic.h                   |  70 +++-
 include/linux/mfd/rohm-shared.h                    |  21 +
 23 files changed, 1718 insertions(+), 223 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/rohm,bd71828-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd71828-pmic.yaml
 create mode 100644 drivers/gpio/gpio-bd71828.c
 create mode 100644 drivers/mfd/rohm-bd71828.c
 create mode 100644 drivers/regulator/rohm-regulator.c
 create mode 100644 include/linux/mfd/rohm-bd71828.h
 create mode 100644 include/linux/mfd/rohm-shared.h

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
