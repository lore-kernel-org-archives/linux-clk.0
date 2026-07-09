Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 667CA3FE67B
	for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2026 10:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783592676; cv=none; b=G6f/eoIDlO2sJUqNWkKKPx1EenGIU9ZEAPXpPhYg4biHNsETCZ9pHZqkadtn4LDdF31bblZ/VcnBsv2/7rbtjN3RHztvGoqm9n2mEyIfUy68qYWyC1YbKMX43b9AccdZKjVqQVw9izGNKXHr5aolow1PYGS8aS/XPA9mabDKcTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783592676; c=relaxed/simple;
	bh=FxUfzWpCleIQzfr8y72a6t+Wi81Fv5S94Ccqz6vyAuY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bfc3AERBBcgFMLdmqTJaXJTa7BJC3OneZViFukiUNFJTd+ncBO0xWXTs77P05cwxOAcnSfIop39OOWzoatVxs5dqt55/Eo6WHX4/LV6IZTKN+dfeBZnLpHtNnD6QyanVKa5UhR/pzE92hQx5//FEICLh+4dZMKWzJzkbWYKgF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5bdcbb1f3f2so888886e0c.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783592673; x=1784197473;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s6cZ9HNvj5euq2IsKqnGtW9n38TCf44UpefkQ/0EfN8=;
        b=r5DJEXgkPYvR+C2isf5YO/RDCS52xU4LeonFvgeUbcv42Xl/cJFBwS5RLn3sG+UG6A
         PXf4Ifl93rSGgineMvoKRvC1LhKBMdgzcHV83GAmuxsOJndL+7+wYn+HbUZSatMy0+xS
         +itoGdeZZfz3PwX7L7vm2lkLK24d35vW5HI2ju3OfuBsv0T3f+Ei83dJAHpPuu7tg3bQ
         b5zZTOUvTScJJYni8FQZQKKM53cA3g+UTfljLWNuW0qLH70YhHnQH3j2jl3lGUuRNTVK
         98kWNfMsjgJHsqJOdJ7gl3U3VKw5AY1NKU2mCs6D5Ad23FBiCKXUrZOHo7i79rkT5PQV
         OhfQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdlO939IeGMvvsSqNw9tTj56o9m8c4LrcFtCR8Vx3nHYUVeZMY93zct5XOhmyyYsqy5VxaYGhhqao=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgeoCIzYNmUGXgQaO/2S3r1lFKbio0syKEBNabBO4CFg2yMf9t
	VG3xPLIY9MHE2xduAKyqP3B2dBP9GZWYbJzGz5tQXggVW3sQaKeXL+noouNWRfmiwEc=
X-Gm-Gg: AfdE7ckk1mDtf5O3U5Tdf4fnaUjRv/5woZEMqX8ExU9YRzhRg+SNP+AFBQgO+umgRIM
	lew8ZaJjFVzKy3C8DD0DUvFIuBuqnRxD5aK6qSwPJ8j7ET8yL2vDsi6QeG9Y9aJL9dTwkMTpI86
	bUlR7lTnkyYDI5Jv73o8K6oIV0iESpnZl9XjZ+u9u2ja1fx7BXMlhPZA2wnydvcPX1Z/Ry6INJl
	d6v785UrAqXVFvf5lzeXflwdGp8DbX9SYZQCRgsVcRwlb2/jF9lxJ71pV3P1BYAjwG/hn7fDqDA
	Vk/fZeo2MGW5VF18fUfiUZ26w9GwGEn2VBaKZYVk65W2xMwW7zx6EwGcNKHuvgzSk5Z/Su6TiiT
	PWmgGbtAes9n74MW/Di+xmeCe484E1NwFVpCKx0eXIFDNhG98ckEwIcA2b6zyzv0VVShNTSZRio
	ljk39UVOKSMaoeKPXwGrcMDvlywajPoUxac34rdISpNxrPWgr5/Q==
X-Received: by 2002:a05:6122:510:b0:5bd:9c71:11e with SMTP id 71dfb90a1353d-5bf75d7d598mr3981678e0c.4.1783592673272;
        Thu, 09 Jul 2026 03:24:33 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bf6f5e1191sm3253528e0c.4.2026.07.09.03.24.30
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 03:24:31 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-73720e58dafso715136137.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2026 03:24:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqJOHZvkfeYWOGn1Gf8kIjbIHb+ggiGVhDDN92WdyyhwRExnfOSk2a6kFQUuV2F1xAcKOEgFX3lsCs=@vger.kernel.org
X-Received: by 2002:a05:6102:94f:b0:738:531e:a43e with SMTP id
 ada2fe7eead31-744e00634cbmr4111626137.7.1783592670751; Thu, 09 Jul 2026
 03:24:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1783505142.git.geert+renesas@glider.be> <dca2c4940ba38b897f04b6fb67591de9835900e1.1783505142.git.geert+renesas@glider.be>
 <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
In-Reply-To: <59725f93-5269-4b0e-8633-48821219877f@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Jul 2026 12:24:18 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
X-Gm-Features: AUfX_mzHlNNTYZ42llQz3ksPLOjU-3fWPe_bQZCByAo9mLJpSl17fS0OhOffgPc
Message-ID: <CAMuHMdXCooODm3YuE1JjZJAc2BeQuD==kWbA+ZzpXRA3fqa0Vg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] arm64: dts: renesas: r8a78000: Add MDLC nodes
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Ulf Hansson <ulfh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Wed, 8 Jul 2026 at 23:56, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 7/8/26 12:15 PM, Geert Uytterhoeven wrote:
> > Add device nodes for the Module Control (MDLC) blocks on the R-Car X5H
> > (R8A78000) SoC.
> >
> > Complete hardware desciption of all (H)SCIF serial ports, by linking
> > them to an MDLC for power domains and resets.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> [...]
>
> > +             mdlc_ddr7: system-controller@e8380000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xe8380000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_hscn: system-controller@c9c90000 {
> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0xc9c90000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> > +
> > +             mdlc_rt: system-controller@19440000 {
>
> Please keep the list sorted (0x19440000 should be before 0xc9c90000).

These are sorted by instance (Module Number), as per Table 18.1
("Target Module hierarchy of Module Power Gating and Module Standby")
in the documentation.  This order is indeed a bit odd, as it differs
from both alphabetical label order (unlike e.g. hscifN), and numerical
unit address order...

Any guidance?

> > +                     compatible = "renesas,r8a78000-mdlc";
> > +                     reg = <0 0x19440000 0 0x1000>;
> > +                     #power-domain-cells = <2>;
> > +                     #reset-cells = <1>;
> > +                     bootph-all;
> > +             };
> With that fixed:
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks! ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
