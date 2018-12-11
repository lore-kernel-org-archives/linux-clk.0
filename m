Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7023DC5CFFE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 19:58:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E89320870
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 19:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E89320870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726136AbeLKT63 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 14:58:29 -0500
Received: from gloria.sntech.de ([185.11.138.130]:46870 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726125AbeLKT63 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 11 Dec 2018 14:58:29 -0500
Received: from p5b127a5a.dip0.t-ipconnect.de ([91.18.122.90] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gWoAl-0008B2-FW; Tue, 11 Dec 2018 20:58:27 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.21
Date:   Tue, 11 Dec 2018 20:58:26 +0100
Message-ID: <4187870.lCvQibHAte@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

looks I can re-use my introduction from 4.20 - no big changes again this
time. Some minor clock register fixes, a new critical clock and a new
clock dt-export.

So please pull.


Thanks
Heiko


The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.21-rockchip-clk-1

for you to fetch changes up to d0618247a80f0c1c5a522b93888f20d8f034ec09:

  clk: rockchip: add clock-id to gate of ACODEC for rk3328 (2018-11-26 14:22:12 +0100)

----------------------------------------------------------------
Clock register fixes for rk3188 and rk3328 one new critical clock
for rk3188 and a fixed clock id (double used number) + a new one
for rk3328.

----------------------------------------------------------------
Finley Xiao (1):
      clk: rockchip: fix rk3188 sclk_smc gate data

Heiko Stuebner (2):
      clk: rockchip: fix rk3188 sclk_mac_lbtest parameter ordering
      Merge branch 'v4.21-shared/clkids' into v4.21-clk/next

Johan Jonker (1):
      clk: rockchip: fix typo in rk3188 spdif_frac parent

Katsuhiro Suzuki (4):
      clk: rockchip: fix I2S1 clock gate register for rk3328
      clk: rockchip: fix ID of 8ch clock of I2S1 for rk3328
      clk: rockchip: add clock ID of ACODEC for rk3328
      clk: rockchip: add clock-id to gate of ACODEC for rk3328

Mark Yao (1):
      clk: rockchip: make rk3188 hclk_vio_bus critical

 drivers/clk/rockchip/clk-rk3188.c      | 13 +++++++------
 drivers/clk/rockchip/clk-rk3328.c      |  4 ++--
 include/dt-bindings/clock/rk3328-cru.h |  3 ++-
 3 files changed, 11 insertions(+), 9 deletions(-)



