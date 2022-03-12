Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E2C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 05:04:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbiCLFF1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Mar 2022 00:05:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiCLFF0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Mar 2022 00:05:26 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26D1F22C8A8;
        Fri, 11 Mar 2022 21:04:22 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BACF4B80EF1;
        Sat, 12 Mar 2022 05:04:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AB91C340EE;
        Sat, 12 Mar 2022 05:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647061459;
        bh=Ue4yGDXPhseqkb7NonFZ7wOtLCloicTmJQv1n7hvKLI=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=U2Ozyoki/RwE2daCf2ud5cDLVUzVJ4k9DnOBSjotDahLzjOjTNQf0uyUwomOHG2CX
         fuxCleaxIxGvvBHs0zdo/MsvO9jNSDjXXofG99LtDRS/nmzqO4wYenDX9kDZyGB3wV
         OQdQ8+3ppLIzu1u7TH9DD1y60Nsz2q9J8wrQp6fPKat+QMLAJwSK/SsCKtA/++QQeJ
         fDfwcxc+KwgEMAkbzTmjCzNhhQaG8khPQ7GMlJoLs9C4TLa6u+ba0Idg/EJnobr/+e
         l+4UyHYKoNQGqc9kngtEtQ1hIJbH0kWxlOZsVN/g5odZPwPBjoR3xitirO+VP19FWs
         BN4HJLiyQrDOQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
References: <20220215084412.8090-1-marex@denx.de> <20220215084412.8090-2-marex@denx.de> <20220217222328.7F7B3C340E8@smtp.kernel.org> <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de> <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Fri, 11 Mar 2022 21:04:17 -0800
User-Agent: alot/0.10
Message-Id: <20220312050419.2AB91C340EE@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-03-09 12:54:35)
> On 2/21/22 01:58, Marek Vasut wrote:
> > On 2/17/22 23:23, Stephen Boyd wrote:
> >=20
> >> I see that there isn't any more 'clock-critical' in the kernel's dts so
> >> I wonder if we would be able to get rid of that function or at least
> >> hollow it out and see if anyone complains. Either way, what is the
> >> actual problem trying to be solved? If the crystal oscillator isn't us=
ed
> >> anywhere in the kernel why are we registering it with the clk framewor=
k?
> >=20
> > The problem is the other way around -- the SoC clock IPs often have a=20
> > couple of general purpose clock routed to various SoC IO pins, those=20
> > clock can be used for any purpose, and those are already registered wit=
h=20
> > kernel clock framework. Some devices save on BoM and use those general =

> > purpose clock to supply clock networks which are otherwise not=20
> > interacting with the kernel, like some CPLD for example. Since from the=
=20
> > kernel point of view, those clock are unused, the kernel can turn those=
=20
> > clock OFF and that will make the entire device fail.
> >=20
> > So this critical-clocks property permits marking clock which must not=20
> > ever be turned OFF accordingly.
>=20
> How can we proceed here ?

Why are we registering the clks with the framework on device that are
saving on BoM and using them outside of the kernel. What is the use of
kernel memory for struct clk_core that aren't ever used?
