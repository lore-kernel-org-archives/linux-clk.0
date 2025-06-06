Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018D386340
	for <linux-clk@vger.kernel.org>; Fri,  6 Jun 2025 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220107; cv=none; b=DPT+G54OGjyPZXgNV7++f+Il/vADnFOK/dvf7N5M388IrOunswQzr7mkHJOLtzvUgWNUPhQQheGKsrBRs933FewCPqz+8xpr4bJyiqZzAnsLFmpLcci5i0yviuk3KOc8Mrb4+GEXlNN9IVXo01YfsMtnZONSFCXpgEwc16vot2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220107; c=relaxed/simple;
	bh=Li7ibbFp6IAWaPGC1mntaG/QZQpQuadYqbXM0mDxQQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVHXCcZE5pGMwmdNX0ufI3+WivDjOy2o43KpVq+YoLZFXN65v4T17OYjh6rT1uoyQrx41q3Ri4IcLfj5XSN0GGdFzLVqgBWPEdld6ZK25RH4JIceDraVb/A9p17p0cGQZcttPyMqYGSNx6bC5Ari4zNix066BdMGl7aM/tQptoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=h9PkfUzZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="h9PkfUzZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749220104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ALf2A6SSvV1hHGniFOaJAJDOmsxkAraK1tIfpQpNucs=;
	b=h9PkfUzZA3MRWTsbRoTYap/fBCFHf19oDLKCbgdyNUtKJ54askMw5crOmbeTI0RDlZ4JNJ
	1lEzC6OdgHRy9zLCpbQ5fNr2/o3GfMbFaPDShTemluzL4I5DaGLyz2E+C+/Ie8/yJGGhEq
	6LkjM4hEiorNHLNjoY6JVi28iNndKts=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-s8-mMCRqMi-EoTM6Hhet5w-1; Fri, 06 Jun 2025 10:28:23 -0400
X-MC-Unique: s8-mMCRqMi-EoTM6Hhet5w-1
X-Mimecast-MFC-AGG-ID: s8-mMCRqMi-EoTM6Hhet5w_1749220103
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4a589edc51aso49180371cf.0
        for <linux-clk@vger.kernel.org>; Fri, 06 Jun 2025 07:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749220103; x=1749824903;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALf2A6SSvV1hHGniFOaJAJDOmsxkAraK1tIfpQpNucs=;
        b=woB5BOdHhYSAuTPYZhAxCGNl5zVJjS0/sWbZqqzNhGjQzRIkd8rtkFLROG3y0+4XCJ
         OjuhYp4xfia27fxJw+RUdrKaj0L1wO6kwitutxAJbbzsT3owagYkua7nAI5Ejo8IQ4pq
         leNLM2SL54+2jF8pb82xqoq0a39Cuasjw+LzhWeaZw8X+Cu74Sif2zB2cHHKawAHQkP/
         D4PWTj+44b5FAsMVy5sC9i4OL7+m1ONpN67ZhSevrri1ojcFhYai/n3IFhAiLeLKsyc8
         4M+q7Ne2W8fa7h4ZDCE9L5tVzxzqGVh8++KDbCVXHlB/QujpzYxzx7KAdHO6cWFeXPTS
         /Mtw==
X-Forwarded-Encrypted: i=1; AJvYcCVV8J0gYMOodHajt6h89oCulUOijUK12ZUOS6GI4DB8iA09fMIuxvzQy2cDITaNa+pJs6AyfgINIdE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy9PO9mTt4EV9K9jUxHyHBdeTaZFesCKQWQ/oD4/RH/9Kw6que
	5p/GA/PxFJMWEqbbpbiavCjPS1QLKmbmI78IIGz/nCQrgtbbYlnK5qOAEj8624vav80QPTYrGpD
	KkYRQuM6FG/r7k5xyko6Hmk2oGPrqvZqpcFM7jTthUtUn2ajq/L/7JABk7KWdOg==
