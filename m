Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DBD471D0B
	for <linux-clk@vger.kernel.org>; Tue,  1 Sep 2026 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253042; cv=pass; b=HIbWMuVNsSCQ8NgDr3s8hOYJrlBKDwTGHPjgOC61B4qtGL1Y66wO2cDo76N3mOYze982WpbBSuQd3MyRj5pR0mQvOY6tkUfOomd2F7/nJfNhoZs0YSIxaqUwuaI/wVFmIwZzrFYgxMXadckQJfGC7HYl59GSGYofHgQBMX85RkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253042; c=relaxed/simple;
	bh=Pbz07IOx7uWzunVKVHlwzF5t9F6b7iAgHltccdPflGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NfKiMUHCsSN2Yn4mHNhju+QdR3Y6DZKbzJP2Im7WbUqMYlWwN+ftiroOUaIMUjxEkJDrIa9rqXWOp8ZxPnMjOQbRe0SW6Z0B7YYoerxRM/fkfyJrud7ZeNUcH+Hy4hizjhcB5lzerg5ahrbFbUY/UxSLzjdLqYQJDAAXD7EpJpI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hrGMohtJ; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hrGMohtJ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a61910369bso4460598a12.0
        for <linux-clk@vger.kernel.org>; Tue, 01 Sep 2026 01:57:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788253038; cv=none;
        d=google.com; s=arc-20260327;
        b=kTRO6bwDP4ygc4WouTLdUvvo4cz5uutPBC25QFdE0Di3U1NLzPLmR+gksLQhiut/OL
         +JF0ghlWUm6grc2+N6Un+7QNBmCRg5q0P2lskDyeX2S6p+BDtea3jfshjb+wZLtIE8j2
         CDVGvGcHdCk5Go66hATeG7KWMEGpP078fzGzhD5IqUVGnirvppQkRjoQBhfia1K9OJE7
         7twPZlmbZU5MDdpqKlsxOoaG9ty5Kxs9W4HPRZK+uu1oQz6VV+LJbA8v4VwN27IM6BHM
         3Mn9lMfHgYPBtSjWYghgRMYVVI34ZJAkhcJWJfryYJ69cdNlIWlL6kiSEQi/gcrrsM4l
         pr/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bPhwsI1urk840eFQFOhdbzxIWtm9TMM1qXVbyg+SFZE=;
        fh=rQuXC6huS0eYvV3uudZam0XbQiyW6kVmQZ/nePknYXE=;
        b=AgdM5k7TDlFIXwIHkoYtFujHbz0haJxY34aM6dr5o0zic3OyhWBZj3M0qiO1BjXdrl
         K+2GWjHCvCneQd8y/ivQaueiBCoU9uf1YYs8rXHuavBJYZSdcqF1wdFGXl+OeEHmWLO3
         YLFB/Cd5ACY3cl2j6m01cD4HeI2AY0eUa/3mgKvwE50KcLKaqgIEieDyBA4VJTcSobyb
         cCNE0e2bgSN3qCKbQlqUBq/eA9eLvYFjFZd1aummNifsaWFQpBDXl1v7bw5HFAaSqa83
         9s5XhFqJDIldtAa2GMK7C65v3IIICIycbZW8QoFeYEoYAyLEBgKOSaMJyegy5yWSQtHC
         wjig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788253038; x=1788857838; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bPhwsI1urk840eFQFOhdbzxIWtm9TMM1qXVbyg+SFZE=;
        b=hrGMohtJ+5Mbb6KN9lsAGC4MBEth86CGQhNW6qnIu2z3Zcf1iMFQaDusVtu0Dnjwoi
         sMv15QY31d9w9B3kY1Z07kGX82ajGGzRXTr1EVhnALzLmldnybzD2idTPPRaldfldA6L
         GC384aMxypXyMAWBWMYvI2rc+14mY78pFwPnUUH41XRYhIz4kSpt1tsutqf/hjG5YfCa
         sH+z7xRINBHzdokYS5mbePOEU9gaDlDn9SvPF1HTKMMFDh2ynzKVLYYMoc2uycgj7sFL
         S0CST3iTiuCAC4WUmq8OvxrSVATlG3u24B/CxuhnGcMZc7LY+xeKVDia5bf3AkahM0jc
         GnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253038; x=1788857838;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bPhwsI1urk840eFQFOhdbzxIWtm9TMM1qXVbyg+SFZE=;
        b=lWq2Ydbjuf0Ky9iuUORsJK0ICnCB8dnqbAcuB2v3DYwxwbaZfr6xljez0UMKeV4+lp
         BxjYRIodu3jtzXoNOKr2UHw5+fzerpGcQso5X/6tORNQeB3fc9j0CUbd2L5TrXZegaQQ
         GQMR0lrxEZXf0C8uQmqzr/fAEk7z7qEiwmyKzkDQTPyf8YZJfIhjln9wPANz2TpJKcbU
         FvsqZyX5xnkO+USZMxVhz51ZRP6FYso3hRak40bHtctZf2Drsat2Wq5m4ZSlWpBbE9Kq
         10qqRAFOLralCMsTkYQDNX8uDfwDqQhrRujolTSZXpDdZfq6hFCBqiqsOFNnGgpRl2kS
         d9dg==
