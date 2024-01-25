Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F88E1BF28
	for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706176169; cv=none; b=Zu7qF6zopR7+RaMvVz0ZJx/LU7OcJ/GpwX/v8yuMqVCPANXyNlLr1Itlk6cYiU6Do1SkGuSYEpE4eXjBfMrT9vcRnLxByaGdsCY+fXrnK10CMFaLZycZ1LO9I1n3r8lKjSax3tG2I8dri73N49ZoRynZXhjanvLiSSHm4wtSHsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706176169; c=relaxed/simple;
	bh=MpsKrdTIjIwvbcRwRfZF01jdybzRyWoMrLmCa/UdKpU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Udfvmwf17tn+d4oiLFEI078BiyAr5Xqj4ngyiLURlMsb+Rz4JFb4xqSC5at7WEWdUzo6cgBrmHyO2Q9Zztiw4Ge2M3nzDaDx7Cs4CPFtbVua5K45enUar+uKMNjInk8HhNGwLfnzRI8C+B953/skq6MDmp01FcsQlacw27u164Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oS0rLRbC; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oS0rLRbC"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cf2b218c62so17971691fa.2
        for <linux-clk@vger.kernel.org>; Thu, 25 Jan 2024 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706176165; x=1706780965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPMySe0yXPWxWL/iJsUJSLzHKiI9qsvkmijA7/w7YXM=;
        b=oS0rLRbCRZNOyocDPkriqf4PgqaLwUWwsVRtwREmrXhsxieqPuSnw2MXFXXQ13Z0p6
         1TZQ9zCcTZbb7J2Ig1VLTzUpxYBdMn+q2bWjJXmDbo1457mOf2B3TRGmuCCiiErHfQ+C
         dQ7hYs7YrPDRKz9h0t0ptE6cIIbW9LusDQ2l5WKc6xmHxACUS77/wdjsCX594Aca9F0A
         xRRIw6+sM5S4QcAtlY29pQj3lKb4NxF6D72NeVFrlPeudQA1V6Oz3gG94REIHh6SC7aq
         8BHGDqJwTHAqUPtuwkAzZR+i0zZodP0QKoaDXXfNzlIKOS3i7lyK4cBkz1hsKe1QC6JW
         ZhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706176165; x=1706780965;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPMySe0yXPWxWL/iJsUJSLzHKiI9qsvkmijA7/w7YXM=;
        b=vz6ULZmKtj0LDAsE7xNkTw/CHq6Ad1czVMLy8kRmnWC0ghRgJOSMqtgM7Bc1x1P5Tp
         JDBsluwh90CZTF5J1556CUHMBFfdMTF3oLzCGBt0VAKafjtuj8XRukh+MU6L8H1IS5ou
         roJf9xeNQeMDCA+tzJTrHEGDN/wkBKLdj091zAKMJNW/UbPwvgspZOjuQHv0RaGODiuA
         zOVpyT5Kus/9F0ryG3rGynU1NCVL9mREq0hr+dXVX9pjy1Z9ODNMm/QpHbsh6okW/I3S
         9D6/tW97npN8i9X2BSO++6yo/vh5xexj8B/PNJsJcAJO1k2TdQ9ynLH8Xlfz6D3e1Z+2
         cyfg==
X-Gm-Message-State: AOJu0YynZZUQPRdyUW9OBv44UI2oXEbcGYmRtD/sav96pwOgII3H3jps
	fXdYFVS/g9Yhr0TVLoQEfv+g8YS/bVdgBuW7MZpM0JsAxk4DrHlZjglmLWg6/T4=
X-Google-Smtp-Source: AGHT+IG+s/733KbkSSZ85ObjfXVAW2/zhE83DZd9BKMuD04ff2X3novkGEI4Owm4MiKjR+acNDE0jg==
X-Received: by 2002:a05:651c:623:b0:2cd:f876:27f with SMTP id k35-20020a05651c062300b002cdf876027fmr198484lje.130.1706176165223;
        Thu, 25 Jan 2024 01:49:25 -0800 (PST)
Received: from [172.30.205.155] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id x26-20020a05651c105a00b002ccd49fa5a9sm236170ljm.19.2024.01.25.01.49.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 01:49:24 -0800 (PST)
Message-ID: <99817149-4a2e-49fc-aedc-fe298964a019@linaro.org>
Date: Thu, 25 Jan 2024 10:49:23 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] clk: qcom: sm8[56]50: Drop the Disp AHB clock from
 Display Clock Controller
Content-Language: en-US
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240125-dispcc-sm8550-sm8650-drop-disp-ahb-clk-v1-0-0f8d96156156@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/25/24 10:27, Abel Vesa wrote:
> The Disp AHB clock is provided by the GCC but never registered. It is
> instead enabled on probe as it is expected to be always-on. So it should
> be dropped from Disp CC entirely.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

Abel, you just raised some concerns over my series doing this and now
you're doing the same, plus breaking backwards compatibility for no
good reason, instead of solving the problem.

The correct solution here is to register the AHB clock with GCC and
pm_clk_add() it from dispcc's .probe (and enable runtime PM on dispcc
if it's already not the case). Then the AHB clock will be gated when
no display hardware (= no dispcc consumer) is in use.

8[56]50 are in a good position for this, as they already have the
required DTS reference. Unfortunately, I still haven't fully dug
into this for platforms without one, but that's on me.

Konrad
