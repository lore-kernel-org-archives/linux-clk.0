Return-Path: <SRS0=APof=QO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C94DC282C2
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 13:23:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 38ED02175B
	for <linux-clk@archiver.kernel.org>; Thu,  7 Feb 2019 13:23:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="TfzqPD/p"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726876AbfBGNXx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Feb 2019 08:23:53 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:45158 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726786AbfBGNXx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Feb 2019 08:23:53 -0500
Received: by mail-wr1-f47.google.com with SMTP id q15so11474799wro.12
        for <linux-clk@vger.kernel.org>; Thu, 07 Feb 2019 05:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=bcyPyotbUDuv4bfeRvZ7+OPbaOd1twKCCuoweNM1QrU=;
        b=TfzqPD/pWuO2fgsXeficOb5vf1VEV9pZK9g75Mzar3tWK7bTUvQGOZWewabwOefcft
         Us9vRJSywkY5Z7w4tnlar4G3o7SzQpDV2+JhoUO1Hct6/u8djQKMYygSdkoDyd+FsmOl
         UL9ElHLMI4f8PjhGaHKQUHBVo11YT9kmjRr0vnP+WH2KdjqiSjigs5R4rTPUwwFSUBMv
         VzGUqi2CJmADdYogVXvpZLn624QHlhtVJTQoZm0+uV/tn6xfzZbSCreTwim6ARqBcpVN
         HhfZ9uDveDWJC4mb2YZyJBMw4u3jGT7wXsBLcSoxm2moTWFBTW2SdRQZewtN71axaXz0
         1oEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=bcyPyotbUDuv4bfeRvZ7+OPbaOd1twKCCuoweNM1QrU=;
        b=WiQXMJTaY487skqGmcCopwu90rI2KGEpGItjesw/ygHxpJ8UdGXNt1G1qJnfP9mPBp
         ugFykRSGnzvOwX8hK1Gw7OK56zktI4CSK1hsWwrBxHwYKI3M0PrmWTogdIYy7ceYDkm8
         qisJnhRSk0P6qbeUlP9jUOfynKc5PxUPsfBB7cOAcXkANDaNutqNFKm+sdcpiA6KIyww
         FmfyS0Z062C77zstgqdN0RMhVLgg4z0jDvOj1jZdgEyP4+Fkj5Kwmsa0D2we679dXief
         j5he4mS7UadtGrICnyrELb5vYY60fuCpuzsafReKZhQz1i82+U9IgUxBMqpLxKEwrvh+
         4TAA==
X-Gm-Message-State: AHQUAuaJWfBhoofRVFwRbFNYnN8WoZuaFDFFn5QwzynYcgVluLtFtCoE
        SNlBkt4aa9k7rmrkzsbmQdc+VA==
X-Google-Smtp-Source: AHgI3IZU+ckAoM8iWp0KO1lk1o4LPvCBOA/b/OVgKyrqDezOa7LqiMsiLT9aGpkNEZjOZiC4xrcKBA==
X-Received: by 2002:adf:d146:: with SMTP id b6mr12495203wri.156.1549545830451;
        Thu, 07 Feb 2019 05:23:50 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x3sm33097696wrd.19.2019.02.07.05.23.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 07 Feb 2019 05:23:49 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v5.1
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1c894e44-de4b-aef8-d3a3-f371bf2d2f68@baylibre.com>
Date:   Thu, 7 Feb 2019 14:23:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.

It covers essentially refactoring AXG and GXBB drivers to easily add
support for 32k AO clock support and G12A clock controller.
It also fixes Mali GPU clocks for Meson8 SoCs.

Thanks,
Neil

