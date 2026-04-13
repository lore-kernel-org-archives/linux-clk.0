Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E315C24E4A1
	for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 16:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776098325; cv=none; b=rH7zjyuTDwzG77OuKmFm/gd1c+eHlNVLnp6NJ9pVdsAJNrAkDefghbmFinKV9hpWcIoQwfd6gaisWcSF4aU1AdAB/HU+pfhscZ/toti12FN2Lixera9EUuuuMU5NqhLtyl6RcTxRg7E2K3BbYCje6fnJjfDzaiJSvyX05rkaQFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776098325; c=relaxed/simple;
	bh=hrzx/dvbEJpnRQ0vhxEwjvSnC2pT23xrRo3AuEIFtfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b6XvCH21HSBJ9jtjNhVAMdnpJRNMoXQZumnxJYzLGFoHP0mtwKhMYxWpbZQ1JeysYOXOGF7Ha15fzBnAkQAHhHvyGnmoeHgpwoGbI/cs2kRWKkIzxlNxOY9ZI1JCqlctBnMPE/1MGEfGnDz1PaGJznlKweUU2hDua3ijhNKYbvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hFPF3tFg; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=smAY3nfw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hFPF3tFg";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="smAY3nfw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776098321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MwH/TKeUG4gKy0pVdjPrCTUeZNlRp2XeMAZFKzWMR4U=;
	b=hFPF3tFgRu5zWc+cYc2gcx66GXATuM+8pZ1L+VIobvEFCqX33Ybpf44wjHqjau/jkovtvC
	Oi6xNF8TYLFd8DLISyNqHDYDd52XK0TLuPgfar88Ro/NB5qJmz/PI9B3Ao7aq5QY9JEEmv
	xtRj6DaYP4/aFhH0SKhYW9RSoWwS7NM=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-203-k9WEm16QMAuzZ1lmzealSA-1; Mon, 13 Apr 2026 12:38:40 -0400
X-MC-Unique: k9WEm16QMAuzZ1lmzealSA-1
X-Mimecast-MFC-AGG-ID: k9WEm16QMAuzZ1lmzealSA_1776098320
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8ed08aa4so58307381cf.3
        for <linux-clk@vger.kernel.org>; Mon, 13 Apr 2026 09:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776098320; x=1776703120; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MwH/TKeUG4gKy0pVdjPrCTUeZNlRp2XeMAZFKzWMR4U=;
        b=smAY3nfw2AD8a99Ogc4+G623bOzDNm2v4s051JZpUeOVsG3ms8jmxhKr7L24LM8WI/
         e+WMg06FNq+0qqP0sgLxHKn/TwrtbZfhcXKp32HaAKrabeSpSDPDzQ2bmnOVztf1QUX2
         Z+FC3K3OaJRIJJYajUVor+bLxzW4AUIHA/zp84BSh5evh3kePL60uqLBLAFaxAxo8c2u
         Mndh2JSR+Uq994hlqWFb0keR72CS1BX47fP3mPq8yr/QM5OXQAQO/ADyoWj5YKuzQ86b
         xqR1ExfKuFaoF1xbK0BIdFCMb8unJSfZg4FJ+i1Qy+ygJHMKPaOz3R3zCdsKqLipZzI2
         m8vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776098320; x=1776703120;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MwH/TKeUG4gKy0pVdjPrCTUeZNlRp2XeMAZFKzWMR4U=;
        b=Gzpf/s1XrJyq2qoK/sGnOC/hjPGtBynXPgcg+BUWFgCwVO/E3x+m8IK/mR6hZW6jw5
         zxzaqi2AZsa+kRHv0zB6vPxD8IKRzUQqCSpe6JBRV+EKuavrVCPvXKA5WdeQeB7biUJR
         LQB0ozVD3NNglG4Gm9gP+/WPQ2U4D+J2QllL+esVzymYq+q5jx7TGwu3wS/VZ7ixLujC
         n+SnDlSNaaAW5JNaal0+ykQ4Vfh+1G40QzTs2GaieTs1v0J6Z0PXbv0hBDcLz8rhVEJa
         R0lNzUBiMC2jhOdKGZuacINmt+1CL1mU/4JzKYasShm4J4XDWSuNJsypHFiHtDWpf5x5
         7OWQ==
