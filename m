Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A45434A3CE
	for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 18:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761071240; cv=none; b=Tv/dfzOKN4bO0VByRqrJzQBdSd64s4FCmhw5/QewnfbxQTX7bO1pc+R2141pJ7DrodK9nt+lQCYpIIyezL0NgTOkVhq+I4SDcDIKEcqwpt/APpFrmiGD9AZhCFEoJg+mxd22C6aYi9f+1xIrxiYGFCnwbXzIvIZ5LgLFc/fXCkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761071240; c=relaxed/simple;
	bh=3r3xUiz+nLNpkD5qTeW+3ABt35tVXdPHQ5mVpksysXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EGh/Wpfi6EXltp2abQ/KZ/EgbWEzwiyfVkywqRnH7ZFRo2f9GbFwgMAdsogcjTmLEqGOqZnEnasTo+3XEU/mjcvS+MI0NdAoeem98+WQhZ8teIQCi66ggzdBogC30+YdNxpdnrHQsh7fnlJbOuV4KQ/IQEHfuyxcOS/fUzVHRpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLtGLmQt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLtGLmQt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ed20bdfdffso5457399f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 21 Oct 2025 11:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761071237; x=1761676037; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE8uSQwXWgST8uXT/C8GC45uDsa31ftgODHC5Ezx8BU=;
        b=cLtGLmQtqPBe3lxB/xpZKMcQiZXLtK7+w/gfvxiI9DT2hV2r56IPfcry+utKUKCnZf
         yIz9ShPYovz1CqeJ/NcS+ksnMIOUaM1REZhjea3gHjoLHBDa76aykskX895lDdwSG1DQ
         Ak5UnimiJciAYbTle04ve9lgRlc8QMrTSrBq3FGtfBcioI96Aiw5AZvFmzdDtMtVQWla
         aAd2AaManAUzA+OE9tH6qR7hZ6ghNn/OScB6pmppVY1GqmaUcgLSIzIuc8YLOy4aBrlt
         YiquZehxLURcgM6BxW9Z19vRCxH0Z6cFY3jITZvVBGmOu5jLHtYTKXiBD9G+z9emd3ut
         qhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761071237; x=1761676037;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cE8uSQwXWgST8uXT/C8GC45uDsa31ftgODHC5Ezx8BU=;
        b=Mkd8VzXm57qwjW3RYbCGMzYXjAo7iQMkdCNAlT/Q2qcaRuSDmKgmbmgPUyVSY3k0Um
         dGPYm43AKLGBxuE4u3n7g0wJcjBrSW4cJ6lnBTb0CwnQH19unP2MOdlS/JZK45W0/wLS
         qQoV/v6Xe4fupNTZQBLqC1XQzAfgrmdxWD94wTbcU6hFNbn59ffgiL4VH9zXlSN1vh4a
         S6h+s0DN1NbA/wJxIBXn1vDtTknpwjgATdgKlYn6nI4hhcyE0AMQwrz0X55Dv5Y65mBA
         DShtMYlP+1BqMioJEov3HnGvKvdZFmkzknlHtIL3i5+oo3oAv9vK5YjENL8L8JTvewGG
         MX1w==
X-Forwarded-Encrypted: i=1; AJvYcCUSr/u2F192nJ1CV25bxLkScDz6xPP4gO0XE5wAvizLSXXirgSX71NaAQnf/ozVjHzeVy0+mbO4oEc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ9NhR+/KgVuzRd4hooKfpBcwZR+O+fgPf54k9pe3Eby9rEfRM
	5J0sMRHOddGtDo0o/oZt3uRl8mAKNUWEpTGGLWNaIGq0FOsWhFRkODuR4UPjVBePjIBFj1QRNIe
	I8OjuwnHdjTDzbHonrTSZHt7k80adYsE=
X-Gm-Gg: ASbGncsbtggtBteQLnMcdhnAEbXvtFiDAVx3EbjDdyjReL08k0veHTOkUiiw0DZSqvD
	cR0wKeYkCzupG8EJ9XpzOpLTx9N0RKQ2iDUQNVU1BOPpJCRe/KtY28dqWuw5pXAj+St290I7Bnm
	rp26TphyVvzEpofqrKwAM3dCAXVhP5cebEcIBiisPiUllsLjO4ZqfPQlVZJ31nk0xt90QEIpSVZ
	jjjGqgtNuOPsOHBt5UVtsAqmYECVBy2Z15jp/VZXxAJJdCu3A/SlB72I0zwybD9SBhXHQ+2
X-Google-Smtp-Source: AGHT+IFk6i+z+s45x3Y/ZNnj0WEKOgAukvQOG+Cb2z0ro+7s902CDutfSXGh6tJcQ/iD0+vijYGT9n6qo6qo7pst6HM=
X-Received: by 2002:a5d:64e4:0:b0:427:45f:ee21 with SMTP id
 ffacd0b85a97d-42704d90029mr13980937f8f.27.1761071236448; Tue, 21 Oct 2025
 11:27:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
In-Reply-To: <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 21 Oct 2025 19:26:49 +0100
X-Gm-Features: AS18NWC2o60rc9cSL9khBvVcjIsmZkA_NFsLdA-38mFv9XLbwQriIqJBrdcPrNg
Message-ID: <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,


On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar et al,
>
> On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > This patch series adds DU/DSI clocks and provides support for the
> > MIPI DSI interface on the RZ/V2H(P) SoC.
> >
> > v10->v11:
> > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> >   while iterating over the divider table
> > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
>
> I think this series is ready for merging.
>
\o/

> > Lad Prabhakar (7):
> >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> >     RZ/V2N
> >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
>
> As this touches both clk and drm, let's discuss the merge strategy.
> My proposal:
>   1. I queue patches 1-3 in an immutable branch with a signed tag,
>      to be used as a base for the remaining patches,
>   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
>   3. The DRM people queue patches 5-7 on top of 1.
>
> Does that sound fine for you?
Sounds good to me.

Biju/Tomi, are you OK with the above?

Cheers,
Prabhakar
