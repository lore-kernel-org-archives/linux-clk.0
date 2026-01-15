Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E1C3A1CF8
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 14:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768486708; cv=none; b=o3Z4PTlLIP0as/7mgcvB8jUeBLEj4YzeqCumuByybq9Bafs8bZmBHRI/0U9L04DIM5SCmzyDJO7QhLZA7jtA31bRHZKn/HPTNDeqmbCXIX1syCusRVMB+GZuf86WAbpf08s7uPJagxU4C6fFUD3pnC+FWilI4eQ8ejjwLTojXU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768486708; c=relaxed/simple;
	bh=Jtc9sSjyX7Ms9NttRrBA88Rr+IN45iedh99EFmfPrDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HPR/9Oat7WoCXPTMZ8aduuN2dPZ3O21GhBhGPtfiVsKb9Y9FdBez39hLWl42XSvgVeQ2ZGMruAMJMrnVgGmcPHVAnrYfAEj+Je1UnYKmZS6IcBoScer3mO+LzhCLjacwGLS2jr/eTC+Ws1UALyBv70P3dckp2U76H/dLGkrww1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CEP6z5D+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MbJVVEoL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CEP6z5D+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MbJVVEoL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768486705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t4RC+ObhpewYzGNMozpFt20pSaSgz2F7mC9Tp5X8J9U=;
	b=CEP6z5D+ma2L/dytC1g9nIWwBPwfx//DIzKIsNwx2Z4ofXe75C9eZBm/+33+BCM8rekOAo
	TUktvqH/MsC/gr9a3AwTs9WBmo0fEMXw9ZXKG59MzdsJ53/9SukgG1wxxLF2eOAda+gPJz
	ru1m2w44nEdTSsKslEe0zRs/vITZI3M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-356-YWoE2r2ZPl2iarQy-Qmqnw-1; Thu, 15 Jan 2026 09:18:24 -0500
X-MC-Unique: YWoE2r2ZPl2iarQy-Qmqnw-1
X-Mimecast-MFC-AGG-ID: YWoE2r2ZPl2iarQy-Qmqnw_1768486704
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-88a3929171bso21729346d6.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 06:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768486704; x=1769091504; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4RC+ObhpewYzGNMozpFt20pSaSgz2F7mC9Tp5X8J9U=;
        b=MbJVVEoLgGL7TN6KC1WmcsnrEJHrRhIqQDkSjILuI03hmmIu/lBSc68uzZwoCrckY4
         QHOPzKqjMW7xwJnzAxZ67xNkBzhf2cOdR+ecdavVOTT0EDahplDgBICRNZXEbfPxkCV7
         9uv7Xt6FTFJt7gTYWdRNOLX4u2BRhkdL1Zoz0Qx97i+5I4QGGOVe/JGpdiJ/AwdWPDMB
         A/rYs5nmFkwd0th1a4EkHOCIwGpaToxdocmr2XPVgvVdXCfz8ZQrpm08iajq9IW6uO4j
         pV7jeQG7W9/NHendqis08tGGQHx4ec4P93QrGoA+RzSkpjT3PZ2Wx17dshBwuB8jrXZw
         6zLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768486704; x=1769091504;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4RC+ObhpewYzGNMozpFt20pSaSgz2F7mC9Tp5X8J9U=;
        b=tXI3gQCmRR8dYivydi/DCttmJ2fTKX9rjiAR2smV7UmegZbGM4g84/XzPDgef3FFyH
         yJgd1gPLYGgZJFn8IMO2WUfhDPwNotAs7nwuFeZ1zZXk5Vda0CEqV0wCQ7XWPfgPxpen
         c/a/s1A+zmfZldZKsxXIX3dqf0AbFps67I++2KdNyAfiDoXtPcsSwhfxhm32XloLnL81
         bmU6XvyJ1Lh5xVlFD9ff9lSzFF83F5Hr6Jd8cX2desUk2Gi1ltqNc3pz862iR4MPtnwg
         OTBgmc2pIl/M58zeSjo/S14lL4OfMWj+uVg8tcSL7+fpDoayl3BNtkkkXRQbKbURRL3Y
         Uo8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUloQlEV8qyGlcLvLAizB5Z3k5+UijaFTltVugnMNN/DAW3b2xXA3fWSjz7K6ii6BAP40U1CVtG18=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO/4J6CG8pPvAhngmQxYOQ/qFwR4AMmw8z26aUxUPEKnWEJD7r
	gusY+rDc8peLJNN3qkl3FFkmbT7XiShDP3h/LBaYD6FGUploKrmpfkW10VJ5ADWzZYRkYA1YP+D
	s32IdxmqOeP2ipBn07KyHsJG9wQ9g7BaO620iOpULepVR+o1McMXVkvrDIBHlzA==
