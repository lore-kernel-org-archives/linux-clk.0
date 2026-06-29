Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C595426D20
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782747084; cv=none; b=PPV1VoTY2dAroXngzM1NL9pETG2sAsPyNNUa/hHCqvCSZD6XYJpO+wJVeX2J6mEaxq/N5SQj3C0Rl2F57Zp8GbyldwtKUOtmf9i6Po6c8PTfUG+bMhDqtJReEgWjJSySFNbaFYt9O1xPPoETLC1NR/wW7urmnCaoQIogOkWN+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782747084; c=relaxed/simple;
	bh=TelLuQFVj84dg15intj6l6XA0Pbbdt2xzy2TuA9iVP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBW8WCY/jLPlDNiVTn/dd5WsQMGI770gdS/HUMIJ2mINBC8vJLUuF2oEX4wqyqwpOLyHU4dazjKqW9hifxYETrec7oQzPhqQo7Grr9AAsfSXR6P2vPFLpJixynctKMe1xdEFUc+62tCYyp60V2fKhQZqPH4ugfQHnBlIFKL+qHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3netzwA; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SdenFFPp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3netzwA";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SdenFFPp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782747082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
	b=V3netzwA3SdPPbB2RMVqpU1NKq4vyOFMd2XUJE2ZolbnJLnQ2YSVmbVVbUGzk6ILjVFEjI
	RaKGFgiC7tCn39Nv/J7p1Ed1okspsBUJ7cZiykfg0CBEoj1RfUFULWvYuzmIJYZB87uVWM
	und2a+o71Y9Mjw4tMwxVyVTc9YJU0B8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-rC3SPmTFMaKsHsnFAsQG5g-1; Mon, 29 Jun 2026 11:31:17 -0400
X-MC-Unique: rC3SPmTFMaKsHsnFAsQG5g-1
X-Mimecast-MFC-AGG-ID: rC3SPmTFMaKsHsnFAsQG5g_1782747077
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so24915301cf.2
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782747077; x=1783351877; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
        b=SdenFFPp+cQRnEp88s1emS9I3yjI6QV01f6URp6idw70huaWHF+au8ZcdU3NS6JGGa
         TEHqaJ7y4ry9YdRKFBixS59xX2r8EVQPsYIP6+cmxhehxlD8fa/0PjPH89BFKyO+iLNX
         i58taShtozF95CGTzwvMQ6JgjAwCVrKPLG0/RB51JkSFysuGvWvo6Po0hD0xJL0U6/P5
         j74UA0aWu0lvfzplZjO/44kfvuW9hEHpUH6TPIAH9iFYlVvGYe2w7dX08cOfDnmzOvqN
         R8Jt0XmL4sFk45mW1gKHiyO5faDKc2xYecaA7ynfIQr3QoyO7mI6IFqiaZG3Pee7FzNm
         daqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782747077; x=1783351877;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DOCP00x0YVfBobkqwjRQEWaP9evLVGD2m07PpA2VUgw=;
        b=JHA9UL5H9jZGNRViXKBqgGAmPixwbWIVGqKL3qFuXbkvvQ5VP+6BAljMo/oNMPMsJK
         LRq1SWwext+I9rtCrb8Wnj76jrRdEGw5WyGxvFFA1YT95nUEn+F0PBQHs3PVd4C7EDKV
         GVH3XMyouU1rRO5wPElRfvnaiyNFRmlePpb5e+pXKOojFztLLiKNlG7uVIUF4I6XncVX
         czN8jZlSLBROVpUpx2FR0awT0ysnl0o9MWiLEvHVI9FvlQi8GmoxyfftdSiY/aAK3ujC
         dwaoF+c2mA2vOVd9zvyj5bCTtRu4wJ11bhosxZPQi9mnrA8O6yTD4HKeK8gtqrQ5vpDL
         j0CA==
X-Forwarded-Encrypted: i=1; AFNElJ+FnV7VqYR/8WNxaeVRDFhOjfj+StmCZEhq7wD2WvjhldBPnOulBdkUbzPIAwWpOsiuXRUHVGfEhEI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjYP6clJssxCLQ1tBkKqfsJwQmO8EU/QXkfC25w8vU4QyrjCYX
	Lk8YeasSsAbuWKELN0pbb1jlPQmmFcwaPoxTLDwJ1HC748EjOPxYXqNKwOMkhXMP1E3FLwBRWWM
	Koxcj0da5r3OM+icVGGXrLQWw5q2Q3ohCnkom57o83DFZbjLxu7Dn4S28MA6uRw==
