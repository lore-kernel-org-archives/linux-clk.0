Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4E156CA
	for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748372873; cv=none; b=RAyS3imCBt7e7LpUtNxAym7yn2xF3fAmu6ho25yi6p4CDdkEeSD0mwAdo+Azz/gwwBTxZLQu7DvTL6fSHbQWhN7w92BFbMC9J8UMIi0YxsUN0zoT+6OwhlfO1M7wK/dnowMjRrS6uj6BsYBIV23aG18LbOfXEqYuIXbezUCEZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748372873; c=relaxed/simple;
	bh=STt7N3ZsRLDgwMrtU7HVGndjJG0h7iOlUn1hAUBFkJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UQBYdx+tEXejkRm4/77BFS07dRInqjvHcIsrXh9YrBWIPJ8LHrq6otBzBpPwgBLSOEfEaFo7WG3xjeHwwZLTqntm9NYd6npbfXpWNwpzkdXcnNCTTDKOi9/l0TRdhm3K8pU+o0vzMq27WIn0mOgZgLnn2I+65eaH8Kh3DD/o56I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PQgKmzE8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PQgKmzE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748372870;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/kgB3HWrM3JfdOdr2OpeMYZM424A8pWTZk1rn9I1hkw=;
	b=PQgKmzE8j7T1iLal27KhAGyHjB+9cdsUe8YqcKXmXS/t5UX1Mg4f2quWoMEULBeHoGjEt2
	0dbLtlTNzfnwiZcWiVD5soPUdwvARm2xoqwWYSMZ6OcwNg7oxby7zIqe1jGmkpWIYD8kZM
	6472QHUefKaQD3MC6wan+puF1/Uaabc=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-M6SuesEIOymQnA0ZcMBg6Q-1; Tue, 27 May 2025 15:07:49 -0400
X-MC-Unique: M6SuesEIOymQnA0ZcMBg6Q-1
X-Mimecast-MFC-AGG-ID: M6SuesEIOymQnA0ZcMBg6Q_1748372869
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-476900d10caso72884741cf.0
        for <linux-clk@vger.kernel.org>; Tue, 27 May 2025 12:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748372868; x=1748977668;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/kgB3HWrM3JfdOdr2OpeMYZM424A8pWTZk1rn9I1hkw=;
        b=tW/7OeA7vuhDvmQKbHoh3wt5KHkim13frxaWNC7oC5LujT+tPIkBk0yoE5j91d4wVJ
         aHwFLhR2Qn+RO7YanBOpU/I2ZFDYSM6Y5upFI5J4Uo86w0Dda53t+qgs/OFY6KdCUBrF
         JbrmudRTsurAcd+iTYbT/pIWYCMc4sV7dTKRe71dIRQR+c9R0DWdynYwW11msovvcSeM
         q1UzAxsOhtrNqu2jcywNBhehS1Yekau7xtSwi0ILS8Iet6dVaXjdHl/y+IvmVBgq6VKa
         p2PENNQiXCW9EuzjtH960at+FsUYwFgLwtxdceK+BqNfZdxEZ88mVjDlSU3pRRgmRb7o
         Wq+A==
X-Forwarded-Encrypted: i=1; AJvYcCVjWB2GtYesHAOTVsy1vj05PjpoF2Ruu6wl7FYGE617oS0R4s/CoWrhhrHx5yrSarSFnCoOP1j4GVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvYA5RR+cIE3hvH2StmC3DbbtmBimvOTICbRBwuUAG3p0diaoP
	8FB9zoBEF/Gvhtr5FDkMNkpwR5x3e3z+zS02yuMrhjQz8aHoqk4aYOhmWBiangbx2qtTrGmnXIV
	OKHWqBdpfHy+e2t3WNoWhKZBtI4eRlr2+jKddNQWQoIOutcjM7VygODH4Zlarcoy/DNRDcFZ2
X-Gm-Gg: ASbGnctYH3Q4JHPZzGVN9xAL0rho8n07hkv0Y7O2IzqIS3yjuNEE6ln0yd+f7dIMQjG
	aFyJzrgCxpifoz7yoTlrQG2Nku1KCytyC7HOWTRNWdeZ/czRqLv4xIgyqf4rQF3mLslwJ/HuSpL
	awIc2nNZbYt1hnxxON9XcrP0COK1dAOy2tyCLQPB7j9jJvzx2BklMy14LpZrLsixqwQPQSriFso
	MTFoSojOmS9yCAO1+eBud3+HN4CFNwWWqIDrfFSHFgGRQYB7Ct+VSO1kp0hn5cPYwfYNOatDM40
	oFo1pWrUAsnaKXg68xSgAndaa4dgGHfZwwM=
X-Received: by 2002:a05:622a:4895:b0:48a:3498:92f2 with SMTP id d75a77b69052e-49f4674e2a9mr242996731cf.21.1748372868240;
        Tue, 27 May 2025 12:07:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpXkO+vqVtcmxMyP/jKg8oA/IFxkebuAeQdewH08/R8xFYavbI5QSU4V3+60jqg1v6fEpsPA==