The following changes since commit bfeffd155283772bbe78c6a05dec7c0128ee500c:

  Linux 5.0-rc1 (2019-01-06 17:08:20 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/tags/meson-clk-5.1

for you to fetch changes up to 6682bd4d443fad802e11a0a39332025cdfbf5108:

  clk: meson: factorise meson64 peripheral clock controller drivers (2019-02-04 09:52:11 +0100)

----------------------------------------------------------------
- add 32k clock generation for AXG
- add support for the Mali GPU clocks for Meson8
- claim input clocks through DT for AXG and GXBB
- rework drivers dependencies among meson clock drivers
- add G12A EE clock controller driver

----------------------------------------------------------------
Jerome Brunet (14):
      dt-bindings: clk: meson: add ao slow clock path ids
      clk: meson: clean-up clock registration
      clk: meson: add dual divider clock driver
      clk: meson: gxbb-ao: replace cec-32k with the dual divider
      clk: meson: axg-ao: add 32k generation subtree
      clk: meson: gxbb: claim clock controller input clock from DT
      clk: meson: axg: claim clock controller input clock from DT
      clk: meson: ao-clkc: claim clock controller input clocks from DT
      clk: export some clk_hw function symbols for module drivers
      clk: meson: use CONFIG_ARCH_MESON to enter meson clk directory
      clk: meson: axg-audio does not require syscon
      clk: meson: rework and clean drivers dependencies
      clk: meson: pll: update driver for the g12a
      clk: meson: factorise meson64 peripheral clock controller drivers

Jian Hu (2):
      dt-bindings: clk: meson: add g12a periph clock controller bindings
      clk: meson: g12a: add peripheral clock controller

Martin Blumenstingl (2):
      clk: meson: meson8b: use a separate clock table for Meson8
      clk: meson: meson8b: add the GPU clock tree

 .../bindings/clock/amlogic,gxbb-clkc.txt           |    1 +
 drivers/clk/Makefile                               |    2 +-
 drivers/clk/clk.c                                  |    3 +
 drivers/clk/meson/Kconfig                          |   99 +-
 drivers/clk/meson/Makefile                         |   29 +-
 drivers/clk/meson/axg-aoclk.c                      |  193 +-
 drivers/clk/meson/axg-aoclk.h                      |   13 +-
 drivers/clk/meson/axg-audio.c                      |    5 +-
 drivers/clk/meson/axg.c                            |   69 +-
 drivers/clk/meson/clk-dualdiv.c                    |  138 ++
 drivers/clk/meson/clk-dualdiv.h                    |   33 +
 drivers/clk/meson/clk-input.c                      |    7 +-
 drivers/clk/meson/clk-input.h                      |   19 +
 drivers/clk/meson/clk-mpll.c                       |   12 +-
 drivers/clk/meson/clk-mpll.h                       |   30 +
 drivers/clk/meson/clk-phase.c                      |   75 +-
 drivers/clk/meson/clk-phase.h                      |   26 +
 drivers/clk/meson/clk-pll.c                        |  216 +-
 drivers/clk/meson/clk-pll.h                        |   49 +
 drivers/clk/meson/clk-regmap.c                     |    5 +
 drivers/clk/meson/clk-regmap.h                     |   20 +
 drivers/clk/meson/clk-triphase.c                   |   68 -
 drivers/clk/meson/clkc.h                           |  127 --
 drivers/clk/meson/g12a.c                           | 2359 ++++++++++++++++++++
 drivers/clk/meson/g12a.h                           |  175 ++
 drivers/clk/meson/gxbb-aoclk-32k.c                 |  193 --
 drivers/clk/meson/gxbb-aoclk.c                     |  268 ++-
 drivers/clk/meson/gxbb-aoclk.h                     |   20 +-
 drivers/clk/meson/gxbb.c                           |  296 ++-
 drivers/clk/meson/meson-aoclk.c                    |   54 +-
 drivers/clk/meson/meson-aoclk.h                    |   13 +-
 drivers/clk/meson/meson-eeclk.c                    |   63 +
 drivers/clk/meson/meson-eeclk.h                    |   25 +
 drivers/clk/meson/meson8b.c                        |  352 ++-
 drivers/clk/meson/meson8b.h                        |    9 +-
 drivers/clk/meson/parm.h                           |   46 +
 drivers/clk/meson/sclk-div.c                       |   10 +-
 drivers/clk/meson/{clkc-audio.h => sclk-div.h}     |   16 +-
 drivers/clk/meson/vid-pll-div.c                    |   10 +-
 drivers/clk/meson/vid-pll-div.h                    |   20 +
 include/dt-bindings/clock/axg-aoclkc.h             |    7 +-
 include/dt-bindings/clock/g12a-clkc.h              |  135 ++
 include/dt-bindings/clock/gxbb-aoclkc.h            |    7 +
 43 files changed, 4572 insertions(+), 745 deletions(-)
 create mode 100644 drivers/clk/meson/clk-dualdiv.c
 create mode 100644 drivers/clk/meson/clk-dualdiv.h
 create mode 100644 drivers/clk/meson/clk-input.h
 create mode 100644 drivers/clk/meson/clk-mpll.h
 create mode 100644 drivers/clk/meson/clk-phase.h
 create mode 100644 drivers/clk/meson/clk-pll.h
 delete mode 100644 drivers/clk/meson/clk-triphase.c
 delete mode 100644 drivers/clk/meson/clkc.h
 create mode 100644 drivers/clk/meson/g12a.c
 create mode 100644 drivers/clk/meson/g12a.h
 delete mode 100644 drivers/clk/meson/gxbb-aoclk-32k.c
 create mode 100644 drivers/clk/meson/meson-eeclk.c
 create mode 100644 drivers/clk/meson/meson-eeclk.h
 create mode 100644 drivers/clk/meson/parm.h
 rename drivers/clk/meson/{clkc-audio.h => sclk-div.h} (54%)
 create mode 100644 drivers/clk/meson/vid-pll-div.h
 create mode 100644 include/dt-bindings/clock/g12a-clkc.h
