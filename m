Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0E234A3CD
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 16:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768581869; cv=none; b=uz8cWc1OO0IeG4IRjyJdCUsyCMdNiBLK87UnxpUlSgkx/kOtg6BHG1NVunnRIjBYTQTyTPN2A7TknYkxlakMn5vVyWdHg7Y9sWJv5B+gKX7J6WIwnO56fLbXuaOkDWQBV3cMnCbei5nnSMGesAvkgdqrvhhqF1nwRGCe3MuPfWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768581869; c=relaxed/simple;
	bh=FCPpuR5pyXbwuEHy7hY3eKJRjE8DIkNpAA05+01sLW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g+EK2q6NUJ9ySLnQu46vWjuniQ8eKW/Th3ktVVOnEt2QiiGrwhPs2PcTLGcTzmf9bsqCkSBLXTFVWJ9U3yaTCKzpWl9gokABNNITx4pEzF2RwcLEweEjv/iqlZSeoIqypFU1NQm+n0BDH5IdlxIR/XpPOVC1TG44cn4I+BO9WeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKQlHQJv; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGfCNwka; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKQlHQJv";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGfCNwka"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768581865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pRCF+slWnms33snim/Zhjou6RcOl1iwqXMoZkaC/5tU=;
	b=UKQlHQJvt8Hjp9D8AoeqLqirsGT/C7Uvem/PMgKCJ7kcvazGkG3+wAcCRMrYgJt9GVzOdO
	VKFGUf/XKrDyyVNRZ/J8MrEOX0dR77xL7B+S8qntCYKPecwMSKwnkt8vjyBoD0K92mNabT
	+CWUmJiFlYUnYXMd/UIUihyTbihAAD0=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351--T5QVvuWN0Cb653bTLAz0A-1; Fri, 16 Jan 2026 11:44:24 -0500
X-MC-Unique: -T5QVvuWN0Cb653bTLAz0A-1
X-Mimecast-MFC-AGG-ID: -T5QVvuWN0Cb653bTLAz0A_1768581864
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-890587d4e87so61917126d6.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768581864; x=1769186664; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pRCF+slWnms33snim/Zhjou6RcOl1iwqXMoZkaC/5tU=;
        b=MGfCNwkaL9uZZh5W2vO5YU5oCmt2SLLx3oKsdWSP8CgyNrq25Y26LVdlEORGxDep2h
         TmXVGS0ajq+olVa2ig2bq+aDu4mnNDns4J7/ataKHWR/58lJMuJaHYx0D0cbxpI0XhG+
         BKzCPLv5KPnN9wbBrIr1i7Rvtw206Hf9GVV54+nAH6NheAu7DExeC8mRovOMnbXNUDge
         P7wvS4XS+1pEmJ/TwUAZopSaroIVEbRF1O/gULfbNMbo4mmqEFYMiWxJLHO/gmKsHZbl
         MqTdZ6bIivU6X4ucbkpLI5R+9iOp0zd1OjiRLdWlE3VH8FTqxbBGZjhUowczZbdhFOrM
         Le8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768581864; x=1769186664;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pRCF+slWnms33snim/Zhjou6RcOl1iwqXMoZkaC/5tU=;
        b=ZYa+j7VFyQGFd30Q2QmVoba0ipV10RW6bdBZObiXPjdXPmTXiNateKKGIzG2Akiaji
         j2Jv7F5VIvbAu2GM9cuZwQGUTv04SIApthYk0OfdP/gh/8qsAJqia0aCwliWrw3Pvjp4
         YXOxARtUaolEZRoZhEeJkvNntJgIvYLyWWoBKxQPrZy72D37YxXNLW8IXL4wcbE/EXDm
         vbXjUXNYpuJQZfcrv6gjzZcyHing3xt3G7PlLy+6CpM8EHee9UEi1+C6HWXCcUJSgsD/
         1VUSNeaAxMq3WHLaSpYgCI9CXAXm5L/2qCyPc6MUwAp9vc7X5bUHo/MLCeFKg+ohUgDz
         7caw==
X-Forwarded-Encrypted: i=1; AJvYcCVDFa0LfRRAtnLkUrJNDb5WRuQkrgeOcy55o4Tf2tuwuoLOIr7ncVf5YQ58q5hY/zPdhtPAGVchoJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FX2vR3uyI40jCtfKQ+BiaU7ceYoMYkF5nrCbeGmdi9TrfcjU
	2HMozS7mdJ+6OlGfKtOjhkEtkKoWwU1xp8/EiBoACxm6A+iZfp3UESFfkfNFoVh8cId9lTCwmgB
	UemR3nHf5rFEyWzGXecCbUImVOd4Cb8zqJUNW2ZOS8lHpH8VMvFDyVfbx7p+MRQ==
