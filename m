Return-Path: <SRS0=Lb92=5B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB2AC10DCE
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 00:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 61441206B1
	for <linux-clk@archiver.kernel.org>; Mon, 16 Mar 2020 00:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1584318165;
	bh=9pwIEDU5WcVmzfi77kGSmrUFk6mxDJmB8thzfaHTIKE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0ObDPbNEy3xl5a/gv1rOG9DfhYiCTuRxlmVqXcv1T6iobE/ExheoBGqAN4Ju03DXq
	 2sZQIALZyKxVR50U4Sk2SuYt8FHCBRisUu+cPh8Wq43LHyR4RWosT5AprrU2K2hJS2
	 xJZJ1B1ziaXQktSFAbrit2FfFm0ymLmi0yY6WOu4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729220AbgCPAWp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Mar 2020 20:22:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:48982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729182AbgCPAWo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 15 Mar 2020 20:22:44 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A382C205ED;
        Mon, 16 Mar 2020 00:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584318164;
        bh=9pwIEDU5WcVmzfi77kGSmrUFk6mxDJmB8thzfaHTIKE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cpvivAdVkIgSfiuzH4xmlNKpXyCwjWvMsXzNWo725j8tsFRRVZhYR9YYVx5XYJz0M
         fqWiYMXOlFaJMXFgGlKs2YvIsGZl7zooXQCe3UQwlG9LijLuIHeE6wXu09OEbp3mrZ
         9M8pmQTm+3i9a2njQtO7DsoI43ZZkSmr4wHVxt6A=
Date:   Mon, 16 Mar 2020 08:22:40 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] i.MX clock fixes for 5.6, round 2
Message-ID: <20200316002239.GK29269@dragon>
References: <20200224121322.GI27688@dragon>
 <158352907905.174340.14348638942004736998@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <158352907905.174340.14348638942004736998@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Mar 06, 2020 at 01:11:19PM -0800, Stephen Boyd wrote:
> Quoting Shawn Guo (2020-02-24 04:13:23)
> > The following changes since commit 5eb40257047fb11085d582b7b9ccd0bffe900726:
> > 
> >   clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)
> > 
> > are available in the Git repository at:
> > 
> >   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-fixes-5.6-2
> > 
> > for you to fetch changes up to 6fb9006abe37e44afaed4f2a5fd3a247a815bb8d:
> > 
> >   clk: imx8mp: Correct the enet_qos parent clock (2020-02-24 15:38:03 +0800)
> > 
> > ----------------------------------------------------------------
> > i.MX clock fixes for 5.6, round 2:
> > 
> >  - A couple of fixes on i.MX8MP clock driver to correct HDMI_AXI and
> >    ENET_QOS_ROOT parent clock.
> >  - A couple of fixes on clk-scu driver to ensure that messages sent to
> >    i.MX System Controller are 4 bytes aligned.
> > 
> > ----------------------------------------------------------------
> > Anson Huang (1):
> >       clk: imx8mp: Correct IMX8MP_CLK_HDMI_AXI clock parent
> > 
> > Fugang Duan (1):
> >       clk: imx8mp: Correct the enet_qos parent clock
> > 
> > Leonard Crestez (2):
> >       clk: imx: Align imx sc clock msg structs to 4
> >       clk: imx: Align imx sc clock parent msg structs to 4
> 
> Can you resend without these last two? I don't know what's going on with
> that thread.

Done. Please consider to pull, thanks!

The following changes since commit 5eb40257047fb11085d582b7b9ccd0bffe900726:

  clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-fixes-5.6-2

for you to fetch changes up to 857c9d31f59f0c0e6117518452ca54883e47d859:

  clk: imx8mp: Correct the enet_qos parent clock (2020-03-16 08:18:20 +0800)

----------------------------------------------------------------
i.MX clock fixes for 5.6, round 2:

 - A couple of fixes on i.MX8MP clock driver to correct HDMI_AXI and
   ENET_QOS_ROOT parent clock.

----------------------------------------------------------------
Anson Huang (1):
      clk: imx8mp: Correct IMX8MP_CLK_HDMI_AXI clock parent

Fugang Duan (1):
      clk: imx8mp: Correct the enet_qos parent clock

 drivers/clk/imx/clk-imx8mp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
