Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08443C7C9
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 17:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784222710; cv=none; b=XLKP0djq2DgQ2G7dHxplRwamK8yHh9dLzcjEkzr5dwkr8kspRI8fGKPczh2eHE2g6cv2mP1fzQsYmhv+ULUqiPQ1TB/pyTg2e9Yx1Q+B5a+254iJ2/PEYirkUsVMW9I16zBZZkh+rY2r/AjcW3vIx8iewUlhAD7WoowJHyiuCwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784222710; c=relaxed/simple;
	bh=8jTa16KDl9pnTfYsoE4b9ji14RQkNnD3YdxX1i/Gbn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GC8wn1ImTDXlDCzAu7qj9q9FDiS4NZwVPWGzmsms7bpKhFOWp9TLRLmoJdiKRHXJQ2ZgguFVSM5IHEwrBEKKJfQ2ZlrYquthrk0eYbG+XVkkvOMsSCFV+Lf5ihf+I0mffS+yP1hZX2NcX0VdiBBxbcmcm2P1toeDonauqCgf9iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A7O0U7f9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gnszrhro; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A7O0U7f9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gnszrhro"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784222705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hAZ/QzyKvYYE5WgKPJAnrGrd1t34utw4apevYjNSjdc=;
	b=A7O0U7f9j8vsnzCBpF8Rk3ZFjiD2pQoKgY5DTLOjKuJRwk7Xwnr+Rt09m2TT3IiOXc712K
	eTGGMXztA4EKxbODJSE/lBhXx6WbTjbmd07LQT6kIQnOIvwbRd2CN50a8EKlwfunOuHie6
	jV2Srkr4XmQ6JmbogkvNh8EA6dbhGFg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-G8vmpRnvP0ij1Vqv8vrAQQ-1; Thu, 16 Jul 2026 13:25:03 -0400
X-MC-Unique: G8vmpRnvP0ij1Vqv8vrAQQ-1
X-Mimecast-MFC-AGG-ID: G8vmpRnvP0ij1Vqv8vrAQQ_1784222703
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8ef18406878so122912996d6.2
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784222703; x=1784827503; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hAZ/QzyKvYYE5WgKPJAnrGrd1t34utw4apevYjNSjdc=;
        b=gnszrhrohrLRFz5nSQqKi2e+tHCAmEkuty29ByNIvYWbKVIW4ZscOIOmZovzlaUwnB
         vQUwG36X4gA07xkhlnfsXlg6MKr18rPpjSlT38gW8gWq9jF9pI2TSFYg789UUgs24gio
         8fjKxpyjoOUG74lDnia+hZzxBMKw4XFV8VdpH5vn3inuwnMnlIuH/ROUbeJA5ZHvncMq
         KqLt/3WoxaDon4A4zqA2tVOhB9/zDpsStxpAfEN8Js63mzYGtvzigMeMtZTAnWYsqUQX
         Hz7SYu+Vhzcu4dyYXgGWr++A4WgGXYoo5Y+wExYelkaYJG7fQcxhZZoAucHQ7xy1Z3h+
         rpKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784222703; x=1784827503;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAZ/QzyKvYYE5WgKPJAnrGrd1t34utw4apevYjNSjdc=;
        b=cG6qBEjJhkHnH9YFKIqwkHDavHonsTc/CrhyMhHJ9PaCkId9uXx6/f8OXL6cwy2O/T
         5R4vKBb72JA4lOt8P2tKKQCz0CIq70512D88xKCucpcWJhcrc+BychPK6OQnZXfK7RRt
         emPUDn64YSEnyzPuJXCRg6X6A6fKZtuBJiWdXt0PejKfpDc6Ku+0LKuQmxeaOZJCA97t
         OjPYA6c0cwgdq+XRiLlXy4ikpWnsLrIflNRY8v6gafvg+z7kJH2fBo4t+BKz4yQ5sa7Z
         bP0jxtE/LkPrX59akToGu87biKAn1AZUdR/fdIHl8BNjrZibK46ZrZSHB5ri9/ASfi2k
         Lx3A==
X-Forwarded-Encrypted: i=1; AHgh+Ro/S7XbgWDjan5ILI1NIGCAtZX7ZfX0c2LNXEOPN2HQ6xRLlQM8PBqtjVuAXc2noJRlwlKgJXrZ+B8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwModVBeWqqYEQFo1ReabDspX/nLCkeYVs4IykWGgNeHGj5R0U1
	UD2BmV5cPEjFjaMEuUM8trpUQmI1sYPadERBhHq7GEoyT1Qu698qsfw1Vk5IUfrTuwBDlc8geU+
	WlJC1Q3aSrdORmewbsfSBQT5EXfRwde/tc+6eLM1SlkkMuRIlWEzcRmGRsKcX1fkmxidlXw==
X-Gm-Gg: AfdE7ckpniD3sdXJctEgLyryPxWMjOQgvD+iGmTmZIFmWM2GL+8e3lOPO7Un2jaYVsm
	8Z2iduFm+BYmEFaGAeP90+9lYWzJK/kLWTQruvo8hs0t+12oTN8zehjTcAtdyr0LiUUPxEh5cyf
	N4/64UM+GxumQ1n3WXPco6N/0sWd7IHj4eKa1jNt4uZWmQiBRUwrn1ZrU2IlJA58W+SjjfSUU9T
	1RkWNxWuvVEdfoVrRyJOcVnwllx+kAJ9oRC0+STEk5bJCHyh76P605D8ecMw6OkadJ4bvMv5K1C
	YvYcp10yal+K0kzEsu0YAseSsr/26Khk6wc5OJOkdSXNL7mPDgjP55Kn+5P2EogUHz10H+y0SKf
	Nt/JeiqVc+Uz8taPN4GmJeJhcs0Rg+rnGYzA=
X-Received: by 2002:a05:6214:4e07:b0:907:64a4:ca00 with SMTP id 6a1803df08f44-90764a4ccddmr59256296d6.10.1784222702932;
        Thu, 16 Jul 2026 10:25:02 -0700 (PDT)
X-Received: by 2002:a05:6214:4e07:b0:907:64a4:ca00 with SMTP id 6a1803df08f44-90764a4ccddmr59255976d6.10.1784222702549;
        Thu, 16 Jul 2026 10:25:02 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd57baf98sm225839626d6.17.2026.07.16.10.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 10:25:01 -0700 (PDT)
Date: Thu, 16 Jul 2026 13:24:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v3 1/2] clk: palmas: Manage external-control prepare with
 devm
Message-ID: <alkT6xm9jjzfUv5T@redhat.com>
References: <20260711141755.96842-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711141755.96842-1-mhun512@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Sat, Jul 11, 2026 at 11:17:42PM +0900, Myeonghun Pak wrote:
> palmas_clks_init_configure() prepares the clock when an external control
> pin is configured. The current driver only drops that prepare reference
> when external control configuration fails.
> 
> If provider registration fails after that point, or if the driver is later
> removed, the prepare reference remains held.
> 
> Register a device-managed action after clk_prepare() succeeds. This
> balances the prepare reference on subsequent probe failure and driver
> removal.
> 
> Fixes: 942d1d674931 ("clk: Add driver for Palmas clk32kg and clk32kgaudio clocks")
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

I checked the other clk drivers and I don't see where any other drivers
call clk_unprepare() from a devm action, so I think this is fine in the
driver. If another driver needs this as well at some point, then it can
be split out into a common helper.

This is the first driver I've noticed with the external pin control.

