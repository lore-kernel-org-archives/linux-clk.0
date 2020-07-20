Return-Path: <SRS0=zu0T=A7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,
	BODY_QUOTE_MALF_MSGID,DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80364C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 06:25:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51FBE21775
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jul 2020 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595226334;
	bh=eqC8bDr/xkmdhSZb/2Y9pg1tjjb32cuqAEUruK2NYK8=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=K8P0cAwTQgeEqeVyaMRHJ48SYaUBj2uH3E+CndXC4bUMYWFV6IrjiZMkgJLbzaeav
	 loQiRJhh04dmer1sZyVDmf9CDz4hGA2f0GYb2Pc3R4h8EI477Kh6SKDtZpGAJeyELp
	 7rw9P5gUxHsr/zYsbqf8/tXkEhxmAPvWf9RXyqvI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgGTGZe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jul 2020 02:25:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:34354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgGTGZe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 Jul 2020 02:25:34 -0400
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 143F720773;
        Mon, 20 Jul 2020 06:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595226333;
        bh=eqC8bDr/xkmdhSZb/2Y9pg1tjjb32cuqAEUruK2NYK8=;
        h=Date:From:To:Cc:Subject:From;
        b=j4LHsVh53fPI6kUA4WWOCCFDInvuPCgYdqZ5cnst1+P4oQ039ZLFXzb1DBk0uRMUH
         tnGI5AUeobvEvprNEQpR/6PQOTOtH5XdWPP6KzPBAqkqe3H6Klvz0tyJqtsZxh4YOB
         RXXRJ7mF9QwWk9lw/yxhQz8Bptum61ds0s07oKP8=
Date:   Mon, 20 Jul 2020 14:25:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] i.MX clock changes for 5.9
Message-ID: <20200720062516.GB20462@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

This is a couple of i.MX clock patches I collected for 5.9.  Please pull
and keep it stable, as I also pull it into my DT branch to resolve
dependency.  Thanks!

Shawn


The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/clk-imx-5.9

for you to fetch changes up to 018e4308349dbf32f4d971cbe72f4f3d6b1c217a:

  clk: imx: vf610: add CAAM clock (2020-06-23 15:10:05 +0800)

----------------------------------------------------------------
i.MX clock changes for 5.9:

- Add CAAM clock support for vf610 driver.
- Add MU root clock support for imx8mp driver.

----------------------------------------------------------------
Andrey Smirnov (1):
      clk: imx: vf610: add CAAM clock

Peng Fan (1):
      clk: imx8mp: add mu root clk

 drivers/clk/imx/clk-imx8mp.c            | 1 +
 drivers/clk/imx/clk-vf610.c             | 1 +
 include/dt-bindings/clock/vf610-clock.h | 3 ++-
 3 files changed, 4 insertions(+), 1 deletion(-)
