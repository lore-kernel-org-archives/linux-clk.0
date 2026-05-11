Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D523F0A88
	for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 14:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778510185; cv=none; b=tLAMhJUbgXoHn+cL3BxJfsEBf2ieIqYQnnbtCLs1X2kM/rcKcH+zd90BvLqiaJrpSgNC2iWC09TjJm2dhHKDLEM61FHafzYSDs2fmLou1Q0N7RQJSaPql/8lef4tvnW1Gmwrr7ZhTZwT4EYki/kY/o38bdcMz1i78gjkjVApQQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778510185; c=relaxed/simple;
	bh=OD53JVPWJNXND+hhbRWk6qwD4LDdvpVx+u1whxdxWqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7/juaMlpCaWLPLyyfy6KbVjYUUb+oRKpraef/3PRjGkFY13Q0cojYMJZHAF5cDMvQ/euh5sm0gPXMgnhu1xOEIYGxWG6N4lMuUkcEai/1nQRd2TjOPnUSWx4C4oddFKHkcf4TR4XP7RzU3nDNYW8S+r/ZKyyK8bOqAUIvh0Qvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q9eb89z8; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=IukC+2mX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q9eb89z8";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="IukC+2mX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778510182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=;
	b=Q9eb89z8qNm/6r6dw/OBrHp3kCEUAhvHa0BLJVdhL4hjSre2K/rcf993mQxzaGQH4QmhQ4
	zh6qxI6kdz4SbGhmtUvET8s7hC7ITE/4tNo0gG1nimnDmSO9QEmVYZhupMeDftfKGq2p72
	WSlVHWQRtllIBHc69j91LW6J11BfrwE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-TBNCov1qPuC6o8geI-rgpw-1; Mon, 11 May 2026 10:36:21 -0400
X-MC-Unique: TBNCov1qPuC6o8geI-rgpw-1
X-Mimecast-MFC-AGG-ID: TBNCov1qPuC6o8geI-rgpw_1778510181
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8ee1a909037so814482885a.3
        for <linux-clk@vger.kernel.org>; Mon, 11 May 2026 07:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778510181; x=1779114981; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=;
        b=IukC+2mX0Kt0XvpMgbaANkshrqCh+DvFB3a1h6awSF88ZOWytxcF1BfaAayrCifZXD
         oL9uCLhJJGXkLP6phxUf8XFMZ2wvnO2TZBtrNaSGMh2C5Irle/2K6/Y0OF6ABugwz7TD
         JsZwOtKXpcVV117PwEN2e5+Yng+RjUuyWHY421lyOfKYzFdOsTeYmpQQaqy5f62tXA4g
         Qcw2S/1lLfKvH5q2yaL6+ko20GiDX/H/P/7gTsjOAl7MQ1jGtQUxA/4qg1k7QSj+Fugs
         UCuU71qI5HU00OUHecjC9KomnrZcG+mW6A/VAd5YUgEU5fh/B6V5gCCA/H8bwPv1WN2o
         AG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778510181; x=1779114981;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TRmZZoSXD3Wj4LMAwAdt4eJuVkT2JvoyntYmnjZ3hZo=;
        b=IXoUZURIsAGaEOIUVN+CeLRHgP+nElAhfqfaOObVKSmSAu+F9vpStsucAmlPXYA4AD
         uV0MhN4zreV5pyRdaWvHh2l9us3OGg4ySQvH0qq6zgPf29dfjb5GMuIjocWvq26Vmw5l
         xZ6c+RJJVmhUKPNFDk1UqejoQQgXuGC7R+/RcxeNyGfY4uc5n3XhCsJyC3+wkJAH5w/M
         dAcb9x5OkG9r24yFKQOzREIOy8MHOyw2Kiiw1UFZhH7z7xIqvBZ8lL6QM/+iQ74Cbzr7
         azWkb+qrzbYTWbVdqwrzkvona+g3wwtatOeYsT2vu3ehv+aOxoHvK+2uANxpBYDEtxU4
         DRQA==
X-Forwarded-Encrypted: i=1; AFNElJ+x44Mr+oZOvJJGWiCt93ljJ5161XKYvl8ycC6gfoxwhpcnmv3UF6a9S9aGU0WkVyQ4MLq/7TJNbtg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyW0WuOQBXuZgdGV3xV04F2jtPCreZZr37WOd2ZKp27QF/MfzY
	fASiALnLC7Zewpb2ZabXig14ItuU4m5wu2wnug5EPP1jWJWemAITZKtHHz7y9+Jyr3ZKAwVzthc
	44rQQiBVT476RnQSD1h6Tf6BrOQIcqZR4wvURDsLXicRDNG9rH+o1lUg6ijIHgw==
X-Gm-Gg: Acq92OG92mD5KRNTNKvbea4y9orW5iZ9PH0K4piZ1TENmkdvBdgY37HEiJ6ydzdyBhy
	NokCwb7vu7uiXAypE6Ppfr2GeUF54O5/hDznpbWtpJxyzdOchTwvhVPira435Nc0AQRGcg7k/1B
	IL0cAUubICtObi0A5vFLC8JmJ6veAvpej7MWpZwlx1o5LW4rkyAYorhLiknyaDRyuSet4V2Q6Wv
	vtaG4qfHREMcKevvWDngDa8tNfseTqznTJAEhIAhgJ6+FNpEguCnVpyh0uvljpoKHWh75K0PSMV
	/eiRYH/qg8yHqRZovWIihH/TAO4IetUA4CjVHcnMK2UctG60z1154owpqU/R+A3PH3LF/BtziR5
	4J+jr7+Vdldi61jWATWbhcYkb3bEMa5C9lb9QwY8MSTmHjBP2gzNd6Rdu
X-Received: by 2002:a05:620a:298f:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-907bb3e1b6fmr2203931785a.42.1778510180770;
        Mon, 11 May 2026 07:36:20 -0700 (PDT)
X-Received: by 2002:a05:620a:298f:b0:8cf:ed8d:20a3 with SMTP id af79cd13be357-907bb3e1b6fmr2203927285a.42.1778510180315;
        Mon, 11 May 2026 07:36:20 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2cd04c68sm3128259285a.46.2026.05.11.07.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 07:36:19 -0700 (PDT)
Date: Mon, 11 May 2026 10:36:18 -0400
From: Brian Masney <bmasney@redhat.com>
To: a-christidis@ti.com
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <agHpYnkCgGfZp2-E@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, May 07, 2026 at 11:09:34AM -0500, a-christidis@ti.com wrote:
> From: Michael Walle <mwalle@kernel.org>
> 
> The TISCI firmware will return 0 if the clock or consumer is not
> enabled although there is a stored value in the firmware. IOW a call to
> set rate will work but at get rate will always return 0 if the clock is
> disabled.
> The clk framework will try to cache the clock rate when it's requested
> by a consumer. If the clock or consumer is not enabled at that point,
> the cached value is 0, which is wrong. Thus, disable the cache
> altogether.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: Randolph Sapp <rs@ti.com>
> Reviewed-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

