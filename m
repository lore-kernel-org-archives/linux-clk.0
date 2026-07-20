Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655013F54D8
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 11:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784546059; cv=pass; b=niUsPW10VOuEC+56tKsJ/xU9e+1Gi1eusaa3zKSaX3lVeBAbjS8s3Ozogebw54QQSN0LN/O7WX1iqSw2JuTx1kkclp3x8glt7QExg4lcE5o7uSy5oHNCnF5cxoTZ65GC0dUMI1yBnUZf5A4JcZh0wUOOd9bjBu6rGz6+qvA8Pck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784546059; c=relaxed/simple;
	bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D2gSC06SN6yTZ6oG0YHUMBwssI7x2AnNxYroF6PeF6W2mDffk/WQlZgfRDLoUGNgKdg7KP6DhdckuAOxMBScYCzZz9xUFaAbnCW2xxi8+AIRFJphvE+SkVzQ8Gm4+0U2giX7WxJcQ73/NzZ8lCk/XxxH9b/K3h98L2C2edyBX7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/SxvIXK; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/SxvIXK"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so4949477f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 04:14:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784546055; cv=none;
        d=google.com; s=arc-20260327;
        b=s2WArdMmxAoksuiybj8Ov/wkOM2VezOA45vQ1/H89JRCLjwVquqREGq0yDr4mR1imY
         DNI+1BLQlCAFcggE5e4bTKi72PpC3weUMuFxgSNMiLJKC47tlFBn4QirNXlC7mKZE8mT
         OE6WZgvNgkFJAG0cNRqVhJIaRMSosUVZY0J7GG68GSKoiEi4MEO2Ff1DY2iGn5XmpHJG
         ZsPLDnu/3V7fSe6G6/DD5uixm4/8F8tOgbjjuyP2IIOGa4BaoEHrxjFsYqRh6BcBWE5p
         uaZcqGTwVL0bzknEkWZ3rVjHxUbOsZb9STrG1CnH8DI5MfxvwiCU/2/Eu+hSEltNbq2v
         FnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        fh=A6Ec4YkQPylMwpfNuVgTCKzI+8ujXNud53r1M6Y2Jgs=;
        b=aJlFz62RJz9rj/ABB8A2RZ37/DYtljbeRdhcG5gCwkapIWZ+GysxlNRq067xmwf9tL
         y643Bm12pGjJJddkVwhBP061VUePkgnppTngLLw11nlLO8N5dlwOQID9xhSKEnpFrNAa
         iKw0bVZrWImJRpWYjf8O3w/j0Yw9hQzzQhzJFCaNlsC4u2X9TMoJ/XDON+F7HxQrgOD6
         Dx7lDHedt3WKJF2LRl0qXA2tuYa9xhtCQomO+CKzwCckC8d/NcA1SB1X0LScv+BDlDbJ
         J5Ici4gR+RXOE8az5MTjIVe7JQcBijGzMp5BfWC5qsX17rsIJIxc8EB1lmVwlqd2ML0g
         11pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784546055; x=1785150855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=E/SxvIXKg5c8UoFAOev4ivn2y5aMFjX1UTvNBHABgd/ZATRyBfslWYKaqIbhPmvov4
         4NGbLWHAWVVDhxW26j9hE5bSVUdmE7YT1Ax8DQBvKTY58PYXmhwSgaWuxt1SnVbv0/Lz
         TPDHz0r94JdcnEBOh9qmJO++3n5X3uX6q8PTSO1ZAvt7Ib/cqmuDRfAbLeFEIbKbeqbi
         aRDFykKylQNtbOAbCOkjI2CJRu+p5slbh1xjRcdufryZ5vVZb05yW+kr4L866K93jrtz
         Mg/3RamfvagCadlRlXlNzcnffgz+n21/5N44YJMutj8dBZ2segJFX/M34e6sW+BeoZ3e
         qF3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784546055; x=1785150855;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lN5CgOEVOZ+tQXbZyCc0JqrYccxDAnhxj3hOkyWwzFk=;
        b=nAx4FBqYW9Y7HK9g+5enAsejrChrUYQwKhRwps86od97vi0sPoOgu3ER9iVCdOVred
         5pjiy/4Js7rneTuTXi0uRWDy9FQU2FHh1uZBSh9+DwWdhczlKhaSgaIm/5S3MeA7+0Bv
         +BjZA3q8okX3Kd1h4z3Tp6FqMfoOvS3+HI0ILhD+M5Wg/rb7SkHkwFpGWPHAjZ2BEhUt
         pIn4FyPzjJn+kOSp+c/whgU/vCAnK7CBGx7oa+zM/XO2/7Y1KWCRQNoMidobZWCUH8/e
         7LXM15Ma5HTAQDSRfohybgrH5sjhh2ujX2TuyPvrDPsNvhvG9g2KZeKqik6LuyqwjvXB
         +ZIQ==
