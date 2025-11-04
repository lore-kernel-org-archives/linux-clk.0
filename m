Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397CB3112B4
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762251302; cv=none; b=mrz8+w6ipSiWEkTlOctWe8HgcVxJBsAKwhGcs1+Nk4XlerGsxESWZsMTH5mReOKCQ9OdvVB3pcccAdj/mfqk7PHsmHb54ugzmZCHuxAzYu3WMGDmCCIWKIpmyIqqpsHVUonsfu4W2A68ifUQHmpdXw5WkHy8+Zh66lsBMOE1QhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762251302; c=relaxed/simple;
	bh=XcQOLlP7lDH4KciW/rNOuCE0cTSrqMzPKKr1wMywodA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J4QPQEEEytvKJ/PWtPRK1hkOndTSWeiclr1x2TeJOfjHtqf0mbRIvs2kjrVKQ//hEl9E9ME9Zl69vhidNQ906YcAFhY1WnhhMwfWHJ5xqzS1BH/t5COu8FCtOL1Gp+Mx117XpHBu/hZzlgp0Xp0Xez6I1dz1BQzfV5HM/+j+uxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=OVTbNDlN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="OVTbNDlN"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47758595eecso1711415e9.0
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 02:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762251298; x=1762856098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=OVTbNDlNMfRou9Zuj6aeOF0zLR0LDxjDBWc0gy4aj/xe6+QHbD5geqK6mQ3se5VDlf
         ocS6fzbjRK9mrkyZZPjx/U0DHeV1p7o3Hm5EhAO/Ou0IgG95CkFRqF3QJlztPUqouqur
         D5EVvs7EjYUlY2Q/u1BAybwDgY7FSIUXJHQA1aK3fIAJTNyey4PM6s6Z4cg+hRWOZo+R
         DcnJhgXZ9LLtFPNds+8pDKnYvCXV7sBAIvAsoMgQvWK5TR2ah2ccy/r2/Y0nFvCU+sxG
         9ak5oPa+WLmsYtgjMYgvc9F2pyDZBdpQcH2aZfh8q0w8wl1g0UYFNkd7Gh2mz1nIOFV5
         +NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762251298; x=1762856098;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VzTHhy3GAbklolyt8qy1XMnUZAQnKYr+cBkCn68R7OE=;
        b=c0JzUc8TJiHRIOTW9sGg1qsHnJaiPIO6XvLYaMjfuLpK/1ccO6TfQhByPs36NeLKCl
         817oe2fQ7Mo+HZh7TjVzv/4lIj678TZlFoq6MU/MWn+jgLuJRnz2qz7Jm83GFx4kaEap
         X192P3vrdVJuvvZXqwXXSKx2vLkf0gfudGH40zWo3unWumJa4JbxeeTdsng8FSNtDQWz
         EN7qlerufrncHgf7bhcSWOTrmEeJMN58dgDFuiTuZLFp9tfOX1mmUAH8e0PBmmOIt/M4
         P8LP1kKOtwRLrkBTTyeCPPMRqQ1z0QWSGboZeT/YoA+iwX6E6e7QLHb5JftKz3SGQRUi
         ZUUA==
X-Forwarded-Encrypted: i=1; AJvYcCUQwC8He6lzwm1JasOUPUE1UdDFs5SV4Ix7kiij/9OVooujFnQHp2Ok6MgBFsYAsIfRpvFjB6Lz3vI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKEVS1EIblcFH7qor3JkKfJm8SoJeub8CYkw6AlelxO8AdF9Er
	VgZta/NzoK3tcyYR9PanExa/cMjv/l6oM3aFq00dxKPLBLHkYA99QLVaqmh9A0ODt+o=
X-Gm-Gg: ASbGncuXSBHa7unA0p6BB0sB9+3zoOZgWHiCYqye0ICZHAEJu9aD3hm043TzLV/26UH
	6/hwH0BfwrPPAzQOrapo75JQ1Ht3HX6n5ODsbZiqAaTvISOXaOjmtisdFxfNCA/ULdcBGdFQrgv
	viAJlpIt3GRnKZS/uyeySC2J34fuIemWQHiOlLDBSTV3JdwdUfzehbMzT/vuGCSklvy4PEI2MXv
	eX0TtCC8WEJjGftGThF3XX9ym763yg+KNsqBwM7LksiE0nkNUrS2jvk+3qxysaUaMDZGTc5rt6b
	o+ubV12OdLTLHI9HuICo3Pu46JrmRmjqBD4SOPh/DWphkKPzQKySsYBvNGJGTL6wdbuWm9IS59e
	E3VJhqtpobwECulyj7LhIgsBoMc0yHbamypFNeUkm56lJ1FXaHzftn3UKgg4mntUbh1ObZcHJEN
	6O9w+csKiMRQ==
