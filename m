Return-Path: <SRS0=wHDH=VU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CF1C76188
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jul 2019 06:04:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85F8C2239F
	for <linux-clk@archiver.kernel.org>; Tue, 23 Jul 2019 06:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563861886;
	bh=Mm3Vz9R+MUEOKGw4W48eF2sSL9ar6mvwh95P89DqCDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=CXOWUrQaxsXl7IL2uVwAy3e+wzAIFs0vvWChWFCMGGfMQjG5WgTvfLEz97BWlS7YV
	 S8fnLgBzlKlFQvIu9IrNr8CPGbsT8axkAezYUtjGPQeXgf8e490jitU9fNMZ9lf4KG
	 dsFOaJdCcLvliOS8gclFhkKgaelxg854h2wMt0c0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731030AbfGWGEq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Jul 2019 02:04:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:52208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbfGWGEq (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 23 Jul 2019 02:04:46 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15F9F2238E;
        Tue, 23 Jul 2019 06:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563861885;
        bh=Mm3Vz9R+MUEOKGw4W48eF2sSL9ar6mvwh95P89DqCDY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ovk8fvelatWPB3VUtfuOgrbXqj1vcjTGg0KNwhUTFc5H3gBDudJMob0BibAYoI9cK
         HQsJclBH3ZfaVogl602muiCNMB1FfKGrTdx1wKhG9FhIyAA30TGvRBfSYDmIRh06e/
         wZMEopx/d6YxB0FxH3i+NPdqlIHLmgAx1TidFiHY=
Date:   Tue, 23 Jul 2019 14:04:16 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk@vger.kernel.org, Jacky Bai <ping.bai@nxp.com>,
        linux-arm-kernel@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: imx: Remove unused clk based API
Message-ID: <20190723060415.GS3738@dragon>
References: <1562857910-29501-1-git-send-email-abel.vesa@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1562857910-29501-1-git-send-email-abel.vesa@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 11, 2019 at 06:11:50PM +0300, Abel Vesa wrote:
> Now that the i.MX6 and i.MX7 clock drivers have been switched to clk_hw based,
> we can remove the clk based API that is not used by any i.MX clock driver.
> 
> The following APIs are going away now:
> - imx_clk_busy_divider
> - imx_clk_busy_mux
> - imx_clk_fixup_divider
> - imx_clk_fixup_mux
> - imx_clk_mux_ldb
> - imx_clk_gate_dis_flags
> - imx_clk_gate_flags
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Applied, thanks.
