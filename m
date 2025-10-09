Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014C421FF38
	for <linux-clk@vger.kernel.org>; Thu,  9 Oct 2025 18:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760036178; cv=none; b=BNVsXftxPLkFfT4nxIXk+D1TB2IXus2b5g8ExfPgr+m3N/asSmeL8GYd6betbaIq+gVGpfWFk8ZPJ99Sydb8rJoxXq2MMsgKsxrl1k5Vv7eh+tHDo2nSz2obXwHT7vif5wBK5p9UkIzDbzYOW58sPHsn7tqUwKGQiMF8zX1tGK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760036178; c=relaxed/simple;
	bh=4iB88tQw2WXsZzzM6xK3yQGqAvESZ/GXQ3GjoVzeMlU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YlJtHMyKwZmGF4WNINPPfrhizdhCdVRYBa+xc0hcPAol3EsBTXT7wOiJg3rIEASdvuNQHK4vxqRYrzvYWpJK6NTrRMGzjUWsz55fsTku/QUnn2p3npRD/6oKvM3ln/amTB8YEIWftCXB+KfG9wVUx93xYnCgeyLZoo7M49aX358=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IinhdPH8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IinhdPH8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760036175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=73VHJPHIbh12PnyxfeCzN+eZOdvnFxFQRvkYUUFjG6M=;
	b=IinhdPH8Tazv+mxUKMAWYZmuw/aFfoO4o6MVU/4HB3XAiOfQnenv46Iy3qdcV48jKnW3tP
	lVYjp2CkqSXS2iG8zJzseuyHFZFG/p96BihQHTNhgL6RORU63Tkhf2c7K+CNilbwUooutq
	n2TuEGeKYZAUFT1UG3iOdvrttfNYm+Q=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-ErWInrO4Pausuf_ONOsG3Q-1; Thu, 09 Oct 2025 14:56:14 -0400
X-MC-Unique: ErWInrO4Pausuf_ONOsG3Q-1
X-Mimecast-MFC-AGG-ID: ErWInrO4Pausuf_ONOsG3Q_1760036173
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4dfc05dec2fso70406361cf.3
        for <linux-clk@vger.kernel.org>; Thu, 09 Oct 2025 11:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760036173; x=1760640973;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=73VHJPHIbh12PnyxfeCzN+eZOdvnFxFQRvkYUUFjG6M=;
        b=THWz3/o5yT8qGVrTx35etMV8hj3aqUDuPUJc+UtwkKQeLNeLS2V0g2DgWh6I1cBdyO
         nHvq9zlsilW/oqdAIUnL1qzIaNiFef6bDCOzus0qXgLO3TgkJrjOO8y+onfoMFa5+ZWt
         7ZiTu3rlSdAEC3dZVQBgY7ZrXQ3gQ/1GpDm9QrqZ43F6il9BmRLK2G4cH8epc1+X+1tC
         MFjeNM356rLCgcVMhpGMxhCQYMvnFDeEfw60fmzKxvaiMtCP3ePXMilx2orPuJ0nDggJ
         Ldy4AGI2bIvzd/CL+kuPntNRJ/+UZKlAXPJsJOJYlwSvpvNCSFx4/OVgMQoAB7xKACxa
         qgFA==
X-Forwarded-Encrypted: i=1; AJvYcCV9WF5fS4d1BD70QV96SDCR54cniz9nmqQp1CnIMkmJD62u+O42RR+vBTpj2FTWmYPSX93WmqUgehI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tGo0FBjuIz7HECNCXe7mfZQlchDpPhbDpItqYlngKWToRIjZ
	TBBepaFkfxJTCzdK7TvzzKt1Fkl2DsecLCXVsC48QCy5UFtuYAbRZ5GB9Gn209oSx8vldNNukWR
	Juzwg2A8sRFcI78o0Hf12RXr2Akvl69sHi3JcZSgvGkPAX+/He13UOfcREjvb2w==
