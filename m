Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794845222;
	b=ltCsEgC3g+AvoNvu7OeWZTOkdqC3isejrF4nxlXcdznHvU4Ji6odp2qoYpGWCOQm9o5Z
	 /1kpfLhAqZOdLvb4rul79++bIK4OQsh5CJ7qZpltm5LPpOV40F1/84Dfm5yvriSO2DLb3
	 Y3c4eYLzwAy9d7CnSf/jXAwjB5mhp9O5AYF6BOEqqmPyMB9aDseLoe4CZvuKNBrjaXu06
	 N+awJ1KQ43D7YGbhaWVHRMDMG0ZxtK+ADvby5X8qKST+xPo5n2YopTb6YgV5tpkzJt9vR
	 TMYiLWVNNbmdAsr9BTmOnOfyjk4XaYHHlqpHZcN4KDOe8BTXqLVFNr2jTc04raieuvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794845222;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=zMOTJD5k5ZqyDvhXTHxcxFYuI82ot+8yYVH8Ex0rnSU=;
	b=S3c8mzgAAvNsCKWOtvEXuVnGetRFTYHDu+1WT5R+5ol5TQCbFrGRFwthI1mizTlD5RU8
	 t08zD8YU15wplbES5WpADLUE/5VKjE6Q5KKTU3Y45i27k7vG05K9Qb9p1IxhlJ2WaiS3V
	 VEOuzaNFh3uSLIeEDrEYcrNmXig82g22X5OqMZd8pBD8B/KPKxIqGzMXDhglGddKU05pY
	 58qKiincsw5lnPVPLdGw5/qLcHUJCVDfUm9NWaLDHkt9Tq3jYhIDUAsaofXRZBX8kEOcJ
	 GMbymr6kJsqZQBiOcq2sSDtfrpmLmeIzmT37A4ewjUPChH0x4f2nDKIjXerPn7SzqCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339AA606A31C;
	Mon, 16 Nov 2026 16:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 339AA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <7fc2ba5524ef5bc15286a26d5001481db1c2e6ac.camel@crapouillou.net>
Subject: Re: [PATCH v6 2/4] MIPS: Skip generic IPI setup for
 platform-specific callbacks
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Burton	
 <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, open
 list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"	
 <linux-clk@vger.kernel.org>, hns@goldelico.com, paul@boddie.org.uk
Date: Mon, 16 Nov 2026 17:06:57 +0100
In-Reply-To: <20261113190836.470937-3-f.fainelli@gmail.com>
References: <20261113190836.470937-1-f.fainelli@gmail.com>
	 <20261113190836.470937-3-f.fainelli@gmail.com>
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

Le vendredi 13 novembre 2026 =C3=A0 11:08 -0800, Florian Fainelli a =C3=A9c=
rit=C2=A0:
> A generic MIPS kernel can select a platform SMP backend with direct IPI
> callbacks instead of an IPI IRQ domain. The XBurst backend uses CP0
> mailboxes, so generic IPI allocation would find no domain and BUG when
> more than one CPU is present.
>=20
> Skip generic IPI initialization when neither selected send callback uses
> the generic implementation. Keep initialization when either callback
> uses generic IRQ IPIs, and retain the existing single-CPU shortcut.
>=20
> Sashiko AI reported the XBurst integration issue; Codex assisted with
> the change and extracted-function/build checks.
>=20
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Arg, I was reviewing the v5 and missed that you already sent the v6.

Anyway, LGTM.

Reviewed-by: Paul Cercueil <paul@crapouillou.net>
Tested-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> Changes in v6:
>=20
> - addded missing Signed-off-by tag
>=20
> Changes since previous posting:
> - Split the generic IPI initialization guard out of the XBurst SMP patch
> =C2=A0 as a prerequisite, as requested by Paul Cercueil.
> - Add braces around the multi-line condition.
>=20
> =C2=A0arch/mips/kernel/smp.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/mips/kernel/smp.c b/arch/mips/kernel/smp.c
> index 0f28b4a62e72..086298146dd8 100644
> --- a/arch/mips/kernel/smp.c
> +++ b/arch/mips/kernel/smp.c
> @@ -338,8 +338,12 @@ int mips_smp_ipi_free(const struct cpumask *mask)
> =C2=A0
> =C2=A0static int __init mips_smp_ipi_init(void)
> =C2=A0{
> -	if (num_possible_cpus() =3D=3D 1)
> +	/* Platforms with their own IPI callbacks do not need an IRQ domain.
> */
> +	if ((mp_ops->send_ipi_single !=3D mips_smp_send_ipi_single &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 mp_ops->send_ipi_mask !=3D mips_smp_send_ipi_m=
ask) ||
> +	=C2=A0=C2=A0=C2=A0 num_possible_cpus() =3D=3D 1) {
> =C2=A0		return 0;
> +	}
> =C2=A0
> =C2=A0	mips_smp_ipi_allocate(cpu_possible_mask);
> =C2=A0
