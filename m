Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0232240759D
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781539676; cv=none; b=CTkpwA6NEesgcDWCqBFsbtmkVFt4+EmLOMTpd6qooOmHmWJ8iZoOlGsqVfXcVv0iIfTJqyflSKzuLDJwEG5goH87sjbrBJTsgmIk7iKtieiFf+Q6HQ3mkZcywHPQEA5dBYBzQbULTL2RxhajSyMBUsduyAnwuenGC/7LnAsCM6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781539676; c=relaxed/simple;
	bh=BNWm3yBrWDSvhvRniGZ4hmT2BF78LFW7Pkimsfh59v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ryPgpuKHRF3X2gH824Npz3+XvylpvgQv28CHm4rrPn+xoZrZkCUh+WlFcD8uiD49V+gCDHvul1ySQb39CXxnBPJc7Ju2638cn1w9H9fE1wf7Xc3VKkbakxTqqyXufD+5jQgum/uFxSQMbiBx/1wiakdBTeUpv6e8qBJxSI4GWNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hl0e4N5T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pSdygqvR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hl0e4N5T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pSdygqvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781539674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=;
	b=Hl0e4N5Ty0qJWd3wfEhgTOr0kBO+LTEuG1TrNkx+D1AAwF39jnM/YxZTqGbB0rr4/3RWeM
	OTGe45NeQdZ3te3/OACZ9aArdvOG+VVYG/6+GNJ1Dy+uUbuM9Al3ksvAZ3mCwdmQbwlH2I
	eRfezutItiyCc1Bh4kbcG0dpmk87R3w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-FkRdVtqhMmSsbMz6wmkG1g-1; Mon, 15 Jun 2026 12:07:52 -0400
X-MC-Unique: FkRdVtqhMmSsbMz6wmkG1g-1
X-Mimecast-MFC-AGG-ID: FkRdVtqhMmSsbMz6wmkG1g_1781539672
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccdcd8dd3dso75711626d6.3
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781539672; x=1782144472; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=;
        b=pSdygqvRdZTXml1YG1HBB/8+N9L3Iceh5yhV+VxVs9IoAbFmf5z2XBDZnFHDB2XJxH
         c6PG/3IzJihvrBCOczJdn0J1oVi5/iWV7AIXdjxk39cgHXnAHvMRQJB46poDhN97vkut
         RqEivhXzYRxaqRqssS+pV1+UXLskt6kj2P79c7gO9O8jBX94nhKmiOd1bAw65PK5eo9I
         7nlCdXc+efNP5pVeQUXFKx0GGD0HuV+JmqqpC0oAS68bo1x8jYQgRT2E9l9y7R/YCobl
         SpuS1yPHfj0Ls9sp2HP2KM+LQv69iwZJFcqd/Nqy2ZR4q8vQhEtr7BPD2T+6wYlt31vA
         d3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781539672; x=1782144472;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqiCivCRQvHY+CsTahzYtUmnxa2excZbQQLs4Yc0u3c=;
        b=pM5wfud4WtDY8jlvzwOYBnGKh6+njvBIbNzQIZzoqVOepg3xjaTv8suv7EH0O1YSbQ
         Sqyki6pVBCQ98GZFvlcF2mFdcVF0NiF1DEnwJl4T/V1MUDQgpn8fqog6kBvszZe6TnUE
         Je4Y8Cd7AiSmCLdJkTu0T01yu2aWSTWNhgPevgZM2EudJul7D4hdoloNUu99zuz9ivU5
         cjI9HfNJc4U/NYszVgS1SO35UAxhHUaw/ZOCrCMA/7gfUdSChqz7LqcrMpEKAqcnQ2lp
         JoNp9jrdqtoaebwZv7yeMjcJQ8leR4San43FZMyzDqcGuJGLOu5UXPO0BbL2dUllfZ/4
         cclw==
