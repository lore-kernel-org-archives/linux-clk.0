Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCE42D75B
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 15:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784908526; cv=none; b=IA7GL7gqSbJy/4Tpe9P7td7GfxGWWPQQ+vjbkN0J4KR4f4kSKN1CvZ4fO0xasmXspZSZDYzNwi0xxSFKcksTCwIUG6gf0E1+xHIhWhBOzZD6pdC87zokH82Ss92nHp4LRyhoEUjcNJhMlG1lJCpe5CpLNk0/35JuzNqcZQ1pSIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784908526; c=relaxed/simple;
	bh=JhbTbs0FOdbvKTC2L6+5hjqopjEb9VhxHqIQKPO/IAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ESPS9hJEdP+rwMorLq/Tny7Qi9RlqkTNrMkcrm4p3X2tviDyfmRj+KVLo5cYzmhMjz/LzF7Hv2NaICIS67j3eZFMWZwPH2FjZmRgi/ToOJy2SblcYW/kccI/4EhhtwxfdMbgB2LNtARmGk9peGuYLkUPae6lPqroybvygRiOlB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ihWzgHWd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=NtcYu0q3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ihWzgHWd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="NtcYu0q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784908524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aWD66a2ehIm/e4HyZcO15kOI/PXJYRp804FM2jJzuJM=;
	b=ihWzgHWdFN+9vm500uwFu6ShvceQ3TcZQtzIYaejY1QkCWhStdbPdVqlYGtGhE3YzrhB+A
	JxXyoApO8Ig8DfRR51UUfDAdynZ0q2wMe960wwlWaU9Pc6Fers9dgC+UTO70EObssxmave
	2fnfr5uzEK+kZ4gSgt3MaX8NuAYr5+c=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-57-K1T5xDeLO7SYGlWEEA4qxA-1; Fri, 24 Jul 2026 11:55:22 -0400
X-MC-Unique: K1T5xDeLO7SYGlWEEA4qxA-1
X-Mimecast-MFC-AGG-ID: K1T5xDeLO7SYGlWEEA4qxA_1784908522
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c01ff996dso5943221cf.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784908522; x=1785513322; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aWD66a2ehIm/e4HyZcO15kOI/PXJYRp804FM2jJzuJM=;
        b=NtcYu0q3gtPFzO0aIqg8kMrC3Oly67xUPxCdDkpiALicGk8Go2Y9yVgH6v7/9l1yvc
         riOU8BW0vjJ9M1hRhfm3qurzHvh21/oaA9pRvi26ckBRxhvxBg7TyE9whbsh9w1/U/XI
         Dgz5XrKpZSni+c0RyLrKcnz7yx4XImCv5unEIE6q3hgwLffbLFXLZE5VOYZTD+V0KSfD
         MGM2iQui2rSIL7+uRDOEZaq57Ug5eE6xxth3fRHb/ASQf6/d6yVOKsi9qQg5QJJW+7e4
         7JTMJuPgXqoeE/M3rF+YPT8JZSgkRpEfHDZJxI4Vd5wsQIzD6wJeS1gokbL4xkdeIw/4
         5EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784908522; x=1785513322;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aWD66a2ehIm/e4HyZcO15kOI/PXJYRp804FM2jJzuJM=;
        b=HW4XXErOvnWqS763EFNFQKErBJ4OmVK6nlvCi9SkR1mtnLkIre6rjdy07jXKV9y2zU
         U7XKvntFGBa94ojmWERDLrpLssEyUdxpcU+1KskYEs4OsARlLU4LtXD6Ig3w3VicT8xm
         8XvtZl8CS3BTvujCeYw3ggIKEO8QNobOYrVA5ESjee738/3TGOa59+UiC/+VxqQEEOWL
         +MSmRBJ/iJjcZIqk8efbV7Ew81EBiE3Q0L4Ws4UYFyV3HrEp1JnsDc1YL/08y/XqaGTf
         foP/nfWAD616aCIpRwu0B+1sTKa2O0L0yv4WbrhaqxnWIkC7wN51AcdSdTu6tmQHyd9K
         Og3Q==
X-Forwarded-Encrypted: i=1; AHgh+RoyfJlJrBISXPkal6zqpCavBACO2A/HJRqqaSDpDsy3uTsc6A1+Gt0K+0lvolZXIqmkAe/l69DCblM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGggzg7lsWurTzsILb+bMNZOYfCvRLwlF2AiVPZNQ609Qpq35
	N7ggPx7ba0tI9qUKr2S+2Jw+NhUQkICtSHrz3iPKdrcEe42/n3vRR6SXwzkaV9AQwV4zgT3mJGu
	86DMR1RCc5FlV6Jywz7hmx+QAmjhHwIZXu/PdnhzhwLbQRegvimF6jdBpj2TeIw==
