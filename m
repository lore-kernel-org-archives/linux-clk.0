Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1D2C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 29 Nov 2022 20:00:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237154AbiK2UAz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 29 Nov 2022 15:00:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237139AbiK2UAy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 29 Nov 2022 15:00:54 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4098D248FF
        for <linux-clk@vger.kernel.org>; Tue, 29 Nov 2022 12:00:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EE968B818D4
        for <linux-clk@vger.kernel.org>; Tue, 29 Nov 2022 20:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C38FC433D6;
        Tue, 29 Nov 2022 20:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669752050;
        bh=nsQ6UZTMVS7LxhIx+qo0FTX8OImT7Hswtc/eyiei6i0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=HGshhsHq2CrvtUiUE9E7ql6ycdfYLuHU30B8aLpOoYSKXsIESDxsMc49AAjrWwmDL
         dRtuorbsL1RrggJfa/G82ZD7Kc1H+FRqX3P7mtY4OaHv5aiDeNJqb5b23YzFiN4ne3
         eilsUza/kNPYEMIf5Ydy3a8o4Tfwa64O8l81J+jx1MlxYlfit0yFzriLIHA4w1wsxB
         NkKDRquw55xROA3meOxUrfRCo4OqXN7BKCo3SonONo3JMtE8eccYM76sHr3OhJO+BS
         9la6TD31Lekex+n6zQn+WulfcjxbaIDTNOsi7RUOoBv2ptTeaeYlckSQKuTl30DLGZ
         YA043B3i1hKJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <23196966.EfDdHjke4D@phil>
References: <23196966.EfDdHjke4D@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 6.1 #1
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 29 Nov 2022 12:00:48 -0800
User-Agent: alot/0.10
Message-Id: <20221129200050.9C38FC433D6@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2022-11-23 06:01:01)
> Hi Mike, Stephen,
>=20
> please find below a pull-request with some Rockchip stuff.
>=20
> Mainly the support for the clock-controller for the new and shiny rk3588,
>=20
> Please pull.
>=20
> Thanks
> Heiko
>=20
> The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc7=
80:
>=20
>   Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v6.2-rockchip-clk-1
>=20
> for you to fetch changes up to 739a6a6bbdb793bd57938cb24aa5a6df89983546:
>=20
>   clk: rockchip: Fix memory leak in rockchip_clk_register_pll() (2022-11-=
23 14:51:30 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
