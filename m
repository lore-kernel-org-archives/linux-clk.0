Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE3C39C64F
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 13:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768482137; cv=none; b=G4LyHT2HkaQ+SHfjqXMxeNiPGF2QtN8SnXTeG7S0eBiageas9/DSvcawSVpEAvNG0eVFZnTynvKRNJ62Oekv8SYexOylLiC16pTTeUufe3mcWRa5SWGFr9FfowEsixU9tGpOLajlDhnvvBS6uydbEOK1mlJGH7xy5zqI+RM7D8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768482137; c=relaxed/simple;
	bh=A69ZO/7VQGiujVunOWYUggbHdGjMD0FduSfe6mMsudA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJoTnYuUIwGIoiQEEnCJdv0shGxd+W8HJMmAjj8W67nkVr55pmee3FflZHi8IreVeY+i5ix90dg/WwY/Pfi2Ug9ty2fD4FDlvN+Fph+tV9NttOPOoza0+P0b8+VGj3ELNACCMsztGXiBd6Ho3Ojx9Ukq93eWg4VMwLSVxlkxnhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dtyabFTV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sIHk3CNa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dtyabFTV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sIHk3CNa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768482134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yvng5JA6e+TbWXXcdfj/MzIBnSNMDZIedFcqPEoc/GU=;
	b=dtyabFTVrkQER7mEhW4c2XO37Kka5sN2bMr8oj9dY8pUTcv3M8zkRfoK0gDnI6ee6FkKQl
	vZ+mbN0Dk2RMbooYKvB0aJOMckrJ50wSqzwGZAk9XsKCuFZw+R232LuKAA+iLPvXt6AAtp
	5mUMuQHeE7+Qog2+Xw5mRRATX1vEd7k=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-oj-WwSl7O4elbw4f1SWveA-1; Thu, 15 Jan 2026 08:02:13 -0500
X-MC-Unique: oj-WwSl7O4elbw4f1SWveA-1
X-Mimecast-MFC-AGG-ID: oj-WwSl7O4elbw4f1SWveA_1768482132
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5014c472ad5so27530171cf.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 05:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768482132; x=1769086932; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yvng5JA6e+TbWXXcdfj/MzIBnSNMDZIedFcqPEoc/GU=;
        b=sIHk3CNav0Xx+C5NM0pO+LfK/7Kb+/g6M3Z4rwAYl4a92j1uRX3BlkTfyfMgbx7CPf
         gJCzuSNK4HPq+Jj4SR+WnMkYAnypP6lj7WJs5no4WSqMFqB00gzsoo8gOb9JqQz3H0Ma
         MQE39LL9MpSd7jA/gJ7uOeVPsb6tn8MrhYDo45PVw3nAgrmTgJLDdQypAnhYzYyYKWsv
         y6/Ma/wKTpfSGE7gsIUquYw2j6uf6rARZApLZxcaoXdffaCOLpc3MHYkS3Fi4Fj4/wTd
         yYhe9x9xOiUffXBRzRTO9VNVlWBOPOLq7T98wJiQYBue6lRgx0cpxiiIbcbf/lZnSXfU
         rozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768482132; x=1769086932;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yvng5JA6e+TbWXXcdfj/MzIBnSNMDZIedFcqPEoc/GU=;
        b=SW3iQbu/QqS9RS9/0IG+H61RSjitNfrtxAZNP72/ruQUcrTBI2YB2RjzCGMRTBfthq
         sws/QHK2Jd9YqH3xSu9n8DTTuBAlYU3dQrFF52CHOnrgHh3xFKKN7U712OawEgkzTQUr
         MSZLHLW34KtuCQsHdG+SiRTIEIUapeU7nlIJ+bTC6xjRKs1S0S5AXoMhJACH1WdkWhAR
         QLPCa/kuO1xjBj9WjL9tU6mzTM8pPzpUHD7TyIAIOsBWF5V7Ih4ZVc+yVjZsh2EOxh01
         ogqDRpC3HmPRQvhfK0tVcEdmFFzPAef4mHQ2zvgqtJJwvUa5c7qJGi/Y2y5md8tPPZ/m
         asoQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPtlnwoUJ1Lfi0CNteyqjSxEjASndLb2zIv8nDB01PlDTCjheeeziNmYhHIMinFdvp9kmHuiBtf5s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwO6p/7f6cjaVZwmUJbdJIQYugX1ER6TbL0DfUjKLhhLzx/Xqq9
	eKpUBQ/F3462obI7Tcmjh7NWL92wLxPt511hkLz2KoBM9jENcEb18ENuWbCphSq2GCqE0TDDEOh
	/dIsexWcA1UQ8ARkIdZhxcjK4hmkKnMzesSvS3bjtDniVLW2TS2/yzsiaEGi+uw==
X-Gm-Gg: AY/fxX41WkgBCOqu5By9BRSZ3ceXGPp5s1sA2yFCY8w42wb+yYwhgnoCYWyISUwmJhr
	PqHxHzIUoYGihVcG0UN6ed3jpb2hbtc5ArBH2lTp9eSDNfPMsTvD4tmakWqGvi90DBF8CIPx5oG
	NktQPZIwFBBoVwtvdTlWPKgN5dbDNSkuZbMLgOsee1f+400ABDUuB23eZ7TnTQvXUBJpmDFktTF
	53cRAmHtAh+XqbjkkBW4+Qx0PBUL468jsZ7x3AL2/rzn0SexV4IePuPOwKeWBurx0gLUh8TveWg
	/8/uPo/RZJrSYSrpTYlFwxBKAWY1hLo6bhhmlViwHAsZObbxx9RrqqMKoJSB3S/nwpjVbmfdCSt
	UNwSnihUcBQ5aEVoK6Elfq9Vugm8leUuzJ7sTQs7VNCV4
