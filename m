Return-Path: <SRS0=m775=ND=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A452C7112C
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 152372081B
	for <linux-clk@archiver.kernel.org>; Tue, 23 Oct 2018 11:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 152372081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728053AbeJWTaU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Oct 2018 15:30:20 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:38005 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727953AbeJWTaT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Oct 2018 15:30:19 -0400
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAfQe-1gLYMp0mpE-00B5xi; Tue, 23 Oct 2018 13:06:55 +0200
Received: from localhost.localdomain ([37.4.249.153]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MAfQe-1gLYMp0mpE-00B5xi; Tue, 23 Oct 2018 13:06:55 +0200
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Florian Meier <florian.meier@koalo.de>,
        Chris Boot <bootc@bootc.net>,
        Martin Sperl <kernel@martin.sperl.org>,
        Eric Anholt <eric@anholt.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-clk@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH 0/3] Fix MODULE_LICENSE of bcm2835 drivers
Date:   Tue, 23 Oct 2018 13:06:05 +0200
Message-Id: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:a8qxx3QLYSAYUQLkDtBK4LntbHfu15+noVBNlJ7n4VMr42nhq3e
 RipN3oH9vXYrR0QMzriGhUUYFhSmB4FZVvYNj/R5eRo/WWSrLm/jM65U0YmEiPhezMnrDXL
 MwKKkdOWuA8g3iEumatlAbZHxCME+3RUUYZ29ctnx5c0R18WFk6+iEwQm3pLvAA8CatOtVg
 bD0riDScjOjx1OOoSI64w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:hWfoK6jT/F4=:Vq6YK83IQjTzZW3cV6lxfW
 /+mDnyV1WbaGKaiuVCalhMFtF5pq3JSHDSV0VTmv26J6F0DnOSlD5WjHMfaRuXF10bXaSfP6e
 roQc2KJgp32p5uQ7yn7qnpW2tRlYpRysVQpfkDv2qJyjY7HVq+knYBGVohP4x4Wux1iwNnjyq
 u3GiN9+YWR4P7AS6vK6xS4lAFbQT2q1WRsePcscBtURNAmQsEJmVRbRfQinod/BZt5UGe+/yb
 H3u6bJSwIYkNEIX8gtUc+IJy4mZnA8bzfAaRAn2ENeyeAvAlmVH+RA91bNLCyZ2uyo6fkd2P3
 A0ij7VliEKKC0iQQq+xJ9+9Y7oBQhVzfffDX/qtqWhE05cK6X44oh1LUh2Zo4A8p5wTw8qNZ9
 625J1MRoGXUruwlUy78/cF/84gPNLfipnE2YOmoEyKSPhMl/cy+I+4kC3K/ViNoirKLA7Du14
 EtEVTnKs9bYtnQRNgsZuRXNQf0IJCSe+Os6tEFLw4BiUYcpAJkAgDY8jY0JzidPL7zcy31cHV
 Y1CdCIoNJGjFfr2VW9c7pfzlPmBXRExjcHsWdHkqWmL6hMMx7898G5qaXeFZFDo8COemHIkOA
 qqRlFjBcogLJ4qkXq3yD3qlVjseGUeVTtCr0N47TogD0HjDZFw5nw1d6S3oP0S1taQJzHmdL1
 Hz2aCKKnlxIZti+iFoOw7yPuF+/NSMMeuxttrH9dT0No2kGxL8WALQF/DJNxcZC6xjbc=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

In preparation of a treewide switch of all bcm2835 drivers to SPDX tags,
we need to make sure that the license text and MODULE_LICENSE matches.

This series starts sooner than usual to have more time to collect the authors
ACK.

Stefan Wahren (3):
  clk: bcm2835: make license text and module license match
  dma: bcm2835: make license text and module license match
  spi: bcm2835: make license text and module license match

 drivers/clk/bcm/clk-bcm2835-aux.c | 2 +-
 drivers/clk/bcm/clk-bcm2835.c     | 2 +-
 drivers/dma/bcm2835-dma.c         | 2 +-
 drivers/spi/spi-bcm2835.c         | 2 +-
 drivers/spi/spi-bcm2835aux.c      | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
2.7.4

