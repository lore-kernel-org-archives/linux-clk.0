Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117F642A179
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300641; cv=none; b=Ffuux+CMeOprKRphXww+9oxjOV4To318XdUoUzPnExhkJKshCTBp36J9DH0uFr5qdwhNBj4y8gH7bn35qmtHH1ulJPNHLeN9GvKPQ3NhEpg7j7fM/xZ3Zhx/kEITmj/hqrab8lN8oHYR3Sc227cB4NQM3T+Qyo0XOqzPGUwP74U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300641; c=relaxed/simple;
	bh=HMKzyB3kY7vSGa2MtwXZrebgd/L17pqz6i8Yr6ejTMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qCACeljdUp0iFUc5KHATnCc5hhCEZBDNujLA899Kn0p8dVPyd50Od/UzaIHqk++19PT0QSbKp+KddPLJEDNA37rXczC1LGtNGqwRwSeoxs0jm4jXXavAcIZi4V7Tv7/own3pRDzvEnE5nU1Acr9MMUWDpXS/EomKitEuOJL42D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jHnK/ozD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQOH4buW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jHnK/ozD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQOH4buW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784300637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AEJiCCEn4MHMKuztaU1T70dBQPi5arDzSxrvWKF7Hnk=;
	b=jHnK/ozD44v56kWeLOY0gVgPzR4YPEDSSZO4AKVcuj2LqH1T9eAMkAhSjMgzOiwBeKplPY
	jG/ky5yopYW/ythPqZ/Y8dxg+0FpIsGliIVct+qvj2us8yGc36SIyUNiuTj20LaAIhzKhV
	zDkRUlIcVHJ7n/cjeZ2rrNJ3carlldg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-VgN2IIxJPMSxv8lmKGrgQQ-1; Fri, 17 Jul 2026 11:03:56 -0400
X-MC-Unique: VgN2IIxJPMSxv8lmKGrgQQ-1
X-Mimecast-MFC-AGG-ID: VgN2IIxJPMSxv8lmKGrgQQ_1784300635
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e9b9f30d65so115813656d6.0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 08:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784300635; x=1784905435; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AEJiCCEn4MHMKuztaU1T70dBQPi5arDzSxrvWKF7Hnk=;
        b=KQOH4buWVPGUrme6uCUVahSVNwkCEJsOv/k60KdD525f/QBmZN2knFikmakA0/XsYZ
         mbEkdeBWMJEHkuzafCnCa8XFIiPbtAbA9wTwTK4AQiefjHKnNICTjvLWAXBIMXIXWMMn
         BTEjbEoA0K0IwPXLK6OSi6hl6w5BRn0s8p7yJEODkOlSwZSQRu8T/NnYneN2txkSNnwZ
         rV6aJM1oVT3sziZ2vqj5Wq/pMQDHjybWEqoqCf9U9aqLppgQS0rTtHEAl3qMHWTY/f1t
         X1p0szPXkdGJ2X63VGs6n724i2Ruwg3XydLWXaQQAK7et93gR3DOzdbwl37tehn3xXSF
         V8Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784300635; x=1784905435;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AEJiCCEn4MHMKuztaU1T70dBQPi5arDzSxrvWKF7Hnk=;
        b=Lc7JlzgOTS81v8ypYFbLWzWdvDq6UqIud+laftwja4/SB9RRLJxdWm+gaoHR19Ao+Q
         BZkeQ4pDJR9HV43ZAbNgW2e4dEZFZy/ZhZCVsAG1rGCp04L/ARLAm31Hotb0ZpdHPMMP
         22YFruTodPlCGwqHKdWit3cWvv5r8y4UPT7jev5kenrmmMFaymeXnLDN0FztjFQKFw9s
         NYsoOgzFTRywXnCJ4w0L/RBNrBZwh8j4Rens1THZ8e+E8akd6d6TTxEeg0E9qMWj9dE+
         LvYfcYNmUCF9QTXjHvKsizxRIcodxobEI1SbPeM/Bi8De5IxW5DiMPu3xa8bUTiFkbL0
         tv5g==
