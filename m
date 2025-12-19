Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5020A2BE7B6
	for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766184096; cv=none; b=c2jQ/CW0dCEeispTZIN011iE8LlwmJiDBXAYAiCuxC5svZLBsLJs7gyzy54Ab1ynNcaGP0a3E9wOKFqZljiPhWyKMY/LjDiKxiE286q0bXPdkNqbfCZHUGWiZ4F1fF3mZAUiHrmUDFecdmeIAFaDkz7OW0UT7mjr62HGgGZZ/eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766184096; c=relaxed/simple;
	bh=hgzx5PoMLzGBKv1Ko7649gjCYd1e9j7MWPLV2nFqSkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F6nnM+2LpS906TtLvijewVyZFp8oqpkMh76rp+6XADfSZPG2ULUd8E/G72Bov+jwD87vy/xDdITjYRR1a75H2plqIeWitRwYvrBAegZHIZeNbIwEXCHqD31Jfwe8TayoIceB1hOBHBDacIhi+pdKtzJehm7pXo1xg3tYKMmQ2NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RKN/EUF4; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RKN/EUF4"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f0f875bc5so30591975ad.3
        for <linux-clk@vger.kernel.org>; Fri, 19 Dec 2025 14:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766184093; x=1766788893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZFdCAthq5ASj6VHc2YGV5WzUN0LwLQOv9WVjruH5x/g=;
        b=RKN/EUF4GY/UbqQxqr01x60TF21tsPBDP9uWj0+YpbVsnkxa5GHjuwe4zGzpF7bXJf
         RTZsvvVdmpeWwn9L+SgmpzxZYsEayW1VAGZ3CU53Tu4E1D3Lknbyxz/hMRmwTOfmM7Cs
         rNARS8iaAm1gTaymNBwmkPS8k/W0YIbkqy2LsuFNJk6yIX8I3YQzyxmmCrTuCGKDD7If
         jhW05td/+xdoMd3Ytrpr1d62cG6eAh5OQbq9OazXrJAhjBCHKrxq6Ecg36Fih7L5ZDLE
         vRSaWalv4kuESH1U95jcGE2NQS+WF8dK5iRSRxF5xBThf95Re9gGtVtwqTzvJVbEADfO
         JRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766184093; x=1766788893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZFdCAthq5ASj6VHc2YGV5WzUN0LwLQOv9WVjruH5x/g=;
        b=FceRxa7bpOIOKG//cO/hMS4zqRk+GF99LCGc4EhOCbIZ9pN6gQU+il7d5VRXA6EyOC
         SRxRXS2IjmllMTcjf3lh57UsHKSH6XdnPBc3MCJLeDi1GHUoRi/I3YQ5IXhYQ9TlJJkA
         AcLy0Qu+jePyA/K4/MocuVF8Y2qf2Le/twZMhC6YARqpS+3zz4ujyYR1xJWhQ30PBuO8
         rhTWxGKXwFxy64OsH4GDwt1NOOql7NlRt6YJMl0oFCLI+LcpusIyVsXJj/vi2FAfUwWt
         HG+hwM4nzhrxjW/YEEXPxVPjiDoS6sRddTgFtaWwgh9Fw4ob9/B1Zy4h2EGTJ5mhEmmY
         oqtg==
X-Forwarded-Encrypted: i=1; AJvYcCWBb9QuZPev0jfOfnWaBa8X6WR8XnuwxZ+6s2hKqyYWkXI+53s+V+nDZMcP/77hwlr3Y43v1O4w2EM=@vger.kernel.org
X-Gm-Message-State: AOJu0YznEiC8R1N3W4Tc5gehxNle1TloFqyAsK0q/lTAwV5DEVbCGTmA
	rgvWmBMlHisl4UQMaDkAXbsD/8lc3gG65GpozaWZuMPiVAA5o2eU33Zt
