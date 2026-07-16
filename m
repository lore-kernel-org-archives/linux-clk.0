Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D58930C366
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 22:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784242239; cv=none; b=i7MitraFf+IK9ZwTPMX6pa9Z6v7yineXPbkfhrEVqclPRObyrPDEQRKdgm1Wupp67SIRHNkEnf2+93Dtrny9W/UEmekMfZmJD5TT7xjgWAnfEMM3bHmHHcS2VX2mFpRXha5F79DyrXkFHWOb003iMCEgiXC4X7xfAuqLP024T5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784242239; c=relaxed/simple;
	bh=G3M56D7Hw4JcKBHyy9MMshKRSmgzkT9M2iCh3vdgJp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ALGyNaTwx4euiUpoUKT3NSsuZxg7ciwxmMDSBOuQxqmRPltrz7cCOWSgZHPDIt10Tjy0hKHYJe1wMuQVqqosiix5754+BcY6L29us4DHNd9MHE3LuGYgJEMsa1XOq9IgryjIVEZNASHrUE8z2eWI1/sOVn/dpk7hIRmUTT5vT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EGfzaSnO; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=MoAkMrWW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EGfzaSnO";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="MoAkMrWW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784242237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
	b=EGfzaSnOF9hoIe4eB4swsz6hh8HC7XwB54J1uDeIkbdYSr1LUdl4StAWSOWpgthz9JWyE+
	bqyGHvBKZnNfWeOSGlGJLTf1Si1CjeIeuGrpyJ+yVP6vXqmR5EmtKsLYajVnFpzbXysvFc
	ocIMV9PmBE9cSUsu6p005VGmd1LNXk0=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-KACwttOtMvW0vXs_bXbYyA-1; Thu, 16 Jul 2026 18:50:35 -0400
X-MC-Unique: KACwttOtMvW0vXs_bXbYyA-1
X-Mimecast-MFC-AGG-ID: KACwttOtMvW0vXs_bXbYyA_1784242235
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-497e582f42fso5062006b6e.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784242234; x=1784847034; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
        b=MoAkMrWW/zrR7GEsNQsrhuw1AOQZH/xAvmEmhfJIVYg6NGHVqRe0GltzhX1fYohu4m
         ZydfJ6WklP394daSaVbx+8NbwIElvjeKtipY1Ph3GR8LUSzaaHQa1CrgOhFrN6SfPUIL
         0oquS1YO8BDEz+54JYednjljbXOqvhLYOy7Bs7TCFoTyq6JZwwYA18gSQvRaBwu29rnr
         Ezt1i65sQuAvupnzE9wVpt5y870rZxJ16GJ454FXoyhBor+z1Wd+T3koUY8XhG/bZe9y
         BeQuFv/WnlhXyvXPa/CgfIrm8Ip3wc5eoMvBVZ66RI4Zs1HnBKtGE+z55oWiK8+Mqasa
         E3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784242234; x=1784847034;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ObT2MLWggP0CPh3Zc10/u3DfAojIZjELn3oUv8rUGrk=;
        b=UDWSEbP7kEC0ALDty43iRTqBd17fBs+sftO19gODgDdkS5R41cnWpisFK7n3ArRCrL
         RjRxaZUY/VaAvouKNpsgOuuqIVgnw5UYYNfcdBHGnevy8jMVX+/VScaySZEtmPEhtWZ5
         jgl0p6mLt1kF0Com3DXlkam9eeQcCmosKtj+zhyDr53yDjP46MnWGWbBICwjhQtuWXql
         ag9hA9vdPf/Dh3DByrn3t8beN39NVfrdCIzfZMXqRcvRZ/8B1+7KWFIiqJAQ2QxFZLz9
         Xi1tMngKcEwO1ZRfPtxt11LjMCghBaHvZl8+ugrdtsKMgMoaVCTUQ+eSYg1WYTrsAAP2
         cT3A==