X-Gm-Gg: AR+sD11RRB3t/WBvxPA7e6Xe8b4xS3TgZcVCvIF1+Y5Gcoqxq6itrtvpbuQPyDz4fj0
	U6CTsj5fuselDgGdUvb2VxaWHFakiB3PY+G0xUQ4CeUCLvBwccFLgs41lxaHtU4HIIyzw6zBeM4
	/3H3og+Wb87C4aIsPbP9ELQ1ewAz7QKZkjSZGhrrOIUWi+CsTBSSaMn69kBfBf26NjUxdHmkOuD
	gqQ4HUctrLrTHQGAlCtR7YIW/Kd2En6zJhjbnOLpSVt4EjjKd2GRiJPh2ERxo4YJ108xPS7vCFS
	FDBD8P7IqVrq6zBHDcZ1XKSAId/54Kxzip+1pBVDrUJrGxh6U7dN+KcZPMEqlaZr+rhr4pjz18W
	fjwk33uQzVEgngzszNfMAvyZSuoz2EWRYcgg=
X-Received: by 2002:a05:622a:164d:b0:51c:25da:903f with SMTP id d75a77b69052e-5283df3a21fmr79139801cf.59.1784908522057;
        Fri, 24 Jul 2026 08:55:22 -0700 (PDT)
X-Received: by 2002:a05:622a:164d:b0:51c:25da:903f with SMTP id d75a77b69052e-5283df3a21fmr79139341cf.59.1784908521604;
        Fri, 24 Jul 2026 08:55:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-529a27f4346sm2307631cf.8.2026.07.24.08.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:55:21 -0700 (PDT)
Date: Fri, 24 Jul 2026 11:55:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Tony Lindgren <tony@atomide.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	=?iso-8859-1?Q?Gr=E9gory?= Clement <gregory.clement@bootlin.com>,
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: ti: mux: resolve parent clocks by DT index, not by
 name
Message-ID: <amOK5hytg7ouOhtM@redhat.com>
References: <20260715-mathieu-wdt-clock-theo-v1-1-da65bba1828b@bootlin.com>
 <alkZmw-XmnCOZfOD@redhat.com>
 <DK6W03NSALJN.1SASGAY5HWSPN@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DK6W03NSALJN.1SASGAY5HWSPN@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Mathieu,

On Fri, Jul 24, 2026 at 04:56:01PM +0200, Mathieu Dubois-Briand wrote:
> On Thu Jul 16, 2026 at 7:49 PM CEST, Brian Masney wrote:
> > On Wed, Jul 15, 2026 at 05:09:56PM +0200, Mathieu Dubois-Briand wrote:
> >> Resolve parent clocks by their index into the device tree "clocks"
> >> property rather than matching names as strings. Name-based matching is
> >> fragile because a clock's "clock-output-names" value in its provider
> >> node can differ from the name used to reference it in a consumer node,
> >> and because names must be globally unique across all clock providers.
> >> 
> >> On AM335x, this caused broken clock trees where some clocks failed to
> >> enable because their parents could not be found.
> >> 
> >> Replace of_clk_parent_fill() with a clk_parent_data array that sets
> >> .index to the array position.
> >> 
> >> Fixes: ec7aa25fa483 ("ARM: dts: Use clock-output-names for am3")
> >> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> >
> > So this only updates of_mux_clk_setup(). of_ti_composite_mux_clk_setup()
> > calls ti_clk_add_component(), which does a name based matching as well.
> > It would be nice to have this consistent within the same driver. I know
> > this is going to require a larger refactor.
> >
> > Otherwise your fix looks correct to me.
> >
> > Brian
> 
> Hi Brian,
> 
> Thanks for your comment.
> 
> Yes, it does make sense to make everything consistent here. I'm not
> really comfortable with this driver, but I can give it a try.
> 
> Just to be sure, are you talking only about drivers/clk/ti/composite.c
> or is it about more files in drivers/clk/ti/? I'm not sure to understand
> the whole interactions between each components here.
> 
> Fixing drivers/clk/ti/composite.c to use clk_parent_data looks easy, I
> can definitely send a patch for that. But you are talking about a larger
> refactor, so I suspect you would like to see more changes.

I think we should just get drivers/clk/ti/composite.c consistent with
itself.

Brian

