Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0013B285CA2
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 19:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777318835; cv=pass; b=Q32GIHSE66t+FdEB1+JUxPL/P1VZyE2/LxjD1X8iFy+pMoNY+4pMTzvzfTJBCTJIlruBIovZYrGyEaVlxLZydVH0aqEivlJMPpCPggoBYZvHHoLyL9xnxt1k3iaQVDV7pNbJqivBwylCaQ0JwQ3kQ167zZaq0MhbfiKpykwv0Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777318835; c=relaxed/simple;
	bh=ygGcJnN9WVRJNS+yiYYNkS29kIFHkLuMZQJgWl1yhr8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NEeoC7Zxuf5OToCXBB1LYkFi1wNPIY090PSdpndXFgfV6lJRXktNDS2RIvnOcQgwHUnB8/OIRp/Tn0mzgmzNcM+21M19uQH0Tf2ruGMnaRCBUx3QvB7ci1sHJliai+G3R/SDGHF9ZFst8qOrhjELik2dwfMTYTmni6cVirSiikI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O+1dsbRQ; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+1dsbRQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso113162505e9.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 12:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777318832; cv=none;
        d=google.com; s=arc-20240605;
        b=BX2x5BvroGeBzDERggDvPZgKkDGmcF+xNI6aVjaP5HO49HkAR9pPaAzWbV8BFtMUaC
         ZJ6fPYpsysrWZmWWjsmlXhQ1KB2x0B2Huv4r27qUSz4paGEkyg2dmuaL/g0lvZ/idXeC
         QTMJfZJ/G1B4rm05V6pOlIW5EyiKCGul4aPlkeHxn6KST5Vsp9QKYvyEs2H7Qq8IM+gR
         TD/RMjsTxD51rHTRRsuq8LYfyTrNoTO9V4Ud9KDMbolbFeKF3Kf0UEo7myAOD4E4Y3Vj
         kkeetEQ79QeupOfPUhwLe/+l2eqgO31aHWps144vPITZeVd0SQeHjZdiL/P84n1mb33v
         rGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        fh=Da3JmOWXfyAMS0iZ7xr9VwXhtEIjaF04oDT7NdPQT84=;
        b=dgjPCm5K0wLIqDcNU1FnGyS6u9eOO44E0V/+x2ts0bBPK6efstRqoCjqYBZHG16aOA
         ByhI0IESlYDLTgWu2VpXW/OvKxJKx6zh8j4wXoPJ6dcc3B5192HBv6D+RdKSyN7QVcuV
         qvoehiQpnvLShKDfUMn5gOFbdK3BI+dsY76gBNC3kBjw6Ytb8QUkBBUN2olM/B/LKQ24
         fjarRN8M+x+xWJHFm3FggzguBgLnUp0i02O3qHqa4guWXrhjwtVNjlmmBG4vWeZRHIty
         AOsIK75oFjnFZDbjuNHksKYYsnUwXvQCyYKgJU+JNLSDy/JdwEJ1Eps6Gq6ZVYfGlxbE
         4l/g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777318832; x=1777923632; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        b=O+1dsbRQ12YD/zSe2y8yCzpGSAy4dyualdVBI5qwskrHUxhbLAECiY5l9KUIuZLetG
         S1uLxGj7XPquNSH2Pqfv46wzUr7di3Db2z/AggTX5IUst37hHTJovqyldZRet/Lx9gbl
         asuZFbas8lf+n0jWGexZeQ9YbObJz4isqJPjesWdlYBeV1DQLpYkhPvmocqptifLRcft
         Ga1npEo5I8//ZY/3oaj2wnsM4UCPVDXS1d9jgLRP8UecL7hPbIIvjsDTh+JoCqTmFNU2
         ig64yupI0TmgIZi19ZeAxwI60hoJXAeuil42Z5jYud5xFsDvpvmOcEk1UX6fd8ozmg6g
         BEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777318832; x=1777923632;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EgCEMaKeQwn6Nx1ZFnoUZ74Xp+Kv4ne+E3wSIOgk/8w=;
        b=eN9YklEH2GKo6Yn9CZFXaIMwqcALQ9b8jbpp7BWcwxgVgHEAqFtezlCmb4RxPrvo0M
         GChoqYGuBdFifZ37ciXiVayDhQyZzb+QE/n4JbyvGzRKYNfgmQa0lIdTD+SKqTIpqGi0
         BfniS+efgFZEUGtmQ1furU8Wtnc1kWYrDyXD+A4lG5nTUzDzcjHpzU0moGGivabHUJJM
         5wHglKFhiQfWwbJW90Zr8zVU/h5R0FhkVYlTOJyAZ42oDZgIMdCIV4dVR4HQVSvShtwL
         XwwqZGNZ9edX66Rl1Q7qZu3cuzOauMsqYI6emg64jOfm27rCcGhG2/DJ2obDVaMk2Mm8
         Sf7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+QsJvzTo/Uxgfx7MBi2MAVyc0Oywtz9oWV37CiimHUtvTamulM5mVIq0oM8bKic1/vsP2FEsxtNTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkoq4vh0hmjpDeyV8yBld+WzvUIn5RHZZcU08ycDRxN7EaGR+
	7SMA12BcIrUITFle32bUcm7NkEx5o67fvCvKCwhwS0bRsRaEggcX2R3dW5S4I6Za40JSHZNdxa4
	1HM4F14mHfohKdGeINu7ixqlgNzhtmzc=
