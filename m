Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0F13C9454
	for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 11:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989864; cv=pass; b=tHWEBoZA3bqS1R/jHd6lkAYinWf9AaufrCes2Y3kfotL/4XrB5RoSkAXNPX/8MGnZ0Cs+JsoVP45TfCCPhPYJrK99catXrFO/6Ii+uJzq+UV1Ahyq3m+cTGI6v57ItbnsiNamHlzW44y2qZR7HSyImzuIE5XXmGqiYhh9B2tz1s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989864; c=relaxed/simple;
	bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nNCXgmNWjf9JHbRZp+DFgO14E4AEwCEfAiH8JGMwjhedF0y/W/6T5Kk572cZNa8veX3QsLH+AzcnDJF6P/yQPvK5tkNg9mARGfyXALjlro4MCs2sBjVOEWaPYfzxpGJC0/ERlHTAF35tCt68QaEFyHpU+3uLj2wjTw7KLayt438=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThX742iP; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThX742iP"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso2241268f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 21 Sep 2026 04:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789989856; cv=none;
        d=google.com; s=arc-20260327;
        b=KDGZZYYim1Y08zi4hrPi2KajbN+KNMeXkbqmj3BOnQK9lqZIdk+50CXc0BLeojaI3Q
         NuRaIl8i5FYOhspSTn/SJoJn1uL9L98pt8WaabBQJbf9092RAa5mflLZW7vgj1mWB/7w
         H00pf7Pp2Kb+yp2tBR1IdnTQ1ORZGbTxmsvIKI3YuMZRMXiKAUFanMBS9RRVL3y1QK9U
         W551EvgP6dvywA3DoDRh8+uJGtw5ide2Pmb9Yt/LtrNvWrtHv2PRDRMNZyNmvd26X0em
         ES89d322b9IA7zNtYx0u1pIW2uOiKFH0/IyKEZkaSuk8vCIqdngnhXC9+H64nFa9yOnF
         583Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        fh=/qdQhCAVjPxUmePNe/ec9YDQu5yTqOkhiU5dC5ijKDo=;
        b=f8cf7xPQJmnr2kBW6h3Y4kcSaHTqxMONlPoVcPtkyJy98yebgL7bPcr98yklvMUtHG
         77lY0nl2xKUvJJsb80/r8GZEFxdZI6YadznhaPXjDy8l+ecILVnPJa5KZDOb+0OIX7cr
         GrvlyEA53b2/SQwuvfY8gbBjxe+YonRuchKe3tIwQq6vEUTINIcumdkG/MVwMfZAPJz9
         OH0YbRFNpx40+55OGRKC9sfD4rWiqW7x8lsaiMdqyvfb9D5IpHTXIJjpGIeVsobY4OPu
         Y4slEwWcKZ5esY29F0dsk2lKjF2+EU10ufsn+UL/2Y0N0VFcPtMToAWEfZGT/qS4WBCd
         WVKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989856; x=1790594656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=ThX742iPETQukFX3BBlsPPA+JqXvvRIUi3buvYb6DHUJ8uhywR7FkPybPC3WtdM2td
         cw+JZn2MXPLxNJkU1hv/HjhYQbCExqead52s5CZSES4onYM6ZeFng/l1dI4W2aCJ070z
         sGUIx8WWnCBUSgqZw2OQGQDhU4eYseFbxWM7XOZhjmsVd9hw+zaQJd17FyC+lmjZlng7
         YrB893St+30OJ3wABghrgJytAqkSKr044EIXFeyfBUmZZurPVJoA7+OODterBi/HYktB
         K+y+DZZjHv2NV80Cj+p5ANMayWnacg6V/RlXynE4nq+plf2w/FGel/B+E5JwiNU9VlO6
         LP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989856; x=1790594656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/eWHTyXoMpFdp4Bz0hrXhzEPnH88xFODm0JNc+iGDo=;
        b=O+ee584JDsyBGJBOPvLsq2fECNLW+riTTf0Uo0N5DhyWwvEq3sgSAdLFNIWwlMCQkC
         JfV+YuptXjCJNDPmSTpK4absJjfNBAR8/aFXf9hxI+wej8R6cXap6f0qCnzfS4rmiVE0
         9Z9gVHABZX5Wo9fVmwFaaaQMUINTdcC5zOFXwzufmE1V+Bp8jGm6PhtwYcJYZqzHgueZ
         gotqpw3ePc23yzKx4I0q+No8NywtVRFFBG8KQkDo8xGK242sXDKYJmWSm848fZdMBXzW
         fD+/9lyvR/x7Q3FJf08f+945i1G5QeZ0SZgBlgUSeb4ch48bhb3rUWDKFCpjLRskIL36
         ez8A==
