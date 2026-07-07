Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812C43ACA41
	for <linux-clk@vger.kernel.org>; Tue,  7 Jul 2026 19:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783453481; cv=none; b=tPphdf8TpCo33VEPQbCqmAiJBebPvA6jJkKO2dbdXB/YR913i4ylAFtAXvRHHzi2SmYun3MTBFxf5lc32lP8HRkES/tnhqx8U4uxKPVPErGr5jZRbUhRcuPZb46cZTDYn2ZFWpv1zj/rLRVu/pCjvGhtao9mPcfwEgV4+Bhk7MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783453481; c=relaxed/simple;
	bh=MjkFSwyNhKgAhyFItFeRe/l/Dn2xgXUjFalUpUSo1R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C6HQDfHOw7pAZ2NlBJksHzL66LBU8EOdxYzvGFckHA0j6HQEgKx70q0ys99o7KntviKvtBckMjvRB8dQq3Klf6a7oNIwCZp4uVynPCDOoLT1VutxJEDeB7/B6I3q/loI1mxUAjFMhJopYSmW5QA0m408YhM42TvCSLCTykgMh/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gNEcHq7r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jVVaUybt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gNEcHq7r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jVVaUybt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783453478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IVFAgGtoBt3yMgSGiPb3d96SZc0L9n2DCPFDDVyk6cc=;
	b=gNEcHq7r+hxyOtXWW3g+FU+Eo2y8kZiCjz8AmyO4pvuqyD7utg3KNxRI5i+hjPrszWeou6
	gyImm7YtmQNDOE7MotPwOLXEGzh30VEA2smweOiYSBPEdTG9R984rVrPkdcTYI/2yFHO9S
	UOuhgM3Hd/XCNV9CAmVUcbonry8BHPw=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-z50bqpPHOp68bZv8lFXSzw-1; Tue, 07 Jul 2026 15:44:36 -0400
X-MC-Unique: z50bqpPHOp68bZv8lFXSzw-1
X-Mimecast-MFC-AGG-ID: z50bqpPHOp68bZv8lFXSzw_1783453475
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6a18f3aba30so5538121eaf.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Jul 2026 12:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1783453475; x=1784058275; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVFAgGtoBt3yMgSGiPb3d96SZc0L9n2DCPFDDVyk6cc=;
        b=jVVaUybt5wRYBd9vdiyKMAcn9LV47N4E7HCCulO+EVtlHJxjymXo0ErOZHd04sOQZJ
         8rC82kCFHfbGttKMYTWOYAJPCthGg/LRAcjQc5WJLCUNypEvUX6YtzK7ezGboZwWgR8X
         1BuFeuLnVhdOOEFlcDbo62qErUswGrEyxJfXfN97abK7AMMPRiopshYYxSPSjWZN9haV
         ph3k8cTkqByPp9pVw0IRPGNeu93jY3bMFiNNDufLTWlzzfo76DgECcQ+q7TY+sCKB+Fy
         XmFarjSH71dSNJWBoYSgnt5iQgwcaSDO3wCI+HQR/5EU/Rt91j3DaQ1sITk9wN7qI+K8
         VmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453475; x=1784058275;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IVFAgGtoBt3yMgSGiPb3d96SZc0L9n2DCPFDDVyk6cc=;
        b=Y1aWj0ZbJNOPlGD+uvUSyxvPHH7KFNCV7SiuWgeRBSSBQgZlffhCiCx5N6lpjNs0yI
         5Rcy+uJuuU8LUobC+QZdo4gKzK4LflYY8AFbwpBgW4eBYtb/Wc7Fg5C5bZe0C00yRNAq
         k8EYQhT0KMN6ba4GK7badj8HOeIeAmHjgiITNu3Xb0wS1nUx3LNHsZq7dJ26RStytF7y
         l6z5+yj+NJ/TZbTW6dVQ6kRRdjURk2Hf6lGlKAEwC0Oo9IkdPgQOr4l+C0nTxP2cqZJL
         FvyX7Nsn908J1gPJYYHnl7nMHmYkJv2XpmaOcXEOSQ+dCYSJcPAZCKuZ9W8qsKw2EnHB
         bujw==
X-Forwarded-Encrypted: i=1; AFNElJ/dK22sBycXA7IWW2LCRcpwu8NhHuNYuThmL4fXU4DvI7eKbUHEJvBuw3aRTfepc6gWbLQq4azTkPo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKRSoV3cETYbsQHqFUXKEaYOdZtZXPdiAIhvEmyuZaPqfRIXEV
	f30KvRlwrhY/xTMQvXDJpz9OYYQNNali9zA3DnnO4QMYNs3VwOAd3pOopuH5z2R9bwWihWKpa42
	sLsvT6JslaICJyVHupKwNUv0ZvUj8feVle2KHTTjD1VAk4X0yV4lHuPP1yh4V3A==
