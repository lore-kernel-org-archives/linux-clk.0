Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408C6223DEA
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 20:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776197129; cv=none; b=nvRFzvrFHgOO909WvVWaL0ukgM96kaIAlqtbW4xxoYlsMVCNw3GbNac29l5RcHQ5Nymr+ij/b0HUIdsKLRljoTT5miXwXUIQ9NjnA3c3xQmtiEz0VQHibQx+PD5lpfTadVV1kWHiJPvhSNkRr1IY1TS53bnOzwTqy5DQmMoCSlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776197129; c=relaxed/simple;
	bh=aATsalV8/1i5L0VFh3YiF/WCOnaKmuUJPAwqHhi9cLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDWk8PBZsULt3j1HM/eFLrT9txdL1PkKYjYkEigL0KlqRhSMApQmGK81OzGxZ5avFEYAXG56RZ8CO0IxmzdHIY/M59PMF9p4xZQLawyhMdDErEmMd7yV7Csz+zIUXD5NwBLt42cbOoeK7r5xT1mhyYGJz4O3SrQ43BujR4nkgX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WCIEganP; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsFAEeb7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WCIEganP";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsFAEeb7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776197127;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HT80x0fa49gU1qS9LZMVanLH0BXd2Tg/W3HJgvxGomA=;
	b=WCIEganPs3ZHtiaBxmD9r25ZS30UnsnRLlMESZXMxnNvU4EPMYe70wqMnjAa1LGxRYY9O8
	CPN0jW1Kz+LUUl9Eqjb5bRbB1tGvzaLmYjfSNr34q6zm2MI0zCMZerv4E0f5JpanYXStYN
	jsqCSlkkCuM18MhhuodamErOY8Zqg4c=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-XeVPLXH_PxuGK1T-syVrbg-1; Tue, 14 Apr 2026 16:05:26 -0400
X-MC-Unique: XeVPLXH_PxuGK1T-syVrbg-1
X-Mimecast-MFC-AGG-ID: XeVPLXH_PxuGK1T-syVrbg_1776197125
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89fa878662bso116411656d6.2
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 13:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776197125; x=1776801925; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT80x0fa49gU1qS9LZMVanLH0BXd2Tg/W3HJgvxGomA=;
        b=hsFAEeb71FPX7kuYWvXNf1awhqcCZs9utsLMZXUCQEZmEhd8eSKa1Kiuo+DbcTJmDC
         VMDIChPZ8eiXuERXkH1dzJ6U7v/pGb0jAt+RuLbaYIjQUm/CicyolUltzaQxySAZDWhs
         gjuc5M+IdlGdupgtBeV/CA9EaGXDU2Ugq07BTCHkdbNX7OXPE+s879M/GTvVbMH9lPLp
         OVY9+GhBcZKQoG7ltBo91kzy8N6dBhmVmDfs0jFbokyR/Be38R7+A7yudcmjp/XW/aq1
         IkfhqUVtuc6l2P/Ixm9md8BIqeBqaXcwFCKH8cmfGPVVmRAtH1xJoxwGlBvMWNZP/HEi
         8ygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776197125; x=1776801925;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HT80x0fa49gU1qS9LZMVanLH0BXd2Tg/W3HJgvxGomA=;
        b=XnLm3fZbAOEMEDDE/ANaZ/JsURyajv2rk+Q2iFKVNivfFe1osGwM6bmNwYrXhaYNJX
         7bpYRLTaelgQXjZgnC8X7jfZfatKuRxoMRSatmEvToEwsSSMdqjL4fITU3zJ7/SJpMnb
         DWW7Z1gT8yCqZnKRtJZd/JB0SI8WTbfIlq3LoRZApza1yahQpuRSZm4AgvGv80WpAxQ7
         WopaZq//4flILN3dsamSue+6InKN3g0JcJ+LgYxiypVDJh0mDkv8daZTyUIJnKF0XH0e
         9tG3ZnNnMuzRUgb4A6/kTiJKx2AM703DmPKpPMKSAGoiZ10M6c6z2D/cHMk9ykRTZsVi
         L6gw==
