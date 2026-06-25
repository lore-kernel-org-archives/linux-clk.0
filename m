Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4103D7D78
	for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 11:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782387532; cv=none; b=LHXyJQbaB1fV5l4SqKon7xG4s8DyXBocQkj5OQ5DjehhlLoaFjsGAUbE95Lq3FooqCeOMfhY1Hmotee61ChmvfMoOT0yO4nCgtQvDSxFU710j7jJFlUi63L9TquSUJ8DogBQYRXyJuRLsfQ5Hp1eUJZzQqKGk5AMuVLd0Ja2lXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782387532; c=relaxed/simple;
	bh=dNJMKE8Fb6m6nRBSQf7lQCMZOJCugTd17FFgofP/eds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CmIEvn9TqBWdAFDVVmGWu6hJA5CgwDhZ03j/FkXTq95uOZvDU1braVqiw+0VseI5M1S5PuG0SEFpU4ij2HRiyM1EJ7Svz5LFKDrvfY4LO5annVfsL8RciD7Hvn2jMnH3JoWAzD7JQ2Rz/QXr1/mMeqpj3cHcz6znvkBJM4EKOlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BgOquWFg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lAMpmWeQ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BgOquWFg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lAMpmWeQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782387530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
	b=BgOquWFgpmLu0WIHQLRThNo2RugC2JpjsSzJubAdW5MJJf9SGv1tQHjshlR+iXkoiK2CLD
	GBk8WE5PC9jUWQf9fg7wxSbzvTj0/8LBY/Btj4q/3A5usDwD4KeEg05qSs7BQNU54xgbY4
	+7PJZX9Ap7H5VILgau7sCdGt9symxJM=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-qu1FcarXN8y7GSM3J-4Lgg-1; Thu, 25 Jun 2026 07:38:47 -0400
X-MC-Unique: qu1FcarXN8y7GSM3J-4Lgg-1
X-Mimecast-MFC-AGG-ID: qu1FcarXN8y7GSM3J-4Lgg_1782387527
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-519899aa6bfso32652551cf.1
        for <linux-clk@vger.kernel.org>; Thu, 25 Jun 2026 04:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782387527; x=1782992327; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
        b=lAMpmWeQZ6Olu6/1NZoydzaFcTQFKWh7PoUSZcH4erPrnRWhCnzTrUb4abYuFrOVaK
         t3+q7mZnxcl4FSzaHmrhgE+FQ4jZ0KyvqVfNFFLhRfdJ1P8YhlJ4fh/I+nA9UuH+Zf2Z
         N6T4K2369UXgUc2DwfiYg84GBVNgtFdIS25JRzbx7bvP20w12mGOOaX2TcVrSFWKlRar
         p53clSWiTM/T2fO3hfYtmGCdZ2QA16dfoPQHylMdSDqgchXpPbAyfFokwjej/EW4Al+9
         TjDEnEu4GeWvsAR2TmqL7GmbjK+OsqtkmjyFLfQOwjPo65Zp6yN2WBZMEwYnknqKbDnI
         FQMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782387527; x=1782992327;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Eb+j6jBjdeQpLj6vYhJ/GQkkOLBPXDRRMzcQgZKL2uc=;
        b=nBpTRZywbAzqZlzh7KIMfQbE3nbJvv54KT0FVcNKeIPb5MFCjdt865LnTSUiXB7mq0
         XfUYzambz/gMfMUIwkiX+38MLvkfwiOJFl4EYdB091nWDBzvwny8V8nLdjuiapkxEbBC
         jUwv15SavKiDRPkLhTlixzfbYzgp9kAlyNlTF7GjxaHUizeD6cLMfo3lsFE4ASsYT+PD
         0s6JB0oidPiGnDSgpeWicRjsyJZLwG3+iwlYKOAvoWTbqzsXk0pqTcclUWpr8mdKeBSj
         vZ7X3/0SxT6E/jfu5eTtvl5mXqWVdZDiq3dwiFwX/C/UK3kIfolkJdZvXOYjdBdTekDQ
         5xBQ==
X-Forwarded-Encrypted: i=1; AFNElJ8dA3Aqg9yK+P8rrAL3f7SHEs265UDHXxe4SBiT1O+srLw3eyY4r0xKkt0HbWaiUy2scTa6bTKQchA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbNg38DWrabD5fASYS29HXrvPQwM9bfa1djqQyg5BIOoHQYdRu
	NB9I8qkbGkRcnVUF3Pn5MM3Ck+RkCQw6KyIyskJPbGvTqMCbDogjPSLtDNIdJnyKibgt2In/wlU
	Srxu9Bis2mBG2ZqOcW6tUENzNsrGFkl60NuRKvN0lkKYd+rjj/WWsYp+ibYsryw==
