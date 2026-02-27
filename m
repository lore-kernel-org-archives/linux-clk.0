Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE0D2DB780
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772204471; cv=none; b=f/m29gwfWbolXuUQC4xgblIkcVH1yJdPJwty/xAZkH8l1sfOC8lLKntsylWEifPT8KSp/w4xU1WD+ux6CdfBje7grwPb1p6EgKVs+Hn3pB0cbFT7GgnsBEBJ2sGZeGtcKHXko2pNFHGQFCM9TLt1S2uRNHljYE6qA2/RuQi1CZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772204471; c=relaxed/simple;
	bh=Tdad2tDIZ4nlg5lofGib/mnCiNPcPkT7O6vIqYQRG4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ri0QLgolj4kGduxA0y+cVMqWrWCpfBmoL8dFBCkK7ewW2MCGQ1a1Z751j7/TwCki3L2lnbFm78Ae0EbHo2RApyn6c35y2CGTbh5Ov6WzOs49HhL3uAS00XPLby2ew/Ij7BIIZqmjWN42N8yoeWgkM+TKc5xDX7wuZjh0Cazb6bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RLLChCLh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hLTA0NCP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RLLChCLh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hLTA0NCP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772204469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
	b=RLLChCLh84VBGnyJlusFZeNp1aeMf5X14wX396DG5Ic3HPdiu/3D0YidDP8LmPmJgaEHQd
	oEPOH9UAjGfGTUvxL4Z+NegT6DxlJ+2ya9sajTI1p+ct5ZpsNbpYerzpb0MAhuzT661LL+
	zNR7SP3/QeFdVO5dD/GrfA/aNr/vccw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-DaSesTtGM7-VA-_wZOBJtQ-1; Fri, 27 Feb 2026 10:01:07 -0500
X-MC-Unique: DaSesTtGM7-VA-_wZOBJtQ-1
X-Mimecast-MFC-AGG-ID: DaSesTtGM7-VA-_wZOBJtQ_1772204467
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8954803bd74so22912536d6.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 07:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772204467; x=1772809267; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
        b=hLTA0NCP5M1OiNs7KIJZ9qlzw5BKdnsaXov2rvR26YSnsLQ66diEhXwuZy+jgv0GYR
         Ble6BeDFmDl4MJkPhH8s0dARreNguIa+ZJ5c0Hx9ITC+wQnxq90//TM5JSQbREpTicx8
         pPSY0OHGrYI2pGxZJ0/9bTFYNK1LV1cy7Hibu4pyvtA5QGJsXwSmeSDZTlWqwUBR0y46
         34Irmpm8/wXRIiTKQGSHhwabTKK3HRbXMlp6a7A0UGIfRTJcWbgenTE5LC4sIc4Z/ki+
         qKrokD7mu+nZu43RYOZCObqeQKEr+j5pUgKcG8/dUY2YeTxwuuHidlU2jboG5WdnkUfP
         3B5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772204467; x=1772809267;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bLr3NmqNXmYh6BXBWQg2YMvnGrmssYaz8RuukrCvN6E=;
        b=hOYdmS5FZcLalVxULMCh12NY1QrL7LwxdNIWJmlHhrzS/nnQRzunswUiGZEcRaYkXf
         dChOBlt+UWJLn98gf8abalgSgZRRk0Cwt396qliSx+HgLsvOJKqIf6AJ3p1GHoqfXEfg
         QSaUIHUzQCtvzw5Z3T9+F5/H8/ZAf/mpsywDnllvOOHS5kpeUP2KeCF3hQ+w0tLUqR/F
         1q+x2+FYubybUVlTFKjN+DGztRZxFyeyk98sLaM6PthVxG/DpwvL9sBsZiLRJjvQm9t8
         HHuJcfsEQAkI9iX/Avl2R1VNp242vYsmADrFWUDF8BbcYeq+ZOGCZegZWrXkfOsWLaTA
         cgew==
X-Forwarded-Encrypted: i=1; AJvYcCXNcxwr4rw3IjpMjKmO/x7kQg1z7+ymeKlfXyUlteA4iIoj2e8XlU/ON2I86iSemRQ4yS+pt2Qt5Zs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiRCk2PziNstCxd9NxmImo5Q6kGf2PR1zC2ypXudC3lhDxrDvL
	hjBn2Wuip1eAZCtdeQuu5meSc7o3vVX++sZPrJCOgGZwFja1Arodoj8WAkHvtgYZqeSiKgzTX6T
	XrnNbWKy2YZHL4NTwsMMhG9SIZtLg5WX11wE4TtdBZBtEirV5rqp+poWVLM5pvQ==
X-Gm-Gg: ATEYQzwtFEvJevlIOADbrRQzdetcVQNcUCMwZnv+ODkTYUlkQ5whAsQs6/5uhT0/cOj
	iapdHn5x84+6N1iI7ZMSI+rFlSokyUkRbcmQG8dHqgTCkw3KtRNnJwaRyuZjhe8F3mvuFqQxnJY
	dV7d7zy3pRX2wP38Hepkq9dTi4Nlwi6Rw5hr25oulkBaamUyMLLbxo0IowzafAcR4ExlhdhNemG
	EghwuFDNlIjI4SN5bEG1n6YlUvDPRPRcUrCb86X74tULslZmj7trpp7x4OTqY4UATJJO8mCI2hl
	yspz081aVP4yvysE+SYkhbY5DWlffnWMREI5xneI+OBVgVYlZdMOmNb3SZswu5sBreFwOy81/F7
	EcZBxxBk3lJw1NdiRXRhFe3wuu8aDpnRCDIIstyJL8OqIXPjZ775WnG36
X-Received: by 2002:a05:6214:48d:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-899d1dbd513mr43676606d6.16.1772204464892;
        Fri, 27 Feb 2026 07:01:04 -0800 (PST)
X-Received: by 2002:a05:6214:48d:b0:899:bc85:7b68 with SMTP id 6a1803df08f44-899d1dbd513mr43675746d6.16.1772204464174;
        Fri, 27 Feb 2026 07:01:04 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899c7374600sm46063276d6.29.2026.02.27.07.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 07:01:03 -0800 (PST)
Date: Fri, 27 Feb 2026 10:01:02 -0500
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 11/13] clk: renesas: rzg2l-cpg: drop determine_rate op
 and use CLK_ROUNDING_FW_MANAGED flag
Message-ID: <aaGxrm0SqwaJWCph@redhat.com>
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

Hi Geert,

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

Before I start a larger discussion on patch 1 with more people about a
name for this flag, help me understand why this provider has a noop
determine rate. Is the hardware eventually programmed with a rate
that's close enough to what was passed in? Or it doesn't really matter
what the clock rate is, just as long as it is running? Or should the
determine_rate function be filled out in this particular case?

Thanks,

Brian

