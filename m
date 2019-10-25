Return-Path: <SRS0=BavY=YS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 949EBCA9EA0
	for <linux-clk@archiver.kernel.org>; Fri, 25 Oct 2019 09:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C88E21D7B
	for <linux-clk@archiver.kernel.org>; Fri, 25 Oct 2019 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571994280;
	bh=hPfHiyhDFvSWyPkt6mjIwA99+K5iOA9vRiU4uEr+ikA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Htzf1nHoiP56sL35psb9fJEMEO9PXzD/5laB6RGGnK1LY8yfif/Xvk4AG3rotPhms
	 mTI4mmuekaPtDMZJZLR78SPvF2wKVuritgb8ec+nV5o9NG/7iWFj8YiNMKXOntRGgc
	 kyIPIf8d/iMcTe1CtpTczMgytswSv8eSzHgW5sJM=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438041AbfJYJEk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Oct 2019 05:04:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:60944 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437447AbfJYJEk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 25 Oct 2019 05:04:40 -0400
Received: from dragon (li937-157.members.linode.com [45.56.119.157])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 423B321929;
        Fri, 25 Oct 2019 09:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571994279;
        bh=hPfHiyhDFvSWyPkt6mjIwA99+K5iOA9vRiU4uEr+ikA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=j+mwx55MltOSh7EfnAsUgdCHR0Lx5SXp+xhjkQUjZi2chaUFgkJazoRvb6r99YaDq
         zEZWYdBddetZrpyDK1kwFx+DfPEmWpJrFcFY5h/EIFzmQ8Ktz0jCxzS8IiHoSB9VxQ
         7bSZGjlVOdWq1exVBVNCjxkrHwXzrXNb9KJZpEfs=
Date:   Fri, 25 Oct 2019 17:04:24 +0800
From:   Shawn Guo <shawnguo@kernel.org>
To:     Leonard Crestez <leonard.crestez@nxp.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
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
Subject: Re: [PATCH v3 0/3] clk: imx8m: Define gates for pll1/2 dividers
Message-ID: <20191025090422.GI3208@dragon>
References: <cover.1571226979.git.leonard.crestez@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571226979.git.leonard.crestez@nxp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 16, 2019 at 11:57:36AM +0000, Leonard Crestez wrote:
> Leonard Crestez (3):
>   clk: imx8mq: Define gates for pll1/2 fixed dividers
>   clk: imx8mm: Define gates for pll1/2 fixed dividers
>   clk: imx8mn: Define gates for pll1/2 fixed dividers

Applied, thanks.
