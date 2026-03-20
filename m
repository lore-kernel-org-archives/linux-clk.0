Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD82730F812
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 14:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774017299; cv=pass; b=oNX/ny9jm6kSCm/T3qPmUmcYHSvOxGIf2HPEUoTKtIhfHvdPtdf31Qh/mZG7CSxdjDhx2zotleJZTC8/fE2AGN3NSnfSSqThoxeE290DoIW7T/Ti0DVDYeRvar45MTCPsAbIjHtAx1tzJAEhjZ6TMTQZgogymJduujSCwlQUqU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774017299; c=relaxed/simple;
	bh=nb7hgqjkSZc+d3G67wMACrueORpRJMOCisudAL2UoMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnLkZHwivvcOHUdSzJRWs+q/PMcIyWonV4GVDcci6f91beqkN7GxGPwDNmsMwdU2WVvgAZosgcpPSnIyjaOcqMQlcfpyYvlR+p8j8/DzsrCqwJqb9LgPW5jpjmCyQtwXKKcpejhnecDrk9WTrmLwQMZDcsEfLp82TeA1+ZFPwSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YHdrRjjs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pjUsMVc3; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YHdrRjjs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pjUsMVc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774017297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nb7hgqjkSZc+d3G67wMACrueORpRJMOCisudAL2UoMo=;
	b=YHdrRjjss+Egetu0yPB7ZmYScn8nY1MSHIweXlRx1UxBcuKXJ8rLxJnXL/Z3hNKlDxpj73
	6KeKf2WftYciR1rP/g5XiWy6ja1zczH64kxySwELC7eKfbuk/oNKpqpJGA49G873CoU4MZ
	PNJ4tiGVHOclzbCoHva/u1u2G9J4CG0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-xdRlerfGMZeq2qcl63VcWQ-1; Fri, 20 Mar 2026 10:34:53 -0400
