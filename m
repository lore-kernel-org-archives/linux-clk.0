Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4320207A27
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 15:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153409; cv=none; b=hXvAJy1Q22yFuWAjpQSsVLgm7rEUSD1IpN7gK0gyxNhRjjwObXORIXr+LXduQ1WQQbPX+tQTIWc6XmY944f6vy4YWecFCIkm2gLA/7qEIxopC4CjkW12VaIbtFQaMi9gYLi0sPKuRX7BShVtzj8K1Lu3p2IaTT8/I0duxzkIduc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153409; c=relaxed/simple;
	bh=4xxCGmBo7FQG0p5BmYqe1NOagdrpfXWw9XcSG+Ugioo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D38r7MVfHww8Ys4RO+SahUaJklf6Ovps6KFYYhgAdMsp68BC5zHew1QRKt3bxqo3YOMo1Ifpc8vu50+KdGzAV+buwLlclJSksZqHnLH3MDz2ei+A7jFJlMIJYXo5W2kYNRwD9gSEu0SwGhPtZQQLd3MjrJKJBnWM4/l/P7DtM7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=QJrAvFU9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="QJrAvFU9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43494a20379so35879545e9.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 07:30:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1733153406; x=1733758206; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8jtIniQHqaGnIfrwCj5iJuQZ/gWHR/Lk4yIJETbzAw=;
        b=QJrAvFU9PGw4ecwNa9iwbiRcvMsM81tKQr2eYUFLVZkF/qYnhOf9N0FQ58Lnx1mJJH
         I9lbBL/yQxGzCV1CDfuodaYjDdma6kNDxwlHlnxatZbCKFY07MumOpCV5KAhH5850Ppu
         grS+FyUAuQTeel53Bn9q1qvvzWyW/d48rXzKaaaBTjCOQ/dukEtLS3VXBC3L/pLelLIm
         QJmhZ5SCQMp79/q2hgKF0fdvvIZPFEm01BWAQBfwXUz6+rgoOniIXUd/BDdz1s7hW/Vn
         f5hPDXSFT1XD3rxMAgQwTPkuqfHlOOzCxOXfLgvogec9bUjNWh1tPkzVZQSpnsZSWcCr
         pE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153406; x=1733758206;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8jtIniQHqaGnIfrwCj5iJuQZ/gWHR/Lk4yIJETbzAw=;
        b=w8Gn8OPwXKhxSIAzNVt4vSt7K42q1dwuqPk+QCHivkrhO275T50ajcHgE1YBQCNX1R
         lm1LBB+8QgukWFSELpOpjnso3GE5DfWx9Xo1LH5rju0e6rT29SEL/J0Azf9N/jNerbKH
         k5jAErt9mpYPLmRXuXMX+3P2gay6ODz34RdXaH+ctF9RW3/cVvdCF64x/XfkXo0VgQiL
         EZknvZGvkxhYov2dtM2I2kYKb4NHbbOBzWZiqm+8h0QOacohA8S124J25EPzS9/ROO+o
         WMf0Q9aEVdgfISGZyzeO4gv0Zur+owpe8js2ckLYoP7O3fQT0Qftn4S8zAGnL2d7E5Kk
         UFSw==
X-Forwarded-Encrypted: i=1; AJvYcCUd2N75GAOt9O25SUjeoUMgpx3XVhWvmq2MWL62PaqIlJHlr6LPVrct/jm7fjFChYCKK+o5tHEzMWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMr6xsD4BGIxcxRvlqKi13bGdQf+ZQgbE6nXJ3Gl3pS82bQBk3
	zhjMEichZPfHon0yqZUxIHvmWVGRQA1pskNL1zNonCLuENBd/g7e6kZH4zKrdf8=
X-Gm-Gg: ASbGnctULlS5VwbT9uezI1zj2gKBWQfV3MPndDlg92oq1IYpEt1Fmk0Z+L67cKPR+e7
	HLDyHw57Th/4ndzo2sxNyoxXwBmcz2ZIJAIZ2hwWDhSoblieaGKnjsX6jEezA5p+vIorBvVzQYR
	Ij1pPj7cd0hGCQRMDOx62JaWw57guDkqsiSpa/EfiInUp5Z/26t+8iJ16EaJ+VZv+C8DdRLbJ2+
	YkDdRx7l7nkWvsO/A969p78Edk2fuaMe7Lc713T3OMPnqI2qAIvGhn0yPXmbwpnFQ==
X-Google-Smtp-Source: AGHT+IH1hTljFKEA9DHhDP/Bl2T9X3iPXf4B7h5kmrrQdKTb7FK5jK4sFt7iXegFoa1F8JVAtQP1Kw==
X-Received: by 2002:a05:600c:4447:b0:434:a5bc:70fc with SMTP id 5b1f17b1804b1-434a9dc3c8emr211879435e9.8.1733153405821;
        Mon, 02 Dec 2024 07:30:05 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e230b283sm8019425f8f.106.2024.12.02.07.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:30:05 -0800 (PST)
Message-ID: <90fc1097-d353-4b6a-bcbf-81f8a8e24390@nexus-software.ie>
Date: Mon, 2 Dec 2024 15:30:03 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-i2c@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
 <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02/12/2024 15:02, Dmitry Baryshkov wrote:
>>> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
>> This clock is not registered with the CCF
> Isn't that be going to be handled by the CCF on its own (like orphans,
> etc)?

For refence this is always-on ATM.

drivers/clk/qcom/gcc-x1e80100.c:	qcom_branch_set_clk_en(regmap, 
0x26004); /* GCC_CAMERA_AHB_CLK */

---
bod
