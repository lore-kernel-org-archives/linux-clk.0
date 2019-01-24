Return-Path: <SRS0=VLoV=QA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71F9C282C3
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:17:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF2AD218D0
	for <linux-clk@archiver.kernel.org>; Thu, 24 Jan 2019 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548357471;
	bh=Gw8FbC78s5xGN5V2QLypEKWZqs/MWcF2o6A7Wbcgkek=;
	h=Subject:References:Cc:From:In-Reply-To:To:Date:List-ID:From;
	b=FGSEJLOMFmC1JUSKA47CaPkymskLzkLKu9crk0xOKwzWwhimI4W48nkcUU1NxIiPy
	 yrv2G/HV+9NrrMiAxQ2xKWTd7Zg5yhU46w67er+3pdN/BUcxKaDMsqY/rH8I6Yipq4
	 OovK6ZWUTyz4S8yG2bVn8geW1/mrRsECuL7At9a0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728220AbfAXTRv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Jan 2019 14:17:51 -0500
Received: from mail.kernel.org ([198.145.29.99]:43926 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727488AbfAXTRv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 24 Jan 2019 14:17:51 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AEEB218CD;
        Thu, 24 Jan 2019 19:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1548357470;
        bh=Gw8FbC78s5xGN5V2QLypEKWZqs/MWcF2o6A7Wbcgkek=;
        h=Subject:References:Cc:From:In-Reply-To:To:Date:From;
        b=XArJqzAkeWWW/4gfu09LtQY9SH6dOiKbr9YjG6wRfA3X2XH0a0UwqR1zdTJXtkwnB
         RfuhPnUd2poDhghnnASTT83D0HK22MiqYbDy+OaxgfGFPaE3qAb55uHfJDGHTdMlua
         YkUmr3Fa2y4JgkhDMBAH24J4zebNDfnDYcFpVXxk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: imx: Fix fractional clock set rate computation
References: <1547816041-14200-1-git-send-email-abel.vesa@nxp.com>
User-Agent: alot/0.8
Cc:     Abel Vesa <abel.vesa@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1547816041-14200-1-git-send-email-abel.vesa@nxp.com>
Message-ID: <154835746984.136743.9264573972712062567@swboyd.mtv.corp.google.com>
To:     Abel Vesa <abel.vesa@nxp.com>, Lucas Stach <l.stach@pengutronix.de>
Date:   Thu, 24 Jan 2019 11:17:49 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2019-01-18 04:54:13)
> Before multiplying by PLL_FRAC_DENOM, the temp64 needs to be
>  temp64 =3D rate * 2 - divfi * parent_rate * 8, instead of:
>  temp64 =3D (rate * 2 - divfi) * parent_rate
>=20
> Fixes: 6209624b9a5c1e ("clk: imx: Add fractional PLL output clock")
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-fixes

