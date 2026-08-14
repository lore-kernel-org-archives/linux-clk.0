Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001EE380FEB
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 19:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786735080; cv=pass; b=GHzUVIA5Mdr7Iphs3gjbgZHOO7IITzVpyWxPBA/9JW+BU/2S1k+NQNOWwXpvoPLob2x3o4qJGuZ8QWOpYWl2R5k5iu1In1mjTd7531SOCjF69vhXqVP4XAUvKxpWn2Vwt3UvnxXLURttY95FL+DuD3JjyGaR/kM1eDmp6/hqC00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786735080; c=relaxed/simple;
	bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a9aQmhe1boYMckFE/ahAa8lVZJne0nMpOKO4TMFf6dKoieyiMivVvVKMwxoGeScqIqlw6S84alQVbcba5Sl2JCdct8ZbcXWwf58pPD83R0pVJ1Tch4ZU95n4y7VFvetjSzZO8HNLKHKQElK9wRlevr/BcqgZpVvbkvFPQ1NtnHE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b+eWTaZF; arc=pass smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+eWTaZF"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4798bea72f9so875849f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 12:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786735076; cv=none;
        d=google.com; s=arc-20260327;
        b=VrNjSM1otdaDW4iuNUuxeujst5TGmeDSBbUutgZzcwpBH3Uim+/XW8yLFRFYnGuhBO
         xRmGn6iVrZgNF1syuvqpNt//eC2eiLPb4odABms2pJlhzj3kj0O/EHzqYd6p8bGWMHOq
         4OXD5VZf8BurhyKo9ohceoPDZi8WCmRsf53wS01ePPchBHc79Ub1ddQc6FSIyFTHTqvz
         IVahS37rh/qImnojstK3F/gBtuvrjl4y1LIVPU/PVUa5/JQov00fkCrZiEe6pUGn4ask
         gfNki1vbjUhEZe0kLBb1x3LWAXEtHq5T4Sq3KKcODCjWkLiLiZhafQJERI+0mLxFaEBX
         XmSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        fh=KvIwZZB9jT0hPkEK2EuMDF2bjKIS4KKOoLD2AC9OhqQ=;
        b=AxuzveJvwpknZCleXcD4i96MeSN5hkg/lh3x2lHEwuuUchTzO1lpehDTSAb2y+9vR4
         04Cnpnxf6b9pshK6cZlu7CqAgkzxyUSX+xUTI6BtKGrvI0jRKAxH+MlxXRxyMr7BY1d2
         nRAqxtJC4Y3H/+LNp8uVsjSNO+LuGr5/TE9ABQvwx1ewCWDZxYOauh3jmI3R6O+Xr2fS
         wTzOpTrxRziNErlGTaQXEk0QdKzidNiPxG6yu4g2cTA9TmbKs6Kuv9/CtCWskvWAsz6W
         Dl0uNbD3ABK7OnXp5XM+yKxcM1xavM4SN4uHyYKmXaY9OSv9aEToyaoNOWKDQ59WE38g
         LalA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786735076; x=1787339876; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        b=b+eWTaZFA7BFexx/TG/Aglvr2O0kTT+XkojjJFp0hnC3Na8a2kg2hcdRuI1hhAxG6f
         +Ydr9izSrds4TaJ1WLajVhkXBI/yD1sT5ay24GJZs1Z22w2f7cYWeeo8O01XUIhhX2cU
         rntyLj7w8ZMTm5JP/Bu4AM6+O/EuE6rA6lcJQjI8MLfxL+AR9L7oDq6Ktpmb6dCWeLNa
         SzUQC0fg8hUK4DjLHBbfEEUfrkuEjCfR53YxSo7NqnsQ/CBPmG9xjxoBk48tNQhJgw9w
         m003zFdmdrnxMkNnzTPO69+A4TfEBkYnknzcjsMXLTDZ5RjVvZTMJfS7c6djuTF/I2V1
         FJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786735076; x=1787339876;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGGqgyM1WQNtb4vbREG86MXa9sEfI8krzxGiO31xHEQ=;
        b=T+4Q9AJd9jfJyCzlz+1YD7pD/3ZW/IIc87rNe6r8aIr4lc8zW3WpOyzMuj9bQIFidJ
         wtrVayvFAQC9I1KuC3sZkyXs4ToatQQAIzmRbGvyr/x6NuFchniSQafgd3KNaHxgNB4/
         6xbVbvGbSO9B4c4bCDdF9JAv6bwq2JX31T9m10zbs8eaKaPG4SEaKxpUPtILSyx83TcG
         BD6gvHNZvKld1c1fWvqMBuE4vYWjABP+QnGtVG1BwZPHGaSXhDHOuTuMSLyfGsHIYbYn
         0UYXkcdlyLQBPflcStTmrV1mbh5lY8d+rJHYP7pA+6mJ0aDPWGypgSl2cGZCnyN1wbHo
         h00w==
