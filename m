Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B8A742848A
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203604; cv=none; b=EvFChJAGsuCZYE6cKePOeOdjNnf0Qjs8B6jX7UGr3yOB428DgEwnb7NbPTO6IdHgSr6dWyTyk9jp15XGM5DpUIoNVGmQA/ZQtmtBusdu2g4KrYjXb/+StMU8OSLwyb2hvOURIXJdGDc7N5hwM9bfbKBe9mkFKzv6JsGe2OJNNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203604; c=relaxed/simple;
	bh=S0elBaqzdSTOcHC3fi2owYM/NUXzMqJZoXqPjanC/0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qe0HS6RC+nKzYEgdITbgLdiw04Rz4STrN1VjrXhyuW6V1yWGkD0PF3ZUm3w3BDYfvBRmQS6s4DOaxBF2UiPBwgIJFmciqkYTce9sZLBUjvqsUPv1ZqParmmKydlF516mlEwmlZmNVLGWaOoGoq5nBLAf1GAE1FkUK1k+3DrwAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VP0bcD2y; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=DFaH2Chq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VP0bcD2y";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="DFaH2Chq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772203602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
	b=VP0bcD2yZIJplL7lKSL3oHugv5PNjtS1jRkbbx9Jmab+r+EZXJCNlTbbkc0GKHuVYxiNlx
	kpQS/EezNPiYwK5jD6X+hxdBwVOUwnKEZNeMmBver5EGkPil6FZvI9Oyphczg0GB8wIVyz
	J/zD9X0GbpFhhNu0sZ/6/KJCSYFbAfs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-m-UWTdGpPXmDAa1e1o3YkQ-1; Fri, 27 Feb 2026 09:46:41 -0500
X-MC-Unique: m-UWTdGpPXmDAa1e1o3YkQ-1
X-Mimecast-MFC-AGG-ID: m-UWTdGpPXmDAa1e1o3YkQ_1772203601
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8950562d351so385450646d6.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 06:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772203600; x=1772808400; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
        b=DFaH2ChqygdE24mVwao6r892DL41wmXkAGqq1ceRB7NRPs7qTVcrDDGPBm0Ys2G66c
         n+A4TJCrrPdDU+Sq2Zn8+gz64BmvIzCdVChshOgqhwYV/i4mwSikHQ7Pc60nyWzT43gu
         BN2+gZABycg47kPEh8z6mlybA+AA1/klX/nW6m2DnAKdivLEeMI9z8D+BXmkRzN0gCHv
         IUhv89hgJPGxbtXFhx5lmxakfLE8Mfu4LNN7o7lB55h18eASf74BInvYTzqAjkmvt9NF
         hB3mkLwVmbIuXphxk2/KG3NwogRVkO8t3iTs5Hjj2ggjVw2v/XYIvFYriGH9Ppb4hEqD
         pxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203600; x=1772808400;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=INxHBhm1Qtgs5FsmxXRA+ozCcO035JVGQgBykqYXu7U=;
        b=UA8CEzKHsj5YVYjUrTWXu0ew3h/dY7WJMENzWiH7kdb2z+Wp28SmAbcMTbyXQV4R1Z
         jPEHAEmfwZ+JElZXB6ZO0Iwgqy1Zz3OdDophW5+jtsmNqqndWsxPlu6ASpqQ/3GSKj3K
         MjKwdoZzw0b8QBzG5NfORDTOJzUAwaqHWRGB+1mOrXnT/4MznpqDRKthfLsF0/0w5bBA
         wjP41dgff11scobAs7wZqmsGRkEiUVLamG58P1RRM6694KjPh/dWAKATLjxbTAY/Exxg
         4tEHwZCakmyHkW+WmYRbg2nZIgJ5+h38BnaJTgaIdK0OlH2SpkffMXtBeZOFKuUHpizV
         mESQ==
X-Forwarded-Encrypted: i=1; AJvYcCUABkzntidWJ5exMnibLQQmUyhvSN0Y784vVtNWg2yveOfVB29E2Hs/T4Xk2xtnHyouzfPo9veVJC4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjhuPcI1LdfVcae3keUJqtOpiuiVGw5uSiWe4UyI7qCFJn9fcX
	MJr0c9s9JHOyUJ9d7jUi3PjK5TSEZZZL6CUbuB7EXRgAPSRpPUZZ5BR86nv+/59eLdB2O0TjEcL
	/5dWtblYi2SZYh09pWX86Dxkt8VcisYBkZzHlyOIgKp/jj8DSWupVc63ekSwhUQ==
