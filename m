Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD282344D88
	for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 19:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781637735; cv=none; b=kc7kwpVLoOTSgSGs7CYbExAr0X3RHPTRbDAMzTIGHRTCQzC/Be6JDULmcnG6WmhDcrIwjw5o8aOTdf0LxUKO3UA04hxJNUQ1lUX5VoFQKdFS/9Qaiv+pOus/ze/o/+ZRn8fBP8PwxmWm3wjC5Vk8QSUCzbshAggQ9Qv0Q07yZGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781637735; c=relaxed/simple;
	bh=NVM1Rubw7YZ9XU2iZhNrjdu8qkSccQVCtMAZO7mjpeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2xDjhjQomEmQEW/UyWew10ALr1c/0BJsqE42u5bAMVGGhZTe5IbB2VFOgapPhobtfUbTqMJV/8mPwuz/qNCFGAboFCrtR74lbV5MgmU6m1xCByJJhlwVT6hbZxb/0Kw8p+SFR1Im2xJHccB6qd2uhd2YBtVlRPpuv6KVWlDsFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OWt8kZTF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=jkUHEHv4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OWt8kZTF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="jkUHEHv4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781637732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=;
	b=OWt8kZTFUc0p0FrIsL+1YITp7joNoKajE9f7Y08iUvzZ51TKNinPiADAlYfRUZHJihHi1p
	yfmp4oeS3lVBLSV6x2PKdX79RG1miU5STUS9i8sdxrXJIj489gqSHjW01mwrPg4y6uln3G
	ZydXhWDB/sFZhmEx80UCLE7xn+Rm1TU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-fTi3_E-WOu6ARYcBmq51ZA-1; Tue, 16 Jun 2026 15:22:11 -0400
X-MC-Unique: fTi3_E-WOu6ARYcBmq51ZA-1
X-Mimecast-MFC-AGG-ID: fTi3_E-WOu6ARYcBmq51ZA_1781637731
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517e0cdf99fso129649931cf.2
        for <linux-clk@vger.kernel.org>; Tue, 16 Jun 2026 12:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1781637731; x=1782242531; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=;
        b=jkUHEHv4ZrcjhawT62mbHILLluURkLmuAZTPbCB3W9raJH3g1X9/J6/ezU+capqwWZ
         BfFPGZJiOOwYQr+L0BtreN0bjmo4C8cqvp7nJJ4JkJIabNq3+Ha3TTvgGWWuA3CW/Jfb
         JDhWTHsdWu+w8HA0Td/EWppPTLfMrAQTcfRx8bHHhKFX76FHmIBIHY+mXolcHwJV5+oa
         JlYK10i+rgMnyCRLk7hvWJBnf0S59n9FsVWIJYZtQCsl8fb2Wu9LcGw/gmxsaeyHPhYq
         eeeaezEZxmN3EptLgrHI/S8mv/X8HPrc/E1Plv4OXSLjC4Bu1mGOL/gV5q1QGdhpIloi
         S2Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781637731; x=1782242531;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=icHrK2aTsAoupO6HF7R3pIp5ly1Gmg7Tm5VKudfF+po=;
        b=ZTqmW4OnYO9rYKOgniDVxtP8cw/zeGJSqHrOVGc8agB3pr4qm4lH4TNx7M50gxZI2D
         Z4vjAhEc5n3BkKxkK0NGBvqM+g0XQvedBXxNDHBTnR4/g0BeJ2vEE+rMkvW5Y8+zxdFx
         VDFkEyT83+Y+U6JZ7OJgnfydk0bq9pmZmAQtr8LTvtkEnkjOu36FtMJFuqzzISUTOD/h
         NfDw4vbJ6Yr8QH+Ntvc8vYDlCzgXTaArBgEVF8GNvXlaj9vDcH+SAXUdtJG4UMmqlS+n
         8TgdhtnvgmTyqw9q02mjGBuLcOKskaGXDUeAGYlI96/crkLDrgkvQEYcavW4p2Uh6SDN
         SOiw==
