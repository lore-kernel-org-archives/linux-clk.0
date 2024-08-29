Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B435E14A4EB
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724958158; cv=none; b=i4jDU7TcM5JhaJKfxIAsIz48h/kSsyDfiEb0wFVGJ72OraaCv/JUwoqqmjpQtc8t1cqNJq4OFQtz2cbi7Jgv4b2ciOhoivvfEu+YXAsWGJG5DTPOkwCQxp+z8pkNhGIg0h19SU+DAZPYJG//WhToRtm1VKF/qZ3mTEM23NHYZJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724958158; c=relaxed/simple;
	bh=fmkaF5hgSF3AR/OYJtc7yqokimhhp/WgEdtDf+IUXCk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=YHFYkPTm9VUV85KeHbbYk5cAMBzF955aIuqpqiH69dzDyxpfgFgMH3ZG5/a6CeQQvo7HaNhtsNI+34Xdodx5rETe12raHdGj1T6I6DKQLZaPuPxZwP2bXjW16UgVIGLsBAUmz3TQnug8qTDSGiN6pssOGYCJyJ7U3VSFud16B6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ulBG110B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ulBG110B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B6C4CEC5;
	Thu, 29 Aug 2024 19:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724958158;
	bh=fmkaF5hgSF3AR/OYJtc7yqokimhhp/WgEdtDf+IUXCk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ulBG110BQudla/JSU8jjfx/vmljVJKtWheFzh6a0AdSXynzX0ZDg33jTXw5U5uN3Q
	 k4HC49IJZA+TMA493ZXcUk49FaI+XLOJOv+qsiBFL7w/iTMgslGEbjZ7Kq5zeIeJdv
	 SBefbCLGLQSb0GiMRW/KJGDGkSq1FoKQVRs1UuL6UuOeOs6/kNG2SZozDvuLtWbaD+
	 Xj6IBOVXj5hn+u0ADVB+43FwVt3izZmDUxYpyGCinEKQvOihtEaHVQAj0btK44riYn
	 QiS6FuZ4KB/UEMAuxxubgCgxMX19eVUvULw7rSmtJOdwcNLZQ+A8E4tyBQh0iOiP2e
	 fwiY/idlfOevw==
Message-ID: <7f295bf3b095bace843c28adc9941344.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <PH7PR12MB728472C3022ADCD8DF5576DD8A962@PH7PR12MB7284.namprd12.prod.outlook.com>
References: <20240722121910.14647-1-naman.trivedimanojbhai@amd.com> <ac67f76d4b4b5f4bf108c1457f1263c7.sboyd@kernel.org> <PH7PR12MB72845D56BF4361441AA9CB9A8A852@PH7PR12MB7284.namprd12.prod.outlook.com> <1234a0176de236abb603f96ab9a1d6a1.sboyd@kernel.org> <PH7PR12MB728472C3022ADCD8DF5576DD8A962@PH7PR12MB7284.namprd12.prod.outlook.com>
Subject: RE: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@ <"vger.kernel.org linux-kernel"@vger.kernel.org>
To: "Simek, Michal" <michal.simek@amd.com>, "Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>, "Trivedi Manojbhai, Naman" <Naman.TrivediManojbhai@amd.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Thu, 29 Aug 2024 12:02:36 -0700
User-Agent: alot/0.10

Quoting Trivedi Manojbhai, Naman (2024-08-28 22:54:16)
> >> >> +566,30 @@ static int zynqmp_get_parent_list(struct device_node
> >> >> +*np,
> >> >> u32 clk_id,
> >> >>
> >> >>         for (i =3D 0; i < total_parents; i++) {
> >> >>                 if (!parents[i].flag) {
> >> >> -                       parent_list[i] =3D parents[i].name;
> >> >> +                       ret =3D of_property_match_string(np,
> >> >> + "clock-names",
> >> >> +
> >> >> + parents[i].name);
> >> >
> >> >You shouldn't need to match 'clock-names'. The order of that property
> >> >is fixed in the binding, which means you can simply use the index
> >> >that the name is at in the binding in 'struct parent_data'.
> >>
> >> This driver is common across multiple device families, and each device=
 has
> >different set of clock names in device tree/binding.  This implementation
> >seemed to be generic for all devices.
> >> To use index directly, I have to add if..else for matching compatible =
strings
> >and more if..else inside each of them for matching clock names to find i=
ndex.
> >Please let me know if this is preferred approach.
> >
> >It is preferred to not use clock-names and use the index directly. This =
avoids a
> >bunch of string comparisons and makes for smaller and faster code.
>=20
> Agreed, using the "clock-names" adds string comparisons, however, two rea=
sons why I think comparing with 'clock-names' is necessary.
> =20
> First, the clock driver is common for multiple platforms. And all platfor=
ms have their unique DT binding.
> So, clock name to DT index mapping is platform specific. Which means the =
driver will have to hardcode the clock name to index mapping for each platf=
orm.

The clock name to DT index mapping must be described in the binding.

>=20
> Second, clock parents information is received from firmware. The parents =
of a clock may or may not be present in the DT node 'clock-controller' as m=
any clocks have "intermediate" clocks as parent.
> We don't have DT index for intermediate clocks so need to register by fw_=
name.=20

If there isn't a DT index for those intermediate clks then they should
be using a clk_hw pointer directly. The fw_name member matches an index
in the clock-names property, which has a 1:1 relationship to the DT
index.

> For example, below debug prints show parents of "spi1_ref" clock. It does=
n't have any parent which is in DT.
> clkname: spi1_ref : parent 0: ppll_to_xpd
> clkname: spi1_ref : parent 1: npll_to_xpd
> clkname: spi1_ref : parent 2: flxpll
> clkname: spi1_ref : parent 3: rpll
> So, here we need to check if the parent is in the DT, and if not, registe=
r by fw_name.=20

If the parent isn't in DT then it can't use fw_name. There seems to be
some misunderstanding.

> =20
> The zynqmp_get_parent_list function iterates over the parent list for eac=
h clock, check if the parent clock is present in the DT node under 'clock-n=
ames' property. If so, the driver registers clock by index, else register b=
y fw_name.
> =20
> Because of this reason I believe the comparison with "clock-names" is una=
voidable. Please share your inputs.
>=20

I think what you're saying is that zynqmp_get_clock_info() is building a
topology description for clks that the driver registers. But some of
those clks have parents that aren't registered by this driver and are
external to the device. The zynqmp firmware interface is string based,
not number based, so you have to keep "clock-names" DT property.

That's all OK.

You don't need to parse clock-names for the DT index if you take the
string from the zynqmp firmware and jam it into the fw_name when the
parent isn't a clk registered by this device. When the parent _is_ a clk
registered by this device, you should use a clk_hw pointer for that
other clk to indicate the parent. When it's a mixture of internal and
external you use struct clk_parent_data. When it's only internal, use
struct clk_init_data::clk_hws to avoid even considering having to parse
DT.

If you want to skip the string comparisons in the clk core, and I
suggest you do so, you can parse clock-names once, find the index for
each external clk, and then use that info when building the topology
returned from the zynqmp firmware to mark the parent as "external". Then
when you go to register all the clks you can use that info to build the
parent_data or parent_hws structures. It's unfortunate that the zynqmp
firmware interface is string based, but I understand it can't be
changed.

I looked at zynqmp_pm_clock_get_parents() and it looks like it's just a
bunch of numbers for the parent descriptions. If that's true, then there
aren't any external clks at all, and so clock-names and clocks shouldn't
be in the DT binding and you should just use clk_hw pointers everywhere.
Did I miss something?
