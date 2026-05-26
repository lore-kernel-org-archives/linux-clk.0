Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F32A405C38
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779815767; cv=none; b=soldenbdQu4oxcjc+OlwtXs16ihcfZTyxC+QK0xSengTF6knrbn9bGKyA9ltNupt3tGkSq6VICcNf1EWdkPTY64A4E6QzrlDYLH7KwvjyOWmNGYKGxTQh71bMRR4f/hdNzTKYABlLmAbbcFy8wgymTHC4Z9Mwk1UXkl5sLc6KUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779815767; c=relaxed/simple;
	bh=RBEHuNsVmU6+ThSKJuEYBB7vzlMO2qvs/8iC6YpvH8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxyP9RbekRpGTUOTkImP1pSDe16VgmjDBZBIBYEg+HlbGODZgHI217bEmlzkcp+/BjxcxNCnbe7JLZz5vSHegT0Wdc3I7iaEaYxUTOVLMOlwIeJv/Zx/HIt+KsiOYYWMj2orfoubMwLZr0kMi+H/xZydWJpeKjcvlimS30LduS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PpzABgcD; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bpaYQsmP; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PpzABgcD";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bpaYQsmP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779815764;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
	b=PpzABgcDRZIrfEJPO//hMFvsQVW+kYRynQ2+8VRGzT2jGrxi3czX5w85TNhswUCNWJ4vTv
	YNlcO3IHGvn02UJ8rFoSo4YQUX08YNFubBrQs6r2HMF5SSw1HR86Dw4brll8Sjt/bRbY5y
	Jth9GkFT0bSf8bzmSNHs2/xqV8RZkoA=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-EDA2FxQENxqyLYvStD40uw-1; Tue, 26 May 2026 13:16:03 -0400
X-MC-Unique: EDA2FxQENxqyLYvStD40uw-1
X-Mimecast-MFC-AGG-ID: EDA2FxQENxqyLYvStD40uw_1779815762
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43b7aa790e1so5398922fac.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 10:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779815762; x=1780420562; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
        b=bpaYQsmPZTYrJW3bFx4sy/T/D38qfWgs4jn1R8qAW7TgAzkxmjc1BDb1RY27TOyAyk
         mV+7pchi83hGye2NCxdUPs9lNAGBn/Fgm3x72cLN2pJ4diRbndkJkDKHcBScqH65LxaO
         DVP5TH25sh98xa+UrTiQijeyP2kLKtrkgkOpFeJyHFA1NbbHtqBImDpwOFYr+uz8+RKE
         fmInWGriAmL/xeEK73LJN9thPNqGJHbofsiJtt0ovDddjmmwPBz/NXyA/NSdXSdtjYis
         sAa078XcvE9QRbPCWJYHz3eYxLB/evcK6e9dEQdBWxfaPnBlPYhu1G8jedy4CF7E1wo8
         Zb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779815762; x=1780420562;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kbKjzg9bSmm9vRJLbDtl4q72jw2NHj5tbX6e2y5JU5I=;
        b=foTUbRieUVdetN0WACd/O16/nLkg3H0LyzIJHtDOb823JwQQNwkV4ivnaUTBSnoCbJ
         wc1TaJOhy4wo0bLm1b3AIbBxZqYRa18Et9mp0Am14KrRUUFiSq5PHlrPNxz6GysuGlv/
         e8/VhLfY0Ul2Yma2qDx8mhPeg7plxpkxqzX/N0kV/O/1DUoe+Jx88cWJ3MwdvoTYAHL/
         N4igtCKbqf3dPZ1vSL03paXmoSxsoWiPH4TKo8+Bqo5B4zRv/V9mLY8UB47z0R8KhA4s
         iYmf7Zcx/y2XAkSxQBIL4avFjhNCdfjq304sspuW789zcGHh1cpCwqntwQcrpxABR3Y9
         /IuA==
X-Forwarded-Encrypted: i=1; AFNElJ+roOgMGM2SXANbqfxvghXTjaDgeJPGb+d8QUSxxYyG0TASHCnDgul0ho3i/S2LVqtJtfFPb7R74FA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3N1o80oedLhy1dQiCNJLiQVi7+eazAkd7RuI2JqN/6tBB27Fu
	tTlJpUU0Q/qz/IKIpw9rfl8Zsq+T0RgckFrhnQoCH+GemrWn+o2Chend5zO0huB0AUhQREBP7Wx
	Wn176NAkurZRJoN8hYDh2tD2HT5/xtyX+MsMqwnrpS+m8XtJPtRdXpd4sxv4yPw==
X-Gm-Gg: Acq92OGpJlKkAAkajyugSV/u9xUCC609Bwg7SnsRarwK+6w2PiKxH8F+TQ+KxNcKLee
	mOKZvDlsGIw4iC5dN5fydbEizfMHy8Oy+upbINZjokU26WFOjMnt8qWf7J4+Tk5dhKZrP6T+DP/
	/NtxflvLc+Zxc/7Y1SxadLn/dzmDW/tDeY0Pl2zRSYsNWvl7LdTFeShl7Iny9D0i+ekRB7gOqOQ
	Rr5TCZ2dKvD9TeDCjxB12Cxhe3frDARdI6J7qUUy5HE2joJflBqDIHyiKiZ4ksSPUkrwDYOihya
	F54MJgSteDz48gM6yK59MOP1t1yzdDdzATd1VgT9pD8QpkKcLSXJWPMVKNSWGGI2TGZp2eJj8H/
	rDpk8WMxrGcL5nXRpwkjwu3XdzYyasDW+pQ5LuEyKAtVTeP1TNzzHjK155j+fTiQiEY4=
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142395eaf.16.1779815762466;
        Tue, 26 May 2026 10:16:02 -0700 (PDT)
X-Received: by 2002:a05:6820:4b14:b0:69d:d9c5:9308 with SMTP id 006d021491bc7-69dd9c5938emr1142352eaf.16.1779815761931;
        Tue, 26 May 2026 10:16:01 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc812e2018sm148514636d6.28.2026.05.26.10.15.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:16:00 -0700 (PDT)
Date: Tue, 26 May 2026 13:15:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	laura.nao@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: mediatek: mt8196: Select REGMAP_MMIO for vlpckgen
Message-ID: <ahXVT62JUZmliXfy@redhat.com>
References: <20260522133023.355404-1-akkun11.open@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522133023.355404-1-akkun11.open@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Fri, May 22, 2026 at 10:30:23PM +0900, Akari Tsuyukusa wrote:
> The MediaTek MT8196 vlpckgen clock driver uses
> __devm_regmap_init_mmio_clk() by devm_regmap_init_mmio(),
> which is defined in drivers/base/regmap/regmap-mmio.c.
> However, the driver's Kconfig entry does not select REGMAP_MMIO.
> This causes a linker error when REGMAP_MMIO is not enabled.
> 
> Fix this by selecting REGMAP_MMIO in the Kconfig entry.
> 
> Fixes: 2f8b3ae6f0cb ("clk: mediatek: Add MT8196 vlpckgen clock support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

