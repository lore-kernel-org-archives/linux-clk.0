Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F7F6C4338F
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 18:42:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CCAA61357
	for <linux-clk@archiver.kernel.org>; Tue, 24 Aug 2021 18:42:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233337AbhHXSnY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Aug 2021 14:43:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52632 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233049AbhHXSnX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 24 Aug 2021 14:43:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 39C5F61262;
        Tue, 24 Aug 2021 18:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629830559;
        bh=5+7OlgytRuk9jsnnaZMaOIZ4xSRW/nRwJD9qg194EG8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hfnAJZQUUYSQWyoxezHWslXLpEs/MsExfdh+VRjoQ/2Jog3fB6EnhwtO9FDbSfrdL
         gAOhM2wPBldl2XUdxqjnYr8RXyZ1qEZfrEpUWxSnHsY0/4LTKqEEVZ6gnA6BX/P20n
         2bNRbtKHgP1pLTEOrnBbJWZ5J2B0LAzLoYxqcp18mVfT+NlWP2v2beoCzdQn2nLCYY
         PCj6xVw8etmhMFA2RHBRRwMbNf80id3So4flvC7QJfxerfOmQfhpWcZ4vEuG+7rWTW
         6uOUMeK4QXsqyqE03sOLOEWO+zI9GSHqztJP/Dq1SGoXDKFPbJOLxgNtYeOmktB+Ew
         DW8HR7trnbuaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4308060.PYKUYFuaPT@phil>
References: <4308060.PYKUYFuaPT@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.15
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 24 Aug 2021 11:42:38 -0700
Message-ID: <162983055800.1317818.353040062648469258@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-08-22 03:14:41)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.15
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58=
d3:
>=20
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.15-rockchip-clk1
>=20
> for you to fetch changes up to c0c81245dac7caaef4db627fb7043495d1afe662:
>=20
>   clk: rockchip: make rk3308 ddrphy4x clock critical (2021-07-29 12:43:11=
 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
