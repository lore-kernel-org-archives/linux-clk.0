Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5640096E
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197712; cv=pass; b=ZVCR5Wp+dWsutA+Lryb02HkJbqvW8R/1oo1MMaOsqPejIGaDnwiAxeeKyzKy0mk8WP7bQ5pqZwAYdTYQXXQzEkaf0/5ZCDviBnBZJt8Xdx6pWgQiYpXgCTeZJkA+Vv2lshQH5Yk98QBP4310W7xV2TLOOvRQMlsYn5MHFp6JYSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197712; c=relaxed/simple;
	bh=9CMRtIwZMesVCw95SzVrTvn4z9Ju3sAFefPlV/JvBug=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mj+4oRsvxMepHvGbGAKURdRDVQOpxzTofyLekQ8lvlqssayV2EYdxXx99nG3PpGlBN33+SdiADoKZwH0vxJX9yGlMhFaxK511HbjZzDB5GLLjouJ69pJsYbxlB/QmJWqZiAwR6JcS15tsDvhNcHmr63AHGU8kTx/D26DdTQcGO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYWAcsUn; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYWAcsUn"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47d6c634f45so3663267f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 03:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784197709; cv=none;
        d=google.com; s=arc-20260327;
        b=XseVg5t9r+hrQ2G/9UsItesBRLiPbvMs+hUDeE/iwXeUvvpoAqkS1L+y6WTV4uqz+c
         8Cv76Y1zQrqNu3qIF0VKwTMzv8erWbE4tyCDPkEm6FJIH2FbideI8zjtEeQeUPH/kMt9
         /bgAMFPLf7/E6LOLt+pyqNTd8oUeKG/SVdJnKeMugrgrT2WLluuXfnEECmydno7qK2x3
         w8TUQ7ANB5kIph+HFAgob0HzOTlP4S4o25mpDbOrVrxO07fvAOI9EVrOC/4/b9yNrtRm
         8uvthHoNRm57EMSt+5mV+2IUn98LeROCJahHd7cAK/p1c7rqLnmlGScAbXyvWAd0sSiA
         fc0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        fh=O955ZYmAH7BWHFviQjI/PQzNcX7Uey2G7AxRr1Likz0=;
        b=sV8rqVSumkPtuDuTH2giQFAMZmg6Sv02FH5FzVD7n4CJp3fiv/ZAwam4g1p4DJ8OsD
         N2Ttv/tVkMGyUT0bUvStizqKF+1ZrZAzHngeNVORpye2nlnfsGjIVPlqB50FCi3ztAwx
         g/QakXyi78deQNO37mnaAFKeX2BudDqEZbDjjYDt2L5Gaw0Pow9Ozpk3cnx4nojYwbbJ
         +zHjVGcXzw3X7xp+ZdbvSFFS5AL9mrLrH/Qiij7RPYDyqoUBChFa34MsQtRCEM+zVxaG
         3uRo+SSwfeGDJ1HoPMt4ZlYv17ktdW/fACurjlciVu7CfOqjqpxEqBV0SdLYsOIPyAd0
         nqgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784197709; x=1784802509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        b=WYWAcsUnVdAwqOs5vyUxESIrESaVcvK1AzNtEF6hYOTLm4fEEgRiMCNGfop6hq2GvF
         0MBVKl9gEuvgzQZ0d8GMIY3tWdPE1hfWyqGEszJa7SKrDK3cKJ3Il67CprncRpkncFSK
         yxeCZ7K2DJULFP045p5gwD1eQjTczqPQOyG02VWbsgRK564EYH6va8fXIbT8tWSdnxsY
         uUUYjN2bKpRoFBPb0q7aNM6e0ZpuOp3Lho/KbPFsqqillaKynFr24nBDRg61DAfMIS/Y
         BljKPs1Nxin3pb9sieHzMCoJnFQjFsvB4GhMVAkTGCzNwJrMUUfC7NtDUJJBPrzJ2/Ks
         YtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197709; x=1784802509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+KOI1yzxEWrrjiX8ttD6p732AnDLyZgUaLXj0s48WNY=;
        b=TdbxvuF+odZlhJPQYCHvq2NlP1gnUTcznPbH2CHnuMmLdlrsZkw+Ah8a8IVupIDQBp
         t/po+ExSGrx5wWRDzQay8iWExk8sBAjaNyrS94tRhtytjs0tJYypqKEtcS448HREopK5
         GMR1F+k0bgXJSjuD0X8dfSn+6YWmsaZItZlII1X7yVoWyghMbtpQ/9+WqadsEH16dEPO
         XZX3GHWIFPbPrnBQCxDae2kVtvEPsbg4/uniN+KBWHpBIhyATk7RjW9SphUtzfFkppaU
         yD0gpQY0piKcugptXR7FTXdX/05mm0nt6lDEe+E0OtjX6bcEjCBjXgdPhdY7cdbQJGtX
         swog==
X-Forwarded-Encrypted: i=1; AHgh+Rrmv5IomG4LLDrl9s+lPS79Cw6f4ZbTEn+Qzq3lZUVuCR+WiEks07XSLhw4j9ALYP9Mr2w6c+tXlnM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8i8c1C2EE2u9ikdqLjc47G5GsFVEic5hSFs4c7Ihrk/wLqLlf
	rLl+B/zDNVHP/eYbRfpEcZ6P61H5Tk8Br7BwJ6OKvF5nD3OBVmWt2dbKwDJvP9wMkiEM5uH6J2B
	pma0DAJTrawK0jmthN0QyQH+goj9kGsQ=
