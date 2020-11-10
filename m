Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C557AC5517A
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C90F206E3
	for <linux-clk@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L0Xpq8HY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728659AbgKJH2H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Nov 2020 02:28:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727019AbgKJH2H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Nov 2020 02:28:07 -0500
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7AAC0613D3
        for <linux-clk@vger.kernel.org>; Mon,  9 Nov 2020 23:28:07 -0800 (PST)
Received: by mail-pg1-x542.google.com with SMTP id r186so9422724pgr.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Nov 2020 23:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXAqxmjmagUUMTqazflkMp+W3D5vynn+tv76fX8fmb0=;
        b=L0Xpq8HYY8zZ8T81fBm8MJOhlIw56+amwiMYIoU0QsQ0hyRcZ/x/6Fkk4MbUemAb/e
         8m/RAK0/gfNPcm1Dw5CCr4yGqrphaT2zoP5cYOBguGAr1R0U0t+fjAuQJOeAT1yBycRC
         D+XNbBehzjDoQBztNYuwZMJorJQ/wEDP2EJRE4EdD5p25kipvgtA+tRVMfRMz5ED8rOl
         XOmUoHtftlV7RwBP/55v5Qi1c61dtNrWPYAMYIwmZFYOK03Tf90ZpeHL9FVwJv4UTOTv
         7ls4e7RQ5+Qn1Plakgsj1jt6aTFlAaCRHZ7sTUrMyhxz/8lFt5OaZ3X3zPDKbbOo7v8X
         LRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXAqxmjmagUUMTqazflkMp+W3D5vynn+tv76fX8fmb0=;
        b=DgG36nic4wEapQe2kZfKqKMvunSJ3LrEoYsZrUzqpkqrYDQFplk/utrR9NuUjQKNlM
         zFTIoAXZ5JOktABXf3fPKkzbWJ08mEDOtHLTWBvwitHImnNRAJ/p8wtV6nhdpysrvjTZ
         NALNm6MI6QejYCWL7eUkpjhQqq1AkuR+C9G26tNcgk9rb7lePASLstgZ1Ugkfy1qVVCk
         aO73dr3knp/eSIDGQG1j97xk+DhpHknGHBqZZtMwHxjtpp9yGSpe4HN2M9pabHt+bSOU
         bOqgPAsw1oHU8Bf1cQsq8qL4kIWKf+4eUEJdFPIT2nuq2pKasUA5M7lYh5DU/v9C2toT
         oEzA==
X-Gm-Message-State: AOAM530E1UCJl3+BGgZdlKNF2maYPZhkuik9HT6cUxUREg4BzrbpBd78
        XZWvV8ByN/2+N/vLifCH/76/gMulV9q0kg==
X-Google-Smtp-Source: ABdhPJx/a67vEgBae+jayH60wcCsinq6WQh7Qtmzg/cjuEH/Goex8BLhj9hLWtvQQSvgCnaqIcd40w==
X-Received: by 2002:a17:90b:2152:: with SMTP id kt18mr3594134pjb.10.1604993286710;
        Mon, 09 Nov 2020 23:28:06 -0800 (PST)
Received: from hsinchu02.internal.sifive.com (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
        by smtp.gmail.com with ESMTPSA id w22sm12233191pge.25.2020.11.09.23.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2020 23:28:06 -0800 (PST)
From:   Zong Li <zong.li@sifive.com>
To:     paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
        schwab@linux-m68k.org, aou@eecs.berkeley.edu,
        mturquette@baylibre.com, yash.shah@sifive.com,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Cc:     Zong Li <zong.li@sifive.com>
Subject: [PATCH v2 0/3] clk: add driver for the SiFive FU740
Date:   Tue, 10 Nov 2020 15:27:45 +0800
Message-Id: <20201110072748.46705-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively.

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3

Zong Li (3):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 586 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 122 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 .../sifive/{fu540-prci.c => sifive-prci.c}    | 499 ++++++---------
 drivers/clk/sifive/sifive-prci.h              | 289 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 703 insertions(+), 873 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c} (45%)
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.29.2

