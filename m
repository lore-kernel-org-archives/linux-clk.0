Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A452146D2DB
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 15:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859075; cv=none; b=l67DSeQwSzrqoZTahSkw+45J1kiKIrbpc4EucfbD1iwgK979a2qx+2LJjR7zfjNTFXr+sCsYbPESweaR0y9ePsQy3pe+tggHzLHWGjzqBY60z2fNXJUDI2YFsV3rOdq3Pe28CrfEidUsylcul3TggrUlcQc0j6O8XNn6jULO74w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859075; c=relaxed/simple;
	bh=fUTHTx2z/ytGSZ8c6/Jopz376bDKRTBCj+nJjJ+aB5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mmBBiS3GYPvGn4k8w3/lORa1crJBgeJXDbv3G49lFPWyqSLxrtXPR5XIsvqpmvTPGblElX4ETmoe6mn7c3a2TKxSFu75vRr6hCTgylVofjtbgPDrRKAgGmOkjyiUdQYCvK/8iCle+V+7VUus8aJcIrFqCSIwvImFafHsZrvYyoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MlbAkUbj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=c0Hkc27x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MlbAkUbj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="c0Hkc27x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785859073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UKSqhVCKV28Q6Z3s7N3OQYhv7gvj0WpLmagy5hhZZl4=;
	b=MlbAkUbjzv456V/gxt+lSDlICSkkul4MAnbV7ZbkDFJGxdsvLHOFF3Ybx0YHCyXVu98bIk
	hNO6BPBXLEFIm9dEqCd0PV63X0uUxSzK+gwGcem3AW3JXRDE9Ve/K43CkjaaIfk+e0hqlb
	6mDgrhyDL7BRZ7Dy4EE2RKOSbCVeqo8=
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com
 [74.125.224.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-uGfXWsn2PaWv6nLkLUqLGQ-1; Tue, 04 Aug 2026 11:57:52 -0400
X-MC-Unique: uGfXWsn2PaWv6nLkLUqLGQ-1
X-Mimecast-MFC-AGG-ID: uGfXWsn2PaWv6nLkLUqLGQ_1785859071
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6648d902a6eso13761800d50.1
        for <linux-clk@vger.kernel.org>; Tue, 04 Aug 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785859071; x=1786463871; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UKSqhVCKV28Q6Z3s7N3OQYhv7gvj0WpLmagy5hhZZl4=;
        b=c0Hkc27xz4h74Sm8vfCjwvp6OX10vAJQ5qVW/aHeQhVRZpmX9j3zdJMis82dbpPaDP
         31G8WN+H2VW6X1yWIM5YM0vK3Vfq0CXCqMdXhRZ6A2l8/VedTsg/7AF7OVo4la5nrDGO
         MGMjnEk9bB4pDfD+wBBd4Fv6UR9y1H6pES3Tqgg+YK894/j9Lm6pMVJRXY5lnTK/c8X6
         EvTsYvArojBsKrhiVAu+qxua5ZUCxJr0zSOBcyKksebHDAc1dcos7KdhlXBR4xi4GU4O
         UYe7Mu6ZiizQgO1yjecp3jw76E004eg0zLCzS9us5ctlF0tL1h3ySUfENHitm0Tsj/pt
         plbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785859071; x=1786463871;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UKSqhVCKV28Q6Z3s7N3OQYhv7gvj0WpLmagy5hhZZl4=;
        b=NP/0FzKeXcqoTHkxZNoyyOomkpH5qdKAe5ApI+yf0uwsQfTikCIhC9wWHTdcbxm5tu
         M9smYV17gcAXW6mcw7rvjPTpVgy9r3BO7+j1XsK7ykXdDTf8bkjxVpDgo0bSUdYJlyvI
         PtytXafnpTGuvPdMy9zDzg1D7WP+c3j14yPW5uugCEgkEvmVoydwuoqTWris/hPVK644
         8gkLAsdCKtrulDBHxUbYo+8Re30zIhptrlQa/pTbi4xEAL20oKy5LO0c62dSHu7RlmXu
         ShIAFcTlM9lmD7k/4qG/qI1ec9eqF2yT6k/DpOgnprmhRV1c65ZyyI3tMr0gc9oo/klR
         9/4g==
X-Forwarded-Encrypted: i=1; AHgh+Rpv4yzTgq+Gur4h4Dc/AGeim1f3hYciBSsr/qgAgkZTRteZhcB6UT9CF2lS3HM88Ee7t2m9Ltus8ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXGNODgIw8yy9eiWDk57LkM1C/O389IwAPqqS8djjlmWOFp17X
	IR+5jMqODV2nvae5TTXRMA6LzJhYdiet5F3kqRFdCxQ6Uvwzq6KSokZ4ZgokcbK5p/OfPzHfolg
	+oOEQ91aU+gIbwUquQanZ05ob0VHb9KTHRsJcgoK5sAEnpcDCJcyd4Tyq8AxeLg==
X-Gm-Gg: AR+sD12cVQOblJW56BjQcBvrxUJGAHNpqbrYqv1IDlecAw63Dysa7vZdQMrgZr6KP3K
	ejTLBtJtmFWenVmhVCl3H0Qybe8W9+5xdJCv/o2xUqRdjSKu14RBUPNGLuY8AYOH0bPd6KvLv0V
	/f5rPH5sbLfjq2tmzBlSMklTrS5bPftx/skjwcDsdJZn3gRrtc3EdvrQ+GwlkGdmc8hHQbJRAw6
	OTvQXN/WQaqD0oIrAAyiC2RZaIJoZCWa0PWEjEbNtE3U7zhuxAFAHulfae2GJxupA2oSiiWsMTI
	fkjPgY8Wlu+cxAXzUfyYWdwtRzIJMhbXajfPu82e1yLC8/yU18Xo9stI89DZFGr+rm3Px150i15
	tyb/broPK9MPojv5ckjULaUMG2XNjDg+bUuo=
X-Received: by 2002:a05:690e:480b:b0:668:42d:95e5 with SMTP id 956f58d0204a3-6694efceb34mr13983397d50.4.1785859071636;
        Tue, 04 Aug 2026 08:57:51 -0700 (PDT)
X-Received: by 2002:a05:690e:480b:b0:668:42d:95e5 with SMTP id 956f58d0204a3-6694efceb34mr13983378d50.4.1785859071196;
        Tue, 04 Aug 2026 08:57:51 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669915f2307sm914518d50.13.2026.08.04.08.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 08:57:50 -0700 (PDT)
Date: Tue, 4 Aug 2026 11:57:48 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] Drop Michael Turquette's clk maintainer entry
Message-ID: <anIL_FKn9O4evOlL@redhat.com>
References: <20260729121640.3864006-2-ukleinek@kernel.org>
 <CAEG3pNCwa8ZyQHuDLDiCWXDUrGcuLpT8n6O75yN8tLsgZ5x-Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAEG3pNCwa8ZyQHuDLDiCWXDUrGcuLpT8n6O75yN8tLsgZ5x-Lw@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sun, Aug 02, 2026 at 06:34:06PM -0500, Michael Turquette wrote:
> On Wed, Jul 29, 2026 at 7:16 AM Uwe Kleine-König <ukleinek@kernel.org> wrote:
> >
> > Mike wasn't publically active for the clk subsystem since years. Stop
> > pretending that there is a maintainer team caring for clk.
> 
> I was hoping to send this patch myself, and to recommend a couple of
> folks for promotion to the clk subsystem. Alas, you beat me to the
> first half of my plan.
> 
> >
> > Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
> 
> Acked-by: Michael Turquette <mturquette@baylibre.com>

Thanks Mike for everything you have done over the years with linux-clk.

I posted this patch to make me co-maintainer to help out Stephen:

https://lore.kernel.org/linux-clk/20260804-clk-masney-maintainer-v1-1-de593189a9a1@redhat.com/T/#u

To help make this subsystem more sustainable from a maintenance
standpoint, I propose:

- To push more vendors to participate in meaningful reviews, and send in pulls.
  A recent example of where I did that is with Mediatek:
  https://lore.kernel.org/linux-clk/amuWdRD-TBQtFT_4@redhat.com/

- Try to find more people to help with the subsystem as a whole so that
  this all isn't on just one person.

Brian

