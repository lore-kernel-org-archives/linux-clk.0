Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4888DC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 19:44:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2533860F9D
	for <linux-clk@archiver.kernel.org>; Tue, 26 Oct 2021 19:44:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234844AbhJZTqh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Oct 2021 15:46:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:55238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234018AbhJZTqh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Oct 2021 15:46:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45AA560C4A;
        Tue, 26 Oct 2021 19:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635277453;
        bh=w7LrsVgoXVcZTFK2OejgJMdvdD/hUCH6aA5lrdMLMz0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=PCbwX9pOqfQ1rYw87W28Q3CqXOmG1qPGXv9m7B4QT+9fdvhhowB2BDrT3OzZ3l/L6
         0qx8HQaSvAq7zs45omWHLBpipaiYTRms720yoZL3venqTXB85r/sKubii25HrEYrQe
         oGuupvyJ6n2xyXaRQ4SJ93HPWnOYSsqPd3+TnwvlNAuaLTn18pJa5Qm9fp+uvfSt9V
         PPJVBuoqom68D+4P46q/8CvN2hIsNyV+wHZT+nCu9i4gKfRHWVIVRyDkrf34U5RzlZ
         PhORXRTOQ+iUo61f1yDhtbq0XnFBRbmmkC70cygzyUoXVSEshF9t7Oi6XKLvnlzK+7
         n/M4SwEoInb+g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f7f3c718-eab3-4d8e-a8f3-8d1ef986a5dc.lettre@localhost>
References: <f7f3c718-eab3-4d8e-a8f3-8d1ef986a5dc.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.16
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Tue, 26 Oct 2021 12:44:11 -0700
Message-ID: <163527745194.15791.16325190975699640134@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2021-10-18 01:02:40)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd=
8f:
>=20
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.16-1
>=20
> for you to fetch changes up to e65d38e3d2d0e61ca464b46ad804f7a94e1ae45f:
>=20
>   clk: sunxi: sun8i-apb0: Make use of the helper function devm_platform_i=
oremap_resource() (2021-09-13 09:03:24 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
