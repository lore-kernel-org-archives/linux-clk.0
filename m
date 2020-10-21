Return-Path: <SRS0=09nf=D4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53CAC56201
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:38:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4823B22283
	for <linux-clk@archiver.kernel.org>; Wed, 21 Oct 2020 16:38:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="cusYKGkT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503019AbgJUQiy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Oct 2020 12:38:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2444301AbgJUQiy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Oct 2020 12:38:54 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B18DCC0613CF
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id z5so4166214ejw.7
        for <linux-clk@vger.kernel.org>; Wed, 21 Oct 2020 09:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEj2dtHf+HnkoupGy9xjTu6l00O4rrG2/m0FBk6LmZo=;
        b=cusYKGkTIwI9uDRArPoxsPYgtC0mWm56iG0865ZA3IhoHDIqFs/EAzX+zyGG/z3e/T
         RMVISkIpP2NTz/McTpiWynxFhelUGwWaDwRppi0BOqJRx/Gx+yJ1x146SW/k4JfdftKk
         lJ+Ri94ZaPq8sAmSrnw8tiBwf/Sk7l0piWFlMFR4pS+FG+woZoYuq62thqe2jSCkrRtv
         aM7GVbuERHoHFyn0DFlTGlv+RPVF2YZM+WrxZf0aScigWLVkUUtCVj94HpF6nQUzni2c
         g0h2wevwOQD2LIZsDhQmz9nOmuXYxJgEIuEeDA3QMeJbmAAHGDZH877TMYYLEQll1Of1
         U14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uEj2dtHf+HnkoupGy9xjTu6l00O4rrG2/m0FBk6LmZo=;
        b=BFIkNw2IKdwo5NpnkpRRzkcGKBY3ZUVdeV3WidzVTBKTOBwCgJRw54nyld3YmESIuH
         cmsR85rCeQT1Jp/koCeoxpRvsuCzDVItCkhKSFZda37PJlD29jwjWP1j1PEf2r4CHAYV
         9H2p4WW3EHuLpFEhKV3imYRcN2irOCvwJeE9y+CjBhDyW1E8Q2KJL2L/VXqDbo0y2dcY
         eOdls/TE9uXBQk4nCaOBk6FV/dfT3MSNOmTb7pQWQlhWAxQBuNsj7o3FkAGPFpfGAJut
         xijrI9hLZAfS86OPMO6z5q8ovTPUZO+Gbpfz8v+DPyC2gXNUEiDxLseUFFMQgh8F19Pm
         62Ug==
X-Gm-Message-State: AOAM533MXiWYyRHY8l4UA3wW9qXTS5Uj5oJmvFVEb0gEU2pTARlkGvKw
        DBHwALWAFIGwL3BRYVp+yj9Yhw==
X-Google-Smtp-Source: ABdhPJzxYoh8vi5BHrv2k+io/DSMYqitDUc10vHXq6uKSsyqTQW320C8E0qpi/qiJaROGdWmub+2lA==
X-Received: by 2002:a17:907:20b2:: with SMTP id pw18mr4225896ejb.159.1603298332372;
        Wed, 21 Oct 2020 09:38:52 -0700 (PDT)
Received: from starbuck.lan (82-65-169-74.subs.proxad.net. [82.65.169.74])
        by smtp.googlemail.com with ESMTPSA id f26sm2549747ejx.23.2020.10.21.09.38.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 09:38:51 -0700 (PDT)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 0/2] clk: add devm variant of clk_notifier_register
Date:   Wed, 21 Oct 2020 18:38:45 +0200
Message-Id: <20201021163847.595189-1-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patchset adds memory managed variant of clk_notifier_register and
a first usage of it the amlogic clock controller of the g12 SoC family.

Jerome Brunet (2):
  clk: add devm variant of clk_notifier_register
  clk: meson: g12: use devm variant to register notifiers

 drivers/clk/clk.c        | 36 ++++++++++++++++++++++++++++++++++++
 drivers/clk/meson/g12a.c | 34 ++++++++++++++++++++--------------
 include/linux/clk.h      | 18 ++++++++++++++++++
 3 files changed, 74 insertions(+), 14 deletions(-)

-- 
2.25.4

