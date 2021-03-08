Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 319CCC433E6
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 18:24:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F0D6C64FE3
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 18:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCHSYH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 13:24:07 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:36020 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbhCHSXw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Mar 2021 13:23:52 -0500
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lJKXn-0004BY-LE
        for linux-clk@vger.kernel.org; Mon, 08 Mar 2021 18:23:51 +0000
Received: by mail-wr1-f69.google.com with SMTP id h21so5142509wrc.19
        for <linux-clk@vger.kernel.org>; Mon, 08 Mar 2021 10:23:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KX2v5j7I3zXLrg0qNAwZaGK6w9v9AXVKox7isWJgC+U=;
        b=GRFYlxwrxJmBuDb6a0CyzV8s2L1FsaYJyezW0ap8yt7uLSQNS8lqQtZC3E8ZgsH+1t
         OmjMLqnZnoA6CG2Pcq+C0D9wjVz2GrQobi5l8NGGRobIdxvwHVBMYy1jb3nPm4zRJ8O8
         wLdDdLFrBCfReZnXDemuL8OZb5/GWyqMPQ97EsVsCbqhr6pZWoco0GgcI2063p2fGpae
         pwHDFdsrlZMEOp9ghwqMHyrFTuKn5aT5H8F2e4IehAUKSUlvBkrAo13uxgPWaNX5nmZv
         hIo4eXBm2cYTFulnqmxVMI3c8Wu9Ex00ugrb0qMpvR90bUDStZ7CotNb9Sh5wHJvR73V
         R1xA==
X-Gm-Message-State: AOAM532bNcpXFcFH9ZZF7kJJsCrDhwkPHB1lYGXA0PbY9mJQrMM/5HGY
        rELDfdciVbS9CKd2VSYth23pqR1cAVvnhMY+uf8GgFHKlHz24vypFYfC2oOgAm23yfz8m1XuIfw
        Gy2aDM1KfDla+NtPFFp0ymAwIJy6Jrg4BaACQbA==
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr108813wmb.142.1615227831052;
        Mon, 08 Mar 2021 10:23:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzqgyApwcs5u2d3ykSYzyi7V9lCv6GKyln79Ae5GSas5Vc6LGu56wJ/JTtqVwCRsWeddWuSUw==
X-Received: by 2002:a1c:cc04:: with SMTP id h4mr108796wmb.142.1615227830933;
        Mon, 08 Mar 2021 10:23:50 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id f22sm158207wmb.31.2021.03.08.10.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 10:23:50 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFT 0/3] clk: socfpga: minor cleanups and compile testing
Date:   Mon,  8 Mar 2021 19:23:36 +0100
Message-Id: <20210308182339.379775-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

A fix, cleanup and finally compile testing for SoCFPGA clock drivers.
I don't expect any functional impact, however please test on real
hardware.

I tested compile builds on few configuratins, so I hope kbuild 0-day
will check more options (please give it few days on the lists).

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  clk: socfpga: allow building N5X clocks with ARCH_N5X
  clk: socfpga: drop duplicated lines in Makefile
  clk: socfpga: allow compile testing of Stratix 10 / Agilex clocks

 drivers/clk/Kconfig          |  1 +
 drivers/clk/Makefile         |  4 +---
 drivers/clk/socfpga/Kconfig  | 23 +++++++++++++++++++++++
 drivers/clk/socfpga/Makefile |  5 ++---
 4 files changed, 27 insertions(+), 6 deletions(-)
 create mode 100644 drivers/clk/socfpga/Kconfig

-- 
2.25.1

