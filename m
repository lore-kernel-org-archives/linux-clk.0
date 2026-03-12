Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E677D39A06C
	for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 19:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342309; cv=none; b=SPslsBF5G+CXxFPLz7q34GQplzJEIBhUVkyvoaDXqce425HFieku+IfqgPgaiOMrWjC6l9J+UnQTTUIpjIofG7po+7PYJ4Gg5GGxtP98dO0LFmFJD//F7q5dQT6eyoQLOdMFkCCjbc+pLi/U7cfhKjg0lnc/FKEbolUMfY8bQEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342309; c=relaxed/simple;
	bh=gRz5kv+ZQGoeaBp3JZPi0keg8FC++izwtJHUj7bGlzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yptv4RiNMk3fBhvqyxs017VlurjlPniTOpntUZg90886vVWWKQ0IgPfYlYnhZ8E8cZkBydYLnvNFbxEociyQ6U1RbjqcbXIpWEgXEdHYbVaasieIJGGKwgpcSSMCQv0tHiwKnSR8886T4/+rmOetHMG77e93x0O99LpOWPeDNWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=S9HPDKyM; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=b7U648rh; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="S9HPDKyM";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="b7U648rh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1773342306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
	b=S9HPDKyM79avo61mVQ1m8oe1WgYvF2fJrnAcyNnRf5/05vUa2U8OVHv7rJ5roEHHzaxilz
	quhdbGWw8gaNwpn6IzByGKEXFKoRJzNPjHAoLOD2augzM+pFnAWGH7QOft6gBEFWGoEwBc
	DqHk8oxhuwkAaL0hDSNZC8Nvox4yM5w=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-WJyIGR1YMGetsLjFP288-g-1; Thu, 12 Mar 2026 15:05:03 -0400
X-MC-Unique: WJyIGR1YMGetsLjFP288-g-1
X-Mimecast-MFC-AGG-ID: WJyIGR1YMGetsLjFP288-g_1773342303
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7d66afceso865685685a.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Mar 2026 12:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1773342303; x=1773947103; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
        b=b7U648rh3RlhlQp+2AlnKUt+gm5LxwFO3wWKD7jb1DtCe1hzRX8dlaX9sPfqi4VeDv
         a0/PUdNOTZ4bhbnJwSQa21ObeTxnpuZrKycDYi10Awo2dMJH17mbiqEfNoo+kjZtv91T
         Ff7iTJ4h/ECofZnKOv+BNebcSp8jQOlsqt9yOI6VZRqeHuH7hoLG8DGdOlB1bEup7F8n
         lf/QsexdmRsnTHPW4MtnenBzZFyGmUIO6CFqNgDSqQzWnEv/npEj6xMBSIjJ/Mspvn0x
         0Y7J9c7P8o5LRVg00vP6M7qRGCJ+J9WGqyWJZVBU4CnHsvErKc+1oT6wgas+lpWE7koz
         cySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342303; x=1773947103;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AlGHEWxU5rIBCwzyS3n9Fsdg8fqOw24aBbYZdNgyOtE=;
        b=IligjgPNQr5LzzlucpwypzIrh6Sg+joiV4zaeVqxtSSzDT9vBf/OuOpADfTAZDwhvT
         LxX23jphxEQ4OTT5KvCi0RsywjJ6zfmo9XB+wDMtRq3S75/Z2uv6P19AuQhWpfe2g/K4
         m5n+RS63TteUuYRf97KChv4PPolnQU0SI3B0ifk2P1tNVgtYhc+bIN6d0y/vSXqNCkze
         netjj2Y6e/t3uojZQwxztaf/Vc4W6GbEkJ9Gdij2aF4Ro6VDL1nB3Xc1zk/CDP4adqQn
         q6tzAvkEmRhspJDFLNOaxZbHSbr87DcbpO2uKLnbbaTEWHUO59f37tcox9w1rglWJBBB
         Inbw==
X-Gm-Message-State: AOJu0Yw9t8D0X8zUllVz5m70HB4m84juW1wPVhCA4OWVvMNI2HJjzKu6
	Rmr7bwo3tmFAnXTd5yDmiqZANwXLhJAsH3VfEAHStoDJGMcrShpoR+NuwL5B1tvSVYAAER/lfph
	vVaYIdiyVfmeKz4+OOfDK9eUt9wYcNd9fqQayT+yTKl4s68fn6jAS6iErvrMmZg==
X-Gm-Gg: ATEYQzz0x3ffkkWmbrmh4kH37iQjI2hZY2u6Z97PxGmT/7pW+t7jJmlGht5KILyl7Bn
	8TsY4GlQekj4NYQ4iRydgcE0NAAvg4xUtVAXNfyGM3wUL4bXxZadW/w6+874C2j/StJYGxLKsV3
	SfKGhVHnPBRjpVtN+5l4fMD6bI9DfYyfTV8wyRNJa2hgN12fNf+U7T/JE4LmvpVnipd/H+9D16l
	niWoqU9zKrPpl+agRZasBlQXt5Mk2mG3sLcnX8KcO7LLraiMOtvR29GxPZeflEAWyd3ErccavRP
	zn+R0LQ7/nTaJOR/eZ9XeornPTSFkyQAryU76Hu4rDjCMgv1gemkb3T6+yZWEuPDXqCm2wTWMTl
	ziqDOaorTUU4CRQVk1TNeEPt44dMRARrsqPWFFJIjv1bQS3849Zx375jN
X-Received: by 2002:a05:620a:468c:b0:8cd:8fc7:8308 with SMTP id af79cd13be357-8cdb5baaa87mr107675485a.75.1773342303005;
        Thu, 12 Mar 2026 12:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8cd:8fc7:8308 with SMTP id af79cd13be357-8cdb5baaa87mr107669385a.75.1773342302313;
        Thu, 12 Mar 2026 12:05:02 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65bd54f9sm41198836d6.6.2026.03.12.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 12:05:01 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:04:59 -0400
From: Brian Masney <bmasney@redhat.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
	naseefkm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: airoha: Add econet EN751221 clock/reset support
 to en7523-scu
Message-ID: <abMOW9N-qWqqbmYD@redhat.com>
References: <20260312162449.569359-1-cjd@cjdns.fr>
 <20260312162449.569359-3-cjd@cjdns.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312162449.569359-3-cjd@cjdns.fr>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Mar 12, 2026 at 04:24:49PM +0000, Caleb James DeLisle wrote:
> EcoNet EN751221 clock/reset driver is significantly similar to the
> EN7523 / EN7581, however the EN751221 does not have a neat batch of clock
> divider registers so there are fewer known clocks, and the frequency of
> each clock is derived differently. This clock driver will probably work
> correctly on EN751627, EN7528, and EN7580.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

Reviewed-by: Brian Masney <bmasney@redhat.com>

