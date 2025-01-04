Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024021D5AAE;
	Sat,  4 Jan 2025 20:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736023504; cv=none; b=DiPtQVI8cI/l0WyJeQeoNUStqpDyaByuMg3lP5PED9DOwE0Lur+6h5R8dx7msXqUmt/g5EVgWLUD8GosSAiff1dg8/gw7xYNcAVv/UMtO4/BAGfVwaWdvfM2hr26ClgxqluncCXc4ZyT685YWQ4sxM0cFNLmAXhVaaNgRN0RMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736023504; c=relaxed/simple;
	bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LeylLjKsNBhaYecszCNAPg8ljxYsLGTejY6XTuY7lYXxGtejaHrrBuGdNpnBiwoYfA8n1P4h2OI0sIAXZC7MHmcjpDTnQIhgr2pMsXegvpNPpleD3jcPITNtrN956P2bqqqTu0Ly/8VAlVpMcyj5JfdCEeUbFktSx2VyDRcJr9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AfxFvoNz; arc=none smtp.client-ip=209.85.160.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AfxFvoNz"
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-29e5aedbebdso6173236fac.0;
        Sat, 04 Jan 2025 12:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736023502; x=1736628302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=AfxFvoNzIJsY6GDL7XUxp+2j4cwm/2mGvz3oQE1EGlVHz2QU/H/NNJ+r6CwWGIS7n6
         KdDXievRGMT6wHV5Kb76r47CNMS1Nui8Nz++CpRxIugwXw3sNyiRYLtIeW33oc9RY5Pn
         VIShku/RagoTVe/DpKkX9dW5wzc2CeyQjIRWWG6k5XA1/kFHl/YfKqAQOdkQgToS+sGU
         YvW2/czs+UbzYPJB+WWd1D5u1z05T4CmYm8EeDry7tpXov7X76xwSToNGwG14NDbxPjP
         ITnLS3EaAt6iV3ZUwpHjyWr2e2R52fjB7ueDGE+cjK4idLjvgRJiZ/b7fXp4Ie+g/JxR
         dv4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736023502; x=1736628302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=479X+hAdJofqV9h3/6m3M+qID36G9eoeh5jRAoD4ftQ=;
        b=s2l0N3nlVu/RF9nb2oYM18G/uzkZpoLLHUoXVRF4h/Ma9xK05M547U9ortdSv9XIlL
         4aU6ZKPJqdjZhomeEq0i4ILtsyh0Tb4ptBa2+l0bWxsjS7UFgJhz6o5+Zw+ALJNfopSI
         xQ40GDbJUvubL55Hve/+0UOF+1KR6ixluq0zuaIcjmEDOEo0vxavrjDZmBqMPYWuuYFQ
         ACI02RlsLsiFaSuMKxAG56JVMeEu6Ne7MO8Vyn7+U47wtytYVak5oFKu+EmSmt8lxHT2
         ixOgua1ZARM/IhHsr6iOI9NDVyZDwaAjifK602EWGsnKppH0EexG8x7LN23FqTM/85JR
         Rm4w==
X-Forwarded-Encrypted: i=1; AJvYcCX/2fViqEdMQ0tgdH4RzXQLfyjD2vkAUtBLPmJ7KWhA1HjpZex6MAIRT/3cSRfG3fRXpk1ZiV3+yX0q6fMh@vger.kernel.org, AJvYcCXSxjn2DEsl7w46KaBnNdGSBIX13x/UHf1OrTGEW1zJVMJ5CuTH0bLlRfUOzNEOOHxfdf6c5iLKXI0k@vger.kernel.org, AJvYcCXW7U3pewhHgGXRjQScDpsDyxL6UExm3+I1T65PJyMJp0JTCw0lqe9z+OsoQeeDu+BWloDU+TKfUfRx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw1sSkFeqa/XcGUNsZmKHlR0Ugl9XXitCBeuG8il+BpKbnusl+
	7hfz7Rrx0/hT9q5+2eFLbgJf5zT2dpG0qe3gF9kqhwBZaoq/SvRgpaSfYSRiNFcPF1t0rAnVjyF
	vrNtBeWM9ao4zSiv38NfQXc5lXLE=
X-Gm-Gg: ASbGncuUmgMnrK2pbV72YNxa/0j/o34Q2ZRg7YnUptTwJ/3JRduKvpA8s5IHQbK1V6X
	7B4dm7pIdjH6yyJ1ffrOczgrU5pjFWkinDAaW74nZdZ4TkiYlEVoS
X-Google-Smtp-Source: AGHT+IET3PfD2lydjmB9lUAPFdSJsVQcRdVdEXojLiqSBWvz4vm97/5ujV9jy/Tj2jeiVODvP+E7drTMo/tGOD5/NwM=
X-Received: by 2002:a05:6871:328c:b0:29d:c832:7ef6 with SMTP id
 586e51a60fabf-2a7fb40f20emr28771169fac.39.1736023502000; Sat, 04 Jan 2025
 12:45:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <pc7en2jjvce6et6s22sdfooixxxos4u5bitcfhylt7ms65o7wt@bxdvnyeus7b3> <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
In-Reply-To: <62d449d4-c764-4dda-bbad-22499101f3dd@kernel.org>
From: Vasily Khoruzhick <anarsoul@gmail.com>
Date: Sat, 4 Jan 2025 12:44:35 -0800
Message-ID: <CA+E=qVfdh0OMM8ZuJdhFkjuuwNZKQBt--YMBw6T=NRvh8jb31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 2:18=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 04/01/2025 11:16, Krzysztof Kozlowski wrote:
> > On Fri, Jan 03, 2025 at 11:36:57PM -0800, Vasily Khoruzhick wrote:
> >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> >> select TCON0 clock parent in dts
> >>
> >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCO=
N0 mux")
> >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> >
> > Where did this happen?
> >
> >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> >
> > And these? I cannot find traces on the list.
>
> I found them, cover letter.

Yeah, most of the tags are replies to v1 cover letter. Stuart's
Tested-by comes from IRC. However all the mentioned people are on CC
list, it's not like I'm trying to sneak in counterfeit tags :)


> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
>
> Best regards,
> Krzysztof