X-Forwarded-Encrypted: i=1; AFNElJ/7ZAFIBqHlNYFGMUeDjl3FrgYRDsTKKQoAcy8XgBOjv3JJnbjR0k0Y6gULCejr95xfNUCM31ksc1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnuQG0Wb7lt0jGRctfVKqIHkLafR/zHORvQPTJHYAN20ZQS0xc
	Tc+Q1ml0qaI6VQVxu/ovwwpvmWxQut4O8PZnGgeienhZFN5A1Yyi1opWhdk7k5T3t6W+mN6h60X
	Vf3ViS7h1Bd7CCRI1AkAEKndfpKZsjVecfzO0R/h5RLgC3a8ijpjSWbTb/73FUQ==
X-Gm-Gg: AeBDievNEwEYmZFP0P/c4/K6YyoKcc9vmviq6umzsk44q6I2fAL5qGfJFF80hs4g81I
	gP9OcWCB3BLHgxSCAHEPkshiXRYssh/bJ3x2AQ1HmRBYshjAToq+jbSUZywdf+PHNy1tjS+zKnz
	GDp1St2rnEjX0r1AAfu4pGJmmyTmyx6OmE2CxZcp44EIP9pUgqOUFQxUOIhr6Uy0r3C2Xm1jLbC
	NYurne831sQdxpRfvJciqRem6yYI4hBSoXzMLTySxFMZfaYI7ivjN8Hy255jxHhXsJFPQtf1Wha
	5NKbgVgMZDUTNWiKvhDf6ViT69GKFBnMsoB/79Evenw0V+LZZBhNJVDPq6URlrGJ2ldLkYieaDw
	iKA36l/ePdtpCTtAXof09
X-Received: by 2002:a0c:e001:0:b0:8ac:a546:775f with SMTP id 6a1803df08f44-8aca5467d00mr158065526d6.1.1776197125302;
        Tue, 14 Apr 2026 13:05:25 -0700 (PDT)
X-Received: by 2002:a0c:e001:0:b0:8ac:a546:775f with SMTP id 6a1803df08f44-8aca5467d00mr158064646d6.1.1776197124557;
        Tue, 14 Apr 2026 13:05:24 -0700 (PDT)
Received: from redhat.com ([2600:382:8116:76c6:c5b1:9485:5da8:de42])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849dbc0fsm133803046d6.1.2026.04.14.13.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 13:05:22 -0700 (PDT)
Date: Tue, 14 Apr 2026 16:05:20 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] clk: starfive: jh7110: fix memory leak in
 jh7110_reset_controller_register() error path
Message-ID: <ad6eAM7a-5jzxC9V@redhat.com>
References: <20260413143643.3002454-1-lgs201920130244@gmail.com>
 <ad0d5fIAkjblQcIt@redhat.com>
 <CANUHTR8JCPLMAPfdjXX95tcPTqHWBy7k3GwOo7=BcjRxfMSavg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANUHTR8JCPLMAPfdjXX95tcPTqHWBy7k3GwOo7=BcjRxfMSavg@mail.gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, Apr 14, 2026 at 07:44:18PM +0800, Guangshuo Li wrote:
> Hi Brian,
> 
> Thanks for reviewing.
> 
> On Tue, 14 Apr 2026 at 00:46, Brian Masney <bmasney@redhat.com> wrote:
> 
> > There's actually another leak in the error path for
> > auxiliary_device_add(). I think this code should be
> > converted to devm_kzalloc().
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
> if (ret) {
>         auxiliary_device_uninit(adev);
>         return ret;
> }
> 
> The embedded auxiliary_device has:
> 
> adev->dev.release = jh7110_reset_adev_release;
> 
> and the release callback does:

You are right. Sorry about that. My original suggestion still applies
though to move over to the devm variant since that'll allow you to
remove the release callback.

Brian

