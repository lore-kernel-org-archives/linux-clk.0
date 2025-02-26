Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4B52248B5
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 16:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740585641; cv=none; b=fyhQUykF4mxPxyzZkMNGnnSakWYK6vjEEqRyjc857Ko7RmA0wwvVqD0ogwVbQvoeWd5YjG0WuRLAr9ukjLMo81z/l4oA6fL0Wrfb18NvC4W4zyeWLi+XpqY+/fSPTf0NOY5GXRWJCmRT9g1JlCm7q3cp/2+htuKKXOKu524KMe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740585641; c=relaxed/simple;
	bh=HEXgJqQrz6xr87EisIQomS625adNtA3oJ+87NWNDMO4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ilIohXuQdrHytoPDOivVeE54X0Or38p/KsSNHelqEjSvLCqrzyxAT19Q+/4QkWaCiBMVYFgNp8YzRxShRN+8nS6GajnuonWDv9UL2uw0gp0zvP5p5+mhuW4CznDRhkI66Ks20Ak0dB5OlRTVmO3qUO0A8CF759vDImqDkwHwOPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2Er+kdt; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2Er+kdt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5e04f2b1685so9932313a12.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 08:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740585638; x=1741190438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=b2Er+kdtTfvRrU7wR47cLuOA8HRjxqe0Qqw54w52UE9LFs5+ZYcMC++u/WvB6BT2K2
         mcnKOBnp8+8NbQpKnqAfqGYqvzJXP1oNbZ+hphjCbCtl3u+EQJJKn7biGOuVtdgjle4T
         Wv0avYw20SalbC331+ikD9eEKhtvftnoNRP0JBWpWXqEAe6qzPG1e6lblFyR6u8GKJcT
         WK5Ku+b4UE1teSxo0H2nEhcP/RQXViqu4fimUROeqcWjyP7JHJRct76e9zqs62v2bpFt
         9iGXbMbTcSj6Pw6tpmQTDgQlb8na9pwMBwyGOOAk85rTB0UoLwK7Bu2I/zk5uboZxGEf
         KDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740585638; x=1741190438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gwu1vQV8ggck37Vg9L4D8awhycEpwFoshE6s78gkYcU=;
        b=UVDsseFJq/C/cr0Glp6t145dRv++IkO3y3B7vzJHVS2PZYfHDof0z5Llf8djTWyThM
         QZcBfpTtjZ8YHMEAEY2DxzPthp0vxs4RVAiilsEucYaCYreGMsQumK933vSAKV+SE35p
         fzR7c6D1AkdZPvsnv9JMvCG6/XsyVlH6ShD1YYzc5iZMc0UerNsbdiJWa3D0bVEWr9Rk
         eTrbBlVpur87A03gWzvQqjMMwE431UOv8qatwTox8TWyfaIlTBja1oAkKZzsx4YQTjNX
         /ArtVljjyzZLlqLdyqMI0bzd/LOYI6g3CzAEx74rWJtF6WAtKzkfA2or18KYZwxO2YUS
         BiQg==
X-Forwarded-Encrypted: i=1; AJvYcCX8b84vv+YCQiahg/vhnhZomQLPYEjVLb8OMw4ajwzxcXGgZcufvlohWIJjzCLRmaRQQ86tXMBAAJg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZw7CoFk3Bu5DIuZF5Xbfeb1cvaW96CL55jmRhsDiVgn1m+dQA
	MsyRfzbjRw6hj01oKemtkEJatILBXeAoH5BZd+GUe1R9+EIsmuVA
X-Gm-Gg: ASbGncsS5BJp4IkPk5KkGVFJnw3tyeBrRw4FnWx6BL50wIA3FQhL3bjN1aWv1bMU9/P
	vlnSsDrRV90qBcU0nKpJpjDDbDObqBlT3pS8GF7Lst+mlijqsKRVuCoJTbdoa8/83D7m+mwFzXy
	ZdNI8O7ZD3GDlCjgYjuQM5GwMFMsJKw7SZfV1IpIEvYFPaCEgHMWrKV/f7Z7QYQJNEkkdczsa2A
	leTkF701OYuiZIIZus5Fq9n8/Wh0dE2/t6QsdqYUw9vAlmuHi5It1OUDG4I1vrdIPRlvVUJlYIS
	kQFWeq5XtJrk0nsIS9to6CNSosebStOzQQePJhz4iVIEAcroNk2t4/Rgxpzw1QxK03uf0J7tdS9
	EEA==
