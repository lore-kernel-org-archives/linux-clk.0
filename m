Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28C477984
	for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784817227; cv=none; b=EniHOajgYWyQlNe5BXM8SW6Cqnpazk0NGGBP96gAz4Ctcb6bpXJlvJ0mtwJcHZScVXICcdcG+a3G4CZuEdb77F5SbAE+c2kHwjYUSRco22nm+DJPX8BlAfqgxCouQqlrSiiLQrAFiM6a24y4Tn0susFtW/IRDd246sKkxs/Zohg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784817227; c=relaxed/simple;
	bh=m9SnMkUX1tTQB6NO65dVN/roFkfDpAoBwsExIR6ZDZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WldMQYvCoQOEvat4ajwJqKmEQtCbOLc/ySjh8TphJ/NwUOBe566CN+f1xGv2+NBmELKqTLmhgF8s41ghHZzyHk3dau0hUAhN/BJ9TDe9q6MwspxJiTX38iDwnNE8D2wsvh/rNODlYE9Pa7Cgx6TehwI/WLgAn/I+oULfVzg813Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wvf1JxYZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=UFIxQxKv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wvf1JxYZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="UFIxQxKv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784817222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
	b=Wvf1JxYZ421i1SK3LMEb+WfAOK5x6A+iFrdG3zHSE5kbXCYttUsiwAPjuLWf/KfDOhawAR
	EWw3zfuPWQ5Cj/Jt53lJxb2eZ4BVMUcs3qHwTeH3rp1kfJ8yFFN/H8ct4tTtRKRG+N0Qqm
	xPpFL82y1gVCHgh0s7zw0RhAsHnmSV8=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-F-2EcW8wNLSRIYHQ3HMVSA-1; Thu, 23 Jul 2026 10:33:38 -0400
X-MC-Unique: F-2EcW8wNLSRIYHQ3HMVSA-1
X-Mimecast-MFC-AGG-ID: F-2EcW8wNLSRIYHQ3HMVSA_1784817218
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8e97889ac8aso14259596d6.3
        for <linux-clk@vger.kernel.org>; Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784817218; x=1785422018; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=UFIxQxKvshLj6Ov7uMzFME4atQc5u7W64zO12Z8b2SRYQgMB54b9cZIa1cXP7Chf9K
         IvCaj+TkG7B9r11P0iBmuo1iln8tHE+WwQA7OR96c2crMwBYnzLjANbUtbzDm6QXUFS5
         duFfwKGT/0LhO1Jp+r3FFqqHfHoRFvrIPnuadW14Z9f1R3rfhGWVrlM84khYI8c3EfcF
         MapV7dKNfqR0qBN5ajsN2+6fhd9uxUVNbvczGZJpjJpk+P49VlByocb8B6FIHbXNnnmY
         zb4L16bMrHvqL58xQqpCBjGsyvsW1xWhN5GyS3IJwDcZY/c4GaEfZboMQVkNXmgGBJfS
         uieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784817218; x=1785422018;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2njy+/zspbCzy0izhWL1wi7/dDBKbdf0HpY/B2TDfoY=;
        b=nUHcCYCkxhDukNDVCSn/MHnmiIrRr5/mzW6nOop30eXUg40OcQ2uEVfVbMXFo18Na9
         aeMlpya+imwASIacYZ0XjEOrIBUQNKiLv/hm7chP1Wy4FfMatIYEDKBFHlD5/zh4EAxV
         aCyOL+pdSiWlWSFuZixUhK1bLKP30mvhobR81oAdVQXju78bVvcZwTLy7yfUmp32geE3
         a8hvHMW7+pba2f/VXOjUPzJ922+lY6SxsMb+b2k75GOT26kmVlW2iQGT3BHspOVppctB
         4EGlNpaD5xyg2R/pA7RBRQVMi272wGOl0sLo6A86XtRwe6fu9+Ud0u98tl1JWZOX+2sw
         PeBw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+oCxS0brzuDm5290bowTj3vzFS1MhK3NYgNKj/KpZZbcwb/fL1QSOpdUix2qmttWYLRMjQ8cpApg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkADNL5bWjEPj1z0t9yslyLp0NMoNXccQILr1T/QUIfhFTN9Qi
	HvG+bFZZFGXrzKxZuSe13/ehFQ2tspKaTy4fulWykE0BvyoCyPPxnuoWNVdKLlJsXCVjzZPRlsW
	uJac2uWo0BRJS8n5ygwT8kcFUpqBKq45SEzi9VtEhbknxxuQSclQN0TW07/H9Dw==