X-Forwarded-Encrypted: i=1; AFNElJ/rQJnnwxCTKNoTw8L4rllpik4yFbnWc4hYdP1yKj2/VOAmhweipPf4MYkbEB3JOzDYtpeNYB/u1VI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUtTIgY43zHmMK5MjH77logAeT+JBzbWkdzesYZq4DyTssiQsN
	DMIkFbHxUYpmpVEOwvCFZhhXyJ1V7/jd1gRWs/0DNQ+nMCc20m07fZCOZVULOaW+XuTU02BClKr
	y62AiT3odowV0s6Req+wce4RumvL++MdLZHbg2ivrKIwqbctPZdPnZi+uPgrkEg==
X-Gm-Gg: Acq92OGO6As9uPe/ryhJHpaH4rVjT6AunrO+Ug6MvFasfRpbMbSZXV8Hml1iBoaWsDQ
	LA0LJ2sih9q3PZcV1E98wimrbK9hJ4CT1c/gcxLrovUFVcdU7H15pDrvHNuQp0InCxJvuV5/kc3
	6mNvXhbFRec1PyLF5lVJ+ln5+IWg1Ag/LXEXvO0LUhjagDaY6D8YgN2ixHBN7iT/02uMpSLlrdk
	jYg4NhY6G0e2GfmQGHqrcpD74vWC2y/lA0dqjNaUjtmjFnbUgFZOTwjWf2pwtAXiaKfAhclkhMm
	AEisynDYo90c5OH3E/5bPJZtNnaT70PixK2lFuRIl+Iebznp5LxphlAcnkt52zu4wsq2TmGxiyq
	z6T4T2zmf3y+KxqH9GSYUpUFfxPIMGDnpc+tv9b6dVtvjRtdWGYU7LH/p
X-Received: by 2002:ad4:5687:0:b0:8cc:e8f4:1636 with SMTP id 6a1803df08f44-8d9fdd239b2mr3018646d6.25.1781539672173;
        Mon, 15 Jun 2026 09:07:52 -0700 (PDT)
X-Received: by 2002:ad4:5687:0:b0:8cc:e8f4:1636 with SMTP id 6a1803df08f44-8d9fdd239b2mr3018186d6.25.1781539671714;
        Mon, 15 Jun 2026 09:07:51 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d9f1416a6csm2722726d6.3.2026.06.15.09.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 09:07:50 -0700 (PDT)
Date: Mon, 15 Jun 2026 12:07:43 -0400
From: Brian Masney <bmasney@redhat.com>
To: William Theesfeld <william@theesfeld.net>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: zynq: handle kasprintf() failure in periph_clk
 registration
Message-ID: <ajAjT2oiAjFPJ2Bb@redhat.com>
References: <20260601203500.658135-1-william@theesfeld.net>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601203500.658135-1-william@theesfeld.net>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, Jun 01, 2026 at 04:35:00PM -0400, William Theesfeld wrote:
> zynq_clk_register_periph_clk() ignores the return value of the two
> kasprintf() calls used to build the mux and divider clock names, and
> passes the resulting (possibly NULL) pointers straight into
> clk_register_mux(), clk_register_divider() and clk_register_gate() as
> the clock '"'name'"' argument.  On allocation failure that name later
> gets dereferenced by the clock framework (e.g. in debugfs name
> formatting), causing a NULL-pointer dereference.
> 
> Check both kasprintf() returns.  On failure unwind any allocated name
> buffer and the spinlock, then fall through to the existing err label
> which sets clks[] to ERR_PTR(-ENOMEM).  Freeing the spinlock on the
> error path is correct here because no clk_register_*() call has had
> a chance to take ownership of it; the success path intentionally
> hands it off to the registered clocks.
> 
> The neighbouring zynq_clk_register_fclk() in the same file already
> uses this per-allocation goto-label cleanup pattern; this change
> brings periph_clk into line with it.
> 
> Signed-off-by: William Theesfeld <william@theesfeld.net>

Reviewed-by: Brian Masney <bmasney@redhat.com>

