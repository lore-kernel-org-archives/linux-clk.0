Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50167266EE9
	for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 13:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149319; cv=none; b=ngXcEAPKdBiDAfxplCit1o+O0UpOmyndWRfATeI8qWrZYTi1PTAXCkpfCOgyTBU/t2f8CPA1teyJgWVdy7HzuCR7sZPwx2iUwB1pJIiZ+6VB0H2+bU/adPRMXclBh2ykXkXs9CAM/Uf9tt57YzXg4lirLqVLSW8HKuEQng4OM0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149319; c=relaxed/simple;
	bh=zNHfwDC4l3QVR89PPP2y9fOs5yomHUkQHr7TxNStnoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VLIlwLFCiiFMrGKV1Vq+ZowcIil5waTijhI3tdc/yK1TNxwCq7ECHXQEa6x/+yiNHQX/OD3BII+ZuacmPp5P+MhIJFs+UaMUJUyskIpAuhUjF7mMlfdyRirFr0qGzuHDFCx1EY/+QndjOhON9vKdu3ZGF/km7l+phA+JydXJsbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gommcZyj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ExEnP/VP; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gommcZyj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ExEnP/VP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773149317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=;
	b=gommcZyj8EuDFGitsO4n4v0LjalzXqKqXKIasViRevNrfXxugcQQ79fyhSL8yLIfssZeyC
	qww+ZCFP2muhJBA6L0uYjWfyXlejYltq3VHqkq1yKQdbeNWTMr4vR4OhheuNodvoj21E0R
	0/RPbvStEoDa/4yN3aj8daEetylqOn8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-SkVQVZ85MFq9lTDoi4s4NA-1; Tue, 10 Mar 2026 09:28:36 -0400
X-MC-Unique: SkVQVZ85MFq9lTDoi4s4NA-1
X-Mimecast-MFC-AGG-ID: SkVQVZ85MFq9lTDoi4s4NA_1773149316
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0258c5e5so144230376d6.3
        for <linux-clk@vger.kernel.org>; Tue, 10 Mar 2026 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773149316; x=1773754116; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=;
        b=ExEnP/VPDMFzu1Jh6LWS3sJO0jCBP2d+A2quct/zKCHdaI5z1Pe49Iu5RlObtJu9oV
         mc9Gr8rlevkXIn/xP4cwRKKMGN9EBBMNE2hBx97TBpHdgRsAka2W61bwdWp9LzKqIrsf
         be+FLOkGZK5rjhcokShtGJHMxYxGlYAcQdByN1cZIdpbQZl52NhSCh1kORBOxJEeULIZ
         iMS1hOdFHOPuKf2u7ktnp4+hhNTeoSqMRoga+L3KdIrWtdXWswSVmAjHSQyq86LIvH5E
         jOLoedzPwIVhHgrXeYx9Oehy6tkz3uV2sMbjSOu49XQxIUk70v2tnDFn50o6mmqiPXes
         KItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149316; x=1773754116;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VcGwuo35RKK8ljJatS1Nd7WDDHQVev0Yemy6C4hCd2w=;
        b=daORszKp3DAwTW6xN0FWVkdvRwjlOKMonLT04JpOiMO2B2GRcpeOiYcg+5ChIUt6Kv
         HOzFrVoNGj9rgIKOHcVNSxOUj+coNnpJNcgElMx4RcMTGb6ftB6kIJWNbDPUt6Cmlv+C
         IVG/iozVccZQXxEIw+NDjWCwNSZv0TGxB7HwJ9UqstxKmwIzz5cJihibCcgbWw+9ZxyD
         tfmKtbxDXqgc6MRjpAR/GKxknvoS8O5f3IXvi7BGjeyRg00aVWWcJkvRvJH7YGkUsO9b
         OSquj9a/b/IOhzCj1YIsdY98WGsUkjzM0ccQIgVZPEbvpSwZukpd5yJMliuXbT/hVmtn
         5crg==
X-Gm-Message-State: AOJu0Yxc5yJyog2V5ySY8UcHYFDRUbSYCunvqCB00ENM11097lH3L+6T
	Kz3BW3mCi3GWvWeACXZEYTWzTYe5zBXOErfHB1FbOyl7XhYNDGJei21Low2brwNx7qQjoD92Z1y
	Rby0dNPhgJPilUyWxZ4J/0oRfonVmZ9ivNhrIrRvCF+2DbFySxyhmSzyoEsjgpg==
X-Gm-Gg: ATEYQzyUIS8ru/lJWm6bvIC39F/aQVrSXqbtd8rzn4jfiXtDAfCOcY2QXSseo3Z8skp
	J5MrwhyKbFOyOqBFWDXgaKhD1vEKetrmnZEn5Rx9lknDOL0TzfF+sP3edXqcAwFuShE5yH0o2sd
	7ynvcrPKAk6ckpuMHerx8hlf7/L8/QeVnGo6nYZ5f8hTLxal3nWZhFABMu0W6iYaE2WylCe8t8F
	wQva9XMOHDmtgIMZAtWzya0UCltr0vwtG8wLoiev9lzZNp2/SLhqAgUNrb38EtZhQtVIwEyc7eE
	Bd+XHSazeC9S8faekfNPVQHPqbI9vlOKL07kD5sRo4AdP6BhpBy1yHf6k8EvdMwbw8NLEMeFt4U
	6jeKEHeZksQwtUThDpmIvy2svx93sBoNaEjwBv0yb0HpfevoOs2XVTvxi
X-Received: by 2002:a05:6214:400d:b0:89a:ff2:b8da with SMTP id 6a1803df08f44-89a30acb81bmr214491616d6.47.1773149315801;
        Tue, 10 Mar 2026 06:28:35 -0700 (PDT)
X-Received: by 2002:a05:6214:400d:b0:89a:ff2:b8da with SMTP id 6a1803df08f44-89a30acb81bmr214491196d6.47.1773149315391;
        Tue, 10 Mar 2026 06:28:35 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a57a4b079sm18433156d6.20.2026.03.10.06.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 06:28:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 09:28:30 -0400
From: Brian Masney <bmasney@redhat.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	sebastian.hesselbarth@gmail.com, gregory.clement@bootlin.co,
	andrew@lunn.c, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in
 structure init
Message-ID: <abAcfphl-aakfcf5@redhat.com>
References: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Mar 10, 2026 at 12:36:25PM +0000, Ben Dooks wrote:
> There are a number of casts to "void __iomem *" in the initialsation
> of the driver's clk information. Fix this by adding a helper macro
> for the cast.
> 
> Silences a number of sparse warnings:
> 
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg1
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] __iomem *reg2
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] __iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
> ...
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Reviewed-by: Brian Masney <bmasney@redhat.com>

