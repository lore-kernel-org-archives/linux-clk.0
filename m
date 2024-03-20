Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA310E54C
	for <linux-clk@vger.kernel.org>; Wed, 20 Mar 2024 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710952595; cv=none; b=Vm/MQ0IyIkK4IUWpuNssZ+PHomibhX3C+YA5PKvgiEwaK7TftPeA19m9VMMOF+jsfYcuZjGGxNYNh1Q2OcrhuHtN7fX0gOn+vBMoQCXnQAzF3kbJRNdyjHQz6eQSRe+rIJlRkypG6ZtsPyw+PfgoYiIloz3gdqaRedp+ncaMx9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710952595; c=relaxed/simple;
	bh=xybm8h9ENSovS3Z9xQSOa7CY9hfUogGRVXw/fY6PZY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SqakAT//fsw+ZZkVM8YfyZ9XaHFeuOStN28V/u4GnkJL1CWKUL6zjMKEyIytb4L3T3Q1b+HOQriVxV3TXSsrAQH9RJglxpOXMSKKCeqABokQo9+L32YOMNy15NmKfJSbbKsQRGFOspBuFxeStSed7cOAOhTzHxn/JohNs9DPe88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UzClaZX1; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UzClaZX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710952586;
	bh=xybm8h9ENSovS3Z9xQSOa7CY9hfUogGRVXw/fY6PZY4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UzClaZX11OAbCZpCs4NjAYXkIcIkvhJjEOPNKRDN+kNUyLSsrGuezQiva5qcm6Vyg
	 k4tMLRWIQo8OfV+4MDsfF7MXYqjNfvglPwWZ/z7Fd4sLClXSHBVZFmbiMCnSOoeZLq
	 bNp/E4GEMllaFYJODvkhXGII8vLPD3FzBULjgPMuu8IUqZTzL67NT2b0zn3Uf56w96
	 tz3f6FNMT0T/Mfur531hxjWHX9KI00TLT+tPymwVL/pLi8NXv5lDRa/xRg+rxqXuoy
	 7plYUjTWlju3IdOE5qoUCKZ+GNwym7NAxoR71tVcggtABwJWX0nDf+nCBcn5KuXYnp
	 JzqyNG6iE+muA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DF6DF37804B2;
	Wed, 20 Mar 2024 16:36:25 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 7D39710604B9; Wed, 20 Mar 2024 17:36:25 +0100 (CET)
Date: Wed, 20 Mar 2024 17:36:25 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chad LeClair <leclair@gmail.com>
Cc: Ilya K <me@0upti.me>, 
	"andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>, 
	"huangtao@rock-chips.com" <huangtao@rock-chips.com>, "kernel@collabora.com" <kernel@collabora.com>, 
	"kever.yang@rock-chips.com" <kever.yang@rock-chips.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <2rsu6qa3pwbqic6b7ej6txa34jw4ztrnybzcfcfysue2mky37h@dyrdefbimzdn>
References: <1456131709882456@mail.yandex.ru>
 <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
 <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ss3wrzxn4s74hez7"
Content-Disposition: inline
In-Reply-To: <7f4b3f38-50ee-480f-a341-ab577e19bb32@gmail.com>


--ss3wrzxn4s74hez7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Chad,

