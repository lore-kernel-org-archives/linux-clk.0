Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AB21A23A4
	for <linux-clk@vger.kernel.org>; Thu,  5 Mar 2026 02:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772677111; cv=none; b=Aqx/DREd3JlHjc9AyXfgRZqE75ePVubzx+AJWmwBwRDqAvV5M4IJrsqR+zz4P9dpR4zjsCdtRQL3r0+z0dzQVJu3/twEghivBt79pGoiHg4tY2tHmSZ9kw+s2PDwZhLBkw34ydD33uLMqrwrbjcJoyJlTZ6GLIC4FbCNNAaAWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772677111; c=relaxed/simple;
	bh=omuNtWtOuCCJ0PrwP0Y/lM+iymvlPgAem1lThEqQuY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lN960/5RprUSLYR4cy3DzvbEc6E6TM2/b2++wBxeH5Tp3WGl10VFoEwgQ7Q0h4ypEwpUH22CZYSGk761M7gwsP/+Y03s4hdzPkl2xEV6E5MmCTkoD+xmEeQmmSYlmd8dVUJXyWMYE9vScxSE2OkeL6M501Bhh3c+BQWlcWqaynw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n13/4mOk; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n13/4mOk"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48375f1defeso56588855e9.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Mar 2026 18:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772677108; x=1773281908; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rmOdcRI/juiCXIkhIn1qeTo3SGfYdV+4fS9rxks7eyY=;
        b=n13/4mOkPLE0iXCGZfkGHjnUv2jM0LwbWucojVxtzmKji1z+eAcJDtn15JVnW8EaIe
         d86pqH0rLkSSqIXuS6klZwCf87ZGi0sxfm9WUfuXAs7M1gKT0NPqq9/FWB52cv3e6HYi
         YTQCAEPuIyWoLVjPbpXIT5SpKFAExlUGqpRgXKh/bkYpcfhU+pMk+SFyLUF9YqKsFuMf
         oucBrsPK4Gte1xlJBy0aFw21MhXXL/XtXGM3h25+vF8le3hf85VVDRedVdP34pF1v7iE
         uGPKrXi74xsoFjmH8wz0MHGJisPFWHleMb53rX6mkqZ9xtFnfUUTnFKfmoy6YWojl5hj
         jQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772677108; x=1773281908;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rmOdcRI/juiCXIkhIn1qeTo3SGfYdV+4fS9rxks7eyY=;
        b=lGQnD6s36rwgr+n3vjJWMoqvnyQJOJEZTMPw9OuEOhKDZDnNPGxeTR/saO+n42/LF0
         6/asmgrX0e7g/i177P2ssq6iUD6kZx8fS4ooIv/g24acJIVnhTNkE3UkqWCwxOp3MYgI
         pr8u6uc6LNZBRikQ7NVuirhftUlIySBLSsctckiFeWcO62bPnPteyQRvd/iHnJA1L7u3
         kfekVi9PmOZdi1dyFlMPv5ock2ubpRzGnyMMP24AqoFH4WdAyodZOdwDrs836r+aQd2/
         7C059YUr+GA8fc6P+OQs5ZP049O0rM12sxStkO60u8o3Pv53baAVweHMIocmkhNaEGzb
         TfhA==
X-Forwarded-Encrypted: i=1; AJvYcCXPHM6r8zjOz3yM0JGMop+aCiLVZdJIV/a0NoOI60B91qUbVH6TEhae+wcszzczW8mFZFTsr5DPnfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx/6eWpAJChQFAvxVxJRqYUZKiUG0ZDz1WIzOmedv9W/lSrreM
	YazxJUTOJVh6i2ZG/h+CqOIA+hIRyMeJu45Nf45Vs9HJd0Y2Wb/29Mvb3yryrJp57fY=
X-Gm-Gg: ATEYQzyaiy7SxkpMsLKOhroQsEOLfupYurWoWlR/CwOo/s9/owYUzIcBY18uyY4WlyM
	/bWLCgwUNTbAmEFzd0uEGZJpAvWF9ypvSica4BkQnWRoLXQYZDwGYtufPkTq8d0XkpcDpglOftF
	8Ynl/QG1XK/UbHyUwDsKXQ0j2ejMbSiKsmoLaYt3/3/n2qZr540nc5rUiGZ1wzQ7kg/aoI6XTLX
	F54+zCD9GUZef6C4Cw97E2IdGGQa5o/x/L1P/OygCHtjV/ydNfmJQpniur0E+KJEDKr9O3+rQ/6
	oPdVBFnfuqZw8IZDL+2ExqMssQTGyI7Q+ma/uXbwZVwJsuaxaum60gQVMLFs9rQOYXnnoS3oAQp
	6oRUOcdU1l6mz4iiIYJsZX2bY8b+7Y1HfnV7vRFb4+bFEHAK1bpaFsT2+O14dWUv6yQhbKvLU7l
	PWjEJguAKLhXITREA7mZp/uDJ37GpoYjEkNexi/yWv2bcihBcGdpfSEzwcoiStiXlS
X-Received: by 2002:a05:600c:190e:b0:480:4a90:1af2 with SMTP id 5b1f17b1804b1-485198bb48fmr74724055e9.35.1772677108366;
        Wed, 04 Mar 2026 18:18:28 -0800 (PST)
Received: from [192.168.0.35] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851fb27a13sm6688815e9.11.2026.03.04.18.18.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 18:18:27 -0800 (PST)
Message-ID: <2f1bdd7a-04a0-49a7-b275-4332f2979378@linaro.org>
Date: Thu, 5 Mar 2026 02:18:42 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] clk: qcom: camcc-x1p42100: Add support for camera
 clock controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jagadeesh Kona <quic_jkona@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
 Imran Shaik <imran.shaik@oss.qualcomm.com>,
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260304-purwa-videocc-camcc-v2-0-dbbd2d258bd6@oss.qualcomm.com>
 <20260304-purwa-videocc-camcc-v2-5-dbbd2d258bd6@oss.qualcomm.com>
 <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2byedzh5w6ymnoebve74a2a7oezgich25wdh4pdsqmvv3jvpkf@kyk2gz5khibe>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2026 00:33, Dmitry Baryshkov wrote:
> I've cross-checked this against X1E80100 driver. The main changes are a
> drop of IFE_1, SPE_0, and two PLLs. However it also:
> - uses hw_clk_ctrl for several clocks
> - uses rcg2_shared_ops instead of rcg2_ops for several clocks
> - uses hwcg_reg and BRANCH_HALT_VOTED for cam_cc_camnoc_axi_nrt_clk
> - uses HW_CTRL_TRIGGER for cam_cc_bps_gdsc and cam_cc_ipe_0_gdsc
> - uses non-AO clock for cam_cc_xo_clk_src
> 
> Are all these changes expected? Are any of them also applicable to X1E?
> 
> At this point, I'm torn between suggesting the merge of this driver into
> X1E driver and ack'ing the current form.

We can test the diff but, I'm not sure that will really answer the 
question if it is the right-thing-to-do.

OTOH if it ain't broke, don't fix it.

Reverse the question - is there any reason to have this driver at all ? 
Can the x1e CAMCC be used as-is ?

If not, then we can accept this patch and potentially look at merging 
the two drivers later on.

I assume the code submitted has a purpose though i.e. its not possible 
to just use Hamoa and Purwa interchangably.

A few community members showed me CAMSS working on Purwa last year in 
Amsterdam with the x1e code - one error if I recall was a clock splat.

So superficially it adds up to me that its not a 1:1 thing with these 
two parts.

---
bod
