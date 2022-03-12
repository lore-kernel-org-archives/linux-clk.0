Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCB15C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 12 Mar 2022 03:08:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbiCLDJu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Mar 2022 22:09:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiCLDJt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Mar 2022 22:09:49 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 824E114E972
        for <linux-clk@vger.kernel.org>; Fri, 11 Mar 2022 19:08:45 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3C8DAB80EDE
        for <linux-clk@vger.kernel.org>; Sat, 12 Mar 2022 03:08:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB69FC340E9;
        Sat, 12 Mar 2022 03:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647054522;
        bh=b8BccljxP6pjlkkeTT/uLJrHoMWJhjstlpN4rJId/hE=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=gA29R6PxdqXCY8jqoECYDZc73P2DQLd7rKVzNF0aFvqmi6XBG0Pu+qSqp5FmVsFND
         SwxtUh4ypiCJswMJ5TeR81GOfmX+IZ+1j94i3l58u3HqQukTU1jWo6V0xmN2LNeUnn
         nVZO+a0VyO6NSIl5uFMJuKHD7ctVgTInmnzbO4u1G2j/1dEVB7a2bPldWYaSV+qd/I
         ueFGdrNb+e6c2Ph/QLzbxAeB10xeSO8X5kw7Ctu1CMKG4kFqJf620E4hc5fiS+oPRZ
         poEpxMCKR44Xtm2skWo8EkD6WOatDaZidB0wiMcMskIX+TrspFTaM+anN4pr/bnyy/
         pr6EKLDM7Z6YA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
Subject: Re: [PATCH v7 00/12] clk: Improve clock range handling
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>
Date:   Fri, 11 Mar 2022 19:08:39 -0800
User-Agent: alot/0.10
Message-Id: <20220312030842.DB69FC340E9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-02-25 06:35:22)
> Hi,
>=20
> This is a follow-up of the discussion here:
> https://lore.kernel.org/linux-clk/20210319150355.xzw7ikwdaga2dwhv@gilmour/
>=20
> and here:
> https://lore.kernel.org/all/20210914093515.260031-1-maxime@cerno.tech/
>=20
> While the initial proposal implemented a new API to temporarily raise and=
 lower
> clock rates based on consumer workloads, Stephen suggested an
> alternative approach implemented here.
>=20
> The main issue that needed to be addressed in our case was that in a
> situation where we would have multiple calls to clk_set_rate_range, we
> would end up with a clock at the maximum of the minimums being set. This
> would be expected, but the issue was that if one of the users was to
> relax or drop its requirements, the rate would be left unchanged, even
> though the ideal rate would have changed.
>=20
> So something like
>=20
> clk_set_rate(user1_clk, 1000);
> clk_set_min_rate(user1_clk, 2000);
> clk_set_min_rate(user2_clk, 3000);
> clk_set_min_rate(user2_clk, 1000);
>=20
> Would leave the clock running at 3000Hz, while the minimum would now be
> 2000Hz.
>=20
> This was mostly due to the fact that the core only triggers a rate
> change in clk_set_rate_range() if the current rate is outside of the
> boundaries, but not if it's within the new boundaries.
>=20
> That series changes that and will trigger a rate change on every call,
> with the former rate being tried again. This way, providers have a
> chance to follow whatever policy they see fit for a given clock each
> time the boundaries change.
>=20
> This series also implements some kunit tests, first to test a few rate
> related functions in the CCF, and then extends it to make sure that
> behaviour has some test coverage.
>=20
> Let me know what you think

Thanks. I'm going to apply this to clk-next but not the last two drm
patches. That is OK?
