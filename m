Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11FC53EB10D
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 12:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781526596; cv=none; b=l/arRyUMT+KZBj5lcQ7QtH2qSom/zNnkDaOqWVE7imqWJ8A7bJ0v2DDq3FKwYoiCIo9WWHX22KeE29Dy9YLHHVDxm3XPDBF5AYgly+NvVf6RTvx5vFVOPKqfb3fp+CCbWyGjls5/H8Dzh6RJLTO8i9eOddHEp6jnbgG7uB+Sxeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781526596; c=relaxed/simple;
	bh=y4inj7QtuABTALkC23yJ3TUZEovMNW3xTSrhVh4k1P0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KolGA/ctLOkG9buAaA+8Htu2VWbq4FnN6PGyNNqejKl/60pfz4u54922RNbf/gbxJZoD4tLHmaL7nHEo/C3gJH34P2GClnxrbkNCxhaPWTcsCS7n830SJiYcmAU2xywENgU+/m92j65UEMpw7BSzGLa3ADBZM0+P6zdXne3BOek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XpEvJ7vP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XpEvJ7vP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490b211ee6aso24330395e9.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781526591; x=1782131391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=XpEvJ7vPdLMJLoqZLmXzxO2NG0bu/NTikdi4wx+CxWPOX9da+Cs6ntf/T1lD10T+t9
         vVdaVBnFHkdhd1+07Dtq4wVYL9BwnGlYAKJ13k/lvYLSbnmgOwGSi6nF1zR5mV4+ppPy
         xwj7B0iskQWdXrtP2LczwEsE7saMQdgTCpkLNUda4eKhs+yH4A10e144QknJ4YZsYoX6
         9IKwaWdGGSxrdLUUrAAesk9ps0o/LxGmbiLoLO2Ua+vi014ZEERTvpQ/CQvmhGRalJ1d
         tp93QM2xJtqQpwpaVtuvf2NEURR2D+7fSxe5KlBaDjtpCQ1Hu9LmvcxjtS0A2+5w2es/
         xh0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526591; x=1782131391;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j2xSbb+XBUSXol+Xw5qFRPsWuUhic/XBn3XXsaZ5Bxc=;
        b=aXgCMEHugfNPg8PyFACXy8rPANeaRBjE4jBM1DpDpmjF9GKkaB0hQbLyK+AGa3zxDs
         OczbvMIKZZkE5XHLvXF/ZT81IfaWVeAQIBVL92IlrJli2gy+dtt3W4qZUzOwkysLLqUr
         +wIBWwV6r9h1vFvWLwgdIQaX9SCE3jdL7LGbgn2650XFxDxbn63NvHy8NU1gTd/kwybj
         vSiLgd6Jj48PZphMS0nXqk03DKw3vwcANY8zNntdh4pJr0mA9Vwy+U7KutmDtC31dx+J
         +lbLaVkRA+CRv4sl8T9XUYTuDCiOU7V2oMtBpFU52im2j/J3FVDPs2erVYaI6800Cjgz
         TZXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+BpUfMFH++XMb5/xO02qRnoGfMr3jc+qLncnVsKM/WSoN8W8ZIcu5/b00dcbMzRQg+L8p6w0tKmP8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyctuCQwfdwUMzyiXorX7CVL76A46iQ6Bbwqu5IGD9bFJU1KMhe
	oaAn1TLuowhRuciicM+d4EApCkKFjGkNkVO7N7LjftVlSZgRq/4nSStjDxtkcTR6aQA=
X-Gm-Gg: Acq92OELV1UiSxqMQmzKSTWJqteLjrOzFQ6TW0KmI6Dj+zJD/Z/cTpTlCo4E4pzkNsx
	1sh71AdrSfRa3d4WPeSwcxYcC8wGR/jt2WH9MsNtAxubfrcyovYbBcsIvT1FSC6XVrLH4WZFAqC
	wHnpZJ6sM6fnRbvG8oGH30JI2JFltFmUKZDKCMloBvAdqai5lmqcyXqhdj3047gRL1v1HEFShsw
	+oyEIZ/IEZLVLbQz1yrNXZRG2xiQrXoTPCnjBo4Je+jcVaB7PS9na2vwUS0Pnrqvrk2wjdbGDje
	XGi/wYmrNf7zgm5u/9Uex/Hlh0CyOqYceDQHn1Sh1IrJQb9KuvQb4+Kl/bcyJAveskEWvJiuwut
	HQ91CHntDUg6hmSb5vZrZ3Wl/+RadBu/BL1P5CTugKeaMDefuAhNiXG2n9uGuTIyT3Jj0QMU9fS
	ZhIUIAzNG5NpsBB37YResrEg==
X-Received: by 2002:a05:600c:8b31:b0:490:b28d:a6f9 with SMTP id 5b1f17b1804b1-490ec4a8474mr184582905e9.8.1781526590867;
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:3c22:dcc2:a51d:cde2])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49220372ed0sm223313935e9.14.2026.06.15.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:29:50 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
In-Reply-To: <bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com> (Jian Hu's
	message of "Mon, 15 Jun 2026 19:25:20 +0800")
