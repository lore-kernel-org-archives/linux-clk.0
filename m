Return-Path: <SRS0=ypW/=D3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1EA9C4363A
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 16:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EC8422251
	for <linux-clk@archiver.kernel.org>; Tue, 20 Oct 2020 16:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603211375;
	bh=OHP1tMqID19X7UU9IUun0CuON3T03c1VaM82iG1v6ks=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=HwaaHXlo+eDAxqXtRQn4nkOSo/Ce9vb4UPTWGSzLHnscB/p3ZVPVsFjCSSyu+COeT
	 LyaHAtQKDhIXSyBOYGw02HPhYqU9qH+Qv8QhgdIXOKT+Teokx7IJvStdOU/cGKp62Y
	 U/g6DYD27A/ojF1z36j7cfQHLgKiqSpjeQdBZ88g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394638AbgJTQ3e (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Oct 2020 12:29:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:44142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2394635AbgJTQ3e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 20 Oct 2020 12:29:34 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E51502224A;
        Tue, 20 Oct 2020 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603211374;
        bh=OHP1tMqID19X7UU9IUun0CuON3T03c1VaM82iG1v6ks=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=jcrXKFOGOmUOHMZ5KcKqJldWFUQ3eQ6cHe63k4F1hi5gWi89wYWhb9evrmCYxKUQu
         QujQ00VopIUqTySava2bnlsuRV21RDptzC1/AwREiauWe201DjQdqDhTN5zmwkh/Jd
         Bqq/7WBzjleGJKXCZOibdrRWaMXUWUp8XA4qCQFg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1602753944-30757-1-git-send-email-abel.vesa@nxp.com>
References: <1602753944-30757-1-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH] clk: imx8mq: Fix usdhc parents order
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@nxp.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Anson Huang <anson.huang@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Mike Turquette <mturquette@baylibre.com>,
        Peng Fan <peng.fan@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>
Date:   Tue, 20 Oct 2020 09:29:32 -0700
Message-ID: <160321137259.884498.8601611844123685455@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2020-10-15 02:25:44)
> According to the latest RM (see Table 5-1. Clock Root Table),
> both usdhc root clocks have the parent order as follows:
>=20
> 000 - 25M_REF_CLK
> 001 - SYSTEM_PLL1_DIV2
> 010 - SYSTEM_PLL1_CLK
> 011 - SYSTEM_PLL2_DIV2
> 100 - SYSTEM_PLL3_CLK
> 101 - SYSTEM_PLL1_DIV3
> 110 - AUDIO_PLL2_CLK
> 111 - SYSTEM_PLL1_DIV8
>=20
> So the audio_pll2_out and sys3_pll_out have to be swapped.
>=20
> Fixes: b80522040cd3 ("clk: imx: Add clock driver for i.MX8MQ CCM")
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Reported-by: Cosmin Stefan Stoica <cosmin.stoica@nxp.com>
> ---

Applied to clk-next
