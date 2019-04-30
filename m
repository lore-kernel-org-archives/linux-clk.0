Return-Path: <SRS0=4m2Q=TA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F072DC43219
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 20:51:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B882D2080C
	for <linux-clk@archiver.kernel.org>; Tue, 30 Apr 2019 20:51:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="F0uIwwoW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbfD3Uvc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Apr 2019 16:51:32 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37749 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfD3Uvc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Apr 2019 16:51:32 -0400
Received: by mail-it1-f195.google.com with SMTP id r85so7072623itc.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2019 13:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjQtX5qzbngzO6WItWUMVIwx0kzAkLppgcgbD0Y95uE=;
        b=F0uIwwoWKlnBD0zMndyAUgxMQWgstX0DeGWUgyikUtD+ZL9Ef8bN9f0oJWQaWvbvFw
         85rBa8HLz4CIBild/BejxfpIYzucwPsZm6jNgFcwBaor5feaM/EmRCNpKIO43DZKx8Z9
         RwbJnPR6SrC7LuwVrwXPZRsPeIPcKimDfH7G3OZm6AFNMPjYVAZfbjoaZpBNYC1+/gzW
         FCxn8taXvl4WOtg0aS9EwvN9AhMSCgSmg8Mir1WWq1AuBHTLsb0E9rq95fRSubl/25Gm
         IM3Zq8AI4oezyB5rIGxoW/eLLFOuIs/akYM/TWigLwLLqaIfMEnXr/0NEfNvfYfXwT8I
         GbPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vjQtX5qzbngzO6WItWUMVIwx0kzAkLppgcgbD0Y95uE=;
        b=NpPwBTcPdYLZYBAUjU0EqbWQ9xSKfewA1n9xD0SzvGoHWDWXy104DVnOgnnrB+GSnm
         WJ8UFyGeQ0j6z6apcVLYP+XhaorHiDUbEuNY8gmSz0H8XIqSy08yaJWMAFhsA+ACjci0
         SbQJDSRD0SXjaEkjGi2Z6oAXLNgEAMrJ1kXOA0adJ9kVSquARjVsCQZhpL1tJmI2A5J2
         xD4mFIJXJPVSMGazali4sMIxCe0MrCRVFou5hC7bur57Ct1ZoKnjV2zmPY/7r3F59n/6
         ahrPWy7xgnbn+HYpCbt8BiSTHdX5MQcofO3ppMJGkSQz/V3DUNe4CyZi7wuPo4hUHLt+
         M1Ow==
X-Gm-Message-State: APjAAAX+p2gqloPxPxDQWikJ+9DlulHdONmbqbUKxtXaxzTP9Zloq1ZC
        MMYRRaGY/nFI80CUXj32/zVyKA==
X-Google-Smtp-Source: APXvYqx8LPqX8+1jPVWOhnE83hohCgwnay3/bNio9Sr2ZTQMCvXG1lYnXsfpJOWygz06tzC47v2Dug==
X-Received: by 2002:a24:7688:: with SMTP id z130mr5167604itb.57.1556657490516;
        Tue, 30 Apr 2019 13:51:30 -0700 (PDT)
Received: from viisi.lan (c-73-95-159-87.hsd1.co.comcast.net. [73.95.159.87])
        by smtp.gmail.com with ESMTPSA id v134sm1998052ita.16.2019.04.30.13.51.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 30 Apr 2019 13:51:29 -0700 (PDT)
From:   Paul Walmsley <paul.walmsley@sifive.com>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-clk@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v4 0/2] clk: add driver for the SiFive FU540 PRCI and PLLs it controls
Date:   Tue, 30 Apr 2019 13:50:55 -0700
Message-Id: <20190430205055.25673-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

clk: add driver for the SiFive FU540 PRCI and PLLs it controls

Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
some device reset control for the SiFive FU540 chip.  Also add a driver-
independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
the PRCI driver to monitor and control the WRPLL instances on the FU540
chip.

This fourth version incorporates changes requested by Stephen Boyd
<sboyd@kernel.org>.  The DT bindings patch has been dropped since
Stephen has already queued it.

This patch series is also available, with the binding documentation
patch, at:

   https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc7

Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
open-source FSBL with a mainline-focused DTB, using the following
composite test branch:

   https://github.com/sifive/riscv-linux/tree/dev/paulw/dts-v5.1-rc7-experimental


- Paul

Paul Walmsley (2):
  clk: analogbits: add Wide-Range PLL library
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   3 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/analogbits/Kconfig                |   2 +
 drivers/clk/analogbits/Makefile               |   3 +
 drivers/clk/analogbits/wrpll-cln28hpc.c       | 364 ++++++++++
 drivers/clk/sifive/Kconfig                    |  18 +
 drivers/clk/sifive/Makefile                   |   1 +
 drivers/clk/sifive/fu540-prci.c               | 630 ++++++++++++++++++
 include/linux/clk/analogbits-wrpll-cln28hpc.h |  79 +++
 10 files changed, 1108 insertions(+)
 create mode 100644 drivers/clk/analogbits/Kconfig
 create mode 100644 drivers/clk/analogbits/Makefile
 create mode 100644 drivers/clk/analogbits/wrpll-cln28hpc.c
 create mode 100644 drivers/clk/sifive/Kconfig
 create mode 100644 drivers/clk/sifive/Makefile
 create mode 100644 drivers/clk/sifive/fu540-prci.c
 create mode 100644 include/linux/clk/analogbits-wrpll-cln28hpc.h

-- 
2.20.1

