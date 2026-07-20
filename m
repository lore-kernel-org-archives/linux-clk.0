Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E682877DE
	for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 22:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784587169; cv=none; b=CaWJVZiZVBSzngRIskqOuxj+6PmUp4VQDsggorhMCwxLrC05xv0JWpsySgBjbAmroCVmgPtdp6IkM/LW85E2mXrVW5dvDj68qDSJMgBADjOWIYfxptVZnoePKN/2wIgsR85hDgdIUBFFn+l4wkOG9CQ8xoBezDQtr4emeGL6E/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784587169; c=relaxed/simple;
	bh=xfUE2DZgn0yvt/8dxChfStSQkvAhF7YKlC2IIEi58Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I66Xzrao/QCTY/q0HrpVzU3HHBmHLdT3wEPFWUEe9xnkPTRVdJFwpCt7QCJKWJe1ymBWCQHV1zqIaWPiEuREdVBk0f+c33sWNiW4cNyRX7AX2kBqCECohwkzT/yZr5xTD/kvc0RD6VpA0dD55DyDCK8R6W48N5thEyJltSYpzK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q5j7dMDy; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5j7dMDy"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39cc840005cso5905151fa.0
        for <linux-clk@vger.kernel.org>; Mon, 20 Jul 2026 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784587164; x=1785191964; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Zu0ELU6pmpUM1jgcMzfCc0cxC2PBXB9BxIZy3tNZzI=;
        b=q5j7dMDyRmYtKLvaV9M1Jq3qNsV1YG6Ss13QidFcgvZuzqJ1PqGPfATwaFjOaTYPRR
         RW4usBzhT4ue5+b8kbISIrDj+Tf1PGPXvb+9Yk4+DC/M5poswD28VtI5HVk/Sjq23Jqe
         E3eh7wViD/abOagvigf6kDiBsLVv2hBRkOTW2PgAOLPmDmo1CehQRZhjDB5FCtm19Nz7
         IKGxYo7yqppMqJXFskUgbzd0V4bcQr1J7gezfBJfKZAP8MaVBLq2t0dSeR/ed1M6BkKE
         OVFZjHuNBn7YlwHUWSfz5p8hv7W8Tebmrae5uPI9Cup3krWf9Myi3ZbfY49n+vtgEVQr
         iLZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784587164; x=1785191964;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Zu0ELU6pmpUM1jgcMzfCc0cxC2PBXB9BxIZy3tNZzI=;
        b=H3PC5UFL0GZM/S5acfQrqiAbK5nPWxNCaCyFP01Jzm4Lry9l41CdnxNDrgG2/E8KNP
         bhfLl/vmiZmfsDWnvhVqcbGvOUFlOjiZt+ST7mcLPhZ0+CPHJh9K6lQ3E8GWy1qutc8v
         kNiOxEOP/m9x0eUHTHYcRF8aFFEeMzy3LFhQSSPTdMTqLSVNbCLvGPJUDcXroVZXHr4x
         tIJBjE5dzMHQpD/XA4Z0E1OQU6ESZVd22UQWrNcDm+J5lkoKiiPssYKNxUa7NGRHep0D
         9foQuinw8drbK35eHjm2qeSYe/kcvjzkBb7vgMi1SIQOHUR9Dg+UgthDnOER5YGKjPC4
         KbSg==
X-Forwarded-Encrypted: i=1; AHgh+RrG69qIUmVw/RJ67CCHMVBRf8kRfdIP+KSQQU6UbwatW8YQlY5+EyBh+BW797JOvwPvDALLAC1rbAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeFzn4ryEOAcqFlA7vsQoo86nrs3nUACGJCU5NQfZbbF1AKchx
	FrgXClr5QQS7griGj9BtqJUwwRyqXx4NUr14KOv89eep8zwXO7NCQiPv5umoH+A6ftA=
X-Gm-Gg: AR+sD12c9VnP7ZVggkhtO4BU5j8WxWCuU1FS6i1HsfEWY3oxbNz3lWYyJY4Db3VRAcJ
	TgGVKCD1SwQcZk3bfc+2Pf/nH8jCYmiKmlsOK4X9AKfisA2H9kLyQq152hOF7dZCRx4+bXBLrW5
	7AtutSw0SFbVG9Sss5pqZJ1efI7NLVQi4gUDRLkO22OqUUt97WknJvAiuZMB0+2VgCGROqYg+QD
	sjxnIBkZPFJxZR8epwz6xTVUeC1IKO1Jui9g/9I9qMigNNoAN7+YitbfsV9ZXhQP/8MQ5cDfTXh
	XNVNCMp1sxi/c2Ctp33KZK0cXmsz/TxjvI1v3erKnxQMj0080yjLQV0k0jSRTIEBP4grJUKqmqG
	vzldtb5O4tVV/7Y166HiT88N65+7yW2Ur8Oqma9UT389FSTBwSpRTfvEMaMuz8KqbwuP8PiKnQ/
	ixlE8H/OzieBRVR6JDos8k+0tT1z0SkhT/OoUJ5qk9N4nfhZ+G+8+vecViV8GS+GH7q38=
