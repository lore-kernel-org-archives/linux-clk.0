Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E6F3191CE
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035653; cv=pass; b=kGFilzS14XtyaJbPw51aPXCAKbZS0SHjpyYyxEBc/N3wYtLLm54gWGN8+dyP/nOWnl+SFiBj5f2HuPuCRXmrofwf/1pEoPQGtLtM6ifCHmxqmDfK1++BwVExLZmR+qrJgsEHBfH/aVjgqy+JbJx186AdExBHpwCZuVvxpnLqHO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035653; c=relaxed/simple;
	bh=JwVJDiR+cBjS+r4fEWc8OMyrK+FkqxIoisO4S0dbaKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icmCjLiQPeMQk4fd8exUDyN/wT8H+lF6YarjD4iYnO8NvV4EDX182jczGNQsNkRhVSnDs3FW0ycbvwD8aQOaKEZAL5MRsyCoMo2BfI2ZMe9Aos3YOKSOcBgzoGLylt7dBrT1raZNav+XMcLJ19yVNenr/7L5eHGBlK3d+PWdpjc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gd1aObQl; arc=pass smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gd1aObQl"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472326ca506so3534236f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:27:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035650; cv=none;
        d=google.com; s=arc-20260327;
        b=Fwmo1/3vwrrHxXL9c5pEUpzIPEzMqBli9ruOSJc6RRRAJST9hi7BG4VyDdFAFePKrn
         YJpruqeruVuGYZ4pj97SOiE9ipOtYBhr029MSOzncYj0tiFpRCrUORYAqmXjodxVe8Us
         N6UNBYv6K0fiUCzx0FCeT+HuWRDYzxGGCfPqr7eyk4Hwmlq8UITXVSet+VcGUrDqACzu
         bKT1C0CEz4L71Xuf7NmdmKZAdx3TPCNWLyC1UfEomMK0mZZNfTlnPR04xg5lc76ARx2I
         yJVeK9ACmO+8oYixEi3Te400sr2Tm2ssr/Gud4+aKih6bhDcWuTj8JpKHqLvr29BKsDr
         pceg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        fh=h4cCIv+Tma+zlXQj00qwpumR4ZwFFn1ebMgJOJEb2aI=;
        b=fbyaCv58WPoKIcWomv0x2de8dj/iGX709rMJBQGPTrYgjufEc/HvGVw30ZhpwMsaxI
         Ye8praDjTnc1gaIQBayVO0iRt9/OpALl2orpF5QO2k4mW4Jgsp9QF5fqahZBtLZRGc5O
         wA279nXFcDoWo2KYolaugOmwh3+vbpuu6QAY+3FlEj1LWD4PBSlGBCnzk+p/IAMLYLUt
         UzqqOQg8HVZeabLSN3k41KV6jBZXNZHfGXhCWiOuYdN7NGo6aM9EXgwfS+F4xn4FfRK+
         dO/cTpj/pyyynmUEBDdsHAs63joo2+0Hbs+LjhIfmVHv8I8eZRwJrg501wOS9cbQ38ai
         mOnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035650; x=1784640450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=gd1aObQl+qjxD929Ebl9GEw5vMjRAD5Ra9FjKX70snWGrmmHxmsnIeVpMD18Erdzkp
         UKkux6CpyLniULXKsfExXEZboQQVJkbJeBHN/C8OmQTYdq7wSEDnf5sj0EdAIX1xDPWH
         45N61XtWPmVHa1wbOEUhCtCTfUfV/BiihBjoUjZMsm5ffpc4a+NttdzMekEBufsYzzYM
         q9lRJ6931LUKwD/wZDr8+ZkavKK7+vUJX0St/6vsN9ETG2Fnr4macCZxiosPf4iC0Ojh
         YMF0QbXrxTkWmzl5LCmZkvMdEteA7C0TWqyYda1VrNJmvlxsro2+WdSFl9sW0dDvtlJh
         h7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035650; x=1784640450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WRj5C4BZ8aUAwy0UDz9tsH2p/apYNMhkYQtruEiLUFg=;
        b=XJ3isC+qPK03LXxz7Qmpvf1ANYco7DuL/tVMsjpMut0Z0e7LEEuI3EuOcVUlU03Ii7
         5tVBtvGg6sxEKtlNZuQJKlfn71oP/KGEczehc/gEca+pfLa4x0sEnLpIqfAGf/k0XOmK
         PHTQyU20FU98CiJwp+9kOOB8wZma46b1w/WAQ3TmEfDzfhha8d+dFdRlv5xmRGDnnllk
         jx9cr8fZaLSGqTT/8tlEOYsqMahT1FjzUCdQaDNFkwlSrmx55o5TyOiLU1p0HmHw/r9Y
         JWIYFKXEZ0c7vQt84kG5lVHTHJavu4OWMy6AheBVkLOg4ySnbR3GI27LcamfC2QbuhmP
         MSmg==
