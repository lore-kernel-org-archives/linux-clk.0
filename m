Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794324706;
	b=HcuokRil5hPspugNng0KcythkSTdRaWUTmCKxWjO8eTAvE6YOB3u94UH/wdgmrMYsge8
	 YcpdEaNwvVcDyq/40jWhlDmi/Uvf60FCD7ICiOQiLrmJnN780cVS5W8EvgwBDFmGkO4M6
	 4PnCrYOTGzM3Qtb9qBLbEuKP9yEI58NCzK/DSlXPKHQqH0I+knULlTy96AvIF1EFsf7JU
	 4niyJAJ0J2f8gf96kThfux2++u+JzlgrEGqPGJO5zSYJOdtc9JN7JC+nRtmN/8vMPTLKH
	 +gRnvAJALgYyK4kwNSyH+LFX/EgMh0aXibB1gTQT3snumFZ7Izc/pauqwHlLl4bwZ2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794324706;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eNHOYp3vawm7VCxKHSnVXq4jQHK7LaO7L1mY/NyvplM=;
	b=H5maT0JBJvfHv+U+6/G301+j27Nxj4jpfe42iMNOLQRMS3/nVvcsQmFtRZkXOvsNOU/K
	 w8TrDr82n9Rkyb53HEzjR285mGSXO+JexUZkEiik/3Idp+rjiAtTOVH7gLxxYrdvsUK7c
	 X1rwhCEcEh33xvtGV93NYCE6Gs2Hi/7qgSBtZbvvyi1r3qv7pFcokOqJU4hvmW6XLSmQk
	 A/n2jagZl5UrrN4ilaaSQsw8MuO43lNLsqN6mxaLMhB3RJEmN2ItvisHCA1qSQV38rLQm
	 dZr0VIYneybjTzPYBveN0eRJatpkO1DAYZAfcFAt0Fiq2rYfKxWHSrAIQ5fGuaCJH7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E87606A332;
	Tue, 10 Nov 2026 15:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0E87606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <21144503d8b588df45a1f5e2c3a756fd0c3b67a0.camel@crapouillou.net>
Subject: Re: [PATCH v2 3/3] MIPS: CI20: Enable SMP with two CPUs
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>,  Paul Burton <paulburton@kernel.org>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
 Brunet <jbrunet+clk@baylibre.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 open list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
	 <linux-clk@vger.kernel.org>, hns@goldelico.com, paul@boddie.org.uk
Date: Tue, 10 Nov 2026 16:31:40 +0100
In-Reply-To: <20261110043131.1985993-4-f.fainelli@gmail.com>
References: <20261110043131.1985993-1-f.fainelli@gmail.com>
	 <20261110043131.1985993-4-f.fainelli@gmail.com>
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

Le lundi 09 novembre 2026 =C3=A0 20:31 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> From: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wanyeetech.co=
m>
>=20
> Enable both JZ4780 cores now that the generic Ingenic platform provides
> secondary CPU reset and mailbox support. The existing device tree
> already reserves TCU channels for both per-CPU clock events.
>=20
> Link: https://lists.openwall.net/linux-kernel/2020/05/19/739
> Signed-off-by: =E5=91=A8=E7=90=B0=E6=9D=B0 (Zhou Yanjie) <zhouyanjie@wany=
eetech.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0arch/mips/configs/ci20_defconfig | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/arch/mips/configs/ci20_defconfig
> b/arch/mips/configs/ci20_defconfig
> index 90536cab417e..09d65094b1bd 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -22,6 +22,8 @@ CONFIG_EXPERT=3Dy
> =C2=A0CONFIG_MACH_INGENIC_SOC=3Dy
> =C2=A0CONFIG_JZ4780_CI20=3Dy
> =C2=A0CONFIG_HIGHMEM=3Dy
> +CONFIG_SMP=3Dy
> +CONFIG_NR_CPUS=3D2
> =C2=A0CONFIG_HZ_100=3Dy
> =C2=A0# CONFIG_SUSPEND is not set
> =C2=A0# CONFIG_SECCOMP is not set
