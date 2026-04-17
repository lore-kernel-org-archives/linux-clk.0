Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FE83C555C
	for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776454027; cv=pass; b=qiNbGBuS8kM0Q6tBM/aF6R89vibRjHC98X7T/CQCJmTksewr9RQ1k8E+ggbN2SivMzCDeCUTFhyqqT4bu8H/sxql18pTwmGai3CndfU2R9719Cfn3mEdgftJ2KtnwMNo5Mhh83zK/6JK0ib42bXzMDVblQfjr/LUCjzFzOIAHsw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776454027; c=relaxed/simple;
	bh=lPIb5aQwmaxS2M4Elhy58rbK4i0LOeCmLE2r+D3C9dI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i8/MPb0XQfpyrnMDvkHPJhBTtPj9HTNFuD1yqlIf+LbtwPpHeXbPQToc6I/igqgDdn6d/ge9zxHRmCdpENbh5L/jgQtRDmjMpUkOjidAhMWVNmDZgSZOGO0RTHE5Zi8P+lUS6DgbI0iw6tarT5SyBtR9z1CoIyDZ1yklqDC08gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OK/piPGC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aOIoLwjL; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OK/piPGC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aOIoLwjL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776454025;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
	b=OK/piPGCyQLqJNM6GJ1K6DT8Odg8dBK4z2v8cCQUNrDHoMIGzpayj/VspGF2uta2CFovWJ
	TmWkshVGpc1FVtMefHNV31bLinUJRvipfvK13A0mlKQtM3MsXL55Fra07NJcdYw6tOR3KU
	Q8qs0+LK7YW2bOubJYo0Lfzf6+S8KBI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-482-CYr2ul_MOV2ejJququ6riw-1; Fri, 17 Apr 2026 15:27:03 -0400
X-MC-Unique: CYr2ul_MOV2ejJququ6riw-1
X-Mimecast-MFC-AGG-ID: CYr2ul_MOV2ejJququ6riw_1776454023
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b938cb02038so118757066b.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Apr 2026 12:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776454022; cv=none;
        d=google.com; s=arc-20240605;
        b=AmrNRZo8JL/Z500104SFlqr1pVLOE7IB+Joq77nGa49IYsrYLX2KsbZXFfDEkuWBHd
         5LVd49dmEV2x0FkATLTqi524e4qQPL1Sv2R0k1p7pDVPCZMGnm43InR0PybLh0CS61U2
         9+JJLOYTvUSMbfrPugMbWxS5sxB5m9jRxNDP4lm8h2kA2WXKyYW7mrDEeLTx9ZDYyuBn
         5s7eKrkJonIT6A61N5kPIPGqhRCaPsK6ZwsDszNPaPsajnEsxNB5BTotGUYkCieZU+fN
         aD8tsS6iUDJtR0/cG2YAp4xhHKfKIonh08XSvAzGHz87NatXm0NkgAwQ3BabV83G3ezm
         ER6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        fh=P1E3vek937slJAwJxXTnzQGYy2hvrDUQKKuz7fjhICs=;
        b=iNc6D+yBq66ArJ801y2yBq8iQvHr9D7gIZM3BbTryHSgaNZQKJaJF1hsQJW8mWqy2g
         VOEL/dWsyUhfKqQZqY2HUG43x+f2emqyAD+47RTGBmUB2vrOlpFBmicRU/zPBK1xKAJy
         sKnKg125PhE1UyzC61/pu2B9vg24XW7d+EuCADYHIZg8EcNnbMreDzcNqU+1AXBZggrk
         hixK/IJacaO5xBMCj6rVQ8sSyLzJE3SuoFxT+lZvOIitM/z+Rc8LL4HyWDO6bcr94VbD
         fFH2Xn2f9Gsu98MFevVoYyHmxKSypBdZ9PKlVASfSM126c0ZRQEafrWyw+xXndwOsUHL
         NgMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776454022; x=1777058822; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        b=aOIoLwjLdefwLZ3QJi2APWZKvkAxgGsyT4IfIZ4JdzeoXtKnLXaFSBa4Z7XCgYtCap
         1LQxRLBVphtSkfHi8uol3Vdh2v+heaCIKkYq9AkshdC0IKOzCeD8G/cq42w1KuMKZJ7h
         tZtsAIYKJidVxlO62jfQac8iYMdYP2jiDY6tPz+IuX6+e0FIAGQZYVx5VZDzFTaSia1J
         WXLdls7HvLpYMMXlpcRC2HSs+pOi9GUJIjFW4vfj3YYfvPLML8pfACheLCr5gZhz1Ro9
         8Xk6TU1c9rx6GfbTwoyCHnsDbyWJ6ig5UvnAQSDRdSkSbxzqkg3De26BpyTh1Z7z0UMx
         aMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776454022; x=1777058822;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WCSjOpnoTDL19Qep1cQf5b/luBj5kuEmnJXuZJ7fkgI=;
        b=LGwdBZMdFtuoviSiTE0X21EDQK0ya2kseS2YIsVlfekoqjIzhKp4z0r6zChFpZ8dwm
         T/RaYALZZvit7t/hDDUhuVxsYhYmCImVtZa0gZozIQNybBIhEd9kzonIdfVlInvBsm0x
         RzVEcoHYJoHJEiNjrwJ5PVt8/dgMhHm9/GPGkzA6CNJgJ5hzFeY2TIOGA/Ayhi2YJmOH
         cAj+W8PcX8ZaOl3u46XRsQtV2DkK67wcGQOVoSqVJ+mE37KTZlTJRjsYNDNe6wudSTFW
         DhownM4o44Iq5rhkCRQnoWgjjJ9Tfd+sdLIIimbp0Y6klnHKozfVy9pGqO+/43WhqpxB
         1D9A==
