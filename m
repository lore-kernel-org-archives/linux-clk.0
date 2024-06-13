Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA713C3CD
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718264527; cv=none; b=AA8bFj49XaUQ6O0ElX+lrOlCyWl+O/ZN/sdu0uI+wAhY/LDRYVQsCT3cacyVMF1tX2tVhi/LwZ/EZeF73sV89WGR31iXKx0u3+k2TV6o9KO3a3/WaCVm7SLzA90brOEgAxTRV719TPjrqv2Wi0gL7TR4KpWzsvLk88cyaMYtlqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718264527; c=relaxed/simple;
	bh=UWY1jQHCY6b4p926RE7DUgpp9ygGl4OAgxySR+CLJUw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UTJ2IKXLNYOFayQ+LDkUc/BwORK6ep0Img+9BhnNo2ZfQauySyxJPaYb7t92hLVfEFsIgQhI0+yoOUusbkiTBIC8mLNMFQR9WjqHrYYymWHQe0bXozis6/8ftr4FyHxEOgc6Bd5R8Xm68R8D6TW6tDgrpRGvGCLt3WHzryieraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hMTN8CUY; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hMTN8CUY"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c82101407so1351411e87.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718264522; x=1718869322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KF85CFMeWWGV8dBA/jqj/6jX8gLuT5XMmUZA13zEGiE=;
        b=hMTN8CUYyhPlJrhE6LWJSklxu85FR1OBgNLXU2rDM7c1e3Ml6lm2k3GS+uQPzVYP9L
         hkmP/aByKZdbyFdmq5zAmnox7iOOeckwL6XVriE7kBT2pmrcn5+ZbMDWTOJ6Hlf7GESR
         Cl38Jn0zuTnGIpE5e/pLq9LAtYmMoGHt3vB8SPjWuJnlvDeQP50Oz++IL8t+UCfg5kbT
         zRgQqoi30x8Uoabjt/jjyd3mahSxSJtCf5a8CwH01W5NZRgEZcrOyxn4HCa/kqjVo1AZ
         sovQbdsqAfGFlWCNNC76ToI921wJGVH8QM3Ua3G1rU6JVZfztmcFaBDHL/BfDrXUrYzr
         7OZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718264522; x=1718869322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KF85CFMeWWGV8dBA/jqj/6jX8gLuT5XMmUZA13zEGiE=;
        b=BEn5hPn5cpeKoc+T0NFXooPA5vW7xLl3Mo+FpTjI5KEMgNsPcTIWQBEvWXzNl0YFC4
         umknk9X5fFdNHkfpmsD0K5Gp1cl9eqVgbHSmbLHcVhvttzKRfQpPDsojazyyU1ozwR9Z
         wrpPXlHaC9mD9Qq2/MTYAOqBPlG4yu3FayLN3j0a08PJgkq9POsvUM2zhELFH1skHmZJ
         RsgblOu0LNezTiiG61NBf/FyBY6wp8KV6waAKfKElFyXnHIQjKpv4NnYCRzQn0PbzaSC
         tW+bvNZSOS4Dl+dOgIpLqnvHmD5OAlHKCwKYfuVoPnZXQxaYKEY6pf7kuNXQWQygehJF
         cllA==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1s31OUDPffOB4kz/hLMijqbjZvJWlZwwU9NkVaz/C1f0dPNICZr9LbUr1JmZai1mDel693Vv0GgakK/7EbqVyY+yQce6L34h
X-Gm-Message-State: AOJu0YyCJ9X5g0deQ3Gw0J1lulupH+M/skqWXolD0nkIuBq7FElLZPlN
	hOp/wcIvEMHMW7dUhenldzWUkqRebP0bQHEsyjRLb1bOUlfYT/tKC+x/4tKCplg=
X-Google-Smtp-Source: AGHT+IHyDYh9PzejbIrV9uyAGEpgb2Op+Yqzxy+7aXYUzERG4u6uKEJAqIAAqudgHbeAgx7zU7yn1g==
X-Received: by 2002:a05:6512:3045:b0:52c:8909:bd35 with SMTP id 2adb3069b0e04-52c9a3bfb2amr4010881e87.10.1718264522420;
        Thu, 13 Jun 2024 00:42:02 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:c71b:4253:8a9f:c478? ([2a00:f41:900a:a4b1:c71b:4253:8a9f:c478])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282ee85sm114279e87.111.2024.06.13.00.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 00:42:02 -0700 (PDT)
Message-ID: <76f5e3c7-a90b-42d2-8169-e5e2211a14a1@linaro.org>
Date: Thu, 13 Jun 2024 09:41:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm4450: add camera, display and
 gpu clock controller
To: Ajit Pandey <quic_ajipan@quicinc.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
References: <20240611133752.2192401-1-quic_ajipan@quicinc.com>
 <20240611133752.2192401-9-quic_ajipan@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240611133752.2192401-9-quic_ajipan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 15:37, Ajit Pandey wrote:
> Add device node for camera, display and graphics clock controller on
> Qualcomm SM4450 platform.
> 
> Signed-off-by: Ajit Pandey <quic_ajipan@quicinc.com>
> ---

None of these nodes reference a power domain (which would usually be
CX/MX/MMCX). This way, the RPMhPDs will never be scaled.

The current upstream implementation only allows one power domain to be
scaled, but that's better than none (see other DTs for recent SoCs).

Konrad