X-Gm-Gg: AY/fxX6Q5N3dBm3mUS44sbetGVlb4Rf3WxtVNz23l5hqBndvvzPs+H7nhi7IJD2JXsC
	w9c3p1L1TEeW/oQmZ/kn/lkoDUUpwadophQ/c/rO757cjQxsrOnCS4jT298Z+3g9Pf2TsYHvPqJ
	ovkY4E8EFeCCdtOuuzqePlcUs5rpa2mUVki7vMeWGA8ShY5kECm5KLh4DA19zFo583I/cAXOSG1
	FpVb4QpSa0gX00BgEqrnyDYqzcQKLwk9Z6rveaPOfvBU6HrqVCeoIlLjQJoYVfzcQ8eHbQMk1T0
	NmA95Rxnkjs7vtJyX/R9hgbt7PE45MJhAHQdzNjU14fMeYDvvGvnHWtWRDPdrN6M7UUXHlwGmQs
	ni7CJXdRHxDLDlC2XkUNUjusLCCVdRQylEPmouJ+QkLPy
X-Received: by 2002:a05:6214:242f:b0:88a:529a:a530 with SMTP id 6a1803df08f44-8942dd109a7mr50047436d6.23.1768581863885;
        Fri, 16 Jan 2026 08:44:23 -0800 (PST)
X-Received: by 2002:a05:6214:242f:b0:88a:529a:a530 with SMTP id 6a1803df08f44-8942dd109a7mr50042666d6.23.1768581858515;
        Fri, 16 Jan 2026 08:44:18 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c6605sm26555976d6.44.2026.01.16.08.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:44:17 -0800 (PST)
Date: Fri, 16 Jan 2026 11:44:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
Message-ID: <aWpq4E4_zTIO8Phr@redhat.com>
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
 <aWhDLNFtaoU7A-AN@redhat.com>
 <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
 <aWjlMrlCEbprgKg5@redhat.com>
 <6a66f0f8-3fbf-46b7-9370-5768b1acd96b@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="TfOEVYXj3aZnLEB/"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6a66f0f8-3fbf-46b7-9370-5768b1acd96b@amlogic.com>
User-Agent: Mutt/2.2.14 (2025-02-20)


--TfOEVYXj3aZnLEB/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Chuan,
i
On Fri, Jan 16, 2026 at 05:32:39PM +0800, Chuan Liu wrote:
> On 1/15/2026 9:01 PM, Brian Masney wrote:
> > On Thu, Jan 15, 2026 at 10:37:55AM +0800, Chuan Liu wrote:
> > > On 1/15/2026 9:30 AM, Brian Masney wrote:
> > > > On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
> > > > > From: Chuan Liu <chuan.liu@amlogic.com>
> > > > > 
> > > > > If we were to have two users of the same clock, doing something like:
> > > > > 
> > > > > clk_set_rate_range(user1, 1000, 2000);
> > > > > clk_set_rate_range(user2, 3000, 4000);
> > > > > 
> > > > > Even when user2's call returns -EINVAL, the min_rate and max_rate of
> > > > > user2 are still incorrectly updated. This causes subsequent calls by
> > > > > user1 to fail when setting the clock rate, as clk_core_get_boundaries()
> > > > > returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
> > > > > 
> > > > > To prevent this, clk_core_check_boundaries() now rollback to the old
> > > > > boundaries when the check fails.
> > > > > 
> > > > > Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> > > > > ---
> > > > >    drivers/clk/clk.c | 8 ++++++--
> > > > >    1 file changed, 6 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > > index 85d2f2481acf..0dfb16bf3f31 100644
> > > > > --- a/drivers/clk/clk.c
> > > > > +++ b/drivers/clk/clk.c
> > > > > @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
> > > > >          */
> > > > >         rate = clamp(rate, min, max);
> > > > >         ret = clk_core_set_rate_nolock(clk->core, rate);
> > > > > +
> > > > > +out:
> > > > >         if (ret) {
> > > > > -             /* rollback the changes */
> > > > > +             /*
> > > > > +              * Rollback the consumer’s old boundaries if check_boundaries or
> > > > > +              * set_rate fails.
> > > > > +              */
> > > > >                 clk->min_rate = old_min;
> > > > >                 clk->max_rate = old_max;
> > > > >         }
> > > > > 
> > > > > -out:
> > > > >         if (clk->exclusive_count)
> > > > >                 clk_core_rate_protect(clk->core);
> > > > 
> > > > This looks correct to me. Just a quick question though to possibly
> > > > simplify this further. Currently clk_set_rate_range_nolock() has the
> > > > following code:
> > > > 
> > > >           /* Save the current values in case we need to rollback the change */
> > > >           old_min = clk->min_rate;
> > > >           old_max = clk->max_rate;
> > > >           clk->min_rate = min;
> > > >           clk->max_rate = max;
> > > > 
> > > >           if (!clk_core_check_boundaries(clk->core, min, max)) {
> > > >                   ret = -EINVAL;
> > > >                   goto out;
> > > >           }
> > > > 
> > > > Since clk_core_check_boundaries() is a readonly operation, what do you
> > > > think about moving clk_core_check_boundaries above the code that saves the
> > > > previous values? That way we only need to rollback in the case where
> > > > set_rate() fails.
> > > > 
> > > 
> > > Perhaps it would be more appropriate to move the clk_core_check_boundaries()
> > > check before saving the previous values, like this:
> > > 
> > >        if (!clk_core_check_boundaries(clk->core, min, max)) {
> > >                ret = -EINVAL;
> > >                goto out;
> > >        }
> > > 
> > >        /* Save the current values in case we need to rollback the change */
> > >        old_min = clk->min_rate;
> > >        old_max = clk->max_rate;
> > >        clk->min_rate = min;
> > >        clk->max_rate = max;
> > 
> > Yes, that's what I had in mind.
> > 
> > > The changes in this patch are intended to avoid altering the original driver
> > > execution flow, while making the minimal modification to fix the issue where
> > > the range is incorrectly assigned.
> > 
> > It's ultimately up to Stephen what he wants to take. I personally have a
> > slight preference to the approach above, however I don't have a strong
> > opinion about it. I'm just calling this out to help with reviews.
> > 
> > The one thing that Stephen will want though is kunit tests for this
> > since it changes the clk core. There's already a bunch of kunit tests in
> > drivers/clk/clk_test.c. Feel free to reach out to me if you need help
> > writing a new test.
> > 
> 
> Thank you for the reminder. Stephen previously pointed out the need to
> improve the kunit tests, and I will take this into account in future
> submissions.
> 
> I would greatly appreciate it if you could help enhance the kunit tests for
> this particular test case.:)

