Return-Path: <SRS0=CWv7=4F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12E4EC761A6
	for <linux-clk@archiver.kernel.org>; Mon, 17 Feb 2020 12:58:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D1E16207FD
	for <linux-clk@archiver.kernel.org>; Mon, 17 Feb 2020 12:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581944290;
	bh=z2e1rZOv+WP3xOWtzUPRXPB3lFkCpqMrWk4ubOcCo44=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=N/63TmU9PfbKxKN+S2jkVyToySLXO3EPUQ+C+aR6rm9PVnyRllnpUAUbBgbDNt2Hm
	 vovU2LZlRip1JT6D3jLGIrI1QW2TNZpgO0XzH5uUWwqLoVafvTMfiG7srQpjNtAZhd
	 S1JhQ3n3dHn8aXpTd7YUrJzYaFdqj7RFZXV7oVKs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbgBQM6K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Feb 2020 07:58:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:40152 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727803AbgBQM6K (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Feb 2020 07:58:10 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A3FC620578;
        Mon, 17 Feb 2020 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581944289;
        bh=z2e1rZOv+WP3xOWtzUPRXPB3lFkCpqMrWk4ubOcCo44=;
        h=Date:From:To:Cc:Subject:From;
        b=aL4F/29WL7mbuG9SguO3G5HQxrqEIVSTUkyMgGSu99aYMYGHv3OV70n74elBhmFgx
         karA6pL1mVKk2lUwngA/EV2fHb9f05hLamPz0RFPs1sUmQZV8uOxX9ulVeJ7R4yzuI
         o7wDXxYs7KBUbOqrMbTiGqMbURkG9sCLAOjel070=
Date:   Mon, 17 Feb 2020 20:58:01 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock fixes for 5.6
Message-ID: <20200217125759.GA3671@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9:

  Linux 5.6-rc1 (2020-02-09 16:08:48 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-clk-fixes-5.6

for you to fetch changes up to 5eb40257047fb11085d582b7b9ccd0bffe900726:

  clk: imx8mn: Fix incorrect clock defines (2020-02-17 15:18:00 +0800)

----------------------------------------------------------------
i.MX clock fixes for 5.6:

A fix on i.MX8MN I2C4 and UART1 clock IDs, which clash with PWM2 and
PWM3 ID.  This bug makes I2C4 and UART1 device in i.MX8MN DT point to
PWM2 and PWM3 clock.

----------------------------------------------------------------
Anson Huang (1):
      clk: imx8mn: Fix incorrect clock defines

 include/dt-bindings/clock/imx8mn-clock.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
