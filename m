Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0F83909AB
	for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 21:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787174731; cv=none; b=usynGwJS9Edb98toy9awK6F7esoEfOHBAAfTTQPaYztqEDRvjq/V8DH1TAC09Btrk5hK1L5bpKWKhJZCszxqM965tqm6OA8vf4Fzumd9cd+ovho3Y3pWMv3cpQEcfOtDnMLUkijtf0/o38EP6S1Wg5zrBTfPYr/lG4JVPXzdT7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787174731; c=relaxed/simple;
	bh=UUGyNBJjTMf+pfjuzw/MHt+x1iGR/dRGnQ/gPySSvQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGSjQkRLF9qst9qIjMsXJ+osObnMdN9nGSfHC3S9vM0ZlwSpterGft5m2bZ5J3zY9RUaoei3MWmHfA2eyoycxqZaQKBvp8RMBH3BHwNyHJTR7ioMPDqEQsP8+b8qzPwtpjwM1JCggNJ1CZ2o8l3+ny5EnJAMwv1ZhwrzIT6RA2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fk0d60eX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=p1v45i8r; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fk0d60eX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="p1v45i8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UUGyNBJjTMf+pfjuzw/MHt+x1iGR/dRGnQ/gPySSvQA=;
	b=fk0d60eXoF2DAc5Qs1KrolKQtw9N+qSSzH5CvpScoNaze3sbk/157tu0B0CyRZJJwI3akV
	uNLXw1A5n1a6CuSI6MZkj1+YbDwlDM1tMdYPQvfJ5CZrNetZMdlNrT+0qArNJ1h/tgkGnM
	dNwjRUQt6MQCOceV1FdSMJ9KbhmFxnU=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-Ej1D7UPxOoOoKEs9flbmLA-1; Wed, 19 Aug 2026 17:25:17 -0400
X-MC-Unique: Ej1D7UPxOoOoKEs9flbmLA-1
X-Mimecast-MFC-AGG-ID: Ej1D7UPxOoOoKEs9flbmLA_1787174717
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so18382311cf.0
        for <linux-clk@vger.kernel.org>; Wed, 19 Aug 2026 14:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787174717; x=1787779517; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UUGyNBJjTMf+pfjuzw/MHt+x1iGR/dRGnQ/gPySSvQA=;
        b=p1v45i8r5x8albo13AtveQ/CLbTS2ylsrUkriksK7moZC3reZChw2arDCA5bUYVXN/
         ovEoP2TYmmOEWHScPnoIjS1bxfQRi7IXDu+3pJwv2I/x7V0gR3YlBXd8F+kj3fU3DqKH
         f6MBHo4rKCSL3Epk9E+cITekfPQmxchGIafbThbRqdxf5l3se0BpLuS9iFFvH++x2oe5
         UenBClTscf138CO1Bf2XeFzcg8XljbUNskogcyeq9D8ZmbzEqTDPxrJ8A0ejkb3FcAmn
         6puqA/tuOrL+eQadVTcLmKHHktRMfilK7tucHE4Y91nAfz34X++hxiLB9JLtKkWRFCeA
         m18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174717; x=1787779517;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UUGyNBJjTMf+pfjuzw/MHt+x1iGR/dRGnQ/gPySSvQA=;
        b=JF2ZVKa4h2lrrKUsS8XEdFNUqy9C03AeSssVex3EJ7skVeMB24PxPvoLZkQ2UySgZV
         3dO6jL2tPQNacjZ3N9QRCq1SC0WDHwbGQOwLKnD3m8Vrswr8Gs5RW3O6fwEI+W/BF+J8
         ldaYuov9Ibql2cRi2GVQv2SoYLbd96OJIv2lDHmUUkWNTmsOcvbGlk5Bet7StnmC0XIJ
         fKjPpU/vmkIHAwOcTl8cDvKBVFrYxJe37wegMZ5pyUT+zZaithCK1QD4M1pX3zWxOWjh
         sbpHX6w//+dF9GWePVfxuPknB34ptHfJL3MEOiGsMJtestFd0Gu2nyxe6TBwlyKB8iCa
         ra3w==
