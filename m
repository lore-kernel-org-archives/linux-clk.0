Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D7433E96
	for <linux-clk@vger.kernel.org>; Thu,  2 Jul 2026 15:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783005208; cv=pass; b=uTBg0KKwjc8ap3mwwvCaBnHp0+m664E+nfc/KAaWhtDRjYUBrpTt0sI91jC0T5THyIYPteXzsFT2FoWBOULMdGZQfkZMcpyMgcnmGGkPQLELd+SaoPhPAGp6WlgkGbjTNlgb272hFoTS2zxYx3xhM9CZbG9YYNQSB/n1Iat06bs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783005208; c=relaxed/simple;
	bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHeIFUCJWJNZt65ZyG7NhweIWEbg7iI8MOwvqsJ95o8QW6iQ/CMRLhXZOoQtC4KItX/z7oEv2yFuTFjvbOY1f78me3jmYQqygSouVFYClogxz0MF52q/EjunKAtaHHUyCMwEFb33nIZSz0LxiAdvh+JDunlsKNx+XZpdOkH9xfw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxwtnWgX; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxwtnWgX"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-45fd464d51fso977967f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 02 Jul 2026 08:13:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783005205; cv=none;
        d=google.com; s=arc-20260327;
        b=fRwGm3r5E0A0OJ0AjVt4EHGt7QvLpf+zEiVOaUDfKql3d6NLbsXy6ipuV6oGep6UuO
         PeYK6G/zinQrTw6HfUFPSISfrsBW6YYXvfXkKKPoItOztcQABLtMUbYYd4vEpApzDWiU
         5cY7ajMxVkERQ92lxp8aOL8jxIMpMmKx2FDKeuZEWBKM+eH0gi9vf5y3dqebJDEvY0yD
         IYrsqIPCQryCkrsZk3Y5+V4LMI5BibBDiEsH44pcQcN96vCRvVzLWCD1pJe0Spo+z/ha
         vySYS7Ld60W6ZRxgWd4oX0NdbE93omjA8mKdArNqDJQL4U06zYLLjZG+quntKYfdvITO
         jAzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        fh=vnMVIlzikktEnrOONHiwpe9nWlwwXgdKjROSANr2x+Q=;
        b=Vwo7/Ien3dKpbjsIefn00RwhOcChzbFnjnnIM9kkoSn0WvKEgOZmH4jvgnkQlcYNDD
         FteO+zH1aqJ0piT1oDOqBjeXTKb3LZKP/dDsYMGzsymTo0QHU9R2W9bwhRefbhdL0FnC
         Z1xn0S+X56WVOnMw1Pr0NFLU+3+HkuXyotZjLgYvZvjkxZofZS1ep6kfK1jioIxz+GDc
         9QUEeDJnzMDVqzqiUoya+5btikLBUTqS2C2SKhpaGEL9XmeEa/wm/n4VTu1oca4nXWzs
         zj21VuMro3aAKhHPU1UI5Rk1FK5eO3y5sg0KtSNTDFZr/hslPzemSoRxARKrK3oVcBGk
         OZRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783005205; x=1783610005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=mxwtnWgXSUJ2VTpxDgjhS7KhZUtoDgNgcYhnNevbp0k93vTeIRBovOxpbe5r1n55F7
         xgz4dC9vIg2GhR9kdP6BneN7wjbA6SE2DHVfqYBYMEeXqnwoAMZuxFFPm1LDoLmwYqHC
         XuYg+ywghF8myR54ikxzuuvjyJ+czHEqRHrlN15XDfqhqO5HTVvgxeCxfP3kpovvTQ7n
         hD1AwUBGhVSWrmu/JRUY7J7cRSgiCgJ2BTtLrCIgU3qiqiZyEu7YlJ1NxiGtsjaiSG2L
         pnKQFxVKoDksdl6k5lB5rvynD9icKEJgOqrzNslpia7bb7ryDROwsLjQmP2K/pijmFYi
         rrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783005205; x=1783610005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/4egXjCN8R7F9xxzpwAYPp/3i0iFE+B6QSqkJayqSxw=;
        b=JbIljdRfgenw+xyG4hwLfihPvxvIrKgUo6MZLg6Tcjgly0o1HOjd8qaF+vgFFpfeLC
         CBTOTAVzidI/LyxlkBuPjf02q1rzviKIQEZlGWbott+1qUZO2l1fmZIunD4Knh7nRnlO
         EPFN5tGFpBsoXJ25fAVmKgDjL86id330lc+heM5tErQ3S8/pKY7KXuXAZhD8+imWtzF6
         cUnj40gx0VA3S3jGGRMmtYs5BIaW5Gx2Psqn2Qn0U7oF+Co22SsyBOZsvf4Erxa04s/e
         Dp7OzeeirC1I8li6O6HaY4F7TqKrOyAVdgS/uOWstA6gTWSlkmwbLfAGwx36v2Tpgp1D
         opoA==
