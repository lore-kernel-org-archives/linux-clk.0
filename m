Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E1337F746
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462669; cv=none; b=SrXLwU7UReeobeLfKsFrYQE9y7MJpyRYowqLhx6/md0CeM6oSmL8sZmJXXkj2RCECf+i5ndMQfqy8lrMgFv2SSsArQPMOHuD8PP0BZabBmNbipk2pHOOv7KjxJ+gzSA11SOyjpFTBc//qAEiAhwG+xwTVHV9+hHhP10ebVrDnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462669; c=relaxed/simple;
	bh=GQd283GbRHcL1eMa5GJkNHY5pKpECh6vPQSJWAlvGH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5TAqeceFx11junFSxnqKT5R4LM3B5IXK/ESNQH+nSJULrwWmcb8CzucnXAhcEsP1TQoyntHd7XXe2jTe6Z42I0uv6UHh99Qr8fPMr2oEeioPygA1K9fm/AWqyVsMjtc47xrrjXHy/6rVkbIq41G5mMTqzD8MEOHe1Kc6gQiwrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2b7d3ecc10dso41961055ad.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777462667; x=1778067467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h4uRNs5kbsz3D4/C3TCXfPmMeHwT6iVUCZwC9U3W8vY=;
        b=YZt0cQmfVJlJgQpPqx+k0ixvcLH6ujki41jN8FxGAvi+0EHCVutHCC0gFZgbA9UATC
         JT6t/ZuaR36e1L87lwhUCJ4mE1kSgfazkbpKx78ITC+25EAX9ic6T6BqLLAIqhXgqt+i
         CoPMtHOB0MxvOuNxmZPfvth6Faeq0eJUYjVVS7l+wlFwwS02Xwlv+Fqi6TbNrPLSekIL
         EMkFxW/dESjIR/MZKalxIbaqjQdgeNdV4Ut1QtDlxuDcsscxOu5UaFISZ49TP4l9I7yf
         dVA4FdNqS3CN4Ww7z4VBLzPHEAdmEZv3DdX3CgiSoNpRayhAAahv5b+0m4iueCe5eYj6
         2a7g==
X-Forwarded-Encrypted: i=1; AFNElJ8mbciAWB3TOrNZ458Zy2lcQ0DGYOlYFm+h/XBtjwnXewHaxbKWSzvil0oo6ndttZios5SHek0ri0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzquLRTZywUpiG0z0MycB+vgEoFS1FsTfZ96Wxjs9gUoRBGdzjv
	8b3S8y1hm/RHEq4LDo/PcJbMOym/WjwoX/OZqOmysuAyzM13PZAyHwkv+uIj5eE1SJY=
X-Gm-Gg: AeBDieuHrliELl+Jqt16a18PerdBBKjr+X1cDsrttJMDKi752YnH9U7LaAJj/y6jaSs
	DFzl0IIQimrqXOx/ESjUVjCl/vIBh1FGhAc0/PlAd+GbCgNKmJ/7fTwIy7jvHrulZQ2Xg5aoeVa
	oo7bVCfOpgSzRH+YlqviWuni+FHqvtF/pslpqQkX0dNZ2mxFdiU+EaLsvc2uwSqTJQAfHjMVMGz
	kotOYlts4HlPc4WVLFhKkkz7JfJhl27A0PJjCcGxDtmY5GwfcL58T8aIYANV3P5wR+GGt21le6u
	zQk8Rm+zKoQyw1cpEHUgIJCBHHSynrrlgbhG/AcbGl1s3WeZDieSUph4KRos8NbOYLWkNmxGCEW
	5Y1iQjJ+k9Hcik9vavkHk3IHMauFqiEbR4OIV6wx+n4FMcrT0GV6H2Vfdqh0Gkg+DCk4A7cjl32
	KadhsPTvpYOOap/9yO398iOGMYUAjS7hTJb3DUQvM2k8Mv9P1N8u6cqYWOrhbQV0xAPG4/rUi16
	28=
X-Received: by 2002:a17:903:2ace:b0:2b0:4f9a:b794 with SMTP id d9443c01a7336-2b97c4eda76mr74678955ad.37.1777462667449;
        Wed, 29 Apr 2026 04:37:47 -0700 (PDT)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com. [209.85.215.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9887853a2sm21575925ad.18.2026.04.29.04.37.47
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:37:47 -0700 (PDT)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c79467f11abso8465461a12.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 04:37:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9uV3kmph9qN1DpK9uhQvswHbUlln+P2Bv31/o7PoDhtxymCPxlUxyxb62wUStRx8xC0dMtT5KuDeU=@vger.kernel.org
X-Received: by 2002:a05:6122:1814:b0:56f:b2df:1791 with SMTP id
 71dfb90a1353d-573a566e6camr3723066e0c.9.1777462361508; Wed, 29 Apr 2026
 04:32:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-4-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 13:32:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
X-Gm-Features: AVHnY4LCd6eTq9wcyp22X0zMAv4PuhD2Uo4vLw9bsPU9plD7Rc1VJGY_TMU-X5Y
Message-ID: <CAMuHMdUkT6wO=mCSbJt1dQueW62=_o3r589MvFyHhz-zSfw_9w@mail.gmail.com>
Subject: Re: [PATCH 3/7] dt-bindings: clock: cs2000-cp: document CS2500
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Document backward compatibility support for CS2500 chip, which
> is a drop-in replacement for CS2000 chip.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
> @@ -11,14 +11,18 @@ maintainers:
>
>  description: |
>    The CS2000-CP is an extremely versatile system clocking device that
> -  utilizes a programmable phase lock loop.
> +  utilizes a programmable phase lock loop. CP2500-CP is a compatible
> +  drop-in replacement for CP2000-CP.

While CP2000 exists in two variants (-CP and -OTP, cfr. the link below),
there is just "CP2500"[2].

>
>    Link: https://www.cirrus.com/products/cs2000/
>
>  properties:
>    compatible:
> -    enum:
> -      - cirrus,cs2000-cp
> +    oneOf:
> +      - items:
> +          - const: cirrus,cs2500-cp

cirrus,cs2500

> +          - const: cirrus,cs2000-cp
> +      - const: cirrus,cs2000-cp
>
>    clocks:
>      description:


[1] ttps://www.cirrus.com/products/cs2500

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
