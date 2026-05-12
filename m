Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67616357D1D
	for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 14:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778597467; cv=none; b=F0NThMSV2lAS5UQXKhwbsrzt95AarvlUl9he4DvUKvhGIDytOqdI/1b2V7rRV4D7Zq71CcTOr8T73ubEIfukv+S1Zz+j26kjsqM0uNZx20bDmkq/1l1K/dPh3O1milHd8Pvd2CbJfdgIv/2hzmkkJNMUwJpcZotDhBZLbNOvGGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778597467; c=relaxed/simple;
	bh=LCRT0lIDxVzqbNWDrCBnSUs93StyyEkbPx9qQCPVLZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb6FkBNLwueugQg25dujxJcNgAmPuRlv/ylvVrf7yTyuBCZWvTR/dYBgLGIGIw2nUENej/k0Wb8MVFxChINmDZ7Q3Op2x5CrRzgW75+TxN8bEOaYt8hJRYZo8/KCcfQ+hKeHuo7KsuEpZTAAOWZE8q9SMInXOgG6WD/CYbxifB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hZXHOXgL; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z46X6UUH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZXHOXgL";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z46X6UUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778597465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=;
	b=hZXHOXgL/lx9WRYyvCqAa2Uwb7hIpKR9DZaQufXEt9jck77hUB8b6S+BbfsiNT3fg3Rd5E
	TO+WoRDXk/s+l4EZzop484QHGO4a6FwjqaWkfLLfi9ixZYfSjnfD2dlVJ96DmQYwGO0EwW
	jk1qUBEpfPfqldyBJQgc9uZGqEQMaYs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-438-xwBhd3nHO-CufNXQ1bfFPw-1; Tue, 12 May 2026 10:51:03 -0400
X-MC-Unique: xwBhd3nHO-CufNXQ1bfFPw-1
X-Mimecast-MFC-AGG-ID: xwBhd3nHO-CufNXQ1bfFPw_1778597463
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8aca4660827so148299246d6.3
        for <linux-clk@vger.kernel.org>; Tue, 12 May 2026 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778597463; x=1779202263; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=;
        b=Z46X6UUH2BqM3fnJaSvGfSTNUvxwtwhF3PNCI/7bU7P1qEXFCflTqO8FSetUjO4KML
         5sCk43hxpnBnerj+/dBpKcFZZepkXLkO/eCeit4b9lC/n2KdKgMgqUibI5hWIwAVMQgw
         v+Lb+F/LaPBrN7b6d8b37QuCx+Jj00cLOnJr3GHfs6TBii93seU37yE9Vy6TKPlVjRY9
         5ae+j7m6a7R1MmZYkNU/+j1gfkIqXFKHEIbXRqkJUgbA61AB0p3LGs7Qdi18ynaRQlwT
         T+vsgBch6nH3MWiHJT98oTsDD/ke79Kvngyl30O2IF3lTCJRhp01jhkCK3XEZUxZgxQ2
         bEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778597463; x=1779202263;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iMZtDzw9AgLdaSSTv8chWku4pEUpPXtbY7dC10A82r8=;
        b=qTQbWvOKyJvTWMezHWLnzU3h6jIBRi3WYMMsN9mxly4Xwug4fAKe5qV0ANJLkjjC8r
         SPzT2AWQoVcz68nvyfVcKKR4LkefbpktHzNhEP7LnwqP9SZVURsSzcuaNcwQ9E/Q/OL1
         3ydtUaxOyoMmSGAQzA6AGSTFpvklgGFfYh3ebtCUqrZthsEg1n9YGWwaPqz51bBL1lS1
         zAPrSusGCOP7zuh8oBFiHn9wdX9KJ9v/eYMJPszGU/FV6/2daHyo9afD6IO6p8l0nf4N
         DK3EUGpc7vUY1rmYLTVwx6RU7aK+PsbkgU45q9GKa6HDhL/MgjUbmV0vxg2o434fXLTa
         V4iw==