X-Received: by 2002:a05:6512:2524:b0:5b0:1f1b:854 with SMTP id 2adb3069b0e04-5b28f88030cmr1824187e87.1.1784587164458;
        Mon, 20 Jul 2026 15:39:24 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291e187e5sm2548462e87.56.2026.07.20.15.39.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 15:39:23 -0700 (PDT)
Message-ID: <6875d673-4c33-40ed-bec2-d158651194f3@linaro.org>
Date: Tue, 21 Jul 2026 01:39:23 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks"
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Val Packett <val@packett.cool>, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20260701001147.416518-1-vladimir.zapolskiy@linaro.org>
 <bjgad2qs6pt2cn5pr353qaelxa3gtpaqfoxjnrwfhwbty4g75f@ngu4ddk5jeyf>
 <31d1ac01-ccd2-4abc-9828-be120f095de4@linaro.org>
 <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <wd5rytfnsj5vppnimpemocstsaaqhmt4xmie4qnppdh45vsnml@2xne3khyalnc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/20/26 23:54, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 09:21:03PM +0300, Vladimir Zapolskiy wrote:
>> On 7/20/26 18:00, Dmitry Baryshkov wrote:
>>> On Wed, Jul 01, 2026 at 03:11:47AM +0300, Vladimir Zapolskiy wrote:
>>>> This reverts commit acf7a91d0b0e9e3ef374944021de62062125b7e4.
>>>>
>>>> The commit causes quite severe problems in runtime due to the introduced
>>>> cyclic clock dependency:
>>>>
>>>> * dsi@ae9400 platform device and its probe depends on dispcc clocks,
>>>> * the reverted commit links dispcc clocks enablement to mdss_dsiX_phy clocks,
>>>> * at this stage DSI PHY PLL cannot be locked to complete driver initialization,
>>>>     the parent clocks for DISPCC provided mdss_pclkX clocks can not be enabled.
>>>>
>>>> On RB5 board with no connected display panel on boot I get this error report:
>>>>
>>>>     DSI PLL(0) lock failed, status=0x00000000
>>>>     PLL(0) lock failed
>>>
>>> Why can't it be locked at this stage? Is it underpowered? Or is the code
>>> trying to lock it on some random, unsupported value?
>>
>> Since there is no display panel attached, I believe DSI PLL clocks should
>> not be enabled at all, however the reverted commit requires it to happen.
> 
> If there is no display panel, you can keep DSI hosts and DSI PHYs
> disabled. If they are enabled, they can be configured to some
> intermediate values (even if for the sake of turning off the GDSC).
> 
>>
>> I don't have a panel for RB5 to test, if the PLL clocks can be locked or
>> not, when there is an attached panel.
>>
>> In general I believe the problem is plainly related to the established
>> cyclic dependency as it's stated above, and in any case the reverted
>> commit is a clear regression for RB5 board with no panel.
> 
> RB5 ships with the lt9611uxc bridge.
> 
> There is no cyclic dependency, AFAIR. It's DSI PHY PLL <- dispcc <- MDSS
> pclk clocks.

What does '<-' above mean?

 From sm8250.dtsi (using labels only):

* dispcc is supplied by mdss_dsi[01]_phy,
* mdss_dsi[01]_phy are supplied by dispcc,
* mdss_dsi[01]_phy are children of mdss,
* mdss is supplied by dispcc.

After the applied commit, which I advocate to revert for now, the ball
of clocks is no longer left untangled and linear.

If there is a clear regression caused by some commit, it would make
sense to revert it first, then reapply it after an alternative fix
is ready.

>>>>     dsi0_phy_pll_out_dsiclk already disabled
>>>>     WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0xa4/0xac, CPU#4: kworker/u32:1/61
>>>>     ...
>>>>     dsi0_phy_pll_out_dsiclk already unprepared
>>>>     WARNING: drivers/clk/clk.c:1047 at clk_core_unprepare+0xe4/0x104, CPU#4: kworker/u32:1/61
>>>>     ...
>>>>     Tainted: [W]=WARN
>>>>
>>>> The problem has been already reported and discussed before [1], the original
>>>> commit was done for "preventing potential stability issues" reason, and this
>>>> time fixing a potential issue introduced the actual one unfortunately.
>>>>
>>>> [1] https://lore.kernel.org/linux-arm-msm/2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com/
>>>>
>>>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>>>> ---
>>>>    drivers/clk/qcom/dispcc-sm8250.c | 4 ++--
>>>>    1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>

-- 
Best wishes,
Vladimir