X-Forwarded-Encrypted: i=1; AFNElJ90P6FQcCKjo481K6ZZ3O3U12HYpPVjJpsanjmogqwT6UKdekFOsgS4/mvFOq4GJRcqXxsXwgxmfJE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcnP1aGN4zaagfItTBQYhJERzMo1J0zZMyaUmhP5jJmpQvqHQZ
	3rRkxSHR4Auy7TdZEdly9yLj2rR2HImKYMCDhQHqzqAb5wczBVsT7CD/ZSvc1gBMFalmYA2dRax
	UBtAuBy2e9Qybf5nBsDMQ7XCsl4+wyoNJw2kWlaGNxVAT0L9Ib0clc/kmJt8d1w==
X-Gm-Gg: AeBDietI7ElI/Pksae9By8maCgfoJjS5JaCZ3gwOKlR0MNJpyNCkH8+MgCEbLcOrouB
	cbOsyMdEa/T0d+0/Rq0uerKcJnjSQgcFMto++CwhcznTUgmGJRUlooseoNWf1kI2VDcxMj76UWU
	WoZxR7fczDvGQIltkiok0ieoOc8g0tWyX8wzBLnQ9MnX/ulziK9Ear9p9XRilGix/GloYpLX52r
	uuf/jdp2Ust1/MLwV+pqzYsnP3krwX/9FyMR2AV8WLsIPKVQxaLuQOWgoQ9av1ywjxbGmVeoeG+
	Ez0XLe3a+jPBvETUj/QDDxd+TAtIEx+30IjlnaZQcWbG1aL3ToelLKfrFRZk1GzL+mM59wDLoot
	QZuSVdrMAxwep2clMEMyquUN13P1JgHd7A5w3x9xcJGAOzjJHpobVDjqw
X-Received: by 2002:a05:622a:19a9:b0:509:4198:5468 with SMTP id d75a77b69052e-50dd5b104d2mr213512461cf.8.1776098319816;
        Mon, 13 Apr 2026 09:38:39 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:509:4198:5468 with SMTP id d75a77b69052e-50dd5b104d2mr213511921cf.8.1776098319324;
        Mon, 13 Apr 2026 09:38:39 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50dd54fcaa4sm87789731cf.20.2026.04.13.09.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 09:38:38 -0700 (PDT)
Date: Mon, 13 Apr 2026 12:38:37 -0400
From: Brian Masney <bmasney@redhat.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] clk: starfive: jh7110: fix memory leak in
 jh7110_reset_controller_register() error path
Message-ID: <ad0cDbXWfSlTaXQX@redhat.com>
References: <20260412125450.2509092-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260412125450.2509092-1-lgs201920130244@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Guangshuo,

On Sun, Apr 12, 2026 at 08:54:50PM +0800, Guangshuo Li wrote:
> jh7110_reset_controller_register() allocates a jh71x0_reset_adev with
> kzalloc() before calling auxiliary_device_init().
> 
> When auxiliary_device_init() returns an error, the function exits
> without freeing rdev. Since the release callback is only expected to
> handle cleanup after successful initialization, rdev should be freed
> explicitly in this path.
> 
> Add the missing kfree(rdev) before returning from the
> auxiliary_device_init() error path.
> 
> Fixes: edab7204afe5 ("clk: starfive: Add StarFive JH7110 system clock driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh7110-sys.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> index 52833d4241c5..55cd0ccbdb84 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -360,8 +360,10 @@ int jh7110_reset_controller_register(struct jh71x0_clk_priv *priv,
>  	adev->id = adev_id;
>  
>  	ret = auxiliary_device_init(adev);
> -	if (ret)
> +	if (ret) {
> +		kfree(rdev);
>  		return ret;
> +	}
>  
>  	ret = auxiliary_device_add(adev);
>  	if (ret) {

There's actually another leak in the error path for
auxiliary_device_add(). I think this code should be
converted to devm_kzalloc().

There is no devm_kzalloc_obj() yet, however according to [1] that should
be coming soon.

[1] https://lore.kernel.org/lkml/20260330154108.GA3389518@killaraus.ideasonboard.com/

Brian

