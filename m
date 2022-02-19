Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB8C9C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 02:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240107AbiBSCZy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Feb 2022 21:25:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239697AbiBSCZx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Feb 2022 21:25:53 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B141B26BDEE
        for <linux-clk@vger.kernel.org>; Fri, 18 Feb 2022 18:25:35 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 60591B826BC
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 02:25:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19227C340E9;
        Sat, 19 Feb 2022 02:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645237533;
        bh=FnVa1xVB9YhDkjc7gPDZ4kLUXv+dygb6k5OMqL+a2n4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=cVHSCJrIPoLOJISwMTLHqzpD3Jn0yv7ymKVfbloj3biyNiiZug69wZcoEMvKG/+QV
         +dcXBRhPF3EvMGVnpuDCOJcRmWSJKSIp95g8cV7L1/mqeWKy+7Jdsby/bBZmQJQsjr
         3fWOv0IeHvMR/aS/xPCOp5t2i4EhMSzoTU9WjfoaYf3/VbW1FWSzii9Pgap3q/I2Mv
         D39g8t15cXAvxkxANM3kyRSiG/0HP5zmEBHrzRCLBH2knglxTbACqkPta/a5S0fw4J
         g2cIVCI4Kxjhc7Qp2flvAkRsYs1OKII22ZarNGAE+IgtJalLiAUwrMiU/aq/ZjG9uu
         yQAFnj150mc7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220210101916.3bsgkbbklyvwowla@houat>
References: <20220125141549.747889-1-maxime@cerno.tech> <20220210101916.3bsgkbbklyvwowla@houat>
Subject: Re: [PATCH v4 00/10] clk: Improve clock range handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Fri, 18 Feb 2022 18:25:31 -0800
User-Agent: alot/0.10
Message-Id: <20220219022533.19227C340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-10 02:19:16)
> Hi Stephen,
>=20
> On Tue, Jan 25, 2022 at 03:15:39PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > This is a follow-up of the discussion here:
> > https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmo=
ur/
> >=20
> > and here:
> > https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
> >=20
> > While the initial proposal implemented a new API to temporarily raise a=
nd lower
> > clock rates based on consumer workloads, Stephen suggested an
> > alternative approach implemented here.
> >=20
> > The main issue that needed to be addressed in our case was that in a
> > situation where we would have multiple calls to clk_set_rate_range, we
> > would end up with a clock at the maximum of the minimums being set. This
> > would be expected, but the issue was that if one of the users was to
> > relax or drop its requirements, the rate would be left unchanged, even
> > though the ideal rate would have changed.
> >=20
> > So something like
> >=20
> > clk_set_rate(user1_clk, 1000);
> > clk_set_min_rate(user1_clk, 2000);
> > clk_set_min_rate(user2_clk, 3000);
> > clk_set_min_rate(user2_clk, 1000);
> >=20
> > Would leave the clock running at 3000Hz, while the minimum would now be
> > 2000Hz.
> >=20
> > This was mostly due to the fact that the core only triggers a rate
> > change in clk_set_rate_range() if the current rate is outside of the
> > boundaries, but not if it's within the new boundaries.
> >=20
> > That series changes that and will trigger a rate change on every call,
> > with the former rate being tried again. This way, providers have a
> > chance to follow whatever policy they see fit for a given clock each
> > time the boundaries change.
> >=20
> > This series also implements some kunit tests, first to test a few rate
> > related functions in the CCF, and then extends it to make sure that
> > behaviour has some test coverage.
>=20
> As far as I know, this should address any concern you had with the
> previous iterations.
>=20
> Is there something else you'd like to see fixed/improved?

Looks much improved. Some minor nits and requests for more test cases. I
hope we can merge it next week or so. I'll be on the lookout for the
next round.
