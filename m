Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F483264DF
	for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 15:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777302542; cv=none; b=VDspEDMKQriZGbSw7NvvSVmmssUpzAihb63AiscgHRlTCNCpqnLEgdfTCB9XvMZmMD9PSzcqcfuBCKOXkKl6J3a2qdJIotPqzN5ivFVXu8rMQ7H0yUdPr2/LV/Uu79G8U1cq51GwFG5HIYWi6Sf+8W30xLnNKd6H+R5Chq6BBWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777302542; c=relaxed/simple;
	bh=vGoqpYsAuXX2YViaFXNSmJkMPJ4Te1OdtWWNLAAmBPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qg7GW8J9qiJ6/9BogTktgi1AJ/xNjntRASnSDgTjcJysUhKzP1CXAepMZr5QhZdf9wFIt9ZphTFEedIhkjbQ3mhxxVS0d6F1uT5ylH/FFwUkpOYIuKHPXyRKHDI46HqFJphBaJgKnIJjC9aIBzE5dOTi2owrU8luW/zpLzDMQCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFTUS/ua; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=SUs0UgEn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFTUS/ua";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="SUs0UgEn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777302538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=;
	b=UFTUS/uawiIE7wZmMdL7P9l+DHBE/49WX8t8gtKugGBHKbnT+ATrEHDE1jzM8v5OOnx/J8
	l9BhXbJoHrdXml4jvA/TcGHOQ/dZv4P/D0c2GhgSNTj+G/gHBdhNHhXQU1XTAMPxVgDVLy
	YKEvb6TQcTUzBkQC6AvwHNbEjBOzXuI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-393-xjDn05ONMomqjsd10uX5qw-1; Mon, 27 Apr 2026 11:08:57 -0400
X-MC-Unique: xjDn05ONMomqjsd10uX5qw-1
X-Mimecast-MFC-AGG-ID: xjDn05ONMomqjsd10uX5qw_1777302537
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8eb04352972so558169885a.2
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2026 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777302537; x=1777907337; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=;
        b=SUs0UgEno+jsouQ1wPucQOTs1N8R99a6gjQyTCHYIkMeIsfmFKUHrBR5ycv1MAu/ix
         9MHrgq9MgWRH3db661P6yXoYjkd+3eO11ThSUkggxtsS3KfwlBbCMPIiZZrDnY25mOgN
         zlRrAKZhAwVg7XpT6jOVRkn1cDiF+XPfdb0jyE5Npdf4bZkc+kxdzEQmRVxjHHi9IAE7
         ERo8wfIPFd+5QrpMcVXAiEyyyKC7uArh05TRHIy4pJ2MPysC3amVFNX5Stcn6PBP7J/5
         IqhyoLqNPHbq+gwl98C8tSFnptY9t8ixC6kEeLsfI407r0jfrxCXpCtZg5rLn3r7ZgRO
         rWuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777302537; x=1777907337;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OnpbmYP+E5sjgzH6AGREzKKSS//r7A74prqftlk3Nj8=;
        b=P24NvjfcOFKWGucxF+ywKEFmdQwrMD4LoopCHcs4HydtZnnfz+qxU6JPVih0Jie+9o
         AoFllM9cQaw6ppa/k/mETgaJk09NgVYMCcx9BWhcgIkaUGMkEBsvpwNySlZ4ViDcs+3D
         sVtqjqNZLUbTzz4KkJKu8SEDFAOgLpSpQC/t57HtUKrbpCROyJRewwfNbDzzBOY7X3rF
         4CxT61O9UMs0yig9a6aZJVoMHE4fuLCbqwh4ngae025BI1FT4WsIo1/nuI1UDJjtGT7x
         O2LHRHGcZ+WpsZTQJS44DSh9Rm3L8rWAfQ9u1xTaPL7lVRyF0UPWSZbcItEvQXHwdglh
         df+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/g7S+L5ZjnwSQkpzNf6bHJc0cXF0nzMp9ybJDy7L5orxM4g0lYWS7qFs2+WPuNEkV9UekCje6v8qM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJygBisgcM3UJ9wgbOAnGrRiR+kzXnLmEQPvVrHvr3s8U8Qgoq
	N8+iM8p+6+8jthWJTDFWzulEVP5Wbn35bm0zdRRL7cilTCtgdUqiFk2Yr/MGyK35fJe7075q9yw
	FWlrNMQEn3zrYAgZVPYjaS72rOFxFIgbT+DisYeT0CAtir4sKVWjHpV1E73jLFQ==
X-Gm-Gg: AeBDievT3aL4YwjUpOVYb9LVD+ioGnYbjVC5jW7h5pxhPD4nBlItAXJ3QkJpOU1AvxB
	RhUC5QZUICMwZQPKKAu1KjpPjocUOyZ/3uoPOZDyqpxd/co62cnZZpcQ7vWHKqcUpimNa8xhe5n
	8SLJzViSvlu2qYti2LqTh40+qbECD4LJ5lHxfTOboyqfZ887xhU1N+myaWlpSsEqUvlSt15L2eK
	kNirjjSHI1JExjrlTiACtPt9uYYgDOPJu7+53Vo+4WbiYRdpC3LNYSztkDBsYigp8oHXWj6z1DD
	w3pbGToqXAleap9meNc/yNWtdcqR36/ApF3f6Ix6n/Y6e4yUHy+NNXSPoWNJI39ZfbEtXpUfHoB
	ogPeAKcVK7Ny6dAKViZLXYZv8grLEaVV9f7zCtzDk5I8xnoqsnuuPAlEudssTdeBY1ns=
X-Received: by 2002:a05:620a:4402:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f244704843mr2109708385a.20.1777302536977;
        Mon, 27 Apr 2026 08:08:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:8f2:4470:4796 with SMTP id af79cd13be357-8f244704843mr2109700085a.20.1777302536186;
        Mon, 27 Apr 2026 08:08:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d98c15a9sm3012370985a.43.2026.04.27.08.08.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:08:55 -0700 (PDT)
Date: Mon, 27 Apr 2026 11:08:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Thomas Richard (TI)" <thomas.richard@bootlin.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	richard.genoud@bootlin.com, Udit Kumar <u-kumar1@ti.com>,
	Abhash Kumar <a-kumar2@ti.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
	Kendall Willis <k-willis@ti.com>
Subject: Re: [PATCH v6 3/4] clk: keystone: sci-clk: add restore_context()
 operation
Message-ID: <ae98BRZXD8jzFjgv@redhat.com>
References: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-0-72c6468cb2ab@bootlin.com>
 <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260427-ti-sci-jacinto-s2r-restore-irq-v6-3-72c6468cb2ab@bootlin.com>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Mon, Apr 27, 2026 at 02:21:36PM +0200, Thomas Richard (TI) wrote:
> Implement the restore_context() operation to restore the clock rate and the
> clock parent state. The clock rate is saved in sci_clk struct during
> set_rate() and recalc_rate() operations. The parent index is saved in
> sci_clk struct during set_parent() operation. During clock registration,
> the core retrieves each clock’s parent using get_parent() operation to
> ensure the internal clock tree reflects the actual hardware state,
> including any configurations made by the bootloader. So we also save the
> parent index in get_parent().
> 
> Reviewed-by: Dhruva Gole <d-gole@ti.com>
> Reviewed-by: Kendall Willis <k-willis@ti.com>
> Signed-off-by: Thomas Richard (TI) <thomas.richard@bootlin.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

