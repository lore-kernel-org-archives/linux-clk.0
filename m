Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA62192D97
	for <linux-clk@vger.kernel.org>; Wed,  7 Jan 2026 07:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767770542; cv=none; b=KiKANG6bULS/xyjow/LXhP7L9TzURNZFrNEEqMlGFDNj5w5lKERytf6uUYUhrTQXCEJgg0k943YGwxvrvzqXeExUGEB5TwOVQmVH0yASre1W5gNHDq1fv5jb1YEiJQ1kd3cl63ATovBTa1PggcwxYkN3Q9mdLELOLCYsui2hdl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767770542; c=relaxed/simple;
	bh=8vdsbeII54VQ3U8MLcLDXKFxW9u4RQYw5yb2Attxl2I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PyBRZL3F1Tccqo0yRfVIOYypGu6/iD4855Fk/Ts+Jxuaa1lK+5yVw7ziLJ/6au+OaBDPOx4eZvSHfI5+n3N3kCrIyLpSlkc7/Kem+XvdnqmsPEDt20/PtFg9lpqeLUb5xwAf4rdKQhzlLm9sXe0jM0ejo//6nnmDw5PAzPl5JUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YXBWI/Hn; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YXBWI/Hn"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81345800791so1169909b3a.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Jan 2026 23:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767770540; x=1768375340; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j0fvD/6IVkbuhi2W+VfhGVpu8UbGrrkC5tRDibWmgTw=;
        b=YXBWI/HnmsdQJeyWFMf1EWySMAj3uyyZYdh3WQoOTWB7wkz+XewNT77VWXQGdXtiA3
         kR01de4uJ2GrO7pAfC1CQQxT4FqaAFBwpOEWnqzkqkYrABNu+SCyxZnQydGXMKZOvHVX
         5SDDXVIqDfiXJQH/I9ElLl1ylYNrgOerXKQgaLDgR1lWRRuGxAIeyngw0weOl04zDHZE
         /mL8dummBxZt1hKr/r3ln0zBE1mVJ9zHEw2jE+9mYi0IhEK8qQOl/dxQORo6jMK6ueHw
         ZaouEx9zI/dwvu5ZwBihS+UFM3UkV7cAByaXQO8+kXJSY6x3KdizDqIXtIk/WDsrGPjN
         1X7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767770540; x=1768375340;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j0fvD/6IVkbuhi2W+VfhGVpu8UbGrrkC5tRDibWmgTw=;
        b=MqsDxyOvpBAkKU1mFjyrj1TZbHyZ+SEddq+8vRjfMvZicJte6AV0eirNuP+fcniNQl
         d8f2nX4qTMNMjaNsTvANpHkmpU2z6P0uCsG33PogBVf+CCiinVd3g9Ivl9fpcH3haOAW
         jYIw2ufDKQkZQcx0xvUT2c3Jx8G8z9+zWyQ0/FUSeaUh98itzVmAv6VyjebOLk+eerHc
         rO3TgqoypY99x2N8bg4XLxDhIF2RGeQrj2/b96mHURFEmD7ff/7IAHW8ivDtKMlhecMl
         lmVoRjhUxImVpzAH1Xyh+U1kOhMOgR4BrRWvyEN4zM3YASHv0zbXOv7/KwirndVGjs5h
         rTow==
X-Forwarded-Encrypted: i=1; AJvYcCVgBlZ9tr3AK93vJoSzIlN+7IyFHeNZy+D03i2jybZ+Q1U9SCdXj+9NfqkyARZv/fjBVjz2q3IqD6g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ecVyZbt9X+d8JT1IfgcZEAMv561hdBRPoTcPAM1st2MnYrQ1
	4CSbQ9+QOWXaYCm9CkD7ACJT0qSJR6uZvCW5TzCbZphFsnVk20wiiE4TEuAlHGnb94A=
X-Gm-Gg: AY/fxX464/6j1ACCKdiFKzMbbM5t8vm8u0TOBPJWDn/5n1yoXXywKpxOs8xM75DBtOd
	GXrS2bAN/DhX7FpZQWCVKrBZdNEhEj4SZoTLOUHDaJWnaFoGG7K14upzDfEmcwBUC9mPvaceBdM
	f0QN9e7NDBHmPiGdqXuCvr9YjBO46HnLLFwbODLdECHWUtUH8HdRySGeRTdSmPF6QkJAcBVVTZi
	Nwv2YOqTPYBjgPMmnjSj7GDDvotgzrd1seUKj6ymF1SzONC635WHLIlJEuQd0izv+cBLxYYwOPH
	o7lo9idZRC9ZRlExOd5VfxAAotpItqs+yiYKeVKJmZxqDx1GFluA+iIqer40e3lNSfFPNN4C4YY
	IKyG2rquLNRmahYuqE633UmbW5S3t0JlPU4WmUofcLn1EBSil8VrxE8AF/OMYhxsjgrraxB6lrc
	ihkJFSga7RQ0ne0AdkKw==
