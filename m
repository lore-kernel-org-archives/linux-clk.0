Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793962885;
	b=XRedxe+VPus0ZOQn1a3nJ+FidEntMxkgsdABXits4NzWVE3rCLGnLUbZ2h0d+8v4gYMu
	 MgBDeobNDRj2EzKTKCrbCgUGcMRzcbqxfm2h0RUg4YSok+8aFa4fdFPCjLlSaxFXP3ULt
	 B/+8HQKsYDVZuEf57CCVJ2G9d0doDHqF/oG59TwyF4u8Q3wAefZzLMJ1w/m7/WxpcUQzg
	 i+L2kGWu0l0q/kDJGK/wjGEa271F+iqq3qOIA5ZwOi7FaaJHJZjiitBFiz3gNf0WPV3xk
	 zSxNWD2TEmTaVRgjTPF3XXVf89N2Eh/Sss+5wpHT6f0hMYpr1WWYsp5lDKV3wMp8MWQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962885;
	h=DMARC-Filter:X-RZG-CLASS-ID:DKIM-Signature:DKIM-Signature:X-RZG-AUTH:
	 Received:Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Content-Transfer-Encoding:Message-Id:References:To:X-Mailer;
	bh=EeDsxAF/zXVe2GdPWnTly40Y15heeB9zeZSjGZi6FhU=;
	b=mEpqaNdZ/tzSPrR7FeGFLqyWg4LG5gCGPi1mmsXN6661zV5a13kz31opoIetqRH5nCI6
	 iXokt9MJJS6/q/o7iMLEqxVc/qYf646hWwImCJjZb4sVaoTVKqGP9YJoz9WozmGlWQKoh
	 fgXjA6BXGyvdpyvZzVxR8hmSBS2HDzV00NkPTgJb+LncW1DrguLIvudZ6OShwj2ydXl4T
	 DBnWBCTkwxtcTyU0F2KgUAaGI4hRLuyIi10s26hN4qbyhMJtrT/SGM2gC4fR8oqhNJpJd
	 cek2BW7CXzRWYwqOBInHhEMhxXftwRe9T6Ewg5G71Guj/VqBF/7mA0fp7WDiyFjCUeQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goldelico.com;
	spf=pass smtp.mailfrom=goldelico.com;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ijj2cHzr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=djTZ4X9L;
	arc=pass header.oldest-pass=0 smtp.remote-ip=81.169.146.171
