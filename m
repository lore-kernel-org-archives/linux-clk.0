Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E81E18E0E
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712774807; cv=none; b=gNYsio4REGLa42JSFWbYAlLDGVoJhY17rKC9RxW97ubWc292GPH+kNzu+o0nI6hmgtErOpshTHxvYm5DwsbQv37NeXeFlKUgRRx5YVHjEONlEchhXnZVnpDAxzuVzWABY77iRkCf8qOx/oPk9ON29trLEYgFORgkR1rlD7Bb/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712774807; c=relaxed/simple;
	bh=yyomj+5gyVAB6ukI767aM4UFJKS30CPHFZBJcWgbwA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pTlyxQhGwpURhi3irocd3Kuy+1RBmKG65hFGn/xtWR0qHB0B8+EOvDy5Eyv52IewTDHr4plOZ58BuhR/CX4BxjHplsSHUMvzynuIw9yrRT/1PKur829RAEQ0pwYHb5kG3o79du9q+upNS3/dhYhTnjPYwM5l6B/FbX7JGF14hkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=by4VcRYc; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="by4VcRYc"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-516c403c2e4so137268e87.0
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712774803; x=1713379603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lbDxWqylVcKb+Nlm2Jh9dcFKq/DXBpmqk7xdN+p8D68=;
        b=by4VcRYceD64aWLLq/kz1zlhz0FTLBzX9xj5kkYkZM+m/cq7HiW62Pq1RuELbzlaAQ
         B/Sol8JGl+3fmSUH0t5XW5rLb4ipJYlU0lZf2kJQ9LUX0b7105Evs3E0/V7wyyRQKJrB
         aKADhqk4ubQ0JajAC9lS/vEIJzDsCkqATevN1fPzbbuAeCWvMby2Ec9HmLNW73KGb2PP
         W0L67pufhE2V3sFJ9P/rXcv1aHZwg7r6XPfEBmW9qDZ+xabHxZWnkz+v/+BWgQl0bvsN
         wpSw+NPKBlPbnxcAAa6Zs3kugoJaEAjzCsaTatfb8vJJM43cVLF66b3Amzo9Y/BwkEA1
         VEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712774803; x=1713379603;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lbDxWqylVcKb+Nlm2Jh9dcFKq/DXBpmqk7xdN+p8D68=;
        b=kevx7If0GTKgxd92kAerDaDXv4xeTzGkgdLiXFDG7KD2MKVMFdIAIgHIeWCLteyAr2
         tkeS1QbhDhQRvvNStdzkpQCpZTm0yXhqLKCDmJeHM9hC5ufnJbcnfMTJrKVbogBy2YdT
         9KMrHw6oz9dvOO1MGT8GSw7c5fQw0fKw6Tp5bbkLE1bRrOxprc/o4yBFSGab7IE1Nd9/
         ysvcMO+CN6DVsJph0tOEgdvFUuj/kUD7xE1wOplrgXyuRUGZsewx/SSque6Fz8hm3obP
         rXUi94DsFy+J0BxtAy+uvxN2w6EUz4F4c+0wqpvw4bMyyQSvBPTJmtC69hmKxh5/dgvw
         iJwg==
X-Forwarded-Encrypted: i=1; AJvYcCVxD+acq/dwzrGc0zEHZXMKt1mxgnsKiJKHAyvwzN9Pc0KA0XIJsHxLbmcknPs5YKYCdbFEIzEp6uZCI/DwtmiOjWgMpzMpnRdn
X-Gm-Message-State: AOJu0YwqOj2q2LgWBFOnrkLvaCmNHWxqBiMtjKMHDO/XwuZW55EJyeMe
	LyZsUDLgE7ScunoWJy80zYkjKnd5RE6OL8GQ4h28Gxc1UJHX7Ob4b3KfRhYxpsw=
X-Google-Smtp-Source: AGHT+IE4CkAmfxE9uQ52rkXlfmGsE+D/QsAF3GttB2Lu7gBut9KYS4JWZbMjp6GR4ySz7tht/yLckA==
X-Received: by 2002:ac2:4256:0:b0:515:d3e4:4581 with SMTP id m22-20020ac24256000000b00515d3e44581mr133749lfl.30.1712774803201;
        Wed, 10 Apr 2024 11:46:43 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id q22-20020a194316000000b00517626d22dcsm334073lfa.29.2024.04.10.11.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:46:42 -0700 (PDT)
Message-ID: <ffe6393d-622a-4b1a-ad02-7a79bf6ee74e@linaro.org>
Date: Wed, 10 Apr 2024 20:46:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] clk: qcom: dispcc: fix DisplayPort link clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240408-dispcc-dp-clocks-v1-0-f9e44902c28d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/8/24 13:47, Dmitry Baryshkov wrote:
> On several Qualcomm platforms DisplayPort link clocks used incorrect
> frequency tables. Drop frequency tables and use clk_byte2_ops instead of
> clk_rcg2_ops.
> 
> Note, this was tested on SM8450 only and then extended to other
> platforms.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
