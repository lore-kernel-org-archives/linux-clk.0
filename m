Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E2D379ECD
	for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 15:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782142181; cv=none; b=ZBYyt4u4zdtE7rjW9TpTTidhWnMzL2Wpp1mYB7EdrZhKwVGJOLcTRjLSFggk+8hl8vRGHyNrxlzE+ccC1vi2dmqbI+HGAs27ns0zG+SAkpnZWaNWR/Ts5v/xzrXI89xo0at3zzm3ibhck5I3X9lm1bk9m2b75CFdp7GuEwaDs74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782142181; c=relaxed/simple;
	bh=c8wwsmifyb2pL3pRoyxMkh0iiOmUNLcnkaqNgFLh19k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAFZyE6m3dA61EL/Wc/Z+HJFoc4cIVQDscamFZOkqMZK6l/v829DbNInGQ3HDgI/oj3EehSRknXq/rkd3MePU97eee9weIkexvOu0W+HrpTIj4SYlSjkjkhcuzka99JKvSyB+HSdIHJAy2eKQDlei7D6wID36V9gLgssM9ZpZ3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ve7CaDdV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lM1sVt4+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ve7CaDdV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lM1sVt4+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782142179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
	b=Ve7CaDdV6Y79JyAHW3MwStgv6eqVizn7mNiEFNbkG82lYPvo2syGs6/XGpy4hKnVOWGPHU
	e+Ih2xBbEL3vJ1jaLNeKBH0nFGPzsjIttWsEi8jnGntW/qpWGprEK6QpJ3o2RsNOENIiMe
	k7puCzE+uJ5tTkpGth1CtKDsN0/mcoQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-APTlYbsdOfq_ryb2s7sItw-1; Mon, 22 Jun 2026 11:29:37 -0400
X-MC-Unique: APTlYbsdOfq_ryb2s7sItw-1
X-Mimecast-MFC-AGG-ID: APTlYbsdOfq_ryb2s7sItw_1782142177
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-519fd49d101so244801cf.0
        for <linux-clk@vger.kernel.org>; Mon, 22 Jun 2026 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782142177; x=1782746977; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
        b=lM1sVt4+mmMVnuAu/WAWEIRZoEyBk0Qm6UjTclXBqDXV4dqzAFkBIQ41UUM9t85ABC
         cpF2w+RtGgvxC82DSjAMr9876nn1JUFRBqDTi5a/rI7DpHWxbC6lgsrIDF7a+3E89Uic
         nvDB9HahItPbNjByUzWJniLNHPHr9WbpxQn9zvBgUF9DeyS41Gcvlv1bGrUwrtFYkDdY
         TVOJod798r0X1E85jTyzrT0dDJmspLLV3mblF3Nd7gpUr71KywGDekpeRl18VJPpDQd8
         bnmuZ1jBWsDf2NNY4DGMIdqMQxBy4zak6lxLEBV2d0dslKXAQMxBrQw2ojLgjAgy6+Z/
         rk3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782142177; x=1782746977;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JZv8lf2HlFMbPq29wrkvMcL46ITw+rgkk0A4gwUgT7k=;
        b=EQ2QvsRj38gvLanzer0sdZbz7ccBiAfwOOJGiQ85G3Ax6vYxLCPDf9GbQaVMmgP5rw
         tEAEIrYglhtfrgu1FABWTidGuMXn72KvZCWFfNKGtX1sl/sUP7eSnua8mymrXfhvOciM
         JCPd9jHdOlm/F+0vaF8h+yruk01su3BS3hRAE6sPdCM+4pGWQmFQvVjs6ofANkcb1ojq
         GcpundNzOqemwfHpC9v+mRO3UJJEJCnNXZ2/z4UpWCwqAJu7OgXyx1Qki/Zz44h9Y36w
         v1Lrvla2UDU60Z51kP5NFgTf49+NPK4kZ0fByhszCDNFLg54igr22qn5bVCOxnbsXGCr
         fA+Q==
X-Forwarded-Encrypted: i=1; AFNElJ++P2oQn0H26UvGdgVlCAaCH1SOFxzKZLc9nHorTmzGfR7tl5W0pRR3TseT54X15V+QP7MnJdEPaMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFCoxef32sH59RrjgUeFSLitJ4kYp8N2cFC+3j1GxAtrSf0Cy5
	ttDz6bj+PVpFRLVDWIMpLbKDNPoHIZfxP3REZH30v6M/ttow4guhWmF6C5xirUweJDJUZ4JxjRH
	1akVKClE2o/eUXSp0dJaFR7m5KPZhvdBUB/e0Le6xUABqua05lEauu5hgr5CbGg==
X-Gm-Gg: AfdE7cnrc3Oj02wSzPUrf1TxyuCI13g1/dwLMUbRINF6kMAMRRDPZhggwCe8xKuj64K
	kcL1FPMHjVV+QQ0jt2U3ORPvBTL/x5ZjKkDfP+eIFUglcov7hB/WAi+wmmbWOMotnFMugW642IS
	8ChPN1sTr1I7yLODSLSl+ePSeKFnPbCC2s1XXfe1K+pPfPLKpIzeb1RS1CnK+aVL66SR7rEddNF
	j6aldq/YBartXQU9B3pPQeeDloZ49to/TgkuLZn6qVbuVSdn4FFapgmSwzOcXbnCAkST+7pde9Z
	/VeYQd2FUpPZNSa0dTkb3oY9dXUnlkJ60dVGcs4eiiwlo9bpqtdmTjSW5jLMYpaSEALTpx7CbK6
	fE3LsVjikem4BhIPmobHiYWo8GSAGQod5xgRXqorAXt/9BQ==
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr336221cf.0.1782142176809;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
X-Received: by 2002:a05:622a:946:20b0:517:2a93:474a with SMTP id d75a77b69052e-51a514b9349mr335711cf.0.1782142176280;
        Mon, 22 Jun 2026 08:29:36 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a0984da98sm70349361cf.15.2026.06.22.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 08:29:35 -0700 (PDT)
Date: Mon, 22 Jun 2026 11:29:32 -0400
From: Brian Masney <bmasney@redhat.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>, Ulf Hansson <ulfh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-sound@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] mfd: db8500-prcmu: Fold dbx500 header into db8500
Message-ID: <ajlU3AsNUeviLuj8@redhat.com>
References: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260619-mfd-prcmu-merge-headers-v1-1-8ea0ee23b4d6@kernel.org>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Fri, Jun 19, 2026 at 10:27:10PM +0200, Linus Walleij wrote:
> Move the DBx500 PRCMU definitions into the DB8500 PRCMU
> header and delete the wrapper header.
> 
> Convert users of simple PRCMU wrappers to call the DB8500 helpers
> directly.
> 
> The dbx500-prcmu.h header was the result of an earlier attempt to
> abstract several DBx5x SoC PRCMU units to use the same abstract
> header. They are deleted from the kernel and this is not just
> causing maintenance burden and build errors.
> 
> The stub code is using -ENOSYS in a way checkpatch complains about
> so replace these with -EINVAL while we're at it.
> 
> Assisted-by: Codex:gpt-5-5
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202606180825.vUSQntkJ-lkp@intel.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>

For clk:

Acked-by: Brian Masney <bmasney@redhat.com>

