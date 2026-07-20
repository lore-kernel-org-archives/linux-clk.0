Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C7139891E
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 03:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784518688; cv=pass; b=N/E9nhhZ7bEDdbf+V5tNyNhzQsSyVUuWCFn/zdvNQYWlr6iaokKPxzeh2A04MeEQEDX6f237PwTqLYqP/3vUVfvnJV/4MzP154m4KtkXt+BOIXo3mWYaWOjzUQM8UOt/hZ2ADs0uGV0CZQ/fPE9c5abD7MY095ZFBA73bZLgdXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784518688; c=relaxed/simple;
	bh=qCd28C+Z+A68oGUEGTH+Dcfqxfa2Vb4/jObddLtXbK4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kj82AnLiVUQHWcgegRgGZFGF80dmcRHwQBKrZTu/LNDZt5P61CBZkt+ORoNOKVfIRb0t0j1n+qm1sAU8RsZLJfj9Jcc6BL+fOFAzUhaX2ba8Vja5bIUSvimCy9NCIrHrxVrTmCX2y7RPLhUgxkJ/MUvSr7hymXlL4NVkRonuebU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ak31xqNj; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ak31xqNj"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-80814edb536so65532927b3.2
        for <linux-clk@vger.kernel.org>; Sun, 19 Jul 2026 20:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784518679; cv=none;
        d=google.com; s=arc-20260327;
        b=p7OQHSSTKHJTowQu/F4zUsvRMGARkH5tIv3J7slAjXTXhhtERpH/arIvz5XbfkwnGB
         F9x+sJDWSOe60sp98v6BPtlCirrzQV0Qs9ZFoT+RnOs9pvpW1tXLKgvrJPiMjw/7bxZ8
         yrVBv7Q+uxT4hCuAvTmoDGGapuR8oxJizZuksraVe78EebgOLeanUGYXyrsyDHoY/OtV
         Gb6SQWYyDA1OiYrTUDsmx/4qwHUPBEXcKkY7+v5Q6dZuTH5LBt9ePfBpNQpipwUvYpHd
         3tn3/yybPEii4r4G+JCXaPVnwytJWi6Ftuvf1yGOPx9OvDGpbg8TxAbuOWreIsCUv/xW
         OA/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gcGOpK/QyEV59CQGMPc/QZuQ+mjffcJX++XIYOUvh1k=;
        fh=CimyKYB/zpQlV/mVmGVJTUjIsiSBYizXl/jHu8JiKys=;
        b=KRKY/dXQvIMAJUqM7Ujjft5TCvCehT38CzrMw/m/Bx4zpRHzz/zwwM86+AJMMgsERd
         rqyJmiZTQjDyYDxtUy5uuWhQufbuhqnu1CxaAT85q+iMefAW/XRhSf42wIWupYCQsO0A
         11B0HaZGawcYwpc/WeC2SGpS0l/82QvDAnH/ELOJgZo3UJK+Hooh7pBb5tEs74ZnheJx
         TSyiUosCO3fDnWqkReKdhGjai/bhlxgzYqnRTXFI5LpeCY7Ugugnn0IeBMfmG7ZVKZUE
         SX+jqCsknwUdjd67gQVMsAY+W1cjUnalxy+Imwly2WHfMjMCCfSmyfEGOzZCVWmhkogN
         1kxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784518679; x=1785123479; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gcGOpK/QyEV59CQGMPc/QZuQ+mjffcJX++XIYOUvh1k=;
        b=Ak31xqNjG1ZMi+cImeq0G1AE9v9awZuStgYgBAepBQscald/vTD/vdCML6KmJ1ORTb
         5m2rPcHpDo5Wud4P4O+o38Qz5SboquiBV/i2PbPZNpi+lj941P+m+y2kSr+UIzageyGn
         imJnhIshxcAhEqnCQNnFnkY7GhGWf0OIDyxUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784518679; x=1785123479;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gcGOpK/QyEV59CQGMPc/QZuQ+mjffcJX++XIYOUvh1k=;
        b=gPQfb6dA5W//1Yy/mQ41McEuaHl4VTROBrFD5Jz6wIhy9dCFb0M3PfSfmelF2KL1eA
         qYUe8T8QyR8kZtINRJDQgNZvgn58TPisBGkV2oLB0ILpRpKGlBYIloIFb2qGw93TG3LA
         Mtm6kFONO1DGK08ZrsY59vpnMJ8Fo8eYGGTg0epc9Ep/g5vWOQ0wn8fHQcMhKxocQwwS
         7qZ0qcX2NdwGTarQ7Pie4nO2FCPSBvMfLlCqpmxuZOBxuJLMuG8qkvY/sHY6uVrXptf/
         BHdG3C9gWd76rx+I8Q3MECTvNYfDmtfB6iZGLP36tl5GLIUSR/CKmBaGr6WOhJwBg6gY
         DnxA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/TyEeuVZqO5ta2GRU9jqAyV7l+r1mwl7400cCtl/sz9uXmP70TaOYvWzR9fEWGXg/nThlQA8Mc3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXdgqT+77uu3w1WPeanBoSfWaPmqZhTk3P45I8m+ojBcL02Jy5
	X/rRUBAV7dUEuIJ3mcp4K4fG9Li0s2lv6X+gmKxHgXJYFxXsKvOFHyZVIzsB0WNN5xGSHz7nqTM
	V3ZLm2vj+DzEEBueg05iu/H9dZz9Ur5/fzUAyuCxFr9pQf7tVPH0=
