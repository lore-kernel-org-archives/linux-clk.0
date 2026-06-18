Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609C3438A1
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 21:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781817171; cv=none; b=ZZITgRGUJymQmoDGSHwwuasyc1sxeKcmSiZOIsbNfz0XLB6m5SKfdIbGpsFlPTu1ILshcPcxQWwqg6H2jMVCxIQHM2R6tWH+QgpX3Uyrbq/m+Aq3Klh4jqWi4MoTLfFWF27/RpRpfg9yJSpZOl1P5eOVPS2q+WJV7zxY8VcqRWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781817171; c=relaxed/simple;
	bh=BPJXynNAo8Jcooz8/RyQzKJBfUECCST9+2kUSac33zg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvnZNpPhP0y6ppLbkUw+X8ht5Ng6FOk9KMgEU/vcAqiBWEQD/7PYOdC0vYShnI35sd7/HqAVlKCPON50USObqh1YfE5IAoEg9z4ALt2QCHEKuHyrxkqh+DpUDGnn9wudCvIqCvZNwe8mROg11IE0f0sKihxj9DLotsaJGe5r1QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XesuMcAB; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=s+Yzq9TF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XesuMcAB";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="s+Yzq9TF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781817167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
	b=XesuMcABWgf0CvQ+Xuvlcc2kOEa17wMj5slqp+Qn8OgH8phEJDx8PcMeXexSwPl6AIY+sl
	b5prZRYX3zvbVANF4GxZ5tw7ATaQ8rE27eDG37RfwKULcct2ucOMQ4cAGBPPbKi1NmOBTe
	BRASgZNJ5CCOAIaxNwg17dgSywuMZQk=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-vYi6Q6krN8KNGkCjt9VY6Q-1; Thu, 18 Jun 2026 17:12:45 -0400
X-MC-Unique: vYi6Q6krN8KNGkCjt9VY6Q-1
X-Mimecast-MFC-AGG-ID: vYi6Q6krN8KNGkCjt9VY6Q_1781817165
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9158f2c4b55so247865685a.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781817165; x=1782421965; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
        b=s+Yzq9TFSIuzKFBZ/vi1TPnuGPSqHAxQVN0gO2CN3DnYKWqY834dtOlCH7udxrhGf+
         zkCFlsZNtuFsKYeA60k9v8aXOfFVQHz0Fy5BK5hYFR3pbAANon8nvcPyhUNOSC9/Il60
         RfmcKAKQOz2+Zwu6gAP0poWpWLZsrcVyTZMCM482X9Iu3I8Ykzm3EhwPR0iWUr92eYyq
         CpexjaZHlemKdAB1Y6m6Hh/2QL11dhxuhj4Nu/U8usydkTjm4xNEipN6TeQvgycjmKA2
         6vrz6YyPv1SgHqpqvvKFrVUPZKsX433c63JklHhzX4J7JolTipw/Fh9G3qINuHDrmgwA
         4wIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781817165; x=1782421965;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avP9ibHNPh0uZocZWfTS/uf3Zirh7iSsxekjlin/Vn8=;
        b=EtcvVI0nSNyH34iYp/gVoBGVVFnjFf6XENf/v9k3Sil0PBA7ft1u/P38zqy11b1Erl
         st7bHZLPsR2lBpzolFhRSB2hmaxxlrfd83LhcO1Lb8arXdyWaxxgtScKnKxrHwJPR4EZ
         U7Zppp+HZxwnL3Ojk8RspaALag5Ns8C2PP5/sUI4N8bWstQLZtd2vCvraZcsZmCwlGV4
         86MiorMO+FAdkoZAxle38SzhKCccM0sHMDi23a5py8zDFw0RrSrj4yU5KkUNZgRtaQDz
         IIMUbnzcivETB3pZ5o5ml4fjDWBP0wjii71NeTp5Q/cJgWdNfpa3xAON2zdB6juVrXhD
         wYaw==
X-Forwarded-Encrypted: i=1; AFNElJ+fW1AB7pgsDX/zihOdLjhFg2gceaNmb/b0jsZ53ID4xGstj8vkNaWs1v1zGWcyj/NGXgCK71QPfeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxO/xvUq10iMt9OfZmSJmFmpGaFb2RM6/8DrM6/q3BPCvfUtsnV
	X/AHeuKBvndUmb8BMBNolbQLRXcrhy3skCUX+f7+jbPqXdV+GXqIKky45+SMPGdJEAymVmnpU8N
	Zmu8iOi0ObLtkHcVpKAk8PM1xWH5VJ8cyh4hHV9LOVY/U5VyZUlWxGUXnbx6U9Q==
