Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC4F441041
	for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 16:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429209; cv=none; b=IFBje3Blr2pBC/zd1Gtcta2W1Q6nLrd2uzJNkSgOnuLzw3xoaT8qkKZYwkIawXp5p19Y6k5pW1zWi61Bv7rx0T/rrLf3AwBJMLQwtvBgosbvac3bC+TPqDlb5aJ/ASJsSwQsuEWFDr8E+wm8m78jA1opIp0RAzD5n7fUMwwPexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429209; c=relaxed/simple;
	bh=l1ohcCiL2vtbHTs0waGuxxnEle8Z8bbukG23s4TXt2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGldfevLWKnwSdqfK+mx+c6PCQ+HD687Y3Iu7NS2BdQyf9eHBX5FLLJb5N5e06P6+cs54Kl5oFn748tMdZUAGCP7b2kkzSQzbKpZmzygfmZbZ14M7DxTfPDN1SsAJVDLFqvogABIuxSJ+hskjlUYvkDbYsXnDzIwUE/QMm2TklU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VWxUXvEn; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8ZrPY7p; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VWxUXvEn";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8ZrPY7p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785429206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
	b=VWxUXvEn9ohXbIpSvOwvYDmx9kfdX8gbQmEKEbsMOExL7tQ9gWhHzYeDUW5HibSdUbQZUK
	LvwEmYUyx0dcXS4QxhvAncFmkaJTKvwghRsdRYFAG81iP5erAvkUOnG7bjk4pfwsnikXMC
	cUwZoIUAn2pNAAzhVZfSSl4+v81gcc4=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-WvjTyIJqMXWqdeCm8zZRBw-1; Thu, 30 Jul 2026 12:33:25 -0400
X-MC-Unique: WvjTyIJqMXWqdeCm8zZRBw-1
X-Mimecast-MFC-AGG-ID: WvjTyIJqMXWqdeCm8zZRBw_1785429203
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e8577d187so541307b3.1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785429203; x=1786034003; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
        b=d8ZrPY7pyn6MctXg+MUJlIK3iAhBGN9meHyUsdCa7UQvhZrkYOL/nHvuBboVRpCpjF
         7zGCvoqrXKaamNJTOEbUiFGDFHIvy6/1Y2SHottCmXa88K79PpINtQaiGH3q2xsTMoQZ
         oheGRn/+4qhD/QABR66oibKpIsGemzKBVaZ73wF3x+CXr3FFpF2+WMLnHa3y56/KUzmm
         8IC62un/Ood1ZG9DtlP+InNYZ3+IKITdV1vfQtL/7GCWS9RnYPipYeDYTyzIMbA5Sg35
         Su1ZHIzcP9rOXcs0cglXo0iWdrPLAT27dbknhTmQ0InZOa9oi3Vdk4kJDtvwBTQJR4/x
         lxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429203; x=1786034003;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7dR3ZygedUQjRGCKUSRpWTl4Te1l6Y9QC4qZxoalTtM=;
        b=lw+qk6+NCAQdVrTNbOUT3fuzRYQGCXfppP8FJF0HX+wiZsE6d0LlIaeVBg95mRA3rY
         pra0xT7C3HYDd1vl9N+OYBQBQhWFNgXn/AXg8Oh1CPUJ5DQ/IjKSyQyJ7KPUyJvpHUk5
         YUxPZOxlkeVfFGZoYcjVE/IHrhSOVx0hfFTvYy7iCn9ek2Szuc32jCR3rAsIohYTDkn/
         8NRFNxywkoCFKDqEWTlGKzMk9OZvDLXUyCKmqZLJ9VQgqNurnR4EBdY/1XvGFIUdLwAH
         Ne3SfoEefINEzwAm+8vM5fysQvXQlTRac/a9XYyJxF2G88Y0fRLe72HVgttwx9eVdJFc
         MSoA==
X-Forwarded-Encrypted: i=1; AHgh+RpUKLIxN4nCnq1eL1pSnsYwKrTovkFvsgmhlFOMUqmLGrn23UieoYvbN5khyTeGwbCTdy7mvbYOsKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZT3gA8tM6AXY4nZI/yDRF7+ZLAdEFWcDUC6lwgL2nRg39dQEj
	w0K6xoRKaJaM7JHFXPHfwYy98B5AJvsO8L4axiIFHqVQc2+3eJYaWvHcig+kYNQrzpW0TSe+CUq
	cQkH6BPmg6oxfc66Fk/YMd1uuLkOD2ihwLkbHcSZDIP/jC/UgxKRrpGh7nqWl3A==
X-Gm-Gg: AR+sD10K+7LLTvTlLHfEzvFsRNh1b2vdUtDZjNBf1rlgLjmhPZnwCnG21G15gWQr6Fo
	5tffvJ5iP/tDAgEhGabSdsSpm/HpiV0GZ+aNTM4zUceVCpYQpDvg1j1Gbke9bPFjLyZS6Piszuf
	bWS76OaBLUKKtjEDXUQ1gEfxXD2SMslen2+sc8tFQhTd3tZ2hz7gkDu73cnT7l8m0gsT1zSTPd0
	FecXvrv6yy9zmjoYo+B6xSMJHuswXsNhHO/lAMrFDbxH/EgcYI+FNRijnHvGoCdJc8zyjw5bLey
	QhfgB/+5peQUKKSv6l1RV7V+iDDK0/+L8BoXk7aHXR5dQn0lGU/be6UGTuYbRAhjJeyLAgM6DiU
	SdzBqXxP5YQA7TaDmFzl+NjZ5UekhEDv0dkM=
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119737b3.3.1785429203031;
        Thu, 30 Jul 2026 09:33:23 -0700 (PDT)
X-Received: by 2002:a05:690c:9c05:b0:81e:68f6:f842 with SMTP id 00721157ae682-81fc1dfc3f0mr7119457b3.3.1785429202515;
        Thu, 30 Jul 2026 09:33:22 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fb8ac228csm12990017b3.35.2026.07.30.09.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:33:21 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:33:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, jyanchou@realtek.com, afaerber@suse.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v11 04/11] clk: realtek: Introduce a common probe()
Message-ID: <amt8z3G8lIitanMm@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728142806.1954638-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 28, 2026 at 10:27:59PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add rtk_clk_probe() to set up the shared regmap, register clock hardware,
> and add the clock provider.
> 
> Additionally, if the "#reset-cells" property is present in the device tree,
> it creates and registers an auxiliary device using the provided aux_name.
> This allows the dedicated reset driver to bind to this device, enabling
> both clock and reset drivers to share the same regmap.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

