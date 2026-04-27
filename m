Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63DF3A0B3B
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 14:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777301265; cv=none; b=ujr/8qA5TPnd0S8/tAEH0+Sj4Zel0yXkzZ9g/Yc83a53wIcJneIVncyfQafYgZ0XTK4xXnymup5UbSKUuHp939cgXAnzn4KdRzyAOxG6ojwOdKBCkBuk3P3wEMKbIxbuXMWPigZOacsR1BIKrvJt0PuFRFMSlcZeyKs68I4s7j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777301265; c=relaxed/simple;
	bh=3yA83ShQIHiDS3iYFWugzrqfvpvaX2CeAyf8e/uRApY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDN/IQooMCCTPz3k/DFO9LXI0++VkEwokt+Gw9PEhMmEWHjwLSYPAimJWZ5sTNOeFffBCW4LwoHDkubSd6kcaTdD+arPmVMn9/x1TDX/9XdVF/pzNrcM6VSGbYjKfIfM7alZetl16CyWU330vAVXSJ3nZpsGbvhZuNsVeQhFKTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tr9k+ZIG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JvOeYQNX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tr9k+ZIG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JvOeYQNX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777301262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xB1FG4z1f50jkQbqEsBocQxjrZf9lZBRD42cWAkThGw=;
	b=Tr9k+ZIGEcXE67P9eiHMIlUuLE0G48+W2rKcqLzZCYU4BCdyZB+DaIbBO7YVWNuLRZ73g1
	/OC+4jgghPHlBVKIVWKq4OGn4kLTCKUlBXFjRbtHpGmutHCDEwBkqpCtu7idreNqJiO8Oq
	+rXeg7YHZvg0K/pe6UFixMSF+cRTFFo=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-_vu0HnrGMCKzehm4IgjFsA-1; Mon, 27 Apr 2026 10:47:41 -0400
X-MC-Unique: _vu0HnrGMCKzehm4IgjFsA-1
X-Mimecast-MFC-AGG-ID: _vu0HnrGMCKzehm4IgjFsA_1777301261
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8acadca1ac4so283038456d6.0
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777301261; x=1777906061; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xB1FG4z1f50jkQbqEsBocQxjrZf9lZBRD42cWAkThGw=;
        b=JvOeYQNXakPj0kaSzbhhemXmQFjutD6FgbSREGzk5YvwzA385U0xFjd7WOQECVr97Z
         84y9G9kA8SSKZ/H/z2hQ1HZ0Sep6Zkw2ktUXyW1/OfdNprUVWyVRz39ie7C8mHN3Fn/3
         CzvYAW3ajyYdYUJl0YUM2aV+MEkkHjcpes9QZWLeq3+Y8/Ux7QPSNydETRvBaP4nGjYe
         06YhaeYW5IB/BooKdEFTPBws94nS8m/mwgv9aA0FIG0lYj64t2mMC2DsVUSvjcD88bpk
         P1csAdZ9pW5ByEiqqcf61yQuAJf7R1Q6/dwJ6SdDumsBR0hj50agYkWWHRIIDipd8oYy
         LI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777301261; x=1777906061;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xB1FG4z1f50jkQbqEsBocQxjrZf9lZBRD42cWAkThGw=;
        b=S0XX2rqR3tzJw/zSUZLTCpu6RUJQjSX05s4Xxb+I6tYxIlkgNd0fkOK6+MA7CEiIxL
         clYbD7y4EGgQffaa0Bh6A0HhbPcA63+jMIr/t1fqZF2v/nafRBTEZ6cmpcJUiUKof9OP
         Ur2JyCW8BSkXGmN1kPzhQz7GP/ADGhibvIR7Mj5KupQR8ukIagCvTWIADIUEqXVHiDt9
         WkNjHTSmzAYye+QXwVcKT2Xwl67TwZ9UH10Hg2rY218Su+KF0rjr3DkDLE1Gl/IgK5AE
         6CaPXVcR218Bsz4BVs2Z2nAJ7EvD2HUBozpH0/hi/6UAcUxixXnbMN+OKXCYtcGocEta
         z1cQ==
