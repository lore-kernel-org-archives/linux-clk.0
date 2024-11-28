Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EA519F103
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 12:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732796224; cv=none; b=qDECGFpzlBi1QLJ00Jh/NmoOovA5KvRWnuuoc2opsg4ik7HLeGxsPa4YGzpDZSRXUZJmw4BZ9K3MwauOm2AVQEBUQAG9PSnoagumEmiGiL/bY/TwjjrulMuSDrcpQfWwwx2fKLXMnRwi/QI0pdLgO4icng5+FXu0BAeVsdy5XKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732796224; c=relaxed/simple;
	bh=2anrZsi8yYxZsGY8iWPbTzDGxeWMdq9pCPMPA2m4h/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ly5v3NnjAasK/h+5/KiPOn1a6Itf18EV/Fx1GB3IB888sZPzPuxz6TJKLIjyx2rKlaR+VLYC4XPw6PwE5aK1JyZYL5xWk1gRDC2H/OYsXnDxWw0BDlDkkG2Hb/JXLJX3UVGaV+u/xxh/qfiYeE/mn4JUzKg7N3L7nLzun5Ylse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=UOQnX+CO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="UOQnX+CO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-434a7ee3d60so11057005e9.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 04:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1732796220; x=1733401020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qnYKNjsj9+DIg4dgtEwsJzOol8LULwkHizIbCsuFjgI=;
        b=UOQnX+CO9rYOgMAHMozJhN5pBYnItkE/bw6KxtiHIz/u1FVaFMs3jBRb2oTeNFp7V+
         fcQgqIgtBVioUX7dgicGKQ3MXXDtrxgkLlnrZW+IWqAyBKF+wzMK9t8ZVE47EHGwSVeR
         EvEYzZs1CT5PpbPVnuk7V2jbcw0gDUXSgyp3mmxQz+/yHH10dUT4SlMg6FQoQte41Kq2
         uDveZTs5K8Rq5AbRzlXgXeu8oZeLAKMVE5Vwcmkol4vQwFYGV8Qdpd9sp3lVT0ReWc16
         yqIwgjrETx8+qUHjMcrFX3L+C+oMRLKtUPFFJKVyIXijs76aRUFxZyDXMeiuNmjIk/Mu
         lk3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732796220; x=1733401020;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnYKNjsj9+DIg4dgtEwsJzOol8LULwkHizIbCsuFjgI=;
        b=Cm7d2r+YWw0jFoXHH6qFbr+2ByCrwi6PKsb3paIGMN8BdcoLlvnDhBZ+UMF7v4RYTV
         rMA+uT4umiTsTZ/+JQUksccDbJCP0kPGXkW8I91uVPKz0f7/pANEvfixyCMqC6poxZev
         on9z8l/pcoEHuzeq8G/Ydzr/L2gHcmAbBXV641lfBER46Zk/2vA63vVgATYGBlM2A0o7
         oMfYv/mk62wNacXQE41Pl1yw86ihudI9p5ksS3lzqrJoUjpwjlMCMsKHqnAiYkDUxXfP
         WZQpJn6ooea2p9jL9RUNZ6wCyyysXBT9oxuLTkRp2XCbnRnWRlIgtjvvKigpMJnyoGkn
         xMiw==
X-Forwarded-Encrypted: i=1; AJvYcCVJvNlxwrkz15OvUBTBuzW9WFQ//pUb7OXixcOKvBGvaZNUaemUHVo7vHXCdBo9BZyNHG4v+YNvgPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJpV0qaA5WHwdAHWDaBSRW6DGBzySILAu4CbClZeh6i2IGo5OW
	WchBPeIfpEfcr8m0cINQ6J3pMph90vGWMzHVd8MbDPPvMBa65sVPjKprF7V4cQI=
X-Gm-Gg: ASbGncvqvkONVZSq/jCxaq8LTIS/DKxkLmiCwWusirsORWJTf+8LhYBKO8UNUoKS1qb
	d8IuWB5jvocrvLpybSXTDXZq0HG7bAy9kpTuuKMB6WftO9K5VIrmsQlSuj+9l56youA+oxRuuUC
	XPwKc8/BOUSCKC9c0HhLkkvQg+hy9SaTs3i7ierDF0FhXbgII2RGTUwM2Z4qyflSSVLquQ3Ec1l
	xQu/aV2uIPULnT115e+rPDthEYR2evZ6o6A+5a44DloNtul6lWU+LE44z99dss8zQ==
X-Google-Smtp-Source: AGHT+IEZjXNtTqeugmsm2btLkjXjVN1qa/0hxV/pE3MegQX6gcpP8J+clt9rtORx717q0sN/fuCk+g==
X-Received: by 2002:a5d:5f93:0:b0:382:22d6:988c with SMTP id ffacd0b85a97d-385cbd6050dmr2242980f8f.5.1732796220493;
        Thu, 28 Nov 2024 04:17:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ccd36c44sm1508127f8f.38.2024.11.28.04.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:16:59 -0800 (PST)
Message-ID: <ec5faeb0-2cfd-4634-b772-80197c1b9092@nexus-software.ie>
Date: Thu, 28 Nov 2024 12:16:58 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
 <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
 <a73a3b5a-cd83-4f87-876d-ea99ef8bbd70@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <a73a3b5a-cd83-4f87-876d-ea99ef8bbd70@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28/11/2024 12:09, Vladimir Zapolskiy wrote:
> Please simplify this change, please do not ignore patch reviews, if you
> find it possible.
> 
> https://lore.kernel.org/all/8a33c0ff-0c6d-4995- 
> b239-023d2a2c2af5@linaro.org/

You want this inlined ?

It seems like a stylistic ask but OK.

---
bod
