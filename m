Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08943016E0
	for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 21:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784495367; cv=pass; b=ca5eNmxFmnYWj0snFgIjxhiABuL2JOUkfy1ge4cnMietL9jnYzIPtPXfofA6SL1B6a7UvFdgO9V+3VNfV6xzh/kjFvgz+e9+kqVyprUPTAzVxaQLkbXBUbkGnMY4RBZEyXJSVAhxFdjbKzsKdepB/7jh97BtBv+7ovpx5t2bB9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784495367; c=relaxed/simple;
	bh=g/5/Kl8DcMdbeuZhnrZTX2rGAUenmbF60rnYbwvssq4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAms1DkAFgJY2kEGx4gWknfmxV6PDFkENcseUq4OkPEbsWJz/uQV+MCVq4synAQrcH8nyLP7V4qBzV3YxenjHV2XQAL4z14yDr+GPTibQrB4QL3E3UBxxGGRCxUHituFJ1aEkKKvmHHt0dUXMSaNZtJ7lGXat9hiXj2pXTYyBsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KhMtN2Ar; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KhMtN2Ar"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-81ed2a06b9eso40702697b3.3
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 14:09:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784495365; cv=none;
        d=google.com; s=arc-20260327;
        b=lGWZxgGOeGjUoiftVwm8l5rFIVFk6LQROkV7t1XFW8jNG+HWi9wqD+sp2SgYpGDkoo
         rK1kLv3DaX4yxt79EKmoxSYolSwPso+HO6WEtDe/2JoEjAc8GRK/aTHlriYi+/0WAo61
         abnvfK2/AmrMl3Hebsh8gTqToPOwwcJvcAYESqikzc0qEA+J5tw0+BAM3YJf45Lw6O0k
         yyp/u1HTO2A61XsheQv1p2pm6xHblUXPGPEEuNHgkLOiDk0Hrpl7XbCek86s7ToPJ3WW
         xHrPqVCH/5auPuukMnWuWHeoP+5LiSek+l5UkWvPKOVSMG9e4cX577kqg83X7+GBBnCj
         UmLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        fh=6tZq8ZZggvc7WZYyk43XJ7FDsTNXZorN59JbAWQFsNM=;
        b=LaUyhwIQv7yo/3n5UuYxTBQKS4byt5FGjyR0jgpbzglGg8IiwL4iJF9q9dJ+SY97IS
         d4OtOb8GB45hGQWX4K62ayqgXGbJoJPJx9SCyslM+c2QrCwRaIL7vtLHEmqX6JmVFmZ9
         joiCKMKuX2qzEYiWwSY+j83B4ukY1e+Mmhw5xm3hlTrB7SVYMKR+ZwL+1FjSmTD/06hF
         /1wjA4oKgXfQXNwjhEO9CoNtagDmDAl5uu8dBuA3Y2EjpbLVJ05rRK5PrazfZHLhm1d5
         qBS9pTzLVRwRsHi7ZsbBRMnTNu96Zb9oUBM4AdZL46f8z7Sn4ZEkQoeIJZkk0nmEaHKt
         L0bQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784495365; x=1785100165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=KhMtN2Ar23o910ZKvT36XJGqRA8XCGF+nTjVC7vlOKOxvSSVY9e+Ei6XhkWjEmCha4
         4lNczABJqSYLW22vO9a0O2U5ss3w8NBQP72DoiuFXageZFGLbVkGT5bepT+DDAMnzPAH
         mJkX79wcx+sxuwhpFq+6rK451eVvjXRMFw0jLUucZcxDuGFbS2FpIDpY10a3x3OmOM6E
         Sqs6/N51Wlcv0W68Sm6PvKtHhhe7/PDRYr4nuiHcuJig9XbgmactGV3VgkytWPDA6nYJ
         hAjkdvopRHmrTKBHRuWixW8a80DbrobXAEed64IJxhsp807WMbkjfG+7qJHz1W5hsOaT
         KOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784495365; x=1785100165;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AhtM1hpbjZSDdUK5uO0cI/aNaLK1lqiY4lPHHX9EMZU=;
        b=eFUeKTbKnm9MHEVTDFgjI68Np7xy7qht8NSJsBmJwKRw36aYZF1U5dCUInmvhYVvHh
         H8BoR2mLwFaVXb3i0PqngAOUKy4+pcnukBOt5M+oyVKXA9zEiUriL/yfsOjbZdCKxZLW
         ODXuMpJAvJLlMnX1zYR8/4sIY7GTJG9zfVq7jvjdrmEW/l4qVZMnqfC/8Z5tdAWSusMe
         TuYQrckFyjltNPuWdMde9DRvXuDfogHdFZ7u/cDHtHWmLlnTQubmL63L8U1ySUxcQUvn
         mOUReiKwz0ZUGZUetRvgzGb3huJ923oIJ9NZtDjncGfu19ctHVgS+18GUWk9/GdYIbUO
         WmTA==