X-Received: by 2002:a05:622a:4203:b0:4ed:df82:ca30 with SMTP id d75a77b69052e-501481e9360mr76195421cf.13.1768482132105;
        Thu, 15 Jan 2026 05:02:12 -0800 (PST)
X-Received: by 2002:a05:622a:4203:b0:4ed:df82:ca30 with SMTP id d75a77b69052e-501481e9360mr76172571cf.13.1768482100257;
        Thu, 15 Jan 2026 05:01:40 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c530be5446sm385631385a.54.2026.01.15.05.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 05:01:39 -0800 (PST)
Date: Thu, 15 Jan 2026 08:01:38 -0500
From: Brian Masney <bmasney@redhat.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: Ensure correct consumer's rate boundaries
Message-ID: <aWjlMrlCEbprgKg5@redhat.com>
References: <20260109-fix_error_setting_clk_rate_range-v1-1-bae0b40e870f@amlogic.com>
 <aWhDLNFtaoU7A-AN@redhat.com>
 <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fe437139-4c33-489f-90f9-44e3dd3b0f9e@amlogic.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Chuan,

On Thu, Jan 15, 2026 at 10:37:55AM +0800, Chuan Liu wrote:
> On 1/15/2026 9:30 AM, Brian Masney wrote:
> > On Fri, Jan 09, 2026 at 11:24:22AM +0800, Chuan Liu via B4 Relay wrote:
> > > From: Chuan Liu <chuan.liu@amlogic.com>
> > > 
> > > If we were to have two users of the same clock, doing something like:
> > > 
> > > clk_set_rate_range(user1, 1000, 2000);
> > > clk_set_rate_range(user2, 3000, 4000);
> > > 
> > > Even when user2's call returns -EINVAL, the min_rate and max_rate of
> > > user2 are still incorrectly updated. This causes subsequent calls by
> > > user1 to fail when setting the clock rate, as clk_core_get_boundaries()
> > > returns corrupted boundaries (min_rate = 3000, max_rate = 2000).
> > > 
> > > To prevent this, clk_core_check_boundaries() now rollback to the old
> > > boundaries when the check fails.
> > > 
> > > Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
> > > ---
> > >   drivers/clk/clk.c | 8 ++++++--
> > >   1 file changed, 6 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf..0dfb16bf3f31 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -2710,13 +2710,17 @@ static int clk_set_rate_range_nolock(struct clk *clk,
> > >         */
> > >        rate = clamp(rate, min, max);
> > >        ret = clk_core_set_rate_nolock(clk->core, rate);
> > > +
> > > +out:
> > >        if (ret) {
> > > -             /* rollback the changes */
> > > +             /*
> > > +              * Rollback the consumer’s old boundaries if check_boundaries or
> > > +              * set_rate fails.
> > > +              */
> > >                clk->min_rate = old_min;
> > >                clk->max_rate = old_max;
> > >        }
> > > 
> > > -out:
> > >        if (clk->exclusive_count)
> > >                clk_core_rate_protect(clk->core);
> > 
> > This looks correct to me. Just a quick question though to possibly
> > simplify this further. Currently clk_set_rate_range_nolock() has the
> > following code:
> > 
> >          /* Save the current values in case we need to rollback the change */
> >          old_min = clk->min_rate;
> >          old_max = clk->max_rate;
> >          clk->min_rate = min;
> >          clk->max_rate = max;
> > 
> >          if (!clk_core_check_boundaries(clk->core, min, max)) {
> >                  ret = -EINVAL;
> >                  goto out;
> >          }
> > 
> > Since clk_core_check_boundaries() is a readonly operation, what do you
> > think about moving clk_core_check_boundaries above the code that saves the
> > previous values? That way we only need to rollback in the case where
> > set_rate() fails.
> > 
> 
> Perhaps it would be more appropriate to move the clk_core_check_boundaries()
> check before saving the previous values, like this:
> 
> 	if (!clk_core_check_boundaries(clk->core, min, max)) {
> 		ret = -EINVAL;
> 		goto out;
> 	}
> 
> 	/* Save the current values in case we need to rollback the change */
> 	old_min = clk->min_rate;
> 	old_max = clk->max_rate;
> 	clk->min_rate = min;
> 	clk->max_rate = max;

Yes, that's what I had in mind.

> The changes in this patch are intended to avoid altering the original driver
> execution flow, while making the minimal modification to fix the issue where
> the range is incorrectly assigned.

It's ultimately up to Stephen what he wants to take. I personally have a
slight preference to the approach above, however I don't have a strong
opinion about it. I'm just calling this out to help with reviews.

The one thing that Stephen will want though is kunit tests for this
since it changes the clk core. There's already a bunch of kunit tests in
drivers/clk/clk_test.c. Feel free to reach out to me if you need help
writing a new test.

Brian

