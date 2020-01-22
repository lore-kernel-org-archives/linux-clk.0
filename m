Return-Path: <SRS0=3pyO=3L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B509C2D0CE
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 00:17:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E231B24676
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jan 2020 00:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579652258;
	bh=sG4VLxMMqjJ/N4Sj4WYyY9dkazSZzty1XYWTKVEGEHI=;
	h=In-Reply-To:References:Cc:To:Subject:From:Date:List-ID:From;
	b=JJoQOywUQbYksxoC6PTJz2ekFCB4hWBzQePgLlIu56nUJ5KguxrBKeO7hhQYiO5jD
	 pZFGJi7g0Dfx8+M9EtN7SzNUSDi5mKM9Qv6uhOl9uNteam2zXcUR/wpZpi3PxhdQV+
	 GPHOBgFRbY4pcnODpTJjvg8bFTpsghXBaexPo/iU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgAVARh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Jan 2020 19:17:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:34142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726876AbgAVARh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 21 Jan 2020 19:17:37 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A71BE21734;
        Wed, 22 Jan 2020 00:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579652256;
        bh=sG4VLxMMqjJ/N4Sj4WYyY9dkazSZzty1XYWTKVEGEHI=;
        h=In-Reply-To:References:Cc:To:Subject:From:Date:From;
        b=mPqZ/Sw9fiwPJzR5xU3Tss/mC79aiFkKkgdo/FjFpau6CfOF7ABWj1ZpjrE9Kkcuw
         0JgTpKSRW2GA2Czyh6y13AMpz+wvjy7r4s1UEzIXen8FRAkDeOM8V1a4erqE/wNzIZ
         avGq++FPczqhj8TNEdoHNlqQICgJcvL2WTe3ZnsA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200115111030.GA29329@T480>
References: <20200115111030.GA29329@T480>
Cc:     Fabio Estevam <festevam@gmail.com>, Stefan Agner <stefan@agner.ch>,
        kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
To:     Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL v2] i.MX clock changes for 5.6
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Tue, 21 Jan 2020 16:17:35 -0800
Message-Id: <20200122001736.A71BE21734@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Shawn Guo (2020-01-15 03:10:32)
> Changes for v2:
>  - Drop imx8m_clk_hw_composite_core() change set, which breaks some
>    existing DTB right away.
>=20
> The following changes since commit e42617b825f8073569da76dc4510bfa019b1c3=
5a:
>=20
>   Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/i=
mx-clk-5.6
>=20
> for you to fetch changes up to 9c140d9926761b0f5d329ff6c09a1540f3d5e1d3:
>=20
>   clk: imx: Add support for i.MX8MP clock driver (2020-01-12 14:07:36 +08=
00)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