X-Forwarded-Encrypted: i=1; AFNElJ/SagCHrXH95QzQt14ydzI1m0dySgO3bNmhJZqJyX+rk+aGd6xxopAGrSb5OZhebyCxW7tmf73JAkw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzS98Teg+wJEWfJ77zYZaVJZBWPxdg0ZrDvYVX05oQLzsoJDha
	AcN65KYT5noobQsbcGIUjjU3bZez59x5m39/Q4Lim32BNL0hZppG3YoC9/ZXkBUX7yC0E2R9tNC
	sR277S3jpe5/EmEsNWTpab5eM7ryRcUM1iD4ZPEtTS46F8U69zSVavCf/XqSDQg==
X-Gm-Gg: Acq92OFupoEx3Hfat0lDDYC2xm/Tj5/9swGrw117bIL8jQOcjFjSRuK7B+YWwasiCdR
	xt21WRtj/fxy+U10jWgnjCu6aE/Zoxm1LmnXp2O/JFVqyRp1O6MWdFsAjagi0roNBxvJuqeofaC
	1ZC55waZryNWEDIMYG7YbiSHC3x4js8amLxassaWewihsSZxXzAZUcAWPHRe1dpkW3w1rUokKf4
	qxmgKkad46mjoeFZNmiygoTIkifJwquV6MZO86QbKq8LIllrtMV9tiGErcyk6wiLeNOtQ9ZMykU
	mtiYsn2UwKKXJXMpfxhbpCxNCaxdMxHBdR2XN4tkykD7SRCBCvXFa/DjTMa3JyZnk0SPMZkIekc
	yRiHtJH088UAtwPpub5mV
X-Received: by 2002:a05:622a:8cd:b0:517:6afc:b644 with SMTP id d75a77b69052e-519a8fffa38mr13241561cf.47.1781637730987;
        Tue, 16 Jun 2026 12:22:10 -0700 (PDT)
X-Received: by 2002:a05:622a:8cd:b0:517:6afc:b644 with SMTP id d75a77b69052e-519a8fffa38mr13240961cf.47.1781637730415;
        Tue, 16 Jun 2026 12:22:10 -0700 (PDT)
Received: from redhat.com ([2600:382:8500:43e0:4da9:d4f1:1887:ec76])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-517fb79df4dsm147042751cf.15.2026.06.16.12.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:22:09 -0700 (PDT)
Date: Tue, 16 Jun 2026 15:22:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: andrew@lunn.ch, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: mvebu: ap-cpu: fix missing clk_put() in
 ap_cpu_clock_probe()
Message-ID: <ajGiX4JoGXaMu_-w@redhat.com>
References: <20260616122936.1669366-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616122936.1669366-1-vulab@iscas.ac.cn>
User-Agent: Mutt/2.3.1 (2026-03-20)

Hi Wentao,

On Tue, Jun 16, 2026 at 12:29:36PM +0000, Wentao Liang wrote:
> The function ap_cpu_clock_probe() calls of_clk_get() to obtain a
> reference to the parent clock for each CPU cluster, but it never
> releases it with clk_put().  The returned clk is used only to read
> the parent's name via __clk_get_name(), and the reference is leaked
> on every successful cluster initialization as well as on the error
> path when devm_clk_hw_register() fails.
> 
> Rather than adding clk_put() calls, replace the of_clk_get() +
> __clk_get_name() pattern with of_clk_get_parent_name(), which is
> the intended API for this use case and handles the reference
> counting internally.  This matches the pattern already used by the
> sibling drivers clk-cpu.c and clk-corediv.c.
> 
> Fixes: af9617b419f7 ("clk: mvebu: ap-cpu-clk: Fix a memory leak in error handling paths")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>

The Fixes commit you listed missed this, and yes it should have been
fixed there as well, however the Fixes tag needs to point to the commit
where the leak was first introduced. In this case, it is:

Fixes: f756e362d9384 ("clk: mvebu: add CPU clock driver for Armada 7K/8K")

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

