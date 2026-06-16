Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77213A9DBA
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 21:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781644507; cv=none; b=NQTP6lpAVEXoJLjJlnEIuIW1HJJIFxqzXHFPeSmGzlbzaTFoymmkmDZhdNBVkLSd1qcudihgA848gjduvDtzUvI7sgmlwjUY/NYTx4/Mw1dYpa+FjkhWTcVjr/IoSnY1VEvZ4897364cqa78K4SNSFJYQQaSwpU2D++In0kOX1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781644507; c=relaxed/simple;
	bh=mMvV2jT3Lx56AHuQ6UWzQ3fhVExrQHe/Na75v2tYy9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnsrHkPxaAXOd9/aF/R/C4qw4FMDdk+XtPBmhPUFty1j6aRJViC2QHRz9Q4N+xJrR+dApOJDvNpB4hIxC7YrcmWH55w3L8qkL+2IuIXN8CpCTvHGOr3JQ4s/l2dPXWDXXrxSH5B1sRNjx/A3XoiKfdD8bHetBR5Vjv1DYdu5G38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Kccf9lDR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gV7/Jy4X; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Kccf9lDR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gV7/Jy4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781644504;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
	b=Kccf9lDRKdMx8kobRuvkQo44VdeU2k4Ws6qjYYiO0urq03so9DjTiDnUsJ/PtDeN28eo3Q
	boHmYppDg74mrD68BgSGMggyALrGKAXc2qwjvOU3nXO8ewWLKGnsTo2x2BWoF0OuQhY6jx
	Uaptjh9Cvtc3zpOjmyBNSzNgCDIUvJc=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-468-Rth40yzsMMSwN95gNhItPg-1; Tue, 16 Jun 2026 17:15:03 -0400
X-MC-Unique: Rth40yzsMMSwN95gNhItPg-1
X-Mimecast-MFC-AGG-ID: Rth40yzsMMSwN95gNhItPg_1781644503
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915f7bd027eso1307525285a.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 14:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781644503; x=1782249303; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
        b=gV7/Jy4XgVx+h6NaMUT6a4XHEMeYaxH2n20trsYFLSNNUR9l6vw8JicNxhCOkk82n/
         Yb/86w14GTYGdC55ASlNVB1CXalBLPQKtlDuwEDGjFm1PNe6i/XtNgnaj6jUcHYjpU0D
         2uJByd3hKwjhjN6kuGiTH0KX2OOu3NIcL6KQip5pJcA2DFpfG4ggk8tgMm0nGzZy3RkI
         GC5UKiVuK4X8SengTTE7PEnH9/dE0rksN0kHyzGtCN2O/GSck6X3ck5bDPbH4DjXAuO/
         f+Oe8T89t5vpBf0LbqdbtWn46wZ12abHo3gtq2KnCCptLRMse8xceQPfVqMxeqBEuFTq
         zFtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781644503; x=1782249303;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wbSNizx+3t0ia73sVy4IXbnSv0+hbHzhdRigrmncOuc=;
        b=pb9qCVD5hyp30spaVjW2bRtfN2bHas1EKLBQA31BfBvd52wQD8PddZQFK11MO1iIix
         1R3oXCU/032Vf+v5EW6qv66PNmS9Ah9Q540ePBzprw4SAJqVLd6dy/e/cqnb7eXW/+Oi
         bAZuLcP6nfd9pOGthjwYchl7ygKHJZqUEd0vHRCzzRNPGJqxqiKa796ftqITjOmAMELP
         DCWPGDzbZceTXDXUzde15lVgR4oimyyvNkAvsAhLjsn4Samt4SCdo6OYBQBrArYPoM/2
         MAuhmSbpS+dLPbVIc61kYseZBZ3/fzO58ztZrd4mM9wzGQLS88DeV/3fZntLX7HOiCC3
         fl2w==
