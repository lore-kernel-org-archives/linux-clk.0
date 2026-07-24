Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA97844E67C
	for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 19:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784919668; cv=none; b=p/PnxtjkzYhazoU/kw30uogN7imUFZ+Ys+Z2sqqhpNX6sAjfovyeb9AwtEp37UAmIk+Os+X8UK1DI6BEsKtck1Ex3zf5OcuzqYmgyULMJwk9GGC1xh5jDWnD9Hdh88uLOFX7q31jQQvGJqpMhr7dJ3znRBAMofqgQm7rd5FYxLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784919668; c=relaxed/simple;
	bh=Dbe4+AReL8h7MG584hVaFyq7sq6Nx1aDlRNh19brikw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h4RJTUZrS9y/GjlJwL4sG8N1PzRIZXZpBi2X4dWApQC2Tc/0FKhRCPCrJlHaI0j2lYdAzsa/V8y4Uv0TmKRoeij4hlk4hvmbf4t/mH+CTQ5p4bWbCqxgvp+mVrmNnjKKEjFGqoAd8zwEwZvLBdnOyoGdzSJAVBJ6T36AdHxWEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YWzltlAK; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=AvyhujxN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YWzltlAK";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="AvyhujxN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784919642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=;
	b=YWzltlAKpy3SlBkXyBv9vi6eIn6FK1+r96r1J5C7vMETkTHdkj8XcodObsrdJEDmfaUvBh
	5/UGFV97SVcyHm8cuwfXfrQY+uVUqfG0ThPs1t11uddI2ucKLrHb3TXMRaH48syE3Cvwx+
	maL50VMy6FVhaGCKllOBbaR8FrbVVCs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-13unAwsGPSKvxTrAopwdzA-1; Fri, 24 Jul 2026 15:00:41 -0400
X-MC-Unique: 13unAwsGPSKvxTrAopwdzA-1
X-Mimecast-MFC-AGG-ID: 13unAwsGPSKvxTrAopwdzA_1784919641
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ef31cd429so95990085a.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jul 2026 12:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784919641; x=1785524441; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=;
        b=AvyhujxNHkYHgn7Kur011GQzJFXm2S/vxrOQIDIn3LNZdIeW+92f2WjJGqAtfFppcM
         UmstvRMfcZPWoadLvOqsCXtKFeYnWJHU7prZCgE2WWCvXrn6ezOLYL5/+D0mRedSLHA8
         dIUD+LY0yBJA37w0L4plezg2BdL3XD+sJ4Un2UoGQQpzEXuLWeUKIMohoVBqCv3t37N3
         wgc+es+g+nHcFD1kcGqsv5iLWbcGoqO3EDgIMhfLHAk8S7m2hutBvUn220cCN20uNIkb
         ZIXLWIren2Drle71vE6xbKngZLZ1w2ux9N8NKzryHqNs/V6i6mV+xhL8txMSP+y3ulE0
         fZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784919641; x=1785524441;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T6vnPk2ZVMVXDwCeXPFzptG9mWQ76bEG5faIrTyQk74=;
        b=sWDKf68HlONjCmxd3Dnk/QBz0xtWEr/bxvYv0eQmPsc+7KE2ZXWRWbX4iSzh3wq6J5
         RiDGgEgwPrfNzwe2IZYWq43zjpblgDSonhR/MJ+fxx/Aqck/i7jENcVYX7y5T0O33iy7
         R6zUU6OqN8xi4KrRdA6mgLtwWJc72TpQWw/lsXt7Ms3xJ0hoHWMz6sA1Shr+a7mCMtT5
         pOh7CRA/Igox9/UKz5ANldDJGjBwZUwC8F23Mwp2Pa1VZF7r5HRE9VbpeBgVIl1WCXYO
         VktR5WpXxkt1Jb8th7ZlWa8SD/oFoEwOroVoLS+3fgUrjxtnrQonHDbyJSlYb7FS8sKK
         llMg==
X-Forwarded-Encrypted: i=1; AHgh+RoMyBKUHLaDVvZPi7MfXVM6r70ORTfh98kngD58dYstPLWvXkYfikJ11HKkUEc+IgLTfKiaOgyfwcw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs9ZaB0wYkk+bIonhEOZdqzqvU2O87ORGzgwfYIZwmsnp+R5xo
	omY7yMMciwRvysXfRwULuWheeWqs9wPpZ+UO/0lMZTz0nUH0KBmqM5REGC9jFHeYlqIXG00Edhp
	TsRDGR1hscSfDnJoyQfIU84rdwJUYDe8giTKS5rFddlzno5Lk2UTfrP2m8tHxRA==
X-Gm-Gg: AR+sD11IXzEkro5mWCHD6jEfWp90Au1ROMMsnHhzOmT/Qwf+PBOGDAJ7lAw6Y2hHwRo
	4Wvi2xWLK5zVbMaX5O6V91HgA7swbd/8UM8WM+3hJQRS6Dy7gvJtun+IUMTBQqtOo0pFU5r+JA7
	8CaOMdlJEFU8P9xDcq4AbJ5RWFLNQ9ta7LOrAj0d3DWs7CIdZ6bcSbyuspiuBVbkc6IbCKEnM7a
	rMMkm3AO2fRtcuUbsYDb7a+h0XdwXZ1Z3S2csLw34X5ufH/X6C4n58lea4LlE6wsTHInchmMdmn
	FWloFRGR1kPBNcFGI8sIUsP/sb/rsE0k0Bw8xtY0ipe5y69NvsU/pi6O83RWHZtFwf78ieTVRZr
	jsNQ5JsWhyXKfplX9LhbrmaUrceL6kQmGH9Y=
