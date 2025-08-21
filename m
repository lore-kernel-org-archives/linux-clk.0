Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180122C0292
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755812790; cv=none; b=Kj+UPym9jdtbwTjbHEtjR3C6sODxe/kOk3mFHLu9f3GB0e0T2TxVr8B2Wyl2x2tw4aP/dbe3uD3xrxuEAVzZADbAX5610c5WnBwR1vYgYmBSEEH8eovLnLAwjcyqcswHcVhv1RC2mM+5z0xxpqP4V8NTl0Dt/6SGO4LW9vTqhnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755812790; c=relaxed/simple;
	bh=WjMsQZzuysaDV6R+P3ZzyoCh1QHeYreJxscNPZJrjvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evfjIdGA4M1ohJ+43Wbdy1PxP2l67NeO9JV679WywMru64Qjz8NMuShQdMuijdLio6S1h7MChUZdlZbLgstj+jXqp8VjQw6eYF3YpICUrbljtrmAw/dZISPgVDb4MT0cuOAlD5Sb2NUAir8aOwW5SO8kr0URAeoiSb0t3tR8mvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K8Ah7uDh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K8Ah7uDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755812788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
	b=K8Ah7uDhCPqerNmb4nVEJWvyZZyKKUflA1cziygM+Ve249/l3ZGLl0TvvteiC9CWnLSe/x
	vE1yJrRTtG2RgqcEjgiY67nZ95glF0HthDVB77wIeXy0mDgUlFPkJQaIfIJmP/+YdAd/P5
	9H53nhE9FSWOgdCF7WLqqo1+UpkJw/c=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-385-_YsZIefbMrOSeWz9z32EtA-1; Thu, 21 Aug 2025 17:46:27 -0400
X-MC-Unique: _YsZIefbMrOSeWz9z32EtA-1
X-Mimecast-MFC-AGG-ID: _YsZIefbMrOSeWz9z32EtA_1755812786
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109bccebaso44779861cf.2
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755812786; x=1756417586;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UOEidWIYFOcPQc5k2cWSdnWss7AqeJmy+kRLikq18m4=;
        b=ubPHzsxvCjXH3WCvYU6QJNC/+0eeMz7njq/Pvwwo/SCpWBU+BeWq4/h6bDXPuuR8rK
         OnF+geTY1DISem963pmhopKsx1tMUSsIrhqtvZ5N9rBEVKpV215skPKeaKOrbs6I7Ovf
         hxlhBXGMDyAAFHbXSm1zwP0bnGCIAeNOTGYWgnb4ZSe4C1vGwWkq1tdcXCZVcpzfwx8L
         YAd0Fxo6SVRzsIOxV8YyE9deeXIc9TuQHwVJMvR5vuLpYBsSonhotj8txwm6RGCJpFU6
         tqyjQIAwpIPpXdqGMaxWU7+SFB8AO58M1Au/+4Xj7cPblFafsfY9Ez6AA0/bciPOpYGM
         B5Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXQSq3HYVfzcNc2zGT01smTCZxYPNLnft5HO4YvUcoW3TkAP3fnv6IeMgzvBHNMrQO7AW0AWdVSaZI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkAI3Jmdy4p2ot1Y3dGAN8zkxxrdoQpNnvAgJ7ZawZCVpRUbhp
	/PrxhEqpOmwV0LDkMcNJSRti6ql1Lkcvd4RSqfAH5vdGcOzoKMIzFlGUdkmKP4vIyWYU61tfOuS
	OVq+gSQol8ouyxnpSo0HQk1Tfwd9Qg5XqJOiSg9W2Sxx2aW4dVUFM/K7W2MWgiA==
X-Gm-Gg: ASbGncs5+FMSw8YGi/DWFIieb3wgkACGsTfKlpE3Dk4Tp5aoAAUDDBvW3ebz3UpJEh0
	AbVZBYiTOd+0agLkzN5COBVhGQCm68brq3Ijy4OhwhqzPhEvbJ2iicXZnjYHk3hxXy//rY9boUb
	bn2VSXZu3QdOo14bQGk3+jOtJbr/Z6fCJEN6KndeRuYO70rB3t/LmQL+I4pDj4MXiwPQVurH8FZ
	ob69yq0Nn5cCLPGwLyZWPUiLZzwPALTfLaGioOCdnOhW/u+xOXzDhUct9/nv7kHSokZ6uv0xL7G
	FtiGv8iAvjmr/mjalnIT3ox1T9NjoKYvKJAVFzrirFNRnrmqYTPYo5DNUHgrZqrdDxXjoJ4u8la
	JYuwLAsWtDKTnzppbcsc=
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332661cf.10.1755812786460;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGM/f6AWKsD/uiuSUkJzb9jNkg9oqjjxZOXqxlVkr171nvQa2lEbcNla+IOhlEltLwBQr891g==
X-Received: by 2002:ac8:5812:0:b0:4b0:73db:f81b with SMTP id d75a77b69052e-4b2aaa1a378mr10332491cf.10.1755812786097;
        Thu, 21 Aug 2025 14:46:26 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e87e020514sm1201852885a.17.2025.08.21.14.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 14:46:25 -0700 (PDT)
Date: Thu, 21 Aug 2025 17:46:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 02/21] clk: remove unneeded 'fast_io' parameter in
 regmap_config
Message-ID: <aKeTq1lJ549a2jnQ@x1>
References: <20250813161517.4746-1-wsa+renesas@sang-engineering.com>
 <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813161517.4746-3-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Wolfram,

On Wed, Aug 13, 2025 at 06:14:48PM +0200, Wolfram Sang wrote:
> When using MMIO with regmap, fast_io is implied. No need to set it
> again.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> No dependencies, can be applied directly to the subsystem tree. Buildbot is
> happy, too.
> 
>  drivers/clk/actions/owl-common.c  | 1 -
>  drivers/clk/clk-axm5516.c         | 1 -
>  drivers/clk/nxp/clk-lpc32xx.c     | 1 -
>  drivers/clk/qcom/a53-pll.c        | 1 -
>  drivers/clk/qcom/a7-pll.c         | 1 -
>  drivers/clk/qcom/apss-ipq-pll.c   | 1 -
>  drivers/clk/qcom/clk-cbf-8996.c   | 1 -
>  drivers/clk/qcom/clk-cpu-8996.c   | 1 -
>  drivers/clk/qcom/hfpll.c          | 1 -
>  drivers/clk/qcom/ipq-cmn-pll.c    | 1 -
>  drivers/clk/thead/clk-th1520-ap.c | 1 -
>  11 files changed, 11 deletions(-)

These all look good to me.

Reviewed-by: Brian Masney <bmasney@redhat.com>

Should drivers/clk/sprd/common.c also be updated as well?

Brian