X-Forwarded-Encrypted: i=1; AFNElJ98B11h43gh9qKRY8765egdNAWXLZvzv0glsvajtJT40OLHujJurqb7fhCbtdvSD16GyzdzmXKk710=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCIchxGQulLK0EHaBl/CfKUnykUPll2IlVQ6DeVaScaD+z93W3
	H51vDQFrSIqX4edYr46XgY1m1qJ0U4kBUmiTxiEtn3CmCJIkOJrztI9QE7KOvK2BWS+gxrmzZAS
	anX0M4zxXv4i1PdTEi6FJKgylYJK9Z6U2SHhW6L9xX+HcpRJztnJbrS/UlrGt9/vU0ObCNA==
X-Gm-Gg: Acq92OFpy42cUmzASqIVaogU8HyOe7+NMIPmU7KAOOgWRAtiYKMO0ei61G6Ner1x67e
	1lN1m868XzSHqU/9IxFTaQRpxcT033bNNENneTkmKxBoUw0IysokvAogvqUM8fm9O8AT5GPCoTf
	qdnNtA4aRYQcrE7O4o1gZjoICMLKGhiKzt0pTMV8HiZRhwlLXAx6QaxWDJoH3KADq3RMAzPIkRf
	EgcvD5O3sOePN0Ap4n1LDu/cKxNPAkpOvdF6SYVyHT1oY4oXBTgFAfMRLRx9yvUk3qH60ycJQmt
	pZsu0PTnJrPRG4ZhjMF6IAkqe1PMwCFg2w+oKKgazumy032rfG45rmSVTF/irsHjSpoqDzXQoLQ
	D//v6mO9u+jDyaKWNvv9+KZugPxpBpZVtt+XY8FBrUbrVHJV7H1Zw2oep
X-Received: by 2002:a05:620a:444f:b0:90f:9cde:977e with SMTP id af79cd13be357-91d8553a7e1mr279648285a.0.1781644502863;
        Tue, 16 Jun 2026 14:15:02 -0700 (PDT)
X-Received: by 2002:a05:620a:444f:b0:90f:9cde:977e with SMTP id af79cd13be357-91d8553a7e1mr279640985a.0.1781644502270;
        Tue, 16 Jun 2026 14:15:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9161a0080a7sm1591984085a.26.2026.06.16.14.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 14:15:00 -0700 (PDT)
Date: Tue, 16 Jun 2026 17:14:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Val Packett <val@packett.cool>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <ajG80xpQ32TsgrAC@redhat.com>
References: <20260603-clk-sync-state-v1-0-457120eed200@redhat.com>
 <20260603-clk-sync-state-v1-2-457120eed200@redhat.com>
 <xtrvgetj3ybwuceez6mymxw4cwa6sqeycoz2hs2zztozeb4oyb@uuhtzbludmzv>
 <2f6dbc37-7ee5-4cef-b39e-455494fb31fd@packett.cool>
 <ncgma77ckduno5645xf2hcmakmbpwub5d54p4zcrhz5pbq3pij@o257r3t6p5aa>
 <ajALNcLMlTThdilX@redhat.com>
 <68a86037-bba0-4cab-8a1f-b0be78f259db@oss.qualcomm.com>
 <ajAQqVB_knGO-bqL@redhat.com>
 <fef227d8-4ad0-4884-98ae-fc48056c3856@oss.qualcomm.com>
 <ajAUkTW4uxf7SyPn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ajAUkTW4uxf7SyPn@redhat.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Konrad / Dmitry,

