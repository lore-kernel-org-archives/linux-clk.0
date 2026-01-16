Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968B423A9B0
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578338; cv=none; b=JdQO5u2G38rsObAoZ4d/sYUfTNbCHe6Z3fSjRt5iU2HnFVRcWEcLsJOhBpY++IWqu75G1aTEe6bpx4BHmY9kJ0+r8OnBzmSgRQ1IKab1nSr9akkrHBGTI2z6Okiel2rr/E4JgSGUk0hMtUVj18Wt7ii85kRE06vjVkj/LncdF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578338; c=relaxed/simple;
	bh=m8V7jwBijQtS08YYEltYUnPoXXqq8ew1kNntGy5zBzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKXPUoczzFdX1h6Ztw8dJ4Tr2tL8msMV0HbGkNUvEPfkfuENVTszCFzYtBdbBTgUZm/qqKfp1NSkeKdcHN3knT7ZpoRSgeQplDvC0L+teKIngQd+7D+xJjyEz1q+8Z8WlM6fueHsyBX8fslPDy0f6yVWQxAg+wRzzoDOmfgEh2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UP1lxwX2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HUkM8t6h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UP1lxwX2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HUkM8t6h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768578335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XSB+cxcaZrZ1NetwzSMbH46eQqHmMnkR9IPEQXFKA1c=;
	b=UP1lxwX2V3XiDvqG6Mhcm7BdzewW+94vF3Xsfzhh1EzelZjmlaHgsbYWzTTlRCYFBSAvHH
	z0y5Hn7GWrZKivcVAgj/aX/seqRT9TDE7AaRLP/7aBXs79OopW98hZubpNah6PS/k1XTWv
	iYd0ZmHy0Bpib3lOYp8gq5q7/q5ReQw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-RaKx8PQ3NCCgXlkJ3furzg-1; Fri, 16 Jan 2026 10:45:34 -0500
X-MC-Unique: RaKx8PQ3NCCgXlkJ3furzg-1
X-Mimecast-MFC-AGG-ID: RaKx8PQ3NCCgXlkJ3furzg_1768578334
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52c921886so301230985a.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 07:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768578334; x=1769183134; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSB+cxcaZrZ1NetwzSMbH46eQqHmMnkR9IPEQXFKA1c=;
        b=HUkM8t6hkZcKo00vbldH93Aq3vMJZIwpPxnWlgkViJvl0qbrEMiF/81xauWRLBW44g
         CgQ00yVg09BD7t7U8x/TCHc3GaG+GYQqLFDegwoGb/vjvjWrfFQgpQnA/vZVtXZ+4jfD
         /DkwlzDMhdvkAfjwygEtju9jhR1fAkuxRhBentJVWrN6fSPUqoEOBK8NRzncQDa2kqQz
         ztQwac+fiyl1olH6Au1XjoPiVQZqLshS2Tl3TShJgQPLzA5Ulfnc8FZSC2bchdmLl30u
         8u0R0Fma0elruWdrZoPxRT83g8u8mXdFUqSUFf1lFCdkNoGwHvYQO9MbxJDvFqR+K+Vb
         AFmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768578334; x=1769183134;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSB+cxcaZrZ1NetwzSMbH46eQqHmMnkR9IPEQXFKA1c=;
        b=hp/XyJazWTvNLHQIJjyxSbeFkfLCvu5sjNQ9DHcPOktBqDL19SUh4Nziqi8mt1JCEP
         DNBI8eK4EkdLxAxNuoZlv2ncar91VQYGq4GinnFVf+hfRX846vZVDygDUGfKRb6XCukN
         wmDcJhSt1yp9aSzgHlTCgyw1chTts7TvoDJLsUJ2I3Y9chDmCOByd9yXJO4Ml6uPCzrv
         77TQAhhjHPGaRO7WuK5ggDzJtPHzGYxUVMlfYL5/aEUz8BAg7na8WKcPLIPxQzqIqFxF
         4gphCcDAC053lHSCbTk7TdTlPEKaxG+0Ep8640BPBTPr2p+1zme4bTm2a3HKsegFxBXV
         SfvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrm7WnuMG2T95+RS0y+MCnxfqhXstF/9qpXvqNVlVbx2QYhiwnp//8WRbSasR4kUlO1rOX+w6NcmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCL9bZIEXePzLH0i2JCXJCCL1y2bFWS2csL/nVmWuxpV/j8oex
	G2UGBDO+okHN6E1n+u8q6ynaWJq/Aw6YEJop8zBLGokiSa1DZZlsKGXEAaOQSjvb0p0HvgDcEUp
	tPiYoPkTEJIwmK/Sq1kITFU8xTV9+P1QhXPlnlYyjL17HAFGSOn5zPHkH2KxTUQ==
X-Gm-Gg: AY/fxX45ZNG6DGRwiBXw5wWIe+3frbE0zmwKgXzqTHJ9R5qAloGWu3LCmWRO/32kx9B
	o0+G3Qk57OGb16Xom6a2FC9bQAcbfGbbba4Ffi2zqc0KSLhhMbv1K7oXotgEZd8mtoRD43+U/Tj
	pc+1jJ12IofGJDdwci7WKLvyo6E0Z/KDsZoE1kVRZt4rpjM0Cq4xitwN6wwIEEgk5b4z4WZAwVK
	P+PE2iz6+PEGeexKd8upxAS1LZix+/339t+RBmX12qp02DR77s/X743k0jpg0G7F30KWpeSXhCh
	vBdB1I5t2zOlqfeiejRjpabJd1G/vv6QDkIZnOXx3X9jV5OJvUd7IXDaRifVVU861FWLSyTao8Z
	VDi9uUE1ncAEuIesEFHiEREaxd9rn2PPJdh7ztbXkn7Lp
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr447863485a.62.1768578333877;
        Fri, 16 Jan 2026 07:45:33 -0800 (PST)
X-Received: by 2002:a05:620a:45a8:b0:88f:e620:21cd with SMTP id af79cd13be357-8c6a67b093emr447857785a.62.1768578333307;
        Fri, 16 Jan 2026 07:45:33 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6d8640sm25187086d6.50.2026.01.16.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 07:45:32 -0800 (PST)
Date: Fri, 16 Jan 2026 10:45:31 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: st: clkgen-pll: Remove redundant kfree() in
 clkgen_c32_pll_setup()
Message-ID: <aWpdG-wPDbe07yPu@redhat.com>
References: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
 <20260116113847.1827694-7-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116113847.1827694-7-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jan 16, 2026 at 07:38:46PM +0800, Haoxiang Li wrote:
> In clkgen_c32_pll_setup(), pll_name is actually pll_clk -> core->name.
> This variable will be released in clk_unregister() -> __clk_release()
> if some error occurs. Thus kfree(pll_name) will cause a double free.
> Remove this redundant kfree().
> 
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

A fixes tag is definitely appropriate here.

Fixes: b9b8e614b580 ("clk: st: Support for PLLs inside ClockGenA(s)")
Reviewed-by: Brian Masney <bmasney@redhat.com>