X-Google-Smtp-Source: AGHT+IEX8QHzkUkc9cGra4oV85XFYs0dB6tGVSwdZwBd02GmYl2uN7wCwssdJKsfpCdyntXkd/9Lkw==
X-Received: by 2002:a05:6402:2684:b0:5e0:49e4:2180 with SMTP id 4fb4d7f45d1cf-5e44a256c8dmr19099315a12.25.1740585633378;
        Wed, 26 Feb 2025 08:00:33 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed2053ec9sm350378666b.137.2025.02.26.08.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:00:32 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Kuba =?UTF-8?B?U3pjem9kcnp5xYRza2k=?= <kuba@szczodrzynski.pl>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:
 Re: [PATCH 1/2] clk: sunxi-ng: mp: provide wrapper for setting feature flags
Date: Wed, 26 Feb 2025 17:00:31 +0100
Message-ID: <2979203.e9J7NaK4W3@jernej-laptop>
In-Reply-To: <20250226103734.1252013-2-andre.przywara@arm.com>
References:
 <20250226103734.1252013-1-andre.przywara@arm.com>
 <20250226103734.1252013-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 26. februar 2025 ob 11:37:33 Srednjeevropski standardni =C4=8Das=
 je Andre Przywara napisal(a):
> So far our sunxi clock instantiation macros set the required flags
> depending on the clock type, but the new "dual divider MP clock"
> requires us to pass that piece of information in by the macro user.
>=20
> Add a new wrapper macro that allows to specify a "features" field, to
> allow marking those dual-divider clocks accordingly.
> Since the MMC clocks will be a prominent user, combine this with the
> postdiv field required there. Users who just want the feature, can
> pass in a postdiv of 1, users of just the postdiv can pass in a feature
> mask of 0.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

I'm fine with the new macro, but we don't need to chain them, especially
since this forces all of them to have post divider.

What about making special, standalone macro for that?

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_mp.h | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
> index 6e50f3728fb5f..1da1dcaf62ea9 100644
> --- a/drivers/clk/sunxi-ng/ccu_mp.h
> +++ b/drivers/clk/sunxi-ng/ccu_mp.h
> @@ -82,18 +82,22 @@ struct ccu_mp {
>  				   _muxshift, _muxwidth,		\
>  				   0, _flags)
> =20
> -#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +#define SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents, _re=
g, \
>  					_mshift, _mwidth,		\
>  					_pshift, _pwidth,		\
>  					_muxshift, _muxwidth,		\
> -					_gate, _flags)			\
> +					_gate, _postdiv,		\
> +					_flags, _features)		\
>  	struct ccu_mp _struct =3D {					\
>  		.enable	=3D _gate,					\
>  		.m	=3D _SUNXI_CCU_DIV(_mshift, _mwidth),		\
>  		.p	=3D _SUNXI_CCU_DIV(_pshift, _pwidth),		\
>  		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.fixed_post_div =3D _postdiv,				\
>  		.common	=3D {						\
>  			.reg		=3D _reg,				\
> +			.features	=3D CCU_FEATURE_FIXED_POSTDIV |	\
> +						_features,		\
>  			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
>  								   _parents, \
>  								   &ccu_mp_ops, \
> @@ -101,6 +105,17 @@ struct ccu_mp {
>  		}							\
>  	}
> =20
> +#define SUNXI_CCU_MP_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +					_mshift, _mwidth,		\
> +					_pshift, _pwidth,		\
> +					_muxshift, _muxwidth,		\
> +					_gate, _flags)			\
> +	SUNXI_CCU_MP_MUX_GATE_POSTDIV_FEAT(_struct, _name, _parents,	\
> +					     _reg, _mshift, _mwidth,	\
> +					     _pshift, _pwidth,		\
> +					     _muxshift, _muxwidth,	\
> +					     _gate, 1, _flags, 0)
> +
>  #define SUNXI_CCU_MP_DATA_WITH_MUX(_struct, _name, _parents, _reg,	\
>  				   _mshift, _mwidth,			\
>  				   _pshift, _pwidth,			\
>=20