X-Forwarded-Encrypted: i=1; AHgh+Ro4AycoJG8lLkbh895U+yqOf+SDpK+YQ5cT6+HWHUsYMPuV5z02DAj3d3szUNKzCutrNYghy7fZwpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVH/p3+Fm5d1AVGETKYXBLGMHTkbJU5UqeXxskrFtbxJD/wAxo
	UMWBJctv0hVgUj4hXGTtT7dNBotlBNAA1Mxl7Qnyk0nUvU2bOZlnuOMtOIEIChJOdsam7y0kOqk
	sw5FWd8IC5gUBlQGa2aUx9w6JapKNT83WO1MPl/53lp6hwkqpic/V5d0j9uxmd0HdN6651Q==
X-Gm-Gg: AfdE7ckHkKt0tuA3YCjRdqXyRNJS7UDiPgwk0VtlHLD1YUJmxb6PgGunFMY4wilmvhS
	MB04PNVoHOwVbSZUTVNdp+I6zuIsrVvwPmbaNbpKNYgyPFHwQZGtE+NnzcSOARQ+76Ujs02DQ7p
	y+oiXW+Ff7OpRn1ayB3ww88TyKM6VTH0S8xvSd4rvHyAuBl6chRaN/p2aWltS6ZE6rtAJbCluZx
	Sjr237ehiMpM7VbV2oOrZwEsRtnlfA6xcwYxMWqaJs6qYApsPmV7g57blajk10v+aFWdzCbD7Ir
	O9/GlqrxuuziiHMVbjOtIWlAe7kK6Qz7hn14tsxWlpL53yiFaqERgeyqkMI7b8tiwoMvgj/VYHO
	fvjkbvr0h7beoxBcYaHBfUSd2/Q456ZREF2E=
X-Received: by 2002:ad4:5ca2:0:b0:907:4683:58ab with SMTP id 6a1803df08f44-9077850c5d8mr31103276d6.49.1784300635080;
        Fri, 17 Jul 2026 08:03:55 -0700 (PDT)
X-Received: by 2002:ad4:5ca2:0:b0:907:4683:58ab with SMTP id 6a1803df08f44-9077850c5d8mr31098226d6.49.1784300629536;
        Fri, 17 Jul 2026 08:03:49 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907785972aesm19721576d6.22.2026.07.17.08.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:03:47 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:03:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v8 1/1] clk: lan966x: Add MCHP_LAN966X_PCI dependency
Message-ID: <alpEUbEq-XJmnD4m@redhat.com>
References: <20260630103052.413750-1-herve.codina@bootlin.com>
 <20260630103052.413750-2-herve.codina@bootlin.com>
 <akvcmiJtO4LpHA2N@redhat.com>
 <20260717121344.38a6a0f9@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717121344.38a6a0f9@bootlin.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Herve,

On Fri, Jul 17, 2026 at 12:13:44PM +0200, Herve Codina wrote:
> On Mon, 6 Jul 2026 12:49:30 -0400
> Brian Masney <bmasney@redhat.com> wrote:
> 
> > On Tue, Jun 30, 2026 at 12:30:50PM +0200, Herve Codina wrote:
> > > The lan966x clock controller depends on the LAN969x architecture or the
> > > LAN966x SoC.
> > > 
> > > This clock controller can be used by the LAN966x PCI device and so it
> > > needs to be available when the LAN966x PCI device is enabled.
> > > 
> > > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > > Acked-by: Stephen Boyd <sboyd@kernel.org>  
> > 
> > Reviewed-by: Brian Masney <bmasney@redhat.com>
> > 
> 
> IMHO, this patch is ready to be applied.
> 
> Let me know if I need to do anything else on my side to move forward.

I'm not sure when Stephen will start collecting patches this development
cycle. If I don't hear from him by rc6, then I'm going to send him a pull
with patches that I've reviewed where there is no clk submaintainer. I
plan to include this patch. I'll be honest, I'm not sure if he'll pull,
but I'll try.

Brian

