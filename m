Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157CB1DFDB8;
	Mon,  6 Jan 2025 21:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736197749; cv=none; b=GFdpcZuOv2zsDu/JDCb3VlVeBRw5fGRR+tRgGNMGw1AhwlsOem4cvma/YjxrQF1hzWbaqB2J9kp/a4ECiFkKr1YvMCmkDf5bwS3AfDUnGdusIpwTXyKlBEoGpy6mq0x1gDgwIHevjwChyiPbUqm8JyIKQS0g6TKC/Nko0lXQ09g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736197749; c=relaxed/simple;
	bh=d1lmIkFGT2wN5FlmMfsKR7+J04liC6MhrcnlDGlR1cs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qrBiQzyrCGrmqF4/VD1cz0uvq8MdQ7bO3Jt2tmLyU0+EB/736RA9n6iS7JhdnXUoVsKJhETvkCSZOTbx8PAa8+fmEwxfrr3fwVQU+ojnTrI6znLGfulkyyPbDx1wEtU0Rmuf9fxBVPliAfnIBf6b8fiBNWqLIXlXrzmhwIMZcNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qG+EVTQ1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qG+EVTQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78F62C4CED2;
	Mon,  6 Jan 2025 21:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736197748;
	bh=d1lmIkFGT2wN5FlmMfsKR7+J04liC6MhrcnlDGlR1cs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qG+EVTQ1EzEZrWxgJZTuUZTyxf80bfaH5aOPwR5X36MK4fcqLobeWv71FAMsgyjj2
	 ahvGMkJFOsWaRszDn5eyDDmcutreJajnKH/9hzlj2msnPUkaRV/PC/HLlzCNf0ZeHi
	 zmR3Bu5vdHsrUNBcUZRHaViH+op1QJ0bEh2bZsJfXRV0uak/24quKi2qkg0O5vq6rY
	 p4wMev+CUEijy1mIZCX1i1el4/030xY3DRhzcvu6sgi/AeapUxHJ2hnAPYloiIlxvp
	 Twjv5b/92Ej3Xoe/HTgP6JKrDLnsOfsdslIh9XSXKJ7/1RSHluL3duF9RjzCtqMggu
	 tM4MpuGoIkxsg==
Message-ID: <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com> <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 06 Jan 2025 13:09:06 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Jerome Brunet (2025-01-06 02:12:16)
> On Mon 30 Dec 2024 at 17:08, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2024-12-21 03:09:28)
> >> On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:
> >>=20
> >> > Quoting Jerome Brunet (2024-12-20 09:17:43)
> >> >> Remove the big clk_regmap tables that are used to populate the regm=
ap
> >> >> field of clk_regmap clocks at runtime. Instead of using tables, use=
 devres
> >> >> to allow the clocks to get the necessary regmap.
> >> >>=20
> >> >> A simpler solution would have been to use dev_get_regmap() but this=
 would
> >> >> not work with syscon based controllers.
> >> >
> >> > Why not have two init functions, one that uses the syscon approach f=
rom
> >> > the parent device?
> >>=20
> >> That would duplicate all the ops and would not scale if anything else
> >> comes along. It would also tie the controller quirks with
> >> clock ops. I would like to keep to clock ops and controllers decoupled=
 as
> >> much as possible
> >
> > Hmm... Maybe the init function should be moved out of the clk_ops and
> > into the clk_init_data structure. It isn't used beyond registration time
> > anyway, so it may make sense to do that and decouple the clk_ops from
> > the controllers completely. Or we can have two init routines, one for
> > the software side and one for the hardware side, but that's probably
> > confusing. If anything, a clk hardware init function can be exported and
> > called from the clk software init function if needed.
>=20
> The .init() is really for the clock itself, so it makes sense for it to
> in the ops. Removing the init from the ops would just be another layer of
> controller init, something we can deal with in the probe() function.
>=20
> What I'm trying to do here is properly decouple what belongs in each.

Got it.

