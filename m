Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794662965;
	b=voWWtKKuIatLL+U8MjcNz7l0Y+3YF01Zcs5KBnIb9kz33Feymn7yo4MG5Yi+HJ3hTPa9
	 8Yxy9d/PLjv4EXgNWrrI9iDXorCSpdiVs65R0cTxI1ymN600Ug5gg3BGE2qYjcZR2hnZ4
	 5/d0zcnBgPXDA1jS5d2wuLlfuX9Ubt/iNl24Xs3PHoS/7HZRfz3YMfMQnyy4fZgEETwJR
	 6HNG/zr7GTqWp3TSnnWXbEX5G5CKzlyHVa0swzGgRiFjmcO7N2nGeW3Tp8ptAzXJ0Innf
	 CGWd7pGGgQyfzL3kD6kXzkXhOVHSfrI30Nu8ODWf5XyZKvSJrtrOMUwlbunmhLkH5LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794662965;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8PCw2XdXKwdBOKGqs7jdnmPpKrWXHVDdf62xcZoZaEM=;
	b=IeC73J/Fo3Kg/0pTMMq8SaUl6YV55dGG2/h1A3gT/5ENtBad0AnFve47qPxRkb/K/qKs
	 x91tffrpDOles3B5jO1dAL3Qh+P56xln2IP4EZMV3qmcmtaT2wYXD3/ubmh4en56kCs0k
	 xUCFilJTe8eNCGHcYAGPWNYVfrpVMIM4oshlFpKK0H05EEZfbllap7xNo9rXx2fam4Qeo
	 PK2fI0FS+0t8RhRc8/2I2nz57ronq3lEVVug4tAvgLtqA4qe+K7Rqiw4CtVWFacREsOMq
	 XKRGzdd/GarJQYfJ5RA5JGocR+gCcJ95Wu9ZMEqoNtn0HHE6H+iezYZpMw5qaTARumA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buEyhMGQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C8FC606A330
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 13:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=buEyhMGQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15C51F000CC
	for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662964;
	bh=8PCw2XdXKwdBOKGqs7jdnmPpKrWXHVDdf62xcZoZaEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=buEyhMGQMrI8s1IR61ilfyt5eUg3WKT7D2XTfZZ/NuZeTsIf9SkOuJ/yG6SCVbMkR
	 c6FDOvjWHa6zUWV/Jta0AkeBNLD5NWjpz3RF+jD8VV+Bgfw6GycpLI8IFFW3Ksd1C4
	 pqu84BRKs/GbL4nCQNyyGPK14W6mM0gn7ntphbp+cOTeqIixpII7dw45oylMW6x0n/
	 j+5NmePjLEKkYAx44+/LjhvIB8AjED24SE3TToBNAVvjQtvowiczDiUzLhMxAsvtek
	 ZBLLq7dv4lR6eUIkjX0jj6PExHZJo+9DDR9Ud8zWvoOv4GSHc1t+FamxFki13vWJU1
	 rXE4dpVMHWoWw==
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso4708945e9.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2026 05:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHXw5f5r8eYgcUQc40VpBrFJJDrBU+pojC6HWTRQeQ8osByicPYXsH5y0YmsaOk3+HJ575aNi0BoA4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OeTLshYbh3ig48VTROAY1fi6PavO+iL5pbsKb3aOZNvzSt2By
	hsH4lVdUDbiHGLPzi+KzhrbfjnQP3gy8zn9KxQkwMzLzux8r4m90UKI7geYiZmojx97PUxakNAZ
	gA9R9T0NXZzXtwFF7s9lQSkE/8DZxLho=
X-Received: by 2002:a05:600c:a10a:b0:4a2:10f9:37ce with SMTP id
 5b1f17b1804b1-4bb55a4f1d8mr82881675e9.15.1794662963477; Sat, 14 Nov 2026
 05:29:23 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:29:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTREPzZeBX+HMvXhPfgW_PUaUQRS=beZdUAX_dWdQXQXoQ@mail.gmail.com>
X-Gm-Features: AclHuK8FYIwK7avJPlBwjKjnw3eVNsp5Aw_49eWaUu--rt0mOUqOqs5zKnvpneU
Message-ID: <CAJF2gTREPzZeBX+HMvXhPfgW_PUaUQRS=beZdUAX_dWdQXQXoQ@mail.gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
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
> The V861 uses the XuanTie C900 PLIC implementation, like the D1. Add an
> SoC-specific compatible with "thead,c900-plic" as the fallback.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml     =
 | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifiv=
e,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/=
sifive,plic-1.0.0.yaml
> index cde4bb691897..6178fea9bbdc 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-=
1.0.0.yaml
> @@ -72,6 +72,7 @@ properties:
>        - items:
>            - enum:
>                - allwinner,sun20i-d1-plic
> +              - allwinner,sun252i-v861-plic
>                - canaan,k230-plic
>                - sophgo,cv1800b-plic
>                - sophgo,cv1812h-plic
>
> --
> 2.55.0
>
>
Oh, my misunderstanding, thead,c900-plic is used by opensbi. Please
keep this in the commit log.

Reviewed-by: GUO Ren (XuanTie) <guoren@kernel.org>

--
Best Regards
 Guo Ren
