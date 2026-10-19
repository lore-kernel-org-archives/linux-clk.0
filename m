Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792447301;
	b=1mzLlTrND/pqZLlDlKCCWauZ7WcCdIeHNvohGnqF7QFt4VsFRPGE+Bff9V6mA0Nh6aya
	 uD5ZIX/WwU8ANermz76TtftxxPke1MB9px1yZIbgd6kz5xFos0biJJX3AJJU86vf/Ho9Q
	 AjS1F7GFqN8XpUPQK9frwcy7wg6ZBsnIVNre8A0EtNM6hhJI2p9SczG+3rO1Owg3kHNV/
	 3t62PLP3baE9L1vI/+BjqDdlv/MDgCJY/WQCgfV0ijnGYAEq87+l+KOH1SqoIC0EOaTJ+
	 RjKaJXMq3oOt+RIGdlUXM7k3690ZeBu3umfWe5gTAkdg9VKF0M//b1yRb7VAE2KTzEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792447301;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
	b=2MZPbTs6Cjx9DzroZRJFqWZqCk6FhucQZW+ZtrsDBjyhs61Y3EqjpKjJuecvqC8fw1SX
	 RTCdu/Z6uxgIW+XdgdKDI/8fM3l1Umpc3F6I3BUg6SvPFlSyF/p8h3QLwP9w7lsVf0w6S
	 5MqZ/95zmMIOr6wdgccexPLCVgYkZbNkFuMnHjF7YGa1l33CompZ0phBarVnMsTNlFU+1
	 KNLy811S2txwcS8YgEiLUArAwjXgY+rmJsylh12Ux0J0p4pUZfmmCqCCZz8WEm7/9iluc
	 tzYPniWs6Lc8eO37E5Yq60mBkbq9pdQg/YQUkpZWLgjEu3qxi156Zanu2+XAo3xrOlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UwC7KoqX;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U99L6brj;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31497606A329
	for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 22:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31497606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UwC7KoqX;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=U99L6brj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792447299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
	b=UwC7KoqX3hDuwaY2XCIIVLMRIf6PJTF7dQtUs7LsgrQAMFNJHKywEIhEkz9mVH4T8LYsNk
	t3VC8Y6g1vIMxxPGRVOQYd/Ik4EGTqJgPrEIZQ+8xkG6/n/ZPWfhR9i6tmV+8z5/yHs52G
	4purmQT4PFPs50M5IrrDbCO9s5zvjkw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-547-SxQrHkTYMW6GKN8cD1FAHw-1; Mon, 19 Oct 2026 22:01:37 +0000
X-MC-Unique: SxQrHkTYMW6GKN8cD1FAHw-1
X-Mimecast-MFC-AGG-ID: SxQrHkTYMW6GKN8cD1FAHw_1792447297
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b92acedd9so88401956d6.2
        for <linux-clk@vger.kernel.org>; Mon, 19 Oct 2026 15:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792447297; x=1793052097; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
        b=U99L6brjV1lqzwzPmx35+cu62gqgo4cbv/i9h4urXSCiSwc5p6HQZrB3oa1HnAwkUm
         V2oKtYYljm94VJas3uRPAivrgA6jWb03Mgnogs6vadTzci2D8RBK5tkjs4+OSsbsuQQq
         rPrLPt+RUONbYmfdhvKpUumYNRYZbdqxkuQYwFz1ETrTVwfih70DYRzeTAQsaAkXLDqi
         9k13mcesGXM3M5gl/gMwNgbXTj78l5yRdnd3TPHU9JkTqPu73ss2uusTRR+D0rdPFWk+
         VsxeQqErxPJ7wTz/JlYo7ltoXtx7xKFhkGUd5l6BEMqhPhvwveK6KowUjahYq/6FYDeu
         9NKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792447297; x=1793052097;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWJhnEGj4T5w1sdmz82kxt5blTS0qkMiSy1O4lqtOrs=;
        b=hBqOdMtzii8z/QmcnjRLtNmI8eU93hlqKlavHOeyfCtgwPbkFWR4vQ2wSFg0vyxN5H
         a/KI9EPfaJ1DdY+N6mxh6SWiyEz8D+gHY0/p+USJaOKd9wqBt4dGOL+palIcc+kQ51xz
         uHhbXxjzu+7C17c4sVCLYydZxdokclenIvaRHbk90MiRM7B04LZXXBhAZPwS4DMOErpS
         bRThDRlL74KcWNZOXWE0M4TZ/yKi9stgUoOynJjottbz7/+Ae1WiGBVeryvkgTh2f93V
         aCSDRm6TVhEzhUVo/K1GKg2tOHOE0n6WMK/GozeT3SUkQEmb1uLSQNNS1+Azvs/ZDeT1
         kL+w==