X-MC-Unique: xdRlerfGMZeq2qcl63VcWQ-1
X-Mimecast-MFC-AGG-ID: xdRlerfGMZeq2qcl63VcWQ_1774017292
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-b9417a552d0so270846466b.2
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 07:34:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774017292; cv=none;
        d=google.com; s=arc-20240605;
        b=j9+kPnIx5F/tefb6Hsd6S72s3T2EPkx3wInV3ek4S93TMdVTf96B0hOmRfhu8RBX/m
         4w5W2DvvLEJFXUN1RbzVYh8SZ//D9/jxfCo2SKqorldaMjTI7C6QNTMXqTdiV1yLtXNj
         Lr/oJZqf2ntUwMZEL+KnRYggxTMAGlFxmpAjF5Cq5wtTBjC3E2fejKBu85b2EK/4/2t/
         aYEdamBFfGRZlO7d82O22iBf4Efm8VFTCE8rI4j1tkaRcw4qJokaziJ3jEAMf9aWEu9n
         PS6mksuG8FmgSSmUr5LUlFlINtSEXTlb8oFoFbBiTQW49BvqwiGJSFP7UyhPVM6q7do/
         E82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nb7hgqjkSZc+d3G67wMACrueORpRJMOCisudAL2UoMo=;
        fh=sJjoYALSk7tydKuCy/SWnDGp6T26BNFwkeWrzhZfVCU=;
        b=L9FaUaHL1awwClwn+owavn1lcrYkpIMzYqlKzlHyGCE8MQDcMt1K9aq7uouqBpW6Qx
         cvG64rczk3CBvvtXEePUlfIbZd8WeHC/conf8Jj5qSwqDWx737jGWgSRTEW3OeEaKvxm
         4n5a43Mg+KovsImNA3dMd1aUbOCdKNoICtorGrC6byhBqPD56VNUGh03ZXgyBtEYT27U
         1qeVVJhj+qS45M7P8jNjlERxILB+35ala2ru0k6zGCO3lRnbXOoBsRVb6P4e6+eq8uKY
         rw+dnGdqzvEmPCuL8e1YzG5g1V8B65nyL7iio2RmBwbhRfOF3lKSKALwi3Ta0jq3bj7s
         P+KA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774017292; x=1774622092; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nb7hgqjkSZc+d3G67wMACrueORpRJMOCisudAL2UoMo=;
        b=pjUsMVc3a2+ytVsCHud0okR/4dc60kfMYCJkKrOAxXyFpDyA8CT++4JcniM6f2rA7r
         ixMbMGEOzRZOajFbhAVY+QqyJXp1T+T9k1F3ssukM52sVVmEEK12TMSaUajriK+Apf8/
         JTS9s/9xbw9nJGsQ0Gs9tAy93E3iG+0B0HbLk5moJR12hrou1OZkSd9N8I/BjRvVJrq8
         fGIRTclaBEd2sBv1WASe30QMckBDvF8YjU/o00UJPaMS4jPZktNc8KJwJ0t4dc0dGe+Z
         K5+aorKEyFpbcEAUIOtxPpR4jN13O9eB74tnfQlR+85Txc4zThC/LfUkRjTRwh7BmgOS
         Q3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774017292; x=1774622092;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nb7hgqjkSZc+d3G67wMACrueORpRJMOCisudAL2UoMo=;
        b=Hkdj7bv9YBWVf33IZd0pJkQoarsAU8iHD+fLBprF0wM+EuZqqZSyn3+0Mc4Cbyr2Kw
         /vHuvhI1S2rLnk76xTVO4lp9nMn78LQIosKCjTeROm0oD05X1sY5SVBqlYQcTlGjR/zU
         M65gCd/VKx1corRMurubMOxpYB8TXJEgMQZZpUaPHFarKtoENBQqHwn1Jr1h3ejBWtZG
         xQAQXIkZnCN+1fBrwbZ5yPqNNByD17JzxJmTMGiq2+1HL2pM2dNaiQnkPCfmK8C3aS/H
         ROSziwblVqjqqnZ2tmqMIead4Dt/Zky1UMGA94NlJA7yaSJ4pXNq3g/8PahDj5ggtBYC
         sjtA==
X-Forwarded-Encrypted: i=1; AJvYcCUrwXE1mK0gJ/5pzk8BGLv/NDNtW+z97S4N+niYtT1k7/nex5t+Gotpa2E47ojIkd260kSo+zCZQcU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpJxr2YQTQ5onbP17jPAVHiePntwtjl+1gwpEgQ0dzRByEMJa8
	/oRyU5lSH52dpCgA9UHEorKnTsuLj4TPUKc8M23NR/O74IExh5j3RLs6fSsGvnmz2RduRiCT1r/
	EMHQYCd5mEaw+pRw94ZgAuz0z58Meper6Dokq7w2Tnx2FAPCDsExaWeuPblWfvzVlNUwid8fTyE
	66Q2FbSy5HdQORx3j5dKf66eM7WT4+ic2omQUi
X-Gm-Gg: ATEYQzziOelrLdIllQcW5f3sh+E4jhb+5qJErdUVUdzSWXZVGfJc6T/qscMENn+35kr
	0ID7lUz/1R6wWKbOJnOvXiIYEE522Gbf0Muc3WPPh0jIF2WV7tKPCT3xAxpLj9gXOC9DOCD6qJz
	x9wuQm5WLcTP87NwjZlI+8VovuGkPYAbsDwFJ+xHUPwF2K+GHf+6XHIeKoEJVsXj6oDkvXowW0+
	N4+hQ==
X-Received: by 2002:a17:906:1b04:b0:b97:344:7d3b with SMTP id a640c23a62f3a-b982f30484cmr188165466b.31.1774017292327;
        Fri, 20 Mar 2026 07:34:52 -0700 (PDT)
