Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24AD6C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 052966113B
	for <linux-clk@archiver.kernel.org>; Fri, 29 Oct 2021 06:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhJ2Gph (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Oct 2021 02:45:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:56310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232058AbhJ2Gpe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 29 Oct 2021 02:45:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id AFE8D600EF;
        Fri, 29 Oct 2021 06:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635489786;
        bh=PPdoPzZSIp8MHyJVSVHe94xv6EeIPR3IDVMQEAE/l2Y=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=tHD9cKmH19hYj+PkydI0nl+GlVdHtD+adaRVbcyfQlaGexFmB6qBVu+cBJvwjj2w8
         Juave9x9iGK1oaH2Gop9VLAfe6MOW6AL9D0002A9lsIYGPbtnclUeJQ3z6wDI38ek2
         ssXdNTHldQjtERm/zoy3aLqCGZEY26WSydBWR94Fp4mdIyLMEVYwZ9+PuJEmNQM3Vl
         xTN0VIDkTpuGFpiYyUaXCHk8McBXg7Se6LgNvEyuugpE00vlS86S+d9Se9FnShaixz
         9thi7qA4Keci5jR7Hxk6u/O8Tr0RMRGJcv6L/6ZcLEBEVuW6P19FZY06faUVc5TeHg
         vYn9YKMjHe5YA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5381956.U9aoDET0nm@diego>
References: <20211027132616.1039814-1-heiko@sntech.de> <163536646616.15791.10163287623335903483@swboyd.mtv.corp.google.com> <5381956.U9aoDET0nm@diego>
Subject: Re: [PATCH 0/2] clk: rockchip: cleanup errors in (module-)driver handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     kernel@esmil.dk, linux-clk@vger.kernel.org, mturquette@baylibre.com
To:     Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>,
        linux-rockchip@lists.infradead.org
Date:   Thu, 28 Oct 2021 23:43:05 -0700
Message-ID: <163548978553.15791.2075313346592720953@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Heiko St=C3=BCbner (2021-10-27 16:20:17)
> Am Mittwoch, 27. Oktober 2021, 22:27:46 CEST schrieb Stephen Boyd:
> > Quoting Heiko Stuebner (2021-10-27 06:26:14)
> > > Recent conversions or inclusions of rk3399 and rk3568 as platform-dri=
vers
> > > and subsequently allowing them to be built as modules introduced some
> > > problems.
> > >=20
> > > These two patches try to correct them.
> >=20
> > By removing modular support? Ok.
>=20
> It looked like the easiest way to go for now.
>=20
> With all the clock-definitions as init-data still in both drivers, I don'=
t think
> anybody ever tested running this as a real module.
>=20
> We could of course also remove all the __init + __initdata attributes, but
> still wouldn't know if it actually runs as a module, without someone
> building a real test environment for it.
>=20
>=20

Sure. Do I need to pick these up directly?
