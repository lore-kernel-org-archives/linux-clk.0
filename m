Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328E400979
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 12:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784549427; cv=none; b=mxscTK7LSgQv3iyXjWn2pKXaufu5utnrLpMWu/c41zIVfXzm4T/sHhXq3wUJ+oZEk7DjqlLO5TRWDuEen+c+kPx40QjnGTdRzhmXxrgJFIxJtvcpAfcB0jjZKFkfCB+iQv22NaaEviOfBaIk1lUIN6y/FdgEIq1nwQKDYp1bD0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784549427; c=relaxed/simple;
	bh=0ZlUemM73OrgpgXSt1vbnJWED12Mm/d6inEdp3EPcN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pW8OFhS6B6q0VuMSeywskkEnmoWeSTNPMS8lZemBuq4Z/+SzHHxx7Q3e4jEDP93Mh+VOwmm98aUhOkrc/LPz44UeZJTzfZFFZTrdsRWBWWTHqUK76eWMRy4RfKVb1yIArff8iZEPcH+ljjmQDMjzj3YLmw/P0I6NleVLHoPiRGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FWVTEru5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PXcuv2BH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FWVTEru5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PXcuv2BH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784549424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v1QUCAX7Ci9FqKXo6/kzSHEvMASwukM4IejsCu0cW4c=;
	b=FWVTEru5CIEyPSiduj2VQrwRGXUmep7vCW0xrNOYE4gp3rbopzW2DEzgsvb6A5s6fspfhi
	Liz0T/pnvGGP8Ii805W6lfl3snbXtwR7gvCHLOeAfxTtZpTlfuJCab+m9QNJ+8t8Y+Sf8F
	OYYYkLq5tz+BypjHKE4IeYcSOlp3EeE=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-694-jskEZP1HPRCl6R7M7xZw1A-1; Mon, 20 Jul 2026 08:10:23 -0400
X-MC-Unique: jskEZP1HPRCl6R7M7xZw1A-1
X-Mimecast-MFC-AGG-ID: jskEZP1HPRCl6R7M7xZw1A_1784549423
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0867a75ecso89588236d6.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 05:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784549422; x=1785154222; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v1QUCAX7Ci9FqKXo6/kzSHEvMASwukM4IejsCu0cW4c=;
        b=PXcuv2BH33H9A+k/prBNmY43yMCiquzJ7rR/D78k6v5+mEta16lDry0adsNE8gLRwl
         ibjmiSaYVDGr+RY7LknpFX77Jf8TzRB/oEtj/uknlSFGVHzxjPx3wIqTjiIlu6tUveMH
         00RZyoF7frKhnI9YiMhI/fhUskx1r78HbdfBXmT3sFC48HxLVGP3G37EufOK1+lKZ2W2
         LKAD7rEHtNzHuiqFPOqfuVnJuzdo6xI4kKtuAMtcOPfljFatvsIRdB4STLr2ZyG7WC5K
         YIQKB8pHgSId/x62CLX0GiHYIWdK9Fr2ubdIEcq6DIOf4TNfxF6n8Oa+O7t5s5MF9Voy
         crUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784549422; x=1785154222;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=v1QUCAX7Ci9FqKXo6/kzSHEvMASwukM4IejsCu0cW4c=;
        b=TYzuoM7vYfYlI7ZgFQh0ryPLlXARCrWmbQHmGi/jP7y43H8tts6rfQlu0F9Y3VdwMG
         Etyd4W+1ah+hGUlQyUwNtib1vJ1k2mVPGqnWgfcWJRj3KvpSXUb3UBwn341BNP42OFA5
         a622E4wcRrafCwDX/++jOp4wmS2tjsLyY5Ti+KojU4fzffj4xC+eAmhgdpob1tDhyeVF
         vcqwsuA7L/kWKFL+UHD3/kpKURAQ3Qn+siQaNpJKtYzrWjYlVjzCG+rD0+iTvakqasmi
         kmJ47Lh2fSnlhdoVw0X//hVrO9Yv82SyI7HmnFyjtRkFvW961x9BVFYgmfAW7X5ejlAD
         iRVg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/bguCLcJ/Tuaq6uyHNM5PMO4by4J0iPLVQ3xSTUVnMvEbAbhZmufyGsuyVkSDjji1J33YnmGrSX0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEDf4diz2dg35TrpL9pMU6JHDXvrwyp32jN4kDRVGRfAczpVnR
	d1rncnCwaEqPuBBv+B65yyCgrifzgkVpQHuIqPxM5IwDUro2HL4Qp7rX0+8GPuEbvG5Scrj2oFT
	1+NnhkRK4v4w8c0SCdHv0ad+ryUWD56T71HgzH7zyrn/rOVNxI5eNTsyFCRo+RQ==
X-Gm-Gg: AR+sD10t/G77NE1+F6z83YbHjr9NijOlmtkHihYxNjacw0lGPaIksLFugJL1qQBMpPX
	apG6S6Vb9kiTARZy/48iXSA8NREbir3TcNOgj4VEUZF4c/6fCC/DuAknQ8YXkQCc6P2D+k1lUvF
	m9qRRJTiPjzdYPWrWDTG9w7lELE29+lyJl6v7ek4ZPdAthRvXsaDKN5b7SrLN4QViVfnZwwtaGb
	ZFpzccjTF9ogtTdTU0VHM5EFW2k8DAmij7mvRkENdFe5xWJqk40Nly7h6gaHJcNxjJoWzRsIQPv
	1PM5l3JkR7sEC+mKekKMl+R5ksirlrRJ77z4OXdXawrJGvY5zc2JMTaO6Ssj+oAFQZqeRXA4i3O
	Vva9kuIbOik5hqCavkMe1NPL6WhBKrUNBXvk=
