Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2870F14B97E
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 08:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729586859; cv=none; b=IEp6oeOb3unsff3PYHAWl+POFNa6UqLp+drFFm1n6QTnciOXf9YvBAxNUocv0fbtXKmBCyqOCAsNvk1CHsNBWWqO+dL7zH2VWzA0XRCgoSlmPI0r6fDD13G6jB8XknufYUFEUMX/G8G7HnX22KE7K4BV47Jdha+JLe+H2sMhHss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729586859; c=relaxed/simple;
	bh=jP0UyriYrwD9z86DKnm2ZLkHzsSCrtmBtYGrEmrhRRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bo1tZLMBGNl3EXN+/8LaoTzeb5KKgnHznDG4glfRO9hjA+WCN7Ohz2Z69RVNFT7cZoM99R9V56y/L9G3yryci5A2CnQM6pYahfFDhJ3VdAPIIH6KhXDhkp9oXGQu3CophUjYLEuTRpuHWqPYvlyFWZEfsXg4twM5jDo7DxfwB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JBGBa00Q; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JBGBa00Q"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5cacb76e924so3181819a12.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 01:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729586856; x=1730191656; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xMAQWvLlw2fKM99vhhfmIMlXgXWjc46mq6iY37iUllU=;
        b=JBGBa00Q0JY1FNmdrM+AT6/Uhz/8RpcqZAU4Hpyzka8oKWTVc7O7+XXG4wbf/1BC1h
         K6m1b9PBJx+pzy11zijrRpyaHF46KaovgwMQWksNiuNVUiWIAzeAB9q/VLjyQHm8ddvt
         npc5VBOu0nIyQBYBrkagh1V7E20JIDdTxPJd+kEIv9atYxuxLGlqOh7bOeFM//DkIzMi
         eblD9Jjy0erIFwuhHX6NfYU2S0bkpkvrYt9Z6DomuZ2FQGdBrixlW65WMuYLSotcxI/5
         Lgn/G6W+mNiI8kRmIMX35QQmrsH4rPKyDHfI+oA4U4NTbwU45mgKtx5APZVTgc2FKAfs
         KZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729586856; x=1730191656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xMAQWvLlw2fKM99vhhfmIMlXgXWjc46mq6iY37iUllU=;
        b=qcCbGs6HdiNghDuf5lUEFv3hbzc/gLw+FgW0CeTDOYMMSSjvlFiJPmWNZOo/Z/NBMj
         8hmMzJ7yWAzyej/t20bmuH+qZ5iJb3kDo/S3hDvyxg1GvsDfTzTklencSFVlW5PIkoFL
         QRXt4guAFWUZ7ZzkpI1Qwp1dOIA+RBbaOd1/HiVzYjKm+gVeVvnR8uyr/UlweQJgKEeL
         vFQQ6ZVEVSkXfnfTyaoNC8WzNvCAwh3egDPQZPnIlPUxthJAaez5RxGQob8s7IG5JxrD
         JlkkTcEkqH1XgyGoAxbjk7L7M2txD8AwXGsatWx/naMPyX7TCDusJ4iwkWa8/CCR2hx2
         X/5g==
X-Gm-Message-State: AOJu0YzaafurMb4m0LxAEMSfW6aogPQXj0wYd0eaH1OstqHY4TMslBGR
	MyCuYcWLYr0e1mWc8GGJgUwl4x93mpIqnOILccKfUCJPYEPlxTPt5ZyK1uJCkOo=
X-Google-Smtp-Source: AGHT+IEVK67koz5KXdC5G05UN1qm3EHxsMXk42XCzA+1nGcgobipSD6ab9ai9Bgvxr/zflRZofZxAA==
X-Received: by 2002:a05:6402:3482:b0:5c9:45f2:b26a with SMTP id 4fb4d7f45d1cf-5ca0abea14fmr12004538a12.0.1729586856417;
        Tue, 22 Oct 2024 01:47:36 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66a6a445sm2886708a12.41.2024.10.22.01.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 01:47:36 -0700 (PDT)
Message-ID: <787bc601-e669-480e-96c7-36f6e12e3088@linaro.org>
Date: Tue, 22 Oct 2024 09:47:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] clk: qcom: rpmh: Add support for SM8750 rpmh clocks
To: Melody Olvera <quic_molvera@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Trilok Soni <quic_tsoni@quicinc.com>,
 "Satya Durga Srinivasu Prabhala --cc=linux-arm-msm @ vger . kernel . org"
 <quic_satyap@quicinc.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241021230359.2632414-1-quic_molvera@quicinc.com>
 <20241021230359.2632414-3-quic_molvera@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241021230359.2632414-3-quic_molvera@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2024 00:03, Melody Olvera wrote:
> +	{ .compatible = "qcom,sm8750-rpmh-clk", .data = &clk_rpmh_sm8750},
>   	{ .compatible = "qcom,sc7280-rpmh-clk", .data = &clk_rpmh_sc7280},

Might be a nice opportunity to alphabetise this list if you do a V2.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
