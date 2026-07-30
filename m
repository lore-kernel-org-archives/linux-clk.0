Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481DC4519BE
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428061; cv=none; b=XgpQLE/VjWhH9KXiFCvsVEZuihCnvfjhBLamvZg8A62YmUACh49DY7cyKeuy2pfi95UCMDp6gTnRGC5AY556WEDXJCusOfLSUKuapqa7PqKjtpjsv+QrHuB7RodddT8YQFewYhVWNbcCC/4iHgFuHjuwwwooFp0J2/JOEaiqFNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428061; c=relaxed/simple;
	bh=RI77UXgu1cCbRF+YvSa6vEyphVqioCtWqxxDfmCM7g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJWJR+H6EZCqNX9yaIeH4FXg+uCWBnCa+vMYr9JqS4D+zJ/vXGXeRMMlD4nxHZ+ck5w9UKvXDMlZLfsGgyZVMZ8AoQu4ZYuKlXmnlOJQqOc80szAemhPgp3OhdiINZfFeiKR6910dkR6Vwn8L+UgC3puuM8x5NTSEdTM8j+9XfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VXYZ3VEK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Mw4Fgzyi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VXYZ3VEK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Mw4Fgzyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785428058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
	b=VXYZ3VEKNDUFHo6RuungshOHBlZpwRGevAfEXH18VT4rgiRWGC+wvAritE3iRgf/v+wdMP
	Yi1BKb9DvAF5Wwmea8UZQgST/Fk7GtryKCdfSwd9Cb8jBFD6qLZRTW/0D2TDfwKYrf3sZt
	Hi9Aw9Onv6l5p8a9gW84Nu67gUENHLQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-cnZqn8QhODGJPK4Hhv0gGA-1; Thu, 30 Jul 2026 12:14:14 -0400
X-MC-Unique: cnZqn8QhODGJPK4Hhv0gGA-1
X-Mimecast-MFC-AGG-ID: cnZqn8QhODGJPK4Hhv0gGA_1785428054
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f5b54da461so36723477b3.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785428054; x=1786032854; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
        b=Mw4FgzyiCqpGasbmDCWsA5XFcWK6GSrIjTMi9alLUdeohvL8orGZb3KHFwe/CJ6Dvy
         2ibKoGeVeDzsvA98O3mYup+2KmeDUelGOwlpoz+tTsUMi/CkA5+PN5gWkfxH8e1b3ZH5
         r5iEb22GEqfky76ZokFgvbG2Nkxptvu8wB+aJ2wDHOBjWuTBkwefQ8LJBgGX/qAoIabh
         fi2g2W+CaJVs+YRERdXZcU6JuPgLWw/xexW1oVfpsK4yTeI2XZks2hOWipB0H/TUIa5r
         7WwIBrZ7ESUql1+S+VkAFfMILvBxouUFbZ/sczwtB/gZgO6x6zOc3fTt804crJWXmlBD
         Cj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428054; x=1786032854;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L+6btDPNM97WzMYH5D23AWn86cOtGDouehBPODye2wE=;
        b=mom5wLtyfB9/q+KGoIVdPaY4OHxbwnRjjmcVMGuRIJHkkEOGqsZga4I/aHc/n1zB5l
         xKRfOx0rs5/9LySYB090dBHD2C+KMr4qQ53OZ2sBJ/ig7BGKtd3YmMyMs20zyr/B+/4k
         Etelk11ZNp85bXBRZXOyz5r76o+fsdbQW67/Z3n5IFif+4JCjDVKD5aHTe6p80ODm0FE
         Cbk5MiAw6ytmBon5sqAwDaD2D0JUE18ELzJGe9JGI/3kok+3fTJOeqJxGcUFKpM/6L5s
         6vz52gf5IqxqrYFvG/jdn1HzmTPUwpaOw+L+OLnaxLZBRv47yUHCmXkSc/R8byKHuFNE
         8Wtw==
X-Forwarded-Encrypted: i=1; AHgh+RrtjdSgNZReay0wxT6NvenzQeL7MKoMkiaGnxLAzuWi6BxS5csAFV6EGTRnZ370UdIT/e4ZtLifs/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRWZIujJqXDsiDIuG6habzuOMnJ8DDRHnej8+hFwMnyVbcDZLn
	R1f/TpprhGMAlOPhB4j0+bAWnXI81PJjc+XWWUBxXTGNV5StLROsooAVs7wgKYiGLKy9MZVUecD
	zKnRn6l4bMUzFehrXEoNVO/gcadkPL/piCdwvyK7vLXGa3MuexK/6BOlSDLTpOw==
