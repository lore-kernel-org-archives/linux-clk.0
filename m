Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FF2F362F
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752663592; cv=none; b=mmSBWHtOvaoAconTFzs5M86us9myvolhntbzOo81SUITdzqTorox71f9E1rkmRxCOwHmFAELNiWTaqTNLEZM1pGUNRAmQNZzpGopgjaUlTSOHdUmjfMuBNCoaQ8vKcfH2c4Wi61jzY24v8srsZIFubqnJ2B0R929LK1YhNkzot4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752663592; c=relaxed/simple;
	bh=RdqRsNDKKQgfrmCzzuSlgn+ij1i4HNnTBhYJQ0dea1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K8l1GFBbRu7E0wEdZFuXkuWNr2QXAQCf63rTJmZKkfjMhx0DuPjfhf2ajJprH/yg9TXtUWSbyEzHzwlOsfDBkW7/D6xRz+sIoPPIniuFpvfXQpOjkfc4R48XBesgmlFKp28+/jaMOWdQW5i57yRQl95LhNXPo4GwwVfY/9ZpWn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gvLMByKW; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gvLMByKW"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-451d7b50815so42180325e9.2
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752663589; x=1753268389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ePoCatCn8uwrUkfz5cDfhTqogA3pDEPeb9x1/QWcKE=;
        b=gvLMByKWWrz/Je21u/3w94ywjHh/tG5rkSpEu7VlmghZTilm9RXPY+RVoMAMJXksla
         b9+fiylhJAmnML3q9lrgDt8Soa2jVA6kO9EW+8HMNBSfZTwsPbwKMIoGlsy2/egVH2vT
         NqCQ2qJ8JsWbNNntz/57I7zToJIPGQD2lnSY0FuXFT8ihW2nDdKoWQ+6MlCeji7EQLhc
         Ab2p4nY7SHOewCtYwJbwg6o2thxcQjzuAv7XfMea5YV1njfFKtBW/M5HVpiGcgCPlmGi
         waa/J0deZaea7W7wefY2Mf62WowpKH+70ZU3bFIVcoyEdSavBsyBMV5QF4rM54unV6GB
         G6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752663589; x=1753268389;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ePoCatCn8uwrUkfz5cDfhTqogA3pDEPeb9x1/QWcKE=;
        b=juwcz4nYjzZfJI0LWnEG0Vcfy7mwDN3EZR/l+FtPvaEqWP4u/NUNUk7X4kL+oZe+D7
         3uK56zKTx70cxYqpNlDYkHReD1VXNzZzUvvwfIMpJHLaVeY+7TyDjd84/V/Jf14QY6BS
         IO8Bk/3TrjXUI3vmzBmiomRrxwxTSzLzapUXRfxhj4qthFWrrCOmT8XXvnf1+grX3OR1
         mpNt0xw2Ij33zY2niKKWCh+0dI8TeyGBfAMSXe0vHJZleEKzSTwmu2fTaNp/aSiesyqH
         MbjB/QGeZu6QslfN0Fbtocv3yRBbmDsyW/AJ0lqAqFJMkLfUsRvwd0l+9K+J5FueYBlX
         YiTA==
X-Forwarded-Encrypted: i=1; AJvYcCV6RWBjgt1l+BM9V1s7ovAt/TWr5E5OOfExzoMfJmvoMVCnSUmuR9iAur/8Ic7AQCw61pg/MBoqeOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO7zw4YhLbNxUCy6wKu1oc+lvnSFn5FVZIErqUZWa6o3q51lEp
	wJ+SinevSnZrR9M67vqwEtDY286pQBq4Ds6LUfkoGrLPTZvpCG2llwptFLfL0W+SKSg=
X-Gm-Gg: ASbGncvTlrAI053F5iq2Z5XBvBMUgkyQe+am3LV0+1vMMCsuLsrHSM2uwU+wW/z/0E3
	O+vpQHRbO4tKfkUFP+YLnjzFZNs/bDUdk77WdP26Mr6lbv96CpY9TBEckQEsLFmmNOp4/afS3P+
	6zeqilrH0cZt+5HYRnl/KuBH90dES0KyLqNpLKod1oqWqhpEGPmKjJpJwiHIxk2Kz+8/NGb5oOY
	6bpx0OIjNTCtvAbMiE1hS83T/Q4v4ai5ssxFc+RITalExWKbokhpswCpJIXliBwg4x9UhpWWxZN
	gY8FpvaLg+fR1OyRM0NsheDdU1Wr67VCt4Q8VvLTTYl9MIIu7QCYEI5Cger1XYeVcBjWc0lIcbC
	xxO3cZPk1abCdyPXR6Wq7HWTNqt+Im1ppVgmwLa0VD0Essg7iMGjDFS5AGNUziig=
X-Google-Smtp-Source: AGHT+IFW0OX33KBpiLU6YOL+IJgDcuTQ1zq15zYqdjMf2JYYuPC7KCK+xgulExDW9Uc9Bd9opQZwkQ==
X-Received: by 2002:a05:600c:3f09:b0:456:d25:e416 with SMTP id 5b1f17b1804b1-4562e331640mr20250845e9.6.1752663588670;
        Wed, 16 Jul 2025 03:59:48 -0700 (PDT)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b600722780sm9817655f8f.23.2025.07.16.03.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 03:59:48 -0700 (PDT)
Message-ID: <40784fe0-3c70-4e1e-8b42-fa7230c2485d@linaro.org>
Date: Wed, 16 Jul 2025 11:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/15] media: qcom: camss: Add support for PHY API
 devices
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
 <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-4-0bc5da82f526@linaro.org>
 <CAFEp6-0hDqgYsjOy2mCC6ssK2LkMM0z7L_szS+M_wSMeMe3pMg@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <CAFEp6-0hDqgYsjOy2mCC6ssK2LkMM0z7L_szS+M_wSMeMe3pMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16/07/2025 10:36, Loic Poulain wrote:
>> +       if (!phy_np) {
>> +               if (!res->legacy_phy)
>> +                       return -ENODEV;
>> +
>> +               for (i = 0; i < camss->res->csiphy_num; i++) {
>> +                       ret = msm_csiphy_subdev_init_legacy(camss, &camss->csiphy[i],
>> +                                                           &res->csiphy_res[i],
>> +                                                           res->csiphy_res[i].csiphy.id);
>> +                       if (ret < 0) {
>> +                               dev_err(camss->dev,
>> +                                       "Failed to init csiphy%d sub-device: %d\n",
>> +                                       i, ret);
>> +                               return ret;
>> +                       }
>> +                       camss->csiphy[i].phy = ERR_PTR(-ENODEV);
>>                  }
> So what happens if we have `phy_np` and `!of_device_is_available`, we
> just continue without any phy initialized?

Hmm. Good question.

Yes but, that's probably not what we want.

Thanks, I will look into this.

---
bod
