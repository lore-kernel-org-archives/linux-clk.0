Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E36331214
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 20:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782763979; cv=none; b=Fxd412F5Z63XOEpEUcV8Zrk4h1BJtjqi1zLLB0UQU3JrnvOTAMen8VLY0VTg2c+ssm9Wxm8jbzLGSlq/H9RLlgjqBrp9sYfvsDm4F3vslXe4SJCZ3+z9Wvgv1MmLwRKh4sHdM7RuS6M0hopB0+52QHdKB3AgkRy3Bejm3QJa5jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782763979; c=relaxed/simple;
	bh=NeCSuH2nt5U2su0eIIYO0ttmAzpMlgQ9sGDO2MYNERw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpW+TXOvODflMPB1nfvpyvF2y2mTR2Xs5OYcN56KixjJJJGjtCFrIT07nLrdUm/QGqmDqAJWYtrr32BFiWz4dBH6/Dpcpojk7XP92kVrzmIf1BaZoQSt5bD8mZxKLqY9JN9lb3Q9T5aiUFWaIL14cqYWqzophVffWqBmbm3vl5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EfCrCmE7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=moO70y36; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EfCrCmE7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="moO70y36"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782763977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=;
	b=EfCrCmE7IIXNIWxqSIxPlwQrnYuZKwwg2oK2YgLWTpnLSvfuQx+INiFeepvOr6y9XMlHiK
	rYUYrz+42UxIPFiN9GCCnHaBsYqtDvlzpLy1y9xlnEny09vBh0XgQ2e07fdgCNf5AkdGGV
	L61W36JkOKpmE1UCFnTbCjT9CtBYpMA=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-INPyPoomOcyd-Ub-5NjCCQ-1; Mon, 29 Jun 2026 16:12:55 -0400
X-MC-Unique: INPyPoomOcyd-Ub-5NjCCQ-1
X-Mimecast-MFC-AGG-ID: INPyPoomOcyd-Ub-5NjCCQ_1782763975
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9d585d046so2713134a34.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782763975; x=1783368775; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=;
        b=moO70y36g2xcFU44CzaSiIR1Fy55MAlJOov9qsft2wiZwyLYh3PJhrl6/+Hr7tPJzO
         HsQpJwHOYW43Y0LHJyd0Almsnk2UINkP+z5OwbnrOkCSD6pn243LKK+HlOY9HaYiMJkI
         oiNztgVEAUI3lJJ/Ebf7q+1tpryLln+aU8mNhybokK8bLITHDZcDVb2c49/ck7hhIIrJ
         ly44g7cyciccM6IA3+H8TUCzY/orqxm73el56+e+csB4Zwl338FdF4IY59ZGtqzQfVTH
         ybDtz64ySI3BTCarZMxISHtaUTIsu/PBMyIpyfvOYnPQQO03lvYF873Jj6xhy2xQN/U5
         XV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782763975; x=1783368775;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qRLe+V4vhd+rp9mv7dWMWv7QlRgt7F0xMaqSp5zX+2Y=;
        b=LbAvHC0YRueEtuaWZL5Sb4wzjrKu56EooVv8UkyHEBV3LK+dOntqXBnKcIE++Zq9UG
         SZpjve3Bx7mDwKZ5KMS8G1MnKaHEeNDimeKeJkiMSB7jGT59uhUlDerdHqrvoIOuH2ly
         JGbNKc0dQsgrFuZ2tsNMQCfkoBvpvjwxlXse17zKnAO8K0/Piqs4psHGkeRdYEPWp8x5
         pLBshHLKx02r3Kmz7CYefUcZLiHua6vjXWH+kErwxTK2qOr/A6ZH6e2fbgHfqRAiZk8v
         r7WjsJqBa0jmoROwS0mlKeGCgadsLaBBwH8Czry3EiHlyFeDzUDb668u4l4eoqC1XU9B
         B4Uw==
X-Forwarded-Encrypted: i=1; AFNElJ8+XxMxldu2KWw7oP64fCnadlmhIRl5MCSwBBEafURY54vL1JL38KLCsRQX7ObWmu77E5kituFF+3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FgLusX73LwcPwl2Cav1xkHMSFj4+T4SYH+QhSSyc0nFIeYI7
	zY2RANQzlnxDWqNUV1RXgHv6dWIMgoRkiGRLQIl69K0H4BS58RL4lmOm7O9B1yzsQ6x8QUIMpVu
	42g9weUH7FiZn/UZ5tIYiai4yLo7ss4vdkw7oSF2HGKg+MgUw6D+mdiN4EQAs5w==
