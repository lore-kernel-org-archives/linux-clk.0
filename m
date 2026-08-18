Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAB0367282
	for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 21:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787089016; cv=pass; b=NPUrjl+gj8FSQ/YV7ypNHtl1UloIme2lm5uj5DY3cGOW9wtB2Trrvnpst3Kzeh+1V6USLQ9q2J2o5UCin24VCNnZtvOX8Ouh52ItLk/tL+BMQagXQhCzZrKuGEOqreAAH717XqUA6NmiHlJ1VRAccG9ChDoLNmJCJVj0ggUXdeg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787089016; c=relaxed/simple;
	bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eIkSdwNEgf7a2k0on6VkRinb8wFoAZ5s5lKE/4i45M7W+PzSlHrLn+38F7dfu1WC4OejGdAgGKmf6g1FuMWg80WnJePXWFcZLA3/y8HhYXHmYcRIqrAiKwh5+rIvMnq53SbU3U7P4P2BDoij+vwi+ZgfOn+91mABP0FDeLQqSAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EfKJivyY; arc=pass smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EfKJivyY"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97bf910aa70so93701241.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Aug 2026 14:36:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787089013; cv=none;
        d=google.com; s=arc-20260327;
        b=X58qhu/4CXtEmDe0oXLT0YIHHRKhZRuC8TJcMZ8DcnAQdqTwMNKjfzJtXvQhP7/7On
         MCU6kRNCAxdnb+Tr5uwZnSmHpqBJ5p1Xg3tcL3dm81tEOeodHAmkPwxe5Mxy9Lj0CyEp
         +lYVkPmc9fmJIQBPH55GXzJJoRH0dDwXbDalRtNyNU2zmUViw2Qgl0wU5wKt0jeMDa9G
         SAs4jusCqaL91tTtB2IKxF00cdwTq54/tYA6mCCNr1RQ/MKAtjXvWpHsQSDHAowUiDiq
         JNFod6tAqW8tgB8J05YWEHLi/7n+IRQdrIMEajWywtfoUG9uFuxNXISnO8xS1yY8j4r4
         wPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        fh=ze9kTUTL/ZrFoNozHzuOjPtyKtqZ/3K0Y+t/Ilhm68A=;
        b=V17Qhu3IKZ8aMxDTTA4QIHv8QanjgMHCAkuxbbnw2lCXbKaAkZc1nbrcbiveEAc5br
         uCEFk6xysUFDUBnCvASVz0GBJSyDBn20zquyKzLRV8iekG9JKVbFp4Q02gabN7L7lnE7
         9ThvpeY1os2Icw8/Ailrdg3UNKKLhpvLq9eBOIKIOsqB5rG3p2Ywe/NujPgjYOzVk/B7
         dbsCvGY5jJgE0sOKfxIeJcrnUmvMRU7rFnhGvg8ew7YvVgj7M+D1eg6FyaoKGEPIP/jj
         M9C9xOnM/OvzzDjkoHCo/59BE6cwxZQ/TewPW+Shz1z9o99Ii+sXAvO98BrGvZfh+Fvm
         1nzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787089013; x=1787693813; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=EfKJivyY3Zsxyw3NllYkg2PF9zayhDDLARkVvR4uSf9RSc7ixt6ZxlN9boKTDJaxnP
         1YG+EIxNIt6kLWZ3Xz4p/5umB1MA43ySl/0qOlDbMR/ehTct6Yg0ct4HQofUmLZLlQgF
         NnSx09CX3dfDmxYlFKPKWFPbf5H8Gww4iJ3MCnXWrYOYS0rJJOtsSonGsxKciNDgzrEA
         xOa4I1VkhiLRDwD66O0SP5BwwnVYPfZWk9NGFA4+HbjclwdpifFJG0My4wHpwEizJaOL
         /F6Y/lqL+5il+WlOHzdPWKfYVB5h0UOVZ8eTRknB6JVLCvUOfknsqCcyXyclnWmXVZcQ
         TVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787089013; x=1787693813;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AMUsfXmsN0KUu46E37mETANlAYAnT51+WK05Bfuu0ns=;
        b=Pit+KYTJS7mAFryVrS0TJvQQzduOL9busK5gmJZ7/gEsigWhb3/H9ahpjO5x6zwGFL
         sEtJoT4lW9Dczz2+JnnNQrYi201A3IV1Eh9B8XAwYRMNKi86fabtztv3it2vL4ALVvge
         qWz8ya29um1ZiwqBG88XHBtnA+42apUkiMXmFA4B/rjOp7wklRGpIiFsZGe+KKFhA94q
         qpDBRpv9Xel8jucpoqdDsLsqbcAWWiI6gz2K8ZOKvPpyqfmLJ83N1F7X+N7dPVK17+Ub
         ZzmEtfd+KozU5t77unUwWrRUQ2Kxprpx3oz6rqYGZzMUvk/FAYRwb3k0mTIaGzbrmiH3
         TGbA==
