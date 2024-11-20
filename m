Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBA19ABA3
	for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 23:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732145274; cv=none; b=U6q9ZZsiliLLXo3DwstALzzYys/MxC8imS1bXDhyFtgkbRcbQoH9DSr7tBVwh4i72pLYTiE4lPLebDb35s77i7A8R6n6GMLI/rMlqLYp8OQY6TJanA6fDLzKiYAyE/N4zjItuk8GcgF+XgBgXjZkUBjFSUrkZSeHTucN3GtkRwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732145274; c=relaxed/simple;
	bh=R7FO0aXretlov5s1jlU4aC1Z9PHGuhQa0RZWXL48ies=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecPGtqAzsEAawKS5u6cGYzHbka6ILAcTUcsxY7BxnmdkrCovoJRsA80dG3Kn7l8JcTnUabTPGF3IMjPoGkzBycOfETdMtuVROGkQVodb3GEcX2nz9rcQgsP58Hgfs8ApgF1+bAgp50O+kxn0FP+ziweLKcbimzkGLX2KzwTA4Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X/Mcxkf2; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X/Mcxkf2"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-382026ba43eso147094f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 20 Nov 2024 15:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732145271; x=1732750071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NdF7i9t9y6Q2JmYr14WDMyhUqwzAt7uL91F4oFpLQD8=;
        b=X/Mcxkf2r7YISOlT4zaIivtz3AU0J6fw0uE1HczWNB5GuTQRKGZf4s+sozFPrA+qF3
         +XoZkPfpuJp9/7OZANlkQYZf6PLKG437v2IwTWS+BP3nju7i/RGzrF47NA8UroxhIfkj
         TUzjpy5DqrOsDr3f1cv6jJK2wndjdbdXMW4xlQmN7JV0OvJXVU1iNt3zfazQlVGm2Gdi
         aryOgPInEUwzfun6SbbbrhwFyP+S9KzwvTVP3sMnFEvvZSfqvIJ+J6yxLP9K0PPOM+Aj
         M4lCe4KwdMOFbBakEXKBosChPsYBkGPzLsRHNUGJ1Z33nWiHS7boTfXP5XmxYd/eLrXO
         rIXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732145271; x=1732750071;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NdF7i9t9y6Q2JmYr14WDMyhUqwzAt7uL91F4oFpLQD8=;
        b=wzeKufw3Tm+IYnJDxh3nkxSX6rZ93GvBg/N/rxqyiIhADVwV+JTy+mM+zsnFCuaRRm
         3W6tyGZZP+fVOuAIIvOTbP5ZoIqNedty1hcgptK5rpAE/dfbqBtrGjAye6ogViTIjsuW
         7sOhJaR/QjgifGvfKEFYldISmboU0UkCHmY3rN7sKX+x9Gcytfl3t9CPrJMluFFBPuMV
         1AYBwrL1YYX0/CJHZ77J0KVAIG8vSo1PGyDqnCkV3+xqcjgMzMTc6v5VLUwitxb3gcdy
         xEBwyppW0jFMpg3ebIC7zmr16cShPQ8KvMXl4Y9uDVNS5mF/rYMLkzx9R/dBT7tEiZm2
         QLFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKEmTmEAmAkYdAQ5QXAf6hJMJ6hCkDcRribZd/r4KMsUZAo14vg8R2NATdUxoJyfFz2TFbKmxjs94=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/KWMhR6PU7SZuQNnVUJplDo3eCNEB1Gk4HZq8wcsgglDRrU9
	zus1kxnvcHhXzUtW00ywqMyL9qEPTxhUihjZxpiHCObq8Zsc1ao1UfPa32hyZrk=
X-Google-Smtp-Source: AGHT+IEfLUUlagqKYooznfNavSLOyyt8Ol8BKvDgl4qFGK4oImPluKpMPaOxoqZdYaZhgp6PBDcZ1Q==
X-Received: by 2002:a05:6000:154e:b0:382:22f4:7773 with SMTP id ffacd0b85a97d-38254a83f8fmr4165083f8f.0.1732145270251;
        Wed, 20 Nov 2024 15:27:50 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825490bfd6sm3248330f8f.25.2024.11.20.15.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 15:27:49 -0800 (PST)
Message-ID: <91afb347-e8ee-4a97-bd8b-9a1413051cb9@linaro.org>
Date: Wed, 20 Nov 2024 23:27:48 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] dt-bindings: media: Add qcom,x1e80100-camss binding
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-2-54075d75f654@linaro.org>
 <92f3f608-1ca6-4c41-9406-28c7ad589872@linaro.org>
 <66d1c50f-ebfc-41c7-95a4-5d555b336da4@linaro.org>
 <bb58d02f-9ed6-476f-8bc6-ad56cb35e37f@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bb58d02f-9ed6-476f-8bc6-ad56cb35e37f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/11/2024 23:02, Vladimir Zapolskiy wrote:
> like "vdd-csiphy-0p9-supply" and "vdd-csiphy-1p2-supply"?

In theory, however I'd like to avoid adding endless strings of new names 
into the driver code for each different power input.

We can add this additional string name though in the interim between now 
and refactor for the PHY API.

> Also you put a description like "supply to PHY refclk pll block", but if I
> remember correctly once you've said that the datasheet (of another SoC)
> does not give any clues about the usage of the supply, thus it invalidates
> the given description.

I'm surmising by extrapolation - that's "probably" what those are just 
at different voltage levels based on previous iterations of this PHY.

I'm just as happy not to describe this or to describe it as no mor that 
the 1.2v supply etc.

---
bod