X-Forwarded-Encrypted: i=1; AHgh+RrmXsj1A42Sy7e9VJFHl8h1ZoRsSNnxXVN3zIM3Yl9n1szrgTCCMf7K69OUWMf4HhUveiM8c+m9C+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJIngehDjFA8d0B6MsPAvJnxHsTVlbdzWs3f3wDUlWXBIhsN0+
	ukbRj0e81geZE4NJJBRocKqx/zTRmhpGTvXxDwBWhawf3vDF2EradI4E+MJ2BCPOr6KI58l768N
	Gyk+8/ejMVpf5g928IVAryyN2EDalo8c=
X-Gm-Gg: AfdE7ckTqX8KAqXEVijTqadJX+dsUG4RHGlH2NbsyIDQeh6SmAfvUHKKUIfBT84k+YO
	LZGRw1f/ZjFPG/jy/dflGVAUg90I0zPNoTma2g4J7bOzPchz3mxSsmnYwV6OIHvdd3S58EMiCFH
	TZJPq2EaYdAEpVXLLgByKQLR+5D9rAZz6ykqBf/f2ZJrMZi48fCgnc8QLFVKPfgX2exINctANET
	HHAwxaGl5RrajXo67cf19icO2wcajqnACE3FghD1h/lNOjSPIqjehvu7TPOd/arevwsn8wjj1d+
	gH9xhsjUALggLehgA2kZ+AYC2eGSwKSeLeqZghvr3Iq7XLi2DMKdiNINgQ==
X-Received: by 2002:a05:6000:310a:b0:474:b860:b7b1 with SMTP id
 ffacd0b85a97d-477573bbc08mr9500811f8f.9.1783005204503; Thu, 02 Jul 2026
 08:13:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-8-prabhakar.mahadev-lad.rj@bp.renesas.com> <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
In-Reply-To: <c3ef312a-4c26-498c-90c8-118c6dc035a0@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 2 Jul 2026 16:12:58 +0100
X-Gm-Features: AVVi8Cc-s3hEJSawL1gEVp8kBOMXlVewT2dK4bhHbDClofCdIh5uSGgHTJrBYuY
Message-ID: <CA+V-a8tcFzoGBZ0NBE=612Py+E6gJ4MRqyT2QjxSN1s6Dv5CvQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 7/9] watchdog: rzv2h: Add syscon support for RZ/T2H
 and RZ/N2H WDT control register
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

Thank you for the review.

On Thu, Jul 2, 2026 at 2:27=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 7/2/26 05:31, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/T2H and RZ/N2H SoCs the WDTDCR register resides in the second
> > region of the System Controller (SYS) block at 0x81290000, which is
> > shared with other peripherals. A dedicated SYS driver now manages this
> > region and exposes it via a syscon regmap interface, making direct
> > mapping of the WDTDCR register by the WDT driver no longer viable.
> >
> > Update the WDT driver to support both access methods to maintain
> > backward compatibility with old device trees that use direct mapping:
> >
>
> WHy don't you convert the driver to use regmap first and then just
> update the regmap pointer for syscon support ? If that is not possible
> for some reason, I would expect to see a detailed explanation.
>
Good point. I will send patch 6/9 and the regmap conversion patch
separately, and I will send the syscon patch when the syscon changes
are accepted.

Cheers,
Prabhakar
