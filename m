Return-Path: <SRS0=g6IF=TU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BEEC04AAF
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 07:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 986C82081C
	for <linux-clk@archiver.kernel.org>; Mon, 20 May 2019 07:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1558336069;
	bh=OoAI2e+4eQqX83Qh6QnQrdl4+kgQfA5iKpNYidtYuRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Y8LbmaAnx4nNYSnnBAuf3lFXVE5ZavAsxEBcn369VbWkGfG8UY9jvlDIoqf2oHBen
	 LxPIPNsr7iP4Sb8oj/5xt7cek3GK59juUokz0wb7l44HDf17sBzl3riRBELntPBMjc
	 9jaNUOzsEuq6JfqPLSCqSppddmN48DZrubyfH/qc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730897AbfETHHt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 May 2019 03:07:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:44142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730545AbfETHHs (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 20 May 2019 03:07:48 -0400
Received: from dragon (98.142.130.235.16clouds.com [98.142.130.235])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CB25C20856;
        Mon, 20 May 2019 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558336067;
        bh=OoAI2e+4eQqX83Qh6QnQrdl4+kgQfA5iKpNYidtYuRM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ttcgK+23s7Uza8CJuC8n4Kb5C78ItuoGriGXEvVSdLJHekJLkLT0SH0BMsNftw2wH
         aj/H+vprN6pBkkjYQAPM0Jyf+iOIK24gfOZ1JguTnX+gUoHcmhD2RruPX5ZVHbLLja
         0ftrnKZ4bIIW5+xcrqnUXUcNhEctEib37aWbCmHs=
Date:   Mon, 20 May 2019 15:06:57 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Jacky Bai <ping.bai@nxp.com>, Stephen Boyd <sboyd@kernel.org>,
        Anson Huang <anson.huang@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] clk: imx8mm: Mark dram_apb critical
Message-ID: <20190520070656.GS15856@dragon>
References: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <61a5cad23ad56a2aed96f3bdbf7c67df25e0bd6b.1557725494.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 13, 2019 at 05:32:07AM +0000, Leonard Crestez wrote:
> This clock is used for dram operations inside TF-A and must be kept
> enabled for features such as suspend/resume dram retention and busfreq
> to work.
> 
> This is required for imx8mm suspend to work with NXP branch of TF-A.
> There is an equivalent clk on imx8mq and it's always been marked as
> critical in upstream.
> 
> Signed-off-by: Leonard Crestez <leonard.crestez@nxp.com>

Applied, thanks.
