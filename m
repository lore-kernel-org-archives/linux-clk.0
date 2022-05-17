Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B0C9C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 22:20:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbiEQWUR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 18:20:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230387AbiEQWUO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 18:20:14 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D025E3F333
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 15:20:12 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 4D9B9B81CBC
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 22:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07254C385B8;
        Tue, 17 May 2022 22:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652826010;
        bh=Hm6hGfPLWJYm61EHZ6aIWw45gmrr1esWofkKxNx8RPc=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=FmNLSV4DRYIpWd5uUfa90jMjHCEGZzyUWKVLpipaIP1mABdKdhWpZZjx4G8lN/Ac8
         /rotbcRyorSK7GDloyY6OpygPJyKNG6D85cLuDrUKUdpIV6ghwLDXOqZDrNHq3f0rN
         gqrhjXzTRE6aLYGT4aKMF/wMFwHuLz8O22+Y3t2l+2NzC5rjO+a/QK4xlfxaxh9/RK
         yyGFAqfseAmttxb3iPqC5WBYtexiWZ9GG7js6uph7vhdr/lVZUAOGuhsBFufyp6BTu
         CBN2ZX/odYfB23khL9Kt24H5jbkxvEJAFusx5wMYWrzKbXsbefJ4fUN64elugd4zYw
         JCk0fBaHcek7A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5781991.QJadu78ljV@phil>
References: <5781991.QJadu78ljV@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.19 #2
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 17 May 2022 15:20:08 -0700
User-Agent: alot/0.10
Message-Id: <20220517222010.07254C385B8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2022-05-17 12:31:15)
> Hi Mike, Stephen,
>=20
> please find below a pull-request converting a number of Rockchip
> clock controllers to yaml, which shound go on top of the previous
> pull request.
>=20
> In the discussion Stephen had comments about the optional clocks, that
> have a circular dependency (xin24m -> cru -> i2c -> rtc -> xin32k -> cru)=
 .
> After everyone put in their argument, the discussion itself just stopped.
>=20
> I've picked up the conversion patches anyway, as this is the status-quo
> in terms of modelling clocks on Rockchip, so the yaml conversion doesn't
> change anything in either direction and just transforms what is in the
> kernel right now into the yaml format which will improve devicetree checks
> a lot and also reduce the number of warnings emitted by the checker.
>=20
> So hopefully please pull :-)
> Thanks
> Heiko
>=20
>=20
> The following changes since commit b21445db9818ccb9fa1c0ba81fd3705eb8d347=
e3:
>=20
>   dt-binding: clock: Add missing rk3568 cru bindings (2022-05-14 12:40:41=
 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.19-rockchip-clk2
>=20
> for you to fetch changes up to 32a214cd8ccbc361319bcd00b0b1b05a6b53bc61:
>=20
>   dt-bindings: clock: convert rockchip,rk3368-cru.txt to YAML (2022-05-17=
 21:05:43 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next. I skipped the previous pull and just took
this one and combined the messages.