X-Received: by 2002:a05:620a:44c6:b0:7cc:fef2:51b9 with SMTP id af79cd13be357-7ceecc4597fmr2165248085a.52.1748372856895;
        Tue, 27 May 2025 12:07:36 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468ca5c4sm1761633085a.90.2025.05.27.12.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 12:07:36 -0700 (PDT)
Date: Tue, 27 May 2025 15:07:34 -0400
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: preserve original rate when a sibling clk
 changes it's rate
Message-ID: <aDYNdvQTBSDdyE0H@x1>
References: <20250520192846.9614-1-bmasney@redhat.com>
 <20250520192846.9614-2-bmasney@redhat.com>
 <20250527-incredible-shaggy-stoat-8a5ba8@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-incredible-shaggy-stoat-8a5ba8@houat>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Maxime,

Thanks for the review!

On Tue, May 27, 2025 at 02:36:49PM +0200, Maxime Ripard wrote:
> On Tue, May 20, 2025 at 03:28:45PM -0400, Brian Masney wrote:
> > @@ -2264,7 +2266,14 @@ static void clk_calc_subtree(struct clk_core *core, unsigned long new_rate,
> >  		new_parent->new_child = core;
> >  
> >  	hlist_for_each_entry(child, &core->children, child_node) {
> > -		child->new_rate = clk_recalc(child, new_rate);
> > +		/*
> > +		 * When a parent changes it's rate, only ensure that the section
> > +		 * of the clk tree where the rate change request propagated up
> > +		 * is changed. All other sibling nodes should try to keep a rate
> > +		 * close to where they were originally at.
> > +		 */
> > +		tmp_rate = child->rate_directly_changed ? new_rate : child->rate;
> 
> There's something I don't quite understand here, sorry.
> 
> new_rate here is the parent rate, but child->rate is the current (as in,
> currently programmed in hardware) rate.

There is actually a bug in the section of code I posted.

Let me step back and describe the problem further in the clk core
since the bug is in this section of the code quoted above. Here's a
call tree and a description at each function call about what happens
today prior to my patches with my div_div_3 test, and how a clk can
unknowingly change the rate of it's sibling:

clk_core_set_rate_nolock(child2, 48_MHZ)
-> clk_calc_new_rates(child2, 48_MHZ)
  # clk has CLK_SET_RATE_PARENT set, so clk_calc_new_rates() is invoked
  # via the following block:
  # if ((core->flags & CLK_SET_RATE_PARENT) && parent &&
  #     best_parent_rate != parent->rate)
  #      top = clk_calc_new_rates(parent, best_parent_rate);
  -> clk_calc_new_rates(parent, 48_MHZ)
    -> clk_calc_subtree(parent, 48_MHZ, ...)
      -> clk_recalc(child1, 48_MHZ)
         # BOOM! This is where the bug occurs. This invokes the
         # recalc_rate() op on the clk driver with the new parent rate,
         # and the original divider of 0 is kept intact. The old parent
         # rate is not passed in to the recalc_rate() op, and personally
         # I don't think it should pass in the old rate.

Here's another version of my patch that's a bit simpler and fixes the
issue:

        hlist_for_each_entry(child, &core->children, child_node) {
-               child->new_rate = clk_recalc(child, new_rate);
+               if (child->rate_directly_changed)
+                       child->new_rate = clk_recalc(child, new_rate);
+               else
+                       child->new_rate = child->rate;
+
                clk_calc_subtree(child, child->new_rate, NULL, 0);

So for the case of !child->rate_directly_changed, clk_calc_subtree() is
only called so that the grandchildren and further down towards the leaf
nodes will have the new_rate member populated.

Once the new_rate fields are populated with the correct values, eventually
clk_change_rate() is called on the parent, and the parent will invoke
clk_change_rate() for all of the children with the expected rates stored
in the new_rate fields. This will invoke the set_rate() clk op on each of
the children, and this is where the divider on my test cases are updated.

So let's take your scenario:

> parent->rate = 24MHz
> child1->rate = 24MHz? (it's implicit, we should probably improve that by setting it and using an assertion)
> child2->rate = 24MHz? (Ditto)
> 
> then with the call to clk_set_rate,
> 
> parent->new_rate = 48MHz
> child1->new_rate = 48MHz
> child2->new_rate = 48MHz? (probably, since we keep the same divider)

Here's a new test case that shows that the rates and dividers are
updated as expected for that scenario:

static void clk_test_rate_change_sibling_div_div_4(struct kunit *test)
{
        struct clk_rate_change_sibling_div_div_context *ctx = test->priv;
        int ret;

        ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        ret = clk_set_rate(ctx->child2_clk, DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child2.div, 0);

        ret = clk_set_rate(ctx->child1_clk, DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_ASSERT_EQ(test, ret, 0);

        /*
         * Verify that child2 keeps it's rate at 24 MHz, however the divider is
         * automatically updated from 0 to 1. The parent rate was changed from 
         * 24 MHz to 48 MHz.
         */
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->parent_clk), DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child1_clk), DUMMY_CLOCK_RATE_48_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child1.div, 0);
        KUNIT_EXPECT_EQ(test, clk_get_rate(ctx->child2_clk), DUMMY_CLOCK_RATE_24_MHZ);
        KUNIT_EXPECT_EQ(test, ctx->child2.div, 1);
}

Brian

