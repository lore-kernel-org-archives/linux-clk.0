Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E4945107B
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 11:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870920; cv=none; b=bV82J8enJ/5D2kMewsa6zIpkUGXBNvuANfn2vipTeJzBqVR3eO28IUrBbQjXO17Oc0GzTmuq/dehM70D8EKPjEKgqR3C+4W3c2AiaGVjnBCEHRj3IfXSVhQoVswR+Xhpva7Q8pse3UJAxs6bR2juk0AkF9XtM8DYV97zxditzTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870920; c=relaxed/simple;
	bh=YXGLziHF6YkCoDlgtESsqmLKcAyUTntv6ubByS7hXLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rpIG4Krvc+sPEU2vxXJS5spv1oCeOqPFwteMUuoenza6ZlhA9m80NJCiEOZfUDxZNJTzEZtwNgf3FxwPEbP/rrFpq/yxtyYpuD5WjxOCQGw8Z27mAQ380uzV7DuWmRdVvgYj6xmAltMDclNRoBmg2SHSSixzDTyt6LbPbmF2/9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iWLs0bma; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iWLs0bma"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b9cb94ff5so4313523a12.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 03:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767870915; x=1768475715; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=iWLs0bma2yM5T8FHtH75OLVNlAQrMc5evfqFCg38iZfPg/ppbupqFwHAKEks8bP5oD
         A+nhUO1gT42WKbo82vZGKPOpDlIxb8ENnD6icWH27ScqSJNsTg6A9Ig9RVMCHlslP7rV
         H1mKcuj+Wl+zK5m3P1Rh1mrPDDYTdSy9bR3mOetY1WV4vnWSCRVwU2W0yJ+cOS7390rb
         ZYBDuMEN6UtSttTgGamcCc842Ok/REzbgK2/lPGYgwfo4FBZRaLMIP9LiyGHuORHVxHK
         MBSQa4/Mpl5nPQPifGbn4VwYTwxOc55/FJweaJ6tH7FwaQnpc1+H3fvXaY91RRrVjN3h
         X4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870915; x=1768475715;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LVxapQmd61w0lGQX8mp2HL79WDJS07jG7jMdrPDktlc=;
        b=DxrztKFWUnENaS7hXzqAL+t+VZJ5jRImUgFPD+Fw5yPSE/cw3KGt5+d55WxuFsPB/C
         N8PGYXwunHhksUBtfi3JRWcU8t5om/KVo/mkEu2scN7DcHXCt4ExsgQ4qwHofb4jNHYy
         bmHZOJMiQorpPoZ9p6nlmULDojh1IzJD9jGlzq4HmZ/kgkqipWMPHoxmwYe9I8donJBh
         YTi1wfUBQpmUoHbIajuTCr0iMVmn1DqCMJJzr1HKtTrfOyuCuABsfEOyJgF8y7mtyNfg
         g8vxltFAwVmpilM8S8Sa/NVQ4fAfxeAIzg51tlW67v2q9bWoK1MYhGlWqWBnWo/9vOd/
         OS3w==
X-Forwarded-Encrypted: i=1; AJvYcCWMc5uDRoRS0WMNqcWzSlLwx3XE7ZvLN6arysnPZkgMoDSPOwE2IskUzzDBtVVwudYgG1VTTGPNwfY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyczv1Lc/mLveuvS5lRiiLWVSINtkHQ0HVgiWVZNKXvDeMd44ZF
	nQQyvrvuasleITGZF/teYvYTJ/JspD7l2akHa/fs41zBKJ9blyZ0xd7jBGOiH7JklkPqsAMrmVL
	qY5ohxFza2lHWXJE5+kGLcnHY2hbhhDp1MkOyIF4TYg==
X-Gm-Gg: AY/fxX73hAIUXKgT41i1RtUOOis6szlnCH3MCPpY/PMnNXOclIHiTHIZ/eJU+WBkGnV
	/L6BXea2Efrwy1eJK4ZV/bV6d28k979b/Zbz1eHqopSIOSlhcbdcFyYFRXrwKdjxxSSDmkitqPR
	dOiIrWrhcKcJZ9ZtJ4bjDmIQRtmDdroY3508WPv3z4k5+ry8F7Iz80lREuoGtLnFjPdB99sPEmE
	EpRhuw2gCaEmRHXTmt4VLsd04mofRXaY1AWf9sUZT2HiVd4XTXUS0zelnxQl8rGyZE/zev58K9C
	BXjpUFRYt00PqRON60KevpfbV7x/jQbvQCSj6WtK
X-Google-Smtp-Source: AGHT+IFHAB9Bnp3BB8dMREjQr967gPMG/GGiiGg+amrvJbHn1bFL3BwFrjMhvQJAqE/QddIsZ2qSyWC9FuhApQ/ThSM=
X-Received: by 2002:a05:6402:5201:b0:641:966d:82ba with SMTP id
 4fb4d7f45d1cf-65097dcc536mr4334588a12.1.1767870914919; Thu, 08 Jan 2026
 03:15:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251222-automatic-clocks-v7-0-fec86fa89874@linaro.org>
 <CGME20251222103019eucas1p2c60f033dc02adfef360b4fc69bd4021b@eucas1p2.samsung.com>
 <20251222-automatic-clocks-v7-3-fec86fa89874@linaro.org> <8b2c412d-3e1e-4be0-a9d5-ef67f6f0d409@samsung.com>
 <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
In-Reply-To: <0c09a8c461db5a09e75de4587eef38bffbccf2d2.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 8 Jan 2026 11:15:02 +0000
X-Gm-Features: AQt7F2p5pHWMrlun-9cdijxvvGGa-DUdgXn5dVr-tLvbHmhtbwNPLLjbUDUSQBE
Message-ID: <CADrjBPr6QBbmF9tQP0czRm30d688VtT1g1=tw=bwfYYzKPrPPg@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] clk: samsung: Implement automatic clock gating
 mode for CMUs
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Will McVicker <willmcvicker@google.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9 & Marek,

On Thu, 8 Jan 2026 at 10:55, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Marek,
>
> On Thu, 2026-01-08 at 00:59 +0100, Marek Szyprowski wrote:
> > > @@ -334,10 +456,20 @@ void samsung_clk_extended_sleep_init(void __iom=
em *reg_base,
> > >     * samsung_cmu_register_clocks() - Register all clocks provided in=
 CMU object
> > >     * @ctx: Clock provider object
> > >     * @cmu: CMU object with clocks to register
> > > + * @np:  CMU device tree node
> > >     */
> > >    void __init samsung_cmu_register_clocks(struct samsung_clk_provide=
r *ctx,
> > > -                                   const struct samsung_cmu_info *cm=
u)
> > > +                                   const struct samsung_cmu_info *cm=
u,
> > > +                                   struct device_node *np)
> > >    {
> > > +   if (samsung_is_auto_capable(np) && cmu->auto_clock_gate)
> > > +           ctx->auto_clock_gate =3D cmu->auto_clock_gate;
> >
> > Do we need to issue "incorrect res size for automatic clocks" warning
> > for every legacy Exynos based board? The check above should be in
> > reverse order:
> >
> > if (cmu->auto_clock_gates && amsung_is_auto_capable(np))
> >       ctx->auto_clock_gate =3D cmu->auto_clock_gate;
>
> Good suggestion. I have one or two cleanups anyway, I'll add that as well=
.
>
> Thanks for spotting this!

Ok great thanks Andr=C3=A9 and Marek!

Peter
