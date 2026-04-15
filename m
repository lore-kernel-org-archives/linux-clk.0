Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11ADA33F8B7;
	Wed, 15 Apr 2026 12:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776257891; cv=none; b=TYHi+70/rP5CiL0zTPTErOk7qRKApOYuA/Fcq7+gMX96Iwavmiyvt2/ggOSWvDeaGwqhzlrDCzzjiVwMJPZQr1PQw976mzkFp6skUzPjtBcAp6xJQm2fWfqz+Hq+ZqnYnVc9Ipm1auJARNL3FJ6AlWpKquEqAG+ZEe+Z/5/7IXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776257891; c=relaxed/simple;
	bh=r14QBh9Iuj4Kh39NLSY61SiRgxPRKjKK6mGI5O1EFFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XGcjEIw8071hx9XtWmkk3MHSZECPk5V9pLmP3Wb2IUQuUfozY5FX5BUsRWWT3hji9tmg6DTbpLa8bwSMdgU0xMtHGuE0Rw0d7Bw7QwnOYzsCO51gpRY66O4zsi/2t3iukGHxuZrCsDp05JcHQIA3Eu0DYg4enxoG41BfW7F0VF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XatoVGpm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XatoVGpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF82C19424;
	Wed, 15 Apr 2026 12:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776257890;
	bh=r14QBh9Iuj4Kh39NLSY61SiRgxPRKjKK6mGI5O1EFFU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XatoVGpmHPvvXXMoesamkliG8v2W9BF0yXn9BsbBHsMZ5asUu53+5IKimW+I33BYl
	 IH7jp6ck3VyuChCnOvx+1rgoyKu7wcC0E08lccPyXe/cHC2Ct+GxfnSH6+YUZsBglg
	 2U1MDIJYE05WY8R0FW4w4RApEqj5+VTPuyNwnPfgTGkq+fdDiyApuhWJBeDzu0PY6t
	 TaFhaUgE+7B+d/NG35FfzXehmJEnHlQSRV+JwsmAw/M2QZz4M2LzElunM13ZAEC89L
	 KPEc3fQMY8lr1E6IiPyu7Q5kN+2RTUsFNR7NV+7wg67vECmkuSdMRUgTCNfH4O2+Bl
	 6Eo779567KFeA==
Message-ID: <56a723b3-82fa-49c2-ba4b-433b7de98451@kernel.org>
Date: Wed, 15 Apr 2026 14:58:06 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/13] clk: amlogic: Add basic clock driver
To: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20260209-a9_clock_driver-v1-0-a9198dc03d2a@amlogic.com>
 <20260209-a9_clock_driver-v1-4-a9198dc03d2a@amlogic.com>
 <89cc0724-32a8-4da5-8070-c128cafcfc82@kernel.org>
 <76ef272c-e09a-400e-b381-82d7f29760ca@amlogic.com>
 <b97c2e64-8a43-498b-a447-6a5b67c525e5@kernel.org>
 <366ea762-b228-4d6e-872d-2a7f9dc8b1d9@amlogic.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <366ea762-b228-4d6e-872d-2a7f9dc8b1d9@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/04/2026 13:40, Chuan Liu wrote:
> Hi Krzysztof,
> 
> 
> On 4/9/2026 2:12 PM, Krzysztof Kozlowski wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 08/04/2026 16:32, Chuan Liu wrote:
>>> Hi Krzysztof (& ALL),
>>> Thanks for review.
>>>
>>> On 2/9/2026 9:17 PM, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On 09/02/2026 06:48, Chuan Liu via B4 Relay wrote:
>>>>> From: Chuan Liu <chuan.liu@amlogic.com>
>>>>>
>>>>> Implement core clock driver for Amlogic SoC platforms, supporting
>>>>
>>>> So how did all existing Amlogic SoC platforms work so far without basic
>>>> clock driver? Really, how?
>>>>
>>>> You are suppose to grow existing code, not add your completely new
>>>> "basic" driver just because you have it that way in downstream.
>>>>
>>>
>>> Firstly, apologies for the delayed response. I had intended to
>>> consolidate the V1 review feedback and come back with a clearer plan for
>>> V2 changes. In the meantime, Martin has provided many detailed and
>>> valuable suggestions - much appreciated.
>>>
>>> The original goal of optimizing the HW based on A9 and introducing a new
>>> clock driver is to reduce unnecessary complexity in the driver. On A9,
>>
>> Nah, you just don't care about upstream and it is easier for you to
>> duplicate new code.
> 
> Regarding the "duplicate new code": the ops implemented in clk-basic.c 
> are indeed based on the CCF components (clk-mux, clk-divider, clk-gate), 
> with the following enhancements:
>    - Register access via regmap (meson clock driver looks like this)
>    - Additional debug nodes to support Amlogic clock automated test 
> tools (in conjunction with clk-measure to verify hardware functionality 
> of each clock)
>    - Clock context save/restore support for STD/STR


Add all of these to existing drivers and stop pushing your downstream
approach. You received feedback already more than once from more than
one person. No means no. You are waiting one week with a reply and then
again pushing against feedback with ridiculous arguments of "objective
design" or "optimizing".

That pushing after receiving clear "no" means you value downstream or
vendor or corporate rules more than what community wants and that's
short way to get permanently PLONK-ed on all your submissions.

NAK

Best regards,
Krzysztof
