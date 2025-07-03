Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB352F19BF
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555504; cv=none; b=PZKxzteBP5KTShoqmFkFm0ye07Q/v0lFtdNZ3OwsUrHpsEmPQBAxViZvvT3P+b8DjGW9eiUvm+d64kgrmqS5yg1ocP4Mwf8/BzrQoMNXuwDmpC8kjlHHwK2E6JKgG7KQZljG7f3xPqFCWoc0XkiULc2p/6QenJaYKaQw4dTPQhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555504; c=relaxed/simple;
	bh=RbxVGJNbXM6OAp0vOrGJKnDsx6+rYr6yWLn2VhGH7Ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+mVFli0zfJOMeAkfACwl/+T+yIZT+8/xhOfNQN13L/ZBlAi7Y0u9tWEOk1DIDZfPXlnnkpXtJBvqOm9vo1S7YFj6wFhkscC1O2v8MlZeROHK3zx6MkgQ12F41YaIZ03J2fSca0+1tKejmX66T4HlKDKrjX6ITfec6ZwjpJ1KIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FAsAGwib; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FAsAGwib"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60c93c23b08so11112965a12.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555499; x=1752160299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=FAsAGwibJLZY4/pQfaLQPndB2E4CSKCBnRWArGBsgBJMdnBOgk1alHsZKQwPHykWDC
         zogWqrZ811ugLKo0VHjcgGDunzlhr/Smwjzhn5t03E7rSLCzzv6ogG2/BCw3Fjfz97hW
         zWpQs621C5BqvpqImQaYEZBug7w7gcHMNYUSrtMP5Yd3r1igW1nhdHs+pfmC/4z2n6KS
         JKkiYK6Jl7gXWmHeXW3DLd83tBTWs8TMeTRajldhu8fwzeeioR97wXk4D+cpEDNvcpYw
         MaObdp1leTci4jh7X5hFxcFch/WkObjMQ6IGAdg+yiMv3WDPyp3XHqBJZSEvKZ0jtANZ
         zg6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555499; x=1752160299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxkvsrSL+5JDtGQsAevbH9zmJ4Ly3BiCGEDd5Aq9Bn8=;
        b=uyUwjNFosBbQ0B7uAsDqvreltXYo14jqkjzc8pCVEyRLrJgtG7qsANphLbcdcuhycJ
         5jpZyu2JblVquxX4Sr3JgDzrg95JVgcOd8YyWNhDHak5VopMLALJI1pnPdbntJ5tN6A6
         fDD2+Kl/YL1PxUK0v5RzspKpNpis+8CZNmu/Fk7jin00dppsVz1yyI2RR7pmh2ADFJ/E
         92UGdczPDms4/0ttILtn2C4RZrlou6WM4vNP9bUlupleZmWFktlMd7kITXkdfjR3ksXG
         1w6onYS2reHgBlYp4+hyw9xP3Ga1mWNPGfcX6FVvN8oeq/UAQjMGdGlof06vfup8rUuY
         EUPA==
X-Forwarded-Encrypted: i=1; AJvYcCWoUx4NsYkTu6M6bkL4IQgQaN8nGB4K3na+5b1sKMrGQBvtFNbUYa/uJfvy0vtMktZZ5GuDWLHdX78=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDFa4+9FDF4ENQcnJN0m8KKVcXDyNYgA3I1VayGcc9yGq0UjXJ
	Mnbr0TcnO7ZCU0Be5ajDeYMGYHWXBBhSlfARBKJfU3/xb6H04oqqnHqHGBXZu5UvcHw=
X-Gm-Gg: ASbGncsYE8kl1wWa8w/6quVz9C0J6OBHETDH8oxeA8Ry+cwnTjKg1iYMniOSl4kiVgM
	f6TyyaThuiM2bsjY6BJt1hG2NnEdd/a5D8JW2kwT83mNlO4m8nQ9CugxnuwOOtx2SFPxGeIt/0Y
	s5fqnPtAcbGLAiWgaBLi/p+g+ePS0L/zMx/4S5Zg22rqLZmuu6jrdPGbPIRM0QXr9ezGNUlDPuF
	QdA5xSLOAnKVM3lrmBAKLpkJuSe8hu98mtPzPmL68I/5JIdl87wLoIwbI4uE48GP3+GPEcwR3H6
	gPzMhwNunTXgmOofwVS6ZcbEEwnLn55YiuqcDMIKpufek0krwEL0kq/cUzQ=
X-Google-Smtp-Source: AGHT+IHdpH0Sd2LIExCI7zlJsSgp4lqg2r2dh7poJIycXB81JioP7FOT54h9vFTuZ+M/bEMSFmF3pw==
X-Received: by 2002:a17:907:72c4:b0:adb:2ef9:db38 with SMTP id a640c23a62f3a-ae3d84f7aa3mr410481766b.36.1751555499231;
        Thu, 03 Jul 2025 08:11:39 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831b3e29sm11077956a12.42.2025.07.03.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:11:38 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:11:36 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Subject: Re: [PATCH v2 2/5] clk: imx95-blk-ctl: Fix synchronous abort
Message-ID: <aGadqB5pP6DjNuRH@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-2-b378ad796330@nxp.com>

On 25-07-03 11:40:21, Peng Fan wrote:
> From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> 
> When enabling runtime PM for clock suppliers that also belong to a power
> domain, the following crash is thrown:
> 
> ---
> Internal error: synchronous external abort: 0000000096000010 [#1] PREEMPT SMP
> Workqueue: events_unbound deferred_probe_work_func
> pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : clk_mux_get_parent+0x60/0x90
> lr : clk_core_reparent_orphans_nolock+0x58/0xd8
> Call trace:
>  clk_mux_get_parent+0x60/0x90
>  clk_core_reparent_orphans_nolock+0x58/0xd8
>  of_clk_add_hw_provider.part.0+0x90/0x100
>  of_clk_add_hw_provider+0x1c/0x38
>  imx95_bc_probe+0x2e0/0x3f0
>  platform_probe+0x70/0xd8
> 
> Enabling runtime PM without explicitly resuming the device caused
> the power domain cut off after clk_register() is called. As a result,
> a crash happens when the clock hardware provider is added and attempts
> to access the BLK_CTL register
> 
> Fix this by using devm_pm_runtime_enable() instead of pm_runtime_enable()
> and getting rid of the pm_runtime_disable() in the cleanup path.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