X-Forwarded-Encrypted: i=1; AHgh+Rq2v/3uOjd3xzGkHpLKUSUrm05QNNJnikf+ZY0vH7QP0504TrP18V9rF3oe45B85vhEmJwuJOw0ELc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qdEZN0cR8MA0MRDysoI0x8Qj+bg/Spyxr9pToQF4LxOi5DAl
	AKsKpQghDErTyKkNSxL2mtJbt6xysSF7uwN5aOpEZi4iLKavjBGq3K1nrcLJGmboiT/4k9tPfsT
	yFIxyyp22xdmEMusKoJnWsfIPO/qhX0ivOA==
X-Gm-Gg: AR+sD13aEhHu9jUs9UkYkBUoY5Z8a2w41w1JG6/QgeU4WEM4cJMCS97fKSK0DjB/DLt
	XOWcNBSjxFGA55rdGnSomlARmuhODASRXQTvf9XpLRgGYTP6TJ9jz9ysuI4Am9tdfYPT9ubTa5t
	92Y7LgKbEAkYpKe/gHX6izZsGx3f+AQITvpZ5AecmZ/6f7LETmHC7S6LtU2RrxzYtRfNAPkvgkf
	08NBWm/cE4AUoXcjOXyTEr5gBMM5BVL2AFG9m32keoQOXakvxTwD9XGmO8foKeIAJlNaQe6V42J
	BRlOyPu1j86Q1upVbKbnzpz3BjCPkz9itDBGuOc7Yu6BsrseZ4h1bkaPsmvh3BnJIz3oQtRBahc
	7RgTU3rF5Seb6JMUDjyh7FmAmXiLtxlJ22GMZeaP1TOxLPnHcqkLXyJRLCM+rToYXYAXhrWd/7g
	==
X-Received: by 2002:adf:e38a:0:b0:47f:7b75:9dfe with SMTP id
 ffacd0b85a97d-481607a6b59mr10253177f8f.8.1786735075598; Fri, 14 Aug 2026
 12:17:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org> <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
 <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
In-Reply-To: <CAMuHMdUwPdPwKV++3GBvm_yEY0pqvT-KxBr==g8LQFRvZkBnjw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 14 Aug 2026 20:17:28 +0100
X-Gm-Features: AcwNN1U9V05nG8F5x6qoNhExsv1FilBMcJ6qkSKN_Tj9If7A8je8R5Sw1SnfcC8
Message-ID: <CA+V-a8v=jH3vtUUR-c9AEUJU5+YJrO8H7xC_S9LA3EvHMBEyWA@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geer,

On Fri, Aug 7, 2026 at 2:30=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 20 Jul 2026 at 13:14, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > > On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > > > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@k=
ernel.org> wrote:
> > > >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> > > >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >>>
> > > >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the gen=
eric
> > > >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> > > >>>
> > > >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/=
N2H
> > > >>> system controller integrates additional functionality beyond cloc=
k and
> > > >>> module-stop control, including reset control, clock monitor suppo=
rt,
> > > >>> write-protection registers and other system management features.
> > > >>
> > > >> Nothing of above differences got reflected in the code, so I do no=
t
> > > >> understand this reasoning. Binding is exactly the same as the old =
one.
> > > >>
> > > > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver=
.
> > > > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > > > pointer is implemented to handle the RZ/T2H-specific configuration.
> > > >
> > > > Also, as the initial implementation used separate device tree nodes=
,
> > > > Geert suggested splitting this binding schema off into a dedicated
> > > > file [1].
> > > >
> > >
> > > I still miss the difference. Can you point me (can be short diff) to
> > > actual difference in this binding?
> > >
> > Fair enough! You're right that the schema text itself doesn't differ.
> > I'll drop this patch in v4 and leave the bindings in
> > renesas,cpg-mssr.yaml (unless Geert has a different opinion).
>
> Given you no longer add a bunch of RZ/T2H-specific properties
> and subnodes, I no longer see a reason for the split.
>
Ok, I will drop this change in the nxt version.

Cheers,
Prabhakar
