Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC1199E9A
	for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 08:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635471; cv=none; b=SaJSSVxhVFXMAK6tPY6jXCWM2otfqS3iLsNSGBTtMn8DQ4+kZ9CPDHgtKFwZroty4RqtNgV3jt5UPcUh7eYn2GLOXtTTI9YA/A1rtOhPhGJWnX04pMlclQyvaQ6+fummRb0VJe055RVLuSzZKWkdfeNSN3LXQcxtczmD68TsZEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635471; c=relaxed/simple;
	bh=SEJdlxQ23Wh1PJutMKkwgNXKdM73Ivu4Y76y3S/iMcU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=okRP8/RohONBTPU5ZmMDQbFm/49SRC3u6MUUMkukbStNZknfm4TjSWzi+bG86SywNi82Slihwxn//txd1LP9mkYX+OkcP5MYKbD+HYs8IjzhG0au5H1dMWHccnkC1kDwN5WTQRklQP1ewI51xf1yZVsTbfMp2dbpBVKOwHfOiQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c2MMUnMv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c2MMUnMv"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c8af23a4fcso2278480a12.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 01:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728635468; x=1729240268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nAD5v+org+QPFKjhH7xH1l9zocUcHG+37XArsBcPgZg=;
        b=c2MMUnMv7t50613fX3tILGU74tI24Vqck5uE9B2W4RMWrFfSH9D1Ur9+J3dkKOt94/
         TniI3UuP2PWvW7sVNAGEziDxeqgapzUDFmEqb4mrATi9nQK8xG5WxtFqTOqNSow1bHX9
         87x8ljpQXz5iCXB6I7jZ8Qr7kaR4FsQjTJSyrGN+rzcD6meaMiRNWpil5KCiKuctkiNj
         zQG0XatjPuURd8J4g8s1t3PbeALQZzbMd0WkJ8h0RDYyElU46T39y52n0aDL5uMIjDUT
         mPyAAfLwH52VX/b6GuCH61f48xLIGpJK87IE+42gyM420VHocDQrBIe7eTYhEqrA4mmv
         9dBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728635468; x=1729240268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nAD5v+org+QPFKjhH7xH1l9zocUcHG+37XArsBcPgZg=;
        b=Fc17wnk6fowuebN0ih5NtEzmMmY0O+7B3ByAA3FYtmG90bbJWHETPy7NU4f2f2knpX
         4EulZTcpi4JnKaODLo1JAvWIEBXGAD5/kUP33DIVi54NKzkjoHw9ifMJdDeQPPiQYEY8
         x6uLFXOIOtov73ljpTYUbY+a4eFPje44Vs3lJNoyK8K+JcmXpO6xQNoo7W//EGnzhD3L
         nCqqPPtHVVOo+7F0nODk4lEPFpWeiR8kScelkkV0+1H2rQCPfS5zmRKijIH9wOPC4QsZ
         rYX1/G5MNHSC3WQACwmINBBslp/lH6c+UGsbiqfCxyBiOdKWN/RQgUeV8rnwAjRC5ree
         GL3g==
X-Forwarded-Encrypted: i=1; AJvYcCXH5roCr72Fgx8dMesZDGJyDyAkC7vFH3nO5lKymfndZlvIU6XpXQRo7LMOJ6a1BR+RtBx5ub9sr0w=@vger.kernel.org
X-Gm-Message-State: AOJu0YziRNYcKpPdLsP71PKJVSvf2ar0KcmBkpXvSQbvYpAVdaf096U+
	3vKP58V/M9J1nic6X2v5/kjzd7RhwFeALAPDLL21tGNzvGmU1YS2qOEE7NOF7j0=
X-Google-Smtp-Source: AGHT+IGwUhHDGXHO6KgriwcoHKU56ZhIDBRkdsGJETJImu6rNJO+hbQAho6na7sM96Ccnl3slVQy9A==
X-Received: by 2002:a17:907:7409:b0:a99:c85c:6646 with SMTP id a640c23a62f3a-a99c85c67a8mr12978766b.30.1728635468259;
        Fri, 11 Oct 2024 01:31:08 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7f5cebdsm188524266b.93.2024.10.11.01.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 01:31:07 -0700 (PDT)
Message-ID: <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
Date: Fri, 11 Oct 2024 09:31:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
> 
> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe 
> from now on
> it should be assumed that all subsequently added CAMSS IP descriptions 
> to follow
> the same established policy.

My preference is sort by address not sort by name => we sort the device 
nodes themselves by address so it seems more consistent to sort by 
address inside of the devices too.

Which means sorting reg by address and irq too.

---
bod
