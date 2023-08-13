Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C202EB64DD
	for <linux-clk@archiver.kernel.org>; Sun, 13 Aug 2023 13:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjHMN3z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Aug 2023 09:29:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbjHMN3y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Aug 2023 09:29:54 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 073481713
        for <linux-clk@vger.kernel.org>; Sun, 13 Aug 2023 06:29:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7E05662272
        for <linux-clk@vger.kernel.org>; Sun, 13 Aug 2023 13:29:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5617C433C8;
        Sun, 13 Aug 2023 13:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691933395;
        bh=ZZsPFbtEI+d7KwPstp7Cp4sfHUwluG7vLjmLy7GWpaU=;
        h=Date:From:To:Cc:Subject:From;
        b=KrUS1AGDcKb8CbI+1AEWp/52kIs3XqTXqPTbzUGyGO8DdMkbLnZvI7uTjZwEsFlIX
         Krz0iOk5KCM8vWENlJYO/j4vjSOj4K/68ArfYCRgLUunaYa0Ma80+Xyy75CRsHhsFO
         ePJX8RaQwilsn6IhgHtM69UwYgQZoPNkiBtpU1qa03OADg9i1ZIVh1179QhPZXSNl0
         mbcrlfYBO0OnFXdyUptTv/QmXewtXXO8BZP0MgHvFpudxFvCWqYyZJaCutfr3cXTCd
         kHLtNYymDly1fA7q+DtM0Dn5V9AEB9gycsrPr4+DXjsxMim6ZUi3H90KXiRBc30pRE
         79xB8kB38ELJw==
Received: by wens.tw (Postfix, from userid 1000)
        id 331915FB0F; Sun, 13 Aug 2023 21:29:53 +0800 (CST)
Date:   Sun, 13 Aug 2023 21:29:53 +0800
From:   Chen-Yu Tsai <wens@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock changes for 6.6 part 2
Message-ID: <ZNja0W8oQ0PLAc7l@wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Please pull another round of Allwinner clk patches for the 6.6 cycle.


Thanks
ChenYu


The following changes since commit 075d9ca5b4e17f84fd1c744a405e69ec743be7f0:

  clk: sunxi-ng: Modify mismatched function name (2023-07-31 00:52:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-6.6-2

for you to fetch changes up to a69f9463397e56666b113eebb2e99956aacf6929:

  clk: sunxi-ng: nkm: Prefer current parent rate (2023-08-09 23:41:44 +0800)

----------------------------------------------------------------
Allwinner clock changes for 6.6 part 2

- Parameter name correction for ccu_nkm_round_rate()
- Implement CLK_SET_RATE_PARENT for NKM clocks, i.e. consider alternative
  parent rates when determining clock rates
- Set CLK_SET_RATE_PARENT for A64 pll-mipi
- Support finding closest (as opposed to closest but not higher) clock
  rate for NM, NKM, mux and div type clocks, as use it for A64
  pll-video0
- Prefer current parent rate if able to generate ideal clock rate for
  NKM clocks

----------------------------------------------------------------
Frank Oltmanns (11):
      clk: sunxi-ng: nkm: Use correct parameter name for parent HW
      clk: sunxi-ng: nkm: consider alternative parent rates when determining rate
      clk: sunxi-ng: a64: allow pll-mipi to set parent's rate
      clk: sunxi-ng: Add feature to find closest rate
      clk: sunxi-ng: Add helper function to find closest rate
      clk: sunxi-ng: nm: Support finding closest rate
      clk: sunxi-ng: nkm: Support finding closest rate
      clk: sunxi-ng: mux: Support finding closest rate
      clk: sunxi-ng: div: Support finding closest rate
      clk: sunxi-ng: a64: select closest rate for pll-video0
      clk: sunxi-ng: nkm: Prefer current parent rate

 drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 41 ++++++++++++--------------
 drivers/clk/sunxi-ng/ccu_common.c     | 12 ++++++++
 drivers/clk/sunxi-ng/ccu_common.h     |  6 ++++
 drivers/clk/sunxi-ng/ccu_div.h        | 30 +++++++++++++++++++
 drivers/clk/sunxi-ng/ccu_mux.c        | 15 ++++++++--
 drivers/clk/sunxi-ng/ccu_mux.h        | 38 +++++++++++++++++-------
 drivers/clk/sunxi-ng/ccu_nkm.c        | 55 ++++++++++++++++++++++++++++++-----
 drivers/clk/sunxi-ng/ccu_nm.c         | 13 ++++-----
 drivers/clk/sunxi-ng/ccu_nm.h         | 48 ++++++++++++++++++++++++++++--
 9 files changed, 204 insertions(+), 54 deletions(-)
