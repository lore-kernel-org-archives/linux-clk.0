Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E561D40313D
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197753; cv=pass; b=Nu9PtOOM4jBBfL2+TyEKjIEFXdzgwtghFnzA/+1607laDbOHPNEyIel0VsZlhni2Te7aSB+XRPEDScrxAlbrarpqylbctNIc6jkvDgAOaGJocPNEC0zkQfh/mKegGKgER+A6FHSyXg32VWWIyv+o+3oEYfrk0m+81CvnxNAg3Ww=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197753; c=relaxed/simple;
	bh=zfnHsn+znD5AFRoID/3JHCX/8uoL2W1bVn6UdULEWAU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLF2hTLWH0OT32shPLD+cZG+fMUkmKlLf3WCJi4Iff3WZGycfzEjR8+ipqQkwNOfknFwbZ5Y+3+ApXODuVwYWa2NN6n0q6ts0ZSpiH7UKvcqN/bWUTH/ORhx+mgOWd37tZmG8/HOY3CNJfjpE+k11a1STJQWPyrqNk2H0DGkEhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h/+X0VT0; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h/+X0VT0"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-476d8e647e9so5994206f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 03:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784197750; cv=none;
        d=google.com; s=arc-20260327;
        b=bShtlIJR5hyUqkHUMcnUD9+IbnVL5ADTuP+hldV+ZkyDOH9N81B7hiA0Lh9pgbs1QR
         p0od7IjCm+6ziznjg0DEWWfueKXGKHVbllWI7j+qnFDi/XCJ/V1hp90ec0OasKyev+ax
         MWJmvNJ5ItYIzvmhJBLVTb2QCBMWpjPTqHTSwIvGZQPdrkSlNokD/TmaMZp2OoxAGyyJ
         xAjGZsvBCO9E46OivQJLlYFV6oLOwjlYXcLn4jG60FAfGIE0rInw0hUtsdWKub3GaRci
         bMiEYtVz6v3c0pMOsQ5K7INC1PAL8PFypAbp/GkyYJsAT2KElOso2eJqo8nucbQZYJ1m
         fGNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        fh=9LIOcaFrzHthAs1DzHfQA4uxDvpFDdVEc100pGe8cF4=;
        b=jSYZqKlulnWv4XKq2ZFvdB6DSBhbUYy8PqVkIRzJUzPWa/gN+B/ixbLDRtsD8mRgLA
         0sLq4jhhA/vKSSCQr+rGDw2gDH43OxoDGH76zH2dGKR0sRmAqTVz5sAqVARy67FFSPoK
         e16xnAHQm1B8P76k9ViTZidZ0EU8rWytWP6OINd+6lE0oV4xezhnTSGEIbEJ6WR4rj4V
         AxhN03CxzhVEP32SnCIufRQ4XUddke+ubdSTx/B0YKRzqMBQ9xK5ABR/4SmMTdUTJ4rP
         SHAcoyXYPUO7lsEcs5LVFPWuykkbUs3eMawPee2pbsDhIMhuXBIP0KqJpu0+7WRkHrco
         ePWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197750; x=1784802550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        b=h/+X0VT0PvFQvWnZ7Ol74Iq13RC3boYXbVXtNh8irtf/YdGyvxLRzUB4w4uiy2To4/
         a5VGh/NDKx0XIBj4I9bTI+tBCS54GGoOwZLvdXWnOnSGd6yjCL4pAYmpND6U9wZ3SYfE
         7zv3dl5jw73DBSrJ6KabTuCFvdb/QEgUXrfa3CNzaKq/80rYJeg/Y9O8sr+kMwRjssmR
         9zu+a6/7f/rifiv31eOoA0N7bmfPIb4EtscWoAu2yV/fiIXIou4UclRRgS2c1DoIy+dt
         A6VCyLplrCX7vSmxlovU5Hg2qJvBZ9Jd9ADm4MmXIp9d+DT1yt0G0dAq4UMV6Q8LJ9B0
         Xxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197750; x=1784802550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F3mAXX4i2+9mnOYdzawa2y57JdnamEA+dV/8zm0oM7w=;
        b=G9TwlsD8u/ljcopyNN6FWgSwxxg60Qdx1S4ev4C3m6nNnlr/RLPPLDqwCgS72B0Foh
         zlUtZVmUurGbW7L+/3UlSh7Ri6T6eT1rzEbwi4v/BIrGiwazRGlX8p2bKdqB87forJkH
         rjaW9TAas64ALOWneX6KzuggO3OzeXQff3B9heUVeBNaF0sRjgzYoiKvJQpvCZ9COx7t
         bX12UEt6Z/ZQ6OEJASpFzO5HiDiTOnKKAgSYNP326ueMJUTmpJ5cywL8JDBOlpojqJ02
         WT0Me0IZu720xm1IPpoowM8E+wXhWg0jGtpToQZLmYePc2kjUcnIQyqBHaXYOgJiJnG2
         axcw==
