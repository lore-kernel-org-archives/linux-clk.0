Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D436433BB2
	for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 15:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510136; cv=none; b=eOGCvFuGwYs8LUsqDXFge4EdmQe1tQ/YG8wjDFM++xPbD/lDkMGwRc0+/IZ7lTAA72YjkvhffLTcdNqcTw1mhpVg4I0PKyu4O0RFkVhyNkDEkY7c/Cdc0lJosOwYLK87hiSRbHKTBHUGrdjA1EWAj/3AcyNfWEl971N9kjQ3V+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510136; c=relaxed/simple;
	bh=3J5ljbX6F8qfZ/q4Yho7WM5F7BpsbTZh0SmKlt8VwKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asIuF7wbWlc8409IcUcW7OOf1tKelmSxJ9h7MzkIir6v+TGxTLtd/whMqDaX62QJiVvOIswX87vS8ajrvWVZrXZkQO/cskPod+KMoN3jvGwyof7Xb0jcUWJOttnqca7nDPjYFC2SpryWc43Sb3MGAE9mQNri9aKqq2eXftQJYWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=M4BjpN8N; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sqDIEsZN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M4BjpN8N";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sqDIEsZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785510134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
	b=M4BjpN8NNaCxKRIwXOQSG/x3RLR0yjbg6ND7caHhRuHHJiqS2o3qNHHNYTnso6qFpJIGIv
	zfd1GWFOMZEyqwz5PqCVLZqBQwvM7APQUlS7P6J4tBp5/FsWDJ6+76ZrO80v2T0j1koRt5
	ZuqAxx+KrSbkvKSxd2TwrkDVFD5VYyI=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-684--2fDePvGNDGhaJ5-s1Acyg-1; Fri, 31 Jul 2026 11:02:13 -0400
X-MC-Unique: -2fDePvGNDGhaJ5-s1Acyg-1
X-Mimecast-MFC-AGG-ID: -2fDePvGNDGhaJ5-s1Acyg_1785510132
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-81ebbbd60cbso16177207b3.1
        for <linux-clk@vger.kernel.org>; Fri, 31 Jul 2026 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785510132; x=1786114932; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
        b=sqDIEsZNKu4X/U+TL2d8kcPJLgyfI3F4OBeZMDvk0kKaxZSE8diP85QEgCkJxgkh+B
         O3IsvGHDHZmAga7ja7POlScvSqGkGTEu6NSxar2bYMeA8psIqWHTkBhaMdLbzCbO/IAR
         Sxnqm6Hf42KEIQZ3N+C/BsQVj/XzMM//uNdND2g/wYgScW/RBBPBFt+hJHN+oiLpj8oP
         wKPvAXBzgfET+IZ1TDiVKLWcTdFiwBNfzOBG115sVWtDUvzME7l+glI/FFtGEkUT1AXm
         cM8hSs3YpFKf5/aYOY50JvifQSUe2GeN5pzuA+UqK6GCOcRDUDsQciURI6SM6BcX569K
         gcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510132; x=1786114932;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VT4GMCV34NLKfagWcQH9V4qPrMyXYT4pruyMrAm0O/w=;
        b=EH2kQY1YiZs6AK+8cit4UBSQ3qu5KRTRYcOKyoA5S2DkqEeutneaYZUx2oimYsXWyw
         CvE4+Tzbq7qXbzA3PMx9VXp18QrOgrxZkTz+T1Wb+tnxgF9CTIaAaaB0pZwFidH2yevR
         KQqOGIGfJTP+d1CyLzun1FKjKT8TyjJxgB/yAv7ddPrdUg6i9ZA63jv7Tn3hj7eeLJ1+
         pmIfc4PGJeGqw14nnm181EiXqRml/Wl+px3lWfSWvMZrvtwCb4SA8a/ebnt155Ki+Vyd
         pZbhzvMlx4k8PoQZmlMatgGYn05EC8apKOALJ7sFcVBWWHviafgY88pR6/e3qUQMzVII
         /pgw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5GBrgv4vQH+gpKiwCZlXL6cNnp9IUGNW9FwZ5f7FMoLflccaIWmksd/wbv90Tmnq2e/GPVZTz2yc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd78YtjUmrnpAkYJQ2+wsJoiBqf85ObLpaUaJ4OXYrxO+xhzfu
	q/ilMOzhf8UASniWU3yaqYAzl8z23VPunTVHpnuTnVQkT/4NPl0OpjQ+W5DaK2y6TinH2uGCc3+
	B3vucyU3EsOZn9bUwX+QKnP8Aw8enHmF78X7EN+a5Wr498fTOQPxEKFj4Czyb7XtlIWbd7w==
