Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D67440855
	for <linux-clk@vger.kernel.org>; Sat, 15 Nov 2025 00:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763166186; cv=none; b=J03EnJZYdEdxX7DLG+X8RQiR0koUmUdYQL/hHKzFny2CRNiJ4cm0YAAoRhj6q8If0ZPzrty4V5of2zuvnq/iv3b49QecpCXkQDkHYozhc5EoP5sifm+FL2hoMHF3YMTUharM4GLGU94fnpgU06sJWpNl3kOpwo3+1KS4JIeo5nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763166186; c=relaxed/simple;
	bh=dfivsJK1JxftKQMeSC9M0/NiAuNgHgAkhlY8zaT2DVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrtsdFZArfuFc+qSDu2sgNLVAcPPpjYcV1MTgg1RtktxoVhAsSGQfwbsDL5e1HQv7y20W32+oiVOZqQsgqk9MHKRKESsUp7nox0vj0x7EntLMh4Fp+AFQHTNBXU7ukc8UVP0dhRkKIZwmBREy1v4caFBm/YWbEdvochv28amZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ey2jf8cm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=BspZcQO2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ey2jf8cm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="BspZcQO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763166183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9nfgz45M8HKc3HZ16FndRlHChjpCjyLQc5Rl+pawHCw=;
	b=Ey2jf8cmPoOg6JiR9uptw6jJmNCbcrhAsVqZi6yycuEMfCHuLR8bP5Ck4tQpUyYl+a90A1
	dsWrhctBtqT2tzv88Wc+5XZZH94OUHuayf/gZXySwpwLDV129GojPVdjfVQjymh7yviG1P
	IFkbY2p3z/bbIb7PmYoWimkHg38ssGE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-152-kTU6Iz4sNnWqUgYd4ob_mA-1; Fri, 14 Nov 2025 19:23:01 -0500
X-MC-Unique: kTU6Iz4sNnWqUgYd4ob_mA-1
X-Mimecast-MFC-AGG-ID: kTU6Iz4sNnWqUgYd4ob_mA_1763166179
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b2619f07aeso1118782485a.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 16:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1763166179; x=1763770979; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9nfgz45M8HKc3HZ16FndRlHChjpCjyLQc5Rl+pawHCw=;
        b=BspZcQO2CEprDlQ6lRGpPyi91yw1PW4F3uyejf/8pkfHAKJExm0XX/vfLvja26BO+d
         6BuschW+4R6MmXKm6pu+Eirc7aIDZ9XW+MHr4t57502yhxw3wNE/PUJudE4pv5oN+N9B
         5iXj6nx+c2Nbuu+xagCRfw4CwN3laHSQYIjUF0JEMHvi47DiET6ik24vJ0+XzIc47cI0
         hxV2+N/zd0OCmEvsL3+vlMRSy74kB5qSOpOal0CPoJY4TmIrWp3lahzqVlvV1T2e83fj
         I4rdrfJSwrMr/x6iLIVbS9VH6qLj288fHxSc9EfsjalV/5KKuq5n0OInvdtZcgcbnBnO
         V2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763166179; x=1763770979;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nfgz45M8HKc3HZ16FndRlHChjpCjyLQc5Rl+pawHCw=;
        b=iEf2kbBPXtXha6hKzyKzWaoIuJaZBNZhFlu+bHpl3mMvzxXJgDW59kl8Q+yVC7db/T
         5JntzLkCCsXaLl2GeZoyyWl3Vrm3f+loH7ZSfzy3RH7s8oYRCCUX2aEj5vEolIg8N59S
         QzIYULzWQCzWVX8+Y40TtslSzQ373IxcLTQjWaWD+RY0JBTJM9o3FUReprIdTHVBLpyO
         RO1E8QijMDe+glDDjUVK/l5C20CIXPqoBr4l/ZE9UUakaVAXLsWnS9PQXE6MIXnr3PY3
         qOCjHYSC7ktzqMTq2gYyAc7d9lcYlJBvtBjbnBR/IJASyjsKT8dRW9tPBBXC0KZMprqs
         VKsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdByn0gXmTMyLw3fII7evh1EM2Rp+MHRDJg6VtOY1CUv8DHdBwIrxMbz36YoFRMcj6Hq12eLAGmk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybH7kMV2VbknIPRat1xOFfDP2ztwmwoLo0SMx2rNvot+2fRkr9
	48eWN0koUyEGCaqBg1MMlQrzJ+eGZdcAxy4IHgI9AY5povo/rqBrn0nJjcIkHEKev86Xly6r+lr
	5p24LEX3PjCPhw3BXdF+Kz+k3gSt+huBMz/GsqcN7G50Dfbuv0sB5puENneaoMQ==
