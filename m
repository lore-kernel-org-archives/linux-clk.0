Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A395BEB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 18:40:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229729AbjFMSkH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 14:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240350AbjFMSkD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 14:40:03 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCEE19BC
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 11:40:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7B23D63980
        for <linux-clk@vger.kernel.org>; Tue, 13 Jun 2023 18:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D308FC433F0;
        Tue, 13 Jun 2023 18:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686681600;
        bh=5ufNAgPD5LD1NXK8YkQlCfuEwqVGGYywLrxQvacxJPA=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=hJ+yNPIk9tlqo70CZPEeyHMrrSWtZ+iSWWR1gT6JfRqHJr0C6F7Q+32rim6jG3QV4
         WC5eKRieGEcDyuqoo2VEuYgFh1KSplESLXlh9mbN3yLovpeVDjIro/m5IM/9zUkBka
         pmEkP4PQb2FFE5lh5cj2cRKQy5pMpzNah41Y+EB6OoS/MO0oQbDYLWCo+yxkzwoLqG
         KYv4555nalZAmNAig7VWCQOTd/pH+6Az5bQleHZSrX8ue78zBc4gP4QU4ZmIvRkuGC
         aUZi2smamJlCEr5qIPhJIq9U54dKjTWL2TgPdujqPex0MQz1N8g6Hxz38Ac/B6E7Xa
         luSc/mROtKtAg==
Message-ID: <e0b1d62767939b22e962648ceab06bed.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ukjgbguxqxfs6u2igivmxmmidvjvumqfptwvjymk7n6p22isqv@tbubrts5a6wp>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech> <20221018-clk-range-checks-fixes-v4-7-971d5077e7d2@cerno.tech> <e8a1f3244395dc707a1d741e2d166a7b.sboyd@kernel.org> <ukjgbguxqxfs6u2igivmxmmidvjvumqfptwvjymk7n6p22isqv@tbubrts5a6wp>
Subject: Re: [PATCH v4 07/68] clk: test: Add a determine_rate hook
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
To:     Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 13 Jun 2023 11:39:58 -0700
User-Agent: alot/0.10
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2023-06-13 01:21:59)
> On Thu, Jun 08, 2023 at 06:41:56PM -0700, Stephen Boyd wrote:
> > Quoting Maxime Ripard (2023-05-05 04:25:09)
>=20
> > > +        * __clk_mux_determine_rate() here, if we use it and call
> > > +        * clk_round_rate() or clk_set_rate() with a rate lower than
> > > +        * what all the parents can provide, it will return -EINVAL.
> > > +        *
> > > +        * This is due to the fact that it has the undocumented
> > > +        * behaviour to always pick up the closest rate higher than t=
he
> > > +        * requested rate. If we get something lower, it thus conside=
rs
> > > +        * that it's not acceptable and will return an error.
> > > +        *
> > > +        * It's somewhat inconsistent and creates a weird threshold
> > > +        * between rates above the parent rate which would be rounded=
 to
> > > +        * what the parent can provide, but rates below will simply
> > > +        * return an error.
> > > +        */
>=20
> I guess it's mostly a policy decision: __clk_mux_determine_rate() always
> has been returning rates that are lower or equal to the target rate.
>=20
> If no parent can provide one, then the obvious solution is to error out,
> which creates the inconsistency mentioned above.
>=20
> Another solution would be to pick up a parent by default (the current
> one maybe?) but then we could return a rate higher than the target rate
> which breaks what we've been doing so far.
>=20
> I'm not sure if one is better than the other.

We should pick a rounding policy that we want for the test. The test
shouldn't be checking the rounding policy. It should be checking that
the code under test does what is expected when the rounding policy is
what we choose.

If __clk_mux_determine_rate() returns an error when the rate is lower
than the parent supports then we should test that as well and make sure
it does return an error in this case. We can directly call
__clk_mux_determine_rate() after registering the clks so that the
function is isolated.

We should also be testing what the clk API will do if a determine_rate()
clk_op returns an error. And what it will do if the clk has multiple
parents, etc. I'm mostly confused that it's marked as a FIXME when the
test should be doing wacky things to test various pieces of code.
