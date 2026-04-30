Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827DD39FCB0
	for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 07:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533578; cv=none; b=TooPW03oSwaDgUiLc56dlnz+wgUwgsiW4BzvHCAhBxHCqAld6bx49eLIwJe7AAERHnxdsvunBJO0OdB2//0FVewg5J2fKB5ct5q0x5u4CQBwqgO53zu3iWRfh57zV7Rlm24uPlXmseXIX6bgl1T5JelxBRbsmzvsFUi7nxKHzuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533578; c=relaxed/simple;
	bh=2CZHL0AmzK16VlClqBj66ljG2LuPL+2WV5YuZohxbno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sic4e4xtil576/nEAIS3Bkll4eJB3u9p+6qBJvLbl9JCRRikQQjEaPZyJiTEvOxFXrEfPXmq6ZeGTWgzLrhlnRi8OC+4mkjF4jUo1+ExocpjIekuola0uOJuahR33c/bvnnzNH2rxxHTgak+pxi2XTBBVz6yrDaicgRPhqhUtQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VbBogj45; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VbBogj45"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4891cd41959so5080945e9.3
        for <linux-clk@vger.kernel.org>; Thu, 30 Apr 2026 00:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777533575; x=1778138375; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=VbBogj453qbAxhL3j262p3Ds35RfYL9PfJhhmwRZc5+FjfB+kmPmji9XsdPYn5Nr7g
         zyOfl5oUvGYM3t3pJNRyNetj2r9o5cnE60UOOvYgZa7BxCT9uDCawQ9EPJYPQNteQPb7
         ERT28QCdDSs0SLPuNDGvGgVxbFM998vnd4GjAdwrk4t6QpVptUrklv/8+dnJU86El9b1
         E3I1zp+fWTz9ulAZbOufVUrt9oL1mcCS+xq89HnQujvVP0tsXXeSc8BaOIvDXwnz9tGb
         m3+YDs/81gA//dMhhBcwHNXTfscajFXDXKAE/BmExsN6h31HHjdHOQFFA7g7z04ef9ST
         Y3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777533575; x=1778138375;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUWvXOwC5Q3RC/87QRqX0hG7frPM9oXSsp9FaQvwQcU=;
        b=DSMwEiqXV7yVj8LYQbGnSI+fgfB/J6ZhnLphCCw/tHh6GiBsA/wLyRyB28JPtqVK1i
         3kW8z7iCbEji27JX0qqyADgE36D/iHSFUqPyYy+lqILAUkBbRSlTmeyLM+JRChyFQ92I
         wy8A1FCarMQcPsGovjzcGIg0wBUL3gUIKMu2s9y3iQR9nS4GrBoOY0rZ3NPaALpouIJ+
         E1UblXJQaF6UxR2cSp8eJR0llMdHJ2HGjDYvzr+D3BoJJoBFm4y3LXp2TBPM2NKCY1Fg
         js4VlPZiWOVz7UXL1kscYPAyaNw0WEci6jTdGSHWe9zDYUqR6X5N/FxXnpzOdH3pp3LA
         cGiQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FdN3Z+NJYlDOjmX6mULJQrn49rMiI8FKByakmYz3OjuLqhfVeGy3GyVaVyweEYFWdWIQvF+1LVec=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6lw/C7WpuO4IYD3VPGfEpYQmqCrBQSNQ6hWb1RyXxqxNibEg9
	2f/N0Z8rEOBezzBAc1u2XI5pNcVf3qjiPDwlZ1tynB2Gd72IPC5rUNIwAbjNvZjYXHk=
X-Gm-Gg: AeBDieudEX0VXlO3X+K9P+Ci6PZXceiW6PL2w9LB6z8h88/fVtLyFYxgQlLVVjM5yPb
	ZXQRXV2DRGuimgx3vdkZIqFHXZCMhejOw26CEDVgqDtCO8mJ28ozRbfuyO+ogcamLdd05wa98IS
	uQobs1Ay25srHEij9K1bXzTuKVZAs8HjXWLWxOQvd+SjULxXzoY0ADRR1V9lVZc8aUDpDLIczlf
	cJ4BVLPWi8N1NNsFwTChUqUw25/7K8MNeUVBlVOyx6982nSLWJC+Tu7Y9roQilak5yvqvOZ2KqA
	Jw612W5RRLGAIjJ+/csLtPz3okdVGogFAHZPSk7BSMHnw8ZPKrMiThWEvg5mmwRwQ0IPgrvWhCo
	bZYPpi8XpRwFbD3jGpo4TTN4knsB1s84pohugmwDAGAnWlQ6ibWC5vTi+8t8beS4EY0mttNlik+
	pAXxQgc3OaICvhlU6kx8D7TkQDVXHSMdcrG2UISf2at+F4x2RjPkw28p17N8Y=
X-Received: by 2002:a05:600c:81ca:b0:489:1a3a:9e45 with SMTP id 5b1f17b1804b1-48a8445eabamr29121285e9.26.1777533574947;
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Received: from [192.168.42.159] ([83.240.169.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6b65sm74225145e9.3.2026.04.30.00.19.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 00:19:34 -0700 (PDT)
Message-ID: <7aa439cc-02a6-4b80-84be-1358ba8a6d60@linaro.org>
Date: Thu, 30 Apr 2026 08:19:32 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260429-glymur_camcc-v2-0-0c3fd1977869@oss.qualcomm.com>
 <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260429-glymur_camcc-v2-2-0c3fd1977869@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/04/2026 15:14, Jagadeesh Kona wrote:
> +/* 1200.0 MHz Configuration */
> +static const struct alpha_pll_config cam_cc_pll0_config = {
> +	.l = 0x3e,
> +	.alpha = 0x8000,
> +	.config_ctl_val = 0x25c400e7,
> +	.config_ctl_hi_val = 0x0a8060e0,
> +	.config_ctl_hi1_val = 0xf51dea20,
> +	.user_ctl_val = 0x00008408,
> +	.user_ctl_hi_val = 0x00000002,
> +};

Could we start defining these bits intead of stuffing magic numbers ?

I can't imagine a PLL setting is commercially sensitive and even if it is..

There's a difference between someone in the community doing a port of a 
downstream configuration where the bits aren't documented and a vendor 
doing upstreaming where it the vendor has control.

What does 0x0a8060e0 actually mean and - yes its more work but, why 
can't we define those bits and bit-fields ?

---
bod
