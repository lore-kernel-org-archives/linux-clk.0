Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B83AA515
	for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 13:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774012125; cv=pass; b=OBUQmEBu+/Y2/1njH3P43G0m4pRnA4q4jzYyI/VPpn3xG/+O5Y9wTQ8GHUyx7oSdYTPnKrKmRKkLVTcd9SNAubSagrIt7Y3bCxiFtUmbTedLV8ng6gRHqI3fqKP15Ih6kddZBFGyE502/DLMgrEXi/fwuQSOIYBVqUDdeLCQ8B4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774012125; c=relaxed/simple;
	bh=2JGrBdSzzusllIRPtITrtS2x45gikLvhmIHuXrLfY0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I9d5h1WQLOiJnZpPIef19Lx2PxU7WamaFqam12Vp0PVp7KVjWb1o1KMSrHk8yaD/9qO18hfVHiaouDwcHLBUAV4pqXODVWsBfZbo51tdB/nxZfLv9WBqX/3bdobrwugq9Lamn6XhOMJPzajCo9zuYAI0oJURiJa00+A+YnLJGOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BT/u8RWt; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=npY4C2Pq; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BT/u8RWt";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="npY4C2Pq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774012123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2JGrBdSzzusllIRPtITrtS2x45gikLvhmIHuXrLfY0E=;
	b=BT/u8RWt+uGOrnsAkToBwh/N+8Ea4l50U/5AEnZGyjeZhFtdDMd5wTILEjAhGWUnloK7zK
	GouP89wIHpm1fhllPp/iaLxp+nGYmqGKDGKPOMv6RNepmzv0PAWLdvcSWN8+PQD1qGB0zC
	DMFVLdGtk9cIzI7zp1jg49oA78dIfPQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-kuatdVvvNSehqVY-I1BJDg-1; Fri, 20 Mar 2026 09:08:42 -0400
X-MC-Unique: kuatdVvvNSehqVY-I1BJDg-1
X-Mimecast-MFC-AGG-ID: kuatdVvvNSehqVY-I1BJDg_1774012121
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b97f04b44b9so225323766b.0
        for <linux-clk@vger.kernel.org>; Fri, 20 Mar 2026 06:08:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774012121; cv=none;
        d=google.com; s=arc-20240605;
        b=ikm1NVSaD1Im8U5hSEK316Kj0l5ORJTZJ78qtXLK81bcEy6c26OteSKW8cUy/YzHuG
         JIZ9Jxnk9sXLR4SN5fYVAHusb1K1S84/noAYVLxmJUmdiW6kPty178XAK+VUR0IfEze6
         xJq0DD7kGdtecgaQbaku63DVxbn1LRmhBxPKmeOqa7g4H1sOJENWQr5VN1kv7f1Kc5P6
         44VpgXAS7RGeh4KSeg9YgITpGTSDe8LBQRz8S5CZxaXZdS+AMIy4MhAoRgswemCQjGja
         ueimTAtryZ/6YG4e0A9bC+G3tYxSInxxMBtq/wbYkf88kLX7jO+F8wdL0mrMXQ3kWTZn
         ujlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2JGrBdSzzusllIRPtITrtS2x45gikLvhmIHuXrLfY0E=;
        fh=7RsdjjbpnpM5M2Um/QpQZ2HeXVYFEfV36Ck7dtoRKiU=;
        b=WVgxI/OmgukUNr4yEUPg0pT14jvSxUIkAr9IcIxXTgV2mDGnIKqx7whvXfVl0MDdFh
         lC2SaP47+xKCiIp19q2BGf9XfyfBJjadGZIt/pruYGnc++xfis2Ji1hwj2xSG+r9zLGq
         mos9+k8T3qmaYutcd+cWlnxr3uVtaIF9xdqASjcrtOcZj2utuDukjmrPxeWBhvr0NVRw
         TcdQ/uP2jNnjVQTodiee83vyRHWyfoOJZV09+yPWu1CUUpUIg0AFdL2S2yX4bgCbRptn
         WqRR+d2F1Pzmb2QbZM6N+rkFyP53PraqLWAbYd2eaLpu7VcGp1caxp9XIBnBzFpIxdRK
         LIHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774012121; x=1774616921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JGrBdSzzusllIRPtITrtS2x45gikLvhmIHuXrLfY0E=;
        b=npY4C2PqwR/Q8DIK8HyKSiVZHrhesWboCurp4+sm8iE6MJybSSapKjMlNrTAIodjX6
         RLhCGjzv+7ayjbUrk+e5qnRjz6Kv14OcOgb1Bh2P11FzK7vxb6RzPYiQdv3NEx+fI8tX
         k/dK22om0CoT0XZp1Apa9+BwFFjpPOScuQfSVIOruzZo9l4BnDW1bZG0XvWASKuatdUU
         PPXKnhITVR5WqzsrcS/PnMCmaLNOkBy7h/UWqB4lIw7y7Ryt5pNWuo13fOrKPzdz/FlN
         xvQCp6XTC/tdwyLbgjP7Huv9LIQ2ABzGcRIDVIPa7aNeupXtI83JNF4EH62Apjsu816t
         fSnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774012121; x=1774616921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JGrBdSzzusllIRPtITrtS2x45gikLvhmIHuXrLfY0E=;
        b=bOOkHTJSUy8u120qRbdknpOvnIXvkrV+vQmAZsk6x3Exh74NuoJdMEhiUypjT0nUDw
         Tgcou1ruC2jGJLu6WPau4xTqdCQFspp0peG3yMIRDsK6hrsHiYA9ntE8XlSHqpbgXBUg
         4D3xMBhSbdWMpoW7ksxJXTUPhS90JLhc+r+0yd/bh6VjgWMcHKnbD+7q/mDqzGvjrRSm
         XRvtampenbOzlpa2kQHytyh6R5EyGQo8QIiYcU1Cyc0XZfN9wInzpOKsOtXd4q7F6+r8
         w+HvSWMYC0GB/3n3IkUWhckVw7DT6yHnPV5kwn1+vwmnRu4rp0nwNRFw80Fbu1hU1Vbq
         cNEw==
