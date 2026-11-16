Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843943;
	b=x+fDw2uXPnAiMNU2Q9jOfrWoRB67kJYv4PsansFJ9QQyHsJ9e7xxPQ68Cm1zesEZNfS7
	 mshPur83zmVGySL+XLWpfeweK3/e5iI8xaZ4yVq2TBYAmcZmdEUBELUrI/VK9fvIVTpJ6
	 I0lf1uBqWZ7QECX/bOE8b7NiYkQOL+rDEW9N0p0TiLi24dOn30PLS+lDuXe/qTXu+eJkD
	 6BM1Jx5tCw97v/Yau/dmGg7HPPkMQTj153gpy00ES81AnoxpcwnFKHhraTKgQdE5EuV0q
	 ecCOJXMDND1e3OXWpk6NPT+4j0htJ+DZde4jYtCdeM9pUjmJimjcQg3ZI5dI4+hLf6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843943;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=LIhYgE0wNOmFFNCNjGMY+TKhwPeq/NdVF5d0Plxj+EBC48g6bJlmp2ghyBKytr+gXSJ6
	 b74wMiHOmp6HKxwq3AKGiFh1zrIDMWLE6GU+aelaK6O5ScYWzHb/ISGKPDiC5T3vYivRe
	 Hb714pwOpmsQ7WvTaTvj3qI12EdecKcxXWZugUcWrN4sSfS871fSfPhVeuKkuHRnp8zJa
	 cXLHyDJmPAOyor7geXqNY1AiVURb9cOEuhYYjP1byy1KuryAL9CxjhEvVqszPYRi6PEac
	 q3i8DT4JhhWQ+BHyloBZkRzhDCZVRzuEYsj76RJvvKd2UeOYz2ty9/Z93rbENoBuVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Iv7O1+Y7;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB623606A331
	for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 15:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB623606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IpxnSV3L;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Iv7O1+Y7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794843941;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=IpxnSV3LeyhKw43OXzojC97bBiBsgfWDFXHwvur6D75GzEn5hsBPO5xgssq8GbDBaGZOSf
	lwUBkiMJAU6Zvx622pwtFvT10P814IKst92PANBQAPnPHiqm5rCTORzbh1Ky21I0fk53Wx
	IPtSQ2g/gRjsbtF3kRG18U6MwWoh74Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-xM6DMxPiNYW5I1HQefcnlA-1; Mon, 16 Nov 2026 10:45:40 -0500
X-MC-Unique: xM6DMxPiNYW5I1HQefcnlA-1
X-Mimecast-MFC-AGG-ID: xM6DMxPiNYW5I1HQefcnlA_1794843940
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94970ad532bso262873385a.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Nov 2026 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794843940; x=1795448740; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=Iv7O1+Y7KYAcR5tb7LvKd8uweN1+OmNT4EtvYrGqCF7myjSeOSZHr3EIByhGh42SLI
         NjlovhxGr1bQfuD/s/cWySASYBi4t34fMgQXceoVL/yMg0celGlgbSFghPs5Mjo8v1WK
         1nsbH0CzXKI6eg8euY+sOsKRVyWUiRFXDLMB7sIlF9FFVVCFX662VG/QfFcN1Ps+0U6M
         fdgLqnFf3bD+P/IJjVHZMqZLGOXAs5Dpov2U9SOP7lcKyQnOVE2j0ltkmbpkOhFEaMYH
         FOj3edf6kRXFCtlqF5zYaT0cMEop8GOmwlSmxoxoZFyjRoOyjq0OFG7J126YynJhwHd7
         FS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843940; x=1795448740;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=TsFr4PUeIdY8wKtxOu6ZgL/XUSvTDJELMQSCNMlm2fcxU97khZWP6n8jzUCWEAQ5SX
         TlPX4y9PEnw45LFCDazBtmRBPZV6h7O1w/f2ZUswm0f9RX+yByiMyh8+r6mtO2rMpXcl
         1412ZPd71V5amWzoOT9GPOAV/0dzL9f0I8LtYlTBZrB2RT9iHU0i6OWsLux6vcBonF/A
         JPu4Yj4thS372lG4wWMJgUDlct7VFFVXDa5mOul2IbvSgC2oH8BYQO7yWmgnkyyP5Tfh
         RetAexzYdrXxv5J4u30Ge4eRnXyyjZiHy9DHrTiwiWVvksspEfwngvzn3G2eloGIpb1l
         +AeA==
X-Forwarded-Encrypted: i=1; AL+hErEPMDk5DTuQxS4XTDIZMzKFVoxpZfnlYpM5jicmBo1yEdqFKNE29Hdm80KhiLVKq234dXl0W4MBYSQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EQVsB1wHv2XxfPORLDC9vkLnP4wfPABvaRaFxKSYLeNkyyTBe
	/wGk1floCQGsKpNJWhGKEudv+xvJHmgZa/njfiF9/TG0y8+d67M1syasdH03/O1tJP1D+C/f3eD
	1S9tn9W5ukQnilYYQh4pQ0yE/ctCTz24dw4wt37vtsneY+AL0ln1lrVbk1ocDdA==
X-Gm-Gg: AYBFou25SD2hw+g57kTfiB8m2i8LE9G43Ew5puLZYDAl4iOtRMOqTybKPhoXKdrEgCF
	KIhwqhmmXVYqxAyEKKuxXNRpDWSHgukS24OZZGmS67jMvomkFTD8L/4JV/09KB98Gc9iBk+JmmQ
	NUCeFnlhKf1Td9G2ValYbw0aXDVvXSZwxWzAsVfRx/S6CswFQbIv6CSnWV/vCWotJoNm2NkV2aA
	J2y3EZO2Lp4panE0ZR+dZTi69ToKGaJmnpN8QSq8kSG3HnKOTS0Bg8dMkxrHB8hn33EU3pRTZU3
	eBDVKIkB83Jk941zeZrkAxS+EGTzFB2bew608xYLquDmZ/in9VxmVvGXsNMZbIJKDWP/YNJiLO9
	3eHFFO1DV7Kg03JBHYLO1y+mMJCOQzSV0R92e3dd4PH8GqzvO1I2aqwtQd9NWVPeTAsTuq4Jo8j
	ZxF2Fdwk6nBrVkroIyLAEx4fNUoGjl/fgRoleEX7mz
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849361885a.17.1794843939840;
        Mon, 16 Nov 2026 07:45:39 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849341285a.17.1794843938440;
        Mon, 16 Nov 2026 07:45:38 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm877596085a.32.2026.11.16.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:37 -0800 (PST)
Date: Mon, 16 Nov 2026 10:45:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: zl020895 <zl020895@163.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
 <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
User-Agent: Mutt/2.4.3 (2026-10-09)

Hi Long (and Arnd/Krzysztof),

On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
> >So how about this:
> >
> >- Have Long post a new version that splits out the creation of the new
> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
> >  provide an ACK on this?
> >
> >- I create an immutable branch that contains that the two dt-binding
> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
> 
> Just checking in -- there hasn't been further feedback from
> Arnd/Krzysztof on the plan yet.
> 
> Should I go ahead and prepare that split for v12, or hold
> off until Arnd/Krzysztof chime in?

I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
see if they respond, and if they don't respond within that timeframe,
then go ahead about post a v12 with the ARCH_AMBARELLA split out into
it's own patch. I think that's a good change to make anyways.

Brian

