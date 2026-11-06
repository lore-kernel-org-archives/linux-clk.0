Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956316;
	b=5gHnlX7a04/0r6LbvJW7jboOIx/M9xPltv/MdQia25T+XwBKyGeoMq9C2rnI9vBf6ieW
	 TaaP2ZtLnplozR4Rb+C7+XDg/gx67+QQH1F7L4hFJa0Oyu45IRPLodVWhY354sM0ACq1k
	 da/Adb2c2HjdtEusXZUFSF3FuufDfVx6T6971Ld6CSD/z0BXzgjGS4vKJ7tosf7htNcSL
	 3Y0oStPtDOvLat83Y+OS+DO2ufehESL77hY1sE7VfnmEdD4qRO330kk0KI8/wJFn18RTK
	 3pq4EDXqy39oP3Py57DAzJBVt3fN6rn/zpe3AndrSIJMra46VYg/XuxWCKmUkogQuaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956316;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=eA+Ud+gFJNcVj31tDphP7Ap6AZDSCnf20xd55ColT4w=;
	b=UFfWJYtr40UmtsPm3SlGsjeTAGJb9G2x1KGpDNMfDynSMBfoj1e6S1fmjKmZec2KVccf
	 jxkyxZ7/JRiujauNY93Hgqu1Y7TcQWsy5YXQoYKNdSZ2VycQWBT6F3UWCWVGfZjGyIcXF
	 e/AIWB37da1q6ke3eddc2ikjzpTRHEE4Sp5btkA4Q7TDLuasWr6MPdg5C5huzl6O9FEq5
	 kp9ajKzpz4Z/r5fvXL0OXohv69B/M2BIwFm66J/wnRpR+Z/lvTl2JuY5p7UICr4sFKkYR
	 qiZOoTefuuQyHLP8MKIHBNtJE1HIIaSYwvMdTyUPeKNvFEzGX5jIsfRMqg0TAVlIMhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A04D606A326;
	Fri,  6 Nov 2026 09:11:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A04D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <a19cb7baea1434ddbbffc3176bdf493c895c7ea3.camel@crapouillou.net>
Subject: Re: [PATCH 1/3] clk: ingenic: Poll JZ4780 CPU1 power status
 atomically
From: Paul Cercueil <paul@crapouillou.net>
To: Florian Fainelli <f.fainelli@gmail.com>, linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Paul Burton	
 <paulburton@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 =?UTF-8?Q?=E5=91=A8=E7=90=B0=E6=9D=B0?= "(Zhou Yanjie)"	
 <zhouyanjie@wanyeetech.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, open
 list	 <linux-kernel@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"	
 <linux-clk@vger.kernel.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
 Paul Boddie <paul@boddie.org.uk>
Date: Fri, 06 Nov 2026 10:11:48 +0100
In-Reply-To: <20261105203243.2292647-2-f.fainelli@gmail.com>
References: <20261105203243.2292647-1-f.fainelli@gmail.com>
	 <20261105203243.2292647-2-f.fainelli@gmail.com>
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

Le jeudi 05 novembre 2026 =C3=A0 12:32 -0800, Florian Fainelli a =C3=A9crit=
=C2=A0:
> The CPU1 clock enable callback runs under the clock framework's spinlock
> with interrupts disabled. Its readl_poll_timeout() can sleep between
> reads, which is invalid in this context when SMP powers up CPU1.
>=20
> Use readl_poll_timeout_atomic() with the existing interval and timeout.
> This is a prerequisite for the JZ4780 SMP bring-up path. The original
> CPU1 clock implementation by Zhou Yanjie is already upstream.
>=20
> Cross-built for CI20; the subsequent SMP-enabled image brought up both
> CPU cores. Development and validation used Codex assistance.
>=20
> Fixes: 6673db4f3f26 ("clk: JZ4780: Add function for enable the second cor=
e.")
> Link:
> https://lkml.kernel.org/r/1582215889-113034-3-git-send-email-zhouyanjie@w=
anyeetech.com
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Cheers,
-Paul

> ---
> =C2=A0drivers/clk/ingenic/jz4780-cgu.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/ingenic/jz4780-cgu.c b/drivers/clk/ingenic/jz478=
0-
> cgu.c
> index 1e88aef7ac0f..f5983033583a 100644
> --- a/drivers/clk/ingenic/jz4780-cgu.c
> +++ b/drivers/clk/ingenic/jz4780-cgu.c
> @@ -242,7 +242,7 @@ static int jz4780_core1_enable(struct clk_hw *hw)
> =C2=A0	spin_unlock_irqrestore(&cgu->lock, flags);
> =C2=A0
> =C2=A0	/* wait for the CPU to be powered up */
> -	retval =3D readl_poll_timeout(cgu->base + CGU_REG_LCR, lcr,
> +	retval =3D readl_poll_timeout_atomic(cgu->base + CGU_REG_LCR, lcr,
> =C2=A0				 !(lcr & LCR_SCPUS), 10, timeout);
> =C2=A0	if (retval =3D=3D -ETIMEDOUT) {
> =C2=A0		pr_err("%s: Wait for power up core1 timeout\n", __func__);