References: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
	<20260610-a9_peripherals-v3-2-d07a78085f71@amlogic.com>
	<1jecieftme.fsf@starbuckisacylon.baylibre.com>
	<bfe92bbe-5325-4497-b79f-10c7a6e1ed5b@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 15 Jun 2026 14:29:48 +0200
Message-ID: <1j7bo0dm0z.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On lun. 15 juin 2026 at 19:25, Jian Hu <jian.hu@amlogic.com> wrote:

> On 6/10/2026 8:49 PM, Jerome Brunet wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On mer. 10 juin 2026 at 16:14, Jian Hu via B4 Relay <devnull+jian.hu.aml=
ogic.com@kernel.org> wrote:
>>
>>> From: Jian Hu <jian.hu@amlogic.com>
>>>
>>> Add the peripherals clock controller driver for the Amlogic A9 SoC fami=
ly.
>>>
>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>> ---
>>>   drivers/clk/meson/Kconfig          |   15 +
>>>   drivers/clk/meson/Makefile         |    1 +
>>>   drivers/clk/meson/a9-peripherals.c | 1925 +++++++++++++++++++++++++++=
+++++++++
>>>   3 files changed, 1941 insertions(+)
>>>
>
> [ ... ]
>
>>> +
>>> +/* Channel 6 is unconnected. */
>>> +static u32 a9_glb_parents_val_table[] =3D { 0, 1, 2, 3, 4, 5, 7 };
>>> +static struct clk_regmap a9_dspa;
>> What is this ?
>
>
> The peripheral clock definitions are ordered by register offset.
>
> dspa is one of the parents of the glb clock, while the dsp clock registers
> are located after the GLB clock registers.
>
> Since glb references a9_dspa before its full definition appears, the
> declaration
>
> static struct clk_regmap a9_dspa;
>
> is added as a forward declaration to satisfy the compiler.
>
>
> Would it make sense to relax the register-offset ordering in this case?
>

I don't think we ever enforced such ordering (or any other ordering) in
the clock driver, so yes please.


> By defining the DSP clock before the GLB clock, we could remove the forwa=
rd
> declaration of a9_dspa.

Unless it is absolutely necessary, please avoid forward declaration.

Declare what is needed first, keep related things together and use your
best judgement ... IOW, make it easy for me to review ;)=20

>
>>> +
>>> +static const struct clk_parent_data a9_glb_parents[] =3D {
>>> +};

[...]

>>> +
>>> +static struct clk_regmap a9_vclk_div2_en =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D VID_CLK_CTRL,
>>> +             .bit_idx =3D 1,
>>> +     },
>>> +     .hw.init =3D CLK_HW_INIT_HW("vclk_div2_en", &a9_vclk.hw,
>>> +                               &clk_regmap_gate_ops, CLK_SET_RATE_PARE=
NT),
>>> +};
>> Looks to me all this div_en / div repeating pattern would be easier to r=
eview
>> with tiny macro .
>
>
> Good point.
>
> I tried to reduce the repeated div_en/div pattern using a helper macro.
>
> It keeps the relationship between gate and fixed-factor clock more compact
> and easier to review.
>
> After using the helper macro, the div_en/div code can be simplified to the
> following:
>
> #define A9_VCLK(_name, _reg, _bit, _div, _parent) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0\
> struct clk_regmap a9_##_name##_en =3D { =C2=A0 =C2=A0 =C2=A0\
                       ^- not strictly necessary, a touch too agressive
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .data =3D &(struct clk_regmap_gate_data){ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .offset =3D _reg,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .bit_idx =3D _bit=
, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data) { =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name =
"_en", =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_reg=
map_gate_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { _parent },=C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> }; =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 \
> struct clk_fixed_factor a9_##_name =3D { =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .mult =3D 1, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .div =3D _div, =C2=A0 =C2=A0 =C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 .hw.init =3D &(struct clk_init_data){ =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D #_name,=
 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .ops =3D &clk_fix=
ed_factor_ops, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .parent_hws =3D (=
const struct clk_hw *[]) { =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 &a9_##_name##_en.hw =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =
=C2=A0 \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .num_parents =3D =
1, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D CLK_SE=
T_RATE_PARENT, =C2=A0 =C2=A0 =C2=A0\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 \
> }; =C2=A0 =C2=A0 =C2=A0 \
>
> static A9_VCLK(vclk_div2, VID_CLK_CTRL, 1, 2, &a9_vclk.hw);
> static A9_VCLK(vclk_div4, VID_CLK_CTRL, 2, 4, &a9_vclk.hw);
> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 3, 6, &a9_vclk.hw);
> static A9_VCLK(vclk_div6, VID_CLK_CTRL, 4, 12, &a9_vclk.hw);
> static A9_VCLK(vclk2_div2, VIID_CLK_CTRL, 1, 2, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div4, VIID_CLK_CTRL, 2, 4, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 3, 6, &a9_vclk2.hw);
> static A9_VCLK(vclk2_div6, VIID_CLK_CTRL, 4, 12, &a9_vclk2.hw);
>
>
> If you think splitting it further into separate helper macros would impro=
ve
> readability.

One clock per macro please. Hidding 2 declaration is recipe for
disaster. For ex, here the first one is static, the 2nd is not=20

>
> I can do that as well.
>

