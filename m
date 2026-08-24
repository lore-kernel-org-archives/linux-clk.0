Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5037D3783D4
	for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 15:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787584994; cv=none; b=A2d32FRQQgFPlzJ33hO5RRY0BnwQf1EiWOqXue+2V/9zQR1/G/R2An8z3Gz//zjl/tOVw4C+7INDtJ6cUwmZJSqHc3ajfVN/EGsiD/cvZC38SS8vVN6x2gYF8PqtpDnslKw4kiTEzx2GDUp4TbN+D0SL2NqzXgBUC9gOltO9+iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787584994; c=relaxed/simple;
	bh=e+ytmXFE3JSx2HG+7wOm2fBXGt3tT6P8fb9ziEakcJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pzrv1cbjCMg+7kbbdDwIiKlt02XuHEOtSJyJKoUhmfCP8XMw3A2eDAE6tmty0PH1C0XMFWbs0aRGPwBbEQVmjHTzH/l6Y4tCy5mRSf3SMSw5thlEbfQOb4sitUhAsPQDxACe4t89EqyFYESbOHSxYYBYQebno2QWa6KX5juEfkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H6enZLbH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M60N09jh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H6enZLbH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M60N09jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787584992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
	b=H6enZLbHTx5fwk9ZHtWF4ZSwIjE3pouyUNWsjHjQtG4tjwZKVeZkoJs/Sr5IGM7QMb4AHL
	T7d8d1rIfu2vktsVa+AiBE7g3/xwTL3fCZ9dWm2VacITOwWzah+hSUH+ORTxxFAh30J7l7
	G9ta720/4+p4NTobbj1ZEFO+GK2U7Fo=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-inVgpCv4P-iQwd5DBywYqA-1; Mon, 24 Aug 2026 11:23:10 -0400
X-MC-Unique: inVgpCv4P-iQwd5DBywYqA-1
X-Mimecast-MFC-AGG-ID: inVgpCv4P-iQwd5DBywYqA_1787584990
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-930b571432fso488585a.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Aug 2026 08:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787584990; x=1788189790; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
        b=M60N09jhdJ3t8MPue+qWkRiZtpUk0hSjBenz1Vt3MeXbQS6camnLzqFTyKdjidt29c
         qBI6dOHTPFZ4ASAsFotO8Jmu6nV9EDAeLJcLFIsS2xIb8l+5wJuu9yQEgIbkO7XsaD3o
         5Rl2I0NgoqKemFypJFwX6Svgy3gAqOkOVHAm3+Eux9KAfkSzWlT8mo7Wy8lbAZEOt8yq
         ctuwztmixGPBQNG4MTnuJTT2cn7DPFLOwoVm4IL3zhFoHHco+1Tids2BYleUWY9jifh9
         LBZPoj1Cy2ZNsGvKdjgUPFWvO6sRn4YWZmGyvuNwcH+es51zg9M8WEKGFa20/+k5EISs
         EdVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787584990; x=1788189790;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hDfbqGOe33LfiN0dznJh5Z23M0Lr3/BSZqPKm5UAkFI=;
        b=KNnab1lBtK4MJYG3JjDZLeR7VrGJ0rAMpMo6Aivw0+1O3bUwH7ckS8Kx+wsrAuBSJv
         ntl/QLnwGHGBWuTNemGs/qSwOnnlgAesN9S6H9P4HYB/ND5bsZbCMfhBAbip0mCy1BSp
         +FGjAhrtHRvB39A9poe+TmbmozfBZew2zad4Z7EWQAkc/SLbAJu7lwGcshlyJRqfURe/
         5896t/SsC4JlKyP2qkjsyrAHRyss8ILo6HpF81z/cOlvldAgjTY2yb9qOm1wYo30Xnmw
         fh+uA+6IdNP/wuKfN5AbxB6YHTlhDLicP29TX0BnpnEVhwSP1krycY+kAlcPrUN9rfGV
         Nz6Q==
X-Forwarded-Encrypted: i=1; AHgh+RqOXkImF3NyrSdq5hS4WliwOqyjz53sliA59lmGv+zWyxB9qNvZx1lywRryyDKg8buFs2shEJfsT48=@vger.kernel.org
X-Gm-Message-State: AFuF++nW/WaZCXn+fp22gJTPpd/KWAhd2CFZQta9fPHv7QRUiN25pifl
	WTyTtu7xZ9tIaRdCvhAO/KQAZh8PZXtgvrEDgjbki3ocJ+UBAFU8fDrrvr5UOqf9xtz4LZjqKk7
	fsMsJ1d1n6XhkxNjKJcw4N+RneX67PA/UL9C0/1Z8eaHp5eg7USqQD+FfZ7bzeg==
X-Gm-Gg: AR+sD10EIyewN2048oa77QEGHy0f9L0uabTCOqX4oe2j4nTRs2bwd8GwikaJ3naqugJ
	lzF37Xj0sa4IzFHlieDr5iAYGMGUymJqrx5AP4f1VaWVjpOamDR/tu+SPZTV25mwHq6bWKJjYHu
	VwLSauIrOt32L2NhgNxcIojd3gVUPxDqXsmKcUiFkgHTsvqyequqLK1+CdVvzsG+GxHjFZVoqDv
	MVhRXhBFBUv0cJvCAmR30ljS7mf93SWK3I1upcNqZJmXcu4dH/xZiBUeaBdBpRoSCPT0oYhY69o
	ovRDJufbp3WIY6CdrLn/OyRNLwdvTbE1CIbyW8LKchh0B41yGBIN3LjLaWYkfAydUCXASfNt9zz
	h3gfxVNQEVpDxKG5OcBoFgpJ5tn2kvKnN6Fg=
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565549885a.22.1787584989919;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
X-Received: by 2002:a05:620a:8011:b0:915:5216:e5bf with SMTP id af79cd13be357-937398f7702mr2565541085a.22.1787584989359;
        Mon, 24 Aug 2026 08:23:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93749e9f94bsm517466385a.37.2026.08.24.08.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:23:08 -0700 (PDT)
Date: Mon, 24 Aug 2026 11:23:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: =?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH net-next 0/3] net: Make sure clk_init_data is fully
 initialized
Message-ID: <aoxh2xyb4sQwfHXC@redhat.com>
References: <cover.1787240118.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1787240118.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Fri, Aug 21, 2026 at 12:07:29PM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the networking subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

