Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72ED2E763B
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755858240; cv=none; b=RLuwYH5SaicwDroaVxXXzfl8xij/iP4jZZ/FMnLPestL+Ramjf4lPKSCWbT+k9qUlIdjZbly2Ty+OI2NFKBHSg70ROb1TrmgwwjFllTm8skJ2PfYLUXEbkuu6ueM2/sTse64E0SOB0Od49CRrvVx9BygwUgqY3d2IC9FgwRPqW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755858240; c=relaxed/simple;
	bh=Pi24T1VzeRTeyxb78iSx9eOfruahP8bbLgZ7xrrxp9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbDQcjRuOPSLiEG6XQDFACMNA2QSBoM2VoMQCmD5i3mkT4VVipknLbaXBxAj9+jLoNc16SovmW1JQebXwY9OvWcU17071RQ4hQXHUC19VgLH4GIFp57CsJL44NY6QNiqvqtF7SjIVBEoMv6F/CxtZDX0aQfx8Pp/gFie383FdrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DbOyIrT0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DbOyIrT0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755858237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
	b=DbOyIrT0oo3LaxWkFj22kgDGX32LmZAJ6K90PumU/WTQ1QrCv57MdnQJWOEVVRJ2RYkUhX
	07wLcaedNudYfRpzD50tdzwd5JJVEoQrnMcOrG0vPRwAxIKcrBoHHQYvwkyj4OI8d5hOfo
	fC9Mc8reo21nbwEfUbVMSXfPd0nQzHY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-JSprOQPBNga05kSX-ST4JA-1; Fri, 22 Aug 2025 06:23:56 -0400
X-MC-Unique: JSprOQPBNga05kSX-ST4JA-1
X-Mimecast-MFC-AGG-ID: JSprOQPBNga05kSX-ST4JA_1755858236
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e86499748cso801759085a.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 03:23:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755858236; x=1756463036;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eJvTKEyEbzhmekaQhrASqnfJY8OZgIJPjxsG4VBPz2I=;
        b=o7Fqnsr3oteDEv0n8hUaA8JVFMMJYD3QErTzPSS9NBK4U0ZtoAs7lFlku6Qq22+Vyg
         m8fjd6ZZZZkSPTdGFsbOd9KuU5YMyUP5yUVD6TtJ+WSph0I0Yj+4RZmJqJx/gHSMVRt+
         k0GC24PWfwy0a0uqK2jOCxRlgEZN+el7rupygu05yx7mLJiJaOgha1EKQEJo/JQ5cYFq
         huYMsBHoKjYw2D23IwdyWJjLEYhiCIQAPDQDz8LF/Hew8NO4vWnsFUu3HGKnp4sKqAZB
         XXDqtDB1qQ2GEPI+pkx7eQ59OxsXMZuEeq+/0dBY1Q9Ld+2yBaVn3cu/ZSXWBBtXb34l
         qcQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW61yv/XoXm8OXc18JT0mtFN74hRJaFSm98GHNgzSr4mobXYWcSajswAOMLkkPtgtk954WpdaaYfTA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0imlQ1SxzEE7aHsuC1/y5nrIoIkXwDKFcbUBdF/M3E+PqRBqu
	JzOZLqwJ25GaZwkYqkODzxovpu3gL5DeEnA/qHs4NijMKCh1b9ageEy03YufDQ+Oz18XW6F5RN8
	Y8MfLDvP3Lf7qjAtbTQLD2MbrV3iv9i4jU59RTWITRXipV77BXMS3QGXvNCdvqw==
X-Gm-Gg: ASbGncuKI7Ta2I6KgmSjAK+7uE/vnV9V9mVU5NiWAKBCBP8hOdr08DY2auSnbj7IumE
	+Shg5GvSJDCjNPxR1pqyMC1+G9YohbuO1WLdA4ICQQVIY0mVIqcs5YhKH/JMXFbRZyf0SdWyZSm
	WbRzZU3WHJ20Kzv9Pz04ZxQ3bFaiE3qpQsYMxb/VYt7HviM0KWnq1qyup6UBcatpK/xaAsjlPaO
	fUMyKC52pyfmeLnmyyBf+MsuVZqv0gnb5xHM7HrxVMPSvrwwbv61LqMgnjEARreBcV53KkM6BNC
	GDySGwfJRprqqZntJPUKpB+fnPM39lmSnjv2vTAuQgFQPPnptdBbjaUOFgXKddKLyo5SaYtqhUl
	HxeT9G8uY2ZiayMfGYQI=
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250141785a.4.1755858235941;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzbF5my1f7sWP1hvt+Ae8lWAWkUFPWkmMGpX8yUvMXDR4PmNo9Qp3wmQyKLcPE30uIWwQ98Q==
X-Received: by 2002:a05:620a:2985:b0:7ea:61e:3ce with SMTP id af79cd13be357-7ea11515112mr250139985a.4.1755858235417;
        Fri, 22 Aug 2025 03:23:55 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7eb1123ce2asm16520885a.65.2025.08.22.03.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 03:23:54 -0700 (PDT)
Date: Fri, 22 Aug 2025 06:23:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	willmcvicker@google.com, kernel-team@android.com
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
Message-ID: <aKhFOHFGKPYXgIri@x1>
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org>
 <aKdmurrT1pFtLSI8@x1>
 <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Tudor,

On Fri, Aug 22, 2025 at 09:14:03AM +0100, Tudor Ambarus wrote:
> On 8/21/25 7:34 PM, Brian Masney wrote:
> > On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
> >> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> >> +				unsigned long *parent_rate)
> >> +{
> >> +	/*
> >> +	 * We can't figure out what rate it will be, so just return the
> >> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
> >> +	 * after the rate is set and we'll know what rate the clock is
> >> +	 * running at then.
> >> +	 */
> >> +	return rate;
> >> +}
> > 
> > ...
> > 
> >> +
> >> +static const struct clk_ops acpm_clk_ops = {
> >> +	.recalc_rate = acpm_clk_recalc_rate,
> >> +	.round_rate = acpm_clk_round_rate,
> >> +	.set_rate = acpm_clk_set_rate,
> >> +};
> > 
> > The round_rate clk op is deprecated. Please convert this over to use
> > determine_rate.
> 
> I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
> as deprecated and add your Suggested-by tag? It would help other newcomers.

I am working to remove round_rate from the clk core and the various
drivers. Your driver just needs to be updated similar to this:

https://lore.kernel.org/all/20250710-clk-imx-round-rate-v1-10-5726f98e6d8d@redhat.com/

Brian

