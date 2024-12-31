Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B951747F;
	Tue, 31 Dec 2024 01:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735607308; cv=none; b=KNjbIEd5PWPQXjbHHK/2Qrev2/W4E0+DeTp7qLqx3uN4d0AExDGDFBLQmmwc1/rAW3EcKtL1eIma4FFTMdZ6y8VVKbzulhWrKqH2HN/szjKS9aH0pZ0a87eO1w0daZNYmZgtRTHJYwr/hfuSPwGOSvPrhLDoj/r1vak8oDs1FFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735607308; c=relaxed/simple;
	bh=QI5mw6wnZSgD1nFW136DzCxyIUeU8TIBkz4tsCkLyhY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=ssvRjn8O/Qd1Uy67QgV1BSGndp/9keoCeLGJsCpMPyVIccTVrZmCua2LkLFhTdQ1wx+CWfSsyPRH5PcWrLxDjw19tdT9Z0DI7iQcEhc7csn49YgGyGqZfyfrQgy59Tpu2Z6jX5EcnZl+Y5ApwP4CAVZvmi2xT2id27Xnl4LByCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNozVAjE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNozVAjE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618ECC4CED0;
	Tue, 31 Dec 2024 01:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735607308;
	bh=QI5mw6wnZSgD1nFW136DzCxyIUeU8TIBkz4tsCkLyhY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TNozVAjERWoU4C1mjoTpkxb9RIu7pB3lOXTli+mA9o9vuFlxCCctdkd6DteNHkgeS
	 A8iLyUcmTRmuAMkHDtA19m2kpLbw7fzRcVG0E3rHidXP1XedTq0AX6M5iRmjMprE+0
	 W1VarRtMrtUQj24wUiLuR7T3BTcjQt27KM6h5H7CnEoqD5YGukR9+nkeo7z4I4pWS8
	 LbDWU3J72GY3wYg+PppL5eAt/zOKWU5fccStQcXYOZbX5TDCgYXwwbZI5gW9VgjnWk
	 8Wo+z3oHWALCTDLUXhX7WPnaBONIqTXcwgOVGyEGhPNS+WvqBxbfJGIQQ+8I0ZTPma
	 og6b1rx04zqoQ==
Message-ID: <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Mon, 30 Dec 2024 17:08:26 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Jerome Brunet (2024-12-21 03:09:28)
> On Fri 20 Dec 2024 at 16:12, Stephen Boyd <sboyd@kernel.org> wrote:
>=20
> > Quoting Jerome Brunet (2024-12-20 09:17:43)
> >> Remove the big clk_regmap tables that are used to populate the regmap
> >> field of clk_regmap clocks at runtime. Instead of using tables, use de=
vres
> >> to allow the clocks to get the necessary regmap.
> >>=20
> >> A simpler solution would have been to use dev_get_regmap() but this wo=
uld
> >> not work with syscon based controllers.
> >
> > Why not have two init functions, one that uses the syscon approach from
> > the parent device?
>=20
> That would duplicate all the ops and would not scale if anything else
> comes along. It would also tie the controller quirks with
> clock ops. I would like to keep to clock ops and controllers decoupled as
> much as possible

Hmm... Maybe the init function should be moved out of the clk_ops and
into the clk_init_data structure. It isn't used beyond registration time
anyway, so it may make sense to do that and decouple the clk_ops from
the controllers completely. Or we can have two init routines, one for
the software side and one for the hardware side, but that's probably
confusing. If anything, a clk hardware init function can be exported and
called from the clk software init function if needed.

>=20
> > Is the typical path to not use a syscon anyway?
> >
>=20
> I sure hope there will be no new syscon based controller but, ATM, around
> 50% are syscon based in drivers/clk/meson. Those are here to stay and I
> doubt we can do anything about it.

Ok.

>=20
> >>=20
> >> This rework save a bit memory and the result is less of a maintenance
> >> burden.
> >>=20
> >> Unfortunately meson8b is left out for now since it is an early clock
> >> driver that does not have proper device support for now.
> >
> > We should add a clk_hw_get_of_node() function that returns
> > hw->core->of_node. Then there can be a similar function that looks at
> > the of_node of a clk registered with of_clk_hw_register() and tries to
> > find the regmap either with
> > syscon_node_to_regmap(clk_hw_get_of_node(hw)) or on the parent of the
> > node for the clk.
>=20
> That's the thing. It means encoding the controller quirk of how to get
> regmap in the clock ops. I would be prefer to avoid that.

So if we moved the init function out of struct clk_ops it would work?
We could have helpers for the common paths, i.e. the device has the
regmap, or the syscon has the regmap, etc.

>=20
> With what you are suggesting I could make an ops that
> * Try dev_get_regmap() first
> * Try the syscon/of_node way next
>=20
> I can make this "trial an error" approach work but I think it is pretty
> nasty and encode controller stuff inside the clock driver.

I get it. The difference in driver design while sharing the same clk
hardware and clk_ops causes this tension.

>=20
> >
> > TL;DR: Don't use devres.
>=20
> Using it makes thing nice and tidy. clk_regmap does not care were regmap
> comes from. It just picks it up where it has been prepared

It doesn't work for early clocks that don't have a device.

>=20
> That approach could be extended to support controller with multiple
> regmaps, with a name that does not depend on regmap_config and is local
> to the clock controller. This will be useful when the name if defined
> somewhere else (syscon, auxiliary device, etc ...)
>=20

I think you're saying that clk_ops can be common things that aren't
device/clk controller specific, while the regmap config is usually
device/clk controller specific. Furthermore, the name of the regmap is
also usually device/clk controller specific. The regmap assignment
doesn't really fit with the clk_ops because it's not operating on the
clk hardware like the other clk_ops all do.
