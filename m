Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62DB19924E
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 12:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795923; cv=none; b=KqTwvvyeuIZAE9iO33iFqEz52/LCT6AAeJx16+qsmxq9Tn6pCMTce0EDU4WDR2+/NtlpcK85MSeCOXUPGO0B0e3lxCPY5Ur5elsT/9IFzKbeIS5IA517sRIi0jkXTnxG6/cBz8Wkse0VGewhbbTDi/lMD42VBU0TvC4J93X1tHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795923; c=relaxed/simple;
	bh=0MeGc/7s/CWBQN05R+oTUtFBb/goOcovHE356j/Oszg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nVqwLgPmKnPr0sasoxN6USyGwkaxP7RR5BkdP5drhZh9qcdT4+LikHUecG2RSr1zwh2fYK3tI+qL7tRp2SfYCVwKeOgnn7MN5Q7SL/FVnYagDL8cG06SsghxZsugSrNIBkgZatAURoeyIBYZEW0iaMh5Wf/NpW46k6mwHZ2c+lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tS3TCf9G; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tS3TCf9G"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfddb70965so891717a12.0
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 04:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795920; x=1733400720; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TlagLEJFtywwVUMe1dgXgwPpKrkSCr7O7E/5icGZLn4=;
        b=tS3TCf9GbJVM54xegz7nf2GORR0cBMfxRDySJhFON77Ma0hMri69nqnIR9Ib9LtmaM
         jMCE15QfBVHx2dugiNIfuFN8omGzdXEorwGSLZTj/u/XOZsVhm/+NDts3qOl5vam9XzP
         psjleL5Fx/kke0pdY1a2UnMLbCSr3J3d/NVkNpRGOrLWdU3uxqDFVeRiZhrMq9FYjKdS
         j67QErPvpwTUKPy2xjdTGlP4ho6AYsPXWd55rhYabuPGb4dSTuoQizgmnuqXZmCedjhW
         +vVrJj/7/qSnZoQKRwVbX4/akOQVcgTU3P/U0Z670theUBZAidOyfpR3ZE4SChdjxck6
         nofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795920; x=1733400720;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TlagLEJFtywwVUMe1dgXgwPpKrkSCr7O7E/5icGZLn4=;
        b=aJ7qeajMtTaRavBYTQFnNrqSqvBK6zgN8+AJrp8WcV3Oi/N9xPsdSh3TD7/UfGIDif
         mJJ1/2Q6/TsKkW7mPfHwUQZkxTgdy7TDWoyIXCeSVDdDetY59PBaFz7pgR+mYh5R+/yO
         qcobIZo03b16QRxK2B9S/MfBJIhTsn49R1FR+huvjaNKsHz5wD/BP5LTmN8NKft6UrtB
         gKYRqZ2kO5b/HtNPPosHWFwkrwg9PHHbiRA5auDYWlpnc9XESc3pXbxtiyq78l+ImuNT
         5IqMP8zucLwX7CSJWCjMOvA++l7cPYYHkSWitqBP4HQP/ShRv7XcTaoHqS1j60oZg/c0
         pgrg==
X-Forwarded-Encrypted: i=1; AJvYcCUlyKj99zPdbjlxYs31M6xFvP7axDiL5Bb84jY2mV6h0E119ZEsq5nzK2mOhxZiwNt8F/rchRhhfRY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk6qkCP4EsgaY76lFIx9s9L7V+yD/YvwIHRIgQqFsJwPIacgVj
	NjSd7RDmIsqKeYaMGw27CVE9woLkmZhcERZqJDH8YWion/JRPXGGfWQfkhOtkfVxwid6Uu3Mu5F
	BmNQ=
X-Gm-Gg: ASbGnctXXpi9fX+iAwnDkNEpdvJejdpU32drwXb415D+TGHMZErBlT+T+HFUD7Z1ODE
	+9uvDvWmq/KPKYO0frBSeQs1G1vB/YnHOq3qGab7bwAVPOg4wcNXlPBqNpLhBuA7gQDNA/mCbFw
	92EfoHgUKOusTIeRzAqrX3IsTfh53pZorclMrDxiXLqhkbS46pSF+/Wkec0AnbCdhO+BJsBBn3P
	8S2Xa9ol0dg6Q6OQtu04SIlm82ZOuF3HmKp0mySene1Va5OggzIQ4LQJVWsuBg=
X-Google-Smtp-Source: AGHT+IHvAUIzZYTgmNUEdyRVWk60wm4MmFIPzbhwhInYSuwK9GJKfO8YoQIj0jmD405fTVDHMr0VFg==
X-Received: by 2002:a17:906:b3a4:b0:aa5:aa3:8c45 with SMTP id a640c23a62f3a-aa581055163mr464111866b.48.1732795920072;
        Thu, 28 Nov 2024 04:12:00 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5998e63a2sm59846366b.113.2024.11.28.04.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:11:59 -0800 (PST)
Message-ID: <b76cea3a-b330-45b1-92a5-844aa081b0a3@linaro.org>
Date: Thu, 28 Nov 2024 12:11:58 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] clk: qcom: common: Add support for power-domain
 attachment
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-0-836dad33521a@linaro.org>
 <20241126-b4-linux-next-24-11-18-clock-multiple-power-domains-v3-2-836dad33521a@linaro.org>
 <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <8189fe4a-b6f5-43a6-9f7f-1abddc366ada@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/11/2024 12:07, Vladimir Zapolskiy wrote:
> Hello Bryan.
> 
> On 11/27/24 01:44, Bryan O'Donoghue wrote:
>> Right now we support one power-domain per clock controller.
>> These single power-domains are switched on by the driver platform logic.
>>
>> However when we have multiple power-domains attached to a clock- 
>> controller
>> that list of power-domains must be handled outside of driver platform
>> logic.
>>
>> Use devm_pm_domain_attach_list() to automatically hook the list of given
>> power-domains in the dtsi for the clock-controller driver.
>>
>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>> ---
>>   drivers/clk/qcom/common.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
> 
> Is there any particular reason why my review comment was ignored?
> 
> https://lore.kernel.org/all/8a33c0ff-0c6d-4995- 
> b239-023d2a2c2af5@linaro.org/
> 
> There is no signs of the change improvement, unfortunately.
> 
> -- 
> Best wishes,
> Vladimir

In the cover letter I cover what was done and not done and why.

I made a new function because it "looks neater" to me that way.

I implemented your feedback on ret and -EEXIST.

Passing NULL instead of &pd_data doesn't work unfortunately.

Let me know what else you'd like covered or revised from the cover letter.

---
bod
