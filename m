Return-Path: <SRS0=eSXj=RD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85E06C4360F
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5DAD2218C3
	for <linux-clk@archiver.kernel.org>; Thu, 28 Feb 2019 18:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1551378461;
	bh=Cd2np7zLyirQszKYyqDOKl35zJ54+I/eGEYtZiMQDeM=;
	h=To:References:Cc:Subject:From:In-Reply-To:Date:List-ID:From;
	b=HcBIJWeJMkEiJQyXVuAEpuJzoJfgGfGodqBavOVejK6XcMphwCKM3BnYlldg1nclF
	 jPtu/DykzcWy1r2JfDrYw/Cp3EppZXohP5ZktotPjqxeGu1XyHwGwSMoEi73EP9On5
	 ZJhwX5eC+eM9qfQANlLubxA8CECt9njhK+f14bCc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733228AbfB1S1j (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Feb 2019 13:27:39 -0500
Received: from mail.kernel.org ([198.145.29.99]:36492 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732609AbfB1S1j (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Feb 2019 13:27:39 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8AADB218AE;
        Thu, 28 Feb 2019 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1551378458;
        bh=Cd2np7zLyirQszKYyqDOKl35zJ54+I/eGEYtZiMQDeM=;
        h=To:References:Cc:Subject:From:In-Reply-To:Date:From;
        b=Fyaa+3bx2jcDlpSYt7cyoi3TxoT5zFuu2rADQYALE23dAPy8TJQcd9OBX1iNPyUAm
         stuhPEMSJY0Hlw7fFIMV+brfksQYo6/dwlGCgDq7o4kze+yvjJZ7FtH6LQJ/iCyA1u
         MsahzZeY+nf4ExCNJCaoU6gbWU59o7oDOJdO7Owk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Shawn Guo <shawnguo@kernel.org>
References: <20190131002056.12024-1-festevam@gmail.com> <155078140414.77512.3157214123340597508@swboyd.mtv.corp.google.com> <20190228021509.GA26041@dragon>
Message-ID: <155137845776.260864.1239841948290211643@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Cc:     Fabio Estevam <festevam@gmail.com>, kernel@pengutronix.de,
        linux-imx@nxp.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Abel Vesa <abel.vesa@nxp.com>, Bai Ping <ping.bai@nxp.com>,
        Carlo Caione <ccaione@baylibre.com>,
        Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] clk: imx8mq: Add support for the CLKO1 clock
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20190228021509.GA26041@dragon>
Date:   Thu, 28 Feb 2019 10:27:37 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2019-02-27 18:15:12)
> On Thu, Feb 21, 2019 at 12:36:44PM -0800, Stephen Boyd wrote:
> > Quoting Fabio Estevam (2019-01-30 16:20:56)
> > > Add the entry for the CLKO1 clock.
> > >=20
> > > Signed-off-by: Fabio Estevam <festevam@gmail.com>
> > > ---
> >=20
> > Applied to clk-next but I had to fix the whole DT binding number because
> > I don't know what this patch is based on. In fact, please get everyone
> > involved at NXP and whoever else is working on i.MX clk drivers to
> > coordinate somehow. I just spent 20 minutes working through the set of
> > imx patches in my inbox and I see approximately 6 different authors all
> > sending out a few clks at a time for the same drivers with zero
> > information about what the patches are based on or what order they're
> > supposed to be applied in.
> >=20
> > If someone wants to collect all the patches and indicate on the list
> > they've picked them up and will be sending them as a pull request that's
> > fine.
>=20
> I will help collect the i.MX platform clock patches and send you as
> pull request.
>=20

Ok. Thanks for the heads up. I don't expect anything for the 5.1 merge
window that should open next week, but for the next cycle I'll be on the
lookout for the pull request.

