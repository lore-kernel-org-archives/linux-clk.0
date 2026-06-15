Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9C53E5587
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 14:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781533510; cv=none; b=OMgxZ0FnV9AYHP13vRZr0SaPks7EGMD6VqfJPTHEoMi3Ws5fEMUkzBtDopMfkBRIRcGqz7m6coQqy5LIarIKH/vvOHE52FDIm/VZQLBagoJkOWbCWPXOQcnYRQ27E8GRh5a6fWIExX2EWwhYbPe2dmqwfiDQKmrrNiaoLvjoFA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781533510; c=relaxed/simple;
	bh=3iC2i87xS9mCd/Ng/n0/ibrULXDsMvrLdh9naH6TGmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ofPBheoBaoyR81ii976Gt+DpIQ7MSidwbFEpE6if0asbY0FhdcqXVy5vHCv1Obv0wbtAW8pEwa3BbAC7bfmBhkrkpyEu82jL6cNgXfnsYQqwUY2sGk4IoGe0qMecH1CM4ZgXDs+aOQYPfDzyUPkmZulvUzhoMFNM27YoF5To59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JzDQJVtD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ry967fT9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JzDQJVtD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ry967fT9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781533508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
	b=JzDQJVtD3am2U7Eo1LNfwr4oLHkMSUlhiXSaH0gwyndWy8fVqjH/aThZDlxMjstovJUWTq
	SeHFoxVXDRsGRi7/7BzK5k5HZ6pgm36fb8VGk4zXgfBM5r/kgjpJE6fr4mLtIPgCK35ntg
	/IeaktallCwmBGUAqhASWeua9E2gj3c=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-zqzWmN3AOaWlv8Xlbb_onQ-1; Mon, 15 Jun 2026 10:25:07 -0400
X-MC-Unique: zqzWmN3AOaWlv8Xlbb_onQ-1
X-Mimecast-MFC-AGG-ID: zqzWmN3AOaWlv8Xlbb_onQ_1781533507
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51772325a64so44917421cf.2
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 07:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781533507; x=1782138307; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
        b=ry967fT9CmJC3sc59UK3ZgqozynC7VTHvY/PVYUisNGsjlc8IFghn40B/uEOv3r7Ob
         2Kh7mQE+8xAPpROnD+IfWLRJi6oqEqXn1Aa9lIROBeCmMnl66MulzCTWjtPiWyH+DkbC
         r6QzJFJYomQiPyeOXvL+CJJKBnPJPhysxCzpyxbODARt8jrRtYlnJxa+VlJYj+ZOZbWA
         iPnXsWoL+Eu4RCjLjuSdhCTf/5IiDm0SPo6E7AtbEmqguMHkF3G7N759KAYTnT7MuSc8
         je4HNkQTlPpVxApcZnORCch6xm6HQuele/lvhinDl+HUEi69sw0f/+i5+bsUWZDvO4vo
         ylaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781533507; x=1782138307;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh0dNKG18px5DpO/h+4aJqXUivlxzo3JbzN1grHbi+o=;
        b=Qg6tIA/9k2vZ4ccgBW+T08AaMAI83PV8LMRMSEQliKGPB9EshokUFAy1na5gcKIHdU
         CN8rjaryYZT2tPHWHkne4FRmk74tXMr2ufMwY9GKpNbIUinwDJu+hmIcGQA4w0SJOK30
         ub5U/uXOwUX2ZA0QoYGZ54uNyCpuo3hthklPlG3FEkrHSS3AYxtWHZrRXJ0JcsXklG6b
         UMMLzYJC6pQ5PjVd4I/WsW6Cb+9XniWC1KX3FqhU/OhitW5zJBM8qBxG89sfc+cFvPDk
         E7mf73yFAmWqEEz3f+vIx8K6bH1pXJq8nCqVVAlf9bdTJiu/v8udeIFF01bnHrpv0H11
         K2Yw==
X-Forwarded-Encrypted: i=1; AFNElJ8sQy2d6Gh69Y7fSHb43K20ReUHlBp2URmisEuWVI5Yblvn92OENHDdLXjSZ6lX2Mv5qh+zFQ67n3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YybhCOvN/Fcrjviw+HQkMO1cmxy9cligeTZdYNJnkpEa9TcGatR
	6/H5sWRW9wuI6nQ+9j6atkWYQmDBVt6DsIS7T/KHCOYjsZVL8IKRVWJzWPoGfSkk1C3lV3iNVtJ
	ZaIpUN13Wp316NrIJK6f7lJqVvWQDAO6RqZtD6zQbFefYsFAUPGeSkdyZYav0f3WrVkcXIA==
X-Gm-Gg: Acq92OESAlmymNUPUPdoJNjLPfMYCAAD+buFlB16FGLPYnnO5ctFBAwPaz5CK2Cuptz
	gm1Ce8A+z3JSnKaKTK32tJUuAzo4nr8n4E9NCk9dvMu9ALNSYJKXTGzN3iy8EWEc2qhoaJ1d9sy
	uKBIRXhHELTvlcQEwjwCuN2Nupt0fcHh795xc9gNsB7QcOy5PuS8Ayie1cQml5to62Kk0J/UQ5t
	x39+Kb2HQzDk7nwBp8eX5KP+93Gp+ZAtFJXaBgkFqsVobbvlYb9mhP39+Amz9Gn4ftOifcPL8eT
	H6XeRnf70HyJltvEgO7zlAFp6AAtOEHfKlOpCimsve9Hk9GWsqRdVE0clEKqY5Ro6NGt/BWWoKH
	bjvn2uZWrwcgEluURB1IpfZCWUcY2dYWrlINTwU2aaikbnvgSKFHOXLyF
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr213373171cf.16.1781533506513;
        Mon, 15 Jun 2026 07:25:06 -0700 (PDT)
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr213372311cf.16.1781533505971;
        Mon, 15 Jun 2026 07:25:05 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7dad16sm108693331cf.21.2026.06.15.07.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 07:25:05 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:24:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ajALNcLMlTThdilX@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Dmitry,

On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> > 
> > On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > > On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > > > Several qcom clk providers currently have a sync_state helper set to
> > > > icc_sync_state(). With an upcoming change to the clk framework, if
> > > > sync_state is not defined for the device, then the clk framework sets it
> > > > to clk_sync_state().
> > > > [..]
> > > > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > > >   }
> > > >   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > > > +void qcom_cc_sync_state(struct device *dev)
> > > > +{
> > > > +	icc_sync_state(dev);
> > > Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > > internals. You might need to set drvdata to desc.
> > 
> > Hmm…
> > 
> > Currently icc_sync_state does not seem to use the dev argument at all.
> > 
> > How would something get messed up, now or whenever icc_sync_state changes?
> > o.0
> 
> Yes :-(

Sorry about the delayed response since I was out of town all last week.
Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
existed prior to my change, and I should label it as such with a Fixes
tag when I post my next version?

Brian

