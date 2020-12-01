Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEECBC64E7A
	for <linux-clk@archiver.kernel.org>; Tue,  1 Dec 2020 09:40:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48887206C0
	for <linux-clk@archiver.kernel.org>; Tue,  1 Dec 2020 09:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="RyQR14wd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726250AbgLAJkJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 1 Dec 2020 04:40:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:42124 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgLAJkJ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 1 Dec 2020 04:40:09 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BE27D2064C;
        Tue,  1 Dec 2020 09:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606815568;
        bh=NLdxmd2DaHHR4ewNFEdsHoDOzTXFO8YaIu4DsRu+Bfk=;
        h=Date:From:To:Cc:Subject:From;
        b=RyQR14wdaCGIuYNvXsFM9vKvfhQX7o/zMU9tafrzVviHJnsVkRVxtkAczZRWREGAF
         iROJnYWFMzr8stY8EDsjPayHH7NN95pDrQUSYKEawfbQms2q8yOhYlSiSMxaSXAhO4
         wrMbZpx6Uex7KsMleSsCGOzzgyrohl3K+39q32V0=
Date:   Tue, 1 Dec 2020 17:39:22 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock update for 5.11
Message-ID: <20201201093921.GX4072@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.11

for you to fetch changes up to 43d2479687c93ed9b93774ef9b46b37de5b3efcc:

  clk: imx: scu: remove the calling of device_is_bound (2020-11-30 21:53:03 +0800)

----------------------------------------------------------------
i.MX clock update for 5.11:

- A series from Abel Vesa to improve clk-gate2 driver and make it more
  flexible.
- A patch set from Dong Aisheng to add a new two cells binding for SCU
  clocks, so that IMX SCU based platforms like MX8QM and MX8QXP can be
  supported with SS (Subsystems).
- Drop of_match_ptr from of_device_id table for i.MX8 clock drivers, as
  they can only be probed from device tree.
- Other small cosmetic changes.

----------------------------------------------------------------
Abel Vesa (5):
      clk: imx: gate2: Remove the IMX_CLK_GATE2_SINGLE_BIT special case
      clk: imx: gate2: Keep the register writing in on place
      clk: imx: gate2: Check if clock is enabled against cgr_val
      clk: imx: gate2: Add cgr_mask for more flexible number of control bits
      clk: imx: gate2: Add locking in is_enabled op

Colin Ian King (1):
      clk: imx: remove redundant assignment to pointer np

Dong Aisheng (11):
      clk: imx: scu: add two cells binding support
      clk: imx: scu: bypass cpu power domains
      clk: imx: scu: allow scu clk to take device pointer
      clk: imx: scu: add runtime pm support
      clk: imx: scu: add suspend/resume support
      clk: imx: imx8qxp-lpcg: add parsing clocks from device tree
      clk: imx: lpcg: allow lpcg clk to take device pointer
      clk: imx: clk-imx8qxp-lpcg: add runtime pm support
      clk: imx: lpcg: add suspend/resume support
      clk: imx: scu: fix build break when compiled as modules
      clk: imx: scu: remove the calling of device_is_bound

Krzysztof Kozlowski (4):
      clk: imx8mm: drop of_match_ptr from of_device_id table
      clk: imx8mn: drop of_match_ptr from of_device_id table
      clk: imx8mp: drop of_match_ptr from of_device_id table
      clk: imx8mq: drop of_match_ptr from of_device_id table

Tom Rix (1):
      clk: imx: remove unneeded semicolon

Zou Wei (2):
      clk: imx: gate2: Remove unused variable ret
      clk: imx: scu: Make pd_np with static keyword

 drivers/clk/imx/clk-gate2.c        |  68 ++++++-----
 drivers/clk/imx/clk-imx8mm.c       |   2 +-
 drivers/clk/imx/clk-imx8mn.c       |   2 +-
 drivers/clk/imx/clk-imx8mp.c       |   4 +-
 drivers/clk/imx/clk-imx8mq.c       |   2 +-
 drivers/clk/imx/clk-imx8qxp-lpcg.c | 139 +++++++++++++++++++++++
 drivers/clk/imx/clk-imx8qxp.c      | 136 ++++++++++++----------
 drivers/clk/imx/clk-lpcg-scu.c     |  53 ++++++++-
 drivers/clk/imx/clk-pll14xx.c      |   2 +-
 drivers/clk/imx/clk-scu.c          | 227 ++++++++++++++++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.h          |  56 +++++++--
 drivers/clk/imx/clk.h              |  27 ++---
 12 files changed, 582 insertions(+), 136 deletions(-)
