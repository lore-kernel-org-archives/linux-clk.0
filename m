Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BF61BC09A
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731936140; cv=none; b=QJ8/6iADcx4xh2YS1JZ4ej2c3+IfPxNwWpztCVABM2TnSVZgu6OOnquWFo1jyd2V/UcEK2e3bCrh85U+dVGuhkLVOKtmTd4PhCLf77nvK8927z3Vu+BntYeqBDdTFL5GpA3ZBE0a2ATwvbwIReU3820r8b6cx+ButmQdxJv7uM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731936140; c=relaxed/simple;
	bh=ESSG4Jj7FxqGyEig0Jvf7BJtg5tXT9+TXdVz5teABfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIzbVRPEkU3vR8nYJnGzlIWNyURJ6x7fzHvs76j/kWti3gHgqrCkNzqfO3hDV9bBorv1LDIbdRQKmlDWaTQzd0wNe6Uc1uTfmTVjMr9vCGWo28/Z3ml5/a/+RYxlbA5rrsAjhHMfQmw/L+tt956nGzNKnEGe501KSwqnKg+k1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iX8dIX61; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iX8dIX61"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43162cf1eaaso29678505e9.0
        for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 05:22:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731936137; x=1732540937; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zMaEJ9Sd/GnLr8UWiwxXSZAacCs33/2tfIwDNrN6hF8=;
        b=iX8dIX61ZTD3BXJGc8V/ICi4/cWYWTLiKbt2IMzotDpPnFBCiE107kM5WtzlMe7gjL
         VZDD3aKMceOS4YU1haIimxKkKpO36bZrjNY3GkhtH+/el+NH61K8Q8atNi4EpobI3WWx
         /1WHYJzMFJRHb3DfbbJQnaJ3nMd110wBk4jhPIR0GLWpg7lYbNebNa51V1dmydUPDvg/
         yBpPqozqok766sUlH800WpKY191Ah7Z6C5RO7ij6ddRGYl+Js7+hIJbBk9MYeQGiBA3L
         Ty9CcTpAJ9A02BC9BV9K9KmAMe8M8/kmlORYOzxlK8Ogf3+xTsy8m6LAUNCXKnmUJCKN
         DqQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731936137; x=1732540937;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zMaEJ9Sd/GnLr8UWiwxXSZAacCs33/2tfIwDNrN6hF8=;
        b=XJiUFNmpeQr7xH5V0ZiIO5yvIaHCCmaOepW28Hlrmbb5WraQDNqlkEmGhCMy17Bhnj
         eRr6sTZT/+vKmo4YH3A7vhUbh1Y4HU3/J8e6XSF+hhkD8kKQUhO+rIhh1Ch6yH2DJrOj
         +3rJc90YuOY1oFuAc7USNMsjpYi4Qy5IH1u/I7pujS4sq+YBlFAm710ns89+fhKnRZim
         /eskAb4Bv5/c7HlMFIN1ozf+EvfVWjF3YiCN6gT2BObE3z/Ohuu6XKj7+ZKQmb7jQtWl
         oM7LlZvIM8ZNSnvaDQ/k80a1RqxNUUPTaHiKRFNoW7K+k2mrqhN+Nw3SD69F3wkYjc34
         J+uw==
X-Forwarded-Encrypted: i=1; AJvYcCUSDKFzu9AJndBAvscgosy06EVfgeE9FSg0rPzesaZ8kWpll/htWdw1ApBgUascahzoooyHeOECuX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDqYFKJeMxi1w67OH+5XJbKmX50+rPYHJjXbL5FjkM0x7X7nF3
	nZeQejCqRExnnICxV5TUwVl0e+3VlVboVtf4PGg/G3wgRFMUpB0m52r0T5IO7D4=
X-Google-Smtp-Source: AGHT+IFWnZuICcQfYd9OsfPN5uKgimr0iEncaQ0yhH8YtgnUZaUryhBBQ+OQ+MhH1O/KiSAnMc28oA==
X-Received: by 2002:a05:600c:501e:b0:431:4847:47c0 with SMTP id 5b1f17b1804b1-432df722c63mr122864995e9.7.1731936136986;
        Mon, 18 Nov 2024 05:22:16 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432dab806e1sm159426485e9.20.2024.11.18.05.22.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Nov 2024 05:22:16 -0800 (PST)
Message-ID: <3ce358b9-6a65-4141-ad3a-bbb826082470@linaro.org>
Date: Mon, 18 Nov 2024 13:22:15 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: Add support for multiple power-domains for
 a clock controller.
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cl4u42hzdwaj4dt5bponhnadou3uecaodtr7iopfu4vhmvttif@bxxvmwmzu5u2>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/11/2024 13:15, Dmitry Baryshkov wrote:
>> On x1e80100 and it's SKUs the Camera Clock Controller - CAMCC has
>> multiple power-domains which power it. Usually with a single power-domain
>> the core platform code will automatically switch on the singleton
>> power-domain for you. If you have multiple power-domains for a device, in
>> this case the clock controller, you need to switch those power-domains
>> on/off yourself.

> I think the series misses the platform-specific part. 

I don't think I understand what you mean by that.

It is hard to
> understand what kind of power relationship do you need to express. Is it
> actually the whole CC being powered by several domains? Or are some of
> those domains used to power up PLLs? Or as parents to some of GDSCs?

Well for example the TITAN_TOP_GDSC needs both PDs to be switched on.

We _could_ do this just for the CAMCC on x1e80100 - i.e. make it just 
for the camcc device but then, the next clock controller that needs more 
than one PD will have to implement the same fix.

---
bod
