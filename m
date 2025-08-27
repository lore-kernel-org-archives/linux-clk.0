Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C403A2D24BE
	for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 15:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756309527; cv=none; b=CZ4cwRaByKjYBFEVLP5cZBPLx/UnWkxbkQudq+VIccdF4tUFsuY0JA8UuckyZgctv4CFrIfgTzS/Nd1YE3n4oHeSrmHIoTEo7RTnjHbJL2JNG3tkCVGIwcf/RO3MobrIzAkC/v9yVkQSw5GNSKD7kHdfObhsF6Pb3kirnuz4yy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756309527; c=relaxed/simple;
	bh=/p97CHZTchgZ2x/w77sCPBCAKYLVfRuzWu9KdaEGTW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DyO+fEAe28CfUreEcQg4G37QU0wNJXm5O1lUYHfxSML2U0HKEb5ugsR3jeWe5+CEKy8/+S5DBjUjhQQ6FclRNkbbKJdigTIk5qI48he3ie68bPxuR776Jzd4jm78T7VJDUBigEPg0i0+UiRkl3JZtGKSBmhqnBTPCRfd7AGK2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UG7MTfUv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UG7MTfUv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756309524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
	b=UG7MTfUvTRgBYF2sBsAsTOhIz/ramoEU+z2P8JAQP1+LD2AqzymfuDRAQ0aexgbKvNWjr/
	1j405mrnBRmH9WVRDVVZNbucz0PFomrgo5vEBrTC4Cv1VMu3viPpQU0NxnWetgxOGkYd8p
	TW3HV2Dnx2P7xAkSjSvxvkkv0WsXNRA=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-pCePBM0pNJKL2oKksRxWpQ-1; Wed, 27 Aug 2025 11:45:23 -0400
X-MC-Unique: pCePBM0pNJKL2oKksRxWpQ-1
X-Mimecast-MFC-AGG-ID: pCePBM0pNJKL2oKksRxWpQ_1756309522
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e86499748cso293834585a.1
        for <linux-clk@vger.kernel.org>; Wed, 27 Aug 2025 08:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756309522; x=1756914322;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
        b=fdAk4YbrZgZrgGuIml23K3o/iuYaij+lTZc3lfxosxrs/Dii0qj9Q1mhA9A0PZ4pZQ
         CHHK+knytZVW7IutWedkAN+sYst6LwCEVTlz873rpyCPgCJXfG1C1qy0kJKdx+eIcSNc
         29Xhl29mfzjfjwkKdfJ76NJ+VPIHZogU4tks5PSK0/oLsvfWEQKpZgeq9eQ/evZQMf78
         5p2alHZXHU9u7273C5x2kWF85GUOWvCCXrsPPrUze/IeDOBvU7ISw9ICZukoe7qzd3w7
         QPCVw8WdaArkmO8PoxoRDqy+/4Re50nbqF4emEmynfYoRECXGBT6u1zwyhm0ewsgGNAc
         3iug==
X-Forwarded-Encrypted: i=1; AJvYcCUH0vcJBQbNT88rmDbhJFPdlSN2UKlXY+UmF+tn6jfEO/lvvrApdmddgsZVp4mehRvPbOqayChE1Rw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9AW8LBGY6X1V/9PzSkyVSFqzvQSSRXtfmfNUplAyl1sM8qdmP
	NnBw0uupkLkOro0nj+TDjR9pO+mjClNQxTkFeqEfd52tPThS1Nhfq1UFHKHmJRRPeSp2dITt/gy
	vUVMtHPUqrJpYIDtloF3J2EmcZi/0cvu311sMgt8ioZjpmNQy42/BKRmqZP5AGw==
X-Gm-Gg: ASbGncsNScAW4k5fMRhUfyefflwbyqCKfoCA77wBLa/qron1ZrxRvLWI+SlczaRl5Dm
	segneR9JNxfTZ/AA960WafUTQiyl5FV48vbrnqodC1j6AKcV3jGrdil5jwP6eZu8G1nB4llV+VO
	iBkQLlLu3tqPj8dNmut8HACi0ZuEJIjn9eOJVLs1ms/ICRb5/D/NIJyWZzgaCogNn+62J8DMMW/
	NjoxoIr9YhVnqqIuOp3+lfIrrVbMyNC97rZs4xtT+CvkW8zHyAkfEJu6VLZs1rzkfbySJsDqdQd
	IwZiDEgs23MYQmOSZXoDRHn2RXe4iQIKE7hUU7dgNxL0LIRJktwQ/+hN81BFjj/ts4BZM3tNTpu
	nmwu7kl7zDJoiJH6bPDE=
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677233485a.4.1756309522441;
        Wed, 27 Aug 2025 08:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmUGjZymg97kwzbvc9Ng0QsbL1xmqeZFpXH0SyMzHjWziskdn6bTnadHzycYk8K6ZKteAcMQ==
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677228485a.4.1756309521893;
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8de632csm94044401cf.36.2025.08.27.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:45:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aK8oD6HNw131avjI@x1>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Aug 12, 2025 at 08:17:05PM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 32 ++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..48c7a301b72b30fd824dae7ada2c44ee84d40867 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,38 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq_hz,
> +			       unsigned int spread_bp, unsigned int method)
                                                       ^^^^^^^^^^^^
Should this be 'enum clk_ssc_method'?

Also can you add kernel docs for all of the parameters? I know it's
documented on 'struct clk_spread_spectrum' below.

What do you think about having this function take that struct instead as
a parameter to match what's on the clk op?

Brian