X-Gm-Gg: AfdE7clmn8vSWkswvYXvlBHspBpX5Hk/SP9clUsro05wACtExVXPcboNQLRBafQehjK
	O4rAt5fntHAPHoKRWC8ds5zWEBqZqY5kSyujyk197Wnpg4JqLFogERC2nkgbFZv0MBuNkdQXd17
	mQ0525+qYMvlNcjaVBIxYHJkiqkJqyMgLdwyNDWRz+7sXAyhTQ8byxyvuD1cvKDQqCoKKFbDKp4
	aqocHemrduEHpDX4EG54d5KLeQOmhkUUYSytKdV2cV7wTss0JFh1NOeYlnkXVMasVSz/niBBPxo
	RPGlqjwVCtjkVbiXzqDHcK+M5juVa3yNAd6McOF3AhmcZLvdTkOQ7onmbrtt8umyZcT0eOBMFg+
	Qvmn7iQqIFcqNm1DsVQvFfLNu0H+VyV0+AeoWgRXhvFQcFg==
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940921cf.35.1782747077219;
        Mon, 29 Jun 2026 08:31:17 -0700 (PDT)
X-Received: by 2002:a05:622a:8d05:b0:51b:f635:9aa9 with SMTP id d75a77b69052e-51bf6359ebamr61940241cf.35.1782747076630;
        Mon, 29 Jun 2026 08:31:16 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51bf0697775sm45079741cf.26.2026.06.29.08.31.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:31:15 -0700 (PDT)
Date: Mon, 29 Jun 2026 11:31:14 -0400
From: Brian Masney <bmasney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xuyang Dong <dongxuyang@eswincomputing.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Hans de Goede <johannes.goede@oss.qualcomm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: introduce dev_add_sync_state()
Message-ID: <akKPwt8PN_UtawAg@redhat.com>
References: <20260626-clk-sync-state-v1-0-4156d8196dc8@redhat.com>
 <20260626-clk-sync-state-v1-1-4156d8196dc8@redhat.com>
 <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fea9665f-d134-4b11-a936-e1f265858ce1@oss.qualcomm.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

On Mon, Jun 29, 2026 at 12:11:18PM +0200, Konrad Dybcio wrote:
> On 6/26/26 6:32 PM, Brian Masney wrote:
> > We have cases where a device node represents a provider for multiple
> > types of resources, like clocks, power-domains, resets, etc. We
> > currently have dev_set_drv_sync_state() where a framework or driver
> > can set the sync_state callback for a device node, however it currently
> > only supports a single sync_state callback.
> > 
> > The pmdomain subsystem currently sets up a sync_state callback in the
> > core framework, and the clk subsystem will setup it's own separate
> > sync_state callback in the core framework. These can collide with each
> > other on some types of devices that have multiple types of resources.
> > Additionally, some clk drivers already have their own separate
> > sync_state callback already defined.
> > 
> > Let's introduce support for allowing drivers and frameworks to add their
> > own sync_state callback via a new function dev_add_sync_state() so that
> > multiple sync_state callbacks can coexist.
> > 
> > Link: https://lore.kernel.org/linux-clk/CAPx+jO9JiV16ePLk59hTQzEMnA96Va6Ns4jqJbwyZ6oTT0AjXA@mail.gmail.com/
> > Signed-off-by: Brian Masney <bmasney@redhat.com>
> > Assisted-by: Claude:claude-opus-4-6
> > ---
> 
> [...]
> 
> > +int dev_add_sync_state(struct device *dev,
> > +			   void (*fn)(struct device *dev))
> > +{
> > +	struct sync_state_entry *entry;
> > +
> > +	if (!dev || !dev->driver)
> > +		return 0;
> > +
> > +	list_for_each_entry(entry, &dev->sync_state_list, node)
> > +		if (entry->fn == fn)
> > +			return 0;
> 
> Do we expect this to be a valid call, i.e. should we WARN_ON here?

That's a good point about adding a WARN_ON() here. I kept this logic
from when I converted from dev_set_drv_sync_state().

Brian