X-Forwarded-Encrypted: i=1; AJvYcCVVyCgA33uX90x2kSWF7waY0+SiVlskDU71OgIFVmXWx4PaAVU0yagwt0XZk5yC4QgYpL5Mf2KiywQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1msBJ/3D+kXVY4L6AmgGf47rJUe6Qf0ns88oVYWdqyVHvcwV
	DFZrLST3S8SsIrGElCJgIMO09JKIpFN1mqKms0PGRxnGRRJlEtzrfw2Rb/V08setOesBZPyBeJd
	bL3KPLVEJ2xhsWrvKTY1HS84GZm9cW+dy21ODMgg8/lJ3XBcB1b+EvP136bNFEJpwpJCf7YhqHP
	Gd5UtCIB2YNX5w8VXf1d0Z2BnBxuAxecLIh8eD
X-Gm-Gg: ATEYQzxapQycwb727iDc7C+MoWHpjOiv58JsfCZ+DofzPbzYeIRicyui8qjfk5i0ZhO
	8lAKmgx5DfZfZnotDfi8i38jvzDJ09E78+5ffzAllfp2X2vbgjcUz8b5VLOr7+KJu6ku2AvsxgL
	JevAKlzRgsBX6BAcek1StSvk1B2+A9oaOVhrkOiskA6GYCEm34uNR2an+zHnDHeKVB7LXBoksft
	LYd9Q==
X-Received: by 2002:a17:907:a188:b0:b98:32c1:249b with SMTP id a640c23a62f3a-b9832c15bd8mr133010966b.8.1774012120863;
        Fri, 20 Mar 2026 06:08:40 -0700 (PDT)
X-Received: by 2002:a17:907:a188:b0:b98:32c1:249b with SMTP id
 a640c23a62f3a-b9832c15bd8mr133009066b.8.1774012120353; Fri, 20 Mar 2026
 06:08:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com> <20260319-spry-incredible-dinosaur-e2d9da@houat>
 <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com> <20260320-daring-smiling-sturgeon-fbac05@houat>
In-Reply-To: <20260320-daring-smiling-sturgeon-fbac05@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 20 Mar 2026 09:08:29 -0400
X-Gm-Features: AaiRm5246wdKEdxh8N8Rj2su1r47EwihnSgqZfzqicZgjLIbJ8f7J_nS6eW7zE0
Message-ID: <CABx5tqKPyQeT6eD8n1DVGLWpjHPq8_x6xfeMB_acZW4sAbp1WQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
To: Maxime Ripard <mripard@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 20, 2026 at 9:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Mar 19, 2026 at 07:08:07AM -0400, Brian Masney wrote:
> > On Thu, Mar 19, 2026 at 5:10=E2=80=AFAM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> > > On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> > > Anyway, what I'm trying to say at least is that, at least, we shouldn=
't
> > > frame it as a guarantee the framework provides, because it's really n=
ot
> > > the case.
> >
> > I see what you are saying, however these are divider tests, and this
> > is the way that clk-divider works.
>
> Yes, this is an undocumented behaviour of *clk-divider*. clk-divider is
> not the only divider implementation. If anything, it's the reference
> implementation, but that's pretty much it.
>
> So when you say:
>
> > +/*
> > + * Test that, for a parent with two divider-only children with CLK_SET=
_RATE_PARENT set
> > + * and one requests a rate compatible with the existing parent rate, t=
he parent and
> > + * sibling rates are not affected.
> > + */
>
> And
>
> > I want to demonstrate that the clk core is being called, and that
> > ultimately the correct dividers are computed.
>
> This is only true for one implementation, and so far has been considered
> an implementation detail. It's not something you can generalize.
>
> And to make my point clearer, I wasn't saying this test shouldn't be
> there, I was saying we shouldn't do and document that generalization.
>
> > For example, on patch 7 of this series:
> >
> > - Parent, child1 and child2 all start out at 24 MHz.
> > - child1 requests 32 MHz.
> > - Parent is changed to 96 MHz, child1 at 32 MHz, child2 stays at 24 MHz=
.
> >
> > Child2 keeps the same rate, however the tests show that the clk is
> > actually updated since the divider is changed from 1 to 4 after this
> > operation. This is to simulate what would be programmed into a
> > register for real hardware.
> >
> > I can drop the expects for the dividers if you really want in the next
> > version. Personally, I see value since these are divider-specific
> > tests.
>
> Not really, these tests are clk-divider tests, nothing more.

OK, I'll drop the checks for the actual dividers in the next version.

Brian

