Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB398C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 00:59:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C20FC610E7
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 00:59:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbhKCBCF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 2 Nov 2021 21:02:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:51756 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229778AbhKCBCF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 2 Nov 2021 21:02:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8582F60FC4;
        Wed,  3 Nov 2021 00:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635901169;
        bh=EE/bOVd8vhFU3MMrom1BvHLf8zsd5QVrHEBuJ973vWY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=qN+p7UfX2eCOwF2fgyolD0kfSXyQ+yp/cmA2hul9GmNjOsQg+dBTWlQ991uEr05j1
         HWSTh9Zt5K8gYaO/pRAfzS3r+tIhqJuGOLBs/SgPy7r7VDZNELc8W0hz1zSsJyVv27
         YZ09eCSEllp2jko99wvBD5pjlDjzhTAPxrwU9OGlwgGD7izH+lKO0DvA/O3K9RW6Dn
         uJ38S/6cgHt/cKpN7Ht4v8GpuaFPAKq9mv8j1eE2+95ez+iwytT+nAbXdlkFL6bG+R
         838AI+lHb88kZzkRI+qKdkR8FpXMb+2OEXGJXwvlrkrzFjNx8QSe98aEVPBSdUmpJg
         oeQ8WaDHMJy3g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2912588.a5UK1EFgBA@diego>
References: <20211027132616.1039814-1-heiko@sntech.de> <5381956.U9aoDET0nm@diego> <163548978553.15791.2075313346592720953@swboyd.mtv.corp.google.com> <2912588.a5UK1EFgBA@diego>
Subject: Re: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org, mturquette@baylibre.com
To:     Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Date:   Tue, 02 Nov 2021 17:59:28 -0700
Message-ID: <163590116816.2993099.4747068629839558630@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko St=C3=BCbner (2021-10-29 05:37:06)
> Am Freitag, 29. Oktober 2021, 08:43:05 CEST schrieb Stephen Boyd:
> > Quoting Heiko St=EF=BF=BDbner (2021-10-27 16:20:17)
> > > Am Mittwoch, 27. Oktober 2021, 22:27:46 CEST schrieb Stephen Boyd:
> > > > Quoting Heiko Stuebner (2021-10-27 06:26:14)
> > > > > Recent conversions or inclusions of rk3399 and rk3568 as platform=
-drivers
> > > > > and subsequently allowing them to be built as modules introduced =
some
> > > > > problems.
> > > > >=20
> > > > > These two patches try to correct them.
> > > >=20
> > > > By removing modular support? Ok.
> > >=20
> > > It looked like the easiest way to go for now.
> > >=20
> > > With all the clock-definitions as init-data still in both drivers, I =
don't think
> > > anybody ever tested running this as a real module.
> > >=20
> > > We could of course also remove all the __init + __initdata attributes=
, but
> > > still wouldn't know if it actually runs as a module, without someone
> > > building a real test environment for it.
> > >=20
> > >=20
> >=20
> > Sure. Do I need to pick these up directly?
>=20
> I don't have anything more for 5.16 and the 5.15 release should happen
> on sunday, so yeah just pick them if you like - no need for doing a separ=
ate
> pull request.
>=20

Ok I picked them up and I'll send them off next week.
