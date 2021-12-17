Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065ABC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 15:55:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238496AbhLQPzu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 10:55:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229576AbhLQPzu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 10:55:50 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34B3BC061574
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:55:47 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id g14so9453463edb.8
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 07:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AfgZyMdEJhIrrC8KaYKPJsgOg20Fl0ent8NPVFsoxgs=;
        b=jQJPDfeUneKUEoWKPIw/VV44os2ZKX4YQslFa1zcE2bvla40AAxuuvcZava/OcOLYl
         ebuodp+o32Gk/rxi0DCEFl4gXg4ECbq7IBiMjNR9ACtIkZ6fApGCy1Rp9SNWADlTzJ8C
         npS7fGXItS9q+gBzdRWqsFWMUgygfjDJRoB+U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AfgZyMdEJhIrrC8KaYKPJsgOg20Fl0ent8NPVFsoxgs=;
        b=fb8OuzURUmWCDH/FnKmZr8MA7LDSwrM+YM3n+6JksmjiVHtfdf+ClAhf+bKGj3h3xi
         hHTHDWaBcmOPoLL2G5QnaDp8TLFoZmThijEyEu+LRCuUgmoIUqmdl24DjMu4wU/qhR/u
         9o/ROOdr7bZofjt9HavIIc1Kt8DUTsAUaht0043MU6xBiWhVxdQVQsF3merZoeTLF6NL
         exmL3e2vRMOI99+jsPkL1ANJ4m9gtZY391Z2JslOmYz5+jrRNHF1A5DuRLRSmJErvN4b
         Bmv1WJiC9z+hM0VV8btv6hI4m+RmLPysaSbPaTQyQ49cNiIQcKjCOz0m94C6UK5vZCsL
         Uynw==
X-Gm-Message-State: AOAM532DwVvD/oqY6ItjW9HQ+pZTyFo7OLzDOLfr7MnZxraF3b3Duu0+
        LPzIWxEaRfYq585FgXQcn3gUIg==
X-Google-Smtp-Source: ABdhPJwrqR1fUITbPzQl9qu5oFZPzkp0eOH0jA+KuGRGaM/zEYWpckONxW4PWxfDYd99CLnUnT9rsw==
X-Received: by 2002:a17:907:97d4:: with SMTP id js20mr3061659ejc.416.1639756545817;
        Fri, 17 Dec 2021 07:55:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-79-56-50-241.retail.telecomitalia.it. [79.56.50.241])
        by smtp.gmail.com with ESMTPSA id i6sm772158edx.46.2021.12.17.07.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 07:55:45 -0800 (PST)
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Richard Weinberger <richard@nod.at>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-mtd@lists.infradead.org
Subject: [RFC PATCH 0/4] Fix and improve gpmi nand on mx28
Date:   Fri, 17 Dec 2021 16:55:08 +0100
Message-Id: <20211217155512.1877408-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Starting from [1], the series fixes the timings setting of the gpmi
controller for the mx28 architecture, also adding support for fast
edo mode timings. The whole series has been heavily tested with the
mtd kernel test modules, and with repeated write cycles on nand.

The patches of the series were applied after applying patches [2]
and [3] which at the moment are already in nand-next.

[1] https://lore.kernel.org/r/20210702065350.209646-5-ebiggers@kernel.org
[2] 73b68455f8ac ("mtd: rawnand: gpmi: Remove explicit default gpmi clock setting for i.MX6")
[3] 7944f8346983 ("mtd: rawnand: gpmi: Add ERR007117 protection for nfc_apply_timings")


Dario Binacchi (3):
  mtd: rawnand: gpmi: support fast edo timings for mx28
  mtd: rawnand: gpmi: fix controller timings setting
  mtd: rawnand: gpmi: validate controller clock rate

Michael Trimarchi (1):
  clk: mxs: imx28: Reparent gpmi clk to ref_gpmi

 drivers/clk/mxs/clk-imx28.c                |  3 +
 drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c | 75 +++++++++++++++++-----
 2 files changed, 61 insertions(+), 17 deletions(-)

-- 
2.32.0