X-Gm-Gg: AfdE7cmJHJ3EG15onFvdcFznErQNkAvO4KGY8iZrW2gxbJkhhbbp55w9/43WJfQvkJn
	d4uAoH9gg07OJBoNhWnmsF40zUI0GeniKsHbwpyQtIcePyZ/yLowkaECy+vLDuH08UmI70D0oJh
	Fx2aRqMlpC1sfTrCKLer96qw6MSp1qRJTV+GD5M0iNk+eM56unaF8lmPgUE0mUizvzOA9J/Uo6t
	YPiex4YW5ImNhIx4cYtZPX2iWTbQcd+W9vlNlhZ/R80RsNBiXqQGfsiH2VSxZ9HVeT38+kg3ZNP
	ly87RbyrZmwMX6jnAozuzGn9rRzWrJx1WpemO3K5F+todw==
X-Received: by 2002:a05:6000:4a1d:b0:475:f0c2:5afa with SMTP id
 ffacd0b85a97d-47f488bfd4dmr12527545f8f.48.1784197708365; Thu, 16 Jul 2026
 03:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUhiBAcJ6P7j0ZxL+0AbVqz88PMo7YX9UiYOK8jM61D1Q@mail.gmail.com>
 <CA+V-a8uUxfDx2Xnb3uFg2=R+eYnzVmAv4PoEYeXGwAbANxG5Bg@mail.gmail.com> <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVQWnp3ipR8xLv3PBVax3sDrZeoH6uw6Cjygf7EZT8EgQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 16 Jul 2026 11:28:01 +0100
X-Gm-Features: AUfX_mwAsz7gRD0YYf7KOaOpLk2KMZANDyil4268FtHPqCze6MPfCsZ7dyXCIpE
Message-ID: <CA+V-a8tjT8bSy83FcOypSjry8WoVN2w=4hp7yBWNEH0mx_kj0A@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 9:54=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 14 Jul 2026 at 15:27, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Mon, Jul 13, 2026 at 5:00=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > This series adds support for the System Controller (SYSC) blocks fo=
und on
> > > > the Renesas RZ/T2H and RZ/N2H SoCs. These blocks handle critical lo=
w-power
> > > > management and access control functions.
> > > >
> > > > Hardware Architecture & Dependency Challenges:
> > > > ----------------------------------------------
> > > > The SYSC in these SoCs is a multi-functional block responsible for:
> > > >     - Clock & Reset Control
> > > >     - Low Power Management
> > > >     - Clock Monitor (CLMA)
> > > >     - Access Control
> > > >
> > > > A key architectural detail is that these SYSC blocks are physically=
 located
> > > > within the CPG/MSSR (Clock Pulse Generator / Module Standby Softwar=
e Reset)
> > > > address space. While the CPG/MSSR driver is already implemented and
> > > > functional for these SoCs, the integration of SYSC adds a layer of
> > > > complexity due to a cyclic dependency:
> > > >     - SYSC requires CPG: The system controller needs a clock to ope=
rate.
> > > >     - CPG requires SYSC: Access control registers within the SYSC c=
ontain
> > > >       bits necessary to control the PLLs managed by the CPG.
> > > >
> > > > If implemented as a completely separate top-level system controller=
 node, we
> > > > would face a cyclic dependency between the CPG and SYSC drivers dur=
ing the
> > > > boot process.
> > > >
> > > > Proposed Implementation
> > > > ----------------------------
> > > > To resolve this, the SYSC blocks are represented as child nodes of =
the
> > > > CPG/MSSR controller in the device tree. The SYSC regmap is register=
ed
> > > > directly against the CPG device node. This hierarchy correctly mode=
ls the
> > > > hardware address space while allowing the drivers to share resource=
s
> > > > without deadlock.
> > > >
> > > > I am sending this as an RFC specifically to get feedback on the
> > > > implementation of the SYSC as child nodes of the CPG to resolve the
> > > > dependency cycle.
> > >
> > > Personally, I am not a big fan of subnodes.  I assume you are using
> > > subnodes because you can register only a single regmap per syscon nod=
e?
> > Yes so that the consumers don't have to specify it by indexing.
> >
> > > Would it be possible to just extend the existing clock-controller
> > > node with two more reg entries, and expose them through a single
> > > combined regmap?
> > >
> > That should be possible. Or would you prefer just to extend the sizes
> > and create a single regmap for it?
> >
> >                cpg: clock-controller@80280000 {
> >                         compatible =3D "renesas,r9a09g077-cpg-mssr";
> > -                       reg =3D <0 0x80280000 0 0x10000>,
> > -                             <0 0x81280000 0 0x10000>;
> > +                       reg =3D <0 0x80280000 0 0x20000>,
> > +                             <0 0x81280000 0 0x20000>;
>
> Yes, as they are contiguous.
> These registers are not accessed unless there's a user specified in
> the DTB, right? So there is no issue when booting an old DTB that has
> the short reg blocks.
>
By checking the size of the resources, we decide whether to create a
regmap to maintain backward compatibility.

Cheers,
Prabhakar
