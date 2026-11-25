Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603037;
	b=oCe952C0XPwSG1qXBl4PAncY1+oFz/UM3aARb+lYRQJ6PaKkswQY65rwmdAccwJRYwmN
	 kr2m1RPCZenIgg0pL0oPlrL4cMs5i71ZFhNORXVu2UH/+EqCmqiPvYWiu+GK3G+PqDTei
	 b6FyVzeZYYn5HWAnsAu1qFomrlC5i+Z4ZFP6ppUYa08AD9gz+zcrV94OBJa7nr3nyCPZB
	 w0MB08WRHGVkPzb3FZecPw1pYYUyi4z/hYAlF3lL70y6t/xbKvD8Vh1LVccreAPM4FACM
	 4aTkLZbMQ2GrpZfUgJ/X51BZdnwk2ispFMeOy/5hfNc1KmGCpZvhlVlfgQKu0u3VUew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603037;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:Date:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
	b=M3Nn07FvZbUe2sopjtdBT3QxLvwI1cxisBaldzjHMHC7loQk0W4LyL85T3FJb9ptQxEa
	 3eosUTagYoBEDEZ508CqtskE76SapX1QEng64BdbVjAoe8BWuAaOjyNiArHLKkc5w9odC
	 kRBx8MS1/XbIuPYbM14x03a0E6TzmBWDr+0yYGPf4TmiF4b0+akT2dAQeq28YuQlsBHLf
	 bbOi1YOJxQMCrkR2aRLnzbLrs70EVGtyUDQkxlxhF4gBUrtROC+MdHJw++Zhae1in/+B5
	 OVFMFSLzjdmuVA6slcvEwHzofCkhtrd14LoHoRa5huGFPzfLsiX3DwQIxz0A8TzxR8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cnyG9anV;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE6606A32A
	for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 10:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1CE6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=cnyG9anV
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso3187348f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795603035; x=1796207835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
        b=cnyG9anV9+tEJ8LtFELy6ZIeP9iGbpJnEWHEWD8m2xEXLjZ2r6XX6Q0L2BC6eHIuqR
         tFOQW0MTnVfX8wGmdS8DuzmOqGl2PVJyyGl31BoQkuv9j8vdAcUmINALr2JUK92O0MEH
         Sf/7gjxpQzAiKVvT+vBhZFSZpnMTVE5Uem5a2kQFbiw6u92BcUoKZ3NuTsdx8gvPR6NP
         S+5+eG2VG/LU2d2vWySqhLkqmFKhfy5cJ7KSbDDwgy73WMn05lmM4Nw7k2E40KpYUYUQ
         NWjwWU2aSwW2Rb9P317N/kRlukga4FWST7HpoByeDojD61soL/szUpUk9O8VB4CSTE11
         OqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603035; x=1796207835;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjjQ4RF7btdRb/yccVHLGll0ZfchmSlAwpbX+qzuMEk=;
        b=CSRwtW12S28pCNKTtQLTvRQLIOCMFKXmDrHL85jP94q7KdUGH6staYFOu8SwkbTn8g
         gPhbsyfBGWlHHuNqCfnoHVNCpKFZoWE0MPhuDnWR87ae8YzHKz6KCIpJMVJSX5goyjAU
         nnF0wllddlRTSfXisB4n6z9SjkjH3ldOu8CYEHJrnaGjvUyrOvT+Tms10KADi8YRzC2q
         sqq51O8XuJiXaju0CYqJon7pRuAP/IegdeQVEOU9kBXuocYb6r/bafUAzqNwhENyAMu3
         +hy9tjEzVrsMjMM4WRQEt7hhQevQNuUC1JwsxoMPxWIwivrcIF4ZXSKSVCSKctordKdA
         ZORw==
