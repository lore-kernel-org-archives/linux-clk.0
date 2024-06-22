Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4573714BF98
	for <linux-clk@vger.kernel.org>; Sat, 22 Jun 2024 11:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719054112; cv=none; b=RvDwauxoDrvqgEsDmlRM+UK7LpJVkUf/lt56B/DZlIdfFEzNmsfH/XAHRKlDMuMeeRGZe+7QnjFIpOoU5AflMExzhBAHizdUx5NdrJUgjVSoFK1Yd4APgMyzoROj0UvD1bdsv7Ma/fUbsIClCdtQEo2T3+8RsFDnjAzmYQSgeEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719054112; c=relaxed/simple;
	bh=F3gqfRmiUj+bYI01JOgOi0+RTUtI8rxBBXSadyCmGJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Cmd5GwAQ6WDif+IyGmelZ8gOwNEREJFwrGOP9rmExR5G9XYatVGJpymGwY4oYGIGCaG5sJOMfG7ud9GtpiOruJ5UftspeHTZe/ROcbEIFeKV10gw6H0514Z9nbwGMDaDnVt7qvNp1i9P0IhS8bBZhhpDaO+tAAR7JNx/AQb9qJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lYTzriPx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lYTzriPx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec50d4e47bso11908851fa.2
        for <linux-clk@vger.kernel.org>; Sat, 22 Jun 2024 04:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719054107; x=1719658907; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=jXRUkjHTIgJfjCnNrNY9R3/Ef3KcLvNtWkpIANt8d5Y=;
        b=lYTzriPxM1sfMe/Rop+6du5w9ArSWsz3nMiIqmo/aAqRlX/ziRpi3C9NtvL+P52wxL
         cEQ6rJL9oikIrnHapvX6swYeI05PpJ6HpPOkpIX3JXu+uxef21iYHoKeEix9UqYcSpRu
         ZjnNpqSfAfAQWFa00QwKhOTQcfyKSpA2RPeSjJPjQub5q77knEx5yz3DvvOaqi2dVV8A
         m/vvGYpxJ2ad2MU3wuTZAY9+/Ol3WFp/eR2fp14+XOhq3IFMLzcyS4M0W1cRdDureqPJ
         oXDG+xseE0OCExUXZOcxPWJ97LXtTOjZmEz0oVpDN8iHvBYnay6xrhPuznW8Q+Fmelab
         iMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719054107; x=1719658907;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jXRUkjHTIgJfjCnNrNY9R3/Ef3KcLvNtWkpIANt8d5Y=;
        b=bGceckDITGhoHRsLnBgWMbTqLapRP1DlioPxBHwZ8S6ANlALHVm4q32gLxgSlnTRc6
         GuxO27sU/Ym43q9vylElRvJJC1Fz/g8XwhYyS2k5eSxPEyEHH2nQ+mR9TDvqc3uI7Sqg
         p1F1Wean4sr3HRmsge84yiqbQ+eKQUS23mKFs8F2Ns47fYd+CG7JS4aW/RK85/3xOP4u
         yKTV5VObr8YDEwrgxDHseUDwig+OWoTEhUqV1ANwXif9z9EH5mUkEuenzmPHoJjIrMGp
         4IZtNjAREvs43voHSWaYhF46XBR43fvrMjEDmTsF5fyNWW6Nk+a4Ou6OgSZkVNsrhJ2p
         BjCg==
X-Forwarded-Encrypted: i=1; AJvYcCXAQjrAy9keeXM1RJAvBEpkTd+DyAxvOLkt7YbveBr5GEns/ZgDMafBV15y3Gom+Epw/1Js1zNc3nIDMEuTFkqO5BPdGTxxjaUH
X-Gm-Message-State: AOJu0YzPy8Qe9CPWfdMZ78Zgi1FWkMoR+IYwyWEwxKniriFNCqUJKXbc
	6Zjf3yvC/4W5oCjatsU2/ZvNP6uaubQEUW7e2C2aItEOjuwFM4lxDIe5fxL5PCk=
X-Google-Smtp-Source: AGHT+IELT1vMCmwY6Vjcb3xgEIns4r8I00un0bZsJ8ozJP+j+xXOEMQnAgsIe1WzzaO/HXffS/b/Ug==
X-Received: by 2002:a2e:9785:0:b0:2ec:59d8:a7e6 with SMTP id 38308e7fff4ca-2ec59d8aa0dmr280051fa.30.1719054106934;
        Sat, 22 Jun 2024 04:01:46 -0700 (PDT)
Received: from [192.168.128.35] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d303da249sm2172422a12.14.2024.06.22.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 04:01:46 -0700 (PDT)
Message-ID: <d508f8e5-8303-4f84-83d4-d63f6c612a02@linaro.org>
Date: Sat, 22 Jun 2024 13:01:43 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] clk: qcom: dispcc-sm8650: drop TCXO from table when
 using rcg2_shared_ops
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240621-topic-sm8650-upstream-fix-dispcc-v1-0-7b297dd9fcc1@linaro.org>
 <20240621-topic-sm8650-upstream-fix-dispcc-v1-3-7b297dd9fcc1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240621-topic-sm8650-upstream-fix-dispcc-v1-3-7b297dd9fcc1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.06.2024 4:01 PM, Neil Armstrong wrote:
> Since those clocks are using rcg2_shared_ops to park on TCXO
> instead of disable, no need to have TCXO in the frequency table.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

I don't think that's correct.. some hardware can still run with the
core clock @ 19.2 / 38.4 MHz

Konrad