X-Received: by 2002:a05:620a:3912:b0:915:a111:86ae with SMTP id af79cd13be357-93103853ca1mr848658985a.35.1784919640821;
        Fri, 24 Jul 2026 12:00:40 -0700 (PDT)
X-Received: by 2002:a05:620a:3912:b0:915:a111:86ae with SMTP id af79cd13be357-93103853ca1mr848649585a.35.1784919640237;
        Fri, 24 Jul 2026 12:00:40 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6aab2c7sm714011885a.46.2026.07.24.12.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:00:39 -0700 (PDT)
Date: Fri, 24 Jul 2026 15:00:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joakim  Zhang <joakim.zhang@cixtech.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amO2VSHtSQE98CNz@redhat.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
 <amJEjofx348vF4Vd@redhat.com>
 <SEYPR06MB6226EA6519C74A0FF0AB677482CF2@SEYPR06MB6226.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB6226EA6519C74A0FF0AB677482CF2@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Joakim,

On Fri, Jul 24, 2026 at 06:14:29AM +0000, Joakim  Zhang wrote:
> > -----Original Message-----
> > From: Brian Masney <bmasney@redhat.com>
> > Sent: Friday, July 24, 2026 12:43 AM
> > To: Joakim Zhang <joakim.zhang@cixtech.com>
> > Cc: mturquette@baylibre.com; sboyd@kernel.org; robh@kernel.org;
> > krzk+dt@kernel.org; conor+dt@kernel.org; p.zabel@pengutronix.de; cix-kernel-
> > upstream <cix-kernel-upstream@cixtech.com>; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
> > 
> > EXTERNAL EMAIL
> > 
> > Hi Joakim,
> > 
> > There's one question from Sashiko that I don't see where you answered that seems
> > to be legit.
> > 
> > On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> > > From: Joakim Zhang <joakim.zhang@cixtech.com>
> > >
> > > Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps the
> > > CRU registers and registers mux, divider and gate clocks for DSP,
> > > SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> > >
> > > Four SoC-level audio reference clocks are enabled as inputs to the
> > > internal clock tree. The driver releases the AUDSS NOC reset, enables
> > > runtime PM and instantiates the auxiliary reset device.
> > >
> > > Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> > 
> > [snip]
> > 
> > > +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device
> > > +*dev) {
> > > +     struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
> > > +     const struct sky1_audss_clks_devtype_data *devtype_data = priv-
> > >devtype_data;
> > > +     unsigned long flags;
> > > +     int i, ret;
> > > +
> > > +     ret = sky1_audss_clks_enable(priv);
> > 
> > From Sashiko:
> > 
> >     [Severity: High]
> >     Could this result in a deadlock? When a consumer calls clk_prepare on an
> >     audss clock, CCF acquires the global prepare_lock mutex and may call
> >     pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
> >     which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
> >     clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lock
> >     again.
> 
> prepare_lock is re-entrant for the same task (see clk_prepare_lock(): if prepare_owner == current it just bumps prepare_refcnt). So calling clk_prepare_enable() on the parent SCMI clocks from runtime_resume(), while already in clk_prepare() for an AUDSS clock, does not deadlock. This matches how CCF recursively prepares parents under the same lock.
> 
> That safety assumes resume of the AUDSS CRU is driven from CCF while the same task already owns prepare_lock. If another device device-links to the AUDSS CRU (or otherwise runtime resumes it outside clk_prepare), a concurrent clk_prepare() can deadlock:
>   Thread A: holds prepare_lock, waits in pm_runtime for our resume
>   Thread B: in our runtime_resume, clk_prepare_enable() waits for prepare_lock
> 
> We do not have such a device-link usage today. Would you prefer we add a short comment near sky1_audss_clk_runtime_resume() / sky1_audss_clks_enable() documenting that consumers should use these clocks via CCF and should not PM-resume this device through a device link (or other non-CCF path) that can race with clk_prepare? Happy to add that in the next version if useful.
> 
> > I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your driver and it
> > calls clk_prepare_enable() in probe.
> 
> Exynos AUDSS is only partially similar. It clk_prepare_enable()s EPLL in probe and keeps it enabled for the lifetime of the driver; its runtime PM callbacks only save/restore AUDSS registers and never disable that parent.
> 
> We cannot follow that pattern. Our parent clocks come from SCMI and also gate the audio subsystem power domain. If we clk_prepare_enable() them in probe and leave them enabled, their enable counts stay non-zero, so after system suspend (and on runtime idle) those SCMI clocks cannot be disabled and the audio SS power domain stays on.
> 
> That is why we enable the parent SCMI clocks in runtime_resume() and disable them in runtime_suspend(), instead of keeping a permanent prepare/enable from probe like Exynos.

That makes sense and thanks for the clarification.

Reviewed-by: Brian Masney <bmasney@redhat.com>

