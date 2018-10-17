Return-Path: <SRS0=5IOi=M5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F91EECDE32
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 22:24:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EC4A12145D
	for <linux-clk@archiver.kernel.org>; Wed, 17 Oct 2018 22:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4A12145D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727245AbeJRGWd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Oct 2018 02:22:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:56252 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725918AbeJRGWd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Oct 2018 02:22:33 -0400
Received: from ip5f5a8a55.dynamic.kabel-deutschland.de ([95.90.138.85] helo=phil.localnet)
        by gloria.sntech.de with esmtpsa (TLS1.0:ECDHE_RSA_AES_256_CBC_SHA1:256)
        (Exim 4.89)
        (envelope-from <heiko@sntech.de>)
        id 1gCuFC-0006L7-50; Thu, 18 Oct 2018 00:24:46 +0200
From:   Heiko Stuebner <heiko@sntech.de>
To:     Stephen Boyd <sboyd@codeaurora.org>, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [GIT PULL] Rockchip clock updates for 4.20
Date:   Thu, 18 Oct 2018 00:24:45 +0200
Message-ID: <2902149.RM7SpLEE3J@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

no big changes again this time. Mainly 2 fixes and a bit of housekeeping.
So if it's not too late, please pull


Thanks
Heiko


The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v4.20-rockchip-clk1

for you to fetch changes up to 665636b2940d0897c4130253467f5e8c42eea392:

  clk: rockchip: Fix static checker warning in rockchip_ddrclk_get_parent call (2018-10-17 15:12:51 +0200)

----------------------------------------------------------------
Fixes for static checker warning and a wrong shift value for the mmc
on rk3328, as well as setting a hdmi-id on rk3066 for a later driver
for the hdmi encoder on it and some adapted rk3288 pll rates to support
more and better hdmi rates.

----------------------------------------------------------------
Enric Balletbo i Serra (1):
      clk: rockchip: Fix static checker warning in rockchip_ddrclk_get_parent call

Heiko Stuebner (2):
      clk: rockchip: add clock-id for HCLK_HDMI on rk3066
      clk: rockchip: use the newly added clock-id for hdmi on RK3066

Urja Rannikko (1):
      clk: rockchip: improve rk3288 pll rates for better hdmi output

Ziyuan Xu (1):
      clk: rockchip: fix wrong mmc sample phase shift for rk3328

 drivers/clk/rockchip/clk-ddr.c                |  4 ----
 drivers/clk/rockchip/clk-rk3188.c             |  2 +-
 drivers/clk/rockchip/clk-rk3288.c             | 29 +++++++++++++++++++++++----
 drivers/clk/rockchip/clk-rk3328.c             |  8 ++++----
 include/dt-bindings/clock/rk3188-cru-common.h |  3 ++-
 5 files changed, 32 insertions(+), 14 deletions(-)



