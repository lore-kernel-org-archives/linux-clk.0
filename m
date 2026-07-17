Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57D0246BCD
	for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298663; cv=none; b=L3ooS9Kw2WRVpRovPlPa5nIK3Cl9CDag24/RG/xI9abf7LcOcrDPsPMrI//DuYh8gtwtiqFO6b8Y7NijxYikDOMCpgPY24sMwX7wVtu0zZhNjMbFpAj66NzSGcaQHjlMTTtMf4UbfLnsy3KK97elbCrAmeiyaKa9Wk8l9dLpKaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298663; c=relaxed/simple;
	bh=4lX2KTzLDxqkajLOI2x4b8RcuUBUe0pdPMW9ATeAUss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTVb+tteTIeLO8e2sOO+iNAZVIHHTAfiOCPoV+PXltDfSynkcBl/dMWefidMBWc+RPKjoqBE4N1sw7F8G4QPNzubBDai2QiWJUQlX9weRuWIv/UV1U4YF0IN0hFURH5WV+iyGvhBLSxo0vCKOXy/3poKAwGPNIQK9OxEV47Qfqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dt6HE0zc; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xac3qR1H; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dt6HE0zc";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xac3qR1H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784298661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
	b=dt6HE0zcyJd1FzVvI1F6nqYq0Lxbf0RoXlJUPZy1TLrMeie1+bhwejEgJEvK89BR4QJLNU
	AP3q0FJ0fMkGyrKceVLddQPbKTM1v18Wf+ge2vhe3ZJUh95ZGSYVf1IeB94U1eaC7l5ANy
	wE3H71DHMPLE69t4RZXIPUUV34+1rC4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-74c94UQCNti0QD4B1tEM7w-1; Fri, 17 Jul 2026 10:31:00 -0400
X-MC-Unique: 74c94UQCNti0QD4B1tEM7w-1
X-Mimecast-MFC-AGG-ID: 74c94UQCNti0QD4B1tEM7w_1784298660
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso97716441cf.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jul 2026 07:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784298660; x=1784903460; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
        b=Xac3qR1H+Dt6E8Cfzbx77gJJv+KPkm0N10jy8Hun/sAKNPU/UZN3LnlIFMptgTIc/a
         q0dBUXF7fT4ZTQeWngkrjy0Lv7nJ5kKyQG7MHcJ5T7vLpmD4YEPeEeOoAz98AsYkAX8x
         SXukuHF02cm2Ilc2PnPi2VXbNkiEsJAMDA7YQ4py11uN0STP4TT7+THiUeCTe1P0VUcf
         ZXi/pCGqJqIqHI6AluppSTgrgT4kPF4xmV15nDsyiMgdmm0KvfH+SwnTLz+ABn2j4c0P
         TK6F5NV3coRTnjj2KcSYpGrv+3GUVWgb7fxpkBJhg/RSq9rkaiDe6AoemXrtTH9yiikA
         z5JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298660; x=1784903460;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiFJW7yDa7Q593qaNVa5df8mhuriHuxHGUsJACa+pQU=;
        b=Cmh7G/tBn7ZQ8JEbedL8429/+ZTVqPlT21JiFGvjZ740NzzYMtWBPE9MFZcsQa4TRz
         iUK7SJ8aWEmMWjQ2mhR1IKtSqupQ0PGgFJmk6ipBaCBFKZNFgOOiAD7x2/20UUnFRGcb
         wN0PJ8rlSozbWZKay+xdq05Z6+zceFcbEbaOPMkChwjBivrDtp+kWtK7nDqSjA3K4ze1
         Olc7Z4xBOxKPdaxsVwKVxBBkNz6164N32hGXN4273sIMEIAOH+ZE7/bWwGCDMYCspT+Z
         48Bh8e4+2+8J67r4GClN8JbC3VbEoVQ2AFYIbZkVl/V1GEsTxSjod8N66NHXZy7g78zZ
         ELaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7fWt0MNnHbS/K1Y/MU1I2VjD7CI3zCp0XaRxXYjUaFwuub9egRzU4WtPrgnAT+t0OfemmnpTpKXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNzPCutEofdNEjjy8CPLi2wo4xbvcVgcFpTM8402DgHYfyNzK2
	+FUWJYJg5Oa7ajwR4I3ZOYRWoeG1pAYOLobkMBKCai4WZtp48fwvBiG5+kio9CFpYULSgpgAaPC
	rQxCxB1xLUMm8AkRc4yMoZlW4PcLdGR7KdyK+rV/YFxnOkMx7DUwJTtfxk5nKzA==
X-Gm-Gg: AfdE7cn7bqAs6qtsIauLwSd57MCQzInPzC/GhyFu5Od1GrE2zxFZyF7l1/DfSJxPkb2
	YIX6s2T9RgGcm7vOGKuUAjnWQr4iIEVbAhgazPck92A8g9V/JZDDeUPNPJT6rL2OdcBYdERG3sT
	Ako0zHy90wtB4qUYyvRjpLOBFWKqrQS5KY8koPOooHPmZGlmPDPB1mpGqxwCH5U8UbIR0Sogeua
	Oz1bRqeF71u/3t61lmAdrDV+qsSdbhN96xhKBpqZgCc+gqSgFg21AcCvtimeShXFbpb28E7Qfh1
	xbMxch+ptWP7eTzz5b8mxOObx1jvPjvpgl1wGPYfMNnv+cx3cvlL9iSCXz3R96euhrqGduJ/kGM
	wgSc5/YWz0wdHTpkIb1ablGBJu7MoJEblp4g=
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25659071cf.54.1784298659494;
        Fri, 17 Jul 2026 07:30:59 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51b:ff45:bc82 with SMTP id d75a77b69052e-5213daa1d49mr25658361cf.54.1784298658914;
        Fri, 17 Jul 2026 07:30:58 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52149a3ce4fsm13091681cf.0.2026.07.17.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:30:57 -0700 (PDT)
Date: Fri, 17 Jul 2026 10:30:55 -0400
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
Subject: Re: [PATCH v9 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <alo8n8NmiB_8l7PL@redhat.com>
References: <20260709120125.3997078-1-joakim.zhang@cixtech.com>
 <20260709120125.3997078-3-joakim.zhang@cixtech.com>
 <allvw2ZiiyX5SGIk@redhat.com>
 <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB6226BD151ABBB192AEC53BA482C62@SEYPR06MB6226.apcprd06.prod.outlook.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Jul 17, 2026 at 09:47:28AM +0000, Joakim  Zhang wrote:
> > -----Original Message-----
> > > +static void sky1_audss_clk_remove(struct platform_device *pdev) {
> > > +     struct device *dev = &pdev->dev;
> > > +
> > > +     if (!pm_runtime_status_suspended(dev))
> > > +             pm_runtime_force_suspend(dev);
> > > +
> > > +     pm_runtime_disable(dev);
> > 
> > I am fairly certain that remove() is called before the devm handlers are
> > invoked. The clocks will be shutdown, but there's a window where they are still
> > visible to consumers. I think you should use
> > devm_add_action_or_reset() so that the cleanup is called in the expected order.
> Agreed. remove() runs before devres_release_all(), so force_suspend() tears down the hardware while the OF clock provider is still visible. I'll move the runtime PM cleanup into a devm_add_action_or_reset() registered before the clocks/provider, and drop it from remove().

I don't know which email client you are using but you should fix your
client so that the text in your response wraps at 80 characters. Also
add a newline between what you are quoting and your response since it
also makes things much nicer to read in the archive.

Brian

