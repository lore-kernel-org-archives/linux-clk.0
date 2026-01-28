Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13D53321A3;
	Wed, 28 Jan 2026 19:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769626884; cv=none; b=cjkol4AcVXaZ/BUH37TZx+L79TG1UDjuWJOJ4uNczS4SffYqG7ZwGDKF45GVqyoarSCKjfER449dJKw93IRZA6A+L0087RBKc9Ar8BrAldwbT51stjp7AzRiPtHmWanMSS742BrHxRiNfnu6dYlRQmTd2yI34f0p6lQ1Fo/eWGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769626884; c=relaxed/simple;
	bh=n34TAjuaUJNq368XZLmuh46Sjt4jj9OJ3xPmOcHju38=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=d9NATccxw2ovCrv/DkFAuR9MKA1o5zIXoJRm+26zai8XWUokD7GLY0KXgoqNctSgD2eyxmIyIouFy9ZE9RE5kw8obXj1zSRz04m307HCWXZy/dSXP+9TRDuoJCGFtPhHAjM51G65Lcz6LheJsvN1CWpJc/EU+tGQREAvArZzD7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8w2mvSq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8w2mvSq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C71C4CEF1;
	Wed, 28 Jan 2026 19:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769626884;
	bh=n34TAjuaUJNq368XZLmuh46Sjt4jj9OJ3xPmOcHju38=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C8w2mvSqqOv6CNJooWdWwnMODpl641zH6FL4vTpgMjRx34EvM9qL//KZoVYqmVwQr
	 V6V0P5e1YDea3DWFmUsl+x1oMwNTe2zUS6dKUAWeT7RixPfgiCU/7di9qvJCBGXTJC
	 hpAr6nOsVvFDkue6E7q7/axgb0P3PEIg16XjCW7/A6o/XeXlAaF3W0C1C8RPk1sb+t
	 FHNmfFEyooZOZ9bvKOLJgTJXss8jw0JMDsG1rx/N/A2MaegXoGs4GVqb0Ak6e0bdUJ
	 e3D3ST4S/1fPQtZLjzAblj7sTvVRxPR67coMBhPVIHX64yhlEwQV5lOkEp0LSkQf3O
	 YRbj1SwAQFH5w==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3745487.e9J7NaK4W3@workhorse>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com> <6678782.DvuYhMxLoT@workhorse> <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk> <3745487.e9J7NaK4W3@workhorse>
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
From: Stephen Boyd <sboyd@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Michael Turquette <mturquette@baylibre.com>, Dong Aisheng <aisheng.dong@nxp.com>, Matthias Brugger <matthias.bgg@gmail.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Laura Nao <laura.nao@collabora.com>, =?utf-8?q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>, Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
To: Mark Brown <broonie@kernel.org>, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 28 Jan 2026 12:01:22 -0700
Message-ID: <176962688200.4027.9869545980331892869@lazor>
User-Agent: alot/0.11

Quoting Nicolas Frattaroli (2026-01-28 09:04:55)
> On Wednesday, 28 January 2026 15:47:08 Central European Standard Time Mar=
k Brown wrote:
> >=20
> > For the Avenger96 that says:
> >=20
> > [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> > [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> > [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> > [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
> >=20
> > https://lava.sirena.org.uk/scheduler/job/2412562#L563
> >=20
>=20
> Okay, on this one, there may be a problem in the clock tree.
> ck_mpu is marked CLK_IS_CRITICAL, but its parent, pll1_p, is not. Clock
> core doesn't seem to check whether any children of a clock are marked as
> critical before disabling it.
>=20
> I'm not super familiar with the intended semantics of critical clocks.
> If we need to manually mark all parents of critical clocks as critical
> as well, then a (potentially partial) fix for the Avenger96 might be:
>=20

Marking parents critical hasn't been strictly necessary so far because
we've been relying on the prepare/enable count on a critical child to
keep the parent prepared/enabled.

>=20
> I just looked for CLK_IS_CRITICAL clocks in that file that have the
> CLK_OPS_PARENT_ENABLE flag, and marked their PLL parents as critical
> as well.
>=20
> An alternate approach would be to skip the parent enable/disable pair
> in the problematic patch in __clk_core_init for clocks that are marked
> as critical, because if the parent wasn't on for a critical clock then
> we wouldn't be in that function, we would be dead.

The parent may not be known yet in __clk_core_init() because we lazily
find parents. Putting it another way, we can get to the recalc_rate()
call in __clk_core_init() for a clk with CLK_OPS_PARENT_ENABLE when the
parent pointer is NULL. This hasn't been a problem because when we adopt
the orphan clk the rate is recalculated (see
clk_core_reparent_orphans_nolock()).

I don't see an easy way out of this problem because in general we need
to know a clk with CLK_OPS_PARENT_ENABLE is parented enough to be able
to read the registers when calling clk_ops like recalc_rate() (and
probably get_parent() as well meaning that clk_op can't touch
hardware?). Maybe the simplest approach is to skip any sort of hardware
access when this flag is set during setup and reparenting.

BTW, I don't know what this patch is actually fixing, so I'm going to
revert it. When it is resubmitted please describe the problem you're
seeing.