X-Gm-Gg: ASbGncsYnF+1OZ/CdVfvlrxcHWmXe2akVKfJrEoWd+luPES9MyGSTCPdvmBxMLBjhRw
	4uQHLcoAOHy+CLEYSI2yOi+lzk4KIRuov1itJSCyHSezXOof61x0x1DspAmZtB/jB4hT+wXvIEb
	/rMP9HmwK9EpQjcaLR7KuFcjbCdyAtEJt93wxAC/DwFPhufYALqsvkdvjuc694j2i1hrekbsgMO
	/oNGNVR/Tm5oj8RHL92ew1N5d+YSL+39OGU6dFcHzqyQ8uV+uTHhNSnvbYyNyrrmPM+vxg/Cd/n
	bnTLf+Sp/Ak0Jfs0W1+CH78T4NOlC/vV6Cee+ICVilCw21zcx3e3zOHkf9uPvJgSWFXI6OeeBJG
	3I77ZYhxjeoIWcMu2tTTL9qJrIMij4RCp8uFReW1ikWNp
X-Received: by 2002:a05:620a:45a9:b0:89e:eeb7:40f5 with SMTP id af79cd13be357-8b2c31ca8abmr621203685a.71.1763166179402;
        Fri, 14 Nov 2025 16:22:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWqnB1QZVpUgj8IZTzTXtYCwN5HMTXu8fDZfWlDItKvg59/ftNW1oV+yvUtCQtHSJbVohIcQ==
X-Received: by 2002:a05:620a:45a9:b0:89e:eeb7:40f5 with SMTP id af79cd13be357-8b2c31ca8abmr621202085a.71.1763166178919;
        Fri, 14 Nov 2025 16:22:58 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm440475985a.29.2025.11.14.16.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 16:22:57 -0800 (PST)
Date: Fri, 14 Nov 2025 19:22:55 -0500
From: Brian Masney <bmasney@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v4 00/12] clk: add support for v1 / v2 clock rate
 negotiation and kunit tests
Message-ID: <aRfH35-jhM-qOrbb@redhat.com>
References: <20250923-clk-tests-docs-v4-0-9205cb3d3cba@redhat.com>
 <20250925-eager-delectable-frog-fcbb5d@penduick>
 <aNVPqHldkVzbyvix@redhat.com>
 <20250930-brawny-pastel-wildcat-4ba8d8@houat>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0oaKZJC2peXkS6zF"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250930-brawny-pastel-wildcat-4ba8d8@houat>
User-Agent: Mutt/2.2.14 (2025-02-20)


--0oaKZJC2peXkS6zF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Maxime (and Stephen),

