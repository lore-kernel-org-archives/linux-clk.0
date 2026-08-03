Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B458039DBFA
	for <linux-clk@vger.kernel.org>; Mon,  3 Aug 2026 13:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762066; cv=none; b=SOUCrcYvU0r8MpJPhrn44jA6ITxQeesMW0ykNKZqNkm0wAVYiNc0yFKx627rnHIcEhmgPKLZtHDWUc3O10/cjGmXcaFqzUYm0rgB6cZYu/CtZ+lN5JOPcLU3oUEqkaLMUH5du72eJa8SPWWwVHXqkEbRYmE7NSs7lMcFvfcOO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762066; c=relaxed/simple;
	bh=K1kDLS2yi/4AXDZ30Ng9gIKx0j7kkRu684p805bqleY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J1ZUCyJBPJDA3oMCp15vq+OhVAYSA1L2dOQ6BYXvOChmhI6NwvDj1GldUy6vSHnqcXuH9bCMIPNMdoBnguKKZuTEvxX1LusS/5JmWzYecG5yACa3Ew6SeNA986gRLt5EoSfk2Y7dMvxrOnBE6FLiKXffS00HvFrSxoWKPWupv14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fujmm8gO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=aGLpmfFN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fujmm8gO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="aGLpmfFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762061;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
	b=Fujmm8gOuutvbUBPAbdDFP+l+PHh5qnqvytxUmYH7UiORaq+fxY3VjuiJcnOIxIBbIQ7La
	dkHm0ZWWvY6rfzO2vJUh2TL0PDCZYgfNOZQleavGAepmdmpwQE1iOkhvNNbbBV9Pg0i4ba
	KU6Bd0nRkYNnE0XyfmPjw7iBdbaTt8w=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-i3ilpOJ5N8GERF4BeR9hLQ-1; Mon, 03 Aug 2026 09:01:00 -0400
X-MC-Unique: i3ilpOJ5N8GERF4BeR9hLQ-1
X-Mimecast-MFC-AGG-ID: i3ilpOJ5N8GERF4BeR9hLQ_1785762059
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81f8ba7885eso115998227b3.2
        for <linux-clk@vger.kernel.org>; Mon, 03 Aug 2026 06:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785762059; x=1786366859; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
        b=aGLpmfFN6elqaY+9XOd7waDAN6hfJigYoiusmMHVc25agUsTfMyJ71sB3oII6t9PAs
         BFbGqJ0r8xpDzfO8jgZedWsDcBRAXmAgD7YOE5cOqk7WSf7Cd1u/AvIq/HlBC4axfqo/
         K5Re+QUK/Q5gfyB9BC5joV/BaggAH9RrdITngKKX63MiuZ5wGbJBkLjI6MGvJybS/I4a
         smMbSYn5nZvFE9vWMF0AS0cLkliGGQQiq4CQSUXJqixApf/G3E0Dr37uptQNktI6VCQz
         8i2r7+K5JferLm43yNvUMB1MRFFxZkL239P7I2rnVx09TUAd6lnwrSNRbmp+4/uNdySc
         +GJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762059; x=1786366859;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
        b=hgxGQtPqCvMyj4kLEHuHniCkwgUzNWmFJvD4le4AoVFrXI0y5RctCZuQV84QxRlJ9y
         ruK1rny2Nzl47KZ3+CdkwkuygpSQn1pyF73zIk3bCz4e8qcQvA31SRwGPr6u4jcO7E3Z
         rRK4cQbDnio6nxmb3WzSEbbbWYNSjEQ2BB+lsOiyMvrJZ0b943GXbHiN7NZB2ToY8Quq
         n/L7Ejx1AW/4fBVy6beB5XjmqB6u2LwmmO6Fq46lE+ToLaUAN8hiedBInq+pxIl/cEOn
         v2H62utkccKGlAlo8RTMGKj2+1e/bMtovnD6WGFAKd8LrNu/mCK6lCNcqE88qEMPw2Su
         bpZg==
X-Forwarded-Encrypted: i=1; AHgh+RrllosbvNL4no+6OfVB/m6G/QTJaMyzyIRkuKiWgyGixBkfq97HLY80REMehof9IMxfnz/Ks0WiPvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1FBIwa0WCuRbDfKw1wK988xYckyPTNKyufxlQ1Gh05g43BuQ
	5icv570ToeFchPg+dF69E9tCGolAGHF7vIbZrp2YqmNU1sbsMz+bOq6bDaeEbYFJw6f2ccfrvRl
	XBCH6kDNmi0BkEk0n4SgS3TOCEwwTT4EHgd1sl3C6FYmLYJKW+eloKzR9PTtfxg==
X-Gm-Gg: AR+sD10Ksx/Y+IP6GZjdBK8KVd/zS0PBprZk6Bm7hc3xWCrphupFpI7Qg9xtNMGHCwZ
	/ZF+xYAjtnWS0Ze98LaxWAVrTlygSn6AiKR9Y0vqfstsLoUrUv4NxvXh40m4eW6X2Nf7yrPN55T
	7KJ/2qanDzaGcrXguUfh3Xt5spDH1qqqn9ycwsW2gSLY5sB6U4P5meU6XZu2fIGCF0iTXTZkERk
	aXxuIY3Ri2yML9rVrRLGRfGZ7vOcxPs58jrpoADFVHoamVZRd7qLJG7p2sunbI7DTIMVnNfX0V5
	FaFoyaUrW71Mf5cEwxhkI3DuOS0oH9jtZu3zK1qgY+TWB7n6dN2eLqnS1sMrt8dIj7d0VO3Sbtz
	tg+T+7Dy+r+sKeWflEeNgLOs6sBdBGuQ5MHU=
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120972297b3.34.1785762057766;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120971147b3.34.1785762057045;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm54877467b3.5.2026.08.03.06.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:00:56 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:00:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <anCRAqhQ93QAihsS@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com>
 <a216b77c125544c0871b40f31c021ef7@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a216b77c125544c0871b40f31c021ef7@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Aug 03, 2026 at 09:56:01AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > > > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > > > >
> > >
> > > (...)
> > >
> > > > > +     { /* sentinel */ }
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > > > +
> > > > > +static struct platform_driver rtd1625_crt_driver = {
> > > > > +     .probe = rtd1625_crt_probe,
> > > > > +     .driver = {
> > > > > +             .name = "rtk-rtd1625-crt-clk",
> > > > > +             .of_match_table = rtd1625_crt_match,
> > > > > +             .suppress_bind_attrs = true,
> > > >
> > > > This driver is listed as a tristate in the Kconfig but then you have
> > > > this. Is the intention of this driver to be built in only?
> > > >
> > >
> > > I will change the Kconfig options for this driver, as well as the
> > > related config, from tristate to bool.
> > 
> > Keep it as a tristate if you are going to use module_platform_driver().
> > You can also drop suppress_bind_attrs unless you have a specific need why.
> > 
> > Brian
> 
> You are right. Keeping it tristate is beneficial, especially for aligning
> with the Android GKI design.
> 
> To properly support module unloading and driver unbinding, I will add
> the .remove callback and drop suppress_bind_attrs.

If you are able to use all devm_*() APIs, then you shouldn't need a
remove callback.

Brian


> 
> Thank you very much for the thorough review and suggestions!
> 
> Best regards,
> Yu Chun

