Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4273EC61DA4
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 00:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjAaAJG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 19:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbjAaAJF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 19:09:05 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E442F1A947
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 16:09:04 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 55DC6CE1AD2
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 00:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6886FC433EF;
        Tue, 31 Jan 2023 00:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1675123741;
        bh=c/OydjnrsePgwEapLpVtjj/oGE81b8mD5+qHxXBLwsY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HFlQrYji2nXoNpxUkzcNnuiWmBYJ7E3Wqn6Y1eZqdjUyNzLgFn8akKCmhCal6yHag
         gBVtqnu3U0LkTycWmmGdZy92YBaMwIM3iIVj2SrOIOR/iTcPO0kM576osMAcHiZvtE
         noE9sX0lBxMGgUtk9Kzr7E22UAwpja2f6hVF5P6uRgWxDNkepDssOf3TyIKLzPK7Nv
         5lZL1v61tIK8BpJQr4AIHhstFKtD/lOsd89p/Tg5jZNjptPk2nAAfcNULjEsh6zxLH
         /05g3RVK+tKUA/Mf/nXSiWuXgwGHXikx2XVYgX+3kjszx72rI+kJXFLxWnY4oOobKY
         jSrmXcT3NQjnA==
Message-ID: <c1d64194f7ad95e66de3db104967da2c.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y9RXFUH6URVE4LMG@jernej-laptop>
References: <Y9RXFUH6URVE4LMG@jernej-laptop>
Subject: Re: [GIT PULL] Allwinner clock changes for 6.3
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     wens@csie.org, samuel@sholland.org, linux-clk@vger.kernel.org,
        linux-sunxi@lists.linux.dev
To:     Jernej Skrabec <jernej@kernel.org>, mturquette@baylibre.com
Date:   Mon, 30 Jan 2023 16:08:59 -0800
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Jernej Skrabec (2023-01-27 14:58:29)
> Hi!
>=20
> Please pull following clock changes for 6.3.
>=20
> Best regards,
> Jernej
>=20
> The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71=
c2:
>=20
>   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/su=
nxi-clk-for-6.3-1
>=20
> for you to fetch changes up to e6f2ffeaf58b23614cc818587aa3a4fc7c108a55:
>=20
>   clk: sunxi-ng: d1: Add CAN bus gates and resets (2023-01-08 22:06:10 +0=
100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
