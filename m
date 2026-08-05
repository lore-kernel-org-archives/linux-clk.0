Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92639477E53
	for <linux-clk@vger.kernel.org>; Wed,  5 Aug 2026 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971376; cv=none; b=Wb0MQ61tkyP9j5C7QznNzNQbxiW75DcMxbwRNTcE85YtULSGQJCvOufGWuMqsRcsTaNDoFEk46yV9ghVnJssez8Vj5ZkZQvAUGxh6J0WS4zqLCC66e3BpDDwamVbL7TMrYewv8eNk5pAGAd9R6ImxFfZCrBlHwzCa4R993oOW/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971376; c=relaxed/simple;
	bh=D4WVaJTUDyZHYEYN6SolofWHJINxpNsj+Bu4DVEX2jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dPyJIUdAKf1GXSBLSbwglrsU9W4unljb4WuhkwuXRh+65upMTVXIRn1rOA7J+7YC/KcVxK1eL6LzCW+EFONoPsRibzghrlicKAmAocWMY+SqoCKnZNcrvQZBDLYhR0aYjejJaTEB6khGck54OoGEU0fuceqCeMIWIFEVOTh141U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LjzPU92m; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fN0rOdbO; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LjzPU92m";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fN0rOdbO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785971373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=;
	b=LjzPU92mry71NWcVDAdkCwVQDcKRBRn0xhetpoXBqQY2xRjt+ONEaAAy3uhavyTDZqIaM9
	C3qUT9qeEy0IigBwB1Zw4+zPXPj1bnX0aFxHNBhFcacudp7FjqU/sCrLJHfWTGCw1jTMEP
	hCl0ES6nfXqCQBpexkozGQjXsl4DkSM=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-DaZ8EMHBPOGDIRMswe_aDQ-1; Wed, 05 Aug 2026 19:09:27 -0400
X-MC-Unique: DaZ8EMHBPOGDIRMswe_aDQ-1
X-Mimecast-MFC-AGG-ID: DaZ8EMHBPOGDIRMswe_aDQ_1785971367
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6688d64bf2fso2350238d50.1
        for <linux-clk@vger.kernel.org>; Wed, 05 Aug 2026 16:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785971367; x=1786576167; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=;
        b=fN0rOdbO0V+3LoKBZ1Bwjtu91DJimb93hEXhexT4W67Z0hChl1BVlt3Zqftvx9X3Sf
         nEjmdIpPdLMqXc826APrfC4fblVdprVsuegCulX2l2wmIHJx31wAdBcOkDsMJ8Sl01J8
         7Z8BcuSDyve/XUkros13EAsbbw0VXjwY8g8iAx+/arNL+h/1BvnXY1ekOQVICho2UWRS
         VY+gltFBRIbP0kO2EazyUFhPdveesdhkVWXSUI48AaBfDEIscdlR0i9nHF8qmztJmcyu
         cAVmkuZ1/zNCpMc867kDVqtyvWzBVEyAihJVkS0z2pRj5eOVVEjh0jhBLWU7EoepzGrg
         nfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785971367; x=1786576167;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P5KkfoazfSd7LbFAmZXs7FVBEh30eBrbBqu13ZxDK8Q=;
        b=OBNvUt6ILitB2FB3zUB5FlqFSf0gMkTYyuRYhqDZXLoh29zUyO3th0DkP+yuuVDSaF
         yGlks+fbUFXfw1opvdcNNOmeQQWtgZIBDkCjwY8hRwR0AVGUIK6EtA8IIGNp4dH2VgVz
         eUZ73+wj/aVNVK02DUAnOq24bYluDJupfT9gUw9CZpZdf/oJCdo9Kgji3St59GwO+N3l
         1N70GFM61gMdxOk6BwSBu/QQ72Y4EYRzViby9ggrbIEoGWXJXLDNKdKdPFynrLE8N1o2
         +wq8FTtiDtf8e1DxGZnmpgfZsBwWEEZ3xbYk4JMWvHVuFH6+l41f+rgHSSEaEP8y+xV4
         nZ6g==
X-Forwarded-Encrypted: i=1; AHgh+RpyMu22Zl6bw0zG/3kiRUIGPOKJnFseuGX+OWDw3pethxHPF1Px1HxhVpTrBF0hvSuL5bL3KozX4og=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCOx85Q4PD+oJRQgh3TJRugjOEHU1fNPbh/b2ClTj0cEBkYjgV
	11b/GYv1Ksj0rUq7xyUCsKpqk+UmyPwiM6ZHI0ThZWx09ik7r2CdMHkt0YgO2AYaQb256+ZpJwI
	hGk2IQk5XjBhOFoRPGM5nddgFyuIhGxMztbhkOSLm1AI5DLnJSUgBdM6OMuC/gw==
