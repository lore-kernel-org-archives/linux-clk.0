Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2342BEC43
	for <linux-clk@vger.kernel.org>; Thu,  9 Apr 2026 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775750397; cv=none; b=XywzNtj0CasCpTe/ZvCPzLmG18F1rfiKzd9WIDkB1ErHI46ypK68k6fYF+rIp7I9X4hgtpWUamaBmC0FcE7Dgon3XfGnccRqi3Z2K+DyBApsUQ1nLJQGtwp/HzfBrSchYPkVawyK5zv4ChkykKvswQgXca+4/F6vr3yNb7FU3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775750397; c=relaxed/simple;
	bh=6fOgEdrTDXG4J9FoTfDRCR08WcOMcszG3utCaL0Tn8M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZAmjpg9B7qbb0wwpnpzQpj+lZE0AgHecxVkM/bifr6v87mRumBBoI7WB7tO952drGdevWWgINSvdglebDSOVMV5GNwEiC6a5fQCLGztqvyqKi4k59AqQHlAqacB6Bb2dp5c2RPG6xt4ySEEEMumYlKOZOG4283cXiBzz+SmlbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UK2YBOnA; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UK2YBOnA"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59e58404f28so73962e87.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Apr 2026 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775750394; x=1776355194; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U04qQNDkQW4gdeWnoAOVfit+UeFcepKVp4vhcTXFJY=;
        b=UK2YBOnAyVtFz7A599c6SUwpDs2OBI3KADzi7sOspo6/pVZjl58SKmS4AGNsagUr2Z
         onMWwIOVAGk6Gk0mOjU7BgpN1NrQIEpjtUFO201pV8L5mmWjMW4dEi4T1SqkhiJUhSUR
         jqPRgHQHLCLxxfdHGzs8k0YrPqeWbA0wd5dzWk71ZpCFF+zvty4pt1GKZ3ExSqzJh8i+
         AmFUoil6B3haZXcSith7/JDkY4JXKx9Zsi5mbdOGQ1w3KroifGzhIrKItJtwmXQ+37O5
         at0OVWJLDsj6Kdr4MHN74jw+DYpHSfzR/OgjEzBKg0zzbP0MSAp7E1dCZf2iNq9jGmSO
         E0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775750394; x=1776355194;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2U04qQNDkQW4gdeWnoAOVfit+UeFcepKVp4vhcTXFJY=;
        b=Kz38SOdI/8GP9opn/pL+uvtar5zI7CK29Ng9WMTScX5YE3zTNXlaNTlbV03uHC6zFG
         ki9hFB9rXENR2xENaVp4nCL8seU/AQ2fjxzVwFOgA/sOszP55HSPo5jl1r3gICaWBX3p
         hne0c+dRB9ZHkwg56j2r4rCgN3ThLVaNgPWW8pT5e7SaoHMcInf+ROi9QzeVhvd18SzS
         PEICJtXWtSabijLdJMTLeiO5rdaNtX9trXg02hPoSIlpW9SbSb/z4KKrpiLTozhaJJ4x
         b9sPeZgnEFCQ1xctQ4PX3Yl8cs/rdAOU2glbiA20CdYQH67FBPijnZ2iksKJlF+EkTvz
         JfZg==
X-Forwarded-Encrypted: i=1; AJvYcCUR7VDOYJHO5JIVPBOorfQGeO8Lh4OzlQ0IDd3GmNMeRvNmtc6S+1tb+uOSJu0zzwTODewPP8nBlTs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0QqmWc272ictNL1tgX2Te9RQtHWPPOM5YTsKjTHHs7Wa6vPbN
	dh6+l2n95bmNwp6Pkv4WRKQs3UztBBEl3coOVoHW6/D6KCjcdToIM4bzJS3Jj9orr5c=