X-Google-Smtp-Source: AGHT+IFW39f8luyhpSRptudm6R2xZGEcdodo7MnF7yu9NJ2j+0Jo9qKayBjVFzg4CRgrhQRxcMSJYw==
X-Received: by 2002:a05:600c:3489:b0:477:cb6:805e with SMTP id 5b1f17b1804b1-477307e0513mr122942125e9.18.1762251298482;
        Tue, 04 Nov 2025 02:14:58 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:8c13:6331:568f:92f3])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429dc18ef89sm3810253f8f.6.2025.11.04.02.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 02:14:57 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>,  Chuan Liu
 <chuan.liu@amlogic.com>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Michael Turquette <mturquette@baylibre.com>,  Dmitry Rokosov
 <ddrokosov@sberdevices.ru>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 5/5] clk: meson: t7: add t7 clock peripherals
 controller driver
In-Reply-To: <3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com> (Jian Hu's
	message of "Tue, 4 Nov 2025 17:17:50 +0800")
References: <20251030094345.2571222-1-jian.hu@amlogic.com>
	<20251030094345.2571222-6-jian.hu@amlogic.com>
	<1jbjlnxuug.fsf@starbuckisacylon.baylibre.com>
	<3b9a5978-aa02-486b-85f5-6443dc607dd5@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 04 Nov 2025 11:14:57 +0100
Message-ID: <1j1pmew1cu.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue 04 Nov 2025 at 17:17, Jian Hu <jian.hu@amlogic.com> wrote:

>>> +
>>> +static struct clk_regmap t7_dspa =3D {
>>> +     .data =3D &(struct clk_regmap_mux_data){
>>> +             .offset =3D DSPA_CLK_CTRL0,
>>> +             .mask =3D 0x1,
>>> +             .shift =3D 15,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data){
>>> +             .name =3D "dspa",
>>> +             .ops =3D &clk_regmap_mux_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>> +                     &t7_dspa_a.hw,
>>> +                     &t7_dspa_b.hw,
>>> +             },
>>> +             .num_parents =3D 2,
>>> +             .flags =3D CLK_SET_RATE_PARENT,
>>> +     },
>>> +};
>>> +
>>> ......
>>> +
>>> +static struct clk_regmap t7_anakin_0 =3D {
>> Nitpick: for the DSP it was a/b, here it is 0/1
>> Could you pick one way or the other and stick to it ?
>
>
> ok , I will use 0/1 for DSP.

I think I prefer a/b if you don't mind. see below for why ...

>
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>> +             .bit_idx =3D 8,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data) {
>>> +             .name =3D "anakin_0",
>>> +             .ops =3D &clk_regmap_gate_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) { &t7_anakin_0_=
div.hw },
>>> +             .num_parents =3D 1,
>>> +             .flags =3D CLK_SET_RATE_GATE | CLK_SET_RATE_PARENT,
>>> +     },
>>> +};

[...]

>>> +
>>> +static struct clk_regmap t7_anakin_clk =3D {
>>> +     .data =3D &(struct clk_regmap_gate_data){
>>> +             .offset =3D ANAKIN_CLK_CTRL,
>>> +             .bit_idx =3D 30,
>>> +     },
>>> +     .hw.init =3D &(struct clk_init_data) {
>>> +             .name =3D "anakin_clk",
>> Again, not a great name, especially considering the one above.
>> Is this really really how the doc refers to these 2 clocks ?
>
>
> bit30 gate clock is after bit31 mux clock,=C2=A0 and the gate clock is th=
e final
> output clock, it is used to gate anakin clock.
>
> I will rename bit31 as anakin_pre, rename bit30 as anakin.

Ok for the last element

... but I don't  like "_pre" for a mux selecting one the 2 glitch free
path. It does not help understanding the tree.

For such mux, when it is not the last element, I would suggest
"_ab_sel" ... at least it is clear what it does so, "anakin_ab_sel" ?


>
>>> +             .ops =3D &clk_regmap_gate_ops,
>>> +             .parent_hws =3D (const struct clk_hw *[]) {
>>> +                     &t7_anakin.hw
>>> +             },
>>> +             .num_parents =3D 1,
>>> +             .flags =3D CLK_SET_RATE_PARENT
>>> +     },
>>> +};
>>> +
