Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF9B19B5A9
	for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 11:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732880704; cv=none; b=aZYCIY62eKn+IBQz2IyedtZMIPxHQD7pHQaSlmQXtVrB4URG/rnph19wASfUh6ohCUC5iIDWQ1NHtvAKtOsz8puzp7e0X0nZa7I+ADj/OwWencxPKRZhAnr18YFVqfCUEYtoDSSQU0JEMOx2BE+CQGUBwNqTkypkXx4R9F9bi8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732880704; c=relaxed/simple;
	bh=vwruG2+sJ1nGAh5frWQN5bFRWPjIzvcKdp9Bgr1gc8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoIUZDa/uOJ8U89amuu0EoqJLFowlsY/2DZ/jb+rlfVxDEmzx+ID4jB5Oyk6eToLCUsI23bsr5k1LbAnryDtFhhCzeWBcbzpnzcpBC+tUiY6gjx7hs6LERfOoeiHpdeRLpkkO/5XBAdBagMVKwvQU1I5fdOJNLhgsTObjoAkRTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KFq0wm/U; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KFq0wm/U"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2ffd2026437so802421fa.1
        for <linux-clk@vger.kernel.org>; Fri, 29 Nov 2024 03:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732880700; x=1733485500; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZIubI06rjZ+HsV0fP2YkTawH+ehNtsEbQuHIS42n8ug=;
        b=KFq0wm/UA11q4JrJZmbJ/WdUVVoYP48BrLwbmZVShWxDCdtLQL3/yeETPxrJnpeURS
         kpMkxQQDmZnlePnmfldJB5mNM1J4KvVpOaU2yMT6CUlemTweEvvftpS9VEPWq51uep9w
         aWo0igBl3XhxN3dfPmEvmZBdEjxgF1NiNERmSpjhPVFaGf6VdT2HtGSwQWiUPxCjeP4G
         w7e0b0h1IvckLZVYfgXr3OgNICphWqumqNuSvdUBPhuwofZX/9cnAyYy98PsyG6zoyda
         gkZ3rSlLLJxPVzrai2t7CEcFLV4+1bwWr2uu7aSUCRD9eeAq53rZPhfcEMnRmFjSD1yN
         woUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732880700; x=1733485500;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZIubI06rjZ+HsV0fP2YkTawH+ehNtsEbQuHIS42n8ug=;
        b=QjITkcyTTi3qCu22ITCHTrBKrITq0ELxLaJYEZ2rdTARt1D9uqE2898NTc3bKWbkSe
         /6nLYnSZ64o9hScgHVmR5wdyBNc2645LJX0rtaq34Yf/DAMJLx8AdLipzveaEiMYa6iU
         xOFUTzsAXbzM4fsleJ5h/Mg1AfeEeCC+bj4cjthuenUfJ6n7x8fsrrumENAAnWgGjFG+
         zUKveeKUbM8O/djT+yqRx2yylwly1IQTZw9M9lBACWClgNpSmVY/w+mm7oOQdCVwM43o
         j5BOpkA1nu+xIDwlZyIGlwFSoTrrUeWZN+Hc/2tAymo2rhiqdpgisdXHA/ddRb593ZU+
         8t1g==
X-Forwarded-Encrypted: i=1; AJvYcCUnije2ExJttPipm3UJJByHUHhlF5i8fofh0CNlmovgJ2NNViACa+e5S0oY6WsvWdFtNshSNVnKHJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkfM0jfAqZYOxRFgQOy/nAGVGN+FDICOwUL2DgJ/fZXNoVOq5x
	ZWkM1FE6EbQHEXceOPTVtK5ioSUZCeIupaSG/OjdBT28PPobY+kiYnAvCfi8zrQ=
X-Gm-Gg: ASbGncuOV9BRqh28g6cBhL2jGxd8F6GpmEgm/zATlkGqExXbOiDRSSMqid6LT/XTtc9
	5n7ybyld4YwQvfYaPOsFNU2X2cayySQJ006mHaqV/KkIjX+wG1seGaevNKgzmulMSWgqAxwVshi
	F+xRo2RlLRBtMC+jRsLb5c8HeyTl0CB1WNNKcfKqpiPVqgNClckWZnluRMo2K20koqk3abOPSlm
	QzSlrQs9wGMEeA2bK8/w58fik4kHZNlY+62q9yvgscXFNK12FljVt63WsdttCbSktrBSBQkpsdX
	iD/Sgz/YotV0UOjJNkVa0r8sYx1t
X-Google-Smtp-Source: AGHT+IHyQtTPqhAYKXLJIJ4i6stHUjQzZgnRuUAkMJCFZKDMU3bYch34xfZyV7PfFiN8rzCQcIWeaw==
X-Received: by 2002:a05:651c:1545:b0:2ff:a8db:4e7d with SMTP id 38308e7fff4ca-2ffd5ffeb04mr12980741fa.2.1732880700431;
        Fri, 29 Nov 2024 03:45:00 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfca127fsm4432851fa.106.2024.11.29.03.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Nov 2024 03:44:59 -0800 (PST)
Message-ID: <4310164e-4000-4cff-a093-7986f71fc02a@linaro.org>
Date: Fri, 29 Nov 2024 13:44:57 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-0-ca2826c46814@linaro.org>
 <20241128-b4-linux-next-24-11-18-clock-multiple-power-domains-v5-2-ca2826c46814@linaro.org>
 <9b9bf718-b5a5-4fef-810a-1206743495f6@linaro.org>
 <7cf4ce25-742c-48ff-99e0-bbbaea370e89@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <7cf4ce25-742c-48ff-99e0-bbbaea370e89@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/29/24 13:39, Bryan O'Donoghue wrote:
> On 29/11/2024 11:30, Vladimir Zapolskiy wrote:
>>> +    ret = devm_pm_domain_attach_list(dev, &pd_data, &cc->pd_list);
>>
>> Please make a call to the function like this:
>>
>>       ret = devm_pm_domain_attach_list(dev, NULL, &cc->pd_list);
> 
> Passing &pd_data will cause devm_pd_domain_attach_list() to cycle
> through the power-domains listed and do dev_pm_domain_attach_by_id();

Doesn't it cycle for pd_data.num_pd_names times? Which is zero.

> instead of dv_pm_domain_attach_by_name();
> 
> That's what &pd_data is passed here. You want to have that simple
> attachment of the power-domain list.

I look at dev_pm_domain_attach_list() function with my best efforts
to concentrate and see no functional difference between your version
and the one proposed by me since v1.

--
Best wishes,
Vladimir
