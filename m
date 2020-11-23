Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676D5C56202
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 23D8820717
	for <linux-clk@archiver.kernel.org>; Mon, 23 Nov 2020 16:38:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SxLSwWWi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732890AbgKWQiS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Nov 2020 11:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732545AbgKWQiR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Nov 2020 11:38:17 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5449CC0613CF
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:17 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id m6so19217627wrg.7
        for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2020 08:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWoVY3ymzk4cWTn4v1bXh+Sdx2khkGvdmAYTQ5FaBbQ=;
        b=SxLSwWWikSEHrkcswd89DLnmpGU0XvkZ4As0oJ6nDX4yXVtzmohXimFSlhYvIZx6eT
         DdkRfxY0QSpesU+aedtenhi7zp7OZlNYlrxVYvEEnonOqfwBtgUwHvdWvDZu5yJ6lJYU
         5OcKgqup/6Ci+DmbTdcO8VnzLF5zRy9Onrn48R7O0/jNBpQzpEidn2KTdwvnxOlIuo4R
         aLG89aQtiKToEimH91cAjypIMKgHZnREw7OESaJJUkjVKWgt07nVybKpRu2tZ9RPAqbv
         QgczmFlfg/AFkryP0aQJk5FgggPsQveYH6uzZkTkt6Kq0+1P1oYMd99nImv7gBdZUlFx
         8PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nWoVY3ymzk4cWTn4v1bXh+Sdx2khkGvdmAYTQ5FaBbQ=;
        b=o2koAc0i+kl43rs+EJA1DlTSZwCYPJCdhz27wUZRa0Zea6bcT4M2wTZ99XZu/P6jij
         NSV+wWlpw188e5aHFurzysMs3IvNRdQa+Q+/u43E9gjwrLHEDA+Vrud/11SX6ksK69JC
         qY8EOpuCaYb9wiSekpM2erjhl7QfgfnGzsajEIVXmxorbn73Oyny2ljAANf3IpNnLime
         q+C4YYImA+tv5s/yqQH6PaQ3kF3LvoyKtdfXqaMvMQNQCzc5+wngmaJW39AZvYIWd0VQ
         LB4sC4FtalDjQL7OAOBCxVL6ll62n2BNafcJMRooItsr8+vQwLRt0WQsG/tFS+LuRjex
         NwvA==
X-Gm-Message-State: AOAM531A7lgcZj9bArFhwJ6z+bJqONl0Sje5FdTWxsYUjPNpGXozUBqo
        krza8bQKBHpt2vPkaTikC9N1P4IKqcGHglcP
X-Google-Smtp-Source: ABdhPJwPUVxyobNEfXOdvktyz0fszKkrJa0DxbBhWMphOi5LtCs4uDIpZ6d6t6TRxess5meOoBwYOw==
X-Received: by 2002:adf:c147:: with SMTP id w7mr611048wre.60.1606149495821;
        Mon, 23 Nov 2020 08:38:15 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:9541:d2fd:3a68:67ae])
        by smtp.gmail.com with ESMTPSA id l3sm19566386wmf.0.2020.11.23.08.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 08:38:15 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 0/2] clk: meson: g12a: add MIPI DSI Host Pixel Clock
Date:   Mon, 23 Nov 2020 17:38:09 +0100
Message-Id: <20201123163811.353444-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This serie adss the MIPI DSI Host Pixel Clock used to feed the DSI pixel
clock to the DSI Host controller.

Unlike the AXG SoC, the DSI Pixel Clock has a supplementary mux, divider and gate
stage before feeding the pixel clock to the MIPI DSI Host controller.

Neil Armstrong (2):
  dt-bindings: clk: g12a-clkc: add DSI Pixel clock bindings
  clk: meson: g12a: add MIPI DSI Host Pixel Clock

 drivers/clk/meson/g12a.c              | 72 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 +-
 include/dt-bindings/clock/g12a-clkc.h |  2 +
 3 files changed, 76 insertions(+), 1 deletion(-)

-- 
2.25.1