X-Gm-Gg: AfdE7cn9OyBHyQI6kis7f0W6x4akqv04AXawyYDpAdn8HNw1y8QEb5QqfX0GlYR4jCH
	1qe3WPfBjV8xbep9gZ75v9JUHO92FEwVYmpJLIkKwIbMDpnsNpLr6CMixDQzjCGB0wvX+abj3yo
	/ZEVgj+bppuFdpvgVpvhPSJ8z0bIFb5Gs2gVxX7e4+6/MI3arCRv5tzINH/Fss6VM27FcMrC43v
	7kYitDoKGllTxALo4WasTnzIPcrNi6qfgXieqGCCIlAmN9bg1cyiVEzScIRlocD9NQLrTf6HVdt
	MrJsHJZDePTm+c5zFCLlO6QGp0qiXyf8oLujwGBeV3dJ8o13kbcNdk5f7AiblKbUKeh5Oa5iRfB
	Y7R9aJF+apdC3p73L8KQ4p8BSDRAe8wNuor9cZkJOAnEJOw==
X-Received: by 2002:ac8:7dcd:0:b0:51a:1128:4b3e with SMTP id d75a77b69052e-51a7283a782mr28783501cf.29.1782387526705;
        Thu, 25 Jun 2026 04:38:46 -0700 (PDT)
X-Received: by 2002:ac8:7dcd:0:b0:51a:1128:4b3e with SMTP id d75a77b69052e-51a7283a782mr28783101cf.29.1782387526090;
        Thu, 25 Jun 2026 04:38:46 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51a9bca9sm69288951cf.19.2026.06.25.04.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 04:38:44 -0700 (PDT)
Date: Thu, 25 Jun 2026 07:38:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 2/5] clk: qcom: common: introduce qcom_cc_sync_state()
Message-ID: <aj0TQuaPWmSlLwIw@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-2-15f82c64d95c@redhat.com>
 <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <21bbffb7-ce99-4c38-a5cc-6a3f3c7f48eb@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Konrad,

On Thu, Jun 25, 2026 at 11:44:12AM +0200, Konrad Dybcio wrote:
> On 6/16/26 11:09 PM, Brian Masney wrote:
> > Several qcom clk providers currently have a sync_state helper set to
> > icc_sync_state(). With an upcoming change to the clk framework, if
> > sync_state is not defined for the device, then the clk framework sets it
> > to clk_sync_state().
> > 
> > Clk providers that require their own sync_state will need to call the
> > framework level clk_sync_state(). Let's introduce a new common helper
> > qcom_cc_sync_state() that calls icc_sync_state() and clk_sync_state().
> > 
> > Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > ---
> >  drivers/clk/qcom/common.c | 9 +++++++++
> >  drivers/clk/qcom/common.h | 1 +
> >  2 files changed, 10 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> > index eec369d2173b..31382c49c948 100644
> > --- a/drivers/clk/qcom/common.c
> > +++ b/drivers/clk/qcom/common.c
> > @@ -3,12 +3,14 @@
> >   * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
> >   */
> >  
> > +#include <linux/clk.h>
> >  #include <linux/export.h>
> >  #include <linux/module.h>
> >  #include <linux/regmap.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/clk-provider.h>
> >  #include <linux/interconnect-clk.h>
> > +#include <linux/interconnect-provider.h>
> >  #include <linux/pm_runtime.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/of.h>
> > @@ -464,5 +466,12 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
> >  }
> >  EXPORT_SYMBOL_GPL(qcom_cc_probe_by_index);
> >  
> > +void qcom_cc_sync_state(struct device *dev)
> > +{
> > +	icc_sync_state(dev);
> 
> As mentioned before, we really need to test for (qcom_cc_desc)->icc_hws
> here
> 
> If icc_sync_state() is called without an interconnect provider
> being registered, the framework state gets messed up:
> 
> --- drivers/interconnect/core.c
> void icc_sync_state(struct device *dev)
> {
> 	struct icc_provider *p;
> 	struct icc_node *n;
> 	static int count; // function-static variable
> 
> 	count++; // called for every clock controller in this revision
> 
> 	if (count < providers_count) // kaboom
> 		return;
> 
> 	// actual sync_state never happens anymore
> 
> Presumably one would pass this through drvdata, but be careful as
> some drivers use it for other purposes today

My next version of this series that I haven't posted yet allows chaining
the sync_state callbacks at the driver core level. It doesn't require
any of the QC clk driver changes, and will allow us to play nicely with
the pmdomain subsystem, and any others the move to sync_state in the
future.

I think I see the confusion between us the last few rounds of review. In
this series, I added qcom_cc_sync_state() and converted 6 drivers over to
use it. (I excluded clk-cbf-8996.c since it is separate.) Only the 6
drivers today that called icc_sync_state() now call qcom_cc_sync_state() ->
icc_sync_state(). So from my vantage point it is the same overall
functionality.

I didn't look at this from the perspective of qcom_cc_sync_state() would
be common infrastructure, and a newly added driver in the future that may
not interact with the ICC framework may use this. Is this correct?

I asked earlier if this was an existing bug, and the response was no.

Once I fix my x13s today, and able to verify my v3 sync_state still
works as expected, I'll post the new version.

Brian