X-Gm-Gg: AR+sD10tQJQ//eD/k1nlZrLDo9ttoACy3rnZEzJF4xcHB/QscQRWG6soTgRR+jXlwie
	EnrZ1ht3LtYmZAeojlfspn4X3AAMP8CaLgu4iVy3bMxeQhyaBBP22m20jiwGutLbBuPb3gSlJ+m
	DB+f/f3TrIQSgJP1/A75DJ11I27oAC+j32xYss8XrScjuCPxfGb649CxUliskE3gkehK8Kgn3Fs
	iuO2fZWSvpqhbZe/MrRXxwaiu3dEUfWUpwO6x0e393+UAA6J3+UYPBj+SATsSMNVAoRpDPr02O5
	xqGTFHUdmb38pVZ8XLHeElVK73Ux8Gc+WcyDt/4bX24rkfd+A6xT6u54oZKJT9bhAYRwnZw1fxh
	2BjpKs+h01M5Oo6Tv0hAfqlGnICNUit6AZ+I=
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40226006d6.8.1784817218176;
        Thu, 23 Jul 2026 07:33:38 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa5:b0:907:aec2:6cdf with SMTP id 6a1803df08f44-907ca363063mr40225316d6.8.1784817217491;
        Thu, 23 Jul 2026 07:33:37 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8b5f85sm46744846d6.2.2026.07.23.07.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 07:33:36 -0700 (PDT)
Date: Thu, 23 Jul 2026 10:33:35 -0400
From: Brian Masney <bmasney@redhat.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] clk: clean-up simple provider misuse of the consumer API
Message-ID: <amImP6sFlv-sNhMh@redhat.com>
References: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-clk-provider-simple-clean-v1-1-0c9668240467@baylibre.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Thu, Jul 23, 2026 at 03:20:59PM +0200, Jerome Brunet wrote:
> Clock provider should not be using the consumer interface.
> In other words, a provider should not be dealing with struct clk.
> 
> This change targets occurrences for which the provider uses the
> consumer interface and corresponding clk_hw interface exist:
> * __clk_get_name() -> clk_hw_get_name()
> * __clk_is_enabled() -> clk_hw_is_enabled()
> * clk_get_rate() -> clk_hw_get_rate()
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
> The change being very simple, I did not think it was necessary
> to split it into multiple changes. If you prefer it to be split,
> just let me know how.
> ---
>  drivers/clk/mvebu/clk-cpu.c            |  2 +-
>  drivers/clk/qcom/clk-hfpll.c           |  4 ++--
>  drivers/clk/qcom/clk-krait.c           |  2 +-
>  drivers/clk/qcom/clk-rcg.c             |  4 ++--
>  drivers/clk/qcom/clk-rcg2.c            |  2 +-
>  drivers/clk/renesas/r9a06g032-clocks.c |  2 +-
>  drivers/clk/rockchip/clk-pll.c         | 24 ++++++++++++------------
>  drivers/clk/st/clkgen-pll.c            | 20 ++++++++++----------
>  drivers/clk/tegra/clk-tegra210.c       |  2 +-
>  drivers/clk/ti/clockdomain.c           |  2 +-
>  10 files changed, 32 insertions(+), 32 deletions(-)

This looks good to me however can you split this up by clk subsystem at
the very least so that the various submaintainers can pick up these up?

With that:

Reviewed-by: Brian Masney <bmasney@redhat.com>

