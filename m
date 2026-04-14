Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4922D1F64
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 20:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776197172; cv=none; b=s/ISBTyN/vqJ4Xj6HgqMZiejHoaXg9f3eIvM26ztfNcIeo2bhHuxjD2jMeAgV4ubhhFg66xCsZE+xpgv4GSuBQROw7/mBJYjKLABQatjdrvjVUYTht8aBCJ2unyOs/So+e7HIRPauQ1g+/vsC8JRE3SFhYxfcOXe3MuzbmVKSkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776197172; c=relaxed/simple;
	bh=Dp0+Ssh1K3boeKKgn5yK72BHQcL+OqEVaNq1MEz8SWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uL6RfoB0JYI1yQXoNOZJOWr+EKfEime6ZofFnkKxZj5ew9JOgzucW2YTWQzDy3BZd/WMb0Ebyjfc/ENeHQsQ+1+7PF3RCDgvRtnMReD0RczHoC7hyL++qqt2P/NsXBI5486Fjc7HsJuFD08YoppVsmkgSD0uWboxXVZVxMX1fAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ack8CKSh; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JwyiF/RQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ack8CKSh";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JwyiF/RQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776197169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEXRhk5IofRA90cdU2Hp7IbZZuVGkK6cyhq8G9bcFWk=;
	b=Ack8CKSh6FOBSBv8mYVRsGqJYr0tLsslhBssW7E+c+cs5CK/GYqvHzRdc8MiAbT9WGLh9t
	LfT1RDaWdVCKUUMINN6uA0Y4SMWFp4dvBWlLE1DaFfaoVVEx41NOurW2JBj0q1J8DflEXR
	aIPCv60K6nvagnCOx5ZRbmr7Bbh8CmE=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-Ehg1qu65PJef5cB_K8qKZw-1; Tue, 14 Apr 2026 16:06:08 -0400
X-MC-Unique: Ehg1qu65PJef5cB_K8qKZw-1
X-Mimecast-MFC-AGG-ID: Ehg1qu65PJef5cB_K8qKZw_1776197168
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso148233661cf.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 13:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776197168; x=1776801968; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEXRhk5IofRA90cdU2Hp7IbZZuVGkK6cyhq8G9bcFWk=;
        b=JwyiF/RQAkoJ2Xw9Pfcpm03a5bTOYXmTIhLGNZ3pCoDpd0El3Jh1OIp1GxbEtsbKT8
         1Fe6GkDEE4HrrYsWFL8n/t5IJe+ekb709W17s8rl8Rao2c+kV1e6WyMRDjOoF5IsPQcV
         HKFskQvueTb/JxblRKrKBHmxhCMB5xGSHSxmqs6BCBxt1oK20DDfiPIe6KMc54EPa5e4
         n2YiQbC7+yhKDFBuy9XZOGZlTF49qYgtP+fp6EwYa7rTHPNifUppNFaIfsaIQqWcgQsE
         P9f+yASndW4Z3VP9ydQgRNQL34X+1omnvVcZBw2SCcsdW+ZpjlH0SWYEmU+NAZvOqICy
         sS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776197168; x=1776801968;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AEXRhk5IofRA90cdU2Hp7IbZZuVGkK6cyhq8G9bcFWk=;
        b=r0nM5KZ2PCpSCi+6hlWutaTaPtcrUsA2J4p7PWEZLvxOAdqWUWy69VHVEEdEIQ9vaQ
         cq/IkfPMm6oQ9NvjzBodvnRHowsDs79ZbRnBiyWYfcuaTC+rUOdvL8H4qbbxokd5VMBM
         QkJqYuhBfj88tLrmnnNGvfksdBh/TXbkQmDxK14j5Fe+zEZcUaDwLiP2U64itHMwqg9D
         PiqQ/x+FPb3MYf/2uRoZq2bCpC0qub7xX0VjkwM7w/s19eZ/5+nzINHlnf07x36QsO44
         EsQe1xz0pI41dRNiP7Qo1Rr1v2EjdE3nD48K2Xs/vlQX7DpgXZXEBsuvExhwT1P4Ru4t
         6cDQ==
