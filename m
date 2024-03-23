Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A0D15A4
	for <linux-clk@vger.kernel.org>; Sat, 23 Mar 2024 00:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711153815; cv=none; b=l8cZ6N9/KSz82ofAbYdQ8J/lmXvgwnytwj5tWAdVckkJZ2DCWyH+qJe7bKkxJeKJ08MW1t1AMXEbOCZoB8Aq40WmXZXYe53lXpBWqCPz23JuYEDHcPZDLCxUta6QtZrrsAFrhzY1luWwp/zPr1LiDJ9qN4POuSLml1w6yV6VV1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711153815; c=relaxed/simple;
	bh=UUOccslls9bWqGPHH/Uz4rnWUl+sJn4l0Z+QSHJ/sCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KgZifj9GegmtQX+S9ItSwHZf7GX5IuOFtFKFJUap5MQcjycBKsBEO1X3KuQoee0GwjfyKVhfS166sYjB8Kj+nOpCTXaENdr/BEIer9at5FpSGsEZdI11koecpt6Ykoj4aoXcyJgPjEkzkI8Twq9Vzs3AftSxZwbm2MT13fhLHj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MaDVqlLv; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MaDVqlLv"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso292960166b.2
        for <linux-clk@vger.kernel.org>; Fri, 22 Mar 2024 17:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711153811; x=1711758611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlA81QH4EST6rhr/ZPiqwpyWZfIvPJ7PtVKhA/bMf0A=;
        b=MaDVqlLve3YMWBKVYPYvzFG2OvhSxX+c7F+eN/3IxCCg2YC9hWbS2j1Kt73BG9mLU1
         Ah9YEPV49D2xUzE2wlaMFLXrmwN4kQnZ2wW6/Sb9pdJ7QV+6HFYISM3SYOckCDWGLhKO
         Zh4+jyNOiNA8HXPXUWGo/nF7t8CiBm+gnp9Z9bwRcmxHwQvJpJo/6+yxAgZO4fZzrmsH
         RYGb8NU8gp1jykuXMYg0GlGmK0VKbFnCGRdwtAXBZOtwom9Istarst9yc1QjJZig6mV9
         atqId2j9lzq25smrkFKjrqxgkpWbAq1YJFEcDoWjT+UnnAN63ujD2CP8fQDCT0u2Ke8w
         +i1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711153812; x=1711758612;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlA81QH4EST6rhr/ZPiqwpyWZfIvPJ7PtVKhA/bMf0A=;
        b=SskvM9+wU+W4sotsNt/Rg4qs7PFKY9TLfifHJ3y8Z0Lh+VitI0gb4U0tz7/5KYwqjV
         CD/RY+i+vFTDdGfP3JHdn1fbHdF8qEb9LOP40rjtz2lqxLcQ/8F+MXGTm+IT4/Uq3vU+
         wAQZtnZJu7HbqViMtfbalm67v9yn8RsgNXdKwoP3J+DS0sZICiMDHIm3tMr1BZUrkHW4
         /BYQrbMnxN3DmdWQt4mjXGOLlI5gj3sUXft+lavNVePlC4XJO4lE0nb89Tdyz9fDth9q
         Kt5ftmvxv+suWgYcw0ysXdFkawrta7vPlQMXXtrtP+QMvvoz5YWawyY23q+fbyeI4TAk
         JN9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOPd/opCHgrOqVsTRh1AhM0WThLoyBVsAyg6jY63HqBA2blU/8jnuuOcej8+QNSm4/eHtQZ2Hb7qTH2xBjBNqbjn9+XUIs1u48
X-Gm-Message-State: AOJu0YxLFot4SrXR6pXWVpl3tOIliCi464gZPMexDavAWbTC0InJw/tI
	rRgb4jfpeKESuxpVWrZ3jHMoKKeBtk9wx4iimoBC338UgKhHwcqMGCW+r+KHcNE=
X-Google-Smtp-Source: AGHT+IFR6l3ekLMK6KAgDpURHhT7qDgT6vhTc7HiREcwOdRBPFHAwnCcF55GdLYt12nkvJxOWmvfag==
X-Received: by 2002:a17:906:1348:b0:a44:1fcf:9b97 with SMTP id x8-20020a170906134800b00a441fcf9b97mr754255ejb.24.1711153811640;
        Fri, 22 Mar 2024 17:30:11 -0700 (PDT)
Received: from [192.168.92.47] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id e10-20020a170906504a00b00a4735e440e1sm351242ejk.97.2024.03.22.17.30.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 17:30:11 -0700 (PDT)
Message-ID: <909591c5-d18a-4a9a-b276-c4a3b3c823f9@linaro.org>
Date: Sat, 23 Mar 2024 01:30:08 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 RESEND 2/6] clk: qcom: videocc-sm8550: Add support for
 videocc XO clk ares
Content-Language: en-US
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>,
 Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
 Ajit Pandey <quic_ajipan@quicinc.com>,
 Imran Shaik <quic_imrashai@quicinc.com>
References: <20240321092529.13362-1-quic_jkona@quicinc.com>
 <20240321092529.13362-3-quic_jkona@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240321092529.13362-3-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 10:25, Jagadeesh Kona wrote:
> Add support for videocc XO clk ares for consumer drivers to be
> able to request for this reset.
> 
> Fixes: f53153a37969 ("clk: qcom: videocc-sm8550: Add video clock controller driver for SM8550")
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

I think I might have asked already, but I'm assuming these resets
are also there on 8550, since the hw seems to be mostly unchanged

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