X-Forwarded-Encrypted: i=1; AFNElJ9CaB36q0v2Kdid4B4wDTWX9SWsz7RM3XlhiIKdM1WPVrAEDzoyUXxGJ/TTyaMUCn6Z22O3iTQcC6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyQOnpNZdxVlHtCISDHE1uMMHueghug4+99CBoDQoW8+zxd0mh
	HuRnTmEDZ4as9qkh0Eo1u0b8UgC8Dx8BWvR5d2iRLO7J219dhPWmbY2TOdTuXQ0YHwYyt5X3IXG
	93UOrnQjjn2YxsHcK/NWHn91p9gNp03c2LHSv561rqI7B96YRV+YhR1L+o/aWqw==
X-Gm-Gg: Acq92OGtJAGAvAwbxPouMey9BZ+yNZU7kwz/iKYX7hmTH4+Mz+G9AbNpau5r0SJuQUm
	Zr3HnZoimmkv6Vm5eUKU+s3G3WiLj4AcITeYXuXyTXiq0mBK+D6lhAt9o5KRmzHF5exqwen61my
	S97FUs1fs1NhgUyE1df4E5yp8VDk6B2D+cAyE1MJRUwAGfuXYPXEbcBvmGG/ciTc3rxYYmQNYYA
	lDqkx+DZfTOhzc8mzVTjDhRh+q6haJtDxvAQbKCVDNM5sO7KgtpvRdHQlyrgkpiZYfoa9Cd7aT/
	5wqujcMuSaayvAsFEcJoI/6GnToHyY5YzCWbYLye/zreB7+WU974lcn1wd0kbEHK4DVH3kp1vEG
	v71dPVHJ7A0l+ZA7SvYLqFbZzeK2fhFgJSS1P21MZ+4io6Y3NyZRyVsRA
X-Received: by 2002:a05:6214:55c8:b0:8be:7779:d1b1 with SMTP id 6a1803df08f44-8c6636b541amr45095186d6.30.1778597462919;
        Tue, 12 May 2026 07:51:02 -0700 (PDT)
X-Received: by 2002:a05:6214:55c8:b0:8be:7779:d1b1 with SMTP id 6a1803df08f44-8c6636b541amr45094676d6.30.1778597462333;
        Tue, 12 May 2026 07:51:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c7e2e5sm126008606d6.34.2026.05.12.07.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 07:51:01 -0700 (PDT)
Date: Tue, 12 May 2026 10:51:00 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: a-christidis@ti.com, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <agM-VB-ToGFNphfu@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512104848.4axgjeto6i7ejvli@retorted>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Nishanth,

On Tue, May 12, 2026 at 05:48:48AM -0500, Nishanth Menon wrote:
> On 10:36-20260511, Brian Masney wrote:
> > On Thu, May 07, 2026 at 11:09:34AM -0500, a-christidis@ti.com wrote:
> > > From: Michael Walle <mwalle@kernel.org>
> > > 
> > > The TISCI firmware will return 0 if the clock or consumer is not
> > > enabled although there is a stored value in the firmware. IOW a call to
> > > set rate will work but at get rate will always return 0 if the clock is
> > > disabled.
> > > The clk framework will try to cache the clock rate when it's requested
> > > by a consumer. If the clock or consumer is not enabled at that point,
> > > the cached value is 0, which is wrong. Thus, disable the cache
> > > altogether.
> > > 
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> > > Reviewed-by: Randolph Sapp <rs@ti.com>
> > > Reviewed-by: Nishanth Menon <nm@ti.com>
> > > Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > 
> 
> Brian,
> 
> Could you clarify if I need to take it via my tree to arnd or if this
> patch will go via the clk tree?

Sorry, I'm not sure what Stephen prefers here. An argument could be made
for either approach. I would just go with whatever you have done in the
past.

Brian