X-Gm-Gg: AeBDievUdgNQ5SBWdW9kWXgi+BgQiVpEFlymtO8UmKuFwRoxJtqzQHAeLlF48uP29Fd
	Lalv7v5moX8Ky0OKcmck8uSlAu4kXFdoDd8A8N6FMTrK5iveAvwgrHHpYYGPVtW8H6WcCBDzq1m
	26sh8PW8CyF/ZIkD/wC8kw3l9uxMrtwQzqUF6yd+Jwc8IZSnj/RzutirqwNKNMcY9/KMw9VbBgs
	Gts/++W4qsPjPVBGrz67drt6+2PePVmdNysnZCZr1AcUhHTDawH+2Vscy8vROKMLZgSSmmCcxcQ
	N4p+fUqfM1Lf4LtC/OnCn8i7OmvxVJEtJIKO6LTLFKwe07FKyaMVLBCebrCl8ieHJ1eLk37gSaI
	qwtVip9QahleYj64G6iS569L5PelR3Kpy2SwpsZL58/6u2ly1/OXtO/kCodwZ8+IJ9zbP3qQhmI
	ZIwyMOZ6fOamkl7LJhm1eZrWDvhBajXQqRpGb/ljw7fpww8PPqbX3z+JSkjSFNHcGHlSptq/lfQ
	m17i+0iQct/2Gsx
X-Received: by 2002:a05:6512:31c7:b0:5a1:4712:376a with SMTP id 2adb3069b0e04-5a3e25f2c8dmr1235674e87.8.1775750393869;
        Thu, 09 Apr 2026 08:59:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495ae59bsm240151fa.38.2026.04.09.08.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 08:59:53 -0700 (PDT)
Message-ID: <9ed4015f-192d-4cc4-886d-27e633bbd97a@linaro.org>
Date: Thu, 9 Apr 2026 18:59:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] clk: qcom: camcc: Add clock controllers to Titan GDSC
 power domain
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 17:01, Vladimir Zapolskiy wrote:
> Starting from Snapdragon 845 SoC CAMCC device serves as both a power
> domain provider with a special Titan GDSC as a top power domain in
> the hierarchy and as a clock controller, where the clock provider
> function of the IP strictly depends on top Titan GDSC being enabled,
> thus it makes the CAMCC clock controller to belong to Titan power domain.
> 
> Today the formal hardware dependency between CAMCC power domain and clock
> controller is managed by runtime PM in every CAMCC consumer device driver
> like CAMSS and CCI, however this is terribly scalable to any future
> CAMSS IP device drivers, and unfortunately it is not scalable at all
> camera sensor drivers, which are also CAMCC clock controller consumers.
> 
> The change adds an option to describe CAMCC power domain to CAMCC clock
> controller dependency properly, therefore runtime PM management can
> be simplified on the CAMCC client's side.
> 
> The series touches only platforms with CAMCC drivers, which marked as ones
> using runtime PM (see .use_rpm flag) but Kaanapali, which formally has two
> CAMCC IPs, on the opposite end e.g. MSM8996 can not be covered by this
> change, because camera clocks and GDSC power domain are not separated from
> other media clocks and GDSCs.

I'd appreciate to get more input on this series from Qualcomm developers.

TLDR:
1) sensors are CAMCC consumers, and sensors are not under CAMCC power domains,
2) exactly zero negative side effects are expected from linking CAMCC clock
controller and CAMCC top GDSC power domain.

> 
> Vladimir Zapolskiy (2):
>    clk: qcom: common: Add option to link clock controller to power domain
>    clk: qcom: camcc: Make Titan GDSC a power domain of clock controller
> 
>   drivers/clk/qcom/camcc-milos.c    |  1 +
>   drivers/clk/qcom/camcc-sm8450.c   |  1 +
>   drivers/clk/qcom/camcc-sm8550.c   |  1 +
>   drivers/clk/qcom/camcc-sm8650.c   |  1 +
>   drivers/clk/qcom/camcc-sm8750.c   |  1 +
>   drivers/clk/qcom/camcc-x1e80100.c |  1 +
>   drivers/clk/qcom/common.c         | 16 ++++++++++++++++
>   drivers/clk/qcom/common.h         |  1 +
>   8 files changed, 23 insertions(+)
> 

-- 
Best wishes,
Vladimir
