Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6D388E70
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 07:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635090; cv=none; b=XO/D1elZc6olXh42+eoUex51K4jp6Eo9D0sP53pH28Mp4zaawCcoOAlYSvJ+Xetj463hqyO2cmLDtxNQLTs87foyleLd/amuNX9CaL6yu0ZVaDUJg39WldLHTJwtz13qbX+sR4nL2Ndtc7x1qKUwGZdHw4jpebkjeCAkItlz87k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635090; c=relaxed/simple;
	bh=tb5ayrKCU1QRWz4F+1quo/d9UHKE8nDLKnD4uurIqwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Otmz7WqjjKNM9eVd5wedfBiL3NA5gNgfvTg20ntNkrkNYXMQOL1R6zNEzCftByvDMTCwOh5B0NcC4umtVED1lslGeu2n67MSgNy1nIN08WSS14MCnqdcH0zu7qVwLORYbNKJN2PwtNM6Nvi5lhS9WjLcPvSmA5FT8rTEt7EECuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5675d609621so4828425e0c.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:58:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635088; x=1776239888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s4R92sE+3j+L6v6U2wW4n9L1aU391JVM9cT4kRUC3wo=;
        b=iRWr1uWXrzkO1s3dUNdq5jIv1uVwDdfGU85qvEJOPiD8Wm7ou2pKFHRGxWMU+u4N2k
         rBBNQQcy6KKlkrBpHLoluaANng9L8YphfXJY1ONNRjUFzG1bLLmEOld3HItqCP540gbb
         n5zDz3QIcARX8ha9Uap90QLKhmNQBafwISQpdbDqJ08d1J5Jqyg/ypxdXz2tzXg+j6xM
         82ozqovpX5SdFaIsI2DvmG9LG2Sfwt8fFEbyNSCbB8tAVQjGFQkv2UexsiXZwBry9x5A
         m5eyKfKxAQTm5NTuKdGvGHrw94LQa593ml+76HCza3SXBAU6KBcTvs2lg9mjJgkRUxor
         MRnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaNS0L/IJm0dyZWdd5zplMnkv6GHGD6wm9XyYFUJFBarV94JUl0LTkIF8xDKsWa18GNktmDo2caBk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/UkxmAXztBep45ctDrKjxGL3bCs18mpuDk5XgoEn3d3oIjNy/
	mRK2cQ+QXHuqZ1yRIIQK1yPaXDmycdtu8yD+2D5WHqCXMY28j+6y6a69xKlIhPnL
X-Gm-Gg: AeBDievWHw2jWXu0NPaaByGst6uSDaOQcpaPg7x+cott9E5GV91CN/Fr2nilWh7TOAH
	a7zECbSX30SHyI/AaZ7ZXLttibERrJ3mtQMfC3GXpK1mKVzWOCzWawOEsEvJzp8Pu7BmrDpIHmt
	sWd2yv18GBf4FwqGhwM8d3QiM5zoLSoHJqeNQxjA4jTCrfb3O/xF7uoQVmxb9yVI2S6RmmOzNMD
	kHKG3AGKY3ehpmlBwxR6qxLIzo1Kc2bbYPOZji6pDmKFQ1U/WBCnKy6WRJ8fGtHmX1VDWKcIv9n
	lHH+ApeILImqRvMJWXbIy/9VsfsR9f5c7ZwkwTCQGob43LJtckeVa5hE+GlrZcxL67yVOu4eNiy
	ywCi4h9/fL2XaMlxpFKdZGMfmUx+u//BuJc2qDAbGwcB0OVyqQXn8ZiTEvto1e5PLwXOV3wBqan
	Kk3xuiP5KxuQ0j8an/Wdt4s8hOfi/nDyxoU1dPpbPIJJeUL7SOVmXZRvwUy8aZ
X-Received: by 2002:a05:6123:69:b0:56b:7cf0:cf67 with SMTP id 71dfb90a1353d-56daba1f505mr9011087e0c.15.1775635087925;
        Wed, 08 Apr 2026 00:58:07 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56d9baff553sm19625991e0c.8.2026.04.08.00.58.07
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 00:58:07 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-606045ef641so966044137.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 00:58:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVmHyYrRG6jzxlR4fjX7siAoMBEGHZMKZSqx2GClt8ZhaENj8IMoSYqUphKudQJKamBbYb3hVYvb7Y=@vger.kernel.org
X-Received: by 2002:a67:e718:0:b0:604:e315:6eb1 with SMTP id
 ada2fe7eead31-605a4e92bb0mr8578869137.14.1775635086837; Wed, 08 Apr 2026
 00:58:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327192425.438263-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260327192425.438263-7-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 09:57:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
X-Gm-Features: AQROBzCZCuwf6NF6rEXqKfmkxTjFfqDW2pSk-I-eqOP6g3EoYNQgB2zRxA-RYgI
Message-ID: <CAMuHMdXkh0Q0_O4VZ=DoJ26=+QiddsLi_CwTVwK-L+Q5zb6wPg@mail.gmail.com>
Subject: Re: [PATCH 06/11] dt-bindings: timer: renesas,rz-mtu3: remove TCIU8 interrupt
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Cosmin,

Thanks for your patch!

On Fri, 27 Mar 2026 at 20:25, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Based on the following pages in the User Manuals, the MTU3 block does
> not have a TCIU8 interrupt, only a TCIV8 interrupt, as the row where
> TCIU8 should have been is marked as reserved, and the GIC SPI numbers
> stop at 212.
>
>  * Page 486, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2UL
>    Rev.1.40 User Manual

According to the Revision History:

    8. Interrupt Controller page 486
    Table 8.2 Interrupt mapping
    The =E2=80=9CCause of Interrupt=E2=80=9D column, modified (TCIU8 =E2=86=
=92 =E2=80=94)

So this interrupt was definitely documented before, and I think it would be
good to document that it was removed, instead of saying "it does not have".

>  * Page 363, Table 8.2 Interrupt Mapping (6/13) in the Renesas RZ/Five
>    Rev.1.30 User Manual
>  * Page 528, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/G2L
>    and RZ/G2LC Rev.1.50 User Manual
>  * Page 540, Table 8.2 Interrupt mapping (7/13) in the Renesas RZ/V2L
>    Rev.1.50 User Manual
>
> Remove the TCIU8 interrupt.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
