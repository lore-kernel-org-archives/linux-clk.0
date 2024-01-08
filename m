Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D7446456
	for <linux-clk@vger.kernel.org>; Mon,  8 Jan 2024 23:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V+7RGMXv"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40e47dc8b0eso11462195e9.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Jan 2024 15:45:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704757503; x=1705362303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kpE4qjeetNEvv2r2f+0SxvAe1muEwFSilksS8BiXRqc=;
        b=V+7RGMXvtO2I3zQh6Uf+7I++ZiXRzIEhKwPl86hBtUjAZsobYxAUXGptSMcFPPGpTs
         xyR0c3LqP2PvbTKaxBkYkNy/5lRkGy3sef4g+X7SXzZhKdppWxpYweKtLu8cTy6o5rug
         Xl6ySxgZXrFfSCMUOhiEWj2VY8bVzfFoqa9Ygy/V7jUvFIwiAdtA7lmkb+ySyc8Y/Zkf
         IFZcRFrrizXvLrVF0AN7TmbtA90umArRDM1HyRskjigNfICChRF5oYMNlI2ysK1UGFz+
         7DMMrUHvNroUSKb5oM28robR1ayJ6cL+3RFvWQpzJVpvBga2BearNU0WsdxMjkXJTB3J
         5J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704757503; x=1705362303;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kpE4qjeetNEvv2r2f+0SxvAe1muEwFSilksS8BiXRqc=;
        b=ifXAVzu6t2Yn41Iar7sxq8IlIaQtvz2iiaEJW6ajptJwjdiYGzm37SHS9BHf9++XXe
         vY4gKVXjl+PN2DuT/bLuz1xVtvUBCbbMLanQKnGchiZZ5uDuEGzH1gzVtDuwQw1d7SkK
         lEww3knB8Nt6IVVoM6afNmVS7RrAel3l/ONYimdeLOXWWd9/eRSU/gCcwywLlOJ5DNAx
         J0VuPCnFnPQDhZqrm792Bz58+9NdHvm+XZSMW3m2h8viwD0fDdu2YgpPtcgHfDmhZpvu
         moLQAbRn9rEiW1XGmk2QM0h0lI1pBx/MDe0nlu3+Tolv9MZUTSiQ+O6U7EBMLrfFarvn
         lyVA==
X-Gm-Message-State: AOJu0YxthaprzVMF1vJlMppKStGRmWDEIHDvYJnnszJC3qhUxSJ1ge4X
	DedECW/pDIyaeJ9Ii02X1w5Ck2zeYNUghA==
X-Google-Smtp-Source: AGHT+IERrmwHOLhdJIube3b8XFQkbiWoBjMVF94oGhwhvLiqJt7I5hYP6vW1ivHxK4fG9uN2quaqQw==
X-Received: by 2002:a05:600c:ccb:b0:40e:4c1a:e87c with SMTP id fk11-20020a05600c0ccb00b0040e4c1ae87cmr395739wmb.119.1704757503250;
        Mon, 08 Jan 2024 15:45:03 -0800 (PST)
Received: from [192.168.100.48] ([37.228.218.3])
        by smtp.gmail.com with ESMTPSA id i12-20020adff30c000000b00336b8461a5esm819712wro.88.2024.01.08.15.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jan 2024 15:45:02 -0800 (PST)
Message-ID: <5c274f9c-6270-455f-8b82-fcba992e3b83@linaro.org>
Date: Mon, 8 Jan 2024 23:45:02 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/18] Qualcomm GCC/VIDEOCC reset overhaul for Venus
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Manivannan Sadhasivam <mani@kernel.org>
References: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240105-topic-venus_reset-v1-0-981c7a624855@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/01/2024 12:32, Konrad Dybcio wrote:
> Some resets associated with venus require a larger delay for the hardware
> on the other end to function properly. These seem to fall into three
> categories:
> 
> - 150us for 8250 and earlier
> - 400us for 8350 and friends
> - 1000us for >=8450
> 

What's your reference for these delay values ?

---
bod

