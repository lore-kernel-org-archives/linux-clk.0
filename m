Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96031C433E0
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 20:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D84864E54
	for <linux-clk@archiver.kernel.org>; Mon,  8 Feb 2021 20:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236540AbhBHU0H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Feb 2021 15:26:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:52882 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236830AbhBHUZe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Feb 2021 15:25:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F42D64E59;
        Mon,  8 Feb 2021 20:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612815893;
        bh=EgVQ2aD/dOIXjsVeJJ6GqrtPMXdfFfaEEN9hx6jcINg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=J8j4XJE+MX+yMAr/qZpZMCwnk/XnaUBdpcYImtZVkdAt/Itjay1eAY5F2czbOnRJL
         nBypw2SUvs+R3gcGZkCudlAzQEh3sY6Sv7nEJ5QgZ5SoP5R9rDvewjdzreR1nzjxNO
         cO3zx1KpcCdO1KXpvH1wcwz4TgwW1qQt4lqlh0QZmiHooief8z3yXrpA2d1NKIvDQq
         C03pJIBfa9q9TYIOta9qVAUBNnRGmOEke4SaUBQaAPGQrb0lrDpdIqnaJco4oL3gsp
         Ki0mE2aVMVXXAqRLne6erBnp6K6tIkKE85IAQBvV2pXlZdeSuZhJ4w+Xs0y4vyvnFN
         EXGHrWB2HcmsQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3091603.aeNJFYEL58@phil>
References: <3091603.aeNJFYEL58@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.12
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Mon, 08 Feb 2021 12:24:52 -0800
Message-ID: <161281589209.76967.2910492621269978365@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2021-02-07 16:50:45)
> Hi Mike, Stephen,
>=20
> please find below Rockchip clock changes for 5.12
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e=
5e:
>=20
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.12-rockchip-clk1
>=20
> for you to fetch changes up to 4bc23b3c83c9a3fc0a7dd8f2f11f451aa92c85cd:
>=20
>   clk: rockchip: fix DPHY gate locations on rk3368 (2021-02-06 01:05:04 +=
0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
