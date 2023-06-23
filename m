Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0666BEB64D7
	for <linux-clk@archiver.kernel.org>; Fri, 23 Jun 2023 06:52:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230120AbjFWGwD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Jun 2023 02:52:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjFWGwC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Jun 2023 02:52:02 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A211FF2
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 23:52:01 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id ada2fe7eead31-440b31263f5so74097137.0
        for <linux-clk@vger.kernel.org>; Thu, 22 Jun 2023 23:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687503120; x=1690095120;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q9GYpyHF8kKRJ9I0OCBzJMent+C6qNMpDFBjU5ENlbc=;
        b=O/6rSdiYk2YHelpcwBeA7NfA7K6qnEUHHTnQSSVOx3wYI0w6LcL7Wt5HJsCkAE2NMA
         q//On0FFPlY5N/Cxl9vKumJPr2SxEPdNJ4k+uWx7PIketS4UWOigRLO4KvDjVfSlA/lR
         ljPBmDhBg0OCP3uhLQuu4+xrZQlfz1i8Cm46a6xobUw8XNxoQkGujFlqEcaJ3rFZSbBd
         fVX7BVI+DwDrrzM5E8dRPY4CMqESZUPBh6i+fMNurG0/YFkURdoxturY2fJ7ukMsUzjW
         KgSV3wiZXg+HZx9oxhD5e4JyVk/y/mKnBTT6J8L6kNxcrtXNST1nRkPT/zxZZ5vkrp3+
         kxbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687503120; x=1690095120;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9GYpyHF8kKRJ9I0OCBzJMent+C6qNMpDFBjU5ENlbc=;
        b=VSY5+1IOZP7G+bfza+3UMPbl7wb3p8tFoOKHshM69trG0HWFVm70iBdgHIiulnpBMf
         XmcFidxp0zqqinw4hDIxOh3I926/aOz/4ejXsUu0+q5ihuBRtwFkjpfqRhKeIZIdq6eS
         fzRGjKefR6GpT0Z0G7Ef85DChdpE9xMByCQOC1RYN7EkwaKzR9I8+h7Hxwmr+4nSV8ud
         D4jjBl+JATSTAx2NeEyn3XdlaV5MQMDw7N00ZxWTHMouuITEoQctn2uyCdFgZrcKlZZs
         DKDILYTdqEA0piR9xo61PQoiyxk6ZCkwkpYM5BdcMvEvJ0+Z0O4jvj2M0M+5G0OrFesG
         fpyg==
X-Gm-Message-State: AC+VfDyVaqj3SJ5DNIGI7Wo30Xjo6ySqdaDq5ef0W6NkC3NxSyIfx71u
        nKg/C8X5cwbVeYw7viMlE3t0FBFSmk+Ihdi5lhIA+w==
X-Google-Smtp-Source: ACHHUZ4Sene3MWcI07nyI2IIF2i2y2mcjX0eF4UQPvgRTSa3TIEQoSj0VK+PhL/chWiFWabBqKNotBm2J4pY8yAx8ZA=
X-Received: by 2002:a67:e982:0:b0:440:bdb3:6950 with SMTP id
 b2-20020a67e982000000b00440bdb36950mr8013230vso.26.1687503120268; Thu, 22 Jun
 2023 23:52:00 -0700 (PDT)
MIME-Version: 1.0
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Fri, 23 Jun 2023 12:21:49 +0530
Message-ID: <CA+G9fYuvBN7Wb3hvmKemxMw1jTjG3-fgMwiQCWH6=fsTddU+xQ@mail.gmail.com>
Subject: next: arm: drivers/clk/imx/clk-imx1.c:13:10: fatal error:
 'soc/imx/timer.h' file not found
To:     open list <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        lkft-triage@lists.linaro.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Following build regressions noticed on Linux next-20230623.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


Regressions found on arm:

 - build/clang-16-imx_v4_v5_defconfig
 - build/gcc-12-imx_v4_v5_defconfig
 - build/gcc-8-multi_v5_defconfig
 - build/gcc-8-imx_v4_v5_defconfig
 - build/clang-nightly-imx_v4_v5_defconfig

Build error:
=====
drivers/clk/imx/clk-imx1.c:13:10: fatal error: 'soc/imx/timer.h' file not found
#include <soc/imx/timer.h>
         ^~~~~~~~~~~~~~~~~
1 error generated.
make[6]: *** [scripts/Makefile.build:243: drivers/clk/imx/clk-imx1.o] Error 1
drivers/clk/imx/clk-imx27.c:11:10: fatal error: 'soc/imx/timer.h' file not found
#include <soc/imx/timer.h>
         ^~~~~~~~~~~~~~~~~
1 error generated.
make[6]: *** [scripts/Makefile.build:243: drivers/clk/imx/clk-imx27.o] Error 1


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230623/testrun/17752217/suite/build/test/clang-16-imx_v4_v5_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230623/testrun/17752217/suite/build/test/clang-16-imx_v4_v5_defconfig/details/

--
Linaro LKFT
https://lkft.linaro.org