X-Forwarded-Encrypted: i=1; AHgh+RpJvqyves0dX5OjFH6no8Ocos2DvVRDzob75BiCfWeQe0m8W+W6ckQ/keVINJMFTFny4hlTpnCfuys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6D4mEIiRpRYWtmVAEjQOcA839OqOEt0TevY9oaC8dxBqoyCHD
	kkIigHtFKEmTAtQ7C9SXq5FTIVawhKvxyXSmeKZZZx2msO/diKIloOARWa9V+stq50ve2LeszJs
	qIZS/pi5hA95XqSq/5JiwKI4AT8YVzF38lr2pmnu+0DkRp08DCDWHVxF0NJ9JRzwCrYr+RQ==
X-Gm-Gg: AfdE7cnLfHGJKIbKqlkJmzO+xJMiAZ7jd+qQp9Dsn4EcjjD0H9AeDlsti0IPhiRDwgb
	7OVBMewQnvxJUaAJDZp5jS1pKdsPZOsxGtSRRO2Qv0ncAg3SCmfiYBF3xejfxlyBTohGWUVb1K2
	R98rlUOmuy8TbqUc/EmwBZVhrV0cTYrqZNQQ1pjlxPLuSLZ96PjyJWyrfZZP+0A0x9rIirpfif7
	E2+m5CozRRTbPl3b0afH+uKP+29kZ3aAJVR6+Q6M0IE/f7wrfOZ18XU4GwpPO4cf+Ggtg5bD3cp
	DfoPoaQNmFIE0ayXqmf9Jkw2+RdNmX3OSpZE/OY2j7T47CddD8Kvw+sOM4RbRaueXvZabxGJww=
	=
X-Received: by 2002:a05:6808:1241:b0:497:d87b:6dc5 with SMTP id 5614622812f47-4a4c8854f45mr1054393b6e.40.1784242234622;
        Thu, 16 Jul 2026 15:50:34 -0700 (PDT)
X-Received: by 2002:a05:6808:1241:b0:497:d87b:6dc5 with SMTP id 5614622812f47-4a4c8854f45mr1054368b6e.40.1784242234196;
        Thu, 16 Jul 2026 15:50:34 -0700 (PDT)
Received: from redhat.com ([2600:382:8501:9a15:b085:521d:bf27:780])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1b01eefbbsm18780053b6e.13.2026.07.16.15.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 15:50:32 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:50:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] clk: qcom: Drop inclusions of
 <linux/mod_devicetable.h>
Message-ID: <allgNY_1HwlRZPB9@redhat.com>
References: <7b6441aa3b0dba35112ea486bfea3b3171d8527b.1784225976.git.ukleinek@kernel.org>
 <alkt62x8pmKE2aKi@redhat.com>
 <alk1--PeUJ7pKbvA@monoceros>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alk1--PeUJ7pKbvA@monoceros>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 16, 2026 at 09:55:23PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> On Thu, Jul 16, 2026 at 03:15:55PM -0400, Brian Masney wrote:
> > On Thu, Jul 16, 2026 at 08:21:05PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> > > The only used symbol in these four drivers that is provided by
> > > <linux/mod_devicetable.h> is of_device_id and this is also provided by
> > > <linux/platform_device.h>.
> > 
> > I don't see it defined in platform_device, unless I am missing
> > something?
> > 
> > It looks like the reason this compiles is because of this chain of
> > includes:
> > 
> > linux/clk-provider.h -> linux/of.h -> linux/device-id/of.h
> 
> Well, the chain for <linux/platform_device.h> is:
> 
> 	   <linux/platform_device.h>
> 	-> <linux/device.h>
> 	-> <linux/device/driver.h>
> 	-> <linux/device-id/of.h>
> 
> but the more relevant thing is: <linux/platform_device.h> makes use of
> struct of_device_id and most consumer of that header (typically platform
> drivers) need struct of_device_id. So it's very sensible that
> <linux/platform_device.h> is enough to get that definition. The include
> chain is just an implementation detail.
>  
> > > So drop the unneeded include which brings us
> > > one step closer to removing <linux/mod_devicetable.h>.
> > > 
> > > Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> > 
> > With an updated commit message:
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> 
> Does this discussion convince you that the commit log is ok as is?

Yes, agreed. Thanks for the clarification.

Brian