X-Gm-Gg: AR+sD12ySvveSCE/bXqtgdcnpTa/SkrPTOUP4hflmQJvSYebHC0eN1F7JBzcEMn8y2t
	XrrjRB6S4HpSQcD2zssUvgysN1DiT9aplGJxO/ffJxpVf4DYYHKhcSemmzN8EN/mNCWnmpYNqOO
	epZTBm2lzJ4zjbXL2uiPFnknhJuT29euYYnHlLy+9ixzyT+6c1U+4txqWwKZ0U+rVJhMHNte5XI
	6j6DqaEYJodLTfUPLeT90CiGi62V9ZAaP2sw6gyr/jCsQkVrjDYPJuqOmGT1zbvt0t4Wy2YEdSf
	fVrE9jGpItKfm0gf/HptkbcCKvfF3dmtjzuWGUXYTTlql6dzmts0IIpo1tgTFuOThusgxxi0Uj0
	XtJajBHUEUL2GZIVY8jlwC0kPfeZzcof2DKc=
X-Received: by 2002:a05:690e:250b:10b0:667:a95b:59f0 with SMTP id 956f58d0204a3-6699abcfe28mr5022126d50.34.1785971366740;
        Wed, 05 Aug 2026 16:09:26 -0700 (PDT)
X-Received: by 2002:a05:690e:250b:10b0:667:a95b:59f0 with SMTP id 956f58d0204a3-6699abcfe28mr5022102d50.34.1785971366332;
        Wed, 05 Aug 2026 16:09:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-669913b9903sm3924589d50.7.2026.08.05.16.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 16:09:25 -0700 (PDT)
Date: Wed, 5 Aug 2026 19:09:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniele Briguglio <hello@superkali.me>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] clk: rockchip: rk3588: don't disable unused I2S MCLK
 output gates
Message-ID: <anPCo9nkOjpBUOlq@redhat.com>
References: <20260624123914.1767374-1-hello@superkali.me>
 <178267399833.3089434.5140309637329023610.b4-ty@sntech.de>
 <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v64kcadr1nAisu_3kyE-=-4oypDXTvAy--jQHa0VhmYoXg@mail.gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Chen-Yu,

On Thu, Aug 06, 2026 at 01:00:02AM +0800, Chen-Yu Tsai wrote:
> On Mon, Jun 29, 2026 at 3:13 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> >
> > On Wed, 24 Jun 2026 14:39:14 +0200, Daniele Briguglio wrote:
> > > No in-tree board references these gates yet. Boards drive the codec
> > > MCLK through the parent I2S*_8CH_MCLKOUT, and now that the gates are
> > > managed clocks, clk_disable_unused() turns them off at boot. On a board
> > > that relied on firmware leaving the output enabled, that cuts the MCLK
> > > and analog audio stops working.
> > >
> > > Mark the four gates CLK_IGNORE_UNUSED so an unreferenced gate keeps the
> > > state firmware left. A board that wants the kernel to own the gate can
> > > reference I2S*_8CH_MCLKOUT_TO_IO from DT instead.
> > >
> > > [...]
> >
> > Applied, thanks!
> >
> > [1/1] clk: rockchip: rk3588: don't disable unused I2S MCLK output gates
> >       commit: 946352b2f88fd2378f0341312e47dff1e8dc2fac
> 
> In hindsight maybe it would have been a better idea to map the existing
> clock ID I2S*_8CH_MCLKOUT to the new gates, and add (or not add) new
> clocks for the internal MCLK gates.
> 
> Then you wouldn't need to update the DTs, wouldn't need this workaround,
> and wouldn't depend on the bootloader to set the registers correctly when
> booting an old DT.

Help me understand for the future: If the approach you describe would
have been used, then the clocks in the kernel would have been mislabeled
in the kernel driver compared to what's actually on the SoC, correct?
That would have been more desirable in order to keep compatibility with
the older DTs?

But the older DTs can still reference the mux, correct? From the
kernel's perspective in this scenario, the important thing is for the
mux to select the appropriate parent. The end gate will always be left
on. From a power management perspective, the power will be cut further
up the clock tree as needed.

Brian

