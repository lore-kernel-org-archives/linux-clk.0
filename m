Return-Path: <SRS0=SbWe=Y6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5056C43331
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 22:31:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 90D8C2187F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Nov 2019 22:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573079483;
	bh=nhqYQAY0HyjKKivJMXMUOGnLcPSbGb288dmnM/Goz+A=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:List-ID:From;
	b=u5C+BP+ufOfZgJh+jhYeto0oxKAv3WuHdJ/L+j4JCorzpzZ6vhYZQpSdDUdBufQDX
	 xtZ66Ed+lMmewlNZHw7thygNJLnljUMX+JYBADd/vI0XmoUWuvqiKvHRyKeBlhfF4K
	 u2oU/j/71LlwQ5SlrXjDeUN4lPfW44yMrPGI67co=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727654AbfKFWbX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Nov 2019 17:31:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:45268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726817AbfKFWbX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Nov 2019 17:31:23 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 867E4214D8;
        Wed,  6 Nov 2019 22:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573079482;
        bh=nhqYQAY0HyjKKivJMXMUOGnLcPSbGb288dmnM/Goz+A=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=yt0nfIWs1JHwzEGk0V9pJExUD7PlnjFZ7T04bRiGyQOwLc7nNxtEH3jZR3ZeOTb0c
         40unPB2R9VskjX/r6kbebrdMH0say0UguPCHdHRki9CSSbsat6EOS11tUW7jpDuMOF
         LvUX8+3FuqB9avL4LqTmg/73ssePf4K+2W/w1bN8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <b7e68c7f-50d9-4d35-bb8b-649b6a8269f7.lettre@localhost>
References: <b7e68c7f-50d9-4d35-bb8b-649b6a8269f7.lettre@localhost>
Subject: Re: [GIT PULL] Allwinner Clock Changes for 5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Maxime Ripard <mripard@kernel.org>,
        Mike Turquette <mturquette@baylibre.com>
Cc:     Maxime Ripard <mripard@kernel.org>, linux-clk@vger.kernel.org,
        Chen-Yu Tsai <wens@csie.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 14:31:21 -0800
Message-Id: <20191106223122.867E4214D8@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2019-11-06 04:20:37)
> Hi,
>=20
> Please pull the following changes for the next release.
>=20
> Thanks!
> Maxime
>=20
> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c=
5c:
>=20
>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git refs/ta=
gs/sunxi-clk-for-5.5-1
>=20
> for you to fetch changes up to 4441b57ec27e35a86337b3197c62b3d6be9695b2:
>=20
>   clk: sunxi-ng: h3: Export MBUS clock (2019-11-05 11:34:41 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

