Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2CE38E5E1
	for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776370876; cv=none; b=gEW6oYN0WAzteYGCmZwx+vjDgh+u0ZJs2FHkJNhhILSDOMkSi+5lSNVcdirjDXpOVSgUZQ7xvGrZ8dRk83gICFXfVmN/iYAhZfovn7+Z2RuygYct/ZIiko/7i8LYC3SJHCURSUa6/hQgrly1gUM9IA8Ka0ImkWp77bljFIaQ25A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776370876; c=relaxed/simple;
	bh=ZfvcK1WQYSQJxYFWmliN2X/yjZzr6jKD2FEgu0OfU5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TkTRY8Npvy/fXarIpu2IdglBLsZm1KopvNk+VftJ6thGhJOoMEdVuDS4dUrn5LgEBMVO0mWAcBIfKr2MBz4j7NRUV2MvV+SbHnFCuyKkUrhZg9JKqPZHnh3xNM8F4w/GOQwuniHAdaXoiXXj+BrHNr69DW3VIUvvQhbCFQihoms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AZ9acQeY; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=r/dEdhyx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AZ9acQeY";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="r/dEdhyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776370871;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
	b=AZ9acQeYvqGLi61+EP66nEj1P8vCcUo3eAUjyGsx4qZ/H54+2YNkLXBxrSiSJkJ2GFYuQn
	joC3shlIt52QxBdyRm9KDHw06yJ4j1dHifIIEw9UXHLY8f2NLOxEoci8iLGIqEQx2Bh/zz
	/RkgDx9Di3I44vNuWFqiVxgYDe+O5NE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-6Us5fq-2Ny2EU8Akx98eew-1; Thu, 16 Apr 2026 16:21:10 -0400
X-MC-Unique: 6Us5fq-2Ny2EU8Akx98eew-1
X-Mimecast-MFC-AGG-ID: 6Us5fq-2Ny2EU8Akx98eew_1776370868
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d9a6a853bso205796131cf.0
        for <linux-clk@vger.kernel.org>; Thu, 16 Apr 2026 13:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1776370868; x=1776975668; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
        b=r/dEdhyx/ltF06DChrUth1eiX15hXppPstSUN8EUgTx1xMWBsqfmBwWhqVqnCH5rfE
         x1fNYyavvNWk0bPCoDsHsuTn9OFBFROZtS9BDEhzLEbC28caEzwVSvhEjswaJ8wpWQ7q
         V5yAW6q2H4nQqETkU9R66SqRW+iARtpWcRk4vv1IenPUnL3TVllUqxPZTUBRy8h7ZVy8
         PTf2rf/0GN0Puoss6XnbwF20ZJvNQDP18pEsWrHKFmPQfJq7+IQUxAWpLkhj1aBBOH2E
         YDVlOg6g1c0NBYdJXS2Ebo0E7hHJ+WIFuZBvoP1gD0AOLd1yIjwU6irvhiYOny49dcJT
         7iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776370868; x=1776975668;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QRF8BvcogoOppv5L+uU5WDgQWw4rh47WltzIyMUbMng=;
        b=TAaFzSYnOir4QtudlGBF2l57f7PRwMfDZboE6X9QhvlnLAa+E7t4Pgm5uzdYkt0zjD
         r0usve9q/0tq1eTotFQMjPruzOCn0kOOaPLrLdsgce7oScb9q/1awd4vrnOXUNTLqVZc
         gtkHu1ZgC6DczStqVBgbrN1SSxcuAY3Bc3BjaYPWbm5L3TqucTfiNktun35Z5bX/1K1E
         2DTUjcIkw3zmGM6D8QdseSket6lY0SGj9z5uHTc88jMXZ3OvsuJ7PCWVB0J6oyhzVBpP
         zbvnENf4ydDGdwyIMPyzRRJj1D015FH/e8DGyiEzX8jgMhrGkTBO8AzzRvWDopJQf81Z
         ABBw==