X-Gm-Gg: AfdE7ck/A54hKlUAyvV1Xs4ZrmE6h6s00Ufl3+6AnMDS6vbZsRERt9MnqBXPB2p1CQI
	0c90Ihc/5hRtYwMng8GcmN6aedVU5qCQvKWFs/rkx/RQb/s/pSkDpR7hvb94cWpEXv3cPnCpHtx
	xl9Xml0Jj5dWOIlnZuiOCLWnPE2Zw/LJymzj8R2pn7X4RFP+920gvAH5yU3nI0GE1dP3/HlCfHZ
	hlsH3W/oruYPg3gtMnPZeJUPrPiyHN7aUZZWA/DND3hI6ylmisv4al7AatbQsRHxrYWzx3putp1
	Y/kHxnTeJ501rQ0qvC8h4GiMOzhgUAS9ccBNBtmpkq/drDqWBdEuQ93Jxxl7++O6ODskImzYrT+
	NDgGkijjC
X-Received: by 2002:a05:6820:1b05:b0:6a1:42bd:d005 with SMTP id 006d021491bc7-6a35556aa59mr4024192eaf.48.1783453474844;
        Tue, 07 Jul 2026 12:44:34 -0700 (PDT)
X-Received: by 2002:a05:6820:1b05:b0:6a1:42bd:d005 with SMTP id 006d021491bc7-6a35556aa59mr4024176eaf.48.1783453474395;
        Tue, 07 Jul 2026 12:44:34 -0700 (PDT)
Received: from redhat.com ([2600:382:8102:284f:288:4331:f63e:598f])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a36a8cb24dsm208450eaf.14.2026.07.07.12.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:44:33 -0700 (PDT)
Date: Tue, 7 Jul 2026 15:44:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jia Wang <wangjia@ultrarisc.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ultrarisc: Add DP1000 Clock
 Controller
Message-ID: <ak1XHlCwsrj7FjFB@redhat.com>
References: <20260617-ultrarisc-clock-v2-0-9cb16083e15e@ultrarisc.com>
 <20260617-ultrarisc-clock-v2-1-9cb16083e15e@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260617-ultrarisc-clock-v2-1-9cb16083e15e@ultrarisc.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Krzysztof / Conor,

On Wed, Jun 17, 2026 at 02:02:54PM +0800, Jia Wang wrote:
> diff --git a/include/dt-bindings/clock/ultrarisc,dp1000-clk.h b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> new file mode 100644
> index 000000000000..751125f99965
> --- /dev/null
> +++ b/include/dt-bindings/clock/ultrarisc,dp1000-clk.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +#ifndef _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> +#define _DT_BINDINGS_CLOCK_ULTRARISC_DP1000_CLK_H
> +
> +#define DP1000_CLK_SYSPLL		0
> +#define DP1000_CLK_SYSPLL_DIV2		1
> +#define DP1000_CLK_SUBSYS		2
> +#define DP1000_CLK_GMAC			3
> +#define DP1000_CLK_UART_ROOT		4
> +#define DP1000_CLK_I2C_ROOT		5
> +#define DP1000_CLK_SPI_ROOT		6
> +#define DP1000_CLK_PCIE_DBI		7
> +#define DP1000_CLK_PCIEX4_CORE		8
> +#define DP1000_CLK_PCIEX16_CORE		9
> +#define DP1000_CLK_PCIE_AUX		10
> +#define DP1000_CLK_UART0		11
> +#define DP1000_CLK_UART1		12
> +#define DP1000_CLK_UART2		13
> +#define DP1000_CLK_UART3		14
> +#define DP1000_CLK_I2C0			15
> +#define DP1000_CLK_I2C1			16
> +#define DP1000_CLK_I2C2			17
> +#define DP1000_CLK_I2C3			18
> +#define DP1000_CLK_SPI0			19
> +#define DP1000_CLK_SPI1			20

A common scenario for the driver side is that it needs to know how many
clocks are present. For example, the driver in this series has the
following in drivers/clk/ultrarisc/clk-dp1000.c:

    #define DP1000_CLK_NUM                       21

Which seems a bit fragile to me having it in a separate file.

I've seen where some dt-bindings will have the define right below the
last clock, so DP1000_CLK_SPI1 in this particular case.

There are a few clock dt-bindings that have it this way. For example,
see include/dt-bindings/clock/nuvoton,npcm7xx-clock.h. Personally, I
prefer it this way, however I can see where the argument could be made
that this doesn't belong in the dt-bindings.

Do you have guidance for what you'd like to see?

Brian

