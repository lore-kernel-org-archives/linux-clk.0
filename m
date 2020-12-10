Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A3C3C433FE
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 20:59:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F03B822DBF
	for <linux-clk@archiver.kernel.org>; Thu, 10 Dec 2020 20:59:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393886AbgLJU7i (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Dec 2020 15:59:38 -0500
Received: from mail.kernel.org ([198.145.29.99]:56260 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393371AbgLJU7a (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Dec 2020 15:59:30 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607633924;
        bh=3R80+MeyoXUyYj5jY+nXfM1oToVU7EK+KhmI7etXyiY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KneZnHuJ9U+9Bo8luzvcpBZBrrwpta+GUMtTY9WvuTAgu11ZaR0tI2s5Iplrw0ODA
         6ZOd8OA+wvFY8h7TlKZOqytXmwgUXirtOHVWdQkDo1q+NFsKax2+dM5oYjiAe0m27f
         5MpP9NYYj251fnT+NdSSOJX3ENGGW0BWGbNsjjQ+ts24aL/VMSt9kfP4kqbW4KKvKz
         +2FQHjm7WnwkR7uiFs7pIA2fDX8V2RbTCFp0hjfc1jh9DN+qfnXMqhZYKz+iNlOrxc
         9HKbpSIBj4qM82ah3+ccMN3QQQn8Xh877vOVQVU/r1d0oBcwdj4l4shJaX3D67C0Ed
         2pmthC8a3XqvQ==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201201093921.GX4072@dragon>
References: <20201201093921.GX4072@dragon>
Subject: Re: [GIT PULL] i.MX clock update for 5.11
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Date:   Thu, 10 Dec 2020 12:58:42 -0800
Message-ID: <160763392263.1580929.9994335528354285720@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-12-01 01:39:22)
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9=
ec:
>=20
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/c=
lk-imx-5.11
>=20
> for you to fetch changes up to 43d2479687c93ed9b93774ef9b46b37de5b3efcc:
>=20
>   clk: imx: scu: remove the calling of device_is_bound (2020-11-30 21:53:=
03 +0800)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
