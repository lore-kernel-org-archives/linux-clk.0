Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DB4C43387
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F2031208C2
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544821739;
	bh=wr9aJiHJ3Ei/QqHCPStn7fNLiAq0MRaGLP/tvh1X1IA=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=X1ZpIMPF3Jkuyz/HpcvXEHgGyL7eiiCSXCYIRWLFrH4Sw1BxAUPMTxohMUHdDETOM
	 o52HEa2aPaGZ4oziaPQhpf+MlM9HO+uM7evnLYiZxMbDdZTbYeuOy77pI/bIaAQnuD
	 KH51zI9sZt2ywQfRXwjK9Xnh+DCEI2OowaFvAii4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730757AbeLNVI6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:08:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:56792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbeLNVI6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:08:58 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B0C0E2086D;
        Fri, 14 Dec 2018 21:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544821737;
        bh=wr9aJiHJ3Ei/QqHCPStn7fNLiAq0MRaGLP/tvh1X1IA=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=ETQ1j0ZnsKkfgoITUG9fOL0mGzudulm/uMSLXPGDU7URIQ0p0HjPQAwkl+lEEWozD
         cPYa1WbUZTe6MmuKWJjg9ZRbLgjowPEis6bpYLa3DbXxW7neox/RkGA+EZY6SsrGQJ
         ON2WVbdWQttIVsJ9jjnyTXSHu9tX15+W+V6kJIg4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544715442-8902-2-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V12 1/5] clk: imx: add configuration option for mmio clks
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com> <1544715442-8902-2-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154482173663.19322.18175521691316394476@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Aisheng Dong <aisheng.dong@nxp.com>
Date:   Fri, 14 Dec 2018 13:08:56 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 07:42:50)
> The patch introduces CONFIG_MXC_CLK option for legacy MMIO clocks,
> this is required to compile legacy MMIO clock conditionally when adding
> SCU based clocks for MX8 platforms later.
>=20
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

