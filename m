Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9D51EBA14
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757614141; cv=none; b=IBCPdnRoyNnqHx+9KoSTAgmYFWTGu+7B8TOA5wckNpsho4SVpi9wVBFDlxgJUiw6LX++5u+Y1ulXwzT//JrCLXWKaLf8JIbK0I1J9t2LqEBX9s/OpEh5dgByG90cIgfWATQzFp44nN9hBs5Dib06vJSlY2JKNPjsnbv88HNjTek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757614141; c=relaxed/simple;
	bh=nk0BW2Ba7j1ibTLdZtLwj3tMl8qp9lHnXIvnkwXlhdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rbnGAAx2Egmkj2lztALB2y59k5fHPdvniWVo5klTrnJFJ0eSTEgrpglML8leZ2+cd8PD7OkTGMQLnWSguP5O0iZpltYTD8WqLft8DntZG0idGTgCY2V30AXbtZVfDAq0qLxi022/AZPVRuczNnfPhFoGi/1p9Zu43bSZf411+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hHjPhwcH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hHjPhwcH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso7186845e9.3
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757614138; x=1758218938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=hHjPhwcHv9lADrpnFdedwMbPSDA+KS9cYTf0CLKn6V0IMNiiML/2J7RLC2w+uDYuu6
         m7oJig3xMzMq5wfNoKeObwzMKlbNsQgQ9wCNatNIo8u2K+6gf7EAdPAjjJ4RvnFPQsJX
         UfK6vYHVc9ZTaFeoQgyWV3qUPus08uJEfTYsrL9bTr2hhkNfPHLGtH74vYsnoDJqUTSi
         0MHhwFWFFEgk4bf5KU8rM+5YyN7xZWn1Cqz8SNlYvZo5NTQgX6bhtqmg3H0y2uh5MQW6
         Or2mqBQFSjUyY5KIyjkfiT1AaJfqT3FTB795l4u+IC1Je4nDaCVEPOIT8dQgv0ywvfVM
         4pqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757614138; x=1758218938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7nWRXkwzkNu0lYsznyGEbSzR8Qg1Sj9llSzTwfH6ok=;
        b=TGBZMhWFuweUpliC20l6THPdR7TtNQMF1OpxracbZdAfVRFXdg/blLuzNl4vz9lqh6
         rmTNx1DRakJUZe/RT7AJyhw2RrHX/WYNG73OTwP1dz3/+TJXBv6oUpVQKN5ErdTF44bX
         qXy3wBCCQsAMgeV4x/4UpmsrDPgIx+v6/GO02eLFZOV7iRM5I1ynF4JfqakBJHaEiJZu
         1x7eBTlISEGGtQQU0zeE+ofQ+7/o4b7+EeEy/R4Pfybg1tvUYGeApzLRWgguCT7lv0PZ
         WBkjMjmaHzXO6bOMBEdWHP3ayfR3378DRgVPel66o+hGM7g+h5YCKqcmt4HBkyI1sPhu
         lQoA==
X-Forwarded-Encrypted: i=1; AJvYcCVEkweDHSaox4Rloxg+xZawcz4ffv5uvEHyGioM0t+uxgjpCW9xC8ejg/aRhL/XjkngtGBsKAGfNKQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxbrc0gIHuJFhnv/LVGzLbiz4q4777A3XalHbQsx+rcOhicg5B7
	bIxFBrgJ7yN5aFH8z8dzxZbri1UlDuhPhNu+OsXBGJYJ9w51435/lfOu
X-Gm-Gg: ASbGnct97L556ZCWSckpsUBXRjUx/DVHaoCdbozoZArn8sPvlfGWfHqUeASYHXjWmiS
	n29j8TlSrmxgjwcwBrvPLSmvYIxvsxX7FuL9Jbng1AYTFm3lreIo8+Ug64tj4rQHjbRz+sEXtAE
	8ac3zSqLkICykoWbpvTeSruRhdwQI7zEtvDFVZTccVb7ToT6TSxzQBCvG/eCU5C6C+cfFHeN2dZ
	QXA3U7IBpv3yUQZ6AcQ/s6wRFTcvd/B0G2OPJwAI1jBh7q1VAVPL3kxo87S0gUMn6RhHeGl5wYH
	TWr+FuYAjy4NvTe6Cdw1I9In5t1io0K0DXsqrS7sjqlVdvZGKt+zF3gmu62RqiNemBKXnPQu3CJ
	KCnxzn3U86Tpu/8/KklOV9/VU+VJN/PXgYILWGUDu5+PgqLeSpz1b1HDb5Ti9eRH7nEzI3maXwD
	U4H6qY5Ss8BA==
X-Google-Smtp-Source: AGHT+IG/tgONKkALdGCBSwVsuGobkxpNF6yi/bsIuUbq0WXKY1dVZ7jjm+lB6jrMTTAtwUaxRQ2WoQ==
X-Received: by 2002:a05:600c:58c1:b0:45d:e0d8:a0bb with SMTP id 5b1f17b1804b1-45f21214d99mr2291715e9.23.1757614138011;
        Thu, 11 Sep 2025 11:08:58 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5a2esm35156765e9.13.2025.09.11.11.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 11:08:57 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/7] clk: sunxi-ng: div: support power-of-two dividers
Date: Thu, 11 Sep 2025 20:08:56 +0200
Message-ID: <5919523.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20250911174710.3149589-5-wens@kernel.org>
References:
 <20250911174710.3149589-1-wens@kernel.org>
 <20250911174710.3149589-5-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 11. september 2025 ob 19:47:07 Srednjeevropski poletni =
=C4=8Das je Chen-Yu Tsai napisal(a):
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> Some clocks (for timers) on the A523 are mux-divider-gate types
> with the divider being values of power-of-two.
>=20
> Add a macro for these types of clocks so that we can use the divider
> types instead of the M-P types without an M divider.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu_div.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/drivers/clk/sunxi-ng/ccu_div.h b/drivers/clk/sunxi-ng/ccu_di=
v.h
> index 90d49ee8e0cc..be00b3277e97 100644
> --- a/drivers/clk/sunxi-ng/ccu_div.h
> +++ b/drivers/clk/sunxi-ng/ccu_div.h
> @@ -274,6 +274,24 @@ struct ccu_div {
>  	SUNXI_CCU_M_HWS_WITH_GATE(_struct, _name, _parent, _reg,	\
>  				  _mshift, _mwidth, 0, _flags)
> =20
> +#define SUNXI_CCU_P_DATA_WITH_MUX_GATE(_struct, _name, _parents, _reg,	\
> +				       _mshift, _mwidth,		\
> +				       _muxshift, _muxwidth,		\
> +				       _gate, _flags)			\
> +	struct ccu_div _struct =3D {					\
> +		.enable	=3D _gate,					\
> +		.div	=3D _SUNXI_CCU_DIV_FLAGS(_mshift, _mwidth,	\
> +					       CLK_DIVIDER_POWER_OF_TWO), \
> +		.mux	=3D _SUNXI_CCU_MUX(_muxshift, _muxwidth),		\
> +		.common	=3D {						\
> +			.reg		=3D _reg,				\
> +			.hw.init	=3D CLK_HW_INIT_PARENTS_DATA(_name, \
> +								   _parents, \
> +								   &ccu_div_ops, \
> +								   _flags), \
> +		},							\
> +	}
> +
>  static inline struct ccu_div *hw_to_ccu_div(struct clk_hw *hw)
>  {
>  	struct ccu_common *common =3D hw_to_ccu_common(hw);
>=20




