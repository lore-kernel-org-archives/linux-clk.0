Return-Path: <SRS0=KEZg=WY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D8B7C3A5A1
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1423922CF5
	for <linux-clk@archiver.kernel.org>; Wed, 28 Aug 2019 10:20:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VEQ9UHsx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbfH1KU2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Aug 2019 06:20:28 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41814 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726583AbfH1KU2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Aug 2019 06:20:28 -0400
Received: by mail-wr1-f65.google.com with SMTP id j16so1898672wrr.8
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2019 03:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJuPufRk4NddEccfMO2AcsgQW95hQasuioSyHjZbBLs=;
        b=VEQ9UHsxmO2h4mup5tc3ZBrPw1wkznrdyeCrjxWN1wYa5yg93E9cY6JGZqbebFao6u
         ngrkEv2+JaVsLNjBT6oNuC2qsU1aCSiWzCgT9XRz2/XPuIAGS36NC5E8gFxjvsXUJ9Up
         +tU5qDIFiVTX68HkG5OhtnXkdNJmt3DBWu9c3cfsH7ylo2I9+IhTGXb8F5ToQnIRbI2A
         sc+n1w252wgg4C66jBPW3mRm0/Y1ZRYMBbgdOYB5oRfGxTYVDctsu65ZRVZxf7gS19OQ
         9jnEmxzHrIHBoKwJDj5AIfpU9hGBe4URaWjPCbIdn+U6klbNH9XBJfpqTP1Ll98cUBKJ
         T/Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oJuPufRk4NddEccfMO2AcsgQW95hQasuioSyHjZbBLs=;
        b=fw5aC8nTumMJkbIiN9cf+14r/6PHo7LbCrq4xn+0YakNqbVMClWxOOKQQE1VvDAf6G
         csegJMUbZlkyDQKrcIBiCXrSRRfHuAcV5MEM3Aj1nq5JpJAKBHBxnQj1pVvbZkSOmIcV
         L5/++miydRiTW3ZBjGkfh7SieHWfDGYC0R+QQrTTConmIS5AfOof99xdNooFRnhNKsoY
         YT/e/lgbqC8ooToEyHI6pJandHXVfN8SMTHrqArb8QTYSDrQG/VQrvYQg68qUjl9n17t
         4Fnv1ohCHyxhjJ6CziINzEe3HDZpqc59QWDbeRHCIPWOwUVjj3m4g0XXIKH1tAzaUsba
         ayxQ==
X-Gm-Message-State: APjAAAXoWHCBRYnlfDEr4gSfFUoYiLYVqzeimYDV2HOQ3JsfZI3iZ+A3
        4UX/l3cLhhlFOXohlOmt4RXoTQ==
X-Google-Smtp-Source: APXvYqyn/t085HUPCFFEsM81PywQgkFHefkdGD7XIbSNGVUTzAq3NhJnwttlg0umVJ71mvmWEnieoA==
X-Received: by 2002:a5d:45cb:: with SMTP id b11mr3839624wrs.117.1566987627024;
        Wed, 28 Aug 2019 03:20:27 -0700 (PDT)
Received: from starbuck.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id k9sm2583522wrq.15.2019.08.28.03.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 03:20:26 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org
Subject: [PATCH RFC 0/5] clk: let clock claim resources
Date:   Wed, 28 Aug 2019 12:20:07 +0200
Message-Id: <20190828102012.4493-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset is a follow up on this pinky swear [0].
Its purpose is:
 * Clarify the acceptable use of clk_ops init() callback
 * Let the init() callback return an error code in case anything
   fail.
 * Add the terminate() counter part of of init() to release the
   resources which may have been claimed in init()
 * Add a per-clock placeholder for clock runtime data in the clock
   core. This may be useful to init() and save/restore_context()

It was initially suggested to rename these callbacks register/deregister().
But, 'register' is reserved word of C ... :P

In the end, after discussing with Mike, I decided to keep the name "init".
It does not feel that important to change this. I really don't mind
changing this if you feel differently and have a suggestion.

The last patch in this series is just an example of how the above can be
used.

This is sent as an RFC to get the discussion going without bothering too
many people.

In the final series, Patch 2 and 3 will probably be squashed and series
sent to a wider audience.

[0]: https://lkml.kernel.org/r/CAEG3pNB-143Pr_xCTPj=tURhpiTiJqi61xfDGDVdU7zG5H-2tA@mail.gmail.com

Jerome Brunet (5):
  clk: actually call the clock init before any other callback of the
    clock
  clk: let init callback return an error code
  clk: add terminate callback to clk_ops
  clk: add placeholder for clock internal data
  clk: meson: sclk-div: use runtime data

 drivers/clk/clk.c                     | 51 ++++++++++++++-----
 drivers/clk/meson/clk-mpll.c          |  4 +-
 drivers/clk/meson/clk-phase.c         |  4 +-
 drivers/clk/meson/clk-pll.c           |  4 +-
 drivers/clk/meson/sclk-div.c          | 72 +++++++++++++++++++--------
 drivers/clk/meson/sclk-div.h          |  2 -
 drivers/clk/microchip/clk-core.c      |  8 ++-
 drivers/clk/mmp/clk-frac.c            |  4 +-
 drivers/clk/mmp/clk-mix.c             |  4 +-
 drivers/clk/qcom/clk-hfpll.c          |  6 ++-
 drivers/clk/rockchip/clk-pll.c        | 28 +++++++----
 drivers/clk/ti/clock.h                |  2 +-
 drivers/clk/ti/clockdomain.c          |  8 +--
 drivers/net/phy/mdio-mux-meson-g12a.c |  4 +-
 include/linux/clk-provider.h          | 15 ++++--
 15 files changed, 154 insertions(+), 62 deletions(-)

-- 
2.21.0