X-Forwarded-Encrypted: i=1; AHgh+RrzcepyULp8DNVnvebQAfxu9+3rzl0bKj8ii/7Zw1SqKKVxljWYQv45CwjTYJv4GDuCdU3HaDvJE2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrtpP++5ws89VwkOm/C29/zJdzmnW2jJvs/XItNnCNKbLRz0ct
	rjFXUU1ASyPREBFpXqyRJjmytvLxGRbhJOeAb3SCLuULNykKoFgmlHLjdhd5S/gryOUbu6NQeuZ
	10G9i8NN9HvPlXKjj9R8mwfl4sYidReo=
X-Gm-Gg: AR+sD1056nRprHaPvmRKg+C6twj+zTrmY3GmWHml7GqwEdzTN0Zb7XIiw1C5NglDWlQ
	s0XiOl+HmgVRtM2qwt3BHVPiplZWdu5JYRHdT2DME9w5sp1R9YB5bCfq/9S3gBj/VWFJ80e2ED6
	NuWnTmlaBCd4P6UE7rQ7CO7LBAqW7jQLqtl0HFj05ZPC6qn3Cum3BvZ11EiSJEPAjCvOZFzUC7J
	qnL/rOm8GKZSfCyr9bLfvPwOFsW7DailgUusc2qR68+mGrqn76WySHHsg07NdqfRAMkeH4Br5fN
	qYUmHove9I3rNV0payaEltwZox+1mVN2QkmwLR4AyCPxAPI=
X-Received: by 2002:a05:6000:4912:b0:473:1ccc:15c9 with SMTP id
 ffacd0b85a97d-47f6232249fmr14608346f8f.40.1784546055157; Mon, 20 Jul 2026
 04:14:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260716123434.2576253-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260720-fractal-prodigious-spoonbill-86f534@quoll> <CA+V-a8tfCL58j2TvoO1VhhDAZf=8LB89R4O0SycLghYGf7Rr4w@mail.gmail.com>
 <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
In-Reply-To: <2323f9bd-0b1e-41be-8c8d-6906b66b625f@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 20 Jul 2026 12:13:48 +0100
X-Gm-Features: AUfX_my8cjMqflKYyG4hZniXQBlddlP-o7E0L6c407-AbtgLj1LdUoaSU0sykN0
Message-ID: <CA+V-a8sHbc9WSqmzrONjWbLY1+SSEhK3kGOjL9zmVmhSttD31g@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: renesas: Split out RZ/T2H CPG binding
To: Krzysztof Kozlowski <krzk@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
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

Hi Krzysztof,

On Mon, Jul 20, 2026 at 11:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 20/07/2026 12:50, Lad, Prabhakar wrote:
> > Hi Krzysztof,
> >
> > On Mon, Jul 20, 2026 at 6:55=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Thu, Jul 16, 2026 at 01:34:27PM +0100, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Move the RZ/T2H and RZ/N2H clock controller bindings from the generic
> >>> renesas,cpg-mssr.yaml schema into a dedicated binding.
> >>>
> >>> Unlike the traditional Renesas CPG/MSSR block, the RZ/T2H and RZ/N2H
> >>> system controller integrates additional functionality beyond clock an=
d
> >>> module-stop control, including reset control, clock monitor support,
> >>> write-protection registers and other system management features.
> >>
> >> Nothing of above differences got reflected in the code, so I do not
> >> understand this reasoning. Binding is exactly the same as the old one.
> >>
> > A syscon regmap is implemented [0] as part of the RZ/T2H CPG driver.
> > Since the RZ/T2H clock driver uses this syscon wrapper, a function
> > pointer is implemented to handle the RZ/T2H-specific configuration.
> >
> > Also, as the initial implementation used separate device tree nodes,
> > Geert suggested splitting this binding schema off into a dedicated
> > file [1].
> >
>
> I still miss the difference. Can you point me (can be short diff) to
> actual difference in this binding?
>
Fair enough! You're right that the schema text itself doesn't differ.
I'll drop this patch in v4 and leave the bindings in
renesas,cpg-mssr.yaml (unless Geert has a different opinion).

Cheers,
Prabhakar