X-Forwarded-Encrypted: i=1; AFNElJ99qI4uvV5oKsmAcbFm+fvk1hNhoyEmylfrj8sCBp+n7iXH5ZYCNvRZLoRXOnCLR1ylRH2FgYer18Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx3Qs9plArxrxVKQW4GQ/TzLQqV6EzFC9q+fNEcUSQ1uqqxH3Y
	yKf39WlGecezVKFT+XpTUuF0IFtHcgpZxbXldYgIW6Z0aKpKwXofDLawBhQ8/6sfpU/FsnIc6Ff
	jx4zG2XmPWCxvMwer4GeujBuHp+3KTwT8LR29qWhccmXRivdPjbDwSMqjFDfENg==
X-Gm-Gg: AeBDievJR0dIVbh8WZ020FBExkrETJtjA8H1lRTugMi6xgvpMPzQnp5GHm6Eyhs89sp
	sewjQyD4ubzY3gIOdP4MvXwdF2mk+CFGoPx3BicEkLjAz5OzgVf48iTrB0MbQD+kUuDrcbPNtdf
	9+gT15/QYp7hVEcZvBlIS6td6wvtb3UaJBsPw44H6eW7ZkB+uWVdFQC1uJcvAcgQE/RudTSOKtX
	+KXbFcsX15VhNXFDi7YeSGECUgRmp+IN8nCkSs5DriQZvQvsdK1TvelLsFcOpAOgGvsT8dxI/VC
	C+zogj1ShjdIRdKruj48k22eNsPPhNr6EncQiivKO9KB72WvqTJLEjdp069d3SfzndLzvTP2Ebb
	uDHUS1qeMItLqdK1gECWl
X-Received: by 2002:a05:622a:513:b0:50d:6865:82c9 with SMTP id d75a77b69052e-50e135a3d50mr37242251cf.10.1776197167660;
        Tue, 14 Apr 2026 13:06:07 -0700 (PDT)
X-Received: by 2002:a05:622a:513:b0:50d:6865:82c9 with SMTP id d75a77b69052e-50e135a3d50mr37241511cf.10.1776197167167;
        Tue, 14 Apr 2026 13:06:07 -0700 (PDT)
Received: from redhat.com ([2600:382:8116:76c6:c5b1:9485:5da8:de42])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50df2f4fa51sm69907041cf.5.2026.04.14.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:06:06 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:06:03 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: eyeq: fix memory leak in eqc_auxdev_create()
 error path
Message-ID: <ad6eK7wQF8M6sRLG@redhat.com>
References: <20260412124247.2494971-1-lgs201920130244@gmail.com>
 <ad0c8y1u5zAhheJX@redhat.com>
 <CANUHTR-9HYnCuavM9O_wcVg3VuDyV4zQH4P9jYhViBj_PbYV9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR-9HYnCuavM9O_wcVg3VuDyV4zQH4P9jYhViBj_PbYV9A@mail.gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, Apr 14, 2026 at 07:49:31PM +0800, Guangshuo Li wrote:
> Hi Brian,
> 
> Thanks for reviewing.
> 
> On Tue, 14 Apr 2026 at 00:42, Brian Masney <bmasney@redhat.com> wrote:
> >
> > There is a leak in the error path here as well. I think this code
> > should be converted to devm_kzalloc().
> >
> > There is no devm_kzalloc_obj() yet, however according to [1] that should
> > be coming soon.
> >
> > [1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/
> >
> > Brian
> >
> 
> I may be missing something, but I think the auxiliary_device_add() error
> path is already handled here:
> 
> ret = auxiliary_device_add(adev);
> if (ret)
>         auxiliary_device_uninit(adev);
> 
> The auxiliary device also has:
> 
> adev->dev.release = eqc_auxdev_release;
> 
> with:
> 
> static void eqc_auxdev_release(struct device *dev)
> {
>         struct auxiliary_device *adev = to_auxiliary_dev(dev);
> 
>         kfree(adev);
> }
> 
> So my understanding was that after a successful auxiliary_device_init(),
> the auxiliary_device_add() failure path should be cleaned up through
> auxiliary_device_uninit(), which would eventually invoke the release
> callback and free adev.
> 
> The leak I was trying to fix is only the auxiliary_device_init() failure
> path, where the function returns directly before that cleanup path is
> available.
> 
> Please let me know if I overlooked something.

You are right. Sorry about that. My original suggestion still applies
though to move over to the devm variant since that'll allow you to
remove the release callback.

Brian

