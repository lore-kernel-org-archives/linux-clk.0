Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794661725;
	b=JmD90cRysNRSVf3FN2sKA3gnWTXV9zzCytnoXEILwdxoSfn7meNS6HZ83MqlupfnptnM
	 UNWbqjjqVrh3dIKxtEMbQDG3rxvcEZ1XfB2tnQw95su1+9pLTvyYRQgfTULOxpRdRi8eN
	 OgNLQQh9qQbfvOn8JDZJRt1vAcdLTt1d8IKK1JLAjRuqWi+ZvQIgIw4covizRzbc8TjxT
	 hJ4gxeZtLiWnLWteGDhFSWh/NhJw9aC1xmQSHIRC7awQDjU67/Sew07LqWAE//mF5rXyM
	 lrNb/G3wTrZGD60HgOBy2u9XbFCYqa9mGaa3C0mHX5eVP0qtcVzcHZhCiOtjtPzzy2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794661725;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ENcuBo4USOfVQFhUObechYbDtZ2GfADFPof/Bg1RaM8=;
	b=bo5xrgutAdcMx1l5BtvIRjJJs+9Ws0k246g1SUXJEHvPPaKfxA6MVQtkCH3PY2k15LWf
	 QawR0HLrvYllEH1RgtqZGDkfIxxDFgGODG4dG7mIxxPzgkXJBYfbC3eDRvrKALmw1ouuI
	 FHH/IB1nmVDpVQJ/uIODSlNR/q2N4cgWNWkQ7wLmajuzOFshFi4xTkZAdLhVxriMvbNIR
	 x5/VnG+6M5gYBkKBvCC4W8n1WcBCk2SyZ2hG9IwuYWbSNIu7X12JeUCRdQlExvRATrwCk
	 TLWqiUvFz0BMPJDzzKV9gancuAHLuXp0Hrk4GXu0aKNN0zo1cJJEL2b2HkJYNL74Knw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZIYAbb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B30606C68E
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfZIYAbb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5791E1F0181D
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794661725;
	bh=ENcuBo4USOfVQFhUObechYbDtZ2GfADFPof/Bg1RaM8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfZIYAbbcFGk1GP4Q4eKfAcqvuppW3Wvi9Psg08B3GWREll4Tdsxk/TqwaG6emPge
	 K1zuRY+2fbOyuFHAl4Re7PYdfjDYozXFJQRCWe/VlTVxJlZEJa/fGud3tINeXQs76m
	 xoT8i8SSpfj3RtdNDmUG8aYEVDzUCtGrIHnw0qAmJdIMQNzwBQn/3dVSmOzcQAmUFJ
	 9gW5ZhzallYtftMidwJtEQDCX80k5Gi3bpwlGLBlFzbjvsOK1Om/iSDzsilcMNJtj2
	 X7J9Dcc4io/tCbHG1RjRHyxw8N03cYszawfFPmlXkDpQ6HM3+Ox/90uqEesFxF+36v
	 DXAVZgrsXU4EA==
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a2167bd087so12473065e9.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 05:08:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEO7awk6ClF07tGW88TCjniQu7/CAOCBEMcp/q860mwY6xG9ynTTXRcNUo51T/KzrPNsXrRau6eI8A=@vger.kernel.org
X-Gm-Message-State: APuU4Z/88RXGETiqbS0jrwsSCu6pkG0t1/4F3DYaCoLQsuIPsmSpoGaP
	J9AWTnkF9jvx8o6tz9F1torjyfyhBIxg8THVwknshqza/wEAQ4Fiwzcd1Uxf3UGJKbDe4BWP16z
	ehgb2x9vtj1TmfgxhrsylFKjHjeqX7Mk=
X-Received: by 2002:a05:600c:3b16:b0:4a2:267:25b3 with SMTP id
 5b1f17b1804b1-4bb55ab4493mr118562415e9.35.1794661723805; Sat, 14 Nov 2026
 05:08:43 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:08:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
X-Gm-Features: AclHuK_1B3cdhqJcEVfShwQslZ0jrvNhdkA66924rVca4uIM67v6w9N5xpnc6Kg
Message-ID: <CAJF2gTScHWwSp6NbTf1+n0rS3fGUU0wRqhkZQVgjRLeu6XpvOA@mail.gmail.com>
Subject: Re: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:33=E2=80=AFAM Han Gao via B4 Relay
<devnull+gaohan.iscas.ac.cn@kernel.org> wrote:
>
> From: Han Gao <gaohan@iscas.ac.cn>
>
> The V861 uses the XuanTie C900 CLINT implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-clint" as the fallback.
It's allwinner,sun252i-v861-clint in the patch; please correct the commit l=
og.

>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/=
Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index d53f52e80d88..313fb39bd453 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -49,6 +49,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-clint
> +              - allwinner,sun252i-v861-clint
>                - canaan,k230-clint
>                - sophgo,cv1800b-clint
>                - sophgo,cv1812h-clint
>
> --
> 2.55.0
>
>


--
Best Regards

 Guo Ren