X-Forwarded-Encrypted: i=1; AL+hErHbRiMzi02BANMNN0cP1z/tpuWvHeqilJ0bq3BrHPoEXNMJu4E4P6qFehaz75dbCPlVuCpKOU4PP+Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ex+FiKS1xjl+wZBruIL6dH7QvCYdtx17e6joY2BGf/AlKbMVx
	xokEshV5Oj6qc8gvl3O3C9/EmGcSeDE86+q5+ihYlStmTqNvH/kiOFRpS6WAyD7eLmo=
X-Gm-Gg: AZFdTZfuwtOIkp7wLECFHWuOWu/O1MBiaBJBoDItynBitbgHwjKbxw+rSSFof5evKyC
	WuLkTSY0Po7AC5qmT5zF3vgTkSnUmPYcsQAB5GWa0w9J0swzVVG8ICCTsd8jWht3n4JLa8UiGSK
	stuoWj3H4RB/YDEclD9mYEGAwbh7XrSJBRpytf8RVnzg0QwfTOZNPpgoAcmUqEKK2a4YCfJfilI
	nwDQ1RJlAVNVnyRUgX1/uLxhZEMZnSlTqOxNycLPuvEI81BQD7nga4kQy+dqwJIHaji9nCqPlqD
	SL0jQl09UdrL/ETudQ0d3UXhUFRjI9MVK1/qySGMF76WCsM6Bkj2r5KpS9IqcS13bjRJdYio8MF
	bL0r191vhX44RUU5HAM+VOBRURqbfg1f1BMvUdmysrey9lW14d3kaIxKEuyRG7egAmCHKBkv4mL
	lZTodyZ8PIxGHIDirKQOjhdSW+G9s9nNRmBASvDn9Ejy20oYZp+erYVzpYZr07/ajybsuaL4OJM
	pYZ2hH0yRFW1vJnt7VIz/lDLsVCkUZqqeUoZqJOYYZsNWC/J0eDihCrZ2nH38uTawW0IzM3yKM6
	FICpXgqiKwDR9rJlKQYfBaclyps=
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id 5b1f17b1804b1-4bb8882375cmr360820775e9.32.1795603034960;
        Wed, 25 Nov 2026 02:37:14 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm569732465e9.3.2026.11.25.02.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:37:14 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Wed, 25 Nov 2026 11:41:13 +0100
To: Joshua Covington <joshuacov@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <masneyb@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: rp1: reset cached rates on probe
Message-ID: <awa7SfNvWXcItiBk@apocalypse>
References: <20261124231751.83938-1-joshuacov@gmail.com>
 <20261124231751.83938-4-joshuacov@gmail.com>
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
In-Reply-To: <20261124231751.83938-4-joshuacov@gmail.com>

Hi Joshua,

On 23:17 Tue 24 Nov     , Joshua Covington wrote:
> The clock descriptors are static, so their cached rates survive when
> RP1 is unbound and bound again. The "varsrc" clocks then report the
> rate of the previous probe, and the audio PLL and I2S clocks start with
> stale cached values.
> 
> Reset the cached rates before registering the clocks, so that a second
> probe starts from the same state as the first.
> 
> Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
> Signed-off-by: Joshua Covington <joshuacov@gmail.com>
> ---
>  drivers/clk/clk-rp1.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
> index 1dd276dd2b..60037b19db 100644
> --- a/drivers/clk/clk-rp1.c
> +++ b/drivers/clk/clk-rp1.c
> @@ -2416,6 +2416,12 @@ static int rp1_clk_probe(struct platform_device *pdev)
>  	clockman->onecell.num = asize;
>  	hws = clockman->onecell.hws;
>  
> +	for (i = 0; i < asize; i++) {
> +		desc = clk_desc_array[i];
> +		if (desc)
> +			desc->cached_rate = 0;
> +	}
> +
>  	for (i = 0; i < asize; i++) {
>  		desc = clk_desc_array[i];
>  		if (desc && desc->clk_register && desc->data)

Thanks for your patch!

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

> -- 
> 2.56.0
> 