X-Gm-Gg: AfdE7cljkU5XMfTVYxpd127R/nUUN+84G+mIevjXyVWQiFR5e6Fy+ouAJ6H0zrsygNf
	ewlsIaZ8+dos7qwNkOh5CJWsOAROu10q5+wbcIdwWrXt1PK4F9y0wT2R9Io9VPrWMS+ytb141nM
	t59ndHGpbjJNDVuLN/v4yxah6Tq1iw9fFrd8FMnCqzbhorqhDCdCSkG5VPmf43y7Dqwg1BWeuAJ
	4zYS7eCBRR7Y9LgN8Ph9PE3gnbDFx+opEwc9hBYQUhjdTdfhqbUtqqh6YEHNjdbEj4Cqb2G975L
	nozzOuYUW6P/9krq1n0j4Jl/T/EYZ++2QfzGkhUX8+LcaC1cd+frV1RyaTdlMlHkhB/skiw5ar3
	pRZouCXT+gg==
X-Received: by 2002:a05:6830:1b6d:b0:7e9:e9bc:ae84 with SMTP id 46e09a7af769-7e9ecb902e8mr408274a34.12.1782763975144;
        Mon, 29 Jun 2026 13:12:55 -0700 (PDT)
X-Received: by 2002:a05:6830:1b6d:b0:7e9:e9bc:ae84 with SMTP id 46e09a7af769-7e9ecb902e8mr408259a34.12.1782763974655;
        Mon, 29 Jun 2026 13:12:54 -0700 (PDT)
Received: from redhat.com ([2600:382:8127:f62c:d44b:25b0:6b89:f501])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9ec307edesm585857a34.21.2026.06.29.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:12:53 -0700 (PDT)
Date: Mon, 29 Jun 2026 16:12:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 1/3] clk: clocking-wizard: fix clock difference
 detection
Message-ID: <akLRwsEQEd3JGcvz@redhat.com>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <20260506200555.2558434-2-colin.foster@in-advantage.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260506200555.2558434-2-colin.foster@in-advantage.com>
User-Agent: Mutt/2.3.2 (2026-04-26)

Hi Colin,

On Wed, May 06, 2026 at 03:05:53PM -0500, Colin Foster wrote:
> The diff calculation didn't take into account rollover. As such, a
> target clock frequency below the requested rate would not be considered.
> 
> Before this change, bogus diffs would be used to determine the closest
> possible clock:
> 
> 8<--------
> clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
> *** Clock wizard - Matching for rate 133312500 parent rate 99999000
> m = 33, d = 1, o = 25, freq = 131998680, diff = 18446744073708237796
> m = 34, d = 1, o = 26, freq = 130767923, diff = 18446744073707007039
> m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
> m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
> 8<--------
> 
> After this change:
> 
> 8<--------
> clk-wizard-test: requesting 133312500 Hz on output 0 (clock NOT enabled)
> *** Clock wizard - Matching for rate 133312500 parent rate 99999000
> m = 33, d = 1, o = 25, freq = 131998680, diff = 1313820
> m = 35, d = 1, o = 26, freq = 134614038, diff = 1301538
> m = 36, d = 1, o = 27, freq = 133332000, diff = 19500
> 8<--------
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
>  drivers/clk/xilinx/clk-xlnx-clock-wizard.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> index 032a688840d8..88b47b8cc387 100644
> --- a/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> +++ b/drivers/clk/xilinx/clk-xlnx-clock-wizard.c
> @@ -408,7 +408,7 @@ static int clk_wzrd_get_divisors(struct clk_hw *hw, unsigned long rate,
>  			if (o < omin || o > omax)
>  				continue;
>  			freq = DIV_ROUND_CLOSEST_ULL(vco_freq, o);
> -			diff = freq - rate;
> +			diff = abs(freq - rate);
>  
>  			if (diff < best_diff) {
>  				printk("m = %d, d = %d, o = %d, freq = %llu, diff = %llu", m, d, o, freq, diff);

Stephen didn't pick this up last development cycle and I'm assembling a
pull for him. This doesn't apply to upstream.  Please post a new
version that applies cleanly.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/xilinx/clk-xlnx-clock-wizard.c#n341

Brian

