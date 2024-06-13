Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED0E1474B6
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 17:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718298332; cv=none; b=RhAFUBL2KSVay6sRPyMdnt5F5MjufDXfEb4KFazl3FnFA2rDSCoHyNG1axO/vRDz1zsW6FhKvPjrPH9m24A/VIbdwkBeyB/7/0dIhXkMTXKJR2JZJy/UuycQBZhanXY+cmJ4Y7q5yiUcfjHY46AemtnKTDCq94l4C4GQ+TLviaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718298332; c=relaxed/simple;
	bh=p/p2G2Hnjt+abB5vSKz8c1cnMTyRrbY3vlMcptLFV7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GQAuA0UtlixWZF0AaJr6sBw/zGPoH5WLt/R8qNiNpNJMfhvN4eMqpF1NrECZlkHiOVvTma2u8XpvCfrSBOqpneuXiPc2Z+yND91vVX4yH/ZhY/CJrryRuAv6HRh5QdHy7tWmuTqjtQrIaZY0VMq8ww90gIVo5y4V4enPyrDzKGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UHs4QNB5; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UHs4QNB5"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc3130ae6so1490778e87.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 10:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718298325; x=1718903125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rzFTYmEc+fQ3/csX45CT9heivu+VSe2HarKq4DyBsq0=;
        b=UHs4QNB59/TSi/V5oD4vL2euFuZ6U9IWHdSviSHCe5wHNlyyqAEHNIf1HH1+ReYG7I
         4UyIVG1OQnrX5aXlgf2j3A4e/hLI1doUkn5XMecFPRGYtzlBIG5fpdMzxwMcXC0c+3Qu
         +DgmwhNdCLVHNHHBZY3TdKbh2f2jEQe64Vk7yOJdisVmpPtPzuTNZJomQLKswJKTE4KX
         CfScWqdBkbsvzO60zglpeUZYQQmdSBFLfqq9d1jdEkjSypCOrVTMN9PZj6rj+SK3EE4O
         v5rbPl69mL8r5UyPKtqo8P5h6oEHZdJppJOeMPpmJL39fF8ofcTNYGKgWljFWlltyGzZ
         CxMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718298325; x=1718903125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rzFTYmEc+fQ3/csX45CT9heivu+VSe2HarKq4DyBsq0=;
        b=kzDB1Jwli4922OR76cb6yDlF3CRocS0EJFoaRP7wjnhzu7T8xzGMdTnU+tBjESvSpN
         wbp6gppfuX/EoqpLk8eV9jzEbvrwi22u/znojhjJ4HdIXvkXTqR/jQjvnXEi5Qt1iluj
         VGvcALJzH3zdYzSo0IzLlxAy0Y5RvOz2ylXyGBAq0wdkrPRJIBzkGPEBu8i8TUyB0007
         /HlIpaw4WdvbGHAKLFhJhj5edHELCadBANJvaGbM5t85tTbPrmnJUbLRXYEN+MfeH5WL
         0JLU2tYkuK58VdW5gs2uQxgKR7JQSYKHhexZw6OY1Hu9G0jBHkXVQKnSm2ixYKtQH7oN
         vPzw==
X-Forwarded-Encrypted: i=1; AJvYcCXaGKNjFZh8FXX1qybjNGyEfXeEOOJMMk7n63tmkBmcLCemGiTkuIsKo6PNv3zmKU0TIK07drs+VWPITwMY5yAQT1hgMRCQ4eE5
X-Gm-Message-State: AOJu0YxdhINjvyIyY/abqhQoUnc0CnZhqb0jLTesdJtA0EQQAYTgQkR8
	0RHqLxY+/bnvNAFH0KySmjE1sOVDrN68DfmHP50K+kClQOx6s5qyzD6YD44pqWA=
X-Google-Smtp-Source: AGHT+IFMrJVT6uEGUQp5yGREv3B8DR09nqWG4bCjV8ublGXm51Hn18ceK46I7BCUMOznsI+esuuukQ==
X-Received: by 2002:a19:e01e:0:b0:52c:8932:27bd with SMTP id 2adb3069b0e04-52ca6e6e7eemr215207e87.41.1718298325382;
        Thu, 13 Jun 2024 10:05:25 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca28259cbsm289479e87.62.2024.06.13.10.05.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 10:05:25 -0700 (PDT)
Message-ID: <4fdb62a8-df00-4cd2-9c96-74afcae3ac5c@linaro.org>
Date: Thu, 13 Jun 2024 19:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/6] clk: qcom: gcc-sa8775p: Set FORCE_MEM_CORE_ON for
 gcc_ufs_phy_ice_core_clk
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jkona@quicinc.com,
 quic_imrashai@quicinc.com
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
 <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-3-adcc756a23df@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-3-adcc756a23df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 13:08, Taniya Das wrote:
> Update the force mem core bit for UFS ICE clock to force the core on
> signal to remain active during halt state of the clk. If force mem
> core bit of the clock is not set, the memories of the subsystem will
> not retain the logic across power states.
> 
> Fixes: 08c51ceb12f7 ("clk: qcom: add the GCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