X-Google-Smtp-Source: AGHT+IFjntT6k4Ggqzs01daHSIuv7X/dX6d2z4MC/qp/LQTz6WPJPvTolP0ZHgvqrsUi80U9YGSOCw==
X-Received: by 2002:a05:6a00:ace:b0:81b:ad93:a874 with SMTP id d2e1a72fcca58-81bad93a9d0mr1219225b3a.16.1767770539968;
        Tue, 06 Jan 2026 23:22:19 -0800 (PST)
Received: from draszik.lan ([212.129.72.149])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c52f8e10sm4038040b3a.44.2026.01.06.23.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 23:22:19 -0800 (PST)
Message-ID: <39019203631fdd183fb5ddaa7fada5da5f2a31ad.camel@linaro.org>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus	
 <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko
 <semen.protsenko@linaro.org>, Sylwester Nawrocki	 <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski	
 <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 kernel-team@android.com,  Rob Herring <robh@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>
Date: Wed, 07 Jan 2026 07:22:44 +0000
In-Reply-To: <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
	 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Mon, 2025-12-22 at 10:22 +0000, Peter Griffin wrote:
> Update exynos_arm64_init_clocks() so that it enables the automatic clock
> mode bits in the CMU option register if the auto_clock_gate flag and
> option_offset fields are set for the CMU. To ensure compatibility with
> older DTs (that specified an incorrect CMU reg size), detect this and
> fallback to manual clock gate mode as the auto clock mode feature depends
> on registers in this area.
>=20
> The CMU option register bits are global and effect every clock component =
in
> the CMU, as such clearing the GATE_ENABLE_HWACG bit and setting GATE_MANU=
AL
> bit on every gate register is only required if auto_clock_gate is false.
>=20
> Additionally if auto_clock_gate is enabled the dynamic root clock gating
> and memclk registers will be configured in the corresponding CMUs sysreg
> bank. These registers are exposed via syscon, so the register
> samsung_clk_save/restore paths are updated to also take a regmap.

The implementation described in this paragraph this causes pm-runtime to
stop working for the CMU if auto clock gating is enabled.

See below.

> [...]
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index c149ca6c221725195faeb76b0d73374c3b48261b..06ea5deef4ee2ffb87dcd1410=
2561886ea80b7bc 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> [...]
> @@ -357,6 +489,37 @@ void __init samsung_cmu_register_clocks(struct samsu=
ng_clk_provider *ctx,
> =C2=A0		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
> =C2=A0}
> =C2=A0
> +/* Each bit enable/disables DRCG of a bus component */
> +#define DRCG_EN_MSK	GENMASK(31, 0)
> +#define MEMCLK_EN	BIT(0)
> +
> +/* Enable Dynamic Root Clock Gating (DRCG) of bus components */
> +void samsung_en_dyn_root_clk_gating(struct device_node *np,
> +				=C2=A0=C2=A0=C2=A0 struct samsung_clk_provider *ctx,
> +				=C2=A0=C2=A0=C2=A0 const struct samsung_cmu_info *cmu)
> +{
> +	if (!ctx->auto_clock_gate)
> +		return;
> +
> +	ctx->sysreg =3D syscon_regmap_lookup_by_phandle(np, "samsung,sysreg");

With this, the CMU driver (e.g. cmu_hsi0) now gets a reference to the respe=
ctive
sysreg (sysreg_hsi0), which in turn creates a regmap with a clock handle
(CLK_GOUT_HSI0_SYSREG_HSI0_PCLK), and the clock is 'prepared'. Hence the CM=
U
providing this clock (cmu_hsi0) is not idle anymore, and runtime PM for thi=
s
CMU can't kick in anymore

I see two straight forward options to fix this:

1) The easiest fix is to just drop the clock from the sysreg DT node. The s=
ysreg
clock shouldn't matter now, as the whole CMU is in auto mode now anyway.

2) change above code to use device_node_to_regmap() which ignores resources=
 (the
sysreg clock in the example case), and manage the clock manually during sav=
e and
restore in samsung_clk_save() and samsung_clk_restore()

Any better ideas?


Cheers,
Andre'
