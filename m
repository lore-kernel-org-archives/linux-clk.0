Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935413314C5
	for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 09:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779527380; cv=pass; b=nEn+/nDg8Hma6N8qsLl+drGr0hmsFwaonMAWWHV6v20NoeTDh9+e10bMosWhji16OV1jZBRehf/7C077c1SREdY7rMfntbLmLWJTqwZPJFxcb8vklMNY0W7/3RilSvh49Rb1bQTaXapRdB0arZoORn8pmtFuE72QAuJlA1v8kFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779527380; c=relaxed/simple;
	bh=1dxnGYQ/a05dBHJxbBi7J8RWtve9OyuUFwPBBfCIC8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRU8Hfn5cFnR/go0DVc8pIhgymsh0QVM/Dvfl3VGE6AWCt1CQ3JJrjznotftL1HhHrIWw53agcfk4GyOdvT8pIp6yGP5rxzImqsKupY+diP04tZG7U4V9MIFt8rzvmPn6WP90B/9MMRtF+XxZ033vqOs4QhMeiGRZ26PPLW9PHo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sGFlggw1; arc=pass smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sGFlggw1"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-40423dbe98bso3758616fac.2
        for <linux-clk@vger.kernel.org>; Sat, 23 May 2026 02:09:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779527377; cv=none;
        d=google.com; s=arc-20240605;
        b=R0VovqqwymQbzI5lR87i65K0dqWd26IU6tsfxvR1INWReoj2rt9RD+xDODaNux9c4B
         SFdVK1tJeLzlxER/pqO/1ddhcRhnZh2/L+0KZa0AvVh02CY32S88RE6B5kQsw5m4D1hm
         R2+j0+sX2NKS3x4mSr0fuOVjYfbeLyPn5ZrS0lyurX5J1As9HYiyzZHrBMC4kjsW6MOP
         D7duDki1RRDaIet2PYtNcqSJreAXKWVzCRE1J5JkL1slMuGV0JuQ5BnsApqOTD1Kl9bR
         g7MANL6HrLo8bBznR1z0WHdafR6/3rDMFfUFcLUxNkwhyOPKjtMSEYZok6qOEwOV6+AH
         2ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        fh=bpgshrwEA9o9ey8Pocd2UdeCB1MxDlx/WT768789LjY=;
        b=EHeMb6IFAyOgfPKdvO3jZGs+lwTKeMg+7t3rC24ApS41zbHhU/Wr6IJubDiaOwqCVh
         tX0qV5WhD+JZzUTH/EubT//Z+dJqAfIowkWeNjYQJwYuf1uScgGBPrmU6tCzOcgomewX
         3JxH3mEmINOFx90JqqTJBs3LCsKoaSoHrY6kYAzrTbMgPlkZdmkSsgifaP+yS4SmwdSS
         Q1X6T35uOOzDnQcVBlMJDNI1V36poQFt9zKpY0mGvdmFOfeV9/8pzymoEn2geHhiT9DB
         Uq+h00QrDgKdKONHm72jOm1dnp50AG+2gjjEdOdlYmbDx3C6uLFVzgoDlvoEh5v3/07y
         8lcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779527377; x=1780132177; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=sGFlggw1Ec3APX/tb5+lz5O98ejYQPedntg6+T7ny9+YfZtWnkqE563NtlbWNju8bd
         b3LKlfQAtORU1rYKkY5drwY1cV9HVwBhFe22/8SWeR+W++W3IuA8ZHsuj8lmD2ajY13b
         sZl0YRpEXaSYb4hFJZWKITOpLXRaCKHmxt8VI7ZoRqF6X9qA2YGvQbvt1goKNT6IlXIh
         UFN8S3iE50OU41FmgwxhAL/l/7gykClAgZVZAW4kS23rfx0/isAMOTovW+i5lBM4egMT
         E85CaGfcXokdXZo+aBsTVBHHeBIOD6tpBKdU5BycxUh9+9ABqNtP77xQe1SbM1sVmCWc
         SywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779527377; x=1780132177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ejKlmW0zzmF8irdxZs3kE5YHW68V4KSA3AOJZ+dT/PQ=;
        b=ht2hNilVywfIMG4ZcSP0xnc2tB/ZLn9OjGumyf04RZGPywhvqF25EpcB08oB7b9OYK
         8kJMTsoQCPOazedEeCPvEkIesr9YNVFXrZcivIXJmQBspFtxO9AdUEjrvehu5aAQXQxI
         Ed5aO//f7aIXUnWCUkyaJ6kUOGc1O3HOaN7M89MdRtSLlOHLeuu6zp2gLvjNPYwuHupU
         EGVm0tphdgIHZoT/xE1f+sc3lZr6JNnGLtq+LX9S7qL7DOYUZ/iJLtfT8Iu5eUB2ipuL
         CElGC6ym5VjReAeWy76IcIcm2NhSXSfVcJWVQUWxz0Ya0XJa1Oj6vcJm0nO1IUlx6mzM
         icLw==
