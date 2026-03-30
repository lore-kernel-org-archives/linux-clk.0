Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19F2391826
	for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 18:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774896488; cv=none; b=RvRZ7qMVdHxtDlAzRi8pGPPiWJyFe/yPM7LrobdXdNmHyaKBw+Okwv+1cJ9eAMPPQSMQxJW7toU0HK17AuY9T2WuH/xizwm6NCN1gcoHW1WnYNdtlSDzfbacN5RglcKAb2MUx9g+4JXRQivYvyjlUJF74sbyKhnAa/QCIk2tKvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774896488; c=relaxed/simple;
	bh=PZJA8OYSHkcjEb6yeCr4bU8DRy/2gacrQ+n6Z6q9zPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw6nN2O41811B+dfIoxZE7LCJYq6BocAsBLSWKBuww1pRSIyg0rVQ+sGLYnbJmbHau05wtJxaHbGpbd2U1wyzE9CB6ncpIRGimfiD7oyTsFcHt2S4+evomOzm6EWWfNVlFKVukQSVsVur9e1k+1hrlRr9Q0++MSpAcFkoP48MOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56cc8a021e2so3390717e0c.0
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 11:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774896485; x=1775501285;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmbdfERIdYVjSOaA8rBMP7lXVvFsi5yyzuqKEhnFPsQ=;
        b=oorP8kLCADoIi6effEA0EyUNUX8FZbftl5dQ6eIB5QqvQyQv+aI9PcOOJAYbscC24v
         cSOy5W6iqkCq2wxUpIwvfgA6XX6nYT7Mvk8sLyyk+TB1fuKjknGuzSSIR+KbYasMKmPf
         kb+xvqNGbueWyleXlbGZP7PtocQfKHUVWgvMiztH0awDFeb4SUWBRkGZaUOePp2h0F3+
         KoNs3E5NglTAov/SYC5Kmn/RFD0CuRNXDI3N8PlUKhx5It+dCTIzhm27IAbkK38Kuj70
         iBX5H5Qyj+TAtm86Efy/hZKgkCV/Exq9fpnIbUrnyASRBmxuxHz5F41fCg/0k96sIoqh
         koGA==
X-Forwarded-Encrypted: i=1; AJvYcCVYpN7PYpvzytjsLr+xwevXVr97SGIGNec88GSJhcoWbZ6AbVPz1SQgx9TSQiq0l+mFWMusE4qIJnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxfmgLAHF2WN6gTDk7o/rl/mseCTRr0+AYheLqnvYta1M1onuZ
	oIaDJRzNfLDrTdxdUA4+MV7EcPn0LfZAjbTlUAcdfcWJv1VzWrfC/GOeK8470rw2
X-Gm-Gg: ATEYQzwfV8rVRhH49wy7/3yY/PSPEDd+ni3Y09hVVSjwDeeAPv7JX9I0fM4oSLb38Ep
	Snzwx5KyUqATpLGW21I8OtIk+dr6Gr0WsxD6fIcs8BD/AozqnY0zRrwlWaqCmAMENK+nG1adshs
	EX1/ATqSlne03EXpDL+Sl33J+zxCXOJhsIP7y+u82qJMldn8CeWyR+iqyN+/wE+KktTlEmCiuhf
	z46V/Z/EANNTeBIxpOIJ4qtN08bev72Bw1QhpS9ES/2t0251KZYOfWHMW3+utwjocQCyUQHCQTc
	tkBJXDdPEOevOHC0vLBpMF/y7GIO39ti8eCTwcTgOogBcLxzIvb6zmPeGJ8GJV0n7mSzD67S5mZ
	euvevsgz6E9GqwmknNK5rEJaJNkBD8NfHSoRgEpnrWUW1gyopXhCi8XikSb5XX+fEL6WGM/1LxG
	JeiGbdZQR0CiZjoI0orxVhHzm9qFyYCWgeTrivzX5chjKpQEOCZ83/ONAIiBTidEDj
X-Received: by 2002:a05:6122:4598:b0:56b:8ba0:fd58 with SMTP id 71dfb90a1353d-56d7c0bbc08mr380117e0c.6.1774896485394;
        Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d58893d21sm9514800e0c.2.2026.03.30.11.48.05
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so4567031e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 30 Mar 2026 11:48:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWaV0UDyxzRRI6lreCLND5fj6FwUnDM1HPdRFkGtybGmSlqwgoHM7J3ByWCGgdjHNIBn5eSUi5+Kac=@vger.kernel.org
X-Received: by 2002:a05:6122:21a7:b0:56a:ed84:e2 with SMTP id
 71dfb90a1353d-56d7bf9a1a3mr395634e0c.1.1774896484928; Mon, 30 Mar 2026
 11:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319155334.51278-1-john.madieu.xa@bp.renesas.com>
 <20260319155334.51278-8-john.madieu.xa@bp.renesas.com> <20260320-peculiar-cat-of-acumen-c6f6b3@quoll>
 <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