On Tue, Sep 30, 2025 at 01:28:52PM +0200, Maxime Ripard wrote:
> On Thu, Sep 25, 2025 at 10:20:24AM -0400, Brian Masney wrote:
> > On Thu, Sep 25, 2025 at 02:14:14PM +0200, Maxime Ripard wrote:
> > > On Tue, Sep 23, 2025 at 10:39:19AM -0400, Brian Masney wrote:
> > > > The Common Clock Framework is expected to keep a clock’s rate stable
> > > > after setting a new rate with:
> > > > 
> > > >     clk_set_rate(clk, NEW_RATE);
> > > > 
> > > > Clock consumers do not know about the clock hierarchy, sibling clocks,
> > > > or the type of clocks involved. However, several longstanding issues
> > > > affect how rate changes propagate through the clock tree when
> > > > CLK_SET_RATE_PARENT is involved, and the parent's clock rate is changed:
> > > > 
> > > > - A clock in some cases can unknowingly change a sibling clock's rate.
> > > >   More details about this particular case are documented at:
> > > >   https://lore.kernel.org/linux-clk/20250528-clk-wip-v2-v2-2-0d2c2f220442@redhat.com/
> > > > 
> > > > - No negotiation is done with the sibling clocks, so an inappropriate
> > > >   or less than ideal parent rate can be selected.
> > > > 
> > > > A selection of some real world examples of where this shows up is at
> > > > [1]. DRM needs to run at precise clock rates, and this issue shows up
> > > > there, however will also show up in other subsystems that require
> > > > precise clock rates, such as sound.
> > > > 
> > > > An unknown subset of existing boards are unknowingly dependent on the
> > > > existing behavior, so it's risky to change the way the rate negotiation
> > > > logic is done in the clk core.
> > > > 
> > > > This series adds support for v1 and v2 rate negotiation logic to the clk
> > > > core. When a child determines that a parent rate change needs to occur
> > > > when the v2 logic is used, the parent negotiates with all nodes in that
> > > > part of the clk subtree and picks the first rate that's acceptable to
> > > > all nodes.
> > > > 
> > > > Kunit tests are introduced to illustrate the problem, and are updated
> > > > later in the series to illustrate that the v2 negotiation logic works
> > > > as expected, while keeping compatibility with v1.
> > > > 
> > > > I marked this as a RFC since Stephen asked me in a video call to not
> > > > add a new member to struct clk_core, however I don't see how to do this
> > > > any other way.
> > > > 
> > > > - The clk core doesn’t, and shouldn’t, know about the internal state the
> > > >   various clk providers.
> > > > - Child clks shouldn’t have to know the internal state of the parent clks.
> > > > - Currently this information is not exposed in any way to the clk core.
> > > 
> > > I recall from that video call that Stephen asked:
> > > 
> > > - to indeed not introduce a new op
> > > - to evaluate the change from top to bottom, but to set it bottom to top
> > > - to evaluate the rate by letting child clocks expose an array of the
> > >   parent rates they would like, and to intersect all of them to figure
> > >   out the best parent rate.
> > > 
> > > It looks like you followed none of these suggestions, so explaining why
> > > you couldn't implement them would be a great first step.
> > > 
> > > Also, you sent an RFC, on what would you like a comment exactly?
> > 
> > Stephen asked me to not introduce a new clk op, however I don't see a
> > clean way to do this any other way. Personally, I think that we need a
> > new clk op for this use case for the reasons I outlined on the cover
> > letter.
> 
> So his suggestion was to base the whole logic on clk_ops.determine_rate.
> You're saying that it would violate parent/child abstraction. Can you
> explain why you think that is the case, because it's really not obvious
> to me.
> 
> Additionally, and assuming that we indeed need something similar to your
> suggestion, determinate_rate takes a pointer to struct clk_rate_request.
> Why did you choose to create a new op instead of adding the check_rate
> pointer to clk_rate_request?

Sorry about the delayed response. I've been busy with other projects at
work.

I attached a patch that puts the negotiate_rates member on struct
clk_rate_request instead of struct clk_ops. In order to get this to
work, it also required adding it to struct clk_core and
struct clk_init_data as well. I made this so that this patch applies
on top of this series.

I think the clk_rate_request approach is very ugly, and adding it to
struct clk_ops like I have it in this series is the way to go.

I'm giving a talk at Linux Plumbers in Tokyo next month:

    Fixing Clock Tree Propagation in the Common Clk Framework 
    https://lpc.events/event/19/contributions/2152/

Stephen will be there as well, and hopefully we can reach consensus
about an acceptable approach to fix this.

My round_rate to determine_rate conversion will drop one member from
struct clk_ops, so maybe that'll help, and we can have a trade?
There's currently only one outstanding patch series remaining in
drivers/phy that's blocking me from posting what I have to remove
round_rate from the clk core:

https://lore.kernel.org/linux-clk/20251106-phy-clk-route-rate-v2-resend-v1-0-e2058963bfb1@redhat.com/T/

I'll bug Vinod on email again so that we can hopefully get that in for
v6.19. (No response on IRC yesterday.) If not, I see that he's giving a
talk at Plumbers and I'll bug him in person after his talk.

Brian

--0oaKZJC2peXkS6zF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename=0001-HACK-clk-move-negotiate_rates-member-from-struct-clk.patch

From 469c29a4d14a83155a280df4679a43ad4af2e1b4 Mon Sep 17 00:00:00 2001
From: Brian Masney <bmasney@redhat.com>
Date: Fri, 14 Nov 2025 18:45:06 -0500
Subject: [PATCH] HACK: clk: move negotiate_rates member from struct clk_ops to
 struct clk_rate_request
Content-type: text/plain