X-Received: by 2002:a17:906:1b04:b0:b97:344:7d3b with SMTP id
 a640c23a62f3a-b982f30484cmr188162666b.31.1774017291829; Fri, 20 Mar 2026
 07:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com> <20260319-spry-incredible-dinosaur-e2d9da@houat>
 <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com>
 <20260320-daring-smiling-sturgeon-fbac05@houat> <CABx5tqKPyQeT6eD8n1DVGLWpjHPq8_x6xfeMB_acZW4sAbp1WQ@mail.gmail.com>
 <20260320-sticky-overjoyed-pheasant-9bb63c@houat>
In-Reply-To: <20260320-sticky-overjoyed-pheasant-9bb63c@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 20 Mar 2026 10:34:40 -0400
X-Gm-Features: AaiRm50wxVRAvqmQJAT_YkC21hzFPafZbro8LePLEEBfX0vzZ6eQXntm2ySY-50
Message-ID: <CABx5tqKpFZo9QWxQohTc=OiQ68sxQrFMGCBmuvKp3kRM4bbZ_Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 10:29=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
> On Fri, Mar 20, 2026 at 09:08:29AM -0400, Brian Masney wrote:
> > On Fri, Mar 20, 2026 at 9:03=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Thu, Mar 19, 2026 at 07:08:07AM -0400, Brian Masney wrote:
> > > > On Thu, Mar 19, 2026 at 5:10=E2=80=AFAM Maxime Ripard <mripard@kern=
el.org> wrote:
> > > > > On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> > > > > Anyway, what I'm trying to say at least is that, at least, we sho=
uldn't
> > > > > frame it as a guarantee the framework provides, because it's real=
ly not
> > > > > the case.
> > > >
> > > > I see what you are saying, however these are divider tests, and thi=
s
> > > > is the way that clk-divider works.
> > >
> > > Yes, this is an undocumented behaviour of *clk-divider*. clk-divider =
is
> > > not the only divider implementation. If anything, it's the reference
> > > implementation, but that's pretty much it.
> > >
> > > So when you say:
> > >
> > > > +/*
> > > > + * Test that, for a parent with two divider-only children with CLK=
_SET_RATE_PARENT set
> > > > + * and one requests a rate compatible with the existing parent rat=
e, the parent and
> > > > + * sibling rates are not affected.
> > > > + */
> > >
> > > And
> > >
> > > > I want to demonstrate that the clk core is being called, and that
> > > > ultimately the correct dividers are computed.
> > >
> > > This is only true for one implementation, and so far has been conside=
red
> > > an implementation detail. It's not something you can generalize.
> > >
> > > And to make my point clearer, I wasn't saying this test shouldn't be
> > > there, I was saying we shouldn't do and document that generalization.
> > >
> > > > For example, on patch 7 of this series:
> > > >
> > > > - Parent, child1 and child2 all start out at 24 MHz.
> > > > - child1 requests 32 MHz.
> > > > - Parent is changed to 96 MHz, child1 at 32 MHz, child2 stays at 24=
 MHz.
> > > >
> > > > Child2 keeps the same rate, however the tests show that the clk is
> > > > actually updated since the divider is changed from 1 to 4 after thi=
s
> > > > operation. This is to simulate what would be programmed into a
> > > > register for real hardware.
> > > >
> > > > I can drop the expects for the dividers if you really want in the n=
ext
> > > > version. Personally, I see value since these are divider-specific
> > > > tests.
> > >
> > > Not really, these tests are clk-divider tests, nothing more.
> >
> > OK, I'll drop the checks for the actual dividers in the next version.
>
> It really wasn't the point I was trying to make. It's fine to have that
> test as a clk-divider test, but we should document it as just that,
> nothing more.

I can move them out of clk_test.c and create a new clk-divider_test.c
file, and make it clear that these are tests against that specific
implementation of clk-divider.c. Would that work? There's already a
clk-fixed-rate_test.c file in tree.

Brian

