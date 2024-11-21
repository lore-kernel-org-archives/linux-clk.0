Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031D21DE3A6
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 23:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732231559; cv=none; b=tMP8MBWVFH4ZgltAvy5HJV2BjfPr8VmtMzB9cc/qAgiqfqXVCo5uBa7QmL27YDlsQLqgJv6xsSl6oq6D5NVFfsDxHQ+1oVm03is3p02rawmYvi8PQ0LWDxEcLFZViHlHZupAlTZ+wE1ojrgAKBW9jSO513Jo2tvXpWCntAk/4Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732231559; c=relaxed/simple;
	bh=xYgsEyqX/nrv64zgWbndRQLzhHiaVrJMeBBnEJnAUf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KmtGqdyZQVompZhNYi57ZLaH6qPE4daQmcgvcMRrtpQQ4t03O8u1V/wyLjMOeI2uts2y0FQv3AjZ/iKK4mLmG0xLu5isKmUPpNY+39kzbvwZZZl6AUsYNOrgevWILVFcHI/xZ0lYwCR1QKSnyrkOJL+6KJ3GGYEDvslBantz8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dy6Vxf3d; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dy6Vxf3d"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43193678216so13531205e9.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 15:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732231556; x=1732836356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Iky7t6Q+RBwcmkvNugtP0jm94OiaVAYR36AYKJtXDso=;
        b=Dy6Vxf3d/FGxyojuh9/Q5Caf94q7crHU2fShvk97+F56Qoy5VTY3pm7992PKpPiEU4
         ZYna5PIy3r/+DedxcMWxXjs74m/zeYcSYqcziAsVP/V0zcxefx51NFnQcnEbZuoFoNP2
         1IGKW42wI9NVZuUYqwSWWRQGtNcxMR7tg7J8RZZXN966X6gwFz1vroK+Pm9WlXLQ1PfR
         VxioUyqRWE/G//oXpn9iFPShk7BUqRPZhM8w1Np4S6KQWqxaCqKkCD9yUooeMZYwBWhm
         TzL0OdIF1U+3+1NMsM6CWYTSnhMjg7IJz8OiwklnnO48iFW46h7RrNmezmKWOfKdKdR5
         EG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732231556; x=1732836356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iky7t6Q+RBwcmkvNugtP0jm94OiaVAYR36AYKJtXDso=;
        b=v7WUPdy0vzvNsLDZgvoa1GnQn6tQfvpMpG0kE07Daw2ihv1DVblfoA/mscuh5jiBGo
         LMQ3wGYrmAxGnobslTbeJS6f7Gd4bIK5eNEILOp6hbl5w4uGSosNNYzrKQCmDJkQKgJP
         +Kf3eog3yiY4S6NP9kiDeNyNL846PFEBeu7nTm+ipQH/tlvvxDOyg0w9galfFEXRNkGe
         A5e34qmQm1FG+36GsfXtVPRl9jbOWzlm2xoToyVhK+CNp/MZroF4Jqw7KRfhra0opZCo
         ueIs4vnzW4uXoKIUGH+3nH6upO0UH/rKSSnUPErFLAMqkg4KjFeao6W0l0M/U5M1MOJ5
         ZexA==
X-Forwarded-Encrypted: i=1; AJvYcCXvZYMkLpLT3ML6nHFLG71JJFuF8y2wc4y9fuqXZwvvAMslbZ9ov8yJvJBq+n++1KKCzWzp8apcgZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfceHqIJLV5lQRx9xy2wlgm+bMf5Agspz9ZNhN/hWVTm2EnGGD
	AV5WuZ4K9JeHK18zlCWzWYMYhDgA0A8m5D0FHfIqQp3yCwb00vkiEgwRMpe4RQQ=
X-Gm-Gg: ASbGncuo6284pMTprtxuDOC4wTMzycrSjVwvgVq+31qaUo5AbAGSinzmE32k+ASfR+I
	eF4XN8irxFZPPGxAYxRKelavBsTNj25rY0sy9wlCnnX3TnCMLG97cWgZWN69u6t7YhKsDpylCNa
	N+2JGmS2IEc2Tgj0AXbATBRvISC6OnoEFHoZNuEFLHoYhY4FqVkogCXTZFg3ADwHlTYZOHhOHKz
	NwZv72/NO/7+XK2jD8Tmd7yhPRYpTCIjHOa0b5d6/zGtIv2JOM9m/JYsi7PXfg+
X-Google-Smtp-Source: AGHT+IHZlEqAmC4u1AVb59drMSS6PU4rPjTcSOo8R5q0avIDJN1hm3vFKz+q9yZBVRK9BRRyVbVDzw==
X-Received: by 2002:a05:6000:2712:b0:382:495b:7edb with SMTP id ffacd0b85a97d-38260be6712mr444022f8f.58.1732231556248;
        Thu, 21 Nov 2024 15:25:56 -0800 (PST)
Received: from [192.168.0.200] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbe9013sm820052f8f.88.2024.11.21.15.25.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2024 15:25:55 -0800 (PST)
Message-ID: <92d71031-c148-43e3-9a8a-2cf92e9808bc@linaro.org>
Date: Thu, 21 Nov 2024 23:25:54 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: common: Add support for power-domain
 attachment
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-0-b7a2bd82ba37@linaro.org>
 <20241118-b4-linux-next-24-11-18-clock-multiple-power-domains-v1-1-b7a2bd82ba37@linaro.org>
 <u6azgqlmncadcwiz42pk36q7rehwajnftvwfjh4aoawskdwkof@ao2imoy34k4y>
 <587de15d-06c8-4f12-8986-f60a80fe5ad8@linaro.org>
 <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <hfkvbshgbhz3dst44kbdxxy34phrqtysxbfchuvefars7ibrwt@jqjl4oca6g2k>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/11/2024 21:59, Dmitry Baryshkov wrote:
> Is it for the MMCX or for MXC domain? If my memory doesn't play tricks
> on me (it can) I think that on sm8250 I had to keep MMCX up to access
> registers. But it also well might be that I didn't run the fine-grained
> test and the MMCX was really required to power up the PLLs rather than
> registers.

I see MXC is also used by the cdsp.

I'll have a poke to see if I can ensure both PDs are off and see what 
happens to reg access.

Perhaps my first pass test didn't cover it.

---
bod
