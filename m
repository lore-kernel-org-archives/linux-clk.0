Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68FD3BC69C
	for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 10:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777456996; cv=none; b=DXCxoweSqkcuC9SPJQNmNd2uI6B6YlZNzxtcfuH0DHohpKhDtijfoLWaPGmW0r7ojtp7ZOGTWg6AjgCpdu/tauwufq8iYSu9tyCyJjsN35PeUI1UYGwSgjVuizc6Q5kmLzTeSJZpTIC+nlSgpCMSjm4px5EGf9w/HXQSiNxwHvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777456996; c=relaxed/simple;
	bh=Nn0K43nvpoluFLl6ARYq8Tlw/SbTNjxDaYPa0VhNrN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UIT+Iwyr/2QZh0qQnWv37cZjFfqWqoYYZIO5aXssNaLpqzUBcRKP6ial+h30wLuj6K1Om/gISOpAeGoIWY17oBEOg+iagylDmLZCUm9Y+kQ/7Kq8K47o0jmgQYUbFAXDQdtHq7PSkZ7+5iJZcwugt9awjXCvZDCYLIftyUtWjG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8ef2118b478so842006685a.0
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777456993; x=1778061793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=727TQd0c+qHkAEInnHUXDqUTv77oNJr8Ljf4nlxgtUQ=;
        b=FliHQ7oRf9x1TnexHZF+jpIGyVfKeJtQbjvckusouO4hO9EbFZJ2hn6WRHM7CyKAKM
         5+H958DSlWFT3JjQTU5czpG2O1bD6/q+wVi6tEc+FYfyMDku1yYU/aIkIObCFX43QfFk
         VNwnucdWcN0eoKc/i0lW70Y5Fq0YfxF8Z+0eLuSCi28uLnCZnKFDprW1+M8OXeHh3Led
         Ae2/3Pza7QLk4Ma5TKOkQ2s9AlZupx9XlWFTg3R7dKOS70i06JrS81Ep/GhMita2X/6B
         CryTSzar6O8aG3bGMdfvw2L+EQBoSYzky3gOIK+AUwvruIuNRaI9l4kjFyaz2Zdoi4qV
         uTbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9SJM2fQuSF+7Pwzjvq4KDi6ad6Posyu3JQDSqAujfrbXQengXhAx8A5JuNYbSeDYM7QmY4AFFl3kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZk3vxLEId415nrYuLPHZN3zKR2P8cOcn4Ah3E/s3Ha5YjiWR5
	ehLFbqx0kTyWTtleiUpob+n4373sIs0BkEXOVcI8fkRgN7y7SRGyi31PR7kIvRYUYzw=
X-Gm-Gg: AeBDietI/nCj6JnfmWBbMrzlYyXFaofT+QPA9n6a/EsjjiNyyU0H/Z0hFs7CVDoUdFb
	jL2l4ODTXtAD78RoLKhUwehxI2irHlp6TKYlewduw7R9JeCgcvS1JygaXd1WPIxTdleyglap7rh
	WUjPGiLdOecQMWwU2z+rj+Ch6fyjXR1l16zoNcSkKegMxx3nLZcC0plfz6BMvacioGtrJWzh/Ze
	rwBUvY6FU/uz/tkgUDhwnHeipm8+bjcPXR97xk9F9ix50wpLB9+D5iR/wR8VelKTbKzw3CTopD8
	CO0HcXQFgx6XlyT0FwgUVQmh5yw/b0aB45XP1yw/vIUUQiyuKQJxuctpi8yYnNa2i6CCJROjfjA
	vnM3pIg8LrbZa56ZWKMUb5UTwhLtuSqd0Kj/dpCaXxnDa2qcgauA/1auO+rwcJLuoZewcHFyYme
	7JScwt/NpxnLapbXac/P73FlbTouu+K74M/2YJmS3glqSrpR+45Nwuyx3U/NO5OYi2kIhA/vgDN
	/Q=
