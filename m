Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B66DCE1
	for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 13:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782306981; cv=none; b=PHMfbEHAn8BnV885fifHOwTj9zzcnjjSWACb/B/5uAsWoHEzMJhayHAmUnWzfvjaaRbnWs4YZ9nX6uI4LVm+CjCOmRuxqFKvUSIqzl2mYkuLLgE/wdHnByTErF9RrAm0TLSY1r5LfsTleH/y37/hjEM1iizvNkaKhEy40IgXnPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782306981; c=relaxed/simple;
	bh=8OZs/3aYZE26lDlP1g6HVE9S8OvFdAoqeKt+7UfwzZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bMfuCchwPBiJ8VY2nSPPI7/fxNlm0jVifdse6b7vPXfxXYSHloyd2UEnfPPM9orPHc/S9VodzR1qnbp+dlmdYkFm8hscnklvGAIoUVUN60m4rWk//xj7NyOVwa2ZLPu4Y6njrjSV7gPHR6p0j1kss+VMkuvYqxVhkLPtmT+XnLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-725cf9a923aso729328137.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 06:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782306979; x=1782911779;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xg1Wcx6kQ6soA89yd1uZgMly7AFGnM5Vo9LWO71DzuE=;
        b=dfsCTNA9eF9PiOvdLmycf7XfqSwiWbUwpmXuwWqVa0QEJRPgZv0s661sbtNgzoJsY6
         npJy2VU3P5u57GCSGIOyoXzMsgsO2VVFx/B2J0U1MKU3SZuEvv3DKiTZkfDOH2pmDxcp
         DphBHNFYh8lVvzrewBqG2P+zqYO8HL2bJaAaBJVZo7Hbq0iVuJpioi9nHkFvTlePEqr5
         q5Wm11LIdlRAdIV7M3yOrjU+DhlFxDapJBtYCF0B22rKlInlDGo4UMQbNIUJHj0GQaqn
         +nIfP7pDLY2mc/UoeSxkRug6YvOxiYJtr5vt75zLbWBBmbJGhWYpzeCieS9Fdt0xCRlh
         Igyg==
X-Forwarded-Encrypted: i=1; AHgh+RrL8gOWBvGVWCgt0dmKZsdKm1nfcxcem7BjolfaY/gF50vsLEAL+w94oDA3NHWB+W2oN/8lbKLXKYE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEq3S55yA267cMijPnF/18sQmgLMJRm+cSDSQHUAkGtWu4JTgy
	UaLirREbNRSm8ap4fIllbnJb5spU2ahjmrtVSjg9F+HyUplxA2mE/tNgFWsXc3dT
X-Gm-Gg: AfdE7clGGsE4GUipA4olPsq3RDeprWFbClikOg4qaYs2xDP93XiHM2P2kZu/LzzV1eI
	zdwHd1WfmDM4uQRNtVbKXfIsExCCjEKPI5AgpVnS13lFkWvEK3BAtABgM2OSOAATcg2XDwmxw0I
	m6eh+Q+BUR5cbSZdpBuEN7kaQ35fZgCONI/K0uKKtOHTlAq5DGL4JlrFtML7xfs5h15J+Je+L8W
	NrJNFGnpUMjxtyJ2xtSyhCsjpvPp9TrLiQzmr3brlCr+MNjZLlW1BpCgQZGg6Mm37JroyeyVajI
	yjwqlFmParhjO+zFDd+br4+bQO/WW4OPyQAFKClOVgBwSqZO3Q43k+ZhJrEKmuwcieByQttfRh+
	3xW9lZQR5CBtkOr8SKZvUyK/Gg2P5jQUEaKJfog69/NMaFw8tuGZhEPaJMjOa1NOMnNdllX/kWQ
	LplxkMO4NhU/BsG4+8w4ky1ujQKJ8kBwXlLxAdxzIAGcweHqEe6g==
X-Received: by 2002:a05:6102:5a92:b0:6d9:5eaa:6d9c with SMTP id ada2fe7eead31-73113a19682mr1608807137.12.1782306978800;
        Wed, 24 Jun 2026 06:16:18 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9670c30998asm10234294241.13.2026.06.24.06.16.16
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jun 2026 06:16:16 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-72669a71c40so612390137.3
        for <linux-clk@vger.kernel.org>; Wed, 24 Jun 2026 06:16:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rq+0QrfruezVHqdhKweZ4dKcrFkVChvlrcCakMrqGnN7Hi8DBy7fe0Y6TmxSgq7VlqICMcjxb6o7XA=@vger.kernel.org
X-Received: by 2002:a05:6102:644c:b0:6c4:5bdb:5e34 with SMTP id
 ada2fe7eead31-73110289029mr1451557137.0.1782306976253; Wed, 24 Jun 2026
 06:16:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260623162039.153291-1-biju.das.jz@bp.renesas.com>
 <20260624-advanced-pink-dinosaur-ebe720@quoll> <TY3PR01MB11346659E1A238C232E29946686ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <77976912-b0b0-4e08-ad9c-5080c4d8adcc@kernel.org> <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A6077B4F7380078EA3B486ED2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Jun 2026 15:16:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
X-Gm-Features: AVVi8CexLBXpgGHtP-P_1U1b_dd2B8tjjEWGvz_S2PVq7GutBSnqHQxq1klHKgs
Message-ID: <CAMuHMdV67ZuhpSjiu-rWrgyPAMafEDVALD5b0k_bFMYkfQnP8A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update maintainer
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, "biju.das.au" <biju.das.au@gmail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, Brian Masney <bmasney@redhat.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Wed, 24 Jun 2026 at 11:59, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > On 24/06/2026 11:46, Biju Das wrote:
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: 24 June 2026 10:42
> > >> Subject: Re: [PATCH] dt-bindings: clock: renesas,versaclock7: Update
> > >> maintainer
> > >>
> > >> On Tue, Jun 23, 2026 at 05:20:37PM +0100, Biju wrote:
> > >>> From: Biju Das <biju.das.jz@bp.renesas.com>
> > >>>
> > >>> Alex's email is bouncing. Update the maintainers list with my
> > >>> contact details to take over the schema maintenance.
> > >>>
> > >>> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > >>> ---
> > >>> Ref [1]
> > >>> [1] https://lore.kernel.org/all/ajqWevofEJ3fv856@redhat.com/
> > >>> ---
> > >>>  .../devicetree/bindings/clock/renesas,versaclock7.yaml          | 2 +-
> > >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> > >>
> > >> Please also update MAINTAINERS file.
> > >
> > > It is taken care in [1]
> > >
> > > [1]
> > > https://lore.kernel.org/all/CAMuHMdW0-WsZuuc7PoVNC5DBUoY9dP+ULmGTQ76VW
> > > MO_SjpbuQ@mail.gmail.com/
> >
> > Just squash them together.
> >
> > When you fix such issue like wrong email, fix it everywhere, not just one-by-one where the maintainers
> > need to poke you to fix in other places as well. It is generic rule for bugs as well. The wrong email
> > address is the most obvious example here, because it is also extremely easy. Just use git grep.
>
> Ok, but both patches were already queued by Geert for 7.3.

I will squash them while committing.


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
