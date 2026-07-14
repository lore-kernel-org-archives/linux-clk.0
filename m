Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472DD2C375A
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 16:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784047872; cv=pass; b=fhJ36EBJzqw9UpOGThToE1RwiType+Tm58t80Ckl4fORAy6P7XYhrAbMOzm7EZIyjRQCa/Ih772W78IhLoaf1Y/b3OMOw6uBGS7r743EREdhQ8FABaY4aPMbau1Ml81BSbPary8y4Reg7SkwQ5jiokO/1LUHgD5DwN4oj/4a61s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784047872; c=relaxed/simple;
	bh=UKuXmnxAZy4X4Zfjms3mGb3B8NsNDeeH3MZJWfiGhEs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XodvooVKeTyxHG/054xKPcsw4titgtVHBJg3Z9alnU1G8lWV/xr+JuDBDi/jly0h7lAzFnPCU469sG8Iiw/oLjjFHo0Zh2+w7I37E1ZTPQ4n8vOVDBdKkG0reCWDz+geBTfo+eo2MDvSh4KTCqmFh+u4EYZeaoJ30zo0TtXgfV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sUB+07b9; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sUB+07b9"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4798bea72f9so2476958f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 09:51:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784047869; cv=none;
        d=google.com; s=arc-20260327;
        b=sh5jfki9VBerELmHFA8k6tY8OwmxQxCMh2kXEKtrcMtYx1s2hnTxMRFXqea67AJg4r
         BiiYPHU8ckqN7QpDKC/esXryDL4eHvxP+sf4WIRtpLEM8qbOKnIpGcSlXsmZ7oKeg5N4
         rskmzHj3wJMQ8oy9mA4sF88ig6EOxav9GcUv+3+3EEqHFdIviNzi6LBW3lO30f6aRsop
         YEQIiCzE6O+v8zwJAy07rWrXI8bajvLddKBPWoK+gimhC+7IVa/PuYV9YebAD0iKeFTK
         4jgwV14nr45kzmQNm1tjTKdxQNMUIr2X4WnuvC6uo/0woG4bZmbxKmAiEj4C7UseGcXk
         sF+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        fh=cWe1oY32RrtKi+Wu5IuPQCdqv+aRghDHkgh6xC0mofE=;
        b=gDBcuPSxQq7mKrJPL/szm1bRfOed+2Wpf6FnuTexrTk8sLuzDaDCGfLSDcyT+21iMq
         Istgol/U+LQrb/Bry0ZSrfqQeLJ5kqxL7DyQP3E9U//DncVB2nWmaELAF6IKH5k6Yo1z
         dfIOXaP3yA3hX2JUty2Wo/jpaxbdJrFL1EtycXfdyLIbXHjIxSJdEYIFrTgLyE9argpE
         Be5bQbmMxBl9K7zTk677ayBJvZSeSnkcqDXkSTcLp+SdZBbHsbxKrqRF3Mqyu0jub/cS
         uV7UgHeCr3rL2KaHLxOkG7Yl7JZ1FegNR7AhlD+vtupqn3kJpk/oIHb7JACh958V25qU
         hxGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784047869; x=1784652669; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=sUB+07b97KGV3ebDMkf0d3LU/JbugGI5wAiuag6v2+UK398tluefGUR03Qt2NGVOt3
         poU3WOZaYSn4pp7yER5a/Tzddw/uxLuMGI+r8BlwLUNOMQpmkEYJ5fOQNP7Rp0zMyeDI
         g4deAY34diw6dPfpcjDMqPsuLXhuI+1fX4H8oicc3qt5mN0Dw6/KHBTch5etD6Dr3LpF
         Vo2XBs61rXFmCWC82PizuiU7IC0sO4juLej9ZePmzKnC3CXA/egtX60IONCorzuqrqx9
         t+T+fSoyeH3ErkF+ezlR0c7Tqpx+FocK+eTnhmz0ZTOTUYKAOcZUUqLhbFWff6hiTyhq
         fFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784047869; x=1784652669;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8BlgmiFQrHiuTd+MM0CeF9cu80lrra6/Pp38WzQSYbE=;
        b=EiQZ9IH4kIe6/SU0mvrkgC1OeBS1vQrK2oiLi2lxBpE6zenn+/QGw1+d6v9fJ1hV6t
         W2vJJJrKX9U3C0lN2+x7u89S12FLMfFj+I+zf7uO6E9Thp8HDqkXdxDwVORYuWowr39y
         82x/gQl8lMfwV2Mz3yqejS3w9TfQf9QVcxW0ab8BRvQ25N3IgrThTfa0Kuwwc9vg3elz
         UUCNT4sA9tQdfhqgONnkodETMGEtTqW3HnAjZIE2lDn9qauuvQXeV0H7iTq+WO4SPZK1
         x3vb84kk4gN6btevcaDpdnPUOWDrN4UWiafeYgqhs5Cu9bH3zdGYBvgsiJac/FSw9Zu8
         lsLg==