X-Received: by 2002:a05:6214:5193:b0:8fd:6e22:c7ef with SMTP id 6a1803df08f44-907784f78f4mr144895006d6.64.1784549422462;
        Mon, 20 Jul 2026 05:10:22 -0700 (PDT)
X-Received: by 2002:a05:6214:5193:b0:8fd:6e22:c7ef with SMTP id 6a1803df08f44-907784f78f4mr144894246d6.64.1784549421666;
        Mon, 20 Jul 2026 05:10:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907786f365fsm89080326d6.37.2026.07.20.05.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 05:10:20 -0700 (PDT)
Date: Mon, 20 Jul 2026 08:10:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: clk maintenance [Was: Re: [PATCH v1] clk: Use named initializers
 for platform_device_id arrays]
Message-ID: <al4QKxSTz6wd8EsW@redhat.com>
References: <841cf835a24bb2f3acb99a97bb58e583220e03a2.1779963984.git.u.kleine-koenig@baylibre.com>
 <aln6H4A2QTO9w3Rq@monoceros>
 <alpC8l8qPFL955ZB@redhat.com>
 <aluuES750vojgH3q@monoceros>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aluuES750vojgH3q@monoceros>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Uwe,

On Sat, Jul 18, 2026 at 07:13:11PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> [I trimmed recipients as the new topic isn't related only to my patch
> under discussion in this thread.]
> 
> On Fri, Jul 17, 2026 at 10:57:54AM -0400, Brian Masney wrote:
> > On Fri, Jul 17, 2026 at 11:51:17AM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > Do you still have it on your radar?
> > 
> > I sent Stephen a pull on June 29th for stuff that I felt was missed during
> > the last merge window and I included 4 of your patches in that pull:
> > 
> > https://lore.kernel.org/linux-clk/akLzCVzbMbUsgDda@redhat.com/T/#u
> > 
> > I haven't heard from Stephen yet. There's 2-3 other pulls waiting as
> > well.
> 
> I only occasionally have clk patches, but my impression is that getting
> feedback takes quite long and without Brian's efforts also things would
> get lost. (Thanks Brian for picking up my stuff!)
> 
> Looking at the current maintainers:
> 
> 	$ git log --format=fuller --since 2026-01-01 next-20260717 drivers/clk | grep -E 'Boyd|Turquette' | sort | uniq -c
> 	      8     Acked-by: Stephen Boyd <sboyd@kernel.org>
> 	     28 Author:     Stephen Boyd <sboyd@kernel.org>
> 	      3     Cc: Michael Turquette <mturquette@baylibre.com>
> 	      3     Cc: Stephen Boyd <sboyd@kernel.org>
> 	     81 Commit:     Stephen Boyd <sboyd@kernel.org>
> 	      1     Pull clk fix from Stephen Boyd:
> 	      3     Pull clk updates from Stephen Boyd:
> 	     54     Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> 	linux$ git log --format=oneline --since 2026-01-01 next-20260717 drivers/clk | wc -l
> 	453
> 
> (Maybe that is because Stephen cares for the core mostly and arch
> maintainers merge stuff about their clks themselves?)
> 
> The last commit where Michael Turquette was actively involved is from
> 2021 (a331659e32718b31f3a304d7797a77d31610468c) which is also the last
> mail from him on the clk list (see
> https://lore.kernel.org/linux-clk/?q=f%3ATurquette).
> 
> I only observe from the side line, but with the relevance of the clk
> subsystem I feel maintenance is underpowered today.
> 
> Is it time for Michael to step down? Would Brian be ready to become a
> full maintainer? Is there a need for more reviewers? Any volunteers to
> step up?

As Chen-Yu mentioned, I talked to Stephen about this at Linux Plumbers
in person last December. I'm interested, and given the importance of the
subsystem, I think we actually need even more people to help spread the
load for a healthy ecosystem.

Since there's a fair bit of odds and ends that get missed, I tried to
start gathering things up for v7.1rc1:

https://lore.kernel.org/linux-clk/abLV9vjYxXsKciHW@redhat.com/

But I never got a response outside of Andy's response. I don't know if
Stephen didn't like things that were in it, or if he didn't like that I
gathered up patches from other folks. I just don't know.

That's why during the next merge window I just brought missing patches
in the pull to Linus:

https://lore.kernel.org/linux-clk/aeeHSrZmAqE4ugXY@redhat.com/

... and again during the last merge window:

https://lore.kernel.org/linux-clk/aj1NUYRrD30ctAbt@redhat.com/

Next week I plan to post another pull for new material posted this
development cycle for things that I feel are ready, and where they won't
be sent in by someone else via a different pull.

I'm not trying to take anything from anyone, and I'm not trying to make
anyone mad. I'm just trying to step up and help make the situation in
the clk subsystem better.

I'm also trying to separately address some long-standing issues in the
framework:

    v3: clk: implement sync_state support
    https://lore.kernel.org/linux-clk/20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com/

    v8: clk: add support for v1 / v2 clock rate negotiation and kunit tests
    https://lore.kernel.org/linux-clk/20260327-clk-scaling-v8-0-86cd0aba3c5f@redhat.com/

I also removed the round_rate() op, which involved 200+ patches across
the tree.

To help with review, I also think that we should enable Sashiko reviews
to the mainglist like some other subsystems currently have enabled.

Brian