Demonstrate one way to move the negotiate_rates member from struct
clk_ops to struct clk_rate_request. Personally I think it's much cleaner
to have this on struct clk_ops.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst |  8 +++++---
 drivers/clk/clk.c                | 11 ++++++++---
 drivers/clk/clk_test.c           | 32 +++++++++++++++++++++++++-------
 include/linux/clk-provider.h     | 19 ++++++++++++-------
 4 files changed, 50 insertions(+), 20 deletions(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index c46ee62ba5bd..47ed511432db 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -75,9 +75,6 @@ the operations defined in clk-provider.h::
 		void		(*disable)(struct clk_hw *hw);
 		int		(*is_enabled)(struct clk_hw *hw);
 		void		(*disable_unused)(struct clk_hw *hw);
-		bool            (*negotiate_rates)(struct clk_hw *hw,
-					           struct clk_rate_request *req,
-					           bool (*check_rate)(struct clk_core *, unsigned long));
 		unsigned long	(*recalc_rate)(struct clk_hw *hw,
 						unsigned long parent_rate);
 		long		(*round_rate)(struct clk_hw *hw,
@@ -103,6 +100,11 @@ the operations defined in clk-provider.h::
 					      struct dentry *dentry);
 	};
 
+Note: The negotiate_rates callback is not part of struct clk_ops. Instead, it
+is specified in struct clk_init_data during clock registration and is copied
+to struct clk_rate_request for use during rate negotiations. It is invoked
+through the rate request structure rather than through ops.
+
 Hardware clk implementations
 ============================
 
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 926b7d4b9ab8..8014eb719266 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -130,6 +130,9 @@ struct clk_parent_map {
 struct clk_core {
 	const char		*name;
 	const struct clk_ops	*ops;
+	bool			(*negotiate_rates)(struct clk_hw *hw,
+						   struct clk_rate_request *req,
+						   bool (*check_rate)(struct clk_core *, unsigned long));
 	struct clk_hw		*hw;
 	struct module		*owner;
 	struct device		*dev;
@@ -427,8 +430,8 @@ static bool clk_core_is_enabled(struct clk_core *core)
 
 static int clk_core_use_v2_rate_negotiation(struct clk_core *core)
 {
-	bool has_v2_ops = core->ops->negotiate_rates ||
-	                  (core->parent && core->parent->ops->negotiate_rates);
+	bool has_v2_ops = core->negotiate_rates ||
+		(core->parent && core->parent->negotiate_rates);
 
 	return has_v2_ops && modparam_clk_v2_rate_negotiation;
 }
@@ -1713,6 +1716,7 @@ static void clk_core_init_rate_req(struct clk_core * const core,
 
 	req->core = core;
 	req->rate = rate;
+	req->negotiate_rates = core->negotiate_rates;
 	clk_core_get_boundaries(core, &req->min_rate, &req->max_rate);
 
 	parent = core->parent;
@@ -2504,7 +2508,7 @@ static struct clk_core *clk_calc_new_rates(struct clk_core *core,
 		struct clk_rate_request req;
 
 		clk_core_init_rate_req(top, &req, top->new_rate);
-		if (!top->ops->negotiate_rates(top->hw, &req, clk_check_rate))
+		if (!req.negotiate_rates || !req.negotiate_rates(top->hw, &req, clk_check_rate))
 			return NULL;
 
 		clk_accept_rate_negotiations(top);
@@ -4511,6 +4515,7 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 		goto fail_ops;
 	}
 	core->ops = init->ops;
+	core->negotiate_rates = init->negotiate_rates;
 
 	core->dev = dev;
 	clk_pm_runtime_init(core);
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index ff53b8bdf872..be2a49d2e446 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -122,7 +122,6 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
-	.negotiate_rates = clk_dummy_negotiate_rates,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
@@ -218,7 +217,6 @@ static const struct clk_ops clk_dummy_div_ops = {
 	.recalc_rate = clk_dummy_div_recalc_rate,
 	.determine_rate = clk_dummy_div_determine_rate,
 	.set_rate = clk_dummy_div_set_rate,
-	.negotiate_rates = clk_dummy_div_negotiate_rates,
 };
 
 struct clk_dummy_gate {
@@ -755,6 +753,26 @@ struct clk_rate_change_sibling_div_div_context {
 static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 {
 	struct clk_rate_change_sibling_div_div_context *ctx;
+	struct clk_init_data parent_init = {
+		.name = "parent",
+		.ops = &clk_dummy_rate_ops,
+		.negotiate_rates = clk_dummy_negotiate_rates,
+		.flags = 0,
+	};
+	struct clk_init_data child1_init = {
+		.name = "child1",
+		.ops = &clk_dummy_div_ops,
+		.negotiate_rates = clk_dummy_div_negotiate_rates,
+		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+	};
+	struct clk_init_data child2_init = {
+		.name = "child2",
+		.ops = &clk_dummy_div_ops,
+		.negotiate_rates = clk_dummy_div_negotiate_rates,
+		.flags = CLK_SET_RATE_PARENT,
+		.num_parents = 1,
+	};
 	int ret;
 
 	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
@@ -762,22 +780,22 @@ static int clk_rate_change_sibling_div_div_test_init(struct kunit *test)
 		return -ENOMEM;
 	test->priv = ctx;
 
-	ctx->parent.hw.init = CLK_HW_INIT_NO_PARENT("parent", &clk_dummy_rate_ops, 0);
+	ctx->parent.hw.init = &parent_init;
 	ctx->parent.negotiate_step_size = 1 * HZ_PER_MHZ;
 	ctx->parent.rate = 24 * HZ_PER_MHZ;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->parent.hw);
 	if (ret)
 		return ret;
 
-	ctx->child1.hw.init = CLK_HW_INIT_HW("child1", &ctx->parent.hw, &clk_dummy_div_ops,
-					     CLK_SET_RATE_PARENT);
+	child1_init.parent_hws = (const struct clk_hw*[]) { &ctx->parent.hw };
+	ctx->child1.hw.init = &child1_init;
 	ctx->child1.div = 1;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->child1.hw);
 	if (ret)
 		return ret;
 
-	ctx->child2.hw.init = CLK_HW_INIT_HW("child2", &ctx->parent.hw, &clk_dummy_div_ops,
-					     CLK_SET_RATE_PARENT);
+	child2_init.parent_hws = (const struct clk_hw*[]) { &ctx->parent.hw };
+	ctx->child2.hw.init = &child2_init;
 	ctx->child2.div = 1;
 	ret = clk_hw_register_kunit(test, NULL, &ctx->child2.hw);
 	if (ret)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 9041b17ba99e..bc162afc8cd8 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -53,6 +53,9 @@ struct dentry;
  *			requested constraints.
  * @best_parent_hw:	The most appropriate parent clock that fulfills the
  *			requested constraints.
+ * @negotiate_rates:	When a child clk requests a new rate that requires a rate
+ *			change from the parent, this negotiates a new parent rate that's
+ *			acceptable to all of the children.
  *
  */
 struct clk_rate_request {
@@ -62,6 +65,9 @@ struct clk_rate_request {
 	unsigned long max_rate;
 	unsigned long best_parent_rate;
 	struct clk_hw *best_parent_hw;
+	bool (*negotiate_rates)(struct clk_hw *hw,
+				struct clk_rate_request *req,
+				bool (*check_rate)(struct clk_core *, unsigned long));
 };
 
 void clk_hw_init_rate_request(const struct clk_hw *hw,
@@ -129,10 +135,6 @@ struct clk_duty {
  * @restore_context: Restore the context of the clock after a restoration
  *		of power.
  *
- * @negotiate_rates: When a child clk requests a new rate that requires a rate
- *		change from the parent, this negotiates a new parent rate that's
- *		acceptable to all of the children.
- *
  * @recalc_rate: Recalculate the rate of this clock, by querying hardware. The
  *		parent rate is an input parameter.  It is up to the caller to
  *		ensure that the prepare_mutex is held across this call. If the
@@ -246,9 +248,6 @@ struct clk_ops {
 	void		(*disable_unused)(struct clk_hw *hw);
 	int		(*save_context)(struct clk_hw *hw);
 	void		(*restore_context)(struct clk_hw *hw);
-	bool		(*negotiate_rates)(struct clk_hw *hw,
-					   struct clk_rate_request *req,
-					   bool (*check_rate)(struct clk_core *, unsigned long));
 	unsigned long	(*recalc_rate)(struct clk_hw *hw,
 					unsigned long parent_rate);
 	long		(*round_rate)(struct clk_hw *hw, unsigned long rate,
@@ -295,6 +294,9 @@ struct clk_parent_data {
  *
  * @name: clock name
  * @ops: operations this clock supports
+ * @negotiate_rates: When a child clk requests a new rate that requires a rate
+ *		change from the parent, this negotiates a new parent rate that's
+ *		acceptable to all of the children.
  * @parent_names: array of string names for all possible parents
  * @parent_data: array of parent data for all possible parents (when some
  *               parents are external to the clk controller)
@@ -306,6 +308,9 @@ struct clk_parent_data {
 struct clk_init_data {
 	const char		*name;
 	const struct clk_ops	*ops;
+	bool			(*negotiate_rates)(struct clk_hw *hw,
+						   struct clk_rate_request *req,
+						   bool (*check_rate)(struct clk_core *, unsigned long));
 	/* Only one of the following three should be assigned */
 	const char		* const *parent_names;
 	const struct clk_parent_data	*parent_data;
-- 
2.51.1


--0oaKZJC2peXkS6zF--

