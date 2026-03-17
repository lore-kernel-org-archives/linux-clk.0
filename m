Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBA52BE03C;
	Tue, 17 Mar 2026 13:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773754824; cv=none; b=afBIeiJsp8s3N6kOBK92RxnKlwzlaECT8mMPaZ0pcGm0VGBz4aJqm+De3Afo9mmmfXXl6NTDcp69V5+u7YXGYYstHW4+cFMAKnlauzYxXoU9tvJESzXS4PidvuaCK/zUwbGVSEU4/o4tZ7Qgl59xfKMQS+0UeYjAmceYEb0Qxw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773754824; c=relaxed/simple;
	bh=tywRe3r5kb2WgRIBvAmx2gAvBu1xAJHxwEeCbxh61jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LpjG5L3LIId/1vHNJPFvzBoB5GiNFv+TVPCzn8LUosEQybWCLw8wP63TDBJll13nKwc/FxCQKGqwIgm+xLp8bEKhQYENW6qlxWlIpmLaVGtLPTTy2WDzADv+NZ/r41I1KZtf3/7rzqN4lfr2U2VqLNFNh1vqhRPJbRsGFbcdd50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YptyIASH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YptyIASH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F036C19425;
	Tue, 17 Mar 2026 13:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773754824;
	bh=tywRe3r5kb2WgRIBvAmx2gAvBu1xAJHxwEeCbxh61jE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YptyIASHfRIfhd72OmqrpcG2Hm/N13Fsbc42zjL/YL4lgP3lVKKli7LYJmDbwPaKS
	 hdKW+pHrkx8ZrjQNpQEtr6KlFxbkTX1CsTHEnZdvWQwpULoGlgao3rBUOBAb+ozoks
	 U6svsaxIB4sibyPOdFlBeRMXP0FZPzB1OHJPR4DdZzoTRBSL2J1MSfPXcgFDMJ1//a
	 XkDWwivAmLyEIum2Y7hcRvtC49dIjyHNgyKUPWTMLy+nj8A2Q8f3KJE7bpMVoIJtAh
	 dHn9J5HRJaUsR62FZJv9zx18LvuSJFBxTZYxKJf3IB3ht267PzhMj1OFpFyugukX28
	 Oqc0GhtL8MCfg==
Date: Tue, 17 Mar 2026 14:40:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <20260317-skink-of-marvelous-science-adfc63@houat>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
 <20260317-notorious-classic-sunfish-d016d5@houat>
 <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="c2a2rc4kr6hhrcfh"
Content-Disposition: inline
In-Reply-To: <2dsd7hq4bn25dibqk62a7o56tt2tecf645tq3upccneq4hby67@cmjjc5d6ximt>


--c2a2rc4kr6hhrcfh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
MIME-Version: 1.0

On Tue, Mar 17, 2026 at 03:21:17PM +0200, Abel Vesa wrote:
> On 26-03-17 14:15:50, Maxime Ripard wrote:
> > On Tue, Mar 17, 2026 at 02:14:25PM +0200, Abel Vesa wrote:
> > > On 26-03-17 08:30:24, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > > > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > > > discussion about how large number of systems need to boot with
> > > > > clk_ignore_unused. Per the discussions at the conference, the exi=
sting
> > > > > behavior in the clk core is broken, and there is a desire to comp=
letely
> > > > > remove this functionality.
> > > >=20
> > > > Broken how?
> > > >=20
> > > > clk_ignore_unused is to a point where it's seriously cargo-culted a=
nd
> > > > documented as a silver bullet, when in reality it's just a debug to=
ol
> > > > for broken drivers, and the driver must be fixed.
> > > >=20
> > > > But nobody is actually fixing it.
> > > >=20
> > > > See
> > > > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_=
aarch64_EFI_systems#How_To_Test
> > > > for example. The affected clock could be marked as CLK_IS_CRITICAL,=
 and
> > > > fedora wouldn't have to package anything, change anything, etc. But=
 no,
> > > > the problem is clk_ignore_unused.
> > >=20
> > > Nope. Don't ever mark clocks as critical unless system crashes without
> > > them.
> > >=20
> > > Here is an example or why clocks cannot be marked as critical but need
> > > to be kept by the clk_ignore_unused: display driver probes later.
> > > If you mark it as critical you just made the clock stay enabled even
> > > when display is off.
> > >=20
> > > And this is just one example.
> >=20
> > Then use CLK_IGNORE_UNUSED.
>=20
> But there is no way of knowing in advance to which clocks should this
> flag be applied. As I mentioned on this thread already, we will be
> playing whack-a-mole with clocks for a long time before we get this
> right.

Oh, I know, I did my fair share of these already.

> The solution has been already discussed for a long time now and it is:
> drop the clk_ignore_unused late_initcall entirely and then make a
> generic sync_state callback that the clock providers can use (or they
> could implement one themselves). This way, until sync_state is reached
> for a specific clock provider driver, all unused clocks remain as is.

I don't argue with sync_state being the way forward. It seems
reasonable, even though I'm not sure how we can reasonably expect all
consumers to show up, and / or if we would need some kind of timeout or
something for disabled drivers for example. Anyway. What I'm saying is
that we shouldn't remove that mechanism, no matter how imperfect it is,
without any viable alternative.

Maxime

--c2a2rc4kr6hhrcfh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCablZxQAKCRAnX84Zoj2+
dpjIAX0a3MqoPsiaseLZGxmjkMEfeXFXccdj9HH+jPyBgIjT2NMYBw2eC4Ah0enq
MolbU8wBgIHG4q0fKLWJ67gIVciM7vAxzr1j2pgaq0+wPKM1N/tlZp3jb/xMn4kX
2/avL8ARdA==
=nkVW
-----END PGP SIGNATURE-----

--c2a2rc4kr6hhrcfh--