X-Gm-Gg: ASbGncvznvB6sYf2hAoVVL+nOCkI+Ko7VcJlfuws7sdAELZBfthVaRVH0Ezl7zJ0jne
	8oxtVa2ZWGVybHUsTWXvjzzUoF4vbVUIdhafksNJ7BONmUfeUaJGE87z7/XVZoWauExnYFbPajF
	Exqw8w1D9E2myTb4MCKIGUxO3U9eVSQMfqVDkAQ0MNGkdmh71zkBJbcLCcuMY9pB3AJFE0T/xpD
	iwJ4XxnkO0FTTKKwvEK+dpK1x+sPYgGof13UXb0AC1PwT55neYZPL/Q96OQZ3FZh2hC4iZegJB7
	bSMfSUDW7iW+T2ruHW6amkty2g4LtylZe2H/2WLbJS3m2wH8RsbUjQJ0Ob9aORkxZnYNmMN+yAc
	fcveu9t0S8v0Ma5EUoAbQaQS1XuRpY2bKZKGZ
X-Received: by 2002:ac8:584c:0:b0:4e5:7bd4:1beb with SMTP id d75a77b69052e-4e6ead65549mr104456831cf.68.1760036173505;
        Thu, 09 Oct 2025 11:56:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2AD5ZZcXckeSU9b450Mt8BqD9SOhoclS7nRF67Cec3FIHzgTkgVAjC1MmE6pVFS6HrvZ8kA==
X-Received: by 2002:ac8:584c:0:b0:4e5:7bd4:1beb with SMTP id d75a77b69052e-4e6ead65549mr104456441cf.68.1760036172855;
        Thu, 09 Oct 2025 11:56:12 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4e706dd1ceesm3026011cf.41.2025.10.09.11.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:56:12 -0700 (PDT)
Date: Thu, 9 Oct 2025 14:56:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: tests: Add tests for clk lookup by name
Message-ID: <aOgFSi_h95tfD8x2@redhat.com>
References: <20251002092036.2504858-1-wenst@chromium.org>
 <aOb6iNR9T4R9Hp3R@redhat.com>
 <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HPjEnYh+zUi67+Y=nmFfdRFw0xd=rT7L_-GNxouga4Ow@mail.gmail.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Oct 09, 2025 at 11:24:22AM +0800, Chen-Yu Tsai wrote:
> On Thu, Oct 9, 2025 at 7:58 AM Brian Masney <bmasney@redhat.com> wrote:
> >
> > On Thu, Oct 02, 2025 at 05:20:35PM +0800, Chen-Yu Tsai wrote:
> > > Clk lookup (by name) recently gained some performance improvements at
> > > the expense of more complexity within the lookup code.
> > >
> > > To make sure that this works as intended and doesn't break, add some
> > > basic tests for this part of the CCF.
> > >
> > > A new "clk_hw_lookup()" function is added purely for running kunit
> > > tests.
> > >
> > > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > > ---
> > >  drivers/clk/clk.c      | 11 +++++++
> > >  drivers/clk/clk.h      |  4 +++
> > >  drivers/clk/clk_test.c | 66 +++++++++++++++++++++++++++++++++++++++++-
> > >  3 files changed, 80 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 85d2f2481acf..a17d0070d11f 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -778,6 +778,17 @@ struct clk *__clk_lookup(const char *name)
> > >       return !core ? NULL : core->hw->clk;
> > >  }
> > >
> > > +#if IS_ENABLED(CONFIG_CLK_KUNIT_TEST)
> > > +/* This is only provided for kunit tests to test the core lookup functions. */
> > > +struct clk_hw *clk_hw_lookup(const char *name)
> > > +{
> > > +     struct clk_core *core = clk_core_lookup(name);
> > > +
> > > +     return !core ? NULL : core->hw;
> > > +}
> > > +EXPORT_SYMBOL_GPL(clk_hw_lookup);
> > > +#endif
> >
> > Use EXPORT_SYMBOL_IF_KUNIT instead for consistency with the rest of the
> > kernel. In clk_test.c, you'll also need to add:
> >
> > MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");
> 
> Didn't know about this one. Thanks!
> 
> > Since clk_hw_lookup() is only used by kunit, why not just put this new
> > function in clk-test.c, and use EXPORT_SYMBOL_IF_KUNIT on
> > clk_core_lookup?
> 
> Then we end up sort of exposing clk_core_lookup as well?
> 
> I believe Stephen wants to keep things contained as much as possible.

I agree about keeping things contained as much as possible as well.
clk_core_lookup() would only be exposed to the kunit tests if you used
EXPORT_SYMBOL_IF_KUNIT. Definitely go with whatever approach you think
Stephen will prefer.

Brian

