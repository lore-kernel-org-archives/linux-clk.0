Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E853E639A
	for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 12:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776170689; cv=none; b=IFCrFcb1r8rVAw2zF7Q6asLIhRPpf1V3t/yfOz99iR9uvqSqXeOBi/henY/AtcWqyyMzTHdyfcLoDaWMtC1vb4pjlLCQ6ZX+3DvMju0uAxhipPqX5aBGU+l1pFbl4t2WqV0l14vfS6ZohS+/0M6K+J3/RXFOeCLnPzPz62cFoRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776170689; c=relaxed/simple;
	bh=L1FxbH2Z7EJSkuNEwbRoOrgk4RvNUnqa4tMvaIO/UiI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=oHi0EOagqyK9n123n+Bj7zLb346Gq8vTlyPwuzDmjByMMalDKsfqyYv86KCl9dTmkWLyNrdIUzDMZFtmaOAH6mTnS7dGLdLre1UOmGJ9p7Kln3olIrcXbkc/oAPq9E4LH1kjA6rqSEuaZfgK4yohRB9HGUebikJIR64L5paM5Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sj30H0X1; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sj30H0X1"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso53929975e9.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Apr 2026 05:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776170687; x=1776775487; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gsbm6li4eGm5HX7C/WAiJvOlqQ+JAeuGktoqHayFL8E=;
        b=sj30H0X1Kj3bOO9QaW06Gf0BEFZ+lsFAIr5n8+Ti3sqHW2W4+C0JkV4p0IFDmAoi4P
         Trfo+WswwRZ5IFcBdjlTcT3L7oz2RkVObvUbc5GJF+OUxLMkwQqq+GASjadvYL/RqKiN
         R6lGBuRIaZsBG5VMdxbyMIy8dJaOVZCZW5UTR07yQRpWcdrGVO5D7z2IRCOUa7A/Jkqa
         3So6KIkDsXWyqPV9ynvbYDxDFnDM9GNczo+QCfyNFRlB0CqGfflHxBKzdxzIKwAjL7cf
         uUXe9MKaJZ3t0IXiPfKogYbjuYqq+oEKsHjx0+B40ZoYfE9iIQXx3+/z0SBwYgXSyDwd
         Wbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776170687; x=1776775487;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsbm6li4eGm5HX7C/WAiJvOlqQ+JAeuGktoqHayFL8E=;
        b=YL/s/L6fHEnE42wO/Q3GnfCzVwN3SnKUXVFu7sA5mr/sihcNwQIvBemT6DV/AdtfsS
         OdxcNeAWLnb0MTdER0JbRDdpZ/uV8cx2/ttPFM+L1+MfU8sM87cAM3mOzx9qZsemWFQb
         P6GxiAzEsg0NlS3hZdyNeLb8IijqHfdUNzeunx+LEnXf8QTOW3FYiC1WVCGZz3HRhy4q
         EDOq2+5pZwnkkDgZYKf/16XORB+GXlH8lBzKCf+p/G8DskLu5VG3iTdeEDEUx76GcDDH
         PXjNYN3z+3xFStZ6md+tdjSIBZLDTAQMsCEM2LeG9VM3tYB+27/Drq+UHqzr5I4QLaqf
         1JRg==
X-Forwarded-Encrypted: i=1; AFNElJ+eJx/WH3+gPuCkQQosl4OQA/CSO6YjHRbIeMlSXgqwApMs6k971xI50OwO6tQDv9uML9Jm1U/zXZE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEieEaXFRaSQsGVv00aUecV+MTsw/XM9HZmCggGUEvqvELSzFJ
	0M2ESjGutCLPOelAsEWTTtax1Exe0cID+3/JOVQUw1HpfHgKMdgNOqp6JurnXijUl/o=
X-Gm-Gg: AeBDieslDNLJiOuPi1KI1F94fgjjtUSzpNlIb2k4IIXr+lCzT0+AtpORr/pYSdx4UXj
	5TXmheXg9AiU5/TqoQKT6cNC0gmQZNNj/hVM4UE8qwKCF5Ay3yDKHe1dUjFal6W60N49/RIy4no
	GiU3nfuMfc5wlbSYPK/vc/rFNa5eiz74mWbL6iL+WsgNuLvbdMwlfQwHQ0s5+lMBR0ekUIurXU8
	HR3y3NUun7UtfcDibGHJ9P7xUYthuwl7asYE5AXmafixCd3nQXIbx0QDf8W9z/BQiBTDvQtDL8h
	ewsX7IVYxq+7FsQBfvtWgxnhQLNEUKGLTN0Ovp4yVWZKbYKxxYdfPJuDNX9Mi2NRgMhLC4kKTOm
	FiZOwC0tYOcYvnBZ9Ax0xgsl0XZ329+E4OrQiGnzobKHWeUXa/Yv5jWbqw/ddBz/ERAhxS6xjQn
	A9+4Gk9UjTpAPJRG+gmzzs8qeXKw2nkOG69K1A8kaOfrrZ5fgLDx3wEdNIc4oQBrS//SalA3yeC
	tZ1zTzVwraHI84=