X-Gm-Gg: ATEYQzy7ZNIhi+gOhq6ibUHnVI8RHi9lrDQ86vrwAAMK5RO9m0De8eGNgbdQncR4yA5
	U+CUgN5rqeH6QnOF1YX4pHrDY7nbNQ58J2XpTquBmRNUAFDYbahPtXmYdV+5y9xuiIFzZWMLr3c
	796fJD1ErD8F4A6uxmmyD6WcxR44VrsjuhSarWl2c7cHXm6W1PUwv0TvUPmRncdgv2PeR1Y1fR6
	W03L2Ux+ExtbwdM8JPYgq1reI3WQiGGI7y9hHEbAQpOAw1EaAds6hz6nR+DjozhFi1SGCGUKuKt
	gGtqnYORBM1RfeyX/5R9B9hDWhkq4abWOc9bR1FkODRgV4x4ImrepK/qr6iL/+0Ep32G/y9lMHG
	248f6CifhEUjr+4K8TBIoDWD+HUoqkmvvl24cEZ52pXJ5qzxvH5c+Xb3q
X-Received: by 2002:a05:620a:d82:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbc8df094emr374422085a.41.1772203600505;
        Fri, 27 Feb 2026 06:46:40 -0800 (PST)
X-Received: by 2002:a05:620a:d82:b0:8b2:d256:d064 with SMTP id af79cd13be357-8cbc8df094emr374418785a.41.1772203600084;
        Fri, 27 Feb 2026 06:46:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf73451csm490604385a.47.2026.02.27.06.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:46:39 -0800 (PST)
Date: Fri, 27 Feb 2026 09:46:38 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaGuTq0PQU16XGP0@redhat.com>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-11-4421dd2f6dc6@redhat.com>
 <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWPiy2OYEntYNEMjkxYPrQBED2segMfND+4VtzdeQE6+g@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Feb 27, 2026 at 09:20:09AM +0100, Geert Uytterhoeven wrote:
> On Thu, 26 Feb 2026 at 19:18, Brian Masney <bmasney@redhat.com> wrote:
> > This clk driver has a noop determine_rate clk op. Drop this empty
> > function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> >
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/rzg2l-cpg.c
> > +++ b/drivers/clk/renesas/rzg2l-cpg.c
> > @@ -938,12 +938,6 @@ static unsigned long rzg2l_cpg_sipll5_recalc_rate(struct clk_hw *hw,
> >         return pll5_rate;
> >  }
> >
> > -static int rzg2l_cpg_sipll5_determine_rate(struct clk_hw *hw,
> > -                                          struct clk_rate_request *req)
> > -{
> > -       return 0;
> > -}
> > -
> >  static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> >                                      unsigned long rate,
> >                                      unsigned long parent_rate)
> > @@ -1015,7 +1009,6 @@ static int rzg2l_cpg_sipll5_set_rate(struct clk_hw *hw,
> >
> >  static const struct clk_ops rzg2l_cpg_sipll5_ops = {
> >         .recalc_rate = rzg2l_cpg_sipll5_recalc_rate,
> > -       .determine_rate = rzg2l_cpg_sipll5_determine_rate,
> >         .set_rate = rzg2l_cpg_sipll5_set_rate,
> >  };
> >
> > @@ -1041,7 +1034,7 @@ rzg2l_cpg_sipll5_register(const struct cpg_core_clk *core,
> >         init.name = core->name;
> >         parent_name = __clk_get_name(parent);
> >         init.ops = &rzg2l_cpg_sipll5_ops;
> > -       init.flags = 0;
> > +       init.flags = CLK_ROUNDING_FW_MANAGED;
> 
> Iff this is the Right Thing To Do (TM), it needs a comment, as this
> clock is not managed by firmware.

It needs a better name for the flag. I'll reply on patch 1 where more
people are CCed to see if we can come up with a better idea.

Brian

