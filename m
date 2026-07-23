Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D44370AF1
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 16:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784824981; cv=none; b=e5IfCEPwhj2f4PBk57EdC8IfYRi2e+LWab26Scc1SmOwQH4rWgiMKcH+oRZyRwi1Vtv3lD80y+3eIRFmkOU7hTlehwoAjRGw/DfmBsxZdGMwNS9zxLSegSG567X2Lp52DAgQnEXP5kyuyDFZoZGbgsCz6M/jnt3PamMqG57vqok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784824981; c=relaxed/simple;
	bh=Uqj+joQiBFE5zvQmdyC4BrL68D5s2esloap+GA1As1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyA3Y1p93mxk1jy8FFzkIbcT0SAM7DDvMuLYecWncjAb3+v/SpPDvfSRhAkRCHJw3c+JlPfgAuI8YYG9w1rkgfyobtCezDLAjb7DpkyqknIT1wuh+GdBikGQVeUPmLsXTcTm9/WSY4hcz3h9NHLR+AClkOiVehgD7b8Yhv5i+oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XvkeMhj2; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0xAzGmC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XvkeMhj2";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0xAzGmC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784824979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
	b=XvkeMhj2ER2tDVFSWp1EO3+DBAWZ2Tg6Mqqu3x2ctDEhAP5e/pV06A/Xmstt3MYW11rat7
	E0/tVXNO+RZnBujxgLElDTOufMr+2PrJxLnzZwSGFCf3/p/Rw/JRDl79dwECLRwP4AHAhS
	kKMmoqAtJykGNaelL9iOZIfKQ0SRSqI=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-cdu965ZtO0OFSK73dGUz8g-1; Thu, 23 Jul 2026 12:42:57 -0400
X-MC-Unique: cdu965ZtO0OFSK73dGUz8g-1
X-Mimecast-MFC-AGG-ID: cdu965ZtO0OFSK73dGUz8g_1784824977
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec45d9628aso16997156d6.1
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784824977; x=1785429777; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
        b=L0xAzGmCGuHmeqQ9sn61bMNGusNsfj61i0YORm9jRG8UnwcJ05fvBbdpvuBI/K0dWI
         vGCERjgdNloIDST2ycD0INdsL2TcA0v6l1vwyYk4iE5TVTKAd15ij9sBfj1tOdR1SlQm
         gZVRZOn2tgdDnpxrGtZPpOgLSEENs1683yHru6C0L5WhO22Ui8ri/bk5lyVYQs/3RFUC
         7xjdKeMWO+YDxDG/bgLLOPPm1M8JOgxKZpSqHQltXwlkY14kCOCK1cBv6WJsHlC0C9Pk
         i9nakJoXKYplUdM899/pu1TjpwZ70C/pc6H+0OM3SftY3UHiuMsbLduHqESJUuF6VhJZ
         lTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784824977; x=1785429777;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRGUmQHl/7b7JCzzCxB7rE09gTYSCj2H/Pm+6BbO0YU=;
        b=IG9EvxZ/C5+cDDnapiqCxPkODpx+UEmPN0gjQzzCNQKjXkl/L1mjscKEJoiA5CJjAE
         CTE6U0yqgYs+8VZgsZFhAqUTscNNySu1PeKPjBUwB5OYrWy0JMOdiD0q2CTEK+01tZC8
         HeqhiSDlS2NVsheZZGSAbva55a9G4Kr+tpsc990fby3w58tIC/YCSPeiIrU8PbzF/AYR
         AkAnTSY6T9/G6dgBZDRdef+sO07Nrac+JH2AOj47Gkmblr/0ix1YNZ+jaPsBfBN9O4vR
         Vi12O02l7MqHphfphnv2GFBOVJtSBWf0xpa3r8m0pRe+h2tPTkznmdFbyIVs3BodXuwg
         jRTw==
X-Forwarded-Encrypted: i=1; AHgh+RppUSAXkd0Yzm6+jwOWPWawsafzYvLMIsN1GO56ERURG1WAf84L0W3CkdwKbr3Nupeq4rkQw8eiXdI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6JyBfrYG4bmhV3y3s0k8i5Ab8CBVaoOlNUGZO5TQWZKRlYG16
	HdKj3t8PEtyFHMhXxFnJ51mCCidM33puqZpFDhxOdAEZDStCfyQiW1k/aYsRhZ45pPNMdJwH5CK
	U9x1LSGoRVtbSIJ5zqkx413F0PsHkx3+qbl0HKhrw11ASik0ARS7VkEQAFtlY9A==
X-Gm-Gg: AR+sD10eM+WcANfn1G2+rtMCGAcFIuow2IBmBFVg93j5gHILex/6IfByRPPOyTtzBQr
	fcNuHomoETnTCqfrqAdcv+Xbg/ZKdKdCIv2BgbPtgF3hCxFNruOdjPZGX3z4tlZtySo9SUmJLwS
	m+Ct4hGWjaYYjkoNFxI3xMpFl3T94/YCsZNTVO7KYGV26ZlKWWczm2uBsoGCcpuupExJiF1+eLa
	iC1+5JZ6/g4QDDs1UPZg9azG3Fi3FAU1p1ltII/M2GKBu2sbpBYYqtis+HW4TvVTYmJ8CqWXnHx
	yka2x43v6dIyEhfVWKvQc5D+Q3jrhFArkcbrtd5vXvsOiFPUhieC16HMJPtJTXlAldafXAPpxY2
	azY0fM0XgkF3kcTBWoueFAIC92xlwwCgiF9o=
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588916d6.26.1784824977049;
        Thu, 23 Jul 2026 09:42:57 -0700 (PDT)
X-Received: by 2002:a05:6214:3d99:b0:903:3469:98f0 with SMTP id 6a1803df08f44-907ca587d79mr47588416d6.26.1784824976552;
        Thu, 23 Jul 2026 09:42:56 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907baa27cf1sm48281876d6.46.2026.07.23.09.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:42:55 -0700 (PDT)
Date: Thu, 23 Jul 2026 12:42:54 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v11 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <amJEjofx348vF4Vd@redhat.com>
References: <20260723090808.1727598-1-joakim.zhang@cixtech.com>
 <20260723090808.1727598-3-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723090808.1727598-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Joakim,

There's one question from Sashiko that I don't see where you answered
that seems to be legit.

On Thu, Jul 23, 2026 at 05:08:06PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>

[snip]

> +static int __maybe_unused sky1_audss_clk_runtime_resume(struct device *dev)
> +{
> +	struct sky1_audss_clks_priv *priv = dev_get_drvdata(dev);
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	unsigned long flags;
> +	int i, ret;
> +
> +	ret = sky1_audss_clks_enable(priv);

From Sashiko:

    [Severity: High]
    Could this result in a deadlock? When a consumer calls clk_prepare on an
    audss clock, CCF acquires the global prepare_lock mutex and may call
    pm_runtime_resume_and_get. This triggers sky1_audss_clk_runtime_resume,
    which calls sky1_audss_clks_enable. Since sky1_audss_clks_enable executes
    clk_prepare_enable, it will attempt to acquire the non-recursive prepare_lock
    again.

I found drivers/clk/samsung/clk-exynos-audss.c that is similar to your driver and
it calls clk_prepare_enable() in probe.

I'm not concerned about the other feedback from Sashiko.

Brian