X-Forwarded-Encrypted: i=1; AKwUvBzNm1ylkDdvfIkeYb+e6r9+yGkmrPCwKHSUyLVtozWTLAFB5WP55J4skkoNcPAqi6rAGGQ7qOKl9Vg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhIEDoxK2JQ5Pm1bTxuhd6JVPEjdm0VgZ8+/GR0+b1/hM+Qpqg
	R99BaC+F85gJV8PCSyW6sBuNyFam8HHR9b7AHTkOmzdpqFLARPvmbidCyG44JTkU/N/yU9uq1NJ
	qP0JwdQ15F8dxRzZUOte3ORecAEADWmnhiGH9r5ikor6DRFl5LET1B15/fuPt6IseSGbNGQ==
X-Gm-Gg: AYBFou2utnovs0e8pfqxZtapr/3523SQwG8pQ1t5aq165VdDnRhZV7xkzrB8yvf38A6
	fQw0MnBisZK5X13cD/YAQBrOzQWLZDmp57DHaN380u7DEcUEVlxAqGXrt4BfWMRVDdsBSWgQdeM
	fMF9Tkc3hIYAHxQQ1BTTDlVWDCFBOvrNs+bHyyEdievr52DSRdeofVH0O5xlCypL9f8GsN4bSG2
	q83LiEHDrhiq3on+Jdw6cDAGvNPukuc/SP/fjyhtZXe3EC0sfy8gOuXJSPFK0raN30NBbRWj0fq
	c4rvsL8hv55+4m1EcfDR0hFUemJ1cUYh0j6umh1q4GeIJguLhSbMrphVudzBxVL42v5Zlxttcr7
	9DNOjuXWOfvYawEZp+WBWO3ZQyWA=
X-Received: by 2002:a05:6214:62d0:20b0:91b:ec1d:173b with SMTP id 6a1803df08f44-91bec1d17f8mr77943716d6.43.1792447296729;
        Mon, 19 Oct 2026 15:01:36 -0700 (PDT)
X-Received: by 2002:a05:6214:62d0:20b0:91b:ec1d:173b with SMTP id 6a1803df08f44-91bec1d17f8mr77943046d6.43.1792447296057;
        Mon, 19 Oct 2026 15:01:36 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c040da11bsm7375906d6.35.2026.10.19.15.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:01:35 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:01:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
Subject: Re: [PATCH v2] clk: ultrarisc: Register DP1000 clock provider earlier
Message-ID: <ataTPiXwPV9n7PAx@redhat.com>
References: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

On Wed, Oct 14, 2026 at 11:20:12AM +0800, Xincheng Ji wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> The DP1000 PCIe and clock drivers both register at the device initcall
> level. Since the PCIe driver is linked first, its probe runs before the
> clock provider is available and defers.
> 
> sysfb_init() runs at the same initcall level before deferred probes are
> retried. It claims the firmware framebuffer aperture, so the later PCIe
> host probe cannot allocate the overlapping prefetchable window and the
> GPU is not enumerated.
> 
> Use subsys_platform_driver() to register the clock provider at the
> subsys_initcall level when built in so PCIe host probing completes before
> sysfb_init(). The helper keeps the normal module init and exit paths when
> the driver is built as a module.
> 
> Fixes: 3948a36be42b ("clk: ultrarisc: Add DP1000 clock driver")
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

So we are going to hold off on sending this in for v7.4, and I'll merge 
this into clk-next once rc1 comes out in a few weeks. My series for
subsys_platform_driver() was merged through the qcom clk tree, which is
in the clk-qcom branch. With the way we do branching the clk tree won't
stay bisectable if I merge this through clk-pile.

This shouldn't cause any issues other than a slower boot. If it's
causing other issues, then that's a separate issue that also needs to be
fixed.

Brian