X-Gm-Gg: AfdE7ckEmrIgv0SK+p4TD8z2FhzUNP1a3gFNK09X3a8fhHX0vLqjLxudo4EW5ujGQ4B
	EkfUKcLPNVDrPcJ1Uf7RrqvRWy1voCnvjRunvs1n7oC5cAhsiHboOz2aE9v9z3CG3YLfZP00K0T
	1VGUFY2lfLJ2QoN24YWdaof9XBRExSrWiAGRc0oZFJmZiH06iUBtPL+sRkr/Bn69RhNIOYBnzKw
	VcuI4VQFUN1Z/+gLfCozHiCTCECOUWfoY6ooc1cgR0pHF2wHluWrVKVusIUgCyrxjhfRxVFrkVf
	GasU/aci0LCrUoor24Ib/166hKsGJyKwxi+9hdpU3RDF7i+NTFDWX8Bzuv2J0XcWXloN9zhz3nt
	DKJxn0sXq5hwJNQ5PmstD3YxanZ/3grVS7c+YB2gTKy/wXA==
X-Received: by 2002:a05:620a:27d2:b0:915:9de3:226b with SMTP id af79cd13be357-9208f256e5cmr124278885a.18.1781817165241;
        Thu, 18 Jun 2026 14:12:45 -0700 (PDT)
X-Received: by 2002:a05:620a:27d2:b0:915:9de3:226b with SMTP id af79cd13be357-9208f256e5cmr124271785a.18.1781817164653;
        Thu, 18 Jun 2026 14:12:44 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-920a1819fa5sm28625685a.20.2026.06.18.14.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 14:12:43 -0700 (PDT)
Date: Thu, 18 Jun 2026 17:12:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Bjorn Andersson <andersson@kernel.org>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Subject: Re: [PATCH v2 5/5] clk: implement sync_state support
Message-ID: <ajRfSbkAYusH5H9H@redhat.com>
References: <20260616-clk-sync-state-v2-0-15f82c64d95c@redhat.com>
 <20260616-clk-sync-state-v2-5-15f82c64d95c@redhat.com>
 <CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com>
 <ajK29WcueJ1wLCLQ@redhat.com>
 <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPx+jO-tHYUa5oYEjuCdgF440viiR=Q6O-X6q=JNGwLgS_stsA@mail.gmail.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Ulf,

On Wed, Jun 17, 2026 at 05:29:51PM +0200, Ulf Hansson wrote:
> On Wed, Jun 17, 2026 at 5:02 PM Brian Masney <bmasney@redhat.com> wrote:
> > On Wed, Jun 17, 2026 at 04:24:05PM +0200, Ulf Hansson wrote:
> > > On Tue, Jun 16, 2026 at 11:09 PM Brian Masney <bmasney@redhat.com> wrote:
> > > > @@ -4345,8 +4382,17 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
> > > >         core->dev = dev;
> > > >         clk_pm_runtime_init(core);
> > > >         core->of_node = np;
> > > > -       if (dev && dev->driver)
> > > > +       if (dev && dev->driver) {
> > > >                 core->owner = dev->driver->owner;
> > > > +
> > > > +               /*
> > > > +                * If a clk provider sets their own sync_state, then it needs to
> > > > +                * also call clk_sync_state(). dev_set_drv_sync_state() won't
> > > > +                * overwrite the sync_state callback, and this call will fail
> > > > +                * with -EBUSY.
> > > > +                */
> > > > +               dev_set_drv_sync_state(dev, clk_sync_state);
> > >
> > > We have cases where a device node represents a provider for multiple
> > > types of resources, like clocks, power-domains (genpds), resets, etc,
> > > as in the qcom case, for example.
> > >
> > > For power-domain provider drivers (genpd) we also try to assign the
> > > ->sync_state() callback, see of_genpd_add_provider_simple() and
> > > of_genpd_add_provider_simple(). This means the above doesn't play well
> > > with how genpd behaves, so we need to figure out a way to manage these
> > > cases.
> > >
> > > In this regard, we also have of_genpd_sync_state(), which allows a
> > > genpd provider driver to explicitly call genpd's sync state function,
> > > if/when needed.
> > >
> > > Unfortunately I am not able to suggest a detailed solution for how to
> > > move this forward at this point, as it requires some more thinking and
> > > I am heading for some vacation very soon.
> >
> > One approach I initially considered was to make it so that we can have a
> > list of sync_state callbacks that can be added to. I already did some
> > work on this, but I didn't think it was worth it for just the QC clk
> > drivers in isolation, but it would address the concern here.
> 
> Right, maybe that would work.
> 
> One more thing to somewhat consider, is the problem I have been trying
> to address for power-domains providers [1]. At least for genpd
> providers, we need a more fine grained sync state solution, which also
> must be able to co-exists with other subsystems sync state support. I
> am not sure if something like this is needed for clocks too?
> 
> [1]
> https://lore.kernel.org/all/20260508123910.114273-1-ulf.hansson@linaro.org/

I am not aware of any clks setup that way but that's not to say they don't
exist. Stephen, and/or some of the folks from QC would know better.

Brian

