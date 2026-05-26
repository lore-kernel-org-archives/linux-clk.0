Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF9B40DFD1
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 17:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779816810; cv=none; b=BrkLZilNISgprJeY+NJBtJp2fMeXI1AAs0fRDPraNWkKr3fE12K36YqIZ0GlreqFQUAjabwAt0epUX52wsaSxhSlwQYlHrvFC9HHf9xnxfzd85MZG0foUti2JcoTgQLIRsxMQeDBAlYnDMu/Y0vfiZ62WKeAjQvHE/t++lvkWSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779816810; c=relaxed/simple;
	bh=LW6TETeHjL+fglhVxCHaKVxVSS3JRAg/Qi2e9zqaEzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hmBM8LdlJCU1S9ALwGPXe4m8NOXJwlOgoJgK2DskeY2HB1BLIHYWZ5NE36itpNzh85jF8dowfnBfwOh6xwWIU1m00dYunrR+zgTvrfU/jh1Annp/ZM40v5UiwgPREAz9rplpLdR7xTvaeGTvQjFulUoS2X9nMYUtrky4TqA5Pgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a1wX8yio; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=sBn7yYTF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a1wX8yio";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="sBn7yYTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779816808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HrMGWUD7bN1xTbHsv/rQIrdvT4St0f/kcy/BRJit+uc=;
	b=a1wX8yio+rD9N0jwj2NJY1fPB0y/MssOzfWOBP6P8iXhrcZF4TgWr8hlmo6E9BFg5Fmk6N
	cUlZVfjXrrKPWNFiURVtOf6bDAsY4zDVeZ4VqPFAZ+aNwtaX+ixZ6wVx814EUSjF30hup0
	FCNYaRKFLo+ul+Pfer9zr9sKKHIoSrA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-315-64M3ZbhCPUaLwhQCHBaNig-1; Tue, 26 May 2026 13:33:25 -0400
X-MC-Unique: 64M3ZbhCPUaLwhQCHBaNig-1
X-Mimecast-MFC-AGG-ID: 64M3ZbhCPUaLwhQCHBaNig_1779816805
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-516dd6e4ed4so88552561cf.0
        for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779816805; x=1780421605; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrMGWUD7bN1xTbHsv/rQIrdvT4St0f/kcy/BRJit+uc=;
        b=sBn7yYTFoxfR1S3/kQkIjKca7GuBFHfYGFycKNfzFvJ3Qogc0ECHeRzXbKWaTp8vo4
         y/R+klz1z+7gQxS62/H6jRsgmKKaYJMeVVcpjH0A8RPNdEMkai2qyPTDfP0kIWOX9QMp
         /Dwgv7f6UH3fU/ffO6pwjurBZjPtuJnWPer6kN/tFeV7sGNpgKcR+xrclysZN+IzK5S5
         OHwMba3wiFSGoCvgDyYMonbPrN4UVYphUADF62F/qWxqTivcdyn57+vvx2V60Mrqsszu
         81t7BmL/XsdtoEV4rd8vcCCD8dABdrIhG4RqiDd+M+Iobj0978Gr7UO6BXrWaaebNgAw
         C2uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779816805; x=1780421605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HrMGWUD7bN1xTbHsv/rQIrdvT4St0f/kcy/BRJit+uc=;
        b=b+FZmxD4UvvqK2SXGOStv/UcxtKSeKgDacmjs1vopmvTsvli9LydJyjFEcsqz9cyh3
         xfqRbkf8U70YSjJ96D1puGSBS1yBUPzf9vzqx+K83lyFBUnbXskqksxk/Kj63zsKvQ6C
         JlK3pWiTXQNuq2e4og4gAm/bkosoReJwsRjg5cNuTobqSUBOAWbTIPcBQKD+l7a69DAm
         2IjtjnP+no8MMnhXfGtTJo/6fgSVxd3Obx51JYJbwPGzNhBZPnxhzGAVDw2DiY7X4XRZ
         whZZY5PUBUDmJjPCg1/YYAEhgmz9530ggQE6Kbu6o5yntGpeXECuAFWcoe+97mSkk0uz
         AnwA==
X-Forwarded-Encrypted: i=1; AFNElJ9praG1XXkA34TDc2vGJERqWW3kWXY+xszoYv4fleHZQgnpPpYtMPOrGo4P8mg2cR0QW3FEoMhgHgM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMSV3sTZnShEPl0V82PLvSjWvp22f9MBgZ5/N4i6H2ggldR2FW
	/zsb9/jgzMvEMkYHoInTAqNXUvWtGGMyRIHFWAmSAQ9pSollAKi/O1+x2ONzd17z1Dk7fGsSrXT
	HcA4YiSXJ1hBhbRraZJTQFeYx3ttC1b5fOnWwZjM2LVYYOx4E5mrloKkI+7wf2g==
X-Gm-Gg: Acq92OEEnUZ/IhDCzeNwmfWxSmEMBmA4GeHvTee9/emIaHeUJs9K1WKJjc/lPHGLKVo
	yAw7DlsLEmy+l7v/Q5dzlF0oVR7PZGpk1U5qlhxDpTrk5hbHbpcPhyGBe2ONJD7tEKfJBUmGhRa
	HP959pfYztVnxJFR+YlU6KC4+jNFTdDWWxT1Z9rBe5LCQXBKZDqb+I8cdZmKybNArGCFqrFG1+e
	3NLS0cXae8zZ/5iZE4jNLeRF7cRxe92yZ5gegj5t5+mxzEcOcFbjdDmxdtAyXGReXFLgjEXfYpF
	wxNbyYMyU6PG9f4GrpA/0PlfYUYtR2tS0Ko1HXAevfWrrPUv0aUM4+wFFnBQC2wgE82N0tc+V47
	EgmqXq2wXkBBDsNxulEa5wjkRVv1+uYwW1ecO5wLUJQWRbd2vbbC9XbSt
X-Received: by 2002:a05:622a:1493:b0:516:e7ca:bcdf with SMTP id d75a77b69052e-516e7cad800mr171439751cf.31.1779816804921;
        Tue, 26 May 2026 10:33:24 -0700 (PDT)
X-Received: by 2002:a05:622a:1493:b0:516:e7ca:bcdf with SMTP id d75a77b69052e-516e7cad800mr171439071cf.31.1779816804332;
        Tue, 26 May 2026 10:33:24 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc80ded529sm147182776d6.16.2026.05.26.10.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 10:33:23 -0700 (PDT)
Date: Tue, 26 May 2026 13:33:22 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: fix krealloc() memory leak
Message-ID: <ahXZYtZM3KrF3hgn@redhat.com>
References: <20260526061321.6123-1-grandmaster@al2klimov.de>
 <20260526061321.6123-2-grandmaster@al2klimov.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526061321.6123-2-grandmaster@al2klimov.de>
User-Agent: Mutt/2.3.1 (2026-03-20)

On Tue, May 26, 2026 at 08:13:13AM +0200, Alexander A. Klimov wrote:
> Don't just overwrite the original pointer passed to krealloc()
> with its return value without checking latter:
> 
>     MEM = krealloc(MEM, SZ, GFP);
> 
> If krealloc() returns NULL, that erases the pointer
> to the still allocated memory, hence leaks this memory.
> Instead, use a temporary variable, check it's not NULL
> and only then assign it to the original pointer:
> 
>     TMP = krealloc(MEM, SZ, GFP);
>     if (!TMP) return;
>     MEM = TMP;
> 
> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>

Reviewed-by: Brian Masney <bmasney@redhat.com>

