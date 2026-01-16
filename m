Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E032E32D7FF
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 01:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768526550; cv=none; b=P1fjnbExv7ZqhymUap/c9L65mWuycrG58f3E1rtct7cIlLh7zZS6vyQfjmamWotBsh6bShbzkKKH3ldDIoKlAmrR6XAQZUBVC0UCZZHjhEpsi4Zoczmf+T1BUvynTREemJeCOrSdGAbTLo62WPn0SHws5heb/YCsxVyY6z1+j5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768526550; c=relaxed/simple;
	bh=JmS6hXMultdM7kSpg6pUvdv6eOkt62ucLYun6fJOFVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RI1zJeW3LK6KX9nKz9+k+wZmK92YMSarsj37pD1w3ZKMFY+wVw/2y/4UUHCmtcMuaOq5ViAmVCVeFSaZQ9BLqpHX6q2Tl5Jb47kO6ZhLEJuVI0yUhmNYtrKNHC9MDo01SPBusuXVoiShsGFGvd830UlKxuKXfy+5gY1W9m7SDZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=D3O+Lmbf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QPhHSctN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="D3O+Lmbf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QPhHSctN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768526534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
	b=D3O+Lmbfn5BMLtCvDvnvAuInalzKgcpCxFBk+hYLzm6TVn3iqF4wgNa1kEizFsQHXdhGrq
	CuFyRrqrgJlXfy5Qh1WiLkrWhyW5QnuA6nE4bK056KvVuYAy0RD3DBrGRspmB3LSxT2521
	Jh7rhy7Oq4kNimISBi25zwaFwTsosV0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-HD4JUZuKM4StKBIPnYFe_w-1; Thu, 15 Jan 2026 20:22:13 -0500
X-MC-Unique: HD4JUZuKM4StKBIPnYFe_w-1
X-Mimecast-MFC-AGG-ID: HD4JUZuKM4StKBIPnYFe_w_1768526533
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50143b67424so41981921cf.0
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 17:22:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768526533; x=1769131333; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
        b=QPhHSctNPh0zq6+b6NTKFI7bwJZcLf0srIPUKlG/RoeZas0fUbeDgk5dbWLGm43WF5
         TDobeTjglupgpUr79wWK8j3Qr5jyAR8WmvOAcqOjHHdPCjVeAI85D/iXy0cRFzanpqwW
         sIFKdvs+HaY0kcW61gfnA/BOHer1tWam6Bj5c/BuYqHDAyljXSMvGNSG3WQ6N68luADX
         99Rd/jyBJjljMRyWh+oEK554iF2wt/ZVgai8xTAZI5/KHd+VPRuC/XN9Q0t//BqNB5jg
         /mOJVvmwOdOiuT3TZhjFjYnZBNoVA0EsIdYW7MVEDfc7Qp+S2O88QWCBMYsxFrjv0tcs
         IVBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768526533; x=1769131333;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I/7QQfPExfoLaF42b72uhslOlKfH5M9xECrEdJSFRnQ=;
        b=Afn30NQSfz6SkEktChCpFHgrKmzq5USvzfDmPm1xgfvMCpK0oZ4uKpZ2fZnQd7eIcq
         JC64N8cHr9EysNUSJ0BEUQfGuD08SUhGzq6+XaSAAB85QEKl3TA6Yjgl+wzYdar4GfVM
         21OnO+mk91pOvoVMfo+IPs/Qg07B9OceY8ZF6F9PuiiZCEdRFhiHhYIEG7zsZcgHPYbA
         JdMfN768eXAffjPGeuCV6mMHY/peidexLYPMPNHwam8/Eb0S3jBGpwv8JhnPtsQVlnY3
         /h4ETK6eC3LsJWOiDM93ba7akR1TgToT2QKd+7cK5GZ4fHRSIpBOtPmbgxunP0GyTj6M
         rEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdVZ/uWIPjFqdR7GwRadgR4DTwcUzr962llb+b924QMqHyDBLiAi+El7SUXtvkoQMKu++qEuuMhIY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw80+Zv7zsprz3fPaovF9mBYw4ts+b0xJbf6WPfZ14l4FlxNVbR
	WxE5yiSH+Vwu42iPr1fTlmSJJXYBGeQfNgdPwxY/0cMSeYCaJA2cXmlWVOpIahQdL7O0PgJgnX1
	9vwPlC3ahZFHXM9CyMS3w9buRb78cNgBwyImlNLMkM0GWQ2oVAV+RA1SWrnuIIg==
X-Gm-Gg: AY/fxX6e3JLxfQQlUz5WEv7/P/oJLqszgQk3itFq2Jd+nbfRHnbweB7T7+uB2DGbbNx
	UKxVKRh4JExzZDD072JJenH60HNXbeC/btGmUkvmNt+y8gJyDleIUzCEzWUflObzI/QMQMB6xrH
	7DjzKYKGrK42hmmJapbaWm8nPOkOior49XaeASYiYrfFDW9Il8hty1CQqLsiVKwycUhj3ZEaKbh
	a7Sa7Js/RCT4KALB1p8CshbgkYmU1hnBUXVqnIihB3QMIIbPvA2XxY0i5/qge0/ZgzuL4ozbuQY
	lL6SR27ccHqlwvOUX2vBLgQck+FBQEGJtIRQPmDav9J0lg9gs4yagx4K0+DGdQOyF7DBxCvKQOO
	GD0zcYflBT6dk1VXczttVHO0E9wFovsCmuY1rysttRxz4
X-Received: by 2002:a05:622a:95:b0:501:466b:5141 with SMTP id d75a77b69052e-502a164b881mr20881691cf.18.1768526532865;
        Thu, 15 Jan 2026 17:22:12 -0800 (PST)
X-Received: by 2002:a05:622a:95:b0:501:466b:5141 with SMTP id d75a77b69052e-502a164b881mr20881511cf.18.1768526532495;
        Thu, 15 Jan 2026 17:22:12 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1d9f2a1sm9622621cf.10.2026.01.15.17.22.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:22:11 -0800 (PST)
Date: Thu, 15 Jan 2026 20:22:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com,
	sboyd@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	mperttunen@nvidia.com, tomeu@tomeuvizoso.net,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in
 tegra124_clk_register_emc()
Message-ID: <aWmSwcza6Qv2aQBO@redhat.com>
References: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Jan 15, 2026 at 01:05:42PM +0800, Haoxiang Li wrote:
> If clk_register() fails, call kfree to release "tegra".
> 
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>

Reviewed-by: Brian Masney <bmasney@redhat.com>

