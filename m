Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6D614E2E2;
	Sat,  4 Jan 2025 10:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735986218; cv=none; b=ann1DpuP1o7qZyfKp+FAZvKuaJMIfqJtyQT6D0neIyDszJFs+TCRWuyJpsLOpIlj1sOfPaXmrEyW4VeIJeGdGHpcFq8/VFSUmqzHWck2LlBBMWnHpw+7/8QCRN10g+e1w4PlBPCB3Rqh3y0pEMBWNRsznUlbIYEiS2k1rtMrd5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735986218; c=relaxed/simple;
	bh=qbr+GcXOv2DoG0CYyHwRoeofsAPEe/QqE00NDXmp92E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FdkHLt/vmypEsGJGte7zznKwhxPhLZzP83Dzz0mTi/Cbhp9qSmTVTB7mOf5EPGvOScOjo9+XYg9jGpf2LWTysVYKoDDZQ7h1Coq4JuMwe/YxXgOdchm+Fpx1R5fFPm3qG1xFFSq7QdBWCTX/rzZRgdMZv5+JZk7OS4pH4x/IIu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso14214457e87.1;
        Sat, 04 Jan 2025 02:23:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735986212; x=1736591012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5oEoAKKEizk1AGrodmNZICCaBPTxNB6DvcRBoDziYoQ=;
        b=uB2udBMI6+9T+1FTGWeuN/mUv+HDSIqbx9P4kZV9QUCG+S2fzJEzj254M2q+kcFkY9
         C2r27JSktiut0cJuMWWSGu89OUlNsrsiwjQUix+PtLXRFxpvGjBqaWfapZNTH6hmWOD1
         +m8UUgMJBQuGai6mSdhphouPIAntTPneKknm9egB9hiCdtAc0dVwCuJpuhfkqYEtxayt
         I+oWHBE3rJhg4VNdeWRZcW6XqiqNyYWp3CfBO2wzYqK++fFYQhdZJqsqcSwYBwC18gs5
         Rx+U0hbhyLR45j/oEBDYZWylBs+EBXQIheC7STyuWjRW4iWdzvVD2mjmU0kK7QLtW8NW
         Wbug==
X-Forwarded-Encrypted: i=1; AJvYcCV5G+LPjGwd0yrRDe02OOnmMx9SeZbWSf2PofNb1CPq6MpZEVhSVxPSzYdAeXwTOD1wqsW4f9S2Z8HO/wPV@vger.kernel.org, AJvYcCVi3UyM61pU20ZUBSr0qn9P76rKEBzQ75dUCMHvwmQe1AoZpR9hdfpupLJLoYze3dlIJFn/Wb0fc7iy@vger.kernel.org, AJvYcCWpVqoM6ycor6qnoWrEHHx8hspj2zubrTMntFN+fkAUNWzjBLhFCtmxt+/qV59LN+No7I4u0UWcbYRZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwIMMLIj2WZphYL5/NjzjXOhaKx5XrE5BTdjaNoN7RY5HC/GG48
	j/lq4Bd37YFHb8I3rv/quLbS/c8DOg3YGP/upuObaaw4o6JBg+917FJuXQs4
X-Gm-Gg: ASbGncvMeauk8UICz9ST+YUtKqtxCTrDm5K7NSfs3lMnG47XXUaGBu1kADj0JNjUcxy
	pq45q8gwNuHIMh0K/DkUfu2nySLmFmYfNNef05UxAp4O8/8+RKatw/6cCPT4xfcGNbYUlnfpnDo
	Dr6l1XJDoxOiaj7Izee7Q2ezmWxYit+6EhRWVTLfHORbNHIaevc+DXW7Blz5IB7431upIM9vXwI
	Zd0MJQ3mXayCB3Jr3vmu/zuwhikkO+/MQx8GxbNyg7dKBaBSRO5H3jnxX66WsF6ciIWYQlICZC2
	PrE7sV2J0w==
X-Google-Smtp-Source: AGHT+IFACAZBvpUL79CLLZ+uB/3EsilVf26Uuk2IFOkbkDoMKNSuQQ+jGQ5SquuM4Qc9d90lFyhDsA==
X-Received: by 2002:a05:6512:6d3:b0:542:1137:611a with SMTP id 2adb3069b0e04-54229533db1mr18665396e87.17.1735986211920;
        Sat, 04 Jan 2025 02:23:31 -0800 (PST)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54262e9a279sm874328e87.15.2025.01.04.02.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 02:23:31 -0800 (PST)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54024aa9febso14214430e87.1;
        Sat, 04 Jan 2025 02:23:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8Xjvvk1Qoktei8lb8/7FszaaHH55fAv4QdoIlx8eoMujowYKe5+UkTjeUfoGsUGnuMpqA1prKXn7ffrYR@vger.kernel.org, AJvYcCVSZl1t3gz0qneVij4NksBNkTlj2s6CNJuCQVDgJt7xWCWezgGiPYlRYvIh8q2Q8Sl1ahi6BOf7p8Y+@vger.kernel.org, AJvYcCWKAiMQv6T+IaaTTGeef/N+3iirzf6e8wiquyaGejsvp5MuVWcPeGcgoKYEbHLhgjxOi+LYQ+LU89CF@vger.kernel.org
X-Received: by 2002:a05:6512:2399:b0:53e:362e:ed3 with SMTP id
 2adb3069b0e04-542295253cdmr14007249e87.1.1735986209772; Sat, 04 Jan 2025
 02:23:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
In-Reply-To: <20250104074035.1611136-2-anarsoul@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 18:23:17 +0800
X-Gmail-Original-Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Message-ID: <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, Dragan Simic <dsimic@manjaro.org>, 
	Frank Oltmanns <frank@oltmanns.dev>, Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gmail.co=
m> wrote:
>
> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> select TCON0 clock parent in dts
>
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 =
mux")
> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt-bind=
ings/clock/sun50i-a64-ccu.h
> index 175892189e9d..4f220ea7a23c 100644
> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> @@ -44,7 +44,9 @@
>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
>
>  #define CLK_PLL_VIDEO0         7
> +#define CLK_PLL_VIDEO0_2X      8
>  #define CLK_PLL_PERIPH0                11
> +#define CLK_PLL_MIPI           17

You can't really split code movement into two patches.

With this patch applied the clk driver will fail to build because
the macros are now redefined in both header files.

Barring recombining the patches, please add a patch before this
adding #ifndef's around the two macros that are moved.

ChenYu


>  #define CLK_CPUX               21
>  #define CLK_BUS_MIPI_DSI       28
> --
> 2.47.1
>
