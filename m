Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4319117E905
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 10:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721213596; cv=none; b=DiOi1R4B+ku3i+T/2tqqy7vtZXasnz4hZmkFyFPNo/2d7vYGOTmD8+eapSNyoOOoLcic0yckW+dTYFvlotB89S+zhdusbN511UM422s/KCtwniqo9FSE69tWMbKRykA8zU50wkVL/Lzfhkt8yxTJI8qYaRVL2Pw1LaovMT8lX7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721213596; c=relaxed/simple;
	bh=Yyz0hvRoEoO1j+SXUsrzgM/tvU+qrTtOStlqr4YUMOc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmFJDS+eo6yZRjo4guXWj3qSyOFM2xZ2GlUWrFNC3QwEmUeZFhAdboqGbWXKbsIciSfARhVUCd5L5uT4S1PQbePk8utkVbbVXe4Hc9qSLfYdac8/7tEXtxxQ3H10eUm+9pJtD2oaVFlP/j1pBi6pA/PqMXeLB6RnnuLJfn2DXNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZW0Rk4tl; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZW0Rk4tl"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so1266189a12.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721213593; x=1721818393; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r0u3BVutdlg3A7OrIrYupQbFZ6CRR+UFVFVGoNprDxo=;
        b=ZW0Rk4tlnPIwa1hwFeSaG1Kl2bW/8+ns+otMrbn87dcG95pnhnYsAs4eu1TyC9JJ5r
         5Y1nFJGDclCeE4Pd9jlK6VKxhK0lGlcv3jyejoK0qkE199WqsSDQsOQhOa3iyR64nXpi
         QR4oObTSNCSE69rYSr9RSm5cLNdUv99zlCkTMkJskrIs3gJSRnjO+pGhZcYxcgGloD/6
         T8Rl13zgVfkMpSdR0DRnzPh6ljbq8DuO/RkI2CzVYFnoDlq0f+vZVVvGzF9gVx7GOaCB
         WkdrMJRAkz16/U41KoCOPghGofcLVTm2w5jY2eVWmbw8jS4Lj/STszsCULyVsUP5OniT
         qzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721213593; x=1721818393;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0u3BVutdlg3A7OrIrYupQbFZ6CRR+UFVFVGoNprDxo=;
        b=ZT9vZ8fCgyBFGaircA+qzUERayqxL9Vo+MmO7p/yke5t8ocEvtlXw0bzCtKQxyPgMm
         +NGYxbR0XOrXSV2rvLqmw3ZhI5N1TXtqh3RHDKctAmjD5XBT3YwiBYZlMvSj+QS3WXLI
         BLqDcSplCnzSJV8nm1WOymiFBHfv78jMxjj17frW8UapbaMGywlmd35sCaMjYCVDHhVU
         yGBosk55fYA1SDAu6Hx3cTnJ2SgpUkF+TjmFjsh3GmakqT8WsD6C2dsHNgcTa8/zn5IC
         joPmE3QPjdmfzk+bknJhEECzvubvHgY3qTaF/zOjO8XtS9AJX19+HueSOUMGBmg8T56f
         tJHw==
X-Forwarded-Encrypted: i=1; AJvYcCUrsu79N2YqEA6Ca/sT4j1i/El700aLz2+Ab16+EuVnRA3sWAQ4LO0vOAlmAsX2L7AAO356r3yhs/gn9/Y7dahEbtyayUPmmwmN
X-Gm-Message-State: AOJu0Yw+atnFaEvUWv4xgoYu4FD+9z5BWhwwsSt0PxzEfHNxI+XRFGsi
	qDRnSo/m64cvJg9r/O+/a38Y2hPjTT1fA3TiUzUHtkNCLTJnA4exl2YXRuMVO14=
X-Google-Smtp-Source: AGHT+IGE8PKdWdKQ0CmFb3axsD/WyHTpwJ07wSanHT11iLxZDrnuLM5PXMhQIeSftRRiTIbWOUilvw==
X-Received: by 2002:a17:907:7701:b0:a6f:a2aa:a4c7 with SMTP id a640c23a62f3a-a79eda04102mr461572866b.3.1721213593565;
        Wed, 17 Jul 2024 03:53:13 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1e5asm431644766b.109.2024.07.17.03.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 03:53:13 -0700 (PDT)
Message-ID: <7fcc309e-f1c9-4693-a2d1-76df85021dff@linaro.org>
Date: Wed, 17 Jul 2024 11:53:11 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: Add camera clock controller driver for
 SM8150
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>,
 Jagadeesh Kona <quic_jkona@quicinc.com>
References: <20240702-camcc-support-sm8150-v2-0-4baf54ec7333@quicinc.com>
 <20240702-camcc-support-sm8150-v2-5-4baf54ec7333@quicinc.com>
 <xbe7kmaxhfwy26qzxrmwgiijaaiap4kdkruaxjs6ymihaw5taf@hvj57wyncfea>
 <cc1957af-17bc-cd71-e6da-013e3a740014@quicinc.com>
 <CAA8EJpqmJZJfd2famarx-FKFb1_+-nZM3N+FwK_hiOurG8n9=A@mail.gmail.com>
 <f4072105-e0e2-46c8-82ed-92105b43a345@linaro.org>
 <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <6124f9e9-3fdf-29b1-128f-c58f5ebe1424@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/07/2024 11:36, Satya Priya Kakitapalli (Temp) wrote:
> This clock is PoR ON clock and expected to be always enabled from HW 
> perspective, we are just re-ensuring it is ON from probe. Modelling this 
> clock is unnecessary, and we have been following this approach for  gdsc 
> clock in all the recent chipsets, like for example sm8550 camcc.

Having a difficult time following the logic

- Re-enabling an already enabled always-on clock is necessary
- Modelling the always-on clock in the CCF to park it at XO is
   unnecessary

I think that's a pretty vague argument to be honest.

---
bod
