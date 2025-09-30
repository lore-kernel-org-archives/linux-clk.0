Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972C4220687
	for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 10:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759227785; cv=none; b=GO2oLF+CkqhoFXd5L0FdXoKcpDrfQfjplSqR2iPaMuZ3Plz5j97N2w6OuRVtGIazuKMVj20aAoi/v9NRGKpCqgEgbMG0S62jGEwNcgmKGJnz89rkFSrdcso+6rde20fc1qkomK6UagHE7FGBtNB4V38Yd88zXt94NbzvTyaTyjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759227785; c=relaxed/simple;
	bh=iwETwjsWH8KkWnjdGAXqGGSLFku1lXN3pXfIWeiax2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzkzFYcurrrIlsbbW9ipaYGQfEqWWNngN8SEDWjTncnILtCuD31HFGIVdAoBkABkQAdQgyM/2gkvl8/6jUSHz91HCcKSTyNU/7LTdqJAuvKXKiVpEN691RLOv9vEv4THmo+YLiMfOJyQGMFL2MPjAouWGgyoiC2klRfpGAR0F+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a26GaCmv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a26GaCmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1759227782;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mgf+5bSh0KvMOHC6oH/iO2k9wdq3bzQfdz8vvpviODQ=;
	b=a26GaCmvjtOGXKkgtKZ7kDdb3lz6kjmiFM+yJ7WSn383o+Gbz8IQfGyaX3MsWXKdCN28vy
	rpEYlcqDNP/C0vCZRSLnxuBV2HTPmzlRfl11jMa0EMiIkhJmqe4cYboljLvcor5vq0DINB
	QsNgtW1cRGYMThlXrvZIXGKPfV1XVCc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-QjLDHbptNNeGFi9nMb6Gdg-1; Tue, 30 Sep 2025 06:23:01 -0400
X-MC-Unique: QjLDHbptNNeGFi9nMb6Gdg-1
X-Mimecast-MFC-AGG-ID: QjLDHbptNNeGFi9nMb6Gdg_1759227781
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8606c1c2b4eso1154898285a.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Sep 2025 03:23:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759227781; x=1759832581;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mgf+5bSh0KvMOHC6oH/iO2k9wdq3bzQfdz8vvpviODQ=;
        b=WjQpgdCycXBPCQKagXgP4wXmbuQJYUowuHLsQDkGac6yCt5Yg6fwzl+J28x7/1BOfS
         8wyBjcNXPQ17THenbViRZUHpcnWgQEyW7CNZj2Dzz2itinhWVfNUFXlf5xETmInEERBr
         YkMTMqjqSsHY0QLYJOFjJM9h6AoNs8uyI8fab/JJ76LP+r09rc8LcI3iiWsy1sEXFNAl
         vsywASxTeX3XBsumU+begyjEAJkq7yGKIGe+Lm5g0cgt/6wyWKsgDWUaxT2ikcUGsx5t
         olLVUKpwzjFZWZ7RK+JXs3xTpAznMGd9PuzLjenfdRfVBvWiXjcRV9fwRix4F/oT7UqE
         HSnw==
X-Forwarded-Encrypted: i=1; AJvYcCWyDpVjp88SIoswgrZT/YsK6DFF+VocmLWMeTWQxtQryHjnX5kDUZPO4oeoQSznWISxfvQ7HBgdTII=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOKroRSTLWJUNukVG9w38+D6OrzdVbI+auLFsSt1gYLroKXZJb
	WjkeSRVUFYtQ9BO9M21Pnpp/lAvhRFdYi6OWAzz4EKkIfvqFmcQfOCLExxYo611bpjYK+fnM+l8
	6JHHLK2cCoYFaMYJ96mMV52UQrDGOpxIq5Nmiz4gpywkKdgDmVs6ZNVg/PJnW/w==
X-Gm-Gg: ASbGncuU+b2LXRqAmevT8yhoF4nRoPwLhcLUyHIGgIKYFjI3vgA/hMDxDXHXyc+OHp9
	xq183Fn9fp3l8I17nhRJlRSBx6EsTeTU+jTu46dTWh7c0MmvFzqM5+XNzNN3NdM7CPjiYGNXDb5
	Sl521RCqxvJ3aHfI/e2Us4lnI/X1DuHN/VCLMrKx3PqLdFjkvSzNxtQLiPg9IndvhUxv0YrVWbA
	XHN5UGz7U5afgp2h2ufWmFUIiQzVVBiDhj59ACxzKbrNbOXEPsOZ3NTxzJPNCE5zGcsKsP6d0DG
	IZ7KWkUaOmEY/TP8g+ml32GUgdIxerKEssztkwyTOMXU8M+v28YlL+Da1m3FlPP2MaBgWmjKiWK
	0Nfx64hATTqI5VUZbizu+GcDaOUqd2mdwBCMe
X-Received: by 2002:a05:620a:a115:b0:871:dc2d:6026 with SMTP id af79cd13be357-871dc2d7504mr86159785a.16.1759227780677;
        Tue, 30 Sep 2025 03:23:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoByg3sSfWNNSEyfpGpiDYCBSbVHTJiJB2RdYaJ4CTo/cPLRB4Pivt12MeIkKx9oIwAdPV4A==
X-Received: by 2002:a05:620a:a115:b0:871:dc2d:6026 with SMTP id af79cd13be357-871dc2d7504mr86157585a.16.1759227780145;
        Tue, 30 Sep 2025 03:23:00 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c2737869esm1013615585a.11.2025.09.30.03.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 03:22:59 -0700 (PDT)
Date: Tue, 30 Sep 2025 06:22:58 -0400
From: Brian Masney <bmasney@redhat.com>
To: "Zhou, Yun" <yun.zhou@windriver.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, dianders@chromium.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: fix slab-use-after-free when
 clk_core_populate_parent_map failed
Message-ID: <aNuvghjOrY7nSviZ@redhat.com>
References: <20250929083119.2066159-1-yun.zhou@windriver.com>
 <aNrj60UeYQfXmlJ2@redhat.com>
 <a77dc81a-e8fa-4f9e-8915-3b8f352c114c@windriver.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a77dc81a-e8fa-4f9e-8915-3b8f352c114c@windriver.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Yun,

On Tue, Sep 30, 2025 at 12:59:14PM +0800, Zhou, Yun wrote:
> Hi Brian,
> 
> Thanks for your review.
> 
> This defect is caused by multiple reasons, but as you said, the fixes tag is
> not accurate enough.
> 
> I think it should be:
> 
> Fixes: fc0c209c1 ("clk: Allow parents to be specified without string names")
> 
> Do you think so?

Yes, that's what I would make it. With that fixed in a v2, you can add:

Reviewed-by: Brian Masney <bmasney@redhat.com>

Also, just a heads up to not top post, and to reply inline next time.

https://subspace.kernel.org/etiquette.html#do-not-top-post-when-replying

Brian