X-Received: by 2002:a05:600c:5397:b0:488:b8bc:6a32 with SMTP id 5b1f17b1804b1-488d68a4765mr255155155e9.23.1776170686468;
        Tue, 14 Apr 2026 05:44:46 -0700 (PDT)
Received: from ?IPV6:2001:861:c12:13d0:5627:3bd0:f3ee:8a22? ([2001:861:c12:13d0:5627:3bd0:f3ee:8a22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede1e826sm101742405e9.6.2026.04.14.05.44.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 05:44:46 -0700 (PDT)
Message-ID: <ccb0324f-4297-46b3-b0c8-fad920a31b79@linaro.org>
Date: Tue, 14 Apr 2026 14:44:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
 <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
 <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
 <42977e71-f6ed-4ba5-9616-b1e2ebe2a1fa@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <42977e71-f6ed-4ba5-9616-b1e2ebe2a1fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/14/26 14:10, Konrad Dybcio wrote:
> On 4/12/26 2:44 AM, Dmitry Baryshkov wrote:
>> On Fri, Apr 10, 2026 at 10:22:04AM +0530, Jagadeesh Kona wrote:
>>>
>>>
>>> On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
>>>> On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
>>>>> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
>>>>
>>>> So.
>>>>
>>>> You can represent this in one of two ways.
>>>>
>>>> - By making the GDSC a depends of the sensor
>>>>     Obviously a PITA to keep doing.
>>>>
>>>> - By making the link from CAMCC to the GDSC
>>>>     The question is, is it valid for CAMCC or indeed
>>>>     any clock controller to be both a provider and
>>>>     a consumer of the same power-domain.
>>>>
>>>> The other question I have is; in this setup you have
>>>> does the GDSC you've made a link to switch on/off as
>>>> it should ? Have you checked ?
>>>>
>>>> I think you can make the argument both ways.
>>>>
>>>> - The sensor should consume the PD provided by the
>>>>     controller - like CAMSS and CCI does.
>>>>
>>>> or
>>>>
>>>> - Lets optimise the representation of the dependencies
>>>>     so that the consumers don't need to know about it.
>>>>
>>>> The self-referential nature of the change seems a bit odd to me but, at
>>>> the same time, I find the over-representation of power dependencies like
>>>> pointless spinning of wheels too...
>>>>
>>>> ---
>>>> bod
>>>>
>>>
>>> Since sensor driver is a consumer of camcc clocks, the associated power‑domain
>>> for those camcc clocks also must be voted from the sensor(consumer) side,
>>> rather than by marking camcc device as a consumer of its own GDSC. This also
>>> ensures all sensor dependencies are accurately captured in sensor DT node & voted
>>> from sensor driver.
>>>
>>> The approach in this series also doesn't work on chipsets where use_rpm is not
>>> set for camcc or for split camcc as mentioned in cover letter. So if sensor
>>> driver is common across the chipsets, it would still require to vote on titan
>>> top PD on chipsets where camcc is split or use_rpm is not set, so it is better
>>> to vote titan top PD from sensor driver only across all the chipsets.
>>
>> Well, the sensor is not consuming the Titan top PD. It is not wired to
>> the sensors in tha hardware. Instead, a proper fix would be to make all
>> camcc / mmss drivers inherently set use_rpm = true.
> 
> I think this is a hw design "problem".. the CAM_CC HPG talks about having to
> first enable power & PLLs, then the CPAS clocks, then the TITAN_TOP GDSC and
> only then the other clocks & cores should be turned on..
> 
> So essentially, some parts of CAM_CC should be ""inside"" the CAM_SS bus that
> was floated around, but at the same time, other parts of it are prerequisite
> for the operation of the subsystem, which makes it difficult to cleanly
> describe..

Indeed, ""CAMSS"" should share the clocks to the sensors instead

Neil

> 
> Konrad

