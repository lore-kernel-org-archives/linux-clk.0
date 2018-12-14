Return-Path: <SRS0=SiOT=OX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F6AC43387
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:03:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F5A1208C1
	for <linux-clk@archiver.kernel.org>; Fri, 14 Dec 2018 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544821434;
	bh=/s9+oLePK1uAbNvVgTRM4G4l5aGyDZxa2ou9T0sNWf8=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=CT0MtQMbUJRsD1y2ncdYlZjQ83wsgjGZ7U4Tt1xc0qnbHbtt0ud58wt/RH14pGjOQ
	 MLED0bH3d1PQn0VYzKjO/4M/wmDtDmrmo7WoWzr/nE5U4Yh9LSJ2cyJ2ZRJYoQtzH5
	 StEeZzC/zmXfUXo1vePAo1phcDqdRUNZj4Qx90A4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730949AbeLNVDx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:03:53 -0500
Received: from mail.kernel.org ([198.145.29.99]:53406 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730734AbeLNVDx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 14 Dec 2018 16:03:53 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D19B32086D;
        Fri, 14 Dec 2018 21:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544821432;
        bh=/s9+oLePK1uAbNvVgTRM4G4l5aGyDZxa2ou9T0sNWf8=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=RdQE6aE34DiI7JTWtmpaHHXE7+nl/q3wiw99Eg1CgtRBK6KWSayayJuIrTM6AzJpO
         TIYwWWxj4+OV9nQ/s8z1BYWD5L1wDRY+dAvUN3SnLriGMa8tFso1XyUxo4XZHKTTKr
         nZHkgjwz/4/CD2hxwMnurOuuQugPkfX5K8Pn6oMQ=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1544797224-26627-1-git-send-email-abel.vesa@nxp.com>
Subject: Re: [PATCH v2] clk: imx: Make the i.MX8MQ CCM clock driver CLK_IMX8MQ dependant
To:     Abel Vesa <abel.vesa@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>
References: <1544797224-26627-1-git-send-email-abel.vesa@nxp.com>
Message-ID: <154482143165.19322.12454675199935637811@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Olof Johansson <olof@lixom.net>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Abel Vesa <abel.vesa@nxp.com>
Date:   Fri, 14 Dec 2018 13:03:51 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Abel Vesa (2018-12-14 06:20:34)
> Remove the dependency between the i.MX8MQ CCM clock driver
> and the CONFIG_SOC_IMX8MQ and use CONFIG_CLK_IMX8MQ instead.
> CONFIG_CLK_IMX8MQ depends on ARCH_MXC && ARM64.
>=20
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---

Applied to clk-next with removal of that trailing file newline.

