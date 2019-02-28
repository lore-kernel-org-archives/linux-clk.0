Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C68C10F06
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 20:09:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 352BB2084F
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 20:09:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387554AbfB1UJA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 15:09:00 -0500
Received: from mailoutvs35.siol.net ([185.57.226.226]:40920 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2387552AbfB1UJA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Feb 2019 15:09:00 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTP id 6993E5213F9;
        Thu, 28 Feb 2019 21:03:38 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id 7wfP5sypCxRY; Thu, 28 Feb 2019 21:03:38 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Postfix) with ESMTPS id 0A6D852222D;
        Thu, 28 Feb 2019 21:03:38 +0100 (CET)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net [86.58.52.202])
        (Authenticated sender: 031275009)
        by mail.siol.net (Postfix) with ESMTPSA id BDE5B5213F9;
        Thu, 28 Feb 2019 21:03:36 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     maxime.ripard@bootlin.com, wens@csie.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: [PATCH 0/3] drm/sun4i: DE2/DE3 improvements
Date:   Thu, 28 Feb 2019 21:03:26 +0100
Message-Id: <20190228200329.11128-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DE2 and DE3 VI channels support coarse scaling to overcome VI scaler
limitations. That is especially useful for downscaling big planes, for
example 4K to 1080p.

Following patches were tested on H3 and A64 with 4K video playback on
1080p monitor. Without them, picture was mangled.

Please take a look.

Best regards,
Jernej

Jernej Skrabec (3):
  clk: sunxi-ng: Allow DE clock to set parent rate
  drm/sun4i: Add VI scaler line size quirk for DE2/DE3
  drm/sun4i: Improve VI scaling for DE2/DE3

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c  |  3 +-
 drivers/clk/sunxi-ng/ccu-sun50i-h6.c   |  2 +-
 drivers/clk/sunxi-ng/ccu-sun8i-v3s.c   |  3 +-
 drivers/gpu/drm/sun4i/sun8i_mixer.c    |  9 +++++
 drivers/gpu/drm/sun4i/sun8i_mixer.h    |  2 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 54 ++++++++++++++++++++++++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.h | 11 ++++++
 7 files changed, 78 insertions(+), 6 deletions(-)

--=20
2.20.1

