Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608263BD222;
	Tue, 17 Mar 2026 13:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753353; cv=none; b=DG3AY0X18bCtS6V9fM0262hDXnFSeuaH2D3ept2ffM0u0HOBYsz6dLe66rv7PTaEMF+AhCrzKAkbkScyYonqDFBD7wBR/IKvT+k9bggiwfGONkfMa0E8iUVi+AcVAK63B6Xgc/yoaYkkcWDyW6ODL2DQK0HhMlaVoKKqqVH1yTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753353; c=relaxed/simple;
	bh=5nZD/FcMNt4uZFYZDvszux+r19D1DG31Ez9jrBisMrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7KhyxKOvCltL9mGMhff+avJW8PT2Cbo93nuL6nznbhIPjhl5OFDlDjxoWP5c++yIxXVEfLEBsMwQmx84bk1OENwQ2q1Tq1VcNbrrofuksySEWhHu7qLkD0EO7VarUivwjcXY1YbPIseIpGdEjis+ZWRmBRCNGNyAHw5ocbzhEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0ZP93nT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0ZP93nT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCE7C4CEF7;
	Tue, 17 Mar 2026 13:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773753353;
	bh=5nZD/FcMNt4uZFYZDvszux+r19D1DG31Ez9jrBisMrs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R0ZP93nTdHCXXNWbXq4hTY7VUFPUvhc2XHbd1jxmO1kE6wDerqPHzph714mv0bvDv
	 9H8O5dYW2YC2NVzNPouhJnWx/sbXzT1QmRNC5BRVt3NqkOmczZRLOT5wnCbPsUnKWo
	 /cUfuwdimmj7dTynqbt7sQ9rNleMAX6ZAUu/uAUSZe7StaVDfkOJaNV3mOMQAJteKk
	 IN44ZwvWHh1KtNSDQynAWHR1jfxpgUlqQ5v7qt43WzS3znAt/VFBZDbG94mhuxhEd/
	 A/lut7hHvxSQ6ubHGNqD1/v3jqagmrworTLgqNEB0jvwVzPC8H4WC+kmJaqGD8oc5R
	 zlrW2BsrQbJ4A==
Date: Tue, 17 Mar 2026 14:15:50 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Brian Masney <bmasney@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
Message-ID: <20260317-notorious-classic-sunfish-d016d5@houat>
References: <20260316-clk-ignore-unused-kconfig-v1-1-6e95a4fb0c94@redhat.com>
 <20260317-almond-leech-of-correction-2a2ef6@houat>
 <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="myhkh7i27t265nwe"
Content-Disposition: inline
In-Reply-To: <com5zf4bfgb3eoelbmy5pfykhdow6ne3nteua6l7bnzkr72dsb@pehxxygji5z2>


--myhkh7i27t265nwe
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: add new Kconfig to control default behavior of
 disabling unused clocks
MIME-Version: 1.0

On Tue, Mar 17, 2026 at 02:14:25PM +0200, Abel Vesa wrote:
> On 26-03-17 08:30:24, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Mon, Mar 16, 2026 at 06:33:45PM -0400, Brian Masney wrote:
> > > At the 2023 Linux Plumbers Conference in Richmond VA, there was a
> > > discussion about how large number of systems need to boot with
> > > clk_ignore_unused. Per the discussions at the conference, the existing
> > > behavior in the clk core is broken, and there is a desire to complete=
ly
> > > remove this functionality.
> >=20
> > Broken how?
> >=20
> > clk_ignore_unused is to a point where it's seriously cargo-culted and
> > documented as a silver bullet, when in reality it's just a debug tool
> > for broken drivers, and the driver must be fixed.
> >=20
> > But nobody is actually fixing it.
> >=20
> > See
> > https://fedoraproject.org/wiki/Changes/Automatic_DTB_selection_for_aarc=
h64_EFI_systems#How_To_Test
> > for example. The affected clock could be marked as CLK_IS_CRITICAL, and
> > fedora wouldn't have to package anything, change anything, etc. But no,
> > the problem is clk_ignore_unused.
>=20
> Nope. Don't ever mark clocks as critical unless system crashes without
> them.
>=20
> Here is an example or why clocks cannot be marked as critical but need
> to be kept by the clk_ignore_unused: display driver probes later.
> If you mark it as critical you just made the clock stay enabled even
> when display is off.
>=20
> And this is just one example.

Then use CLK_IGNORE_UNUSED.

Maxime

--myhkh7i27t265nwe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCablUAQAKCRAnX84Zoj2+
dgqpAYD9t+HdEiNodlyi45QoAtfdOEX8SOIFgR3xj3iywNGFpEdhvpzlSz0L/U6j
jeGoccYBewZfGkyqxJgMMZV1rnKrBuh+Z/lq/yoSeAu/BcXQfRQtnouuFkH26OJ5
sOs7rItUmQ==
=T4Jw
-----END PGP SIGNATURE-----

--myhkh7i27t265nwe--