X-Forwarded-Encrypted: i=1; AHgh+RoGWRA5KF94X0qm5uDKBOGIxiXf5TnNTaKKqhEniZG1DZKuPkcrV87XZmqfehT2fq9NInT8FshD86E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRDmw5aNhYYUkCnQavVcESH2Cc3PZ7Pm6QULuog3dLor2TdbZ3
	21fm0v18rryYbSFWf3dPR8tw3zz7Oh9ZEfvjQ6aXrJe/abqZAy0QmNbgSX4AM6Tn+l2EEFBkBC+
	CzxLjCbemM1U2UUGbAObuG9Sz8NS4hnBadmNI9D0=
X-Gm-Gg: AfdE7cn7MqWogmq5dDzUxfldka+5fakMWcIQ+7X09OY+lTho7dWKk/wHOhoUWjwesQg
	rctrOd2awYuoC+x9RWEn10OYoPKmdB1ilTI+oaV5P0Y+E8uy/OsyPCoyOH90rkmi+nIwc8LAnLu
	u6x3yONH8iEDEkWxe6UNa2NDW46fdB3qs3QlWyI/p+fDOjxZKWXOYYfS4ekVQD5uOrGeXaVVdu6
	cKfcZI5SUQwLtQMPu+HqAfe9mi0rdQWUHQfN6c00PCkHJ2Zl1vvaOB4dzj3VVUS2RWjQlpr+gVI
	TJa1nMcCx4QQP1/07peRLRfWODLwU5Itkcy2TSt4LWpTeCXqL7WP1FLQPkGxXSbjwjzmOA==
X-Received: by 2002:a05:6000:4693:b0:47f:4650:e45c with SMTP id
 ffacd0b85a97d-47f4650e4e6mr3694089f8f.12.1784035649771; Tue, 14 Jul 2026
 06:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
In-Reply-To: <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:27:03 +0100
X-Gm-Features: AUfX_mz-bUh857aZKLRp6jCySBSNe_W4CR-bQsVZRSwNXqRoLizYQlsdmvEfzQc
Message-ID: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/9] Add System Controller support for RZ/T2H and
 RZ/N2H SoCs
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > This series adds support for the System Controller (SYSC) blocks found =
on
> > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-po=
wer
> > management and access control functions.
> >
> > Hardware Architecture & Dependency Challenges:
> > ----------------------------------------------
> > The SYSC in these SoCs is a multi-functional block responsible for:
> >     - Clock & Reset Control
> >     - Low Power Management
> >     - Clock Monitor (CLMA)
> >     - Access Control
> >
> > A key architectural detail is that these SYSC blocks are physically loc=
ated
> > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software Re=
set)
> > address space. While the CPG/MSSR driver is already implemented and
> > functional for these SoCs, the integration of SYSC adds a layer of
> > complexity due to a cyclic dependency:
> >     - SYSC requires CPG: The system controller needs a clock to operate=
.
> >     - CPG requires SYSC: Access control registers within the SYSC conta=
in
> >       bits necessary to control the PLLs managed by the CPG.
> >
> > If implemented as a completely separate top-level system controller nod=
e, we
> > would face a cyclic dependency between the CPG and SYSC drivers during =
the
> > boot process.
> >
> > Proposed Implementation
> > ----------------------------
> > To resolve this, the SYSC blocks are represented as child nodes of the
> > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > directly against the CPG device node. This hierarchy correctly models t=
he
> > hardware address space while allowing the drivers to share resources
> > without deadlock.
> >
> > I am sending this as an RFC specifically to get feedback on the
> > implementation of the SYSC as child nodes of the CPG to resolve the
> > dependency cycle.
>
> Personally, I am not a big fan of subnodes.  I assume you are using
> subnodes because you can register only a single regmap per syscon node?
Yes so that the consumers don't have to specify it by indexing.

> Would it be possible to just extend the existing clock-controller
> node with two more reg entries, and expose them through a single
> combined regmap?
>
That should be possible. Or would you prefer just to extend the sizes
and create a single regmap for it?

               cpg: clock-controller@80280000 {
                        compatible =3D "renesas,r9a09g077-cpg-mssr";
-                       reg =3D <0 0x80280000 0 0x10000>,
-                             <0 0x81280000 0 0x10000>;
+                       reg =3D <0 0x80280000 0 0x20000>,
+                             <0 0x81280000 0 0x20000>;

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
