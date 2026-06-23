Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5784337C93D
	for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 13:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782222051; cv=none; b=dNMH3CtLbf/Bd8VgoQpq2u6kF9Jh3oQ50kmk6BPfsVn6ApUdpz+OCnE5EvxZK4yBpcSJenxwoGTtNSLESw0OeqvoZXDJWMp1wqYQxtPSHhm4ZRCPWF1INHfPfg4L9g51gunOS8YIcFJGlWPnDwwJHyaxjVYShzm0/6KGlSHNL+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782222051; c=relaxed/simple;
	bh=Cc5TbQEAam/pScqVc7tva3rlQhdXYztR2FTD905WYCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfJwhnFrOlLT6VUuvKuUiI325tieDk/w3LzetBPMHueSkRlGfIgrEx3hdAX0iMuS5326oFO2FiBTRmSgJ0m6nT6OdZcrK1F8JH1Pe4sZmuzzqcSAGUTwTUA/+dGiS30nMnJ21E2b/Un6IQiHsa/FeWnVB+Q3KID3Vn2CeKLq5PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GdUq+Vna; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=q4ukpZjX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GdUq+Vna";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="q4ukpZjX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782222049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=;
	b=GdUq+Vnavih9MXxjiZ1kCbqj8i+aNA2d8RTq7P560M7EqBhVN/HTC66Tcun32+m8LDkWD/
	P8h2BEyhE1+pWetj7K3jF+DP8F4yBjXhm6zhSpsAZaylckAAiZNoqcCXSnQfxnpkrbcnDv
	7AO/JzirJHxLW/Bny7vR7lbEvmUBXlo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-9TrQvUbxNxux2Phw5M1Olg-1; Tue, 23 Jun 2026 09:40:46 -0400
X-MC-Unique: 9TrQvUbxNxux2Phw5M1Olg-1
X-Mimecast-MFC-AGG-ID: 9TrQvUbxNxux2Phw5M1Olg_1782222046
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92045e86763so212330485a.1
        for <linux-clk@vger.kernel.org>; Tue, 23 Jun 2026 06:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782222046; x=1782826846; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=;
        b=q4ukpZjX4sqZwKimYHtlQ0tdzmxpQlWryRxpasE5adZTXPXdJ5N90j049jTEsNxvGm
         DQxVszbPEIJ3JSGN7EkzIio98dcQRJIIE6QptXwbBJgZRWw2sRxpsHnRw9X1//oOI8dM
         +XEla/tJNDBlaK6Th1mE670K+KD7vNE3bU23urZpqJKgq46EzXMlpVdeAPaSuuKchiuu
         a3AdbkmQKELEVpCFiG0xSFCEAnJVLEYzvAFFjsyMyNwB2uq7fTxbLURvA732efv/MHHO
         DzmvLAW7nnyiSzfI307umQySr3emoGT+TtZy12y6oOxXFrhe3meZ5OWtPZkPOYrTYWqG
         L3Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782222046; x=1782826846;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=feC1Xc95vHwpugGrGXRgs1T9zUXNoDWuuL7V/419NWM=;
        b=ArcK8N/T/ihfDAouM6zSK/63tu+3hnpfuUqZV7R0UOAcqb0kYAzO7VUPboQLBJM5Fz
         Wg9+j+c5AIy3czHXYqbvJCRO8MYagLO0BoP0WMYHWI5pkSREHTT0S6LbllmdaCXx8dHM
         m62gh40PN96y6XMds6cjkRSpeHmfZT4YHr0ZSj4Ur6WGMaLh679PDq56SOaRbm/IaTv/
         C4uSRWHb3koSG0kQkvOTRjWRD9GVQcxrLRKHmhELMajgBbU+8+B4J+JmzCcvH07+UIIA
         yqPh6jdsAi5cacb2eQqZHgBF7L/XokuOEygLNeBNzGJ20S7nT34JUENKbxfVg6jyxXzM
         Prkw==