X-Gm-Gg: ASbGnctGy6A0lo49n69sqRmN7u5V/7m/vsdtkO01Ndo7LneT3CL1JLIK8QeOXpPAFmj
	mBE6XvFGzAhXB6e1ZKEWRJXPt6cTj+ThqsvXSn2KCajnv7sKjOO2+Zb8QkLGZc8x5sQJ+scaK+M
	D00o1kgVO1wM4fFtRyTBMX1qXq4kMB6+AIjewQfw5K10k9KnB9+of0SlkrIPBvQsy36/Jcsnlta
	1fVRiLTPwnRoPvHMvJBR3Lmqxs/CoLIs/vYBS/llNuX4pYC7xSOxk39nDTvFWf7hLIrg5znZZej
	tLRJUNDWIhz0VNnJ/GVUNZkZCfhQmrtX4+Q=
X-Received: by 2002:a05:622a:5c95:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a5b9ece0f5mr63062241cf.44.1749220103130;
        Fri, 06 Jun 2025 07:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpf4O45y7/LqbcN4g1foJ8Kzb9sFSBSPTzamnMml1OhKOozVnoN1sS1mY/qb2zqIL8mkLT4Q==
X-Received: by 2002:a05:622a:5c95:b0:476:8f75:b885 with SMTP id d75a77b69052e-4a5b9ece0f5mr63061841cf.44.1749220102756;
        Fri, 06 Jun 2025 07:28:22 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a619852fddsm13548021cf.40.2025.06.06.07.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 07:28:21 -0700 (PDT)
Date: Fri, 6 Jun 2025 10:28:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Alberto Ruiz <aruiz@redhat.com>
Subject: Re: [PATCH v2 03/10] clk: test: introduce a few specific rate
 constants for mock testing
Message-ID: <aEL7A_YeC8b4Wj48@x1>
References: <20250528-clk-wip-v2-v2-0-0d2c2f220442@redhat.com>
 <20250528-clk-wip-v2-v2-3-0d2c2f220442@redhat.com>
 <20250606-fabulous-fortunate-chamois-ab4c98@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250606-fabulous-fortunate-chamois-ab4c98@houat>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Fri, Jun 06, 2025 at 10:56:57AM +0200, Maxime Ripard wrote:
> On Wed, May 28, 2025 at 07:16:49PM -0400, Brian Masney wrote:
> > Some of the mock tests care about the relationship between two
> > different rates, and the specific numbers are important, such as for
> > mocking a divider.
> > 
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> 
> It's not obvious to me why they are important, actually. The relation
> between the two is, but a divider (and our tests) should work with any
> parent rate, so I guess we can expect it to be opaque.

I agree as well.

> Can you expand on why it's important?

I personally find that having specific numbers in some (but not) of the
tests make the tests clearer that specific functionality within the clk
core is exercised. For example, assume we have a parent that can do any
rate, and two children that are dividers. We could have a test like the
following:

    clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_1);
    clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_2);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_1);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_2);
    /*
     * Make something to figure out what the ideal parent rate should be
     * and test that as well?
     */

So if we set child1 and child2 to 16 MHz and 32 MHz, then that exercises
one path through the clk core. However, it will currently fail if we set
the children to 32 MHz and 48 MHz. I have this working on a WIP branch
and one of my new tests looks similar to:

    clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_32_MHZ);
    clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_48_MHZ);
    // This should test that it's a multiple of 96 MHz
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_96_MHZ);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_32_MHZ);
    KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_48_MHZ);

Based on the work in my WIP branch, I think we need to make some of the
divider only clk tests parameterized, and have a table with various
specific frequencies so that various edge cases within the clk core are
tested by the frequency combinations.

I think that instead of having a list of DUMMY_CLOCK_RATE_XXX_MHZ
defines, a single define like this will suffice:

#define clk_dummy_rate_mhz(rate)      ((rate) * 1000 * 1000)

Brian