X-Gm-Gg: AR+sD13iuf6sMdyxvZQCxgZzcYC90cPLtcJYKZXv+1IXVff1vC7wmymvpUlbFlw9J9n
	hyS5lo1jSUJsdL5Vw6dgpNE3A+jCU6n4C5/c6dJFh9tmVDVvBtBHBhWf3gIewXmE5nYo/h9zopR
	76lmfRigAMwPa/nDXk+itlweWVlppv4lWK2/OAx7cx4FWPYFeJdQZNjlMs4d4fO30SFpGiQXEWc
	QXFLTAkbvVP2zzjN6OnsdMvv0vuCcP3h467SCggBxAsJXJpkLbCedH+Q7kbYYu/unEm2WVYJS0s
	685ZuB9u+biZ4RJgprYpZAuKEFwly9gLMsvttQvH7NoLi9zLRqU70sSWc6e69gIy8bHeX0uts+q
	C1YoWbMRSbMALf0HfpLfrqvj0VTwBT/SwNaE=
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680467b3.25.1785428053871;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
X-Received: by 2002:a05:690c:c1e:b0:81d:bc5:4624 with SMTP id 00721157ae682-81fb8953397mr23680137b3.25.1785428053319;
        Thu, 30 Jul 2026 09:14:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8abd480sm12784947b3.36.2026.07.30.09.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:14:12 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:14:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	stable@vger.kernel.org, Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH v2 5/6] clk: mediatek: mt8173: fix memory leak on module
 removal
Message-ID: <amt4UpSfiMwxNTBS@redhat.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
 <20260707074839.240676-6-akkun11.open@gmail.com>
 <amjCTJguiANLY0vj@redhat.com>
 <amja9vnEoRTstmGN@buffalo-ssd>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amja9vnEoRTstmGN@buffalo-ssd>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Akari,

On Wed, Jul 29, 2026 at 02:02:59AM +0900, Akari Tsuyukusa wrote:
> On Tue, Jul 28, 2026 at 10:53:00AM -0400, Brian Masney wrote:
> > On Tue, Jul 07, 2026 at 04:48:34PM +0900, Akari Tsuyukusa wrote:
> > > clk-mt8173-apmixedsys.c and clk-mt8173-infracfg.c do not call
> > > platform_set_drvdata() during their driver probe callback,
> > > but their remove callback calls platform_get_drvdata().
> > > This results in platform_get_drvdata() returning NULL,
> > > which leads to calling kfree(NULL) in mtk_free_clk_data(NULL).
> > > This leaves clk_data unreleased, causing a memory leak.
> > > 
> > > Fix this by calling platform_set_drvdata() during probe.
> > > 
> > > Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> > > ---
> > >  drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 2 ++
> > >  drivers/clk/mediatek/clk-mt8173-infracfg.c   | 2 ++
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > index d7d416172ab3..65dc4489a09c 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
> > > @@ -179,6 +179,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_ref2usb;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > >  	return 0;
> > >  
> > >  unregister_ref2usb:
> > > diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > index fa2d1d557e04..8b69009e1965 100644
> > > --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> > > @@ -128,6 +128,8 @@ static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
> > >  	if (r)
> > >  		goto unregister_clk_hw;
> > >  
> > > +	platform_set_drvdata(pdev, clk_data);
> > > +
> > 
> > This patch doesn't compile.
> > 
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c: In function ‘clk_mt8173_infracfg_probe’:
> >     drivers/clk/mediatek/clk-mt8173-infracfg.c:131:36: error: ‘clk_data’ undeclared (first use in this function); did you mean ‘clk_gate’?
> 
> Sorry for sending you a broken patch.
> I accidentally built only with ARCH=arm and missed the build failure.
> 
> While fixing this, I noticed that clk-mt8173-infracfg.c can be converted
> to use mtk_clk_simple_probe()/remove() instead of adding driver-specific
> drvdata handling.
> 
> The helper currently lacks cpumux support, but I have a reviewed patch
> for it:
> https://lore.kernel.org/lkml/20260304181024.738391-2-akkun11.open@gmail.com/
> (Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>)
> 
> Also, adding PLL support to the helper should allow more MediaTek clock
> drivers to use the common probe/remove path:
> https://github.com/TeamYogaBlade2/linux/commit/d991a61887ab76fd83708dffe8e48192e01023d5
> 
> Would it be preferable to extend mtk_clk_simple_probe()/remove() with
> cpumux and PLL support and reorganize this series around it?

Yes, that sounds good.

Brian

