Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1615712C48B
	for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 10:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714474017; cv=none; b=nBlgIZ6bahBDgARlgOPRtiuawwd2gntXu0ta7JtEQWI/hkAriBHAc/r9EmhY6EaHh5fB9bfZB9QbMmPwgfvxzhcK9Le+N9hkXgO5EJ3xeP9mDqSzPxouWl2iAsrqf2OBszFGQzJN47eyZuhuQ6UU7tzdrgWecLS/RZ8c1mCXEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714474017; c=relaxed/simple;
	bh=B8tH4tHOKg8ilZvr+0aytqIZjWrAXy+IX+xPonUHaYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HrjWa/mqEAdYGqU7EbCXDtemmXARCnemi3vx+2H1Qz20ksffSHAdwpo6yqwAuKjTh3W/QOgyhm2I0I2SZOYgKqcVj2BigKHs3YMGS7ejWbPQgtoB5AvX8Ef6Jnea3+mPLwqlccKMUG8X995S4o5wHz0r0E5ow1j/liqPfxuPfKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qvSHSzNl; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qvSHSzNl"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-57232e47a81so9000224a12.0
        for <linux-clk@vger.kernel.org>; Tue, 30 Apr 2024 03:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714474014; x=1715078814; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IZYTIT0ZxYvFVL0Ba4inDvmHjA+bwSS4lh+A5ZZwfbg=;
        b=qvSHSzNl8NVoagC+OlLY58nXDxoa//hSBKYC2aGwzwkHjJvvCaZTAtSvrZ9bOpQMlp
         XrCVq1zcA+cui64ugUY4uO7uEbtqOGUmJzX/IZu+njUwD5y3vEItGkYfIhQ9TzQfpZ7z
         EDN20mdh/lMsPAecfUSXuXFMTdzkmt28+UVogExGKaxdYiOPmpudqi/fjnczZokOEDSR
         DQ1pjgkNVT2DOGqYZeTuw0PmFweTJz75oThYMgrWeULTodvTzjfDGCqT7Cr41f2+crOR
         fafo0ytqlXRSiNT+v52bcRWdBx3zbd0M9kBFNXMNmRd3krOWlj+IDOIKCp/lHuJ+oSFY
         a/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714474014; x=1715078814;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZYTIT0ZxYvFVL0Ba4inDvmHjA+bwSS4lh+A5ZZwfbg=;
        b=Yf2nmASemwATueEX1gDyBCvnI2W7a1q64W7XN/J0dynl2FZH5JAGlLzbV2vhavuh42
         +NcJ6DIBGgSphzIIE35ICARYXH7Z1rFVgxSfCSQgNeLQ7I/6zOH6kd1ybGFFzOipgNWz
         bIpSDAUcCOsp6HXxALczw0O80G3+lZJ/3C6Y88wVEMzdrNTlGXjzD9542clo37+3blo1
         ksTILl/VKZROjW3N0ptv/cAo7obEWQKa2pa14lBWvkVMr4bplVOW6yrWgRnELoWqCBtw
         NNNVHYi9TL+X6FSCJrB7SD0Avbh0hR48l01fIwK6tCN29UuDkUiW7ZecYJMwihdHLaB0
         hdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMLQNbjVGq6tLnH7KTV46MMy39Nzho37GD6GLNxIjTNziE+XV2iQq2mygrN9olTas9EzIrvE1LktB0flyzq1EpAwdqO+8J5a/n
X-Gm-Message-State: AOJu0Yzn+t7ondQTPFXpozpoQVpDSYmKIVq7ouQiP6z8f9NbEeM06nOI
	T/10rug++CdgKWSmEv4FPT/0g22/JccKeZnU06pQCDmquw0pSWfbBPPLg9VtNY++SgLRmhKwsBX
	r19E=
X-Google-Smtp-Source: AGHT+IGHREn1JaANpEdDeLUVzNKKpT7XKa7oQeDihO/eWTk3yelFKyiSXlfuL8ed/Gcdg+lvCMbQaA==
X-Received: by 2002:a50:cccc:0:b0:570:5e98:64b7 with SMTP id b12-20020a50cccc000000b005705e9864b7mr2284381edj.17.1714474014354;
        Tue, 30 Apr 2024 03:46:54 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id fe12-20020a056402390c00b0057297f5935dsm465618edb.57.2024.04.30.03.46.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:46:54 -0700 (PDT)
Message-ID: <11bd7146-30cd-4b71-b2ca-d76875763731@linaro.org>
Date: Tue, 30 Apr 2024 12:46:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-sm8450: set OPS_PARENT_ENABLE on
 gcc_sdcc2_apps_clk_src
To: Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Vinod Koul <vkoul@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20240427-topic-8450sdc2-v1-1-631cbb59e0e5@linaro.org>
 <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <2337ba58adb3fb127710bead9b8665a9.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 2:21 AM, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2024-04-27 05:01:07)
>> Similar to how it works on other SoCs, the top frequency of the SDHCI2
>> core clock is generated by a separate PLL (peculiar design choice) that
>> is not guaranteed to be enabled (why does the clock framework not handle
>> this by default?).
>>
>> Add the CLK_OPS_PARENT_ENABLE flag to make sure we're not muxing the
>> RCG input to a dormant source.
> 
> The RCG2 hardware hasn't required the parent to be enabled for clk
> operations besides for the glitch-free source switch. What scenario is
> happening here that's requiring this flag? Is the RCG forcibly enabled
> perhaps because the bootloader has left the root enable bit set
> (CMD_ROOT_EN)? Or are we changing the parent while the clk framework
> thinks the clk is off when it is actually on?
> 
> TL;DR: This is papering over a bigger bug.

Definitely.


Take a look at:

static const struct freq_tbl ftbl_gcc_sdcc2_apps_clk_src[] = {
	F(400000, P_BI_TCXO, 12, 1, 4),
	F(25000000, P_GCC_GPLL0_OUT_EVEN, 12, 0, 0),
	F(50000000, P_GCC_GPLL0_OUT_EVEN, 6, 0, 0),
	F(100000000, P_GCC_GPLL0_OUT_EVEN, 3, 0, 0),
	F(202000000, P_GCC_GPLL9_OUT_MAIN, 4, 0, 0),
	{ }
};

XO and GPLL0 are more or less always on, but GPLL9 is described to only
be used for this specific clock for this specific frequency (perhaps it
feeds something else on the soc but that's besides the point).

Then, the parent input is changed during set_rate, but GPLL9 seems to
never be enabled:


@@ -3272,6 +3274,8 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
        if (IS_ERR(regmap))
                return PTR_ERR(regmap);
 
+       pr_err("GPLL9 is %s at boot\n", trion_pll_is_enabled(&gcc_gpll9, regmap) ? "enabled" : "disabled");
+
        ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
                                       ARRAY_SIZE(gcc_dfs_clocks));
        if (ret)


(+ cruft to make this callable) results in a:

[    1.637318] GPLL9 is disabled at boot


Konrad
