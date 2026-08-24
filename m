Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2CF133C195
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584574; cv=none; b=uPYDUL+WTwGoyiSRbzxHX75dj/sxnQ+ROopMJbZWqNvZdDniSXLC7K4frvGIEG9WWcAKEK/+6V5BwET+f6Mm6NbiSpudsRKCK2Y8fb8SSX38zItTltrkmL8+Pwe/Pc0D3B1t3S6NTl1Ws+5JD4h7OTX/lezigb1Lnm4GsJs9LqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584574; c=relaxed/simple;
	bh=6bkublHg1xrci+nJCRQzK3DlrDkjAVx27Om/QoC/B2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVlas4aFpZMOapWE6MRMTLMRkARSr07xo/hojN4OBZYzfxtjeSmq0baHC3gqwninPTxnqYHlfQFUScSY3p0LUibyoH6szCdGm3n9m0JiXJYdZL7p9rcr8SnkJNOj4s8xW47c3zutQk65/F/mGAACs4BR7cTzh8hUVeVbqzhbS1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H+keKXBE; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rmhqGAZQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H+keKXBE";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rmhqGAZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584571;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
	b=H+keKXBEf3cpapo+if/3cZsXtTbODaE5/+atLhBJ1DCGEPRSrcxixX4ZwltaLBXJCopmbg
	o7qyk3DWbQTYCCGspn1oXwzIHKnk23E3R1UPhQPqQeyw6ELK3QKnkwtjXfYwMoPVCRExSY
	9JmhLkYWIoju4WIomF1j7UX2cAFCRCc=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-U877nVSRO9KAXfPfpgYa-A-1; Mon, 24 Aug 2026 11:16:10 -0400
X-MC-Unique: U877nVSRO9KAXfPfpgYa-A-1
X-Mimecast-MFC-AGG-ID: U877nVSRO9KAXfPfpgYa-A_1787584570
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52769fc3f2eso51347931cf.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584570; x=1788189370; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=rmhqGAZQOH9nbZD3sf+zB628Ap2VMWSkxVMlJvlgidQsbqCteBIiUzDhdk09D5v81W
         lABBWPNSr5zpAQwC/fIMvMRFba1HxOo5gLXtum5dRr1GlBGd2l6urvx8/K66LK1tgUGw
         ElkIMZz6TnYUaVg/U1jl5Vrb8P1W3/wsOw+v8WIjBgXMdlMsoyJxk/Gg6pmBEd7K9063
         0Sz7MsNyTxmASen14Feelr/gj9ouqnbiPDm91hwJdpDx0klEmXr3Pasa1Vh0Yf+jpMFX
         r4GoVWikCnLke23Rc4Us7bgp+oavrKVdVnipy9twmpFepFn9C0svz/nyHehUXm4Z3U3x
         kiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584570; x=1788189370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lwN1IBw6ISFUhBtlLGpwjjwq2qTPw+f0zNub19DhCGI=;
        b=YAiqoRCGC5U59R0eVhnFhr+rqgaJbPJR7r826i1Inu4IVDm2O2/THPsyBoXUJCkR2T
         T8M5Rh07m8Jaw6V6563mzkEhOO3d1DlXHNfppyjwdcehTjPX71q46gy/lVclbYwYi+Pr
         jbNvm4rNrVQu0/KHJiaFuASy5pjWkXQH/omIqbdtD5ffpYR13KUu27NPEvrEY5ZhHoDA
         HL2CRGWaosZs1oE0bE4gpYs6/BDg6hyf2y3aaeWZHAlHGBl3EpORIr8BD5MNFPE1wATU
         PCiyAGNa/99bwZH2UICSoj11n8tNN+wa8rLLrKSXKKO7ZGptL+qC9nV1O8xqTHvNVaSP
         9oaw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/CECxN8gIPxWyoCMglFfhRHkkenCyeF7pQrFHpMHojpTX0M+BlFEfnFOK2mQL8DiSfm9Ase0BEIU=@vger.kernel.org
X-Gm-Message-State: AFuF++mQPz1iJ0wwMlWRbQ5zcqaXUaooj3lvktk/bubwEtl4/ba7TA5n
	sdq2P8vvtHGcYQ4drpNU2IbcwV3zgmF3H6NivXVG0Bqvq4j6BV+p2O9Uz6AmhbakMuup8ApA+kN
	UdCGpBgrg6DmQALeFRYUIn1M1dN1uMv0zfTBzfqecRDHQLlPBbdBeCbWsJ25JwA==
X-Gm-Gg: AR+sD13tY2ygef2IUcLzd54bVi3Lxw+LUPcgI34/rJnEiDLSuaoPf9oJYpwTBEgTlvP
	RSh/2y7/vRHWMHPRc1NVeInA0dbAhr0pRaUYOx1gzQuIKWp7RcaSoiKKdezp02/Udl5OhbMf2ZH
	RkuJ0/1WO+fkjd9hf9cCbDiDkhoEH4YoeVgsstnPEpnZb6TCRelMV5h0Q4BxqC+hWcdiUYji0LG
	FKjTmCTiLitiWuwWBcehTxtensBQ8BSJxhPx9VI4i8/KqZJvGirPtIBmE3J5y+UwqxD6Nlk+yza
	7MB4+9gbNDLD2veivJzOFUn47cisgAbHfV5a+CTvkqyPrrrweV2vQgz/ugD+IfPTzEUEnenwcT2
	JIbw6QasvzQt82o0OA2NX7+hSXfJCyFj5F78=
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279730101cf.8.1787584569761;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
X-Received: by 2002:a05:622a:1249:b0:528:a8c:aa00 with SMTP id d75a77b69052e-52df56e1163mr279728951cf.8.1787584569268;
        Mon, 24 Aug 2026 08:16:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4c1a1sm63772856d6.34.2026.08.24.08.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:16:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:16:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxgM9vY01nLeX_f@redhat.com>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:03:03PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>