X-Forwarded-Encrypted: i=1; AHgh+RquKcxweT0NsrBhnK4lxDQ13lRKvWHIYIZc8MqBb7A5ru9wZy22a/cRJ3WyjrAOWckHiTTd+IKyK7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m8eKoKw51VAK7svceeTXlTFZX6NCJZONYvG+KH9+bCI8hF5XCk
	pa5S4uUGNMDJzO2yKj8yRQazsnsuhRCvkd1A7OnHuIAOUrkvNwYSoroMVozeTbImdDh6Ikt8GUL
	6nzC3FYcgzEGGn644cmORJgp7lfNjbQA=
X-Gm-Gg: AR+sD10AcYsiMMi5xvfuD/Wt8gqQeoxxqArx+S5dlSpGdmyaA8Gyq7zu+TGukVpHQdZ
	51D9uSvTS+ujf3OrocDyqC+Q8beZDbicDmUyxQrsFXOU/rnBfVQ3jRIvbiiqPKF982VCDJlzF+t
	8WmMn/i87yxMu7bC2p5UnxzJRfgnK9zntJOE8pU+Jz2qyun5BeB1TcpZGjy3nP/NtdDuODTKwpK
	Bmmu+7bTn159nYSyinNq+OEJGj1OsM8Z/F+Mru/zyX1u2UODVqTSzKi84ERAX7bEuWTHDvI2pq7
	20oxYN4z0rHIAPueQl192e18e1K7+6fLi9jh84c43YIaQrSKyGguon9LTDw/spre7mDZDeqHGVF
	r8Xw=
X-Received: by 2002:a17:906:6a17:b0:c25:c67d:53cc with SMTP id
 a640c23a62f3a-c25c67d5cd2mr18684866b.8.1788253037879; Tue, 01 Sep 2026
 01:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
 <20260901070717.20513-5-sreeshankar0910@gmail.com> <fyzo7furxfsreajgefuimfdpkkulxvwxf76plc5o6kjv7bgdym@2pah3t7yfiw7>
In-Reply-To: <fyzo7furxfsreajgefuimfdpkkulxvwxf76plc5o6kjv7bgdym@2pah3t7yfiw7>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Tue, 1 Sep 2026 14:27:10 +0530
X-Gm-Features: AcwNN1XGMvHREpeWhXMnhL-AR_TL9aR4BW-G9PMQ7EyQU1HF166WiwXPkNVsQPA
Message-ID: <CAA-+ukJOPKGL3iS15uWAc7iXviRe-xgVf61dcd_gP6p9zLrByw@mail.gmail.com>
Subject: Re: [PATCH v8 04/12] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: andersson@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, rafael@kernel.org, viresh.kumar@linaro.org, 
	konradybcio@kernel.org, tglx@kernel.org, ulfh@kernel.org, radu@rendec.net, 
	taniya.das@oss.qualcomm.com, danila@mainlining.org, davidwronek@gmail.com, 
	mani@kernel.org, robimarko@gmail.com, linux@gurudas.dev, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 1 Sept 2026 at 12:51, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-09-01 07:07:09, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  drivers/clk/qcom/Kconfig      |    9 +
> >  drivers/clk/qcom/Makefile     |    1 +
> >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> >  3 files changed, 2285 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
> >
>
> [...]
>
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > new file mode 100644
> > index 000000000..0d548fe4a
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > @@ -0,0 +1,2275 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > + */
>
> [...]
>
> > +
> > +static struct clk_alpha_pll gpll0 = {
> > +     .offset = 0x0,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .enable_reg = 0x52010,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
>
> const
>
> I think I already mentioned this for v4.
>
> > +                     .name = "gpll0",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .index = DT_BI_TCXO,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > +             },
> > +     },
> > +};
> > +
> > +static const struct clk_div_table post_div_table_gpll0_out_even[] = {
> > +     { 0x1, 2 },
> > +     { }
> > +};
> > +
> > +static struct clk_alpha_pll_postdiv gpll0_out_even = {
> > +     .offset = 0x0,
> > +     .post_div_shift = 8,
> > +     .post_div_table = post_div_table_gpll0_out_even,
> > +     .num_post_div = ARRAY_SIZE(post_div_table_gpll0_out_even),
> > +     .width = 4,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr.hw.init = &(struct clk_init_data){
>
> Same here and everywhere else.
>
> > +             .name = "gpll0_out_even",
> > +             .parent_hws = (const struct clk_hw*[]){
> > +                     &gpll0.clkr.hw,
> > +             },
> > +             .num_parents = 1,
> > +             .ops = &clk_alpha_pll_postdiv_lucid_ops,
> > +     },
> > +};
>
> [...]

I apologize for my carelessness. I edited the source as per the
instruction and sent the patch in v6 patchset.
Link: https://lore.kernel.org/linux-arm-msm/20260824150156.1310-5-sreeshankar0910@gmail.com
I accidently applied the old patch from v5 patchset to v8 patchset. I
will send a completely fixed patchset as v9.

Regards,
Sreeshankar K