X-Forwarded-Encrypted: i=1; AKwUvByGrApoHBjSDP2PRyYZr5Tx5FN2r2Fw3HlaPnwO7M8q4Tp9Ywz+ytJSxZvMUDUooqlNZ//kR64KqhI=@vger.kernel.org
X-Gm-Message-State: AFuF++mdnNwjeTKVy/K+6QZkh0Ih5DaPRFywYQCG+vUsTs3b/12JLYHq
	G6gQ2jp4ymJtYOGCt3FrKcSLQ+YtpBae7I2HkpCqVmC24c1MSVFH6tD9vKCVqwzA1upmQZFbOqN
	7I5iZNcEW2NjyAAbbdZToO5srGDdmxeUOikty5Osh8g==
X-Gm-Gg: AYBFou3zlpy2l1VtFKyq0OcybtDl/frJ3sPcpIwY0qDGtm5WiC3wwZRcg5nLhLwuf7a
	QD3bk9HALDhjMBpN0yeYy4s1xrE58HO9rDHQGsZHIX0IPdHVJ+hZKvD3LmvCGiuZO1toNlSnsUt
	t6Tfo5529meTyaKeRTmYXW/MESkW4OZu426ivtGbytM/8EvU5DrYJRLbLB/Kq/0ZzLlDQRiMdoF
	gKAoj+gcKEW7gg92CJj+aUGLTd2eX4TXHZqoj2qHMDYFr1djcT0Ogi+cmey0SHNhjM6oSWkPzqH
	X8IfVeOFMDDeBexpQdXr/6GYexzZT8JJF7uPgcbBl1a3jkToqdmrVK9vmQdnzwTyFcX1DnBnxmF
	wq7DL82+ofm7y8SwVLu5hmMY6rVD7DMKN/ibOhoF+tlbFciUFjC2IZeBDzAfRtBxgLThG/6wH
X-Received: by 2002:a5d:5d03:0:b0:487:8ef:5303 with SMTP id
 ffacd0b85a97d-4871e394d18mr16926933f8f.34.1789989855856; Mon, 21 Sep 2026
 04:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net> <CA+V-a8vVtjALarck6PE3it1si2hNbveZWoGjTaTUW68Q6yYjcQ@mail.gmail.com>
 <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
In-Reply-To: <a73c5d5d-dd64-4061-83cd-0a1cdcc2db4d@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 21 Sep 2026 12:23:49 +0100
X-Gm-Features: AcwNN1VFoJ0rwe68Hi1fMS8HP9OtdClqcRaDuoUukIno7KtW8dqa4XMt5T_ytyQ
Message-ID: <CA+V-a8tugekX_ykWWMzVkHbEo4huviGYdJuECEfuYVZo6dY5wQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Fri, Sep 18, 2026 at 6:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On 9/18/26 08:18, Lad, Prabhakar wrote:
> > Hi Guenter,
> >
> > On Thu, Sep 17, 2026 at 2:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.n=
et> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) re=
sides
> >>> in the second register region of the CPG/MSSR block. Since this
> >>> multi-function block is shared with other peripherals, it is exposed =
via a
> >>> syscon regmap interface.
> >>>
> >>> Look up the SYSC regmap using the optional "renesas,sysc" property an=
d
> >>> derive the WDTDCR offset from the watchdog instance index.
> >>>
> >>> Retain the existing MMIO-based access method when the "renesas,sysc"
> >>> property is absent to preserve compatibility with existing DT's.
> >>>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> Can I apply this patch without the other patches of the series ?
> >>
> > I posted the v5 series here addressing Sashiko's comments.
> >
>
> Sorry, I was getting confused. I somehow thought they are different serie=
s.
>
> Do you plan to send v6 to address the issues reported in v5 ?
>
Yes I do plan to post a v6.

> Note that Sashiko no longer reports pre-existing issues in public,
> so those will be out of scope.
>
Thanks for the note.

Cheers,
Prabhakar
