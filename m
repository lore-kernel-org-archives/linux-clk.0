Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844943;
	b=PACs32CuzyQBPC/0zwFc7qZaYT9mLxMFvAXh5EaDZORxEYuIxZDEF8deTLYBGmRNPk2G
	 hXlaFCa1+tQbaq9b4mwbJRhnAI3y8wbHwHwW1Uiv5FWrskpjxiozaM/b9ufLWrdc1ii6n
	 LWaIWCDVUVt962NRZjiZM++BPAwEIQaT0MUZ+3NyYm3uLpJtQnU0WDRxG4FvwmXstTKyG
	 d1U4BpN6nJiYul4iCLa0wypn89nJD6PlvPxO2b+J7emwI3M7mPH5L+Z9ln4ml8FGWmDjO
	 V9zcWjMN5P2l7dyeq6ZflfC1sjHdRYfIm8GB/Ak9bhhTnTxU7ktcA7D62S4qmXNpULQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844943;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=l0jruFxONTAPEBKuWWMI2wGvHB33xPwEc/k76oW8WQI=;
	b=qmyUxXyNLXBS7a0CxTMixzr++wh2c1yPo0no5DHR0KBbrG1VTRCkyY+ZnBTg5acga7b+
	 AmqGvUj6YHG7lvu/W8s8Lh85SHR7q6UvBfYLQjfXeMhPAmd89YkeCv7O/CCWtD6paPGq9
	 dOGXQV9QLU5jMGiguzJEIQzEQx4oA4uAgDJyo7SAPBNAaDaqhmOXMZvW6PgtMh0eQ7CXH
	 V/+HjxfmivIq3zln5RRtFTJ0zlyPq8zRXP9k92r8BYAouALoNi0GOTNPOHDDffW2v+87y
	 EfIAyUA0QjD19w8ERRTImcsIbbT/QG4cxEkyP9YX2BK27XOJfsfuqdyZmKg33yfj12A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A825606A322;
	Mon, 16 Nov 2026 16:02:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A825606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <c281bf2225030a243c2ff89e19a2103c9c19a4a9.camel@crapouillou.net>
Subject: Re: [PATCH v5 2/4] MIPS: Skip generic IPI setup for
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
Date: Mon, 16 Nov 2026 17:02:10 +0100
In-Reply-To: <20261113184210.470320-3-f.fainelli@gmail.com>
References: <20261113184210.470320-1-f.fainelli@gmail.com>
	 <20261113184210.470320-3-f.fainelli@gmail.com>
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

Le vendredi 13 novembre 2026 =C3=A0 10:42 -0800, Florian Fainelli a =C3=A9c=
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

Signed-off-by?

-Paul

> ---
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
