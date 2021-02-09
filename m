Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08836C433DB
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 00:29:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C68D764E50
	for <linux-clk@archiver.kernel.org>; Wed, 10 Feb 2021 00:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233683AbhBJA3C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Feb 2021 19:29:02 -0500
Received: from mailoutvs18.siol.net ([185.57.226.209]:33226 "EHLO
        mail.siol.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S234576AbhBJABx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Feb 2021 19:01:53 -0500
Received: from localhost (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTP id 050A3523405;
        Tue,  9 Feb 2021 18:59:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
        by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id kqUDlYvveiwt; Tue,  9 Feb 2021 18:59:05 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
        by mail.siol.net (Zimbra) with ESMTPS id A0A3D5231C9;
        Tue,  9 Feb 2021 18:59:05 +0100 (CET)
Received: from kista.localdomain (cpe-86-58-58-53.static.triera.net [86.58.58.53])
        (Authenticated sender: 031275009)
        by mail.siol.net (Zimbra) with ESMTPSA id 9540D523182;
        Tue,  9 Feb 2021 18:59:03 +0100 (CET)
From:   Jernej Skrabec <jernej.skrabec@siol.net>
To:     mripard@kernel.org, wens@csie.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, airlied@linux.ie,
        daniel@ffwll.ch, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com
Subject: [PATCH v3 0/5] sunxi: fix H6 HDMI related issues
Date:   Tue,  9 Feb 2021 18:58:55 +0100
Message-Id: <20210209175900.7092-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Over the year I got plenty of reports of troubles with H6 HDMI signal.
Sometimes monitor flickers, sometimes there was no image at all and
sometimes it didn't play well with AVR.

It turns out there are multiple issues. Patch 1 fixes clock issue,
which didn't adjust parent rate, even if it is allowed to do so. Patch 2
adds polarity config in tcon1. This is seemingly not needed for pre-HDMI2
controllers, although BSP drivers set it accordingly every time. It
turns out that HDMI2 controllers often don't work with monitors if
polarity is not set correctly. Patch 3 always set clock rate for HDMI
controller. Patch 4 fixes H6 HDMI PHY settings. Patch 5 fixes comment and
clock rate limit (wrong reasoning).

Please take a look.

Best regards,
Jernej

Changes from v2:
- use clk_hw_can_set_rate_parent() directly instead of checking flags
Changes from v1:
- collected Chen-Yu tags (except on replaced patch 4)
- Added some comments in patch 2
- Replaced patch 4 (see commit log for explanation)

Jernej Skrabec (5):
  clk: sunxi-ng: mp: fix parent rate change flag check
  drm/sun4i: tcon: set sync polarity for tcon1 channel
  drm/sun4i: dw-hdmi: always set clock rate
  drm/sun4i: Fix H6 HDMI PHY configuration
  drm/sun4i: dw-hdmi: Fix max. frequency for H6

 drivers/clk/sunxi-ng/ccu_mp.c          |  2 +-
 drivers/gpu/drm/sun4i/sun4i_tcon.c     | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h     |  6 ++++++
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c  | 10 +++-------
 drivers/gpu/drm/sun4i/sun8i_dw_hdmi.h  |  1 -
 drivers/gpu/drm/sun4i/sun8i_hdmi_phy.c | 26 +++++++++-----------------
 6 files changed, 44 insertions(+), 26 deletions(-)

--
2.30.0