X-Received: by 2002:a05:620a:298f:b0:8eb:610d:a56d with SMTP id af79cd13be357-8f8f4acf94dmr440320385a.27.1777456993374;
        Wed, 29 Apr 2026 03:03:13 -0700 (PDT)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93d1f7389sm151147785a.21.2026.04.29.03.03.13
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 03:03:13 -0700 (PDT)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8ee62a19730so793619585a.3
        for <linux-clk@vger.kernel.org>; Wed, 29 Apr 2026 03:03:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+uWTmcqnIsSSlt+lFDMDz5CVRSYwRr1y5uVjcOWRSejXrvCQdoL2SEznKac8J9gajGbXWVgSovv74=@vger.kernel.org
X-Received: by 2002:a05:6102:598e:b0:61a:c2e2:932e with SMTP id
 ada2fe7eead31-629272e37fbmr1942655137.22.1777456671431; Wed, 29 Apr 2026
 02:57:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260419193718.133174-1-marek.vasut+renesas@mailbox.org> <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260419193718.133174-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Apr 2026 11:57:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
X-Gm-Features: AVHnY4IlsJzOGR_PMCF4iS-Uk9l-2ljuIGS7ZCYV7JbOA-5TFuOsoyAbIfAM7Nc
Message-ID: <CAMuHMdUzRoELGedrM3ELUjZr-N6DnF4TXtdQR_k74Xmfppu9fA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: display: renesas,du: Document Renesas
 R-Car R8A779MD M3Le
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

Thanks for your patch!

On Sun, 19 Apr 2026 at 21:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Extend the Renesas DU display bindings to support the Renesas R-Car
> R8A779MD M3Le SoC. This SoC is similar to R-Car R8A77965 M3-N SoC,
> except the HDMI port@1 is not present.

"and DU1 is unused." (whatever that may mean...)

>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

> --- a/Documentation/devicetree/bindings/display/renesas,du.yaml
> +++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
> @@ -42,6 +42,7 @@ properties:
>        - renesas,du-r8a779a0 # for R-Car V3U compatible DU
>        - renesas,du-r8a779g0 # for R-Car V4H compatible DU
>        - renesas,du-r8a779h0 # for R-Car V4M compatible DU
> +      - renesas,du-r8a779md # for R-Car M3Le compatible DU

I am not sure you need a new compatible value: is the DU really
different than on R-Car M3-N, or does it just lack some wiring? ...

>
>    reg:
>      maxItems: 1
> @@ -890,6 +891,75 @@ allOf:
>          - reset-names
>          - renesas,vsps
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r8a779md
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 3
> +          items:
> +            - description: Functional clock for DU0
> +            - description: Functional clock for DU1

... E.g. you still have a module clock for DU1 (the documentation
for R-Car M3Le does not mention any changes in clocks).

> +            - description: Functional clock for DU3
> +            - description: DU_DOTCLKIN0 input clock
> +            - description: DU_DOTCLKIN1 input clock

... E.g. the package is documented to have pin DU_DOTCLKIN1.

> +            - description: DU_DOTCLKIN3 input clock
> +
> +        clock-names:
> +          minItems: 3
> +          items:
> +            - const: du.0
> +            - const: du.1
> +            - const: du.3
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +            - pattern: '^dclkin\.[013]$'
> +
> +        interrupts:
> +          minItems: 3
> +          maxItems: 3

... E.g. you still have an interrupt for DU1 (the documentation
for R-Car M3Le does not mention any changes in interrupts).

> +
> +        resets:
> +          minItems: 2
> +          maxItems: 2
> +
> +        reset-names:
> +          items:
> +            - const: du.0
> +            - const: du.3
> +
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1: false

Perhaps port@1 can be present (and thus required), but left unconnected
instead?

> +            port@2:
> +              description: LVDS 0
> +            port@3: false
> +
> +          required:
> +            - port@0
> +            - port@2
> +
> +        renesas,cmms:
> +          minItems: 3
> +          maxItems: 3
> +
> +        renesas,vsps:
> +          minItems: 3
> +          maxItems: 3

Your arch/arm64/boot/dts/renesas/r8a779md.dtsi only has two entries
in renesas,cmms and renesas,vsps?

> +
> +      required:
> +        - clock-names
> +        - interrupts
> +        - resets
> +        - reset-names
> +        - renesas,vsps
> +
>  additionalProperties: false
>
>  examples:

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
