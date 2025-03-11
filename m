Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05992638BB
	for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 18:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741716686; cv=none; b=HMHFGC8ZmjgQqLCYf462/bNWIxLaLWXknMC2NG99oRf2x/mAlI47H9pSz5ZZchezHX+QwsbJicQSfm9ML9PF460t/az38sPwoPI/M92MVx3YeQnHHprV0zOMjTuKJTYfs9EiGChCauGmUD1lRJin+f/fkOmk1Wdvok11koHsiPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741716686; c=relaxed/simple;
	bh=BRd7+HtTtvaBFcdTTNSbCQPKzTGFFg/AS6THF+DAXJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=drD4YA4KWSsExi/ugnhKvkgwQgF08BW+mZ4zXSqglUG+fBR5aPsvQGQvu71H8hcyCr2D0Hcyi9TBrQlU9sehnSsyDVia5kAmrEChHeZcSiCEw0AnLcvOhhkbUs5UlTj/hKRzneQvFxrWSReg0khPjMhkTd5b+qu1QefOdT+SGS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IA5jojoB; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IA5jojoB"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso174627a12.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Mar 2025 11:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741716683; x=1742321483; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=imQlH5hLyEPyeFpcTG/nV9BIkwuBSyfjOhkAYwjO1MI=;
        b=IA5jojoB7fcbxyJpLQ9DKynZhmXSr7okK0sFzTXiezwpDvYUv+LwIT9U1B/prnNhan
         nqY2B7gF6qvo55Ra4izZ0u38iV18CQtOP5VL2ctyERrW0Q3Gbvj9AaujIHSGdir5OjSm
         rJQZYnB1fU4Bw1fcWoBNR8iDdIR3stvXU4ZyewnzMd4A/yPAqZ830fB4xAIJzUH7L8dL
         /pBcOn2xTOsm9fkEE1QDPLTaKEPJQAm3j9++nDwqmIlYZGOR2WBxuQ/S2RtkeJ9IZq/X
         Rv0YeFd5sF86/d61k474QMxQ4RmtEUoRFpOs967i88nUzUmsqPdcakqb6eQ4gEZvdwY+
         jcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741716683; x=1742321483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=imQlH5hLyEPyeFpcTG/nV9BIkwuBSyfjOhkAYwjO1MI=;
        b=A0nZTlJBTyjwTc3lowqkMEi2U300nilNQeOXUc4oEJH5g30A9cIgETI6quXOmSxpW3
         YlFWxyZB0qrmL+zSD6PGG2bpEZ6yF4MrEOxKT2Inx/kPimYuSYfH4m8z0dystgiWusYB
         2c7hIVeWNuzMuhyj/CxVIVH/K09RG0M+Eh8rSgTJQYPADZS7SYIZd+FRfl6sFVDtyFee
         Y6F3fGdLYf78hUIvnaIvXWBwycEs6g5dBdgRG3U2lOmhioXJJ5W8ThbAAE0P/01Q6I6N
         z+WQdO46HdDPOQ7vSQgk/tfHZulUboctghcwCdO8I8qXTz+mHTlar2ODw3LRfDxv+EJl
         f4uQ==
X-Forwarded-Encrypted: i=1; AJvYcCULUF6LKn9txE/LbPesUSjSqZfR7xB7LYNZi3qkH8ozV5zLJRKYbYxu+zE+x3R2ReBqVc2oOYTEzSU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtkeTjAq83v/pvRKmolhWYWaGo0i/xJqJWIPh6z1tFaWTjc7ub
	7INyXLYlw30omisSfOAXXzJWtI1fa5cd5xuZlb3e4QkHCljZlCMj98zQEixuRDg=
X-Gm-Gg: ASbGnctIYh7bb/EYe4mDpVCEExOIiVnDVTtTtignA/v2i4jSUM9J7bFXm6iRuCxkjrM
	odY2jkbyQKoKi53ALiuLIZJ7etahXWCafdzvtkPS/wkzjAEObD62HBWyga+/7fGsCDTFoe4zBbJ
	jIVBAKviRkdnB0KmAbqk/rCbXgmoIcqkMj6AD3hfurU9hvuJhHp8zMkOUSQiz9dWFxn+F2nvDeI
	CCBzPfMfKksBcTGXsgDIBjBfPBthM817N7CFNdltakmoZZR2iEZT3dNL6XjoQgZ6GzvYNN7lFek
	PaDZebkIYqLbATvB8JVz+fI142OPws5Fy2SM0jDoBSbo65g0C+gtOKe+UDo2t2Nhv3uLAyIQGpH
	PTnhAHiW17KIMzNsrPQBb
X-Google-Smtp-Source: AGHT+IERTZ3nFwIDF0pC/Jsa9/UMytNY/0RkyK1in1I6p0biiBCy+0RcM+HnsMyf2YSwOxxQbZ6xSQ==
X-Received: by 2002:a17:907:2d0d:b0:abf:6e88:3a63 with SMTP id a640c23a62f3a-ac2ba4c7b97mr529724766b.9.1741716682967;
        Tue, 11 Mar 2025 11:11:22 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac288ffe157sm509101066b.132.2025.03.11.11.11.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 11:11:22 -0700 (PDT)
Message-ID: <b21b5f03-e328-4708-a854-1b3fa9c3dfa3@linaro.org>
Date: Tue, 11 Mar 2025 18:11:21 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] clk: qcom: Add support to attach multiple power
 domains in cc probe
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <CMTYKKilQJYeHUYYKvlqnwv4Q2P-58Ic1v1ndS9HQ8Yhq2xpHuNThibFDjXDEQ1PyNbx__f9BVBr0peoTUdvPg==@protonmail.internalid>
 <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <5a45fd25-74ed-46e3-b0e3-5adf92b5e9f7@linaro.org>
 <46d4f090-3e31-414f-abfc-3d1018913c56@linaro.org>
 <9e6fdcfe-3c6d-44c7-95a3-7652c0650bf4@linaro.org>
 <caa00d62-b24d-4db7-9e12-170a10c073e3@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <caa00d62-b24d-4db7-9e12-170a10c073e3@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/03/2025 17:55, Vladimir Zapolskiy wrote:
> 
> I kindly ask to elaborate here.
> 
> This series does not touch CAMCC at all, and if the series touches CAMCC,
> then it changes DT ABI, which is objected. Or is it for some reason
> objected only for SM8550 and not for the other platforms? More information
> is needed.

No but it _should_ Vlad, that's the ask.

Both of these clock controllers will require this same change to be 
implemented, that's what I'm asking Jagadeesh to do.

Certainly that's the case for x1e and asking Jagadeesh to also check 
that for sm8650.

---
bod