On Sun, Mar 17, 2024 at 07:34:41PM -0400, Chad LeClair wrote:
> On 3/8/24 08:27, Sebastian Reichel wrote:
> > [removed DT people from CC, since this is all about clocks now]
> >=20
> > Hello Ilya,
> >=20
> > On Fri, Mar 08, 2024 at 10:23:31AM +0300, Ilya K wrote:
> >> This change seems to make my Orange Pi 5 (RK3588S) lock up on boot
> >> :( Any suggestions on how to debug this? It doesn't really log
> >> much...
> >=20
> > I suppose with this change you explicitly mean the last patch, which
> > has not yet been applied? That patch effectively allows some clocks
> > to be disabled, that have previously been marked as critical (and
> > thus always-on).
> >=20
> > If that results in a boot lockup, I expect you have a peripheral
> > driver, that does not enable a required clock (e.g. because of a
> > missing clock reference).
>=20
> Another Orange Pi 5 owner here...  I likewise ran into trouble with
> this patch.  I have been playing with your rk3588 branch from the
> Collabora gitlab and was also experiencing hangs on boot on my OPi5.  I
> bisected your branch and found that the GATE_LINK support commit was the
> problem for me.

Ok.

> Digging in, I found that the problem behind the hang was that I was not
> getting the aclk_nvm_root

That matches what Ilya found (there were some more off-list messages
because of HTML mail issues). I suspected, that HCLK_SD (which is
sourced from SCMI) might need HCLK_NVM.

> which in turn caused DMA transactions to the SFC driver to hang.
>=20
> ...
> [   2.804519] rockchip-sfc fe2b0000.spi: DMA wait for transfer finish
> timeout
> [   2.805127] rockchip-sfc fe2b0000.spi: xfer data failed ret -110 dir 1
> ...
>=20
> Setting aclk_nvm_root to critical allows the system to boot.  However
> not all is well as I do get errors like the following which also seem to
> indicate further clock problems:
> [   6.296554] rockchip-pm-domain
> fd8d8000.power-management:power-controller: failed to set idle on domain
> 'vo0', val=3D0

I see the same message for AV1 and I've also seen failed idle
message with the rockchip kernel. I have not yet debugged what is
going on with that.

> I assume that the con-ops of your patch is analogous to the downstream
> "clock-link" driver.  (ie. you are looking for PM events to cause the
> pm_clk_suspend()/pm_clk_resume() routines to enable/disable the linked
> (second parent) clocks).  This wasn't happening for me.  Unlike in the
> downstream implementation, the gate_link devices' dev->driver pointer
> was null. So that when rpm_resume() was being called, it would make its
> way to pm_generic_runtime_resume() which then would do nothing.  The end
> result is that I would have a prepare count of 1 on aclk_nvm_root, but
> an enable count of 0 so it would get disabled (orig patch w/o marking
> this critical).
>=20
> I did a quick hacky proof of concept where I set up the pm ops on the
> clk-rk3588 driver to point to the pm_clk_suspend/pm_clk_resume routines
> like downstream did.  I used device_bind_driver() to forceably bind the
> clk-rk3588 driver to the gate link devices it was setting up.
>=20
> This worked for me.  With those changes I then was able to boot without
> needing to set aclk_nvm_root as critical.  Further, it cleaned up the
> power-controller error messages on the sdio and vo0 domains.
>=20
> The force bind I did doesn't feel like a particularly clean solution to
> me.  However, I am not knowledgeable enough in the (platform) device
> model to know what the right way to do this is without fully doing what
> downstream did and having DT nodes for the various gate link devices.
> But it seems to prove out that having the driver bound to the devices
> with the relevant runtime pm ops is the missing piece in my use case on
> the OPi5.

Can you test again using rk3588-test [0] (which is based on today's
master branch) from today as base? Ideally it should work with your
Orange Pi 5, since it contains "clk: rockchip: rk3588: mark hclk_nvm
critical".

I also worked on a cleaner solution for the issue you described and
integrated it in the patch adding proper gate clock support. So
please also test with HCLK_NVM not being marked as CRITICAL.

[0] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/=
commits/rk3588-test

If everything is fine I will prepare a v9.

> Hope this additional data point helps!

Thanks for the detailed analysis.

Greetings,

-- Sebastian

--ss3wrzxn4s74hez7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmX7EIEACgkQ2O7X88g7
+pq8vw//ZEdKtWkUxEHABpc+L0MHtSBH9gRNtkOgzBwhoSVmcRm60HtZNT/z6nNh
L9tLXDeBchaLtwexZ6LY+0D7l9yjCA89YyGoq2RPjdQ0ejUCFXHmlxMoUJM8aooR
lp5Hxa7aU+Qx7fqibdfCT5zamKqWtWu30PGgCsQlv8YWgJA/oQFxrw8xPJb9THv3
AWaRmbt+amYEHZpVHG7+xzcU9b3eGJnfJlcypGhZ7NtdHQSgonTAtgWNkUGkxYzn
HlNQsPi8vAwxql8ZQr4YryJe6wK1uTrDn5uSFasx90/nA8ORnoeZPJqJx/JbzNfj
Y1s+UyJJTJkIL51Lh6ypyI6z0/FyUDpk6KyGHPA2qn3ADnlwBY4t1zKCIp6BY5br
AeblqeaNSJExntCEx4PUiMIv5SmVKHYsyFsTL6cnHmqAA2VVH9ktH/9IZLqXbZLZ
uMBqCe+pffAVAjdjIJ87PTLB27HgV6zM4zObw20BAG30QSYNjfDluE4cCK9/7OyD
HRwFwMEqTMyXTAXFhLvYhKmSkRUkyVtCrRA7fgHgUyDbS+prevC8bt1zspE0a5au
G8FwiJt5ipkXYt4mY4PzqeG13+Hvy8faxudbhGZLCVLXM2zAAgcFo19eaqyacuGp
ZinpPgHW458lNt/hbG6NTbhpB1qwLp5oK56ry2/hQwPsfAKDGbg=
=Eg1E
-----END PGP SIGNATURE-----

--ss3wrzxn4s74hez7--
