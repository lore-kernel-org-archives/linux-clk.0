Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D3B326D53
	for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756400017; cv=none; b=aLwMY35pPnDajrVZf0T3UAeJxzClEcFnSWtUf/8afHi2eCsSC28V0QufALmhr+Hw3Uobg/Bra0H9lrqLzNtW74RxZoxwmjt5l3ujCGd+aP/rXg6a4oDiioSL8DdaViCuqI+VUaH6AHE/8InNp7D14hl2CfDUiARuQWqg9qIGeQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756400017; c=relaxed/simple;
	bh=sdthemhZBx84Skd5So8//igws6ESFRah4kMlqpHa/18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iVHIOh4BUWlDRrM1u997qGbSwhkCMPp+F4EanueX/+xRCCLiefI8SFNktwsNCHDOvhEO8tCxnyvLl2M1Kr8IGTxe4V9hg/8yHGX3FhCQ+KPyugwBmf9rJSForqxJ1ZIrDQT5bI67jx4+l/nrN9l3aZx289JJkThoFW27BVsksDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ef7NtNKK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ef7NtNKK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756400015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJklgM7Ntm5BMtyc/cSU8HBd9g8djuSELpTKH6fZV4k=;
	b=ef7NtNKKLgRrnuaDXxnTP7T5YGpMYKYSHkk78rjE6Gbp9tHxYjFL885Etje7jGTeo5X76t
	n5RToL+Ercrs3LJ2PvgaqPvX+1ZI8sGqe2zeIbc/pG9lKPBzFuKAjGVtJsEsFK9fqveF8L
	aDvKPALLtVnDBpWHcDupl5NzGPNIouE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-9_NgvcXDNjWTkyXmUP7dLQ-1; Thu, 28 Aug 2025 12:53:33 -0400
X-MC-Unique: 9_NgvcXDNjWTkyXmUP7dLQ-1
X-Mimecast-MFC-AGG-ID: 9_NgvcXDNjWTkyXmUP7dLQ_1756400013
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e870315c98so420882085a.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Aug 2025 09:53:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756400011; x=1757004811;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJklgM7Ntm5BMtyc/cSU8HBd9g8djuSELpTKH6fZV4k=;
        b=pgZYVq9/lEwxLWV/hO458aDiHL+sI+c5c1zqmwMh3wWbYlCj1jxBIMQxAS38DvdvSz
         SeDaM+jGQ/w9yCdlhOGcR+wgRGenrtOJRA6LMmVrwEjoNBPRnyoQDdmZayhYFnOEzSx1
         suMDKq3vxvIJb7ZbnPZiEPNgFPXCQVXPZBlFdj6hhBgAYySrFlOneOS7XqZ/v+TPz+IF
         KPMAYhyqsAHfSV7Z6bmiz37hWgtbCbpC657pL1gNgIlnZJVaVYm/5DEN3FxX3T1Phxnt
         J5Z/1vvKtgTK3fmFnOzEcGAz+4OwK5TQpZa37RlaGf28vZ2yZHRwvVYI9gAuxBLdITt5
         tRcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsN2xN8M7jilsOPpbK6SZanuZSD0IzOaNpol+huhmRFXq0+WKGFSUVA+PHiDzhWLsQqMN9h8c39QE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8ZapRoV2cfD1G4K+u52YnjJRRfNhSXYCPO3GVIvH4O3Xeb4iI
	OutviI+HWlc9i1njKxqXJGcSFdvd5h5IzvgvwCZNGYdtwiqG7yTlZhkPGOvxKKOadaGno2lmX/T
	6vVLXPoK+xgK4R91P8CkFjedHncKC+FNfx8bahL+JaDd7NVHge9YGRDCe0mYYmQPEw5zmQQ==
X-Gm-Gg: ASbGncv0nw3ZAZAt81WfgI6U1qVkKsTYf4HtKJsItaQihRk539I/Q0+R5frRwv/XPCH
	xt2vivJOVyuZb3DdcYxdxXjU3AJFD/Y2bjh9X+CGBaQMKZv8Vgz1c0H8/AIZm5N8U0TPuT+eKDv
	ipjya0bxqJ6SgnJCW6v5mNsYNBsfvBQsqtNc8lPptEYGaDtMGp/F7QbSMVBsHRg8DJHXKOYOokd
	ntGKTsuGhEjvl8xo6DbDrefRFeLnxKdCk9gSwex/H4Cq70GKZgYGUl6iSqwA7NI2jFpjAjoUYrP
	6Jsc3KtAz4yfNBdDU22H4xfEJBKHpNQAzE+YPlvng0ssT+IxVM/ziKrDN3cx54rqjzMXpiHHPPz
	BveAkbC4MkcCKu4pNNpw=
X-Received: by 2002:a05:620a:1a0f:b0:7f3:d274:a318 with SMTP id af79cd13be357-7f3d274a41cmr1467899485a.45.1756400010730;
        Thu, 28 Aug 2025 09:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmWvmcBXzR5JVgeu8M2Tdex9HOUc2fcKiwnULMHR1EAqpd8F04fKPVsKpKvSeoVzTgNpi7Yg==
X-Received: by 2002:a05:620a:1a0f:b0:7f3:d274:a318 with SMTP id af79cd13be357-7f3d274a41cmr1467896485a.45.1756400010374;
        Thu, 28 Aug 2025 09:53:30 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc1484a7a8sm12294685a.43.2025.08.28.09.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:53:29 -0700 (PDT)
Date: Thu, 28 Aug 2025 12:53:27 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ryan.Wanner@microchip.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	varshini.rajendran@microchip.com, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 02/32] clk: at91: pmc: Move macro to header file
Message-ID: <aLCJh_tDnTl83Vtg@x1>
References: <cover.1752176711.git.Ryan.Wanner@microchip.com>
 <6776f06473d3be71882ef938a4314947f565e26f.1752176711.git.Ryan.Wanner@microchip.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6776f06473d3be71882ef938a4314947f565e26f.1752176711.git.Ryan.Wanner@microchip.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jul 10, 2025 at 01:06:55PM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Move this macro to the header file as it is used by more than one driver
> file.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

