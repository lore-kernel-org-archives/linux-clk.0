Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EA9C43387
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E12C1208C4
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544821747;
	bh=rp/SSSt9JoR+Eayxj3NQgbrsx8kivwuHqjTcwAcOzT8=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=ItaKhbJgeMqmeCVQYmkOfqwj/lTxP3MHJlitlIc+MxMl07R6baHnk5JdRJx6hR6zq
	 /RfgkvJ+AeVxG7qJCFNkWuDmFQlEoiXVbSMlS7Mfm8dCO3JYSs0AyWnI81bwp3uEBP
	 ejqByxWfG1D58tDLlbbl/5zwa7J6L+o3M31o0IkA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731093AbeLNVJG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:09:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:56898 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbeLNVJG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:09:06 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F0DC9208C3;
        Fri, 14 Dec 2018 21:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544821746;
        bh=rp/SSSt9JoR+Eayxj3NQgbrsx8kivwuHqjTcwAcOzT8=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=I7qcmcUWNnaeY91o9jDy1vqKRgr7Wfz5EvEhgVYOtqEj+D06AEMk6KOIt2dS926cn
         ttIhpat/m0bKhTsbWRS4XHtdRgqeKzDtTga5lsf4+aB8xxIIwj2/Xp3cC9HBYP7g3A
         uD4v3RmzyNSeJUMNIr4xw0cVcgb6Hf91B3ZvUpQ0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544715442-8902-5-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V12 4/5] clk: imx: add lpcg clock support
To:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
References: <1544715442-8902-1-git-send-email-aisheng.dong@nxp.com> <1544715442-8902-5-git-send-email-aisheng.dong@nxp.com>
Message-ID: <154482174488.19322.14474511122125652890@swboyd.mtv.corp.google.com>
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
Date:   Fri, 14 Dec 2018 13:09:04 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Aisheng Dong (2018-12-13 07:43:01)
> The Low-Power Clock Gate (LPCG) modules contain a local programming
> model to control the clock gates for the peripherals. An LPCG module
> is used to locally gate the clocks for the associated peripheral.
> And they're bedind the SCU clock.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---

Applied to clk-next

