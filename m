Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877D6C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  9 Mar 2022 18:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236876AbiCISud (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Mar 2022 13:50:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbiCISub (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 9 Mar 2022 13:50:31 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFEB11A41D2
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 10:49:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D126DB82253
        for <linux-clk@vger.kernel.org>; Wed,  9 Mar 2022 18:49:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740CFC340E8;
        Wed,  9 Mar 2022 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1646851768;
        bh=6IlXcKWsuvQQo15ETubC7YeXzDc8mnXi+RwnlwgPmgg=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=fsXF4ziFsuvqfo4avTVFx/WNwtBh54mC2qk8aX3TUJQbdx8HKaP4R3tbUqM4/ante
         uCcAstQKOB+PLUFPYRQkbdQ7uSSX6R58lG4KCV9Q4cb+0fLrirkLx+aK+D5rDcLaJ4
         qKOilrme6OWWlf+G4acUWZWr3S5RjFMh4aEn2pjG2y6K+5eoXFwdEM/bHOFbz9opnj
         cioTnq4HkeJYKeCxzVrAtppyl/Ihc3Qcr35yUPh2URO45LVRxk9I/mf5kh4wTpQXSl
         hdkNtcckj/EmtoFvnEPQVIgxAMlZ9u8yTRxR+gURiRFO7bFankpxm56yD6YWhPpC2Q
         c90zCADRGiZhw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5797913.TNu9mpgMAd@phil>
References: <5797913.TNu9mpgMAd@phil>
Subject: Re: [GIT PULL] Rockchip clock changes for 5.18
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org
To:     Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com
Date:   Wed, 09 Mar 2022 10:49:26 -0800
User-Agent: alot/0.10
Message-Id: <20220309184928.740CFC340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko Stuebner (2022-02-24 14:40:21)
> Hi Mike, Stephen,
>=20
> please find below some Rockchip clock changes for 5.18
>=20
> Please pull, thanks
> Heiko
>=20
> The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac=
07:
>=20
>   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git =
tags/v5.18-rockchip-clk1
>=20
> for you to fetch changes up to 10b74af310735860510a533433b1d3ab2e05a138:
>=20
>   clk: rockchip: re-add rational best approximation algorithm to the frac=
tional divider (2022-02-24 00:07:16 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
