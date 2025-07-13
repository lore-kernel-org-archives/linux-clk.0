Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B801C6FE9
	for <linux-clk@vger.kernel.org>; Sun, 13 Jul 2025 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752394732; cv=none; b=q6iM1WBB3xkI07713WamDr8PZq62xnsDZR0dH3rbG+yweTbQHkEEMv5G8lpcizT7kU+6VT5IwjhnGIrrw89xRMO1oBqNQ5jSlE9Cfy+H/p5eskO73mQLft9gz2ZC3y6GYrhIlHWvDYVtr7Ks2RtiB/uIfSChkDlKzLSTYicXlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752394732; c=relaxed/simple;
	bh=KTmZ/6BZ/O4t61ihZqvtmbZeWoMlVti8WkWApvDe3mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kXcTQabqPJdpIy36aywpNd4LpNbXmiBqe6U6ESzCllGgZVf9oaZi8e/cQPkDvhCdsCCP0BEiwX5olf1U0f1AUer8P50EgRffMZYU+WCYnIcENzPf6Y+qSarh+eyrW0MwUZRKsGgdEJM82AiKYW8pyv0XIoyiOl466UxVxodemXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CQtCRigC; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQtCRigC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45611d82f2eso471585e9.0
        for <linux-clk@vger.kernel.org>; Sun, 13 Jul 2025 01:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752394729; x=1752999529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KTmZ/6BZ/O4t61ihZqvtmbZeWoMlVti8WkWApvDe3mw=;
        b=CQtCRigCoGzZegg8BdCZNFvYEy567+kPtQicDfHVcQl5FD3XqRVqDHfd5e1jis6Xuv
         ypaD9hYBNajWMsYpveWe3O/5iX5jD6ba0uv5qvLnUfbNXTqnpQRFPLieWARagqx2Asu1
         UOTGWs3g9ukDhzs7YtdVBlYJO5obiI5VqQa+367xw1vLOhTgU3nA15w3/AyegviGnQar
         ezkoukjyCrUMLbQlmFR8zi0hev9xVNs60XtZT/bJ6H3HR5rcgKf/LUcwYDPopheZl2cR
         NI226esjEJ4fK8Fz9CmKtLquVmXRZUqqFJjMk86MxwbwS5svxEGJH3OgSuXW/poi45s9
         ijsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752394729; x=1752999529;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTmZ/6BZ/O4t61ihZqvtmbZeWoMlVti8WkWApvDe3mw=;
        b=KrjY0ap0VDo3Gcn/QPlGsVJ94jLuAYgMMs/rCR27yl/Tz5kFF58rDa1fLRCjd/aMkj
         cM+wbhDX5qzGc38EzJgCD6Z4NM0Shnf7Iapg3k+KoS97C6qbn1FF82x2bkgBgEhdooAX
         Aj2qyVcwLh9Lz84kESIqdtahJIlIQjE+76P6g3oHT54u43eYEtu6ivP/QapVlF0t+mF2
         TbBhiw+fdoIwSjzQml6OJps7kgWIuRFIIRUgfuQ3I8/akKs9puXqLc8xc4G6zgYY3MBg
         BiUD3yc3Lu6P9sVcPciwSrPL29mVOoBYevhNLh7sNsPDZ4G20T0NFk5cbM4E8QL41E9F
         BAag==
X-Forwarded-Encrypted: i=1; AJvYcCU0hZiT8QFHj55Rnu3sOtGPaUq5opSUuz7REta2LE1DFD2KHfUM9P7xNtDtkrlGNDfF0OvZxDB1w/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzs8jcS1+R0Pu+En9BwsvVm1ZdNIpcQQFD7+1ukq4TIDFF0jkv
	ZAgJhl3wt6CjYFJ7pn0DY8jNIpEaDzHTvORkoc91V2O6pHZYR9yZlyxMSJ6sY3Tv1tY=
X-Gm-Gg: ASbGncvCxpzXqYorSEXPGSYd7CensNdyNQD7KyFM1lV3X9Hu6E+V38QbuXtG4QlRlKL
	/3CDz8j/8g2ONyDlP4IJk9dooxlMFi+C/7joERCJcet1Ds7v+CyzghvnC+mWeiyY22I+DYzxWdx
	30zx1YRGsh58yeqal4ebKEWd3nFbKfYi3Gx79TcKMtkD4hqeHP7GmMpi2iPVs0Ryy6msHRpiAX1
	dIRriHrSEvfq7YyefEw7JqxFdFks/Y29eSNVku3hYYCaqu7FU5kT+sFpvUzhepAA5o3SLzym7qj
	yqMLGdvfsTIRQTxDw/kER1YtJVK0jjlVEEOIhthQSXiXrYhaKZlhBFuTymv+VupSn7P2YCDN3iZ
	V26JnCe9w7hlHB06A61e7cF27Zc3/3V1jrIEa3meOzg==
X-Google-Smtp-Source: AGHT+IGJGvm/pOF+GzVK/oWRlBC1xVudzXCD3nMUix4t2bX5U3lxlPgjlOfgtdzq6ruR1sMUg/Zasw==
X-Received: by 2002:a05:600c:4714:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-454f4254765mr33922905e9.3.1752394729286;
        Sun, 13 Jul 2025 01:18:49 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4560394e061sm40251575e9.31.2025.07.13.01.18.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Jul 2025 01:18:48 -0700 (PDT)
Message-ID: <3376b0fb-f3c6-464a-9c35-30a3f589b856@linaro.org>
Date: Sun, 13 Jul 2025 10:18:46 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 02/15] dt-bindings: media: qcom,x1e80100-camss: Convert
 from inline PHY definitions to PHY handles
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-2-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/07/2025 14:57, Bryan O'Donoghue wrote:
> We currently do not have an upstream user of the x1e CAMSS schema which

On first glance there is, in Linus tree:

git grep qcom,x1e80100-camss
drivers/media/platform/qcom/camss/camss.c

If this wasn't released mention it.

Best regards,
Krzysztof