I attached a patch that adds a kunit test that you can apply with 'git
am'. Try it with, and without your patch to see how it operates with
and without your fix. If you like it, then feel free to include it in
the next version of this patch series.

Brian

--TfOEVYXj3aZnLEB/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-clk-test-introduce-test-to-test-the-rollback-of-cons.patch

From 2367a5e238f0d26ae38510fb0fa2eb33a43cc046 Mon Sep 17 00:00:00 2001
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 16 Jan 2026 11:21:21 -0500
Subject: [PATCH] clk: test: introduce test to test the rollback of consumer's
 rate boundaries
Content-type: text/plain

Add a kunit test to ensure that when a second consumer requests an
invalid rate range that the aggregated range is rolled back correctly,
and the first consumer is not impacted.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/clk_test.c | 53 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb..afffa182559f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -1500,6 +1500,58 @@ static void clk_range_test_multiple_disjoints_range(struct kunit *test)
 	clk_put(user1);
 }
 
+static void clk_range_test_consumer_boundaries_rollback(struct kunit *test)
+{
+	struct clk_dummy_context *ctx = test->priv;
+	struct clk_hw *hw = &ctx->hw;
+	unsigned long rate, min, max;
+	struct clk *user1, *user2;
+	int ret;
+
+	user1 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user1);
+
+	user2 = clk_hw_get_clk(hw, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, user2);
+
+	/* user1 sets a range */
+	ret = clk_set_rate_range(user1, 1000, 2000);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	clk_hw_get_rate_range(hw, &min, &max);
+	KUNIT_ASSERT_EQ(test, min, 1000);
+	KUNIT_ASSERT_EQ(test, max, 2000);
+
+	/* Verify user1 can set a rate within its range */
+	ret = clk_set_rate(user1, 1500);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	rate = clk_get_rate(user1);
+	KUNIT_EXPECT_EQ(test, rate, 1500);
+
+	/* user2 attempts to set a disjoint range [3000, 4000] - should fail */
+	ret = clk_set_rate_range(user2, 3000, 4000);
+	KUNIT_EXPECT_EQ(test, ret, -EINVAL);
+
+	/*
+	 * After the failed call, user1 should still be able to set rates
+	 * within its original range. This verifies that user2's boundaries
+	 * were correctly rolled back and didn't corrupt the aggregated
+	 * boundaries.
+	 */
+
+	clk_hw_get_rate_range(hw, &min, &max);
+	KUNIT_EXPECT_EQ(test, min, 1000);
+	KUNIT_EXPECT_EQ(test, max, 2000);
+
+	ret = clk_set_rate(user1, 1800);
+	KUNIT_EXPECT_EQ(test, ret, 0);
+	rate = clk_get_rate(user1);
+	KUNIT_EXPECT_EQ(test, rate, 1800);
+
+	clk_put(user2);
+	clk_put(user1);
+}
+
 /*
  * Test that if our clock has some boundaries and we try to round a rate
  * lower than the minimum, the returned rate will be within range.
@@ -1738,6 +1790,7 @@ static struct kunit_case clk_range_test_cases[] = {
 	KUNIT_CASE(clk_range_test_set_range),
 	KUNIT_CASE(clk_range_test_set_range_invalid),
 	KUNIT_CASE(clk_range_test_multiple_disjoints_range),
+	KUNIT_CASE(clk_range_test_consumer_boundaries_rollback),
 	KUNIT_CASE(clk_range_test_set_range_round_rate_lower),
 	KUNIT_CASE(clk_range_test_set_range_set_rate_lower),
 	KUNIT_CASE(clk_range_test_set_range_set_round_rate_consistent_lower),
-- 
2.52.0


--TfOEVYXj3aZnLEB/--