X-Gm-Gg: AY/fxX5g4g+PJoAJk38HtJAOL+dGr98HGLZHhFMRFBNJU3gnCA6kXr36S0FxGlsBp83
	M/392gpkqqwvjKTbpvlOdgioilVgjVIblm3NGhQZqnBgZ0C5UeI5ZrybOJoxwp5N86euklMFhB8
	oTBmdzEIEBHs/3E46TGXyQKsXHNqaaadZbSPIOSZZrGLBwbgBqQD2YFdY2OX1+MKdFP196Oy3dG
	m0Zv+wPdZPu7Y8ClK9AibRGXKrUr/WYIjuKBQxOMtmuobNMfyAoM32QuqshfY3r0/ny7ceXb9hU
	jp1nTaEnBBysAXQ2ZXSFwqbtIkJ5XzG9uxUW8aDcHkPauzbq0a9hGDxoXw+D1/TmGyK0Lbxyccx
	EjeVY2ez3eFlM0Ufv3YWAEoXFI86eayxKb6VW54Rp5MZ/VsyT+hCq4KEZVW3vcYGu/NVNNP4Z3u
	p9B6QSdzJZdL0t
X-Google-Smtp-Source: AGHT+IGVt+A1lgqxcT4FlSvp+xbq/a0lG/KBNo3OI5rmHpthKmsWmE2H4WLCb8DIHt5ZxU58e/rv2w==
X-Received: by 2002:a17:902:ce81:b0:2a0:d63c:7853 with SMTP id d9443c01a7336-2a2f2223714mr37358695ad.16.1766184092672;
        Fri, 19 Dec 2025 14:41:32 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7c5307c7sm2983673a12.28.2025.12.19.14.41.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Dec 2025 14:41:31 -0800 (PST)
Message-ID: <ade7690d-14d1-413a-b4b5-eda91d64207c@gmail.com>
Date: Fri, 19 Dec 2025 14:39:41 -0800
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] clock: eswin: Add eic7700 clock driver
To: Troy Mitchell <troy.mitchell@linux.dev>, dongxuyang@eswincomputing.com,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bmasney@redhat.com
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com,
 huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com
References: <20251113013637.1109-1-dongxuyang@eswincomputing.com>
 <20251113013846.1222-1-dongxuyang@eswincomputing.com>
 <aUS9bLVLhIPMOcWa@kernel.org>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <aUS9bLVLhIPMOcWa@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi ESWIN folks,

Please refer to my comments below

On 12/18/25 18:50, Troy Mitchell wrote:
> Hi Xuyang,
> This is a quick review.
> 
> On Thu, Nov 13, 2025 at 09:38:46AM +0800, dongxuyang@eswincomputing.com wrote:
>> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>>

...

>> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>> +			    unsigned long parent_rate)
>> +{
>> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
>> +	struct clk *clk_cpu_lp_pll = NULL;
>> +	struct clk *clk_cpu_mux = NULL;
>> +	struct clk *clk_cpu_pll = NULL;
>> +	u32 postdiv1_val = 0, refdiv_val = 1;
>> +	u32 frac_val, fbdiv_val, val;
>> +	bool lock_flag = false;
>> +	int try_count = 0;
>> +	int ret;
>> +
>> +	ret = eswin_calc_pll(&frac_val,  &fbdiv_val, (u64)rate, clk);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/* Must switch the CPU to other CLK before we change the CPU PLL. */
>> +	if (clk->id == EIC7700_CLK_PLL_CPU) {
>> +		clk_cpu_mux = __clk_lookup("mux_cpu_root_3mux1_gfree");
> It seems you want to switch to a safe clock source before setting up the
> PLL, right?
> 
> I am not sure whether your approach is correct, but the use of
> __clk_lookup() should be avoided whenever possible.
> Would it be feasible to obtain a proper clock handle somewhere and
> perform the necessary configuration from within a clk_notifier instead?
>> +		if (!clk_cpu_mux) {
>> +			pr_err("failed to get clk: %s\n",
>> +			       "mux_cpu_root_3mux1_gfree");
>> +			return -EINVAL;
>> +		}

I have a strong feeling that this switch to safe clock and back to PLL
can be done with something very similar to this:

"Add notifier for PLL0 clock and set it 1.5GHz on the JH7110 SoC"
https://lore.kernel.org/all/20240826080430.179788-1-xingyu.wu@starfivetech.com/

Please take a look. Thanks!

Bo