X-Forwarded-Encrypted: i=1; AFNElJ8qHEP5DweF7mWzoIzkbrn4yNoeRFzF9Ubl++zyWIW6lzAGfkr7J81GWyQNvnIE+Df72ZJx5xTzbL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEKxeSSd7luNuYOP4vh41HnnFoa32K2JRrIo5ljKCVGZMhQ/G2
	4L5vjovx8i6R7eal5ReUS0Tkk7Tgpi63Nv1VDAceYxs6H+jNRwsX2MZoWdaJTOJ/kVgGn3YfCKV
	kvzT8gjnk0Yyfi8Bkkrm5Rpp/A4sOsQ8=
X-Gm-Gg: Acq92OHugRYD1ErtblJw7oaXf/zwL3cO2YK3z9D++5s0h1QeqJzOAUXXh7S3J7sm7bu
	5YZfNzptZxCCQYEm/Il+a9IsVTO8PdCBTnMnmPkRrCa0yEHzqK6PWkyflczBlkoyuJd28UBH2j7
	eXUHojYdxQO64avJcRC9KaSpVKOeRJap0lYk29a9z8uKIw3SesDwtuJAuAcumWOHZiTLI7e1Hyz
	1H0VH5AV4+R0boD9pRO/CVpfy486oliMvnvxlozMibEjwmGqZ0pC1gGLb2TCeC99hBzi7ZNlo/L
	v2OxnVc=
X-Received: by 2002:a05:6808:80a6:b0:46e:df55:23fa with SMTP id
 5614622812f47-4854a0e00d5mr4060915b6e.17.1779527377468; Sat, 23 May 2026
 02:09:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-4-438f2e0513ff@gmail.com> <agsEWo_mo5rzUAAH@pie>
 <CAJsYDVJZW2VYFaxzJRg2+CJZbvqq_iRXaf7+zYvidQn0AiviKQ@mail.gmail.com> <ahB46uuoFQxKgr7r@pie>
In-Reply-To: <ahB46uuoFQxKgr7r@pie>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 23 May 2026 17:09:26 +0800
X-Gm-Features: AVHnY4Lk36CbWgZqCYBOQQ0bLGYLlT53IZSzrrfoEn7qhEuTPaAPNqycRD4gpcY
Message-ID: <CAJsYDV+cSbUu6EtgMjWT=3vjFX9w7DMNPhhBPRN2pzF0wJGwsA@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: add support for siflower sf21-topcrm
To: Yao Zi <me@ziyao.cc>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2026 at 11:45=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
>
> On Mon, May 18, 2026 at 09:34:17PM +0800, Chuanhong Guo wrote:
> > Hi!
> >
> > On Mon, May 18, 2026 at 8:22=E2=80=AFPM Yao Zi <me@ziyao.cc> wrote:
> > >
> > > On Sun, May 17, 2026 at 10:12:58PM +0800, Chuanhong Guo wrote:
>
> ...
>
> > >
> > > [...]
> > >
> > > Besides field/register offsets, the only difference I could tell betw=
een
> > > cmnpll_postdiv and pciepll_fout is that pciepll_fout clocks could be
> > > gated.
> > >
> > > Would it be a good idea to describe the gating function separately as=
 a
