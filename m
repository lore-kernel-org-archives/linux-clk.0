Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5381DDC3
	for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 12:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187582; cv=none; b=FIhuElquDN9/8Nn1rkm/PNe+uTckxMkF3AP4RN5h5VtEvAD7IzeT9gnZ3ulEqloAnswJ/XQPeTU4rDSGttA7WDLrQv+NFBaR0+E2yrcV7A4h5oEP+rXQ1aQRuHlAzXVmfq6O6BgBxTxoq0EOlfwz2MUVovhmnwm7W5VUIw9UBYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187582; c=relaxed/simple;
	bh=XhhXlVRw6F1HLo12SCcAfi2XIRnFu3XLfX0xBUiPuF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QA65ONFJ/8zXJ49unnRz+Qd8JdgyFP2nistIO31xuxB173oRtbshqPvXpStSIMr3W833t8K6RciPjlTV0Yn4vG4rjWi8rryMsRi+J4DzUkxTvsP8yNmWMJnGwanGV5s+XzNHAhwbRWsTpNCnIdYnuk4CUumw1BQs0qG+b2uK15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=mn8J/94c; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="mn8J/94c"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6fac7147cb8so78909756d6.1
        for <linux-clk@vger.kernel.org>; Tue, 22 Jul 2025 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753187580; x=1753792380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=mn8J/94ckas+qD6AHT1wxCGpWUUDbTsFqRK2rmVvvc2KJP+c37eNIDchT4R232r0V9
         JICl9zzUkYIkjSRJY+h3o7vY5fQFOEWUzjgTUBxhk89P7WAQZuQz9N6OzFIUVommiUdK
         e9DqWKT3cCZEvsSshQXzoLnD3/gWD2srsF6lHwNa3MdkuB5gTrw0HJ+4+OL/zF1OdLDD
         Hk+jE+yqqqNzVe6WvPWMGNiN97rfPjRlrMpg7EfwBZaYQ2dXdO490NqSM1YJlZ9bv0Dk
         UvL7km8+wBo8iqBB+Ir+S1c0LDEoNiURLpQn6tUSF621M0vbt/FF4pZaabKtpq6L//po
         WimA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187580; x=1753792380;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIXKcH5BFLN2ZbzCLvQD1G6ItZu5liVuUr8w7IySvR4=;
        b=Wd6YU8Yq05GQMWMNFSYEPz9hAVc0qaFQTxMAHkl3dcXgyJRpryvuTOHw7Te1VwyuL2
         hLWbjQT81fU+MpZmS0J3lPZnnI8xSnX1TIyq3m3vPR55YA2m7YGU0DvUP8AJfjuUwSzK
         O+K6Ggz5zaDioFYFOkxhZXOCs7/gMrE3vN2L3cbiXEebs586tlMy26LN3ystPavNixGi
         6QMHr2yQEmnWjoEsNtLxj5EikFYB7fFKIseYPrAMdb4PrwTWlgGb94opsGbSVwq0/f2m
         RAmpDp5IBQL6vLTCJmhSatQCZC1b/U9w1Ku0XKwdaB7VdKKTDNSSnefaY4KTBmCthjYY
         92OA==
X-Gm-Message-State: AOJu0YylQ69yX7lfEL773VB9uFZUTGBLnybY8xk1Wb6GFID6rrXOv5O0
	X32lvducVZ8J8jk89wrCppZLcXDpkAI8xsu3yKD7kwqpxLLHgyg+ERWd9VsC8maZNzQ=
X-Gm-Gg: ASbGnctDtmjS/fGUDsdsEq8COQTlzkmPwue8PGhtBkN0yX+gLbXU0sREK+j5FdThwhM
	WdHkp3ACKQPGSRrgfQI2o8crsbeNi0SZTTSMzEzOPa8y3Prxe46O1gug6CHC5dzk+ZQl4Vdr9h3
	7w7sWVys4fKgEU+wMubMHRg2fJ9n8Jgk9bdJXQ9+o8iZOBH6wlYwbC4aoDsLei5QQ9/aHwDvCpM
	tuJ82FjF/H3yc0vZnM6snAzb66ccBTnpTSEUnPLijqaFNoM69Xkka0PuMvH9HKWL8MM3dJNO1mX
	hfXyxRb65KT2C9OAigvGnaOCYVc3eEjUgK6Fs1HtL3Kv67MpQBYg/mAFJTQLEEVTySVs+I0Er5m
	gfshWhve0GdiSJN+ufdIfRBSHJwZPLNk+c3OstLIDQbGqcVLTsNd891+IKkYwIJjLZbxfQiM=
X-Google-Smtp-Source: AGHT+IG1XORWN4jprJEi5Zq8+C3EGaNg8eBzovmEwMCoERAkUr764LT8y1WytHb49WzOljrg37pQSg==
X-Received: by 2002:a05:6214:5886:b0:6fa:c2a4:f806 with SMTP id 6a1803df08f44-7051a11461dmr225240826d6.29.1753187578843;
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051baa8760sm50251346d6.92.2025.07.22.05.32.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 05:32:58 -0700 (PDT)
Message-ID: <d6f147bf-2816-47d7-9a48-47562b8dde06@riscstar.com>
Date: Tue, 22 Jul 2025 07:32:56 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: ccu_pll: fix error return value in
 recalc_rate callback
To: Akhilesh Patil <akhilesh@ee.iitb.ac.in>, mturquette@baylibre.com,
 sboyd@kernel.org, dlan@gentoo.org, heylenay@4d2.org, inochiama@outlook.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 heylenay@outlook.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 unicornxdotw@foxmail.com, jszhang@kernel.org,
 zhangmeng.kevin@linux.spacemit.com, akhileshpatilvnit@gmail.com,
 skhan@linuxfoundation.org
References: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aH6P3lChCXhi3pe4@bhairav-test.ee.iitb.ac.in>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/25 2:07 PM, Akhilesh Patil wrote:
> Return 0 instead of -EINVAL if function ccu_pll_recalc_rate() fails to
> get correct rate entry. Follow .recalc_rate callback documentation
> as mentioned in include/linux/clk-provider.h for error return value.

"If the driver cannot figure out a rate for this clock, it
must return 0."

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> 
> Signed-off-by: Akhilesh Patil <akhilesh@ee.iitb.ac.in>
> ---
>   drivers/clk/spacemit/ccu_pll.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
> index 4427dcfbbb97..45f540073a65 100644
> --- a/drivers/clk/spacemit/ccu_pll.c
> +++ b/drivers/clk/spacemit/ccu_pll.c
> @@ -122,7 +122,7 @@ static unsigned long ccu_pll_recalc_rate(struct clk_hw *hw,
>   
>   	WARN_ON_ONCE(!entry);
>   
> -	return entry ? entry->rate : -EINVAL;
> +	return entry ? entry->rate : 0;
>   }
>   
>   static long ccu_pll_round_rate(struct clk_hw *hw, unsigned long rate,

