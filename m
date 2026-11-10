Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794325487;
	b=vBnH59Rw6PtYgNS1G2N5+OkMrrd5DJsvUCBglMR22Pz4l4KI6vNWDBQng3ihi6IvmzYM
	 RjLRxrGFrj2xVlNdBQAf0HQ/+jSVkaitLJMWmOHC2RirlORW2/Wj8kjLgK9X6mEnkYV0E
	 b3Xaue/Ne4FE8T2tQNMyHsMF2oQxkTFUUyz+cBoYBRo+4REher5NrE3HVG6IksVozwUtL
	 lV4599T4yu56M2vl3KiTU08qb5COWH+e2+9kdD5harnFQ9Ns0YK59heMhoiFpI2W3cMBL
	 2N0Nwfs2HHupWPardboU5E5+GCKcVVEC9ztK0ta9bXx50P/pUS+SVaWFtgXko1Ti5/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794325487;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=q5FEyc/Q/PEgipfxVB9U/FpkGYQGxTKlpGrp5AF+G0o=;
	b=nsMhX8VdQwuN5HJBx6UhFaOZg2i8JRgaZotkqRpncfGJ83CZA8yJh0NiGcw99cHBphmZ
	 0OoSOOPTUtyXGXaLJn9aEW9h0+9Um0wv58YPWW1QqdhMbWc20p+OHYo4NShTxCrtZ42/H
	 j10fagdajjHZbEDJFbisTYv6hrO5RhDi6NFJB+QfojpB2cakE77rp6SONWIajH8DqUx5z
	 Q6b7FzuN+u05T9cFFMIg++LeBSgt+q84Sxx5hnC08BXvjRCNI2dYc+xSNSs1+QCym2BGn
	 kGeV8ZFXRC2Zgn0hwp2dYGKIqwcfSc55qgARoWch2rQmigyWEwsQA/7y4EgGBiqdLAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B13D606A332;
	Tue, 10 Nov 2026 15:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B13D606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <d40bcc5d7742025db9a67af5c77796745e284e45.camel@crapouillou.net>
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
Date: Tue, 10 Nov 2026 16:44:41 +0100
In-Reply-To: <20261110043131.1985993-1-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
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

Hi Florian,

Le lundi 09 novembre 2026 =C3=A0 20:31 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.
>=20
> Changes in v2:
>=20
> =E2=80=A2 Moved SMP sources to arch/mips/ingenic/ and the header to
> arch/mips/include/asm/
> =E2=80=A2 Removed CONFIG_MIPS_INGENIC_SMP, using CONFIG_MACH_JZ4780 and C=
ONFIG_SMP
> directly
> =E2=80=A2 Renamed JZ4780-specific SMP symbols to XBurst names
> =E2=80=A2 Changed CPU enumeration to assign consecutive logical IDs and r=
emoved the
> explicit two-core limit
> =E2=80=A2 Changed mailbox IRQ allocation failure from panic to logging an=
d returning
> =E2=80=A2 Shortened commit descriptions, removed Codex attribution, and a=
djusted
> source credits and sign-offs
> =E2=80=A2 Kept the clock polling patch and CI20 defconfig changes unchang=
ed,
> =C2=A0 added Paul's R-b for patch #1
> =E2=80=A2 Updated the kernel baseline to include additional upstream fixe=
s

You should also have a changelog per-patch, in each patch's header.

Your patch [1/3] has a Fixes: tag but does not Cc stable@vger.kernel.org, s=
o
you'll have to send a v3.

I reviewed [2/3] and it looks good to me, but I'm a bit concerned about
Nikolaus' reported issue.

Thomas, if you can wait a few days, I can test it on my CI20 and if it work=
s
report back with a Tested-by: tag.

Cheers,
-Paul

>=20
> Florian Fainelli (1):
> =C2=A0 clk: ingenic: Poll JZ4780 CPU1 power status atomically
>=20
> =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (2):
> =C2=A0 MIPS: Ingenic: Add XBurst SMP support
> =C2=A0 MIPS: CI20: Enable SMP with two CPUs
>=20
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +-
> =C2=A0arch/mips/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> =C2=A0arch/mips/configs/ci20_defconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +
> =C2=A0arch/mips/generic/init.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> =C2=A0arch/mips/include/asm/ingenic-smp.h=C2=A0=C2=A0 |=C2=A0 20 +++
> =C2=A0arch/mips/ingenic/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0arch/mips/ingenic/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +
> =C2=A0arch/mips/ingenic/ingenic-smp-entry.S |=C2=A0 54 ++++++
> =C2=A0arch/mips/ingenic/ingenic-smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 | 247 ++++++++++++++++++++++++++
> =C2=A0arch/mips/kernel/idle.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 26 ++-
> =C2=A0drivers/clk/ingenic/jz4780-cgu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
> =C2=A011 files changed, 362 insertions(+), 3 deletions(-)
> =C2=A0create mode 100644 arch/mips/include/asm/ingenic-smp.h
> =C2=A0create mode 100644 arch/mips/ingenic/Makefile
> =C2=A0create mode 100644 arch/mips/ingenic/ingenic-smp-entry.S
> =C2=A0create mode 100644 arch/mips/ingenic/ingenic-smp.c
