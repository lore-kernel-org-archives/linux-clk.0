Return-Path: <SRS0=kzU5=4M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A24BC35671
	for <linux-clk@archiver.kernel.org>; Mon, 24 Feb 2020 12:13:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4BDBC20838
	for <linux-clk@archiver.kernel.org>; Mon, 24 Feb 2020 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1582546410;
	bh=ApV+ZuqZ72hXmaU8CGD1X/PJNBSYz7PLCtpADUeovcw=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=I3Fjpf9111ynQEKfzbyRD5LY2hjMzQqWARIoV1cAFzRtECapZUNE89/g4B1wAKSMQ
	 VTSDhJIm7RMqoK/7dy/lun+lYB7m8kIlVE32zu6T7hF8I1dR8KP+5llATA7UjrMQ/y
	 0pG7LE3vSFlW/CxsO4zPDGr2rqSzZI9ztUtn2YrA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727252AbgBXMN3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Feb 2020 07:13:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727183AbgBXMN3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 24 Feb 2020 07:13:29 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A43D20732;
        Mon, 24 Feb 2020 12:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582546409;
        bh=ApV+ZuqZ72hXmaU8CGD1X/PJNBSYz7PLCtpADUeovcw=;
        h=Date:From:To:Cc:Subject:From;
        b=iCr+iesiJ+f2XrnrA6khCVi+ivZPS4vRZVt1kmhpQGWDLCYVv/KIoAJL6zqMZXTor
         H32csW66GoHle8XGg/P0nwKxJKa/5yRoCJ9i2wRR6lrGllubmdFlgI3WGlm5wUA5Sd
         suYuFRJWIihRb8r0sR4AcglocEHkz/DBc2dH3MHs=
Date:   Mon, 24 Feb 2020 20:13:23 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock fixes for 5.6, round 2
Message-ID: <20200224121322.GI27688@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 5eb40257047fb11085d582b7b9ccd0bffe900726:

  clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-fixes-5.6-2

for you to fetch changes up to 6fb9006abe37e44afaed4f2a5fd3a247a815bb8d:

  clk: imx8mp: Correct the enet_qos parent clock (2020-02-24 15:38:03 +0800)

----------------------------------------------------------------
i.MX clock fixes for 5.6, round 2:

 - A couple of fixes on i.MX8MP clock driver to correct HDMI_AXI and
   ENET_QOS_ROOT parent clock.
 - A couple of fixes on clk-scu driver to ensure that messages sent to
   i.MX System Controller are 4 bytes aligned.

----------------------------------------------------------------
Anson Huang (1):
      clk: imx8mp: Correct IMX8MP_CLK_HDMI_AXI clock parent

Fugang Duan (1):
      clk: imx8mp: Correct the enet_qos parent clock

Leonard Crestez (2):
      clk: imx: Align imx sc clock msg structs to 4
      clk: imx: Align imx sc clock parent msg structs to 4

 drivers/clk/imx/clk-imx8mp.c | 4 ++--
 drivers/clk/imx/clk-scu.c    | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
