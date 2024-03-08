Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E817EF
	for <linux-clk@vger.kernel.org>; Fri,  8 Mar 2024 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709904468; cv=none; b=oT27bKdj95ccgTRPT08ri9f+lDdi5XCu2dOCzJULrnNkqxQH2eSa98vyhB84vclVehi0J0GQOgUHc3rCVWITBFKpa3ginFJOM80s0gBLeaQLMgwvQ8cPL6Y97txNKkd/oL53gRQAHRDi6r69QncZjhULdcvqo/x52dgvqWqA0i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709904468; c=relaxed/simple;
	bh=FTRAWBTwymVL386fALtUwj3KhMPwR7HCTYICtzgjwg0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0eEX+QuT1MWg/muyCFyUXQSnn6M9xibYp3GFlL3ZPPQKZor/ybmpti0FsHr8RR69uSbwy5HtquVZKNYBto8oVPAUMPfbnHozJKuW071IUV/NRN6E9PiIylPYUY8uzU7vY9do2EqJD6b8ledDw/7C18nt5rrn4Dwb9TMdjdzXfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=POVw4MKh; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="POVw4MKh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709904465;
	bh=FTRAWBTwymVL386fALtUwj3KhMPwR7HCTYICtzgjwg0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POVw4MKh2Jb3iCnepDbPEqn8uBO0+dBbZxwqHhLc0IyM9NYI39rs4y0hVslFaIrE0
	 3o3Z9BJq2Pjw9l+/lQlCFkHrNvaANb327r6zwlhY+delZ3p9Cp24ArsSPxewnmAWYS
	 xI3NrZHB8DNzvq+viZrnXcZi1hyyEuiwaOINvSvtG5kBYLaP/jort+mzMWXkNYIXye
	 4ZGqYFZjE/yw936mYXJ1/P9hljmMU3hXIGl9LhJIk9K+TiKS5trxW6l5YqhCZUsMOb
	 nsBpMpMbsPWDe7XvzChFarjTtK01qK24f4cqgiCZJhpUPBG88xUyF0m8P2gYJhLS59
	 9e2KEujlpCwSQ==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1F5AB37810F1;
	Fri,  8 Mar 2024 13:27:45 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id B363E1060B10; Fri,  8 Mar 2024 14:27:44 +0100 (CET)
Date: Fri, 8 Mar 2024 14:27:44 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Ilya K <me@0upti.me>
Cc: "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>, 
	"heiko@sntech.de" <heiko@sntech.de>, "huangtao@rock-chips.com" <huangtao@rock-chips.com>, 
	"kernel@collabora.com" <kernel@collabora.com>, "kever.yang@rock-chips.com" <kever.yang@rock-chips.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, "mturquette@baylibre.com" <mturquette@baylibre.com>, 
	"sboyd@kernel.org" <sboyd@kernel.org>, "zhangqing@rock-chips.com" <zhangqing@rock-chips.com>
Subject: Re: [PATCH v8 7/7] clk: rockchip: implement proper GATE_LINK support
Message-ID: <uwr335fla4nfvv3mdppcoly6hcsayav26r4r6txmbwrb25ftw7@rxwjtan7evww>
References: <1456131709882456@mail.yandex.ru>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="73sgraorjqr7grra"
Content-Disposition: inline
In-Reply-To: <1456131709882456@mail.yandex.ru>


--73sgraorjqr7grra
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[removed DT people from CC, since this is all about clocks now]

Hello Ilya,

On Fri, Mar 08, 2024 at 10:23:31AM +0300, Ilya K wrote:
> This change seems to make my Orange Pi 5 (RK3588S) lock up on boot
> :( Any suggestions on how to debug this? It doesn't really log
> much...

I suppose with this change you explicitly mean the last patch, which
has not yet been applied? That patch effectively allows some clocks
to be disabled, that have previously been marked as critical (and
thus always-on).

If that results in a boot lockup, I expect you have a peripheral
driver, that does not enable a required clock (e.g. because of a
missing clock reference).

I assume you have a bunch of other patches applied on top of
upstream and not just this one? In that case it might be sensible to
first apply this patch, do a test boot (it hopefully boots). Then
step-by-step re-add the other patches and check which one breaks
when being combined with this patch.

P.S.: I plan to send a v9 of this patch once 6.9-rc1 has been tagged
and will split it, so that the removal of CLK_IS_CRITICAL is done in
a separate patch.

Greetings,

-- Sebastian

--73sgraorjqr7grra
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmXrEkYACgkQ2O7X88g7
+poj8BAAkgTQTuX2gUF/opfF38TkGqXLmP9Lash+wOIGQaBo67HrPCb5ykmPiCAE
SAY3oxobY4X/H9y3hMxCuOEK7hbh3hRF14LRcB9fc8Bc7cBtvmVnxAHAe5W/ZvMG
f2IXHJah83GcWtt2lY1q2YYa+GBARW4dQ8lmdY6UJm7oRiMhrMr55XDe1Zl0VNjh
53XwercpOLlA6CslzS/SYhmcSMw72Wad/KHjCgB5o6r+Gyk26FVfD/mcWxaFxa/u
PPRYoLbueUxaPgh96RjO/FgXE8eWEI38fnykFSgBLJx+9qIHZZYPWLIyUSJrgZoN
trZPcnz6JbWwQDRNE4Cpe2rFLJbGjDez20lJqQeCPJB5yW0l9JqR5x1+AkseWbMY
rSJCNUL4/X6b4o9midFGwbr1ycE9pP/Rr2OpBftBmI3GwCWokrEVuCRSc83q8nkY
8JGQcE9LHyQYA2P8gGQjFvdKB0eyF+m2xy9OgrYEGHDOttvA6U+vpDnXVZaN/Dqc
nThjn0QulcTYnjyFxO6PynrVy5REVoPQLn5HrS8wvgXmKd7Cj8aoCOcuL9CNeCAc
hOFWLdSzqDEKGwjTBJdgOtq6PorHwAajV+ZRPD7stYT5XGkNC6CAP0USgovLODXb
4Ao2LokVxOcDEqIgFoGy14ye3HkPlTmC4h2eXprb2KdaXqPZxOE=
=ekYF
-----END PGP SIGNATURE-----

--73sgraorjqr7grra--
