Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 739EEC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 17 May 2022 22:19:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiEQWTb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 May 2022 18:19:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbiEQWTa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 May 2022 18:19:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52FF43C719
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 15:19:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D661D60FB0
        for <linux-clk@vger.kernel.org>; Tue, 17 May 2022 22:19:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E5B7C34118;
        Tue, 17 May 2022 22:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1652825968;
        bh=mFLGnAFNfhDLPFt9oeV7FYWUbLbyyvFH3zlUGOjfHTA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LsAYhuWnAE492gwWLqYiH8Jhn3K1W+EzQ0PIk58eD2KsBTnliRDQrDrMH2dmOL4pN
         TFMxVxYeqJEIH+WA2/8zmNALR1MjO6P88l2wYbXUUs91CfFcGrsk5G+C3zBAJmYWh9
         nvgbH7mqzMTE9mDagb6vRQxPtLMhPYP8HYFGWQobSfzWR7h7SnuZhy9GGIKMXV73CG
         IykPUG8/KrjErokgSpLZkbmZ3Eb19IZFeTr6wvXz8zdsvA1ejNWUn1DBrXqifxlVVv
         MA01OQDj/JBpZ7sJ4h4IfuVFPpnzqf1di6F06t9sH183naDmnLlBI9ayoADPtw8L7p
         40vUIXP9Er6lg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8148508.MhkbZ0Pkbq@phil>
References: <8148508.MhkbZ0Pkbq@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.19
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Tue, 17 May 2022 15:19:26 -0700
User-Agent: alot/0.10
Message-Id: <20220517221928.2E5B7C34118@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2022-05-17 12:25:19)
> Hi Mike, Stephen,
>=20
> please find below some Rockchip clock changes for 5.19.
>=20
> I've split out the conversion from txt to yaml into a separate tag
> which'll follow shortly.
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc=
17:
>=20
>   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.19-rockchip-clk1
>=20
> for you to fetch changes up to b21445db9818ccb9fa1c0ba81fd3705eb8d347e3:
>=20
>   dt-binding: clock: Add missing rk3568 cru bindings (2022-05-14 12:40:41=
 +0200)
>=20
> ----------------------------------------------------------------

Applied to clk-next