X-Gm-Gg: AR+sD10BORBs21+nwanjkipRDgBzBVNRLKS3CHZkJ65WMrC3g0Dh0y7VDBbuH67eQoi
	AyyCW/q8vtSCkCdiIsg9PDiLLfGpcE1f2FUKxxd0hcvPF21QxBOQFa96800RKQ8BJEZguxudnbC
	et89bbKw52lvpivKsTjb5UBR+Y0EkjFJPKFQLewP4DlsWAOVQdROVt6JVmZlBjrALaoRweOhWOg
	2Z1JzSwunAxueUwoYn+CJ+ectRi+fWUf+abUTBlrtKOXRPsq+A+ZOxYV5mOmM8fDsxorPLFqfb7
	wlRR9/WoinegF8tPgy8QKSWwosHbAzNQo4gbbfgsDtSudzu+P+bSyGW/1bsCa/7O/HfX+OALNJ4
	WRiL0IYyMD3KOmRNX08IBsvsu9ZsJ5SprlOg=
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1315817b3.31.1785510131742;
        Fri, 31 Jul 2026 08:02:11 -0700 (PDT)
X-Received: by 2002:a05:690c:3705:b0:7fd:e030:23db with SMTP id 00721157ae682-81fd4bc5fbamr1313677b3.31.1785510130851;
        Fri, 31 Jul 2026 08:02:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fcd11d08esm7875547b3.37.2026.07.31.08.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:02:09 -0700 (PDT)
Date: Fri, 31 Jul 2026 11:02:06 -0400
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
Message-ID: <amy47how40BJnHsn@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <577a6882b25e457fa94fa199e66f3197@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > >
> 
> (...)
> 
> > > +
> > > +static int rtd1625_crt_probe(struct platform_device *pdev) {
> > > +     const struct rtk_clk_desc *desc;
> > > +
> > > +     desc = of_device_get_match_data(&pdev->dev);
> > 
> > of_device_get_match_data() is deprecated. Use
> > device_get_match_data(&pdev->dev) instead. You should be able to drop the
> > linux/of_device.h include at the top.
> > 
> 
> Ack.
> 
> > 
> > > +     if (!desc)
> > > +             return -EINVAL;
> > > +
> > > +     return rtk_clk_probe(pdev, desc); }
> > > +
> > > +static const struct of_device_id rtd1625_crt_match[] = {
> > > +     {.compatible = "realtek,rtd1625-crt-clk", .data =
> > > +&rtd1625_crt_desc,},
> > 
> > Add a space after the { and before the ending }.
> > 
> 
> Ack.
> 
> > > +     { /* sentinel */ }
> > > +};
> > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > +
> > > +static struct platform_driver rtd1625_crt_driver = {
> > > +     .probe = rtd1625_crt_probe,
> > > +     .driver = {
> > > +             .name = "rtk-rtd1625-crt-clk",
> > > +             .of_match_table = rtd1625_crt_match,
> > > +             .suppress_bind_attrs = true,
> > 
> > This driver is listed as a tristate in the Kconfig but then you have this. Is the
> > intention of this driver to be built in only?
> > 
> 
> I will change the Kconfig options for this driver, as well as the related
> config, from tristate to bool.

Keep it as a tristate if you are going to use module_platform_driver().
You can also drop suppress_bind_attrs unless you have a specific need
why.

Brian