X-Forwarded-Encrypted: i=1; AFNElJ/MvjutNtKEQOgxtRUyuxd2hAAh4ystd8eeMdBy1DgUD/0rWB2OFEw6VNYrImp31Jf/oEDRB3Gpvgs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1SzYV7q/PqMwZSxQmgluOLFkmH0r6o3tqvl2zSdCEye/hXnG7
	YNQ+1BZw2JZJBDempr7Wv9/AQMKuTTERiJ0anvr41ywqAdOYAOcwSRS3XrdZpOPPFmN5rwmsH03
	PvQ540fLG4DTckDdCZjRk+g1rXVcV8KxCuA1m8+r5l+mnQXYtrU2ZnRlxjdg8tw==
X-Gm-Gg: AeBDiet6kltQZ/aaXrsNByCbCyhbqkSyluwMGOse8UkS68wpGksl4j251XqHDZa8dcK
	10STHf0myKsORuM3X+l5fPeOueT+ZV8sYrtR3AlAAMaVptOIfqK0YWtoxx6sW4tQpU5EYoLQ6NC
	0IbiVNg9IVuL2s+I1ifKnXXxLkCeBGREnbwZJYtee4YwnskKY1VMrA+u3Jilw74inK/r9uR4HvF
	C8MK2LBoteVY4ro+xWed+ktFT6CuiUmKiRxS/qsCcKELeKE4mgbsLzFDbHF3AoVA67rLvdvRY3o
	ijIj/+cnLO3z4bO3M0CUTiPgi2NsGo4/Gdb8V8qKxhx4zdCXIZ03u37K/VrY62OuWzlzFEnYhVZ
	Hdrrro7CZRv8XzY5kS+zN8j8WBncZJrs=
X-Received: by 2002:a05:622a:aa43:20b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e34a012ebmr7853101cf.42.1776370868325;
        Thu, 16 Apr 2026 13:21:08 -0700 (PDT)
X-Received: by 2002:a05:622a:aa43:20b0:50d:ce35:6e67 with SMTP id d75a77b69052e-50e34a012ebmr7852751cf.42.1776370867876;
        Thu, 16 Apr 2026 13:21:07 -0700 (PDT)
Received: from redhat.com ([2600:382:8128:ce33:b0f6:e3dc:ef2e:339b])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e1ad963ccsm55132891cf.2.2026.04.16.13.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 13:21:07 -0700 (PDT)
Date: Thu, 16 Apr 2026 16:21:04 -0400
From: Brian Masney <bmasney@redhat.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 1/2] clk: divider: Fix clk_divider_bestdiv() returning
 min rate for large rate requests
Message-ID: <aeFEsKQ3sfGLM6jl@redhat.com>
References: <20260413124912.3260571-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413124912.3260571-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, Apr 13, 2026 at 01:49:11PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> clk_divider_bestdiv() clamps maxdiv using:
> 
>     maxdiv = min(ULONG_MAX / rate, maxdiv);
> 
> to avoid overflow in rate * i. However, requests like
> clk_round_rate(clk, ULONG_MAX), which are used to determine the maximum
> supported rate of a clock, result in maxdiv being clamped to 1. If no
> valid divider of 1 exists in the table the loop is never entered and
> bestdiv falls back to the maximum divider with the minimum parent rate,
> causing clk_round_rate(clk, ULONG_MAX) to incorrectly return the minimum
> supported rate instead of the maximum.
> 
> Fix this by removing the pre-loop maxdiv clamping and replacing the
> unprotected rate * i multiplication with check_mul_overflow(). Guard
> the exact-match short-circuit with !overflow to prevent a clamped
> target_parent_rate of ULONG_MAX from falsely matching parent_rate_saved
> and causing premature loop exit. Break out of the loop after evaluating
> the first overflowing divider since clk_hw_round_rate(parent, ULONG_MAX)
> returns a constant for all subsequent iterations, meaning no better
> candidate can be found, and continuing would cause exponential recursive
> calls in chained divider clocks.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