> > > clock, and merge the common part of pciepll_fout and cmnpll_postdiv? =
In
> > > which way you could save a lot of mostly duplicated code.
> >
> > I don't think so. Since the majority of the existing code are register
> > operations, and the register bit layout are completely different,
> > there isn't much to share between these two PLLs.
> > Writing a struct to describe both register layouts together seems
> > unnecessarily complicated and harder to read.
>
> I'm not suggesting merging the implementation of the two PLLs
> themselves, but only the two types of clocks derived from them,
> i.e. cmnpll_postdiv and pciepll_fout.

I don't feel like arbitrarily splitting a single clock into two and exposin=
g
an internal clock unused by anything outside the PLL block is a good idea.
I'll try reusing the ops and omit the enable/disable call for cmnpll_postdi=
v.

>
> > BTW the CMNPLL and PCIEPLL are actually different hardware.
> > The former is an integer PLL while the latter actually supports
> > fractional operations. I didn't add support for the fractional part
> > due to the lack of use cases and documentation. PCIE and GMAC
> > clocks are fed by this PLL and require exact clock frequencies
> > which can be achieved using only the integer mode.
> >
> > >
> > > > +     .recalc_rate =3D sf21_pciepll_fout_recalc_rate,
> > > > +     .determine_rate =3D sf21_pciepll_fout_determine_rate,
> > > > +     .set_rate =3D sf21_pciepll_fout_set_rate,
> > > > +};
> > > [...]
> > > > +
> > > > +     spin_lock_irqsave(cmn_priv->lock, flags);
> > > > +     if (index)
> > > > +             sf_rmw(cmn_priv, mux_reg, 0, BIT(mux_offs));
> > > > +     else
> > > > +             sf_rmw(cmn_priv, mux_reg, BIT(mux_offs), 0);
> > > > +
> > > > +     spin_unlock_irqrestore(cmn_priv->lock, flags);
> > > > +     return 0;
> > > > +}
> > >
> > > I believe besides the divider reloading part, clk_mux_ops,
> > > clk_divider_ops, and clk_gate_ops have already provided the logic
> > > you implemented here. So it might be a better option to composite the=
m
> > > together to implement your clocks instead of building from scratch.
> >
> > The divider reloading is the exact reason I chose to not compose them
> > with the function you mentioned. The reloading bit need to be set on
> > both clock divider change and clock enabling, because the clock divider
> > loading only happens when the clock is running. Since I already have
> > to write two of the three parts you mentioned, trying to reuse
> > clk_mux_ops doesn't seem to reduce the code complexity here.
>
> You don't have to write divider/gate operations from scratch, but only
> wrappers that first call clk_{divider,gate}_ops.* then trigger frequency
> reloading.

The wrapper needs to be spinlock + frequency reloading trigger,
because the built-in spinlock routine only covers the divider/gate.
writing. I see no point wrapping all the callbacks and writing a way
more complicated probe routine just to reuse a few lines of
calculations + register ops.

>
> > It's just trading get_parent and set_parent call with one more level
> > in the clock tree for every clock and more code to wire them together
> > in the probe function.

I just learned that clk_hw_register_composite won't result in
one more level of clock. but the second part still is true.
In order to reuse the mentioned kernel function I have to give
up on my current single for-loop probe function, add a separated
array of clocks with mux/div/gate, mux-only, div-only, gate-only
clocks, and write separated probe routines for them because
the clock composition is different. The current static pointers
in struct sf21_hw_clks will also need to be replaced because
clk_hw_register_composite allocates its own clk_hw instead.

I'd argue that the point of reusing code is to reduce code
duplication and simplify the driver.
In this case I could only see the driver getting way more
complex in order to reuse the routine you mentioned.

--=20
Regards,
Chuanhong Guo