X-Gm-Gg: AR+sD11tmEtnwbO0PaehAx66kJ24KLbgfyB9r9YsZEDytyMcRfmO1ImGbXxRuR5YDr7
	4qNP81/fNy/2AETl6KyoCV0SorpDpA0bfwyBR+DnyL4xLnirzkB9cohWWgn13NXyZBCXDxXv301
	TLmkSj7Rrj4Q1iuo4e6lZcBjjaLN7X3NfQ17hpNLYN0WwE/ktofEKdCnyCsKO8L59dxEcnSbl+Q
	ppg8bW3JHjZfKUWwUFAsZJiWMED04wRhVMfUgrj4C1JMV1gwvhw46u3F4G1/MUa4Gh+1W7tRPQV
	XAubs6/3g8hkDNZG
X-Received: by 2002:a05:690c:6b04:b0:81e:6915:b43e with SMTP id
 00721157ae682-81ef25e0e4fmr43118677b3.39.1784518679557; Sun, 19 Jul 2026
 20:37:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros> <alpC8l8qPFL955ZB@redhat.com> <aluuES750vojgH3q@monoceros>
In-Reply-To: <aluuES750vojgH3q@monoceros>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 20 Jul 2026 11:37:48 +0800
X-Gm-Features: AUfX_mwMcjeFCEEe8ipU62o45SVxUY3g49ujwju2QkgFvb-kR8e8XVkoEFWEM8g
Message-ID: <CAGXv+5F-bhfoUaUZocrxqTCL2dt6+m=YYvwQbgTNt-rNtL4C8w@mail.gmail.com>
Subject: Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers
 for platform_device_id arrays]
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 19, 2026 at 1:17=E2=80=AFAM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> Hello Brian, Michael and Stephen,
>
> [I trimmed recipients as the new topic isn't related only to my patch
> under discussion in this thread.]
>
> On Fri, Jul 17, 2026 at 10:57:54AM -0400, Brian Masney wrote:
> > On Fri, Jul 17, 2026 at 11:51:17AM +0200, Uwe Kleine-K=C3=B6nig (The Ca=
pable Hub) wrote:
> > > Do you still have it on your radar?
> >
> > I sent Stephen a pull on June 29th for stuff that I felt was missed dur=
ing
> > the last merge window and I included 4 of your patches in that pull:
> >
> > https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u
> >
> > I haven't heard from Stephen yet. There's 2-3 other pulls waiting as
> > well.
>
> I only occasionally have clk patches, but my impression is that getting
> feedback takes quite long and without Brian's efforts also things would
> get lost. (Thanks Brian for picking up my stuff!)
>
> Looking at the current maintainers:
>
>         $ git log --format=3Dfuller --since 2026-01-01 next-20260717 driv=
ers/clk | grep -E 'Boyd|Turquette' | sort | uniq -c
>               8     Acked-by: Stephen Boyd <sboyd@kernel.org>
>              28 Author:     Stephen Boyd <sboyd@kernel.org>
>               3     Cc: Michael Turquette <mturquette@baylibre.com>
>               3     Cc: Stephen Boyd <sboyd@kernel.org>
>              81 Commit:     Stephen Boyd <sboyd@kernel.org>
>               1     Pull clk fix from Stephen Boyd:
>               3     Pull clk updates from Stephen Boyd:
>              54     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>         linux$ git log --format=3Doneline --since 2026-01-01 next-2026071=
7 drivers/clk | wc -l
>         453
>
> (Maybe that is because Stephen cares for the core mostly and arch
> maintainers merge stuff about their clks themselves?)

Mostly yes. However some platform maintainers don't pick up patches,
which leads to missed patches.

And I think this really depends on the platform. If that platform has
its own clk library, then I think the platform maintainer needs to do
most of the reviewing anyway.

> The last commit where Michael Turquette was actively involved is from
> 2021 (a331659e32718b31f3a304d7797a77d31610468c) which is also the last
> mail from him on the clk list (see
> https://lore.kernel.org/linux-clk/?q=3Df%3ATurquette).
>
> I only observe from the side line, but with the relevance of the clk
> subsystem I feel maintenance is underpowered today.
>
> Is it time for Michael to step down? Would Brian be ready to become a
> full maintainer? Is there a need for more reviewers? Any volunteers to
> step up?

They already discussed this last year at Plumbers. I believe Brian will
ramp up by reviewing.


ChenYu
