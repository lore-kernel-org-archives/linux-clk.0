Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE90189B83
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 11:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880396; cv=none; b=uNtAGKA2eE1mBsqZFXmAB+GIbyVIrQzSLgKPBxjtk8WvyuKKhuPShvhn/OGr1d3gghAc/A4Oa17Le0vNLAXXChetZB40cd+HbnvjOFfklp9R9I7khiHsXBm7Qy1yn3jRVcS6F+C1wDgZK70MjWHxnwkgB2QO4cs732XUEzoXjCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880396; c=relaxed/simple;
	bh=cr38zkBaIT5J6Z54vSx7eJQHbefLFUPKhgXZ94YH81s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BPL1ezw0EumYkjihSiF0JRas/zuTl/icngq+8ZizXeueSIhyJXD8C6IvkLXuhQadRryvfIX5dS+P2VDz+5Ys0TR/orNAl+OaPhfJQoJCyMtzYThYr3es9WjAon4I7+E57B60oTuSGCjp6egn+LgrnnqYYJUQ4zU9KnEe7U5AcGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AjpHBu4u; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AjpHBu4u"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385de9f789cso403500f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 03:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732880393; x=1733485193; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDfyMtdSo8AvHdVzO4O1MlF8b1Ss9UAULJbg4XvzTh8=;
        b=AjpHBu4u9rhAE00FlDaNAH/5Mwxo2iIQoDe5z5kUSGEazgJNZrYunsY7y0bKqqW0Sn
         NHSBMkkrX2oNYh37p+zjjKb0WA+g4e4tO5qvHKeXrzMgk9BjdkbTNYBB3UVTeUncS2EM
         N3PjaoNbb4rnU6vjoUTgaALfX1h1WBIR8v0IPCyP2UIKWm/95Vy92E19gvIGpLFi9Abb
         sDr5yk6tAnPKwsSwK/Oe3OeP2TU0TMYLLhdzictdYtbqXsC7SVPtwdoYuU29wTaoQ2JQ
         /zKP/zc+iSl2eI8Vt6arObBzJDUxYGQIXKBxdeG+f6lfeo93yeyDvgN9dJEE7lnuzQQI
         dMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732880393; x=1733485193;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fDfyMtdSo8AvHdVzO4O1MlF8b1Ss9UAULJbg4XvzTh8=;
        b=V7ScDZdrjcIiZxgq+MdIQaEbklOLqBYrwlQYN9yDLDxmNfW5fS9u+ckOVOVzbr9O79
         K3vGHzFp6UJLGX3vAtlN+VEHr7/jN1e8iCcrf9xtz/Jvcqvl2Bg7smZJwSDEJ2QfQ65S
         mgudGLUchTL2Lfh+46rbvM9fcaF9NjBBa3p0chGU2Hha3o20GWVFMJcwnA9SAFpkhmhc
         IaLrQp9xO5q6OZDctcABHXH88TIesaVPEvthremLvQZDKF7u7diWi4kc2ygEWj5Ywgdj
         MOA40IPjVuIAhOagL8X1/YLpbHr6VRdWk4AU8GWDIMWM4Q3hCgiGfNHpJNMEvnwRS3oi
         nu6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtu96IeFgRMpLfn1AU/tMBobuv5cUAfnG4sAhsCFngKJl2WdeL0vM4VzUjE0xOMEvB0JD4fVIO3+Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RocBkdXRMHsLbhapz9sP1CwmXJ8utB/CDgZLvNlHKJ2G1AfT
	BG+gAZ+ce+RKmhrfV5I5BCcthQet0IwwSyoN2nsbOUS/jrUkSz/3BYNO3b2Bh2k=
X-Gm-Gg: ASbGncuL7pppe+9xNEUb0sWndUe2OGa+Ec+YEzpTXjzr/YiIN0q7diBDdgSdJKajjsp
	Yy75jVZCWxEjJlH/9dJlVhQmkxi06igh3qbFcl32dZXCRVo4n+wDWqW2gP3cXcc1Yiv0YjJdBi9
	q4/kAB31WxHS8R396TobBle69OILx3CuyFdpHy/gpO+nqx8KCy2gqrrzRCIZJg6cLXusfLRN6Oh
	GkIp79oMOq1IrwbII7M0+I9u58103+UdSpu4809h1Sjtd82boibmrDkY+2JJKA=
X-Google-Smtp-Source: AGHT+IEyCt4PbCuXKWOIZUqCNhrD2aNU8Qj8+H6sBZhSb8I+snk1v4CY846kHV0DiDgBD5wLzt7EvA==
X-Received: by 2002:a05:6000:4013:b0:385:cb5f:d79b with SMTP id ffacd0b85a97d-385cb5fd7b4mr4566727f8f.18.1732880393665;
        Fri, 29 Nov 2024 03:39:53 -0800 (PST)
Received: from [192.168.0.31] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b9a9679bsm14842385e9.13.2024.11.29.03.39.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:39:53 -0800 (PST)
Message-ID: <7cf4ce25-742c-48ff-99e0-bbbaea370e89@linaro.org>
Date: Fri, 29 Nov 2024 11:39:52 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
 <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
 <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/11/2024 11:30, Vladimir Zapolskiy wrote:
>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
> 
> Please make a call to the function like this:
> 
>      ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);

Passing &pd_data will cause devm_pd_domain_attach_list() to cycle 
through the power-domains listed and do dev_pm_domain_attach_by_id(); 
instead of dv_pm_domain_attach_by_name();

That's what &pd_data is passed here. You want to have that simple 
attachment of the power-domain list.

---
bod