X-Gm-Gg: AeBDievxhxtEVV38Mqsrc3eNAdqoTJh8InJxYDfCYGfbh2k8oNRmHhRmK4/CPwYOZVD
	6+65NBmTOsvQb1axGHNaaJ1avSLXARe66u+EGSjFziucwOsxnR24PpPN/hHSRlToOHJz16KlVaV
	gO3D24Z9usZBrbB1tKgPN9riLXC4wwfhRl6Nmasr9s+OTjqL37ZAuxG8oAflFjFPWs2VhMx6J1x
	pgE/DqEt/RRaPhycdm271wfhTDY5qgipvorrc/jCSd/8be+iUxSCiczSqtMlAt92/qzktUdmYVp
	oX5IP/ysnMHp5ozfmhw9tf6WLlpAMKqHptAynE4JOcJ6w9Khp7ZRkAEht/508oWebh1EDKp+Gcb
	Ydh8=
X-Received: by 2002:a05:600c:a103:b0:48a:761:57fe with SMTP id
 5b1f17b1804b1-48a779b1e37mr1303525e9.0.1777318832222; Mon, 27 Apr 2026
 12:40:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427112824.231150-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260427112824.231150-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <ae9_afsqmGDcczhW@redhat.com>
In-Reply-To: <ae9_afsqmGDcczhW@redhat.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 27 Apr 2026 20:40:05 +0100
X-Gm-Features: AVHnY4JzJ2U4LeHB9K-Y3U0QY9v7Tbii2KPRfbKBGk3czlEv-B3AFYoxs0riKi0
Message-ID: <CA+V-a8teW5RghDJYAth0ZPndavt4HbsPA5Z-fzngsdvqbTBHhQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] clk: divider: Add KUnit tests for
 clk_divider_bestdiv() ULONG_MAX handling
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Brian,

Thank you for the review.

On Mon, Apr 27, 2026 at 4:23=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> Hi Lad,
>
> On Mon, Apr 27, 2026 at 12:28:23PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add KUnit tests to verify the behaviour of clk_divider_bestdiv() when
> > clk_round_rate() is called with ULONG_MAX, which is the canonical way
> > to probe the maximum rate a clock can produce.
> >
> > Two test cases are introduced:
> >
> > - clk_divider_bestdiv_ulong_max_returns_max_rate: registers a 1 GHz
> >   fixed-rate parent driving a table-based divider whose smallest entry
> >   is div=3D2 (entries: 2, 4, 8). Calls clk_hw_round_rate(div_hw, ULONG_=
MAX)
> >   and checks the result.
> >
> > - clk_divider_bestdiv_mux_ulong_max_returns_max_rate: places a two-inpu=
t
> >   mux (4 GHz and 2 GHz fixed-rate parents, CLK_SET_RATE_PARENT) ahead o=
f
> >   the same table-based divider to verify correct parent selection under
> >   ULONG_MAX.
> >
> > Both tests use an explicit clk_div_table with a minimum divider of 2 so
> > that the pre-loop maxdiv clamping in clk_divider_bestdiv():
> >
> >     maxdiv =3D min(ULONG_MAX / rate, maxdiv);
> >
> > clamps maxdiv to 1, causing _next_div() to return 2 on the first
> > iteration and skip the loop body entirely. This makes bestdiv fall back
> > to the maximum divider, returning the minimum rate rather than the
> > maximum.
> >
> > The expected values intentionally reflect the buggy output:
> >   - test 1: PARENT_RATE_1GHZ / 8  (minimum rate, not maximum)
> >   - test 2: 0                      (invalid, loop never populated bestd=
iv)
> >
> > These will be corrected to PARENT_RATE_1GHZ / 2 and PARENT_RATE_4GHZ / =
2
> > respectively once the fix to clk_divider_bestdiv() is applied.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> [snip]
>
> > +     KUNIT_ASSERT_EQ(test, 0,
> > +                     kunit_add_action_or_reset(test,
> > +                                               (kunit_action_t *)clk_h=
w_unregister_fixed_rate,
> > +                                               parent_hw));
>
> You can use KUNIT_DEFINE_ACTION_WRAPPER() to avoid that cast. There's
> some examples in drivers/clk/clk_kunit_helpers.c.
>
Thank you for the pointer, I will make use of the
KUNIT_DEFINE_ACTION_WRAPPER() macro.

Cheers,
Prabhakar

> With that fixed:
>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
