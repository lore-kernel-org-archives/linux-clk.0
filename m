Return-Path: <SRS0=CWv7=4F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29734C35242
	for <linux-clk@archiver.kernel.org>; Mon, 17 Feb 2020 06:27:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F24B820726
	for <linux-clk@archiver.kernel.org>; Mon, 17 Feb 2020 06:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1581920839;
	bh=KgSYnzHHJzBCjBaAI6KjAC2O3NBeCAluTBC1sa9/DX0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=KRTjU3ALGl2LPs/HEfOSZ349zWPcTmz5tfRUve1aNR5fQcLioNr8UaHEMLoy1/AFE
	 gHFwY+ZwnZur+zidmSIbnSqzGr2hghBJaiH0a/KEHZcJZAp/mSdtfvScIpVZYPV4ev
	 b9IDLKcJtuFtud1GafqUciNa/xc0ZSfb4IjEX6/w=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725935AbgBQG1S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Feb 2020 01:27:18 -0500
Received: from mail.kernel.org ([198.145.29.99]:36632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725873AbgBQG1S (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Feb 2020 01:27:18 -0500
Received: from dragon (80.251.214.228.16clouds.com [80.251.214.228])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2620020718;
        Mon, 17 Feb 2020 06:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581920837;
        bh=KgSYnzHHJzBCjBaAI6KjAC2O3NBeCAluTBC1sa9/DX0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PyNf3OKGIP3comcBUhBg7VuYttapVBhZIdyvpXPQlmUeM3XqGTU+2bAEDvKa5nQi0
         FhVogDlMiFnSMS5R0YM2DJL49HQLAzZP+EK5uJzpKmF0nQClSpvrCazz/QP3C32Pbo
         teGAKSwrBpZvFHxzKLDQuufnw4QeRFgWeS5qDg10=
Date:   Mon, 17 Feb 2020 14:27:11 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, leonard.crestez@nxp.com,
        abel.vesa@nxp.com, peng.fan@nxp.com, ping.bai@nxp.com,
        jun.li@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Linux-imx@nxp.com
Subject: Re: [PATCH] clk: imx: Include clk-provider.h instead of clk.h for
 i.MX8M SoCs clock driver
Message-ID: <20200217062647.GA6862@dragon>
References: <1581490943-17920-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1581490943-17920-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Feb 12, 2020 at 03:02:23PM +0800, Anson Huang wrote:
> The i.MX8M SoCs clock driver are provider, NOT consumer, so clk-provider.h
> should be used instead of clk.h.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Applied, thanks.