X-Forwarded-Encrypted: i=1; AHgh+RpQMjsqrusJsDqYET0fCvxq9tZ0VUIKO5a0gCwfQfENwGO+hSzSJ6ErHDwiG88faM2DovDamlloewk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1igrDNDRz3JMtcyxvx8BK+CZZFmy52Saxybj2hPxvsrHJVWwC
	WOCopAjG0o8qDwUnSEdgXYENI1nntQ/6cRiDD/UQskY8j0wbmAivk3tJtHtymxFNxJ41Ms4eSfU
	SSlJmQhX18kDpxsRuT9Rhvkb2KAVEpwo=
X-Gm-Gg: AR+sD12TUMAiOtCFOBWgOk/+ZdUWnywx4I1gds+8VX5H5U2r70JoVBOR0T1Wte6DTWk
	G0Q846yxVdn9VoTpNlvyRM3WowFNtQt4LlVxHU046JINnM5djQ8SHspVTHzgohJOgyDtk2SFjH4
	tT8d1BflIzL7//+jeOqpI5ha7FcNXkp3U0YO89SXIJkej/xUcvvRGgpKNqp0Fhb1KEciL3LgDBW
	cwYDkaDMy5Cn+HkpBicLz74Hw+iLdosWxfSK1uSNmC6FoEZjmMvbcUJMfkbHfn5McL4I2f4QXq4
	TI4ElgdpxPG0ZxhFRzkjoC4VHNrSV8fRGGTQMru0Xxt1d8yC1pqB9hyrokduDKLDB6oUnfSfH3t
	lE1DAEyeypP/UUH9sZW9iNsqvwfpBr8QueOHsgPWZwTsC6OBXwcuQbfac4cM66+OzcqLpyzQ8pO
	+nf6VGc57Z70AkkzH/SoxURXpDYiiGhd1RyX25
X-Received: by 2002:a05:6102:3fa6:b0:6cb:d562:b96a with SMTP id
 ada2fe7eead31-777b89f4818mr417941137.14.1787089013591; Tue, 18 Aug 2026
 14:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703152215.192859-1-richard.genoud@bootlin.com>
 <20260703152215.192859-3-richard.genoud@bootlin.com> <aoQibj7sCd6o8W6h@monoceros>
 <CADvTj4r=uBJyJdmK3T+jD_Nitg2NBs7fZgtE5p6wt9zwWgj6DQ@mail.gmail.com> <aoTMMAGbWelnjJTo@monoceros>
In-Reply-To: <aoTMMAGbWelnjJTo@monoceros>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 18 Aug 2026 15:36:42 -0600
X-Gm-Features: AcwNN1WNCOQhs7S_JPB6wAilK0gfWlIi5mTrdxNK2MAHoPVv5VHOpQRIxBhuAGs
Message-ID: <CADvTj4ovVmY-TN7u_yj6me88qNEzr_0xbuC9DerPguFGdgOEBA@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] pwm: sun8i: Add H616 PWM support
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	John Stultz <jstultz@google.com>, Joao Schim <joao@schimsalabim.eu>, bigunclemax@gmail.com, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 3:26=E2=80=AFPM Uwe Kleine-K=C3=B6nig <ukleinek@ker=
nel.org> wrote:
>
> Hello,
>
> On Tue, Aug 18, 2026 at 08:12:43AM -0600, James Hilliard wrote:
> > On Tue, Aug 18, 2026 at 5:00=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek=
@kernel.org> wrote:
> > > I didn't look at Sashiko's feedback
> > > (https://lore.kernel.org/all/20260703153337.B5AFF1F000E9@smtp.kernel.=
org)
> > > but I would expect that not all 9 high-severity issues identified are
> > > slop. Please look through these for the next revision.
> >
> > I sent a v8 that should have fixed all the sashiko issues along with a
> > bunch of other issues:
> > https://lore.kernel.org/all/20260804-h616-pwm-v8-v8-0-db37ab8624ae@gmai=
l.com/T/
>
> Damn, I missed that because my usual check for newer revisions is using
> the sender as key (because subjects occasionally change). You didn't
> write about your patch series being coordinated with Richard, I hope it
> is.

Richard was working on this for the same project/board.

> Just looking at your changelog I think most of my manual feedback still
> needs addressing. Can you (or Richard?) please go through my feedback
> and address the things still relevant for your v8 please?

From what I could tell most of the v7 review is either already fixed or
inapplicable to the v8. Probably it needs to be reviewed separately.
