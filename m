Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794334330;
	b=FcwZYFft4RhKHQ13D07Ry6oGeJMVrxXylR4OTSFBY3d9ZrZbt7Ax5qEZTpTPKfoiAcuD
	 NBYWQ5X6hlVOEGm2B/8pwiUBOIZ4QK7zYl3xapK+4SwP/wfHJsz5T02mc35QwJOqRr+pG
	 7BOa3VQNxJIdswvCuzQKUubAfHQN/6Qlg2Tab7YSnno5bEbORTA8zWr9JqRmr59mAsWvD
	 /nl+WYn20Oh2k12MCndecL7wBhd/WHuohUTu8hqN2Hy8cXMEfr7V6BmVLmAqe5Gmk9zdr
	 BNn2tO+e6WutDg2lV7jUYE4Df1lmKzuO63hU292id0YwAx5t8o7ynNBFJP04OQv902Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794334330;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Autocrypt:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=sfAk8Ws+0uNYJ2PCmYeLwK6DkvAvd88lwADzaSpDPts=;
	b=HuEnoVJwzZA5xWvbF70yuae8bGnxbX2i8+CQ+Tuitg4QNLzvY/aPcf/O/WSJSW6HzE2F
	 BXmfVmI45txGOTMpBRaG0lAmsKuGJZ2jp5j84bZ/EHnQ7oj2q/s1+A0F5N4cLg17AfkpI
	 ftlYgC5oNhAB66S7AIrDUNJ005Yc9qIECI43LuHFMCs+S+sn8K/Z+mBXXKR/XN2rc7DUP
	 3COcxuBuqRAq8yQFH1hhQC13u0BLd1njALDIV/5kxierAZ3vZADMdM/YM5DbqCs4rGE8A
	 cBVbh8fPKOkZSJE3COfSpbE0pVaJr3fDmJapwSxfrUnCNsPB34gptGZ1cUHBUsqqQ4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485DB606A323;
	Tue, 10 Nov 2026 18:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 485DB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <7d64e6a329aa6e0160680a6246f9ba3275d1c265.camel@crapouillou.net>
Subject: Re: [PATCH v2 0/3] MIPS: CI20: Enable SMP with two CPUs
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Burton	
 <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, open
 list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"	
 <linux-clk@vger.kernel.org>, hns@goldelico.com, paul@boddie.org.uk
Date: Tue, 10 Nov 2026 19:11:59 +0100
In-Reply-To: <135a8f3d-9eb4-43e7-a20d-056362a29c14@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
	 <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
	 <135a8f3d-9eb4-43e7-a20d-056362a29c14@gmail.com>
Autocrypt: addr=paul@crapouillou.net; prefer-encrypt=mutual;
 keydata=mQENBF0KhcEBCADkfmrzdTOp/gFOMQX0QwKE2WgeCJiHPWkpEuPH81/HB2dpjPZNW03ZM
 LQfECbbaEkdbN4YnPfXgcc1uBe5mwOAPV1MBlaZcEt4M67iYQwSNrP7maPS3IaQJ18ES8JJ5Uf5Uz
 FZaUawgH+oipYGW+v31cX6L3k+dGsPRM0Pyo0sQt52fsopNPZ9iag0iY7dGNuKenaEqkYNjwEgTtN
 z8dt6s3hMpHIKZFL3OhAGi88wF/21isv0zkF4J0wlf9gYUTEEY3Eulx80PTVqGIcHZzfavlWIdzhe
 +rxHTDGVwseR2Y1WjgFGQ2F+vXetAB8NEeygXee+i9nY5qt9c07m8mzjABEBAAG0JFBhdWwgQ2VyY
 3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0PokBTgQTAQoAOBYhBNdHYd8OeCBwpMuVxnPua9InSr
 1BBQJdCoXBAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHPua9InSr1BgvIH/0kLyrI3V0f
 33a6D3BJwc1grbygPVYGuC5l5eMnAI+rDmLR19E2yvibRpgUc87NmPEQPpbbtAZt8On/2WZoE5OIP
 dlId/AHNpdgAtGXo0ZX4LGeVPjxjdkbrKVHxbcdcnY+zzaFglpbVSvp76pxqgVg8PgxkAAeeJV+ET
 4t0823Gz2HzCL/6JZhvKAEtHVulOWoBh368SYdolp1TSfORWmHzvQiCCCA+j0cMkYVGzIQzEQhX7U
 rf9N/nhU5/SGLFEi9DcBfXoGzhyQyLXflhJtKm3XGB1K/pPulbKaPcKAl6rIDWPuFpHkSbmZ9r4KF
 lBwgAhlGy6nqP7O3u7q23hRU=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi,

Le mardi 10 novembre 2026 =C3=A0 09:14 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> On 11/10/26 07:44, Paul Cercueil wrote:
> > Hi Florian,
> >=20
> > Le lundi 09 novembre 2026 =C3=A0 20:31 -0800, Florian Fainelli a =C3=A9=
crit=C2=A0:
> > > This patch series resurrects SMP support for the CI20 board. This
> > > was
> > > submitted back in 2020 by Zhou Yanjie.
> > >=20
> > > Changes in v2:
> > >=20
> > > =E2=80=A2 Moved SMP sources to arch/mips/ingenic/ and the header to
> > > arch/mips/include/asm/
> > > =E2=80=A2 Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 a=
nd
> > > CONFIG_SMP
> > > directly
> > > =E2=80=A2 Renamed JZ4780-specific SMP symbols to XBurst names
> > > =E2=80=A2 Changed CPU enumeration to assign consecutive logical IDs a=
nd
> > > removed the
> > > explicit two-core limit
> > > =E2=80=A2 Changed mailbox IRQ allocation failure from panic to loggin=
g
> > > and returning
> > > =E2=80=A2 Shortened commit descriptions, removed Codex attribution, a=
nd
> > > adjusted
> > > source credits and sign-offs
> > > =E2=80=A2 Kept the clock polling patch and CI20 defconfig changes
> > > unchanged,
> > > =C2=A0=C2=A0 added Paul's R-b for patch #1
> > > =E2=80=A2 Updated the kernel baseline to include additional upstream
> > > fixes
> >=20
> > You should also have a changelog per-patch, in each patch's header.
>=20
> This seems to vary on per-subsystem basis, for netdev where I
> contribute=20
> the vast majority of the time, putting the changelog in the cover
> letter=20
> works, but I will do it on a per-patch basis next time.
>=20
> >=20
> > Your patch [1/3] has a Fixes: tag but does not Cc
> > stable@vger.kernel.org, so
> > you'll have to send a v3.
> >=20
> > I reviewed [2/3] and it looks good to me, but I'm a bit concerned
> > about
> > Nikolaus' reported issue.
> >=20
> > Thomas, if you can wait a few days, I can test it on my CI20 and if
> > it works
> > report back with a Tested-by: tag.
>=20
> Thanks Paul, yes please do test it because I could not reproduce what
> Nikolaus reported, that makes me think there must be additional=20
> configuration options and/or patches being carried that could be=20
> responsible.

Tested right now on my CI20, with just this patchset on top of 7.4-rc2.

It works fine. So:
Tested-by: Paul Cercueil <paul@crapouillou.net>

For the series.

Best regards,
-Paul
