Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 459DFECAAD2
	for <linux-clk@archiver.kernel.org>; Thu,  1 Sep 2022 22:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233374AbiIAW1d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Sep 2022 18:27:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235291AbiIAW1M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2022 18:27:12 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6374822292
        for <linux-clk@vger.kernel.org>; Thu,  1 Sep 2022 15:25:01 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id y1so159923plb.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Sep 2022 15:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gateworks-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=H6ognOyqgR63Qc5uxwtLsdJe5XquKuPnICVqa9a8AKs=;
        b=Yjx+TGhJgVa88DDNYKa0fjVNTMlJaMO/tyUZU6y3og+6nYzwev4neOE97zwDXbETHB
         fF8xoIuqF5Tvstqbf0dU8zyUh2QMzGkB6U6gEOucvqJ/Oies13jEAaSE2lmhVxwnLR/D
         bAW/WmZGGvKCxuD3kEv5YwNQilRT+kwbX7WTSn74VQayUDRZcOF4cfE2AEVwO90bCsTK
         A5/53sGWlHQ6U3RTWPd5dUpH7BdUy9SM+IbMOlPIzsVeFYdpRlsfMPlplnQM0wH/e3lZ
         BrgbmP5weBThNZuaevXlt9J7GkkCohcjr0ngBG3AWCQOOmt1ZxtrV0Nqf3q/E0MU9443
         opuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=H6ognOyqgR63Qc5uxwtLsdJe5XquKuPnICVqa9a8AKs=;
        b=T1YlsaiH8tKkDJEtfufE4F0JgXWf4GCizkhsD19uLa4Y1yJUZcyPM89VAzMQoihRVd
         sHr7aP3AkubvImP7+xDxoz13Dz/en7boMzEmhIqTwbmFebhwpPGW8cSH+YRINj4eJ6GH
         iCKNP5KJmnQ49VOoAFXsoAgkCeTTA1j39+kWcqbRgI3lhYs3Io9SZRsi9ZwSQQnh3S/+
         LrRFPd412UPfhWHgnHXKJcalKdHwqEQYY6l8w27jvh25BB7sWwJTJ9QUy7P8dCvRqT2x
         g/LOh+S99SG5p7t25JAQ+UgeqarHGbX8kXTlHU1ziJEZbrpGJiPcuTMTq8TEDp5lpbVq
         JDgw==
X-Gm-Message-State: ACgBeo1hO3rq4hRkboRoOGphW837OWNHycft5Jk0tlybY9CroOPHwyJZ
        zaK0HWBRStRd2PXh2vGUHnPa9NBuUREy2C5YDRtdqjZzNmh0Mu0G
X-Google-Smtp-Source: AA6agR6m2BFDhZF8xc/TQvHE5/JD07yIzmeqHx3EbH+37ZwhGDqt/hrDf3heDlbAYgGk5SNZLDBr4+9lbVnFAuVS9Xg=
X-Received: by 2002:a17:903:41c6:b0:174:3acf:8294 with SMTP id
 u6-20020a17090341c600b001743acf8294mr32176674ple.118.1662071024760; Thu, 01
 Sep 2022 15:23:44 -0700 (PDT)
MIME-Version: 1.0
From:   Tim Harvey <tharvey@gateworks.com>
Date:   Thu, 1 Sep 2022 15:23:33 -0700
Message-ID: <CAJ+vNU1Za2CPGVX3q4HKufsxbL5zRrk1B5CWFpKritetrTs4dA@mail.gmail.com>
Subject: BD71847 clk driver disables clk-32k-out causing RTC/WDT failure
To:     linux-clk <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>
Cc:     NXP Linux Team <linux-imx@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Greetings,

I've found that the bd71847 clk driver (CONFIG_COMMON_CLK_BD718XX
drivers/clk/clk-bd718x7.c) disables clk-32k-out (the BD71847 C32K_OUT
pin) which is connected IMX8MM RTC_XTALI which ends up disabling the
IMX RTC as well as the IMX WDOG functionality.

You can see this with:
# cat /sys/kernel/debug/clk/clk-32k-out/clk_rate
32768
# cat /sys/kernel/debug/clk/clk-32k-out/clk_enable_count
0
# cat /sys/class/rtc/rtc0/name
snvs_rtc 30370000.snvs:snvs-rtc-lp
# cat /sys/class/rtc/rtc0/time
00:00:03
^^^ time never changes

This happens via clk_unprepare_unused() as nothing is flagging the
clk-32k-out as being used. What should be added to the device-tree to
signify that this clk is indeed necessary and should not be disabled?

Best Regards,

Tim