On Mon, Jun 15, 2026 at 11:04:49AM -0400, Brian Masney wrote:
> On Mon, Jun 15, 2026 at 04:51:35PM +0200, Konrad Dybcio wrote:
> > On 6/15/26 4:48 PM, Brian Masney wrote:
> > > On Mon, Jun 15, 2026 at 04:33:17PM +0200, Konrad Dybcio wrote:
> > >> On 6/15/26 4:24 PM, Brian Masney wrote:
> > >>> On Sun, Jun 07, 2026 at 01:30:03PM +0300, Dmitry Baryshkov wrote:
> > >>>> On Sun, Jun 07, 2026 at 01:43:06AM -0300, Val Packett wrote:
> > >>>>>
> > >>>>> On 6/6/26 8:15 AM, Dmitry Baryshkov wrote:
> > >>>>>> On Wed, Jun 03, 2026 at 10:21:47AM -0400, Brian Masney wrote:
> > >>>>>>> Several qcom clk providers currently have a sync_state helper set to
> > >>>>>>> icc_sync_state(). With an upcoming change to the clk framework, if
> > >>>>>>> sync_state is not defined for the device, then the clk framework sets it
> > >>>>>>> to clk_sync_state().
> > >>>>>>> [..]
> > >>>>>>> @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> > >>>>>>>   }
> > >>>>>>>   EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> > >>>>>>> +void qcom_cc_sync_state(struct device *dev)
> > >>>>>>> +{
> > >>>>>>> +	icc_sync_state(dev);
> > >>>>>> Only if desc->icc_hws != 0, otherwise it will mess the interconnect
> > >>>>>> internals. You might need to set drvdata to desc.
> > >>>>>
> > >>>>> Hmm…
> > >>>>>
> > >>>>> Currently icc_sync_state does not seem to use the dev argument at all.
> > >>>>>
> > >>>>> How would something get messed up, now or whenever icc_sync_state changes?
> > >>>>> o.0
> > >>>>
> > >>>> Yes :-(
> > >>>
> > >>> Sorry about the delayed response since I was out of town all last week.
> > >>> Just to be clear, the missing check for 'desc->icc_hws != 0' is a bug that
> > >>> existed prior to my change, and I should label it as such with a Fixes
> > >>> tag when I post my next version?
> > >>
> > >> Up until this change, having icc_hws > 0 but lacking icc_sync_state
> > >> (or the reverse) would be be considered programmer error
> > > 
> > > icc_hws > 0 but lacking icc_sync_state (or the reverse) makes sense as a
> > > programmer error. However...
> > > 
> > >> Starting with patch 4, this gets assigned unconditionally, so there's
> > >> no prior bug to be fixed
> > > 
> > > I don't see where that situation happens here. All of the places where
> > > icc_sync_state() was previously called, the new code now calls
> > > qcom_cc_sync_state() -> icc_sync_state(). (There is
> > > qcom_msm8996_cbf_icc_sync_state() that needs to be modified.)
> > > 
> > > In patch 4 of this series, it sets up a framework level sync_state()
> > > callback with dev_set_drv_sync_state(). If a sync_state already exists,
> > > then that call will fail with -EBUSY, and it will leave the existing
> > > sync_state() intact. So it's not calling sync_state twice. I will
> > > clarify that on the comment.
> > 
> > Dmitry and I are referring to the situation where the clock driver isn't
> > an interconnect provider but icc_sync_state() still executes. That could
> > not have been the case before, since most clock drivers didn't come with
> > any sort of .sync_state()
> 
> I'm sorry if I am being really dense here.
> 
> Let's ignore clk-cbf-8996.c since that has a separate issue. The other 6
> drivers in this patch today all have this pattern:
> 
> static struct platform_driver foo_driver = {
> 	...
>         .driver = {
> 		...
>                 .sync_state = icc_sync_state,
>         },
> };
> 
> I'm changing it to call qcom_cc_sync_state(), which will call
> icc_sync_state(). So everywhere where icc_sync_state() is called today
> it will still be called after the series is applied.
> 
> All of the other clk drivers will just call clk_sync_state() directly
> that's set at the framework level.

I posted a new version with the clk-cbf-8996.c fix, plus clarified a
comment on clk.c.

https://lore.kernel.org/linux-clk/20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com/T/#m23a1b61017d35020a311a83454331f758c386c8a

I'm not trying to ignore your feedback, but I'm not sure what's being
asked of me here since I believe what I have is correct. Anyways, let's
move this discussion to the v2. Thanks for your patience if I am being
overly dense here.

Brian