X-Forwarded-Encrypted: i=1; AFNElJ84jcJD9+L6++zZBB8yMC81Ol42eiCmLZTG5LeQ3a0/FBEYAGY/5A8hRpIXwwdPDur+2Tss46Uy4gA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ0aO15n2T4jqTtgFqlYoivdoUhP9GBLkVzLc14pXv+ERXtwSx
	k1q34OhJ8eEA6AWecljquF0qUuzq9saglEpM0m5URExYnu3UhJhhepaCdr0sZ1f6Lgri+IJXeR6
	Kt/msh+HOOGtw3ahub+Qj9zBM0CdyPOJ8vwMyp9z/Xg2y6bIHRIstMsyLV8pxu0f0YHK0G+OG5L
	621II1nOdllTi3y67yJ7tvqOlfitoWnUWiS3cK
X-Gm-Gg: AeBDievqrwtpZhWnwMLl4gMHTPU8VmFtPH6+fo/Ze0pXCHVJisniEQ0l2O+Rd3ZbQoH
	Ao9HRe/py6NcqXyguW38QAGkTCa8bNfi3DRmFmuFep3xuePerpgUiOOcLPiC2uALa/M7bLfudqh
	xCLB+ANPRvak8fh8S9xqq3Uq8QxkUUfMT6HiFfT6gZNCxQ/Ou2rIdSAa6jfljmFPcO/b5hDM2Y4
	oE94hi+RnUVsSJ7
X-Received: by 2002:a17:906:730b:b0:ba3:4d60:c4d8 with SMTP id a640c23a62f3a-ba4229d76famr206699066b.28.1776454022474;
        Fri, 17 Apr 2026 12:27:02 -0700 (PDT)
X-Received: by 2002:a17:906:730b:b0:ba3:4d60:c4d8 with SMTP id
 a640c23a62f3a-ba4229d76famr206697866b.28.1776454022023; Fri, 17 Apr 2026
 12:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <aeFWGYaRownx1jdp@redhat.com> <CABx5tqJ2PJQgiHpq=wBrobhHzU9bPgE0A_Y7khg9PK-pZUzX0A@mail.gmail.com>
 <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
In-Reply-To: <CA+V-a8vjn_emiTkppdLS0wn85eTU6tqNhr24hfgF9qg6=s0BpQ@mail.gmail.com>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 17 Apr 2026 15:26:50 -0400
X-Gm-Features: AQROBzAXbbZNFmEuYKflcv629Y-xUj8FOG7iLNZNIU7O46akxJ0PW-D7cTFcBVA
Message-ID: <CABx5tq+tyZGwDNES0dk8NrsWU8nk6GHC8gAr8xJPzcsVELp00w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: divider: Add some kunit test suites
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 12:15=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Apr 17, 2026 at 2:21=E2=80=AFPM Brian Masney <bmasney@redhat.com>=
 wrote:
> > On Thu, Apr 16, 2026 at 5:35=E2=80=AFPM Brian Masney <bmasney@redhat.co=
m> wrote:
> > > On Mon, Apr 13, 2026 at 01:49:12PM +0100, Prabhakar wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > +     /*
> > > > +      * ULONG_MAX is the canonical way to probe the maximum rate a=
 clock
> > > > +      * can produce. With a parent at 1 GHz and the smallest table=
 divider
> > > > +      * being 2, the expected maximum is 500 MHz.
> > > > +      *
> > > > +      * Before the fix this returned 125 MHz (PARENT_RATE / 8), th=
e
> > > > +      * minimum rate, because the search loop was bypassed entirel=
y.
> > >
> > > The "Before the fix" comment should go in the commit log. The comment=
 in
> > > the code should describe how the code is right now.
> >
> > To demonstrate the existing issue, you could structure your series by:
> >
> > - Introduce the test as the first patch and have it show the issue and
> > the current behavior.
> > - Put the divider fix in, and update the test for the new behavior.
> >
> Sure to confirm,
>
> patch #1,  have KUNIT_EXPECT_EQ() with a false positive.
> Patch #2: Clock divider fix + updated KUNIT_EXPECT_EQ() with correct
> expected values.

Yes, sounds good.

Hopefully the kunit change in the second patch is minimal. The issue
with having the kunit change for the fix in another patch is that
it'll break the tests if git bisect is used.

Brian