X-Forwarded-Encrypted: i=1; AFNElJ/ziJ3EA8dYHRr2wnK3facVgV0a/krfbfnr6EzIv0swJAzi9uxAUUyCCAKwJ+JhpHV183dpwftASu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXA8oOd7RfwM6QylRpUfAddhfCmoDEHDz0XNZrZzYYlFQSM6Ce
	vMxT16dKiuVhws9Go/SRS7Yy+zTUBzcAcLH0PxuMOhDCCocjQNc6AAakIfHViEmOX9gSMbpOXVg
	WJnI0RRdSK0Hf0gYqLw6u+6f5O0ClUACDT1H23gt2amZioSLfs3yiXq1/1W/YCQ==
X-Gm-Gg: AfdE7ck+eKUKAW1kzxEZf9ueVoAulnvA0W1jvUxFD0bmefXUgVfpHRuXB5MKbTM1g1S
	JTZ7rkT5l6B4NXRVDIXKPyK3pfeaVDTINURTQhI9r6v5cma1yHyM+fK6nJ3Ar8DcPdYSQ8xISJX
	q+Du9Lyz03/b5tIe6zHUhS87fry5OF8zALqiSAaK+w1L1P5J80qlJHUWMnE2FPSWqFl+MC697sW
	1x0+Ds+LVNGX1owXIDWI03mQsDFukRZzL0eD86t2l8Fm3fLy7d+d2VAslgfqqtWuM9AjnCz97dY
	d82kHDe27lYUeGf+quT7D9NX8D0LenDdEqqLowz0Q6m7WQbn7WbdgyUe+6JgLgdbIX/Gm9EKsve
	T4HZTF6rddHwRj9oDNZgt5+gRLWM+gq7rCd4BjWZKAysaEw==
X-Received: by 2002:a05:620a:4044:b0:915:92f3:54e3 with SMTP id af79cd13be357-925ffbdfd56mr628782985a.4.1782222046074;
        Tue, 23 Jun 2026 06:40:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4044:b0:915:92f3:54e3 with SMTP id af79cd13be357-925ffbdfd56mr628779685a.4.1782222045634;
        Tue, 23 Jun 2026 06:40:45 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f018898sm125887546d6.7.2026.06.23.06.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 06:40:44 -0700 (PDT)
Date: Tue, 23 Jun 2026 09:40:42 -0400
From: Brian Masney <bmasney@redhat.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: "Datta, Shubhrajyoti" <shubhraj@amd.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 0/3] clock-wizard fixups
Message-ID: <ajqM2m1d7-YnI5rZ@redhat.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <65e8c879-fec5-4be9-8211-8e92cf1a0833@amd.com>
 <ajqEMXmTnpOA7tVs@colin-ia-desktop>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajqEMXmTnpOA7tVs@colin-ia-desktop>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Colin,

On Tue, Jun 23, 2026 at 08:03:45AM -0500, Colin Foster wrote:
> On Thu, May 07, 2026 at 05:29:41PM +0530, Datta, Shubhrajyoti wrote:
> > [You don't often get email from shubhraj@amd.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > On 5/7/2026 1:35 AM, Colin Foster wrote:
> > > The clock-wizard driver had a hard-coded 20KHz minimum accuracy. This
> > > led to out-of-tree drivers silently failing to set clock rates instead
> > > of dealing with the best-effort.
> > > 
> > > Remove this 20KHz restriction to match the Versal clock wizard driver.
> > > There also was a bug in the difference calculation that is addressed in
> > > the first patch.
> > > 
> > > The second patch optimizes the search if an exact match is found.
> > > 
> > > The third removes the restriction.
> > 
> > LGTM
> > 
> > 
> > Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> 
> Are there any actions required from me? Hoping this doesn't slip through
> the cracks.

No there is nothing else that you need to do. Stephen hasn't made the
clk pull to Linus yet. He should assemble it this week.

For the series:

Reviewed-by: Brian Masney <bmasney@redhat.com>