Received: from mo4-p02-ob.smtp.rzone.de (mo4-p02-ob.smtp.rzone.de [81.169.146.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A887B606A32E;
	Fri,  6 Nov 2026 11:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A887B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=goldelico.com header.i=@goldelico.com header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=Ijj2cHzr;
	dkim=pass header.d=goldelico.com header.i=@goldelico.com header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=djTZ4X9L
ARC-Seal: i=1; a=rsa-sha256; t=1793962834; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=TSlcNqDEn9rMnZXgI4y8yb9DxQEQ9C1Os1qKDIJKqPdMT0ZDT5ZSKimBFW4E0Y5goB
    j5kjK/OreXcFJV3w1rruMaKvG9DtlM+vAbGpgvzfPFQLBPov+DVCV6mlwByenrjthEC6
    9oqnnTnmI+fmvm4sh7/MaD692lwJkUyQjzp2P3vCD6ZlX2ZXVH3awA5o5PmpmOCgsrEi
    0h+Jjnp6PGn7otVBIoeURkRHrHhn+bLQdl5Nsq10dkIVsR2cA02njEU87SbEVsBGaZ60
    tjVZhok8oHd6N9lkUL1VilTjr4XHgZABSun3pmzLCLYUFbqia1sssrKih9NbUpjf/VXf
    ZvNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1793962834;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EeDsxAF/zXVe2GdPWnTly40Y15heeB9zeZSjGZi6FhU=;
    b=QTkYe2D+d8CF6+IX3B2toi14K6XDwugKPGFC3P3T0f+F21OJqbgZTGJooczZ3OIDZA
    Dh8YaheSr4wuycxGiYI/qNRE8V2Bqm+14duK/d+PqMCFrC8LAVgrkKPjqV3CHBs7o6iO
    pCSM3dXkWFDsaWZA6ysSIp88VsLrNMKUtqnFJLZi/K+I1CQzGMS+2i55T5E7J8pFpDaG
    m8CuxVkmUz1Q++eWWeHwFWxLXq0plH8TIoR3CSEtgoRbFwNpP/TIpcAvCDQ6R2oL/bsa
    1ZXcuhibsAYaD5nbds/rt+3ubymTRi35m/KhG92r/LShn4EmemFeHRaXZMpJ/vE+qE1m
    O/qQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793962834;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EeDsxAF/zXVe2GdPWnTly40Y15heeB9zeZSjGZi6FhU=;
    b=Ijj2cHzrvTCyEAsDbIULbt+jEquE42MlSnYkyK7Puxk4/DyYA71+J5J/tysIQN8Fqo
    jPtlad+nAEotlHtHY7FwmnTszgR0HDw2+BU5Mio9X66T9avJCqq5cudFPiDQthTpRjA2
    23t1ZMdXkKT8M5M8RwFNIb8F6FxmIUzNHjd8OrFPGDGD/cg+y8udbsdvKei8RTrKHoXY
    SvVCP+yqSvpC19WaZUsYLpb4unqaGjUrKYebqxBMEfYid/sjm4Gmn0teOvAA2rTM+My7
    oXiglOScfOeks9OCZrtyQsTIBX+rrtmIsgPi4ziZgyAE9eVm2Z1YQ54hEjL/BbYjT1Yj
    mUDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793962834;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=EeDsxAF/zXVe2GdPWnTly40Y15heeB9zeZSjGZi6FhU=;
    b=djTZ4X9L+mhnAxbGhSak7C8+JJlekW2esSaGJCj7pyMHCkMcMVAYnojUrV1CuePoYI
    ZvZdUgBdi0t7Q010nCCw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9qVpwcQVkPW4I1HrVjZoMy8iN4frnsPsBQ4l+mfK4O7kvgww6TmAq"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.6.3 AUTH)
    with ESMTPSA id Qb56a22A6B0Xmx2
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Fri, 6 Nov 2026 12:00:33 +0100 (CET)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.10\))
Subject: Re: [PATCH 0/3] MIPS: CI20: Enable SMP with two CPUs
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20261105203243.2292647-1-f.fainelli@gmail.com>
Date: Fri, 6 Nov 2026 12:00:03 +0100
Cc: linux-mips@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Burton <paulburton@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 =?utf-8?B?IuWRqOeQsOadsCAoWmhvdSBZYW5qaWUpIg==?= <zhouyanjie@wanyeetech.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
 Paul Boddie <paul@boddie.org.uk>,
 Discussions about the Letux Kernel <letux-kernel@openphoenux.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <235BA61E-07AB-4A64-955D-8E4ABF0A52F1@goldelico.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
X-Mailer: Apple Mail (2.3826.700.81.1.10)

Hi,

> Am 05.11.2026 um 21:32 schrieb Florian Fainelli =
<f.fainelli@gmail.com>:
>=20
> This patch series resurrects SMP support for the CI20 board. This was
> submitted back in 2020 by Zhou Yanjie.

Great!

We are carrying some of these patches along locally for a long time so =
it
is good to integrate them.

What should be considered in the future is to extend this SMP stuff to
x2000 and x2600. We have work in progress but nothing to submit yet.

>=20
> Florian Fainelli (1):
>  clk: ingenic: Poll JZ4780 CPU1 power status atomically
>=20
> =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) (2):
>  MIPS: Ingenic: Add JZ4780 SMP support to the generic platform
>  MIPS: CI20: Enable SMP with two CPUs
>=20
> MAINTAINERS                           |   1 +
> arch/mips/configs/ci20_defconfig      |   2 +
> arch/mips/generic/Makefile            |   1 +
> arch/mips/generic/ingenic-smp-entry.S |  54 ++++++
> arch/mips/generic/ingenic-smp.c       | 240 ++++++++++++++++++++++++++
> arch/mips/generic/ingenic-smp.h       |  20 +++
> arch/mips/generic/init.c              |   4 +
> arch/mips/ingenic/Kconfig             |   6 +
> arch/mips/kernel/idle.c               |  25 ++-
> drivers/clk/ingenic/jz4780-cgu.c      |   2 +-
> 10 files changed, 353 insertions(+), 2 deletions(-)
> create mode 100644 arch/mips/generic/ingenic-smp-entry.S
> create mode 100644 arch/mips/generic/ingenic-smp.c
> create mode 100644 arch/mips/generic/ingenic-smp.h
>=20
> --=20
> 2.53.0
>=20
>=20

BR and thanks,
Nikolaus


