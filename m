Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BAFA13CA92
	for <linux-clk@vger.kernel.org>; Wed, 19 Jun 2024 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718796724; cv=none; b=fVe1mjq51/Gx0zrDIqbh+i37hmCDrgKrEjzzviCj14GZLx82+QeyUNCnMJO0Ubqp9V5/uK8HII3QOknoQOjcfWngyGbYKdbCrt3ev4d4P9wcwW0RuhRUcIZeU6elF2tuvOYqVURM3Ti/9RQh4GduakH9HNsKNDSS0Nyi4DEJrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718796724; c=relaxed/simple;
	bh=G9s7/39SAaCha/Gb6/TvfL2LDBIFo42TdwmiOE0eSbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MXsDfPu5tbkDPnGghfhG+bTctI90H1/cbQ/xjjxfdxFJrhDFw90sFLWubs8ijRV6BXlOq1zbGU3b9TJNqdA1+zCKolg+Lf3gtps8pPXirYDFytsBrACnMBV4VtQwe0HQ1QVS+Cf5XzUf57pPHSQgP7z/UXbTpS/9qMr7947Emp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fG9mzoR3; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fG9mzoR3"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eae70fb324so7077621fa.2
        for <linux-clk@vger.kernel.org>; Wed, 19 Jun 2024 04:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718796720; x=1719401520; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hrZJ+jfag4mrs/6y3l9PMepTZEbpXG78/iWf/2590xE=;
        b=fG9mzoR3B4ekZ9z6tVZuejBOMltyEaRRUuAqsLBzubLSN/k0FWwYvZzk8deQwZjOJO
         4LtYILPsxgPp9JQZg8J5RM/7BsK0K24GpHHB8xARitNZiVLvO+udKrkSNzWVPnZt65VM
         piiEpyYnqisw9LWyqjcHE1tGA0Y0eyi+kQ6gvzOOrh7NSuCWFtTj557wroTt4SyxIrou
         dKBXtw7xsgx0KevcJ0Ju1eDfDytG7tFVt7TmwpuysxobW18a9JLOQhFaT0nnXipzkyO9
         9yKmySvoL9kQzETLBrbIGc0FYSQrY+W4kiHrJewdmROnrIVRyxMfRZJIlcNc2LWLYjrp
         UG5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718796720; x=1719401520;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrZJ+jfag4mrs/6y3l9PMepTZEbpXG78/iWf/2590xE=;
        b=RlfoBsXrU/XFUp2NvgDXKq7Km6taf4Vtewg3c998wrrmbfE7aDQN2ppwzcxjr/S8Vp
         RTqyxbziAseIorU6+nR5C7Hr8M/TUiLV6SyjQYWyG2XXYp+4D7TwLZhF6YVw0jgexrlh
         8oEqiEpGJxZa1eC1ENtGdFiaGR75lI7oi+xt743B5vwFwwGbsp7cMw0JqkFevrCpG28k
         k8nobG6lsC+eumatLMdv+G9znuoGTIqB2j/OEOFU+cPLOniyPhS23UZHw4tQ/7sLOVuC
         M+qdqzw2y6VIs65yk0v97RL2FnmssqpnGyL8VKKE1KqXPipsC5ARwEvhUzK9ThqrDN63
         7VYw==
X-Forwarded-Encrypted: i=1; AJvYcCX/1hs3vWtGKTjHSmDqPbiLT4umbIIplA1IPSorvxHMTNhT1Nm5V/fEvNKU0lHdpq78mX45IluozIRI9FHbIp933SzNz5WBT3JT
X-Gm-Message-State: AOJu0Ywo+1aAGFcS8Z1n6kjj2tsIKI9mvdA1XxkF80lODNsgDfQrouTq
	9k+zE1BNGNCoGvpE6i1sXBF2VQthLypxlgONktoQveLUCrBhpRqWsgbRtzSoFS4=
X-Google-Smtp-Source: AGHT+IFqSpuJazzXtIXmixGX1v6zw4GP/mYamPi/L5REMZv7WfliRiZz68u0QlFghzrjcLt4hlfqpQ==
X-Received: by 2002:a05:6512:2389:b0:51f:8ad:673f with SMTP id 2adb3069b0e04-52ccaa7ae43mr1356015e87.5.1718796720170;
        Wed, 19 Jun 2024 04:32:00 -0700 (PDT)
Received: from [192.168.1.3] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca288cd87sm1738309e87.304.2024.06.19.04.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jun 2024 04:31:59 -0700 (PDT)
Message-ID: <3b723807-44f9-40da-9d61-215395637064@linaro.org>
Date: Wed, 19 Jun 2024 14:31:51 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4 8/8] arm64: dts: qcom: sm8650: Add video and camera
 clock controllers
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, neil.armstrong@linaro.org
Cc: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio
 <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240602114439.1611-1-quic_jkona@quicinc.com>
 <20240602114439.1611-9-quic_jkona@quicinc.com>
 <3ad2d00f-6b5f-46c5-b95c-c8d68e8be736@linaro.org>
 <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <fr4j6gignu7ll4nhur65asj35rbsbzr3w4xtxq55jxcfcmb5nh@l6l3qyhk7qmw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 6/18/24 17:33, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 02:17:23PM GMT, neil.armstrong@linaro.org wrote:
>> On 02/06/2024 13:44, Jagadeesh Kona wrote:
>>> Add device nodes for video and camera clock controllers on Qualcomm
>>> SM8650 platform.
>>>
>>> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
>>> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm8650.dtsi | 26 ++++++++++++++++++++++++++
>>>    1 file changed, 26 insertions(+)
>>>
> 
> [...]
> 
>>
>> And add the missing required-opps for the clock controllers like
>> dispcc.
> 
> Unless the opps is required because cmd-db has lower level than
> required for the functioning of the device, there should be no need to
> add the required-opps.
> 

this is totally fine, but then 'required-opps' property shall be removed
from the list of required properties in device tree bindings description.

--
Best wishes,
Vladimir
