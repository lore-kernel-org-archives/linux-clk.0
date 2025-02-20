Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FCB1EF080
	for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 10:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046912; cv=none; b=OEI1StgjSyLlugT2Ls0AQjVXcRYoLi8hf+eCMHyk4kyxnR7GrDrxf4dOxcgQqAG0DRKJSPcyGdq/xt9vBHC8DJ696LYLaCEx2uS/6OGoES9b1y+c6+F2PHhFTb4YdUzrSqZwgP6NHyleVKv1DVH27GxZ2/QLLkKnF89qQQD4eOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046912; c=relaxed/simple;
	bh=XyjhOm+xipVatReiVlaqfkvcUF7Q4BsxkUSTUiAPmkI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ljBEaO7k1ng0gtmkgD/HRIyzlpVZmvRRZg17sRW/lr2ZFsrxoei4l/cbv2oU57GhiODhesk+B5VKX0c3jQjM5zd7fMIMb4DPvHM8tPozF/S0lGsxOE0G4DIim1m82rAxznJgbcEyo4LLYeqsH9xuAv8WA0YpsozMoekz97OeFL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=io+mADwx; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="io+mADwx"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso351220f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Feb 2025 02:21:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740046908; x=1740651708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyjhOm+xipVatReiVlaqfkvcUF7Q4BsxkUSTUiAPmkI=;
        b=io+mADwxYj5mfgYstriE/1LDSuMmkolzx+kmoWkt9ThNdfP8y96nmzjWAlgS0YyR1U
         pwlXMlI+H/bs/pIMXwF3UJKlXVsuNxKywKUX6DXYPQbFBDJK3me/p4Nw5poip2j+ng6h
         UynduJhfKmWzuD2o0+FBY/In1JbYh84/cCBlFDA7tFy+D6nAayHlLax3PZYQMR/fxjf7
         TWyQNQd6wW40lzDomg+UoZdIVT80IvY1wZ0smTNzOAAbBVekxnAP/Mxen7Z9BjY00Rbu
         Oy21V0+WCdaSDiDaxPCdGSGdVw1hvr6WsVw5/jQYs9/h3QEQ70z/5DMTAAdvXCTuJR4J
         pE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046908; x=1740651708;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyjhOm+xipVatReiVlaqfkvcUF7Q4BsxkUSTUiAPmkI=;
        b=uMDfP6f2sOY8fl9WCO34iyCp9HINrOo4lA2rvj9GW+5V8BLbbUK+J1DAYF9hE9slOn
         f7+XMMlPl2zctt0uSAYFPjLIjjMdy4MgRPO9i7hFCFJsVuDfoldSlUb2KU4hZgtiOD0r
         Dt9ChN9i49zZDHlvjLMX8AuDYGJgpV8frXu/CUny2VJHnr62AmwTRCioIeFyehnUFUCn
         xh1yPVWE1Yo1SCiujRBEMctI+RVoxN/i74aG24Usfeh71qGS2xTaHPFj3iKq5fbnKDpD
         COcK0bovTTCQVXyre9GpdUwryTVKJGaQhl96frF3LQ3Jm+Hr6+hg5OJICe/yoAJH/Odr
         60aA==
X-Forwarded-Encrypted: i=1; AJvYcCVEgOvgM117fMsl+gsnzFiAoPmTRV0W/J4/ulnviQNU0IVVDhGSXU1pb0nrvnq5e5hp8j47a3wyWn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+HJG4fg+1drpux621KjA0TJKCpjutnbDBq+8NLMtrvaa2FNk7
	l7zQzF8caR0NIS49+h3UFVARMFRN/QpuSWxi/jOrsFs9F6gQx/34O7dDFpmlVZo=
X-Gm-Gg: ASbGnctcGWuKhXQPpYcZZtZBST3fzj4mK+HjMUCXNrC6QGo59hQix/X7OcSrZ0suKAw
	OXFNOcVIg4SODZ8i2m+c0ebS0pQTX6D2xdyrwn9Mr45xO97fPE5ddyOzvSpuY/kxaWPhtyjdfZJ
	LlHE/zVH9oZBr9cW8ngbYAKQfIXyJcgMJBe6YUFP/y7zpzrazDvuH7w7NdIEYCUkvtrP5qdQwZw
	3LC13au6os+KK5QomsEnkVF0wDD/kq2LtiCMr6nGi6jSzJKzrrzKUpFXB47Q7Vo+tFpp8r9nUFC
	rDk/U6RkoEQ6fDMXdHwOhmC7mNTgesuYLnQwAkSAIL3rph6Xcr/ebU0L
X-Google-Smtp-Source: AGHT+IGafOD/Cz8KqZYx4HICrpiF57Ud5vJOpTpVhxH4dNw5EJOWaBQJT2VOVYJ5ILbnw6i7UI13wg==
X-Received: by 2002:a05:6000:108d:b0:38a:418e:21c7 with SMTP id ffacd0b85a97d-38f34171577mr17647798f8f.53.1740046908464;
        Thu, 20 Feb 2025 02:21:48 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7987sm19856657f8f.87.2025.02.20.02.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:21:48 -0800 (PST)
Message-ID: <5a86cb82-e313-4f50-a6ff-17181a2dd274@linaro.org>
Date: Thu, 20 Feb 2025 10:21:47 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] clk: qcom: videocc: Add support to attach multiple
 power domains
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250218-videocc-pll-multi-pd-voting-v1-0-cfe6289ea29b@quicinc.com>
 <20250218-videocc-pll-multi-pd-voting-v1-4-cfe6289ea29b@quicinc.com>
 <eec2869a-fa8f-4aaf-9fc5-e7a8baf0f864@linaro.org>
 <huluiiaqmunvmffoqadrhssd3kl2toutqtcw7rzamv3sqdglsf@7lz66x4sj3gv>
 <d4c4ecf0-9094-4341-8711-78a48e5d1344@linaro.org>
 <d444f1fb-42a0-48ef-83bc-d5aab9282b22@quicinc.com>
 <gzjyyl2kzv52zsewn5zf6ei65fymyi4pspvsmsjaqj5sklfxvc@bkg46saulni5>
 <fcc31cc7-67bd-4102-a53f-ebe66b4fd1a7@linaro.org>
 <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <3da96df2-1127-49bf-8114-282cc488c194@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/2025 07:15, Jagadeesh Kona wrote:
>> Yes, its logically the same just done in core code.
>>
> Yes, this code attaches domains before configuring the PLLs, but it attaches PDs after get_sync()
> is called on device. As I mentioned in other patch earlier, if we attach PDS after get_sync() is
> already called on device, then power domains are not getting enabled during the probe, leading to
> the same improper PLL configuration issue. But the current patch series posted will fix this issue

That's not what I see.

The PLLs start and the GDSCs which depend also start.

Perhaps you could give the code a try and comment ?

---
bod