X-Forwarded-Encrypted: i=1; AHgh+Rr0ADRnUux7U3K4ev++mm4yP1m5lJPwPBsO4wemxyO7slcQY9nkt9nX38ixYZFDiywlxn0G6baMrNY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp1GWoCsRyIKR6RAB7k07R/NUG1Va6QPMZQkTRYciJ3TPXRJGj
	5mJVzLlLu7XWAkgXZaXM5/hPX/Z0YocBRDDVpZogAKOgBdL2I9S3gaJg8oFMWaliLoTvunjJ/wQ
	LqNlWKBxltjAw7xNQw9jO6eeEiYGzJSE=
X-Gm-Gg: AfdE7ckTpeSzNkX7RAPJRcxmPbZ2/77KkNc8Z8qMNq4qTTHAGaZ1uGML1l5gIkQmFfF
	Ri2/ZUEcKdfJ4rypmWGvzu65U08C2FTMQVwBlWmPzghE/2SOsutZ+/IiZyz+4KKc/+fY00NoXbs
	tQhrT9hR+CVVxBVSiNKbFqcM4DUSLxaLWVDwa1rmxzcS7ynfVWIsCRBt1T8TDLwNft8itRGESpD
	S/PMhGCynTCt+AyZdv1Bm/t/2yPhit+0AL/bEf2YKuxXUCHTlQJKaNKqgh1WuTDrQMoQnjA8Jwr
	xXk1bARDvGqe4ALO0+HrKxajmkRygNLABIE/+uJwfK+jvLzRQoWNY8KB
X-Received: by 2002:a05:6000:2207:b0:46f:7d90:811c with SMTP id
 ffacd0b85a97d-47f4885699cmr12314144f8f.13.1784197749926; Thu, 16 Jul 2026
 03:29:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com>
 <CA+V-a8utJuuwVNy8o2zM5jHf9qXx36S79uKGtYr5O=sASh_wpg@mail.gmail.com> <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
In-Reply-To: <CAMuHMdVT-wWtJaB1bHR3CjfjEGhVfWWKrs6YyZbahOTFSFK4Kw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Jul 2026 11:28:42 +0100
X-Gm-Features: AUfX_mxnpT0eulW4NwRS30WvnQ9rPIX7xQABv4l_7unRYg0H_inTZ2rnzW_HB84
Message-ID: <CA+V-a8sxPmhEziG0NmL2VdXBOS75fzLPEVq3md7Hm9y8iCtp-Q@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 9:56=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Jul 2026 at 18:51, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, Jul 14, 2026 at 2:27=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@lin=
ux-m68k.org> wrote:
> > > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > This series adds support for the System Controller (SYSC) blocks =
found on
> > > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical =
low-power
> > > > > management and access control functions.
> > > > >
> > > > > Hardware Architecture & Dependency Challenges:
> > > > > ----------------------------------------------
> > > > > The SYSC in these SoCs is a multi-functional block responsible fo=
r:
> > > > >     - Clock & Reset Control
> > > > >     - Low Power Management
> > > > >     - Clock Monitor (CLMA)
> > > > >     - Access Control
> > > > >
> > > > > A key architectural detail is that these SYSC blocks are physical=
ly located
> > > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softw=
are Reset)
> > > > > address space. While the CPG/MSSR driver is already implemented a=
nd
> > > > > functional for these SoCs, the integration of SYSC adds a layer o=
f
> > > > > complexity due to a cyclic dependency:
> > > > >     - SYSC requires CPG: The system controller needs a clock to o=
perate.
> > > > >     - CPG requires SYSC: Access control registers within the SYSC=
 contain
> > > > >       bits necessary to control the PLLs managed by the CPG.
> > > > >
> > > > > If implemented as a completely separate top-level system controll=
er node, we
> > > > > would face a cyclic dependency between the CPG and SYSC drivers d=
uring the
> > > > > boot process.
> > > > >
> > > > > Proposed Implementation
> > > > > ----------------------------
> > > > > To resolve this, the SYSC blocks are represented as child nodes o=
f the
> > > > > CPG/MSSR controller in the device tree. The SYSC regmap is regist=
ered
> > > > > directly against the CPG device node. This hierarchy correctly mo=
dels the
> > > > > hardware address space while allowing the drivers to share resour=
ces
> > > > > without deadlock.
> > > > >
> > > > > I am sending this as an RFC specifically to get feedback on the
> > > > > implementation of the SYSC as child nodes of the CPG to resolve t=
he
> > > > > dependency cycle.
> > > >
> > > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > > subnodes because you can register only a single regmap per syscon n=
ode?
> > > Yes so that the consumers don't have to specify it by indexing.
> > >
> > > > Would it be possible to just extend the existing clock-controller
> > > > node with two more reg entries, and expose them through a single
> > > > combined regmap?
> > > >
> > > That should be possible. Or would you prefer just to extend the sizes
> > > and create a single regmap for it?
> > >
> > >                cpg: clock-controller@80280000 {
> > I wonder wether we rename this to `sysc: system-controller` but the
> > compatiable string has "*cpg-mssr" postfix.
>
> I think the current name is fine, as clock control is the main function.
>
Ok I will keep it as is.

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
