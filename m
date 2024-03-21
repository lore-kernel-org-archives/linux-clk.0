Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9625CB5
	for <linux-clk@vger.kernel.org>; Thu, 21 Mar 2024 18:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711045907; cv=none; b=bQXpVx5Fn+mVB/r8MJ1Jt3sg0QR1tkQe3EcWiygxUxEuteo+XlcdvGSRiLqgBFhVY05xt0ZUfWYtuD0rkmXy4QzlGwtgMzVQvL6TaTksp9CLZgRZTBxmahFuXpWyN7zN1W/XRqic68XESpw3bVqMPmlSXE0s68viDK3q/B8LBxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711045907; c=relaxed/simple;
	bh=TFuP46Qyx1pxwBYCaCTCPf0SHLozPhSzhmuSdqJriLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQvtor7cAZNb5JR0mqFSoZRed0rCLs4e6R/pD40K5UhIazLxEaG+tkeexyssnOH1WQrKlC+3cxB5b12bDzRn0Dxx+gNcMprPh9Qiajh+v8hODyHA5IiojzlReNA4+ooThzQLdh9y9DFrVnnq6Yj7H7jI+fKCKaZ4gfIMq8e/UlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nUEzEPV2; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nUEzEPV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711045898;
	bh=TFuP46Qyx1pxwBYCaCTCPf0SHLozPhSzhmuSdqJriLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUEzEPV2AvPMYLXvoI91Dis+8/UnEo8SYxTG3Ba2msP5faCd0nwcIhWPLEujvwura
	 /BnkLq2OyrmbihMskDQEWasHfVoH6Eehv/waS0crQ3MdSxm4V8XjcmoLxNV81w7DK8
	 UUOdu0vCaS3H2D8aw+69XXBMjNJFvMB/hmEQq6scEULwnoapRtxvmJyDI0eywqeRTx
	 UwbAz7ybcam0gzj3GpQkQDqB8BTddMwbd+ey9tWnKJJVV9PI0KdwexHOB3DUN1ZDq7
	 pchbRo/CPWRv+o2nu7wu99c70fgjj6/rSQCA0MxCKUO57ZFHcYhQ3c8pQFMr3PTeGV
	 MYTG8bP5h+SYg==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 42AD337820EF;
	Thu, 21 Mar 2024 18:31:38 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id D518D1060709; Thu, 21 Mar 2024 19:31:37 +0100 (CET)
Date: Thu, 21 Mar 2024 19:31:37 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chad LeClair <leclair@gmail.com>
Cc: Ilya K <me@0upti.me>, 
	"andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"huangtao@rock-chips.com" <huangtao@rock-chips.com>, "kernel@collabora.com" <kernel@collabora.com>, 
	"kever.yang@rock-chips.com" <kever.yang@rock-chips.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <vetdlmrlwx2bpwliof442zjiir7jy5irs737qu3v7qjhcvubn4@wslcvkis3tsf>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
 <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
 <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
 <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ag6ifsp67kon5iv2"
Content-Disposition: inline
In-Reply-To: <97f8b9e7-983c-435e-8fad-11e71be158b8@gmail.com>


--ag6ifsp67kon5iv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chad and Ilya,

On Wed, Mar 20, 2024 at 10:50:48PM -0400, Chad LeClair wrote:
> Sebastian,
>=20
> On 3/20/24 12:36, Sebastian Reichel wrote:
>=20
> > I also worked on a cleaner solution for the issue you described and
> > integrated it in the patch adding proper gate clock support. So
> > please also test with HCLK_NVM not being marked as CRITICAL.
> >=20
> > [0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linu=
x/-/commits/rk3588-test
> >=20
> > If everything is fine I will prepare a v9.
> >=20
> >> Hope this additional data point helps!
> >=20
> > Thanks for the detailed analysis.
> >=20
> > Greetings,
> >=20
> > -- Sebastian
>=20
>=20
> No luck unfortunately.  I still see the SFC dma timeouts.  It looks like
> aclk_nvm_root is still getting disabled.  It now has both an enable count=
 of 0
> and a prepare count of 0.
>
> Unlike your previous version, I _do_ see the driver bound to the device a=
nd
> the rpm_resume() call finds its way to pm_clk_resume().  So it looks like
> you resolved the original issue I was seeing.
>=20
> However, when I reach __pm_clk_enable() it looks like the clock entry (ce)
> is not in a good state:
>   (gdb) print *ce
>   $3 =3D {node =3D {next =3D 0xffff0001f0ce1930, prev =3D 0xffff0001f0ce1=
930}, con_id =3D
>   0xffff0001f0a214f0 "aclk_nvm_root", clk =3D 0xfffffffffffffffe, status =
=3D
>   PCE_STATUS_ERROR, enabled_when_prepared =3D false}
>=20
> The immediate problem at hand is that ce->status is PCE_STATUS_ERROR so t=
he=20
> switch statement will take the default case and return without doing anyt=
hing.=20
> Also the ce->clk pointer looks like some sort of error pointer value so I=
'm
> wondering if something went wrong in the setup you were doing in=20
> clk_gate_link_probe().
>=20
> Note: I ran to that same __pm_clk_enable() breakpoint for a number of of=
=20
> GATE_LINK clocks.  They all looked to be in that same bad state.  I put t=
he=20
> "aclk_nvm_root" one in the message here since that is the one that is mos=
t=20
> relevant to the discussion, but they all look to be broken in the same wa=
y.
>=20
> Hopefully this gives you a hint as to what is going on.

Ah, that was actually not setting up the clock links at all. Sorry
about that. I reworked everything again and moved all the GATE_LINK
code into the separate driver now. Please give it another try.

Greetings,

-- Sebastian

--ag6ifsp67kon5iv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmX8fQIACgkQ2O7X88g7
+pp6tw//dOH9kkYRNrIBGF7Zee1CYz1GkqAz/32I2iMeU2zaZ1U1Qm/rfxn72PlS
T+t8xJd0geqkzzfvE44haC1waSSQTswoxGsiXJB8l++0V+5QjLa2kikLMGaoiU+8
n0If2j7KUJXssU8qRXvuOV2rTNTssuDxzz16fYe1BV3sbfCsgcI9Lq9ijFeUMcQF
AWeqIQSKrqT0ru3NFIaT0RahnfiD7F52KnRjKAXyb9qyGJvBvK7zTzeeKwF77rK0
fGDMeTX8lUrcP6fnPwttYv/Wt+jkn+1DXQaTfDQQMmzctZ3CkJrRQ6HtHp95G7z+
9f2lwPDgOElffxKL1LG97mvFVyuwlIA6AFWjJ+ELDkErwqfQjb94RRDPfl5XTh/r
HArKOUkZBQPA5Hzdxd8mdfHa1KLfypq5vJFI6v+6FV0hvOX6DpCe60DCuv7FOKdj
YYxjnvaGmhd/XUpAPUZDrdoiG/9EaxIhW5j2nC61StQmGqiDeDcBxih1NTdDJsLo
IlW37tp8UP42pYAzo4EW8MCsqnAIaLylPpG9upxAP7UEeHpe2TJod83fzJ9G1E2+
zOIno7W4JP13iwsQRZttlcLKxxZQgGQS/7sPhGrX/d1Cmn/VQoQzhPLKMUS+KE77
k4+T+p82TOEPUqdsQ7rxOKJdM2OcSpfc7KpC4azB/xt91nmozLE=
=ubiI
-----END PGP SIGNATURE-----

--ag6ifsp67kon5iv2--
