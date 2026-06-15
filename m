Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF7740B6E2
	for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 17:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543895; cv=none; b=ftwzJ3g9KdcZyqk6d2v1TajaVZKALj4CZ7XVTggcOm7WI6xLuMTCgEtD1AhlhnW3WOCIHup4/hoaa5RmZfHpgrQiNkzhEUV9GYVDiNWZtpJ5EOnd4fYvGHBo2G2kJbHYgL2JlI4fSPM8rNA0j5uBM5oYeERr7A/5+eBJQo52uMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543895; c=relaxed/simple;
	bh=6MjK4Ekl6EgbuHurjrLkCh0S8WdwZwdwkLo1uggeUk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WbXQC59ajwd5w6cbzJ2shpwP8YGSvLYEl23g8SB7r4ltf/wZoX5MIVGF5EH3RNuhkmA1xUM03zEg1x9sZXdYBxrrQmbVrqj9jGNjQXSYtDlgobLUOXBn5DZArc5irGW4QnELj6lNxO8ukn3clhugvlR6EWYIuSiXj3zKE81nMOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hjEEIeAe; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YgyBCN8r; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hjEEIeAe";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YgyBCN8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781543891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=;
	b=hjEEIeAeJim4/+7RWdVMN0u9XN07KW8mgqBuEHtQkSO6shWtkvBue+YBmUuBiWIQGC9f8Y
	zMmcjAoKr/cCfHUb3bfbyVE3ULBBHw+H4Mhc8Fe3t8VN4Vj3QckRWmeo/wU8TEgWqCL3wi
	3n2TSRaYTMaHxboQKBK+FZRzN8xODww=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-NCImD9auN8iJmJaWYRGllw-1; Mon, 15 Jun 2026 13:18:10 -0400
X-MC-Unique: NCImD9auN8iJmJaWYRGllw-1
X-Mimecast-MFC-AGG-ID: NCImD9auN8iJmJaWYRGllw_1781543889
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5175b7946d5so29146051cf.0
        for <linux-clk@vger.kernel.org>; Mon, 15 Jun 2026 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781543889; x=1782148689; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=;
        b=YgyBCN8r3zHMlSL/SJ+pyavqbBJ9A1fxcVUkyrUzNxgEn8IoMqas5GxhTlryBLY8W4
         qQR+cwpgqHqPz9EBpOkxH/AvtrJ8OOHvMORiKNJIECXd6HMIFA9uk42cRP7/ybQT6jbh
         hewMQFmSDFE+l68yKEc7C0lbibXaW9Nyo+FMkxSDMvaIMvukFIuT6G/E2i0OA1doBDnW
         Tqvz+rGnOYd8dVHG0sU2spi4/23ZXGKI5xooSjCTXF4VI4ZEseD2VXqmwz8I3FDLcO1e
         7eS41HkBKXfKUns3g72Sf6/VsiRYWXvGFQz1gGjke60gN2ANEhXUd1Bf573GOYWO7Uzt
         TJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543889; x=1782148689;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oZr+ycgvZUilxhhoW/bzv6nOUngq3yd4joV7dFf5q7I=;
        b=gIIHMEFPFUfoljHXGAr5/fdtIth1j8tJOmFYdYU1EPdf1MwKjxcbM52yTqwoX3no+b
         RW9EOuR6pFWbOvCcURT6AYVjcYb0diWotrl08vPPAV0Byw+djU2osBFLH5/S34PirRK5
         kF7YSLzVok9LhK9hXIC9f70tWSvTOaGWHrv85Oxxj8E5utOymia8lay0taGXAivGcF+C
         v2qb9rQ5s/FmDZJEUUg+4y5xrZ8ygisnNTlqP2UrlaxDzE5QT9Wpx8nSMFjgbotEolcJ
         kDxa38pmaLomvjoYrMiDT2g0bFcfM7ZMi23mrDgf4BZYtTtekKxlYzEjWAfsYI8swlJw
         RGZw==
X-Forwarded-Encrypted: i=1; AFNElJ+gRAYaORE84CHveOUaW6OEEwQ4l2UcfCPlPOvmBfSP2bD1TnETYHsEzWmgq/KiEmlKTAfInF0gkC0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi/XhSvxdP1bJhNs9l8XZtxoTgPJEmPecBiMJnkYTWfZqV5W1+
	zRMVGth5PHs7mdLHVV7OdnSB7zUscCip2kcbFN3WeJGImndg1N6zojH0hjrYzuGYMmhyhIENWAR
	gnhA4UD3CCamLMyicz/r+/BDdzwjUDkv/aTSxB8tsZm+1Mrcq92jvnf8gNhM+dw==
X-Gm-Gg: Acq92OFBdMwCaeUNL3hCszuxr7ct/mZEKN0e4ASzMnNtdJtOUKKKGycNatsceEBUO9H
	xHZ2o/I2of6u/GG3d/U7KlpELQ+WwwSAywMtrekXO4XM8DtALdvVtfkQWpXtNbCinw2aD3gAhj+
	WdB7RW6DFFDqm+nBM1XRynqg4lnYJR0+SzDeWSgUwMoYUoIjEQbKHrcDH58yr5XeDjqhyOm0tvZ
	mTECBjXz47salMf7Tk1H/iZD2Ykq4bkM2MOPpkOPDRjPohGnOSo3zyK343z++9gYcPm45fBu3/v
	eYY62M1ZerMvkNdhW6KxRIMuEqCbhrx3fc2qIWFLFfhXryD/qBuaU13wMdt4hL6gqGdYOQv0eiX
	Opqu4Ltt5/tL/FBUjFp/VKV3sJCRZxwKVDArDqtv9kiFO5WYJI5IxKlZe
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr224740401cf.16.1781543889124;
        Mon, 15 Jun 2026 10:18:09 -0700 (PDT)
X-Received: by 2002:ac8:5e11:0:b0:517:9206:10fd with SMTP id d75a77b69052e-517fe4f99aemr224739901cf.16.1781543888617;
        Mon, 15 Jun 2026 10:18:08 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb7a2227sm111888521cf.16.2026.06.15.10.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:18:07 -0700 (PDT)
Date: Mon, 15 Jun 2026 13:18:05 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajAzzZQijess8tZf@redhat.com>
References: <20260604025115.3763823-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604025115.3763823-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Thu, Jun 04, 2026 at 02:51:15AM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Add the missing clk_put() after the name has been extracted and
> before returning on error to fix the leak.
> 
> Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

This calls:

                parent = of_clk_get(np, cluster_index);
                if (IS_ERR(parent)) {
			...
                }
                parent_name =  __clk_get_name(parent);

Can this all be replaced with a call to of_clk_get_parent_name() ?

Brian