X-Forwarded-Encrypted: i=1; AHgh+Ro2msUh6t0MqUIitf82GAJb4PJ1XKtHUFU9cuzhPx/AjQwR9YmRa3R1m/5lhcy2kRV6UgSgs28p+Oc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw081gvN8NHEKpwdxTwARROup+j4mkIaPnSfIyEPHOLbR+K6yYP
	vQXW9c+5MbSmNSabSmxhiZhtdCFxHD4eRu5cRIL/eLFHaVYJwIL8pfL1dFznvOR/nPWiYEmhVWD
	JhXLhFJJ85EE9w1PQM70YAelH6XaNj/7XNqKolYxL7JMPokeXPalbTokBzxrmkQ==
X-Gm-Gg: AR+sD128Y4x+W/9rdKBEAooopMRruacx4B/RNEl9NrIRn1gsbwlNdJfVheUZfEUSNyx
	8i+jryyBUl7bct+JlbcR96kUyv583iEU7noDnYxSWZeT7hl/Q4FDA35N000nVMTOeOkBM50bXnh
	/pPIOuB3kwsDk+fUzl4/tF9CLcHe7JX10Y3W+pHOiIwlmGeLJRK7Or9AuTKlPt2X/PsqL0la4cR
	5neL+NdDiGnvkE6uL6X3AjVWFX3cDR+23sqoVyAqs6NfFwI3SUhVPSjZ5A/k1QuoqYrHjePudC8
	DjPzi/42T22yk6yXLkbshWNMSW+o/66TY+SqxYdVlRXxZNK5MEg89pcQkbD3ZxiHFyG6VNVoGbl
	CFC8tRrapIeIEVx2idSiMPpQY0qYt9ejAFws=
X-Received: by 2002:a05:622a:1e19:b0:51c:1cf8:ca4d with SMTP id d75a77b69052e-52dd59f09b8mr80118271cf.13.1787174717355;
        Wed, 19 Aug 2026 14:25:17 -0700 (PDT)
X-Received: by 2002:a05:622a:1e19:b0:51c:1cf8:ca4d with SMTP id d75a77b69052e-52dd59f09b8mr80117801cf.13.1787174716959;
        Wed, 19 Aug 2026 14:25:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd859db06sm18788141cf.12.2026.08.19.14.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:25:16 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:25:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Matti Vaittinen <mazziesaccount@gmail.com>
Subject: Re: [PATCH v2 1/2] clk: ti: mux: resolve parent clocks by DT index,
 not by name
Message-ID: <aoYfOvi6B6ZGCMY4@redhat.com>
References: <20260727-mathieu-wdt-clock-theo-v2-0-c048a6394436@bootlin.com>
 <20260727-mathieu-wdt-clock-theo-v2-1-c048a6394436@bootlin.com>
 <CAMuHMdU3yVqoyHC4eNF2NuYo8wy+6ODLoYat4R71X99Mxc_=kw@mail.gmail.com>
 <DKSOGEFQ4RJA.3LEW2Y8991H17@bootlin.com>
 <CAMuHMdVfFZ0P9Na-yD9EzBaUqkyiwjo8byxA2MouBt1DM8xQtA@mail.gmail.com>
 <DKT0MN8YMIAT.2ZI006JRL0OJ@bootlin.com>
 <CAMuHMdUsupXQb7Y59ri8wtrjixPpWoLRk5SsuieZLjKG4Y+gwA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsupXQb7Y59ri8wtrjixPpWoLRk5SsuieZLjKG4Y+gwA@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Wed, Aug 19, 2026 at 09:13:08PM +0200, Geert Uytterhoeven wrote:
> I submitted a first set of fixes, incl. "[PATCH treewide 1/5] clk:
> ti: Make sure clk_init_data is fully initialized"
> https://lore.kernel.org/e6f52b34163c8e708c1100107b437af0b3b049a6.1787165329.git.geert+renesas@glider.be/
> I will submit the remainder (way too many) later...

Thanks Geert for posting that!

Stephen: You can ignore my message about backing out Mathieu's two
patches. We should just pick up what Geert posted.

Brian

