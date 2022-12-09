Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048E6C04FDE
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 15:30:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229808AbiLIPaZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 10:30:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbiLIPaX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 10:30:23 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4649A8DBF8
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 07:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1670599761;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=sVPp+RXXIuwbJ/P+sgTaSUNvxWcy+w6cewpJQQsBYQM=;
        b=IBsZ/TmpTqrKh1fWpZMcpiYAAy++L/tjM/N/rsuhl0XtK5s7dq/3wCGdpzE/WZzUOgcw70
        mrYbY8ck6a1LJpbk2k8k5skh11Woso+VVAj2efxEltPVvB3Wo+s1YqwAh3tOfbqVswVG89
        6FCA82pnKA8jDoLUjXuii2jnToE1lj0=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-307-PQ2Ukl-tMYKhLcxIR3aGjg-1; Fri, 09 Dec 2022 10:29:20 -0500
X-MC-Unique: PQ2Ukl-tMYKhLcxIR3aGjg-1
Received: by mail-vs1-f70.google.com with SMTP id m125-20020a672683000000b003af413a8263so1332364vsm.17
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 07:29:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVPp+RXXIuwbJ/P+sgTaSUNvxWcy+w6cewpJQQsBYQM=;
        b=tRRM3xHALXp4pzpff3cUSfdGYOw86DUAVgCkqT9Lr+lRq36rq7J7L/HHU1ydlNmDh/
         VXRMCGz8UBwWNEcYtx+D4gj18TgN9q/JI4bb0wd2Ekfc734vaPUluCxEYKpBgnU51Jp7
         +cs3WnwJ2QgDKby6CXydTYFLkdVFJL5eifC38/jJXbHofm79cknQOdO/WS4TE1G+/s4I
         nBLufWKullat8KcHICy6jZBh9NBrvnOar6V705IZajs7BE5ot1lV5L0eM3UzsglESh6k
         twPjMaN0hA+vCSkx8jdXXhhVEo7R4+WGLELUrcfkVCJz2SPu8xBvYWZ2m1iz9uaCiHFm
         0Sgg==
X-Gm-Message-State: ANoB5plKS+xm+Gg1RKn/ts+tFidoUfkuyUQ209TIWIjbaPqmw6oVmKax
        EZgVtzEeZuEvhRobmHZRG5SWH0ZhsFVXwd3mPQcB7kHoKbC4P62UsHCSAeYyLOfhScTqkCoAFBG
        p3uLbFFz4mHharLRu0CQ=
X-Received: by 2002:a05:6102:f99:b0:3b3:1e2:c5f2 with SMTP id e25-20020a0561020f9900b003b301e2c5f2mr3544213vsv.31.1670599759600;
        Fri, 09 Dec 2022 07:29:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FrbPYIIxuCxO4nQrzK56aiDCnSJWtvhAQan70ptTMMQsJ/4gG2VIbKs5PYDJtkupv71q1PQ==
X-Received: by 2002:a05:6102:f99:b0:3b3:1e2:c5f2 with SMTP id e25-20020a0561020f9900b003b301e2c5f2mr3544188vsv.31.1670599759371;
        Fri, 09 Dec 2022 07:29:19 -0800 (PST)
Received: from klayman.redhat.com (net-2-34-28-158.cust.vodafonedsl.it. [2.34.28.158])
        by smtp.gmail.com with ESMTPSA id dt26-20020a05620a479a00b006fbf88667bcsm29484qkb.77.2022.12.09.07.29.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Dec 2022 07:29:18 -0800 (PST)
From:   Marco Pagani <marpagan@redhat.com>
To:     Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Marco Pagani <marpagan@redhat.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] clk: socfpga: use of_clk_add_hw_provider and improve error handling
Date:   Fri,  9 Dec 2022 16:29:07 +0100
Message-Id: <20221209152913.1335068-1-marpagan@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch set improves error handling and replaces the deprecated
of_clk_add_provider() function with of_clk_add_hw_provider() in the
Intel SoC-FPGA family clock drivers.

The patch set is based on top of the patch: "Fix memory leak in
socfpga_gate_init()" to avoid a conflict.

https://lore.kernel.org/all/20221123031622.63171-1-xiujianfeng@huawei.com/

Marco Pagani (6):
  clk: socfpga: use of_clk_add_hw_provider and improve error handling
  clk: socfpga: arria10: use of_clk_add_hw_provider and improve error
    handling
  clk: socfpga: use of_clk_add_hw_provider and improve error handling
  clk: socfpga: arria10: use of_clk_add_hw_provider and improve error
    handling
  clk: socfpga: use of_clk_add_hw_provider and improve error handling
  clk: socfpga: arria10: use of_clk_add_hw_provider and improve error
    handling

 drivers/clk/socfpga/clk-gate-a10.c   | 26 +++++++++++++++------
 drivers/clk/socfpga/clk-gate.c       | 35 +++++++++++++++++-----------
 drivers/clk/socfpga/clk-periph-a10.c | 22 ++++++++++-------
 drivers/clk/socfpga/clk-periph.c     | 26 ++++++++++++++++-----
 drivers/clk/socfpga/clk-pll-a10.c    | 30 +++++++++++++++++-------
 drivers/clk/socfpga/clk-pll.c        | 32 +++++++++++++++++--------
 6 files changed, 118 insertions(+), 53 deletions(-)

-- 
2.38.1