X-Forwarded-Encrypted: i=1; AHgh+Ro6PS9y6OYUUrYPzu1I12ReHaLvP+yoZw0KRWhBBohwKikvnbw61zqOrv/ckC09ouBSiQvxn1kXviY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJJjVSoRe2KLSZMSCM0WLWnw5z5sG83t2W8YDih+GEmU0L0f8
	/ky5ftihtbHE1kJXFDh9sA3FZa866SUeE2zrNEYjsc8kjdimAQ156BCFfiDD29O8HDw2gE/XcNC
	alvIb9xl86WyffD5Gd9A+et2EkSwqNqM=
X-Gm-Gg: AfdE7cmDN7mtNfE+Jcp/8H4QWDIRb/FMb9sUtAdk65u4z6RXoxBl8mC0CAdP9cOce+U
	hSXiKOp4qOPXd8SC8SeYO+TbPQHe5EEtdxIvW/xzH5CfMunx9ChrVLcTNb74sACcst/K0lHpcsw
	YzW0Eb36jge9L1sOkqnDvQpvlR/u1GaHyfeiW8Ihf3t9qW0eIkJca9+G9hv5uAXdd8Qw840Dc/E
	eetTqPkVm/8+pUNdDiNaBlqHdTwvjbEcmOHFCk9vGMB06WG5M2Idzfe7sIXXRkitJ1VcC62EJgj
	Cd8bh+TO6KGPDgK3QoA=
X-Received: by 2002:a05:690c:4d83:b0:81d:d035:eb4b with SMTP id
 00721157ae682-81ef22f15ecmr41881237b3.19.1784495364767; Sun, 19 Jul 2026
 14:09:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260719153122.892013-1-juanmanuellopezcarrillo@gmail.com> <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
In-Reply-To: <CAGb2v64Mdq-+C2e6GGHEN_n_H6QEEd66zp6O2W9y--58L=5yzQ@mail.gmail.com>
From: Juan Manuel <juanmanuellopezcarrillo@gmail.com>
Date: Sun, 19 Jul 2026 23:09:12 +0200
X-Gm-Features: AUfX_mzAKn4OrNAtXWomQRAbZerhdiZ5kkyJSxJPwI1hfOOK1mJBaeXrnWi0ctw
Message-ID: <CA+c=wxXJCB3Ms=eRy4Bs6fG_uA0owLYpmaXHmxP6woeP+icsWA@mail.gmail.com>
Subject: Re: [PATCH] clk: sunxi-ng: div: implement set_rate_and_parent
To: wens@kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thanks a lot for the quick review!

> So the patch itself is OK, but I think there is also something wrong
> with the GPU mod clock. The GPU clock is not a standard divider, but
> actually a fractional one. The formula for the output is
>
>     Clock Source * ((16-M)/16)
>
> with M being 0~15.

You were right, and it was worse than I expected.  I checked the T527
user manual (v0.92, section 2.7.6.58: "FACTOR_M: mask M cycles at 16
cycles") and then measured it on the Orange Pi 4A, forcing each OPP
and reading the real GPU frequency with the Mali cycle counter.  With
the current linear model:

  OPP request    programmed    measured
  150 MHz        600M, M=3D3     ~487 MHz
  200 MHz        800M, M=3D3      648 MHz
  300 MHz        600M, M=3D1      560 MHz
  400 MHz        800M, M=3D1      749 MHz
  600 MHz        600M, M=3D0      599 MHz

so every OPP below 600 MHz silently overclocks (thermal throttling to
"400 MHz" actually raises the clock to 750 MHz).  Interestingly the
vendor BSP models this register as a linear divider too, so the
vendor kernel has the same mislabelling; it also removed the 800M
parent from its parent list citing GPU job faults.

I have a fix working: a small ccu type implementing the cycle-masking
semantics, with the A523 GPU clock switched over to it, the 800M
parent dropped from the selectable parents, and the OPP table for the
Orange Pi 4A.  Re-measured with the same cycle-counter method the five
OPPs now come out at 149/199/300/399/597 MHz from the intended
parents.  I'll send it as a follow-up series referencing this thread.

> And we're also missing a notifier to switch the GPU clock away from
> the PLL while the PLL is being changed.

Agreed =E2=80=94 the series also registers the existing sunxi-ng mux notifi=
er
on pll-gpu (cpux precedent), parking the GPU on pll-periph0-600M
during PLL rate changes.  The manual states the mux switch is
glitch-free.  Nothing retunes pll-gpu at runtime yet with the standard
OPPs, but the higher speed-bin operating points (648-792 MHz) will
need it as a live parent.

> Do you plan on implementing GPU DVFS on mainline?

Yes =E2=80=94 see above; the series is on its way.  The speed-bin OPPs (SID
efuse gated) are left for a follow-up.  Happy to test any related
series on this board in the meantime.

Juan Manuel