>=20
> >
> >>=20
> >> > Is the typical path to not use a syscon anyway?
> >> >
> >>=20
> >> I sure hope there will be no new syscon based controller but, ATM, aro=
und
> >> 50% are syscon based in drivers/clk/meson. Those are here to stay and I
> >> doubt we can do anything about it.
> >
> > Ok.
> >
> >>=20
> >> >>=20
> >> >> This rework save a bit memory and the result is less of a maintenan=
ce
> >> >> burden.
> >> >>=20
> >> >> Unfortunately meson8b is left out for now since it is an early clock
> >> >> driver that does not have proper device support for now.
> >> >
> >> > We should add a clk_hw_get_of_node() function that returns
> >> > hw->core->of_node. Then there can be a similar function that looks at
> >> > the of_node of a clk registered with of_clk_hw_register() and tries =
to
> >> > find the regmap either with
> >> > syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
> >> > node for the clk.
> >>=20
> >> That's the thing. It means encoding the controller quirk of how to get
> >> regmap in the clock ops. I would be prefer to avoid that.
> >
> > So if we moved the init function out of struct clk_ops it would work?
>=20
> That's already what I'm doing actually. I have the controller part which
> position regmap so the clock part may get it regardless of where it
> comes from (syscon, io or something else)
>=20
> > We could have helpers for the common paths, i.e. the device has the
> > regmap, or the syscon has the regmap, etc.
>=20
> I think this is what I'm doing actually.

Great!

> >
> >>=20
> >> >
> >> > TL;DR: Don't use devres.
> >>=20
> >> Using it makes thing nice and tidy. clk_regmap does not care were regm=
ap
> >> comes from. It just picks it up where it has been prepared
> >
> > It doesn't work for early clocks that don't have a device.
>=20
> This is why I left the possibility for regmap to be "pre-populated" so it
> continues to work the way it previously did.

I missed that part. If the old way stills works then we stay in the
halfway state which is undesirable. It's better to just finish a
transition.

>=20
> I admit early clocks is a low priority for me since I only have one
> controller like this and I do not expect more.
>=20
> If cleaning up this particular case is important, then I could add
> another level of init:
> * A callback passed along the init data of the clock to get the regmap.
>   That callback would be called by the .init() ops, if set.
>   That can encode any quirks without polluting the ops.
> * It will grow the init data so the change won't save memory anymore.
>   This was more a bonus so I don't really mind. Maintainability is more
>   important.

The struct clk_init_data _can_ be thrown away or reused, but it isn't
always done that way.

> * If the callback is not set, then it goes through the default, as
>   proposed here. This would avoid patching all the clk_regmap clock of
>   every controller.
>=20
>=20
> > Furthermore, the name of the regmap is
> > also usually device/clk controller specific.
>=20
> The name registered in regmap_config itself is device specific, not
> controller specific, since it can come from something else in the
> platform (syscon or even aux devs), that why I think an independent
> namespace is desirable -- Same goes the generic solution Conor is
> working on I think.

Alright.

>=20
> > The regmap assignment
> > doesn't really fit with the clk_ops because it's not operating on the
> > clk hardware like the other clk_ops all do.
>=20
> I see what you mean and I agree. It does not operate on the hardware but
> it does collect the resources it needs to operate the HW, and ideally
> it should do just that - without controller quirks popping up there.
>=20
> Anyway a callback passed in init data takes care of 'io vs syscon'
> controller too, same as devres. I can go that route if this is what you
> prefer. I thought devres was a more elegant solution but it is indeed
> restricted to 'device enabled' controllers.=20
>=20
> The change will be a bit ugly in the syscon ones but I don't mind.
> Is that fine for v2 ?
>=20

Sure. I wonder if we should make it a 'const void *data' member of
struct clk_init_data so it can be anything and then either take a flag
day to pass that to the struct clk_ops::init() function or set the
struct clk_hw::init member to NULL after the init function is called. If
we're concerned about bloating clk_init_data then we could introduce
another two registration APIs that take a data argument and then pass
that to the init function.

 int clk_hw_register_data(struct device *dev, struct clk_hw *hw, const void=
 *data)
 int of_clk_hw_register_data(struct device *dev, struct clk_hw *hw, const v=
oid *data)

or we could wrap the init data in a container struct in the drivers and
move the setting of struct clk_hw::init to NULL after calling the init
function.

	struct clk_driver_init_data {
		void *data;
		int (*driver_init_function)(struct clk_hw *hw);
		int (*regmap_driver_init_function)(struct clk_regmap *rclk);
		etc...

		struct clk_init_data init;
	};

Then the clk provider can use container_of(). If we did this we could
even copy the contents of struct clk_hw::init into the driver specific
wrapper that lives on the stack, repoint the struct clk_hw::init pointer
to the stack copy, and then all the logic can live in the clk provider
driver that registers the clk.

This last option may be the best because it saves memory by not
increasing the size of 'struct clk_init_data' and doesn't require a flag
day to change the function signature of struct clk_ops::init(), even if
there's only a handful of those right now. What do you think?
