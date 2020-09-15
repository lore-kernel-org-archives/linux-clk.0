Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8902CC433E2
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 00:46:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559A221973
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 00:46:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vnq12OZ8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbgIOM5v (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Sep 2020 08:57:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726492AbgIOMqD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Sep 2020 08:46:03 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17BE9C061788
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:45:59 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so3107904wrn.13
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2020 05:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUcUK8YA7xOYjNtjzxXPOPtmn9lpMNim28eyU9a7Hf4=;
        b=vnq12OZ8h+snAbmU97iIZz1Xs6BZApGeIO+pwz8ITYX8upAHSJfhj4ZI+YsVyDfd3t
         78y7H0Qi1P0lHHPn/CMTUbHSCT1uascuXBTiCv+E1xPSeRrOLgGltLj1G9V2aCXe8soZ
         /rNy2cpnLf6NjM5HZfoEp54Ra+pSLk/xaQvI6aGFFTpiwoBX3WiFVcw7b/AAwE78Xsjh
         JseJEkm65hME+gZKqdhLAeKhGN8A+PinC+RGE6WtYds9wZvUIt8Z9LHJf5VBdPGC6Wrm
         hxRF54lld9/K/YjwTC6ECTGJvis46Zk8sfS9pyyTNUJPFZFwIrgex+ljhrkhshLnEjKB
         6OuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PUcUK8YA7xOYjNtjzxXPOPtmn9lpMNim28eyU9a7Hf4=;
        b=TEp+sdR3/ZKtMSJUgMh12hODPmETn9m9Ahr3S582OFUTkQZtj0llpolZN2Ex/UnmLT
         FLg3AoTTBBAvwZ0tsK/6fQRUPdcPBe784QJ9VuNCpnyolDlfhUN0U57QLaYBmwHfjfEe
         feR/VIFbdG1wt6nHTLLdbK65gUoIHovW05aVcBHkusQ4EVtSbpPXCwO6JRBCOi3m8LCg
         deBykHOmfwfUanXTZLqCYhR/nSqhNV1XXMn9cscv85lTv1T3mX99x7Dh9Gz1AwCjesEO
         xrjVZZwxdlmZXJxcX6LqJNPhBJqExUr3VahZ9i2wYPvhyR4/nKA/PcI9izRuEFonfCrc
         VdIA==
X-Gm-Message-State: AOAM533YcFF/uzqDV9i10xN+CI/jA6/PCyA6bWv9aPEyhaRdXWNobTNh
        R4CD1gIOQBAdxCsKkLmCkgwbBg==
X-Google-Smtp-Source: ABdhPJxwMlDEHZh9fctKaT98W85S9FRLO1xXWLr+E4hFyfBsptLyDwy8SoxnjHKzdeZGkqN83g5/CA==
X-Received: by 2002:a5d:40c7:: with SMTP id b7mr21519638wrq.300.1600173956444;
        Tue, 15 Sep 2020 05:45:56 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
        by smtp.gmail.com with ESMTPSA id q8sm26548589wrx.79.2020.09.15.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 05:45:55 -0700 (PDT)
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     jbrunet@baylibre.com
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 0/4] clk: meson: axg: add clocks for MIPI-DSI support
Date:   Tue, 15 Sep 2020 14:45:49 +0200
Message-Id: <20200915124553.8056-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds the VPU & VAPB clocks along the MIPI DSI Host clock.

The clock scheme is based on the GXBB & G12A VPU clocks, with a different CTS
clock output used for MIPI-DSI.

Changes since v1 at [1]:
- update patch 3 commit message to reflect drm driver state
- added comments in patch 3 for clock specificities
- removed useless parents comments in patch 2
- fixed bad flags in patch 4
- removed holes in axg_vdin_meas_parent_data in patch 4

[1] https://lkml.kernel.org/r/20200907093810.6585-1-narmstrong@baylibre.com

Neil Armstrong (4):
  dt-bindings: clk: axg-clkc: add Video Clocks
  dt-bindings: clk: axg-clkc: add MIPI DSI Host clock binding
  clk: meson: axg: add Video Clocks
  clk: meson: axg: add MIPI DSI Host clock

 drivers/clk/meson/axg.c              | 819 +++++++++++++++++++++++++++
 drivers/clk/meson/axg.h              |  23 +-
 include/dt-bindings/clock/axg-clkc.h |  25 +
 3 files changed, 866 insertions(+), 1 deletion(-)

-- 
2.22.0