X-Forwarded-Encrypted: i=1; AHgh+RqaIxCc8MATaWwS50Rq3bfL66fuOi04VcNpFLJgzT3cNUh9IOl1kEPPCTJoez9dJiyTsFQAcJlkHbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZA5oz68JbPUe4giIhIPDYLU/DJdYQ15MDYAbATeWUMVz4U2ty
	tRGkEaiAsxDBQPlzBtHb7AaxUvo+yxVn5eZ2Si+efTJnTYAtpY3OZUu4Mbxo352G59dr7/tw3FL
	IA12e3NjRKEFnaIBv98XaClARwOGKGgE=
X-Gm-Gg: AfdE7cnJRT9cNM/s6S+VcDEf5lpq61xdghbrx7CyHnHegLQup1vVlm2fFhSulUg07ff
	9X5KtfBUxIn0VTqaE/ED9t6x64Vg7fpdYtkNZoAn0JfQM98x3hHpZrVpEC8Z0+LCxILpjhYtkN6
	0iGzmZkvqR3CaLPjHtKbsG9QdT5PcgqRTl0Pcwo8I/tDBFu2UrAlnmXnDZiYhfsj8lh++/QfFLG
	G8v3dWo4orYCHJ29/L24V7j4DIqhzN4hM7GrPhmdqCuwC36CqSzqntBqlmIXgiXC2Wwk6x4nIGX
	33+np4Y/+WpixjP3mhDxrvNIcJHxkx2E9ojZ6GfSmWUyia4O0zt6VpGqvZnWzU3t53V1nA==
X-Received: by 2002:a05:6000:46c2:b0:47f:4c49:4318 with SMTP id
 ffacd0b85a97d-47f4c4944a5mr1473055f8f.49.1784047869366; Tue, 14 Jul 2026
 09:51:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com> <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
In-Reply-To: <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 17:50:42 +0100
X-Gm-Features: AUfX_mwxd6v5gFWCuMlhAPL7PON29wGJJEnO7K61SQDYcZ5CBYFFPz5abzgomRI
Message-ID: <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com>
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

On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> Thank you for the review.
>
> On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > This series adds support for the System Controller (SYSC) blocks foun=
d on
> > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical low-=
power
> > > management and access control functions.
> > >
> > > Hardware Architecture & Dependency Challenges:
> > > ----------------------------------------------
> > > The SYSC in these SoCs is a multi-functional block responsible for:
> > >     - Clock & Reset Control
> > >     - Low Power Management
> > >     - Clock Monitor (CLMA)
> > >     - Access Control
> > >
> > > A key architectural detail is that these SYSC blocks are physically l=
ocated
> > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Software =
Reset)
> > > address space. While the CPG/MSSR driver is already implemented and
> > > functional for these SoCs, the integration of SYSC adds a layer of
> > > complexity due to a cyclic dependency:
> > >     - SYSC requires CPG: The system controller needs a clock to opera=
te.
> > >     - CPG requires SYSC: Access control registers within the SYSC con=
tain
> > >       bits necessary to control the PLLs managed by the CPG.
> > >
> > > If implemented as a completely separate top-level system controller n=
ode, we
> > > would face a cyclic dependency between the CPG and SYSC drivers durin=
g the
> > > boot process.
> > >
> > > Proposed Implementation
> > > ----------------------------
> > > To resolve this, the SYSC blocks are represented as child nodes of th=
e
> > > CPG/MSSR controller in the device tree. The SYSC regmap is registered
> > > directly against the CPG device node. This hierarchy correctly models=
 the
> > > hardware address space while allowing the drivers to share resources
> > > without deadlock.
> > >
> > > I am sending this as an RFC specifically to get feedback on the
> > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > dependency cycle.
> >
> > Personally, I am not a big fan of subnodes.  I assume you are using
> > subnodes because you can register only a single regmap per syscon node?
> Yes so that the consumers don't have to specify it by indexing.
>
> > Would it be possible to just extend the existing clock-controller
> > node with two more reg entries, and expose them through a single
> > combined regmap?
> >
> That should be possible. Or would you prefer just to extend the sizes
> and create a single regmap for it?
>
>                cpg: clock-controller@80280000 {
I wonder wether we rename this to `sysc: system-controller` but the
compatiable string has "*cpg-mssr" postfix.

Cheers,
Prabhakar
