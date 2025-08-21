Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D3D25B30E
	for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 18:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755801003; cv=none; b=Yr+Qz5J4n+b9CBnmSWWEyu5n08myJfY6XV4P9EPcUrluWcBMu360OsvreflDg6oPQHmT2zZZRXjnKD1gVoEqCEcMLG+uZcpRu/UCP7eZj1RU8z7bcJnJ6IeuvBK19diI2zo+JgZiDAYNkvjxv7CT4GuiLn/SVjqubEp3uSWorHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755801003; c=relaxed/simple;
	bh=ybiNjcXgyPDUVFsLBLcWU7xqEVKtRmFUSuJNCZp1LJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUMGaUdVX2wZLxyNGCObW8g0ShuthWG6ICrWC2KGJ+WgO8XRbo06EPS5L+gQegqqRtPwvKUTolSY5IwTs26/NCAHOkuzKPqjOkJhcHfIIKMqCWjVDGnTGJy1E6xnMNN0LMLgdmJB+HaDwY9r2u71OZ68XIIDOd+xtcbC7SQKyIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EEB7sGLh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EEB7sGLh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755801000;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yhECXnCIPDw3Lg4MBh/5jtv3LHZEJ/t3IMSb4dezezI=;
	b=EEB7sGLhHNuL5mwAJdBEVxryUo+iJIOeJpdrlWkN44gEAsoAOHXtr0AaS5635bQgE0B/lH
	PE7vwt5aBR4wMmfVCK2BMUTaXpQR5ICXHhrmlmXkjul8Qr9qK0tdtErKY8pxO1GyWc+mXS
	0BaxRA6ls4sKK7EoRDa8dUZJsLCoYO4=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-dGg9ERqDNn6cz-mtKnawuQ-1; Thu, 21 Aug 2025 14:29:59 -0400
X-MC-Unique: dGg9ERqDNn6cz-mtKnawuQ-1
X-Mimecast-MFC-AGG-ID: dGg9ERqDNn6cz-mtKnawuQ_1755800999
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70a88dbf013so29102666d6.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Aug 2025 11:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755800999; x=1756405799;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhECXnCIPDw3Lg4MBh/5jtv3LHZEJ/t3IMSb4dezezI=;
        b=rYGC5QoJJY4cIi0Dg9VBh8yiQa4huXyh4gMcjcejIotb2Ky/kRcXTDVZdxXxD80L7v
         WR7uceEBLO+Dw5sFsbqg39NWfGbC08LHEMS7GiwB/mr3rITu5L/vMWIkn11v5z7AkQgI
         /3Sg1nn8mehQnu+9GixBjQuUeuSSS6hECJbh31yq50JB+v8u91GgYLdbpphufw02B0wx
         rZPzVmVu8xnyRKTZ9nkZ9MtYXGLr2zDakat1Z1w7RmzMs0/pIUGVflKwmyOF4M4zrPCN
         C3AQLAa4q/m9Qd2ZnHUmxvrCqFXOvSG+5zlvGQ+wLvUJqaD5cnyB04Ztx9M24a+zDTvu
         gi7A==
X-Forwarded-Encrypted: i=1; AJvYcCVSfMccdWTVlNE6exLhIr7gHLF5uxnHVzkBwXrie7qOD5xC950Km0/ZqO0GpINIXo7vKf6vCowqHcg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaUMmvDfNT61jmXgzeBULZUNFy9+F8m10DJ3bT7LhEr7FKVmBj
	WaIgn4NNq21c1yrcYurUQpYXnsIa4VQLQcuqmIBincfa5fmdJL5ZjP9nPeXpbcJX5cATPRl8jVS
	Q8sSK7JTkb8dkG+onwYO/TBJTfKU3DvHuB4JVPL8uReyIpD5+Q0F0nXuCr8Yqzw==
X-Gm-Gg: ASbGnct6ZSByBFPvm1qvxdcrb0E4ebpnmni4rMnPWBbLf4c96lcc/+XTFrAid3RQf0k
	h2im/bGr2bMI7TAAwzjLvXK+pwsNSWw+QtZS9qVvrddWfscfi2aVGf4E5vnV0Kk6xY8wKKhZCdi
	EHQts3K5IUPXNeOeNNNSM6Hlw3+rQxki/ebqSholY+3moAPxB5U3m/tsSo9+itidl2PoDQl+KAA
	D82AzyV7SNYvRFi3Yat4Y/TmwB/Rm9FBwhlB1Flre0N8OKTzRaYhsthvDqX44BQtYfc60YgCDPw
	9PqfcjZhsfh3O8Kve6tYnTELx2DgU0AgnsR0H3Jmz3EGtHZUARp3LEf4hsuv5kk=
X-Received: by 2002:a05:6214:411c:b0:707:5d90:5e92 with SMTP id 6a1803df08f44-70d9712564dmr7627136d6.23.1755800998805;
        Thu, 21 Aug 2025 11:29:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHe8EN56eHT/hjQKp2x48P3siaQqYBM5dZ5CGM9Mf8D+ZZvBzIAW/a9XWvDRsldQ0ClduM2xQ==
X-Received: by 2002:a05:6214:411c:b0:707:5d90:5e92 with SMTP id 6a1803df08f44-70d9712564dmr7626826d6.23.1755800998251;
        Thu, 21 Aug 2025 11:29:58 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba9097dc4sm109917596d6.26.2025.08.21.11.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 11:29:57 -0700 (PDT)
Date: Thu, 21 Aug 2025 14:29:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: thead: support changing DPU pixel clock rate
Message-ID: <aKdlo6R3ER99klYn@x1>
References: <20250812054258.1968351-1-uwu@icenowy.me>
 <20250812054258.1968351-3-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812054258.1968351-3-uwu@icenowy.me>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Tue, Aug 12, 2025 at 01:42:56PM +0800, Icenowy Zheng wrote:
> The DPU pixel clock rate corresponds to the required dot clock of the
> display mode, so it needs to be tweakable.
> 
> Add support to change it, by adding generic divider setting code,
> arming the code to the dpu0/dpu1 clocks, and setting the pixel clock
> connected to the DPU (after a gate) to CLK_SET_RATE_PARENT to propagate
> it to the dividers.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 87 +++++++++++++++++++++++++++++--
>  1 file changed, 82 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 2f87c7c2c3baf..3e81f3051cd6c 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -55,6 +55,7 @@ struct ccu_gate {
>  
>  struct ccu_div {
>  	u32			enable;
> +	u32			div_en;
>  	struct ccu_div_internal	div;
>  	struct ccu_internal	mux;
>  	struct ccu_common	common;
> @@ -198,6 +199,78 @@ static unsigned long ccu_div_recalc_rate(struct clk_hw *hw,
>  	return rate;
>  }
>  
> +static long ccu_div_round_rate(struct clk_hw *hw, unsigned long rate,
> +			       unsigned long *parent_rate)
> +{
> +	struct ccu_div *cd = hw_to_ccu_div(hw);
> +	unsigned int val;
> +
> +	if (!cd->div_en) {
> +		regmap_read(cd->common.map, cd->common.cfg0, &val);
> +		val = val >> cd->div.shift;
> +		val &= GENMASK(cd->div.width - 1, 0);
> +		return divider_ro_round_rate(hw, rate, parent_rate,
> +					     NULL, cd->div.width, cd->div.flags,
> +					     val);
> +	} else {
> +		return divider_round_rate(hw, rate, parent_rate,
> +					  NULL, cd->div.width, cd->div.flags);
> +	}
> +}

The round_rate clk op is deprecated. Please convert this over to use
determine_rate.

Brian