X-Gm-Gg: AY/fxX5QIce10uTSWaYmvYvQMF3Uf9ZTefo0Xe+eHZVWVt8LlKo85eESPqAURAwpZZz
	PEfASYLq0S+F6LpksDA22ulLzJB35P0CKx/Gz+qJUpntLfi1zPhmQvtbnRazKjiHP8+PSzveDmQ
	LvxmB2kYpu4o4zsQsM7jF2JvtqtvJPzIqtstVoZyUC/KaG7gEVMNHXjfGGuAXvRDe506BiZeEfO
	hH/dQYv1xlMJ6yNtfihXm99JFQW5LWRH2m3ksBsH5nILngQohADppR2apF6q5DdCByEjnWpahxO
	TjPYWTzsTsUwpzzoM62QxW/utiAeTpCBPORLSlulRjvswSU0onELMoZJVYTiggG04AgJVfRMagf
	3zEi0aE0=
X-Received: by 2002:a05:6214:508e:b0:880:38ba:a4d9 with SMTP id 6a1803df08f44-8927445deb6mr82449816d6.67.1768486703850;
        Thu, 15 Jan 2026 06:18:23 -0800 (PST)
X-Received: by 2002:a05:6214:508e:b0:880:38ba:a4d9 with SMTP id 6a1803df08f44-8927445deb6mr82449266d6.67.1768486703308;
        Thu, 15 Jan 2026 06:18:23 -0800 (PST)
Received: from redhat.com ([2600:382:8103:a511:9f9:74cd:13ab:4d59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770e2a8fsm201085636d6.16.2026.01.15.06.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 06:18:22 -0800 (PST)
Date: Thu, 15 Jan 2026 09:18:20 -0500
From: Brian Masney <bmasney@redhat.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-phy@lists.infradead.org
Subject: Re: [PATCH 25/27] phy: ti: phy-j721e-wiz: convert from
 divider_round_rate() to divider_determine_rate()
Message-ID: <aWj3LPq37Dr9OLU6@redhat.com>
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com>
 <20260108-clk-divider-round-rate-v1-25-535a3ed73bf3@redhat.com>
 <aWelbtaZjS4SZGQO@vaman>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aWelbtaZjS4SZGQO@vaman>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Vinod,

On Wed, Jan 14, 2026 at 07:47:18PM +0530, Vinod Koul wrote:
> On 08-01-26, 16:16, Brian Masney wrote:
> > The divider_round_rate() function is now deprecated, so let's migrate
> > to divider_determine_rate() instead so that this deprecated API can be
> > removed.
> > 
> > Note that when the main function itself was migrated to use
> > determine_rate, this was mistakenly converted to:
> > 
> >     req->rate = divider_round_rate(...)
> > 
> > This is invalid in the case when an error occurs since it can set the
> > rate to a negative value.
> 
> Acked-by: Vinod Koul <vkoul@kernel.org>

Thanks for the Acked-by.

However, this patch depends on this other series of mine that's merged
into your phy tree:

https://lore.kernel.org/linux-clk/176661322399.4169.14248756511703978007@lazor/

Stephen asked for an Acked-by for that series or an immutable branch.

This will allow us to remove round_rate from the clk core.

I also have a small series to post that's dependent on all of this that
lets us get rid of the noop determine_rate implementations that only
'return 0'. I haven't posted that because of the dependencies.

Brian

