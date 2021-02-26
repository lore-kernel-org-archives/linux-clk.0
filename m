Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ACFAC433E6
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 14:15:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 15B1B64D9F
	for <linux-clk@archiver.kernel.org>; Fri, 26 Feb 2021 14:15:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbhBZOPI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 26 Feb 2021 09:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229989AbhBZOO5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Feb 2021 09:14:57 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B722C061756
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:16 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id h19so11132199edb.9
        for <linux-clk@vger.kernel.org>; Fri, 26 Feb 2021 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KoK826DVw45RSIr335dfSy5TyJSQwwkfzzkU1fu3OEk=;
        b=cZkTHSJQ1r4p4PitkU+/vlDTzmJg/V9nX2WMHhQJxJoERKL9NFhitjzsc5EiUnHIup
         oRr/wP47bDW4/E6DZ3P0aRDX2piGYfFtiIlzynodqk/4dzzLitA4hawc6gMGVrWWf6So
         4foAsZlCzcrFpybhzSxYqAYHtxVK9TO0y+LTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KoK826DVw45RSIr335dfSy5TyJSQwwkfzzkU1fu3OEk=;
        b=YrUNpBOcVHIcGXU4zbVSMkOlqi3N/pLJswu8wr/NfP/MEH8iI3qCOb0u5NdIx9htJS
         zvy5AqCVP1xLAwjzrqurWsAhyWEtXlebjtIrYA/NXnEI/rDM+SWXX9HWbiaUDkMU2SBO
         hBhq44BFgXaAdZiTiFTvK821etvpNs/w5kIa31SIcgC0iW29D32eYnExf2/yRce9z5uw
         2vxvYLnuoaU/WYdjahAEaiIvZ/+fR4Qwck9i/jtTPiE7zrUDrcX+fplvYDLoMjg5nqMm
         LRwU9FV9t/+DXV4pKraO6l/oRHqE2DzuefSSVh4LzR5n2yfcxe77ZHATbsbOTxXz2A0S
         yRFQ==
X-Gm-Message-State: AOAM530wUuVOLt69mkxR/wwN5yNVZ+4NZIiPRzPP606bNyXltPhabMEd
        pOPh06EZWF8oL0wdLOOFTKBaKg==
X-Google-Smtp-Source: ABdhPJyQT4fNHYcSdyEohDne+SLW167qPUaA5ARIIc3MduU1I9qui5Ic3KhEBXHGpsBnUBhz2mxR9g==
X-Received: by 2002:a05:6402:2054:: with SMTP id bc20mr3575708edb.190.1614348855092;
        Fri, 26 Feb 2021 06:14:15 -0800 (PST)
Received: from prevas-ravi.prevas.se ([80.208.71.141])
        by smtp.gmail.com with ESMTPSA id g3sm5316838ejz.91.2021.02.26.06.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Feb 2021 06:14:14 -0800 (PST)
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, linux-clk@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [PATCH 0/2] add ripple counter dt binding and driver
Date:   Fri, 26 Feb 2021 15:14:09 +0100
Message-Id: <20210226141411.2517368-1-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

What I'm trying to do:

We have a board with an external watchdog circuit (the kind that is
petted by flipping a gpio). The reset output of that is split in two:
One gives an immediate interrupt, so software knows that a hard reset
is imminent. The other half removes the "reset input" from a ripple
counter, causing that to start counting at 32kHz, and after 64ms, the
SOC's reset pin then gets pulled.

Unfortunately, the board designer overlooked that the 32kHz output
from the RTC can be disabled, which (since no other component uses
it), is just what happens when clk_disable_unused() gets called. When
the watchdog fires, we do get the interrupt, but the board does not
get reset as it should, since the counter doesn't count.

So I'm thinking that the proper way to handle this is to be able to
represent that ripple counter as a clock consumer in DT and have a
driver do the clk_prepare_enable(), even if that driver doesn't and
can't do anything else. But I'm certainly open to other suggestions.

The "clk_ignore_unused" kernel parameter is fine for debugging, but
too big a hammer (since it applies to all "unused" clocks).


Rasmus Villemoes (2):
  dt-bindings: misc: add binding for generic ripple counter
  drivers: misc: add ripple counter driver

 .../devicetree/bindings/misc/ripple-ctr.txt   |  8 +++++
 drivers/misc/Kconfig                          |  7 +++++
 drivers/misc/Makefile                         |  1 +
 drivers/misc/ripple-ctr.c                     | 31 +++++++++++++++++++
 4 files changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/ripple-ctr.txt
 create mode 100644 drivers/misc/ripple-ctr.c

-- 
2.29.2

