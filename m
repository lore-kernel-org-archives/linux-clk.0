Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DE530F934
	for <linux-clk@vger.kernel.org>; Thu, 22 Jan 2026 00:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043184; cv=none; b=J0Rnz3AKpDJgov3+MnyfvNE93RF7F5pf5/MPW7wvideInUvgMkSENOmD5ZjV9zmrNR6KP2E8zDTUI1xv8HkMBP19//7ebDJ8ZYKTHdknCN1j+F2HtWyuOxHULBoCrZ1imTO4JlssfwVIGKx4mXrjZ+/aQ9n0Ussq0O4ILe12k3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043184; c=relaxed/simple;
	bh=4o5lu0X8x3cz3e84g5Hu4E9AEmgeHTI+lU3tUjlxWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BhBcctBU47B2km8NDP8OmChmBNjHBuVrRVSRYWp5oPOOxGMkIBHAwnjCTXUDZVzKIF++f5Jid6mq2U84yVh7+myrJuuowjQEmUHyoXr9D9WsQPRiUQlHQTYdzAa4DlCkXSSG+QfwO9Rmnt5I+snz8FQn1CRFyy5Fu/tnHPDPV4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z9Jdu2gO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmDxtMHf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z9Jdu2gO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmDxtMHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769043182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
	b=Z9Jdu2gOQD8/k/MtpSVVmYIRHelq7CKXIR/lLPWBlu/Tc+LGrZaGjuHqkLZyavth9AIqw1
	iEkIUUxZOxOFFtr/19ujvRdtLpevNjSl53UhTFfuKkEB4u1tmTyJGMvxVMfNlbsDjNd1ui
	6r09MzHAuXa8tyo0wU1IKOPYj3MY3is=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-DIKf7I46Md2z7tIx7-X3GA-1; Wed, 21 Jan 2026 19:53:00 -0500
X-MC-Unique: DIKf7I46Md2z7tIx7-X3GA-1
X-Mimecast-MFC-AGG-ID: DIKf7I46Md2z7tIx7-X3GA_1769043180
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-88a39993e5fso17683966d6.3
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 16:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769043180; x=1769647980; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
        b=JmDxtMHfxH4xLK65Wa00bOBvB47OkUHMR37tudY5pdyqIskrHKU6HSTFMd0AIH4yp+
         aN5aBZfQkh0pzHkPJsAnl+Frk6CDD+kJxbjP/rSQAoINVsmINtqXWQddgrRxCLpJw7gB
         dtd0j2Pr5vE6M7spPv+QTNwiTqBI/9oE8DxNhrEGVzsikTC8dZbVy1OiwtqtwBhESvRg
         kii3fXkl1orPNzR/hieYxxCHPJe8rMY7UuxRWQUUdamnDAd9Jxxch3PasWHkn8eUgPiA
         wK64dotxwAE/eMmrZ7Z0Do00RfPhBIB6V1g7YtCzZ3q5HC80IzdImFPmqqOSuV4oSRqI
         upOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769043180; x=1769647980;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
        b=mfdwghrisnO16ykBLIEHO/8FhNkT2nvXMh31DwRWPZLVUEd0Bj6kMlsdQAbiYBMf3J
         ni7eiHeU731LzYhzjc605OinRyeSIoB0dArQKkDCH1m4Dt/6P62oaEbYQHfc8SGF+nc4
         RwDldWETpwFME4WpNiv7+FWBqsariDo/qRXPvR0/EDcjF8eQBBguWZBBF2JoaptwTbe3
         aQBxdkP8dSsNymEBd09gxhcxsqB5fI4eMAiCviDHZl5H9u+zUF9j9Hl4d5QFRBT7idxK
         bqfaAw4MSvprGvHPWackML6SogJxXn8yVaBtoWm88eSzDI32CXdy6gBATw2lgYdU51n/
         RrVw==
X-Gm-Message-State: AOJu0Ywe+45vJ2rikQIGpO72vJteeCTsLs70m8t6/4m0bvVNFnAxRBk2
	cwY9jdGi+vCqx3hnAJ0qdCG5RTDLozN06vvWnRTeGBPbXvigZN8iHAXiLYsX/SYp/pt1GOOe4Mo
	suPmeySiFEiWyEFQksRDa+AgPS9xbEJX/0VZxesp8zESm5bP4UZPdiMi0jBwnGw==
X-Gm-Gg: AZuq6aL0txD/TyQlMuNaPffxYKQue/y3iTd89iAgknKCvUMLsDx1ucOypZQQEwvfchE
	rb5WjtlqKREuqYFY9LtBFF62mCQtfhyu67ZSR/UU2pQ55lSaNUJZa3MOOin3JXyM7aDCKi2+Irz
	QujN4XvpAwPRlutHzeDnQSndOECmvPReDoFOt8GZeK8l8FN9rNUiECk1tcGT54vrXma7lI5i9cL
	Ddb5+nv33hKxu4eHWF6xVgZwIr1A966iWRY0AuNTj4Hll+kreeimDY9an9u+/JGr2QpXncDFeXJ
	Qs30+SmxuOKDCfUSC4HjR0CgwBlpQsnYIn72qeLLBu+r0GT/V91uBgYSs9tqxNbBCdRURJSRdV0
	F4fkhYjMPad0jVM8X0BSJnUqnHBg9f13927mZPDEJfuZI
X-Received: by 2002:a05:6214:d68:b0:88f:ccba:8f20 with SMTP id 6a1803df08f44-8942dd8c52cmr260833166d6.48.1769043180237;
        Wed, 21 Jan 2026 16:53:00 -0800 (PST)
X-Received: by 2002:a05:6214:d68:b0:88f:ccba:8f20 with SMTP id 6a1803df08f44-8942dd8c52cmr260833026d6.48.1769043179828;
        Wed, 21 Jan 2026 16:52:59 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71d8314sm1354117985a.24.2026.01.21.16.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:52:59 -0800 (PST)
Date: Wed, 21 Jan 2026 19:52:57 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [GIT PULL] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXF06fjOQcj6mDNF@redhat.com>
References: <aXFYU324yQ6uBmk0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXFYU324yQ6uBmk0@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Stephen,

On Wed, Jan 21, 2026 at 05:50:59PM -0500, Brian Masney wrote:
> Here's a PULL for this large series that continues the work to remove
> some deprecated round_rate APIs. I used the following b4 command to
> collect up this series:
> 
>     b4 am --cherry-pick 1-13,17-23 \
>         20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
> 
> I skipped some of the patches that have already been picked up by
> others. The last two patches in that series that actually remove the
> deprecated functions will need to go in during the next dev cycle.
> 
> One thing that I want to call out in this pull is the change to
> drivers/rtc/rtc-ac100.c, which is all clk related.

Alexandre requested a minor change with the rtc patch, so I'll send you
a v2 pull tomorrow without that.

Brian