In-Reply-To: <TY6PR01MB173775E9970A41ED3A7FFF1DAFF52A@TY6PR01MB17377.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Mar 2026 20:47:51 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
X-Gm-Features: AQROBzBY2yW50P7_EhVQZxwFTstX-3Z9DxWPu0ijoIOHvrdSgZhFLZHzJwI06ec
Message-ID: <CAMuHMdW6Ac_=BugNJaqWnazdDsuzBB765jpzXt8fUasbypXFxg@mail.gmail.com>
Subject: Re: [PATCH 07/22] ASoC: dt-bindings: renesas,rsnd: Add RZ/G3E support
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, "magnus.damm" <magnus.damm@gmail.com>, 
	Thomas Gleixner <tglx@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, "Claudiu.Beznea" <claudiu.beznea@tuxon.dev>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	John Madieu <john.madieu@gmail.com>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"dmaengine@vger.kernel.org" <dmaengine@vger.kernel.org>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Mon, 30 Mar 2026 at 17:40, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > > RZ/G3E has a different audio architecture from R-Car Gen2/Gen3/Gen4,
> > > with additional clocks and resets:
> > > - Per-SSI ADG clocks (adg.ssi.0-9)
> > > - SCU related clocks (scu, scu_x2, scu_supply)
> > > - SSIF supply clock
> > > - AUDMAC peri-peri clock
> > > - ADG clock
> > > - Additional resets for SCU, ADG, and AUDMAC peri-peri
> > >
> > > RZ/G3E has 5 DMA controllers that can all be used by audio peripherals.
> > > To allow the DMA core to distribute channels across all available
> > > controllers, increase the maximum number of DMA entries in DVC, SRC,
> > > and SSIU sub-nodes so that multiple providers can be listed with
> > > repeated channel names.
> > >
> > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > index e8a2acb92646..bc8885c4fa24 100644
> > > --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> > > @@ -58,6 +58,7 @@ properties:
> > >            - renesas,rcar_sound-gen2
> > >            - renesas,rcar_sound-gen3
> > >            - renesas,rcar_sound-gen4
> > > +          - renesas,rcar_sound-r9a09g047     # RZ/G3E
> >
> > Do not use underscores in compatibles. Previously used wrong style is not
> > the excuse here, just like previously poor code, mistakes, bugs,
> > unreadable approches is not justification to repeat the same.
>
> Got it.
>
> > >    reg:
> > >      minItems: 1
> > > @@ -97,20 +98,22 @@ properties:
> > >
> > >    resets:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    reset-names:
> > >      minItems: 1
> > > -    maxItems: 11
> > > +    maxItems: 14
> > >
> > >    clocks:
> > >      description: References to SSI/SRC/MIX/CTU/DVC/AUDIO_CLK clocks.
> > >      minItems: 1
> > > -    maxItems: 31
> > > +    maxItems: 47
> > >
> > >    clock-names:
> > >      description: List of necessary clock names.
> > >      # details are defined below
> > > +    minItems: 1
> > > +    maxItems: 47
> > >
> > >    # ports is below
> > >    port:
> > > @@ -136,9 +139,17 @@ properties:
> > >
> > >          properties:
> > >            dmas:
> > > -            maxItems: 1
> > > +            description:
> > > +              Must contain unique DMA specifiers, one per available
> > > +              DMAC. On RZ/G3E, up to 5 for transmission.
> > > +            minItems: 1
> > > +            maxItems: 5
> > >            dma-names:
> > > -            const: tx
> > > +            minItems: 1
> > > +            maxItems: 5
> > > +            items:
> > > +              enum:
> > > +                - tx
> >
> > Multiple levels, multiple if:then: (further) - I don't find this binding
> > manageable/readable. You should split it, with common binding defining
> > common part of hardware or interface if there is such.
>
> I as you suggested, I'll split it. Just to double check, should I fix
> any bug found in there (like existing compatible strings having underscore
> separators) ? Or should I just split and make sure only new SoC support is
> bug free ?

You cannot just change existing compatible values, as they are part
of the DT ABI.

When you split RZ/G3E off into a separate file, please drop the
"rcar"-part[*] in its compatible value, and move the SoC-specific part
right after the comma.  Perhaps "renesas,r9a09g047-sound"?

[*] Disclaimer: I haven't read the RZ/G3E audio chapter yet.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
