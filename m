Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D327D194A6C
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769177863; cv=none; b=MZ6LK/7qQ9b3p+f2UxPcHir7r4qCGbL9S4SRTqk2qMGoloOCX+7Xyt7IZjo1u4EjlwEAgZstrgSNK1yskUQcK+fnhzH5fL9Sq6qqMtSbGbI9qxIF3eR1pjzbJUzjz0Xs2JHNTC1+WwV+zrqQnLrOmg+wEM+2dUyLYqvQq95+5i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769177863; c=relaxed/simple;
	bh=r9HsTXgn1GaeqU1gNHwX8oVvaVI1l0Q1W0dpN3P42O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hhKy/aeELpYcCr8IxRph74GFC0yL/tW01K7mrXsF6oxMMFgTqYoN+RaZI7zxbgobbyYZMQqxdBZZRvUUblGnit3WOmP3a6d0mhtnZeJNbtWbxT7P1YFcx6f4Rki91UxXslhIUfJS+Evl4zkCDSgHf6tWUiHyMiaqbe2qub6B2t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56373f07265so1916700e0c.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:17:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769177860; x=1769782660;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLnfjU65RvqkFmzX5x5XUooORBFON/JkVFQYLPFc2VI=;
        b=p+tnEt3F0vWcn2kL4HYM5UAr7kY0k87gIw+iNADA516TV5kzVD84VUemGqItZ6OEgX
         SgCz7zeqyG23V1TKazivYau5LajgtLk7XRgFP96lRo7VV3n4WYWnyKNF0GAjtk7uKoID
         PYNJAY7CFFLwLvHnBphcUa+P9VkAKoGyPk5v1CXs08XmF0EsBUr7Pp/LvAKMPw+LYP9x
         m4mZqpEM/rtbhxOfte1MM3NxllG4ZQdxV+qFcis8is0E0p7mEIWzbpLsosYL8UVIB1lc
         hypiYd2QpLzL/749tQHSgnuoUEAEGerdQ86dCrHEpyOA+t3V4bo4d/mERwrDRFXhgaIq
         QQ+A==
X-Forwarded-Encrypted: i=1; AJvYcCVdnEUppEJ1KqTzCVHs9GtbVPBUbpSP1XwhEg62cXFLQ3Ki22Vhch1zoETXcOImJ3pJjjwXjoyTFW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG6Ocy7RGbgpcgFhsf6onvH8xqx2poWQ7b01m7nlCVfmJMlv08
	kuHhArqRw/nVt+8Daz31oCr2dzYVC2uCW3ny6i81XYyMNGrJyxGoKYL2gXPvNMY2
X-Gm-Gg: AZuq6aKVMurtcDPuV+yrXxNzsUpkwJypDXoSGwIJGbHpqQ9UtIi8BVZRlpu2xCqXGGz
	7eCN+81qh85nWBcC4zGdQfpup5wdQxyGwP/KHB+6rDok/i3rkNSYvH9PgJ7fYmX8lsE2l7/TjQ2
	zjEtAZJEPMvmmxii1hJx1TnBvJ7KN3MjCERnPms6zJ84d89w6cveyHoz27isFHBlxfLiSUcdIIg
	PYgluBQakBYjmkNdiZMqLw5QpCLtx+ZpStdRADwZJfDS9WGTo1ECHxIBJU0XoFY9++IPQki8xvB
	qwdANPuHTiII0+aBFZURq7F3IOl/lanrTYjftU3YXxgewR4blo/RX6arTtJ+n7GivGE6ZOsZrt9
	SVXbvhNmRmr8q7yjO4lHc9mnpFaOI0iuDpACRfNfQn0DhuGHsOgalJJ30rUW70hUI8iLkpgRqvq
	77Zw4ZQ+oJy9qbgkC63k0bjoIe7l/bu9pmjB7V21jbilJ9Ns2u
X-Received: by 2002:a05:6122:250a:b0:556:9cb9:65cd with SMTP id 71dfb90a1353d-5663ea940e2mr957219e0c.6.1769177859641;
        Fri, 23 Jan 2026 06:17:39 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5663fa632e3sm501091e0c.4.2026.01.23.06.17.39
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 06:17:39 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5f52ed75c45so1777399137.2
        for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 06:17:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUE/T0Dq+9zrIk4MxZufTmvFW+cs8F7j3DRvLst/RWv0QyJP5/c44RtmSNfHQEKTl8k/SomgP8WJ8M=@vger.kernel.org
X-Received: by 2002:a05:6102:3f0f:b0:5db:1fbc:4462 with SMTP id
 ada2fe7eead31-5f54bcc01d2mr1080831137.31.1769177859213; Fri, 23 Jan 2026
 06:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123140031.94752-1-john.madieu.xa@bp.renesas.com> <20260123140031.94752-6-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260123140031.94752-6-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Jan 2026 15:17:27 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
X-Gm-Features: AZwV_QiB25G7U1c5HmJJDzyb95Uh8yyZZslQ3E5dHn2oE_aXz9DOubj9nIVp0gs
Message-ID: <CAMuHMdWxNbJaDhpOsJRCkDWvqqu4e63Z+cMRndFA6F+McdbuRg@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Fix
 typo in interrupt-names
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Fri, 23 Jan 2026 at 15:01, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Fix a typo in the interrupt-names property description: "ser_cor"
> should be "serr_cor" (System Error Correctable).
>
> Fixes: e7534e790557 ("dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document RZ/G3E SoC")
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> @@ -42,7 +42,7 @@ properties:
>    interrupt-names:
>      items:
>        - description: serr
> -      - description: ser_cor
> +      - description: serr_cor
>        - description: serr_nonfatal
>        - description: serr_fatal
>        - description: axi_err

Nice catch!

Looks like the DTS is actually correct. So why wasn't this caught
before by "make dtbs_check"?

<dramatical silence>

Because "description" should have been "const".
The same is true for clock-names and reset-names.
So please fix all of these, together with the typo.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