X-Gm-Message-State: AOJu0YwtKO4Gg9y3zYs6bT1XTAcuf3AsdY+o3qxY0Hz5p74cozRUp6q1
	QaN2MlPAf6yXyKGG+2iJ/yi8XYXnQBDsP7C55uXtuM1w+RuIlugySmrDzonDQN1dsauUNHTSYpv
	OA+93tiij2mNkUodqks2+BWn8NWUiBchzW4mQatFZ20moxbc0xdkpxlfGi5zZyQ==
X-Gm-Gg: AeBDieuX4iFisLDKen9xaxZ30HH9CIb2aknKZouFnQ3kI8F3tlV5qKCBQZEPpG810YO
	eTyf8p5PD+mOmZjT3ZK8wsQaTQNA+XI4O3QoAgvpUD8SHrxO11+FITLMw4i5atvTz2Ha/Iyb+Ic
	GVfeHYNebt9RooipRwRQF4VguMQjb/iirqZU7UZ5vEZ7z5ghd0COms0J2q4e8kgUyRstxy1YMK9
	s05SYaxeXAnxkpSF7RgNgWeZ5vhQLu5CdIjdz92E4694nFXvWnEbaHL8EZOY060CXR/Rkn/L0Ys
	PzBZSX8FQE79qFhFJcb+i23jNH2Z/qDlk+RZk4nRKGqkTISY8naZZ0UfOAR0gyFbZF1yknnOLyN
	owUWzfB9rGZHbepIoICKESAxRVogofbD9duqnDicNVnFqfECAc/UkG3DyQhEma2fqrlw=
X-Received: by 2002:a05:6214:d0c:b0:8a1:8ddd:e12e with SMTP id 6a1803df08f44-8b0281667femr670050846d6.48.1777301260775;
        Mon, 27 Apr 2026 07:47:40 -0700 (PDT)
X-Received: by 2002:a05:6214:d0c:b0:8a1:8ddd:e12e with SMTP id 6a1803df08f44-8b0281667femr670050066d6.48.1777301260263;
        Mon, 27 Apr 2026 07:47:40 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac4513asm260911186d6.1.2026.04.27.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 07:47:39 -0700 (PDT)
Date: Mon, 27 Apr 2026 10:47:38 -0400
From: Brian Masney <bmasney@redhat.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	David Lechner <david@lechnology.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: davinci: add Kconfig symbol
Message-ID: <ae93CukeYoJEtaaH@redhat.com>
References: <20260427052354.959139-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260427052354.959139-1-rosenp@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Rosen,

On Sun, Apr 26, 2026 at 10:23:54PM -0700, Rosen Penev wrote:
> Add COMPILE_TEST support as a result so that the buildbots can run
> through this driver. There's nothing architecture specific about it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

It'd be nice if the commit title and/or the commit description mentioned
that this is for an existing driver in the tree.

> ---
>  drivers/clk/Kconfig          | 7 +++++++
>  drivers/clk/Makefile         | 2 +-
>  drivers/clk/davinci/Makefile | 6 +++---
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 06a7ac971edf..42d84c0ed5fc 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -317,6 +317,13 @@ config COMMON_CLK_AXI_CLKGEN
>  	  Support for the Analog Devices axi-clkgen pcore clock generator for Xilinx
>  	  FPGAs. It is commonly used in Analog Devices' reference designs.
>  
> +config CLK_DA850
> +	bool "DaVinci DA850 CLK support"
> +	depends on ARCH_DAVINCI_DA850 || COMPILE_TEST

The clk driver is needed for this platform, so you can make it easier
for someone to configure their kernel like this:

	depends on ARCH_ARM || COMPILE_TEST
	default ARCH_DAVINCI_DA850
	
Brian

