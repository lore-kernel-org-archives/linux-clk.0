Received: from mail-pj2-f6.google.com (mail-pj2-f6.google.com [74.125.227.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A34B0486
	for <linux-clk@vger.kernel.org>; Sun,  9 Aug 2026 03:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786246002; cv=none; b=dIaJ/uCoU4rRx7MM/3lyZmRDo52vC3VsJM/eRPHJBZCMxMT0klu/mA1ZXlDF3AJ8pOaXtSblAZmRTT4JXcmgQ2ZCv5ywGFpYxxH0qkILpisSZJEF4pqBHwOk2untG6G8SHUY71DpsvAMZ0Ki0wJmR20CW1/0jTWknhxf4ti3Lzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786246002; c=relaxed/simple;
	bh=PwkRwVu8DgQxChoGdguymS5qtXjGLridD3lojWC38lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pF1GpXQKwObg5EE+dNpv5XEC1CbdYdIIQgOs+mAEkhubWvx3mzc1dJ5qw68A1CVeGVPOZPzAiuPplgyDBTM3tyQsTFc+kXQ9YAgUM7XXjOCkd2vvwBj7iJokfncFENfTRM6k6OlPnsuXKe3JtTd4HLuKKRio0saET74oLXOb4RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXI37K5+; arc=none smtp.client-ip=74.125.227.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXI37K5+"
Received: by mail-pj2-f6.google.com with SMTP id 98e67ed59e1d1-38f25802c19so365133a91.1
        for <linux-clk@vger.kernel.org>; Sat, 08 Aug 2026 20:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786246001; x=1786850801; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=DXI37K5+OgAvTtUr1CHzhxkkr5jYxCfjLx2ijWDG66p/12PNSY72IjM9WL8TUpNS+X
         QckAoZ8bXfF0jzkKH7zTNZ5T39wffgFqFetiHmvUEb1bobpaiYDRLUQn72qsxuR9x2Je
         +UYI5yJoE4RA1GSp+UFD4tCMq+5NxPh/m5cT3M7w32mO+PYYu2CQASKVDVagnJZCW3et
         uWtv49y4hecdUmyw4N+jy33ahpQgXdQv+12+9AIsCk9gPMgD3ZBt7llT4FrQGv+MRf1V
         sG+qYZvxHXq4loRAn1fQQKZB3uHBKvmIReSKotwmQuz9lWrMKMxiZQHjWK0Pp+KKnP44
         ZHyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786246001; x=1786850801;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i+2ZP2VpD4hdDzBsnG2msnBM+iMSdLsJB7PET2eMgj0=;
        b=lBPVBcfrEj7Tjm/bbGxvYvYT5lwK2SfbKJ04q40U35bKFX/b8mzA9NzmtvtnmKEq/p
         1k+aEb4xnZDSKKGFQ4fBJlQ6aLO9V0c8rLcyjgc+UthqtqI5kGDCeueZXXQsKuyhZYu1
         PcYy6Bwf3qbgWXo3elma4ewGEgDj6iBL/wj5glntltpXaP5eKtl67NTdiI0yeN2axcto
         cKqCqbh568k5LNHqwCAMLubNhM8NVLFnlop42oZpftMaq2N5G/b4Ipfbioq0kd79/IjP
         2EmY5JJCiibsV7XKeaSLhhFWnvNtMj6YTyTarQhSGa5J+qv5gKu5QL/O3ryJC6YJORIH
         8p3w==
X-Forwarded-Encrypted: i=1; AHgh+Rq51caU0/Ar2d0PuNF0zWjVlUewhRLh+xgcizKeVXL9AjOTWWpMeSv8vaJZX37Yngflz3Po9ZXr5PA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOWfNzSpXOrllxLm6W1GENPMsvH9SlWMOphZQbU2ru5BxgbAj
	LMl/gngNVBefMZV+vptLuMcEpWMlwANH6bN3iHgOVBF+kMQroCoqhgtz
X-Gm-Gg: AR+sD11uxrPeWggJCuifeJ0Qo9wqA3M8xuufzoIy2UI882IRZ6uliCL/g87fkR60gws
	igi8OH9+3BK/S7fJ5K2ADi3KT9sxpNYOnMVNPobYw2kYpxET1KJfbkmRDiMcANkHc5eOMcScZxS
	KWok78kwyQPoM0pO0lircmuaefkT4+8zrtnvdeIa/p31T7HxtqXPEFP5bEgGpPAndDEpaPXtwEL
	KcaNoQmGEiKebMOra8Zz73QuZjmcKdGrZbwN9d7E4Nj8ooBjIPNBZ2x7TdAk+NLmRVR/Qk++5ny
	i2aWYIpILrCVvglBY5r7uoLV3CzeyABO1ZSsf8fUehxDLLMDHv8E4zte1hbJ0q/0845B2lIP4ix
	g5XRCV+h0jYQrB5sxTbInSV7Gzn9JfZZnwgqCqDjv8ug4TOpnb4gRjFRA2+Ke30GYdb08pE7uKq
	Y9puMBXmqY5ScGtI4Nq5WuYELJIvGK9ArH9w==
X-Received: by 2002:a17:90b:390e:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-392823ea541mr9657081a91.16.1786246000598;
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Received: from localhost ([2403:2c80:6::10db])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b35ca2b7sm3210539a91.4.2026.08.08.20.26.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 20:26:40 -0700 (PDT)
Date: Sun, 9 Aug 2026 11:26:35 +0800
From: Cody Kang <codykang.hk@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Haylen Chu <heylenay@4d2.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH RESEND 10/17] drm/spacemit: add Saturn DPU KMS pipeline
Message-ID: <ko2cc6jyezfyqzg2rdftyebeydw6nfd65ajvu46acfewhnrqxi@om2uhqdlhmzv>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-10-6de34d80e86c@gmail.com>
 <084a860a77f18aaafcda4b223eec4fdcd96e75c9.camel@pengutronix.de>
 <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <wr3264hzlya6zep433nr3u2acukizilkrqpkj444kfqeyaeorj@2rc4zo2cqcer>

On Sat, Aug 08, 2026 at 01:03:52AM -0400, Guodong Xu wrote:
> On 2026-07-27 09:35, Philipp Zabel wrote:
> > On Sa, 2026-07-25 at 00:51 -0400, Cody Kang via B4 Relay wrote:
> > > From: Cody Kang <codykang.hk@gmail.com>
> > > 
> > > +	/*
> > > +	 * Assert before gating: a reset asserted into an already-gated block
> > > +	 * has no clock edges to propagate on and leaves the register file
> > > +	 * untouched.
> > > +	 */
> > > +	dpu_reset_assert(dev, "lcd", a_crtc->lcd_reset);
> > > +	dpu_reset_assert(dev, "esc", a_crtc->esc_reset);
> > > +	dpu_reset_assert(dev, "mclk", a_crtc->mclk_reset);
> > 
> > It looks like these three are mirrored, and could be handled by
> > reset_control_bulk_assert/deassert().
> > 
> > > +	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
> > > +	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
> 
> Is there a reason these two cannot be mirrored in order? Please double
> check. As I checked the vendor tree, the suspend/resume side appear to be
> copy/paste rather than a deliberate ordering.
> 
> Please double-check. Unless I'm missing something, I suggest to bulk them.

Agree, I'll check.

Cody

