Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16A9386C0C
	for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773653319; cv=none; b=kLa3A5Fcb8FI180qPRDHx4xzUCSZgC6KzjzZ8EYfUFuGoQ2gfbHB/URKNcBkqdNicmVOpHMD8dQpeTD0N+rRuMAGQGGq/vEnAQwfCELFxyGD5Tht1sXb/a0xt/JkhJUsTzqX9Wc2b0wp/A6tEZNu9YXenXBYPKboTWXmIMhYCZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773653319; c=relaxed/simple;
	bh=9c+Cpxp1ZGW3zXQamjYhD0iRzxH3nZLhn74BuWgaiP0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWKQgUA8U0BiTVzlkOqVQWfioA7SzSfRs1wI0TlhZeJlYWFBFSp2pyFN5WSTrNOtCFH5Jn27JM0H7Hmy7c7+GD+ij9ljxN3CR3ER1nVmXEAGeQWtA0QE4iAdLATKHtOiDwYtAk7QLIm4vF+P0gcn3F3el7ViO23cVUzMy+oMx54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OoJFiU2y; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OoJFiU2y"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a3c2261ffso2409581fa.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Mar 2026 02:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773653316; x=1774258116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=OoJFiU2ysS8xfggD0fZWt27gi04RkJ65YpHk68DkMbrZaoY/Qe4d0sYSjP1MhnuhDq
         ZMUs/kE+WHqd6M2JJ60C/zsLWKM8Kq7Fu+WIDYUCLZe4wBeptbu5+QqC5TIWUCmRyyqb
         ZUw8CCgqvsCv+NMeR2jC+o2TTkE4m1e68b0tDeDSFotv46XgJvYW1QMKjCjgt+IdA6IY
         zjeEtoO/bqdL+t2CIFlO8WadyBAW5p6UjE1VgMtyz42nzI3eVo5+IU7jXXXgC2neEaKY
         7BzufaZ1Nxuc8gJ2NpwtpsDB0KlmqOWuutKvXMH7kAsr5iSGrW/Eonl/p5DNDtQwytnR
         05Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773653316; x=1774258116;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q75aoBy7Ji4mItPLv1quA/8WA+tC3Zlx81nywgbhn7w=;
        b=Fmd4/rI06rbKtfXuw6Gk/Ip3KDJ8LcvoyDnZBvfIEVPnxJXW7CGPB74I3jPlsC/4h6
         tk6BAgeNmWeKSvx+bKkQt/vWPkhGyQ/YxSyy+Li5eRBe4FM8xM0ERmgAT8RK87e7lO/H
         kEFASHOXTeywNELqMy0l/qh6CRwolVq/1Xd5G8B8PdJnXpxJp9g1RLvOzQ8XEIarAKJ1
         5UKGjzasbOJlXdeBSN1hLHw3Em/PDJn+hZeSX8ZDT/bupkXAQhWxyL/xnXSQfHfPneZV
         6GIOWoCl/4l2D2QXLMOpPh4uwrvIiNuB7RJraxHPoY82UCEF71tRk67pVoAFGGAee2iy
         JK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfGfK5OsXQWLSHQ5zWGwAFyCzNrE9x98gcwV59CPCSTJLHRgbFCUCey4BL3tlqCvxBkg5NcQXOczw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRqmAYX+/y+D9Fj2W1g94yalpMd6Wmyffn3uxObDcM+AoumeMU
	TOjuntHCl64uMwaRrA8sQ1zwQAgEZgRsO49z4nVtYjEKU7kIYD11/iXOC3E2a+kvJb4=
X-Gm-Gg: ATEYQzxwQEzjoAGi/WbYSDoKD4QmfJDIhMYoBeqgTf5WQw4Oq5bDZMSbdZGfgMS6SFT
	wWeSdNr6vYfRf9ceqeiVyxyf1EXfX+Uo9ITwZfOD0VbP0d70LadRgkqB1R381oATalfm6Q+YcWn
	Pe4E1NWPVmpB7Fcfc6vsWUQTqgbGP/lanp1njGKpXt9C/H8lAahdA8ykXGbtfZ2H0fQIyfgRnDt
	kWa9snS+PqtRwVCq/YZb+vthS+Gnr1eGTJwaq7Rekv1AUtxjBMk4oGN8Cta1GRlPmTuWTBvmN7C
	wqRLfaY8EmWcmeFxGYU9O7jLOjUZ08R7HLLke8nON64Q0eElwDDNIV6NBH9fNEXSCN5ehUoFErL
	QSoVYwhC6t7CsfrHYSRewGzkZ9bY4yql5tcn2uGsVH4VbPadHcsubZRrPFK8tw8BnRkQ9CHTCLK
	Mwde5Ysbkux2MVWUH3ML1lJBdU7v2edv6Llk0A1WFqAGSXeu75uYsh0hCR8S+Bm4a5ruYoTcHCW
	uwwmA==
X-Received: by 2002:a05:651c:211a:b0:384:9158:6bcd with SMTP id 38308e7fff4ca-38a896a443dmr21270251fa.2.1773653316000;
        Mon, 16 Mar 2026 02:28:36 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm31237711fa.9.2026.03.16.02.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:28:35 -0700 (PDT)
Message-ID: <30f3ec22-c86d-4f05-b519-641fc2632c50@linaro.org>
Date: Mon, 16 Mar 2026 11:28:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 simple-mfd compatible
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-0-fdfe984fe941@linaro.org>
 <20260316-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v10-1-fdfe984fe941@linaro.org>
 <cca53190-ec16-40ee-ab4d-7bfbc1f082e8@linaro.org>
 <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <bmcxyn5bv24cmxvuyhjbbsjb2bfhq55nmoccfqxvgiwx3g44nb@xq5fsyfqdma6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/16/26 04:39, Dmitry Baryshkov wrote:
> On Mon, Mar 16, 2026 at 04:12:35AM +0200, Vladimir Zapolskiy wrote:
>> On 3/16/26 03:02, Bryan O'Donoghue wrote:
>>> Add "simple-mfd" as a second compatible string to allow child nodes
>>> within the CAMSS block to probe as individual platform devices.
>>
>> Why are there any child nodes representing platform devices?
>>
>> There is no necessity of it, please use a layout similar to CAMSS CCI
>> modelling.
>>
> 
> I'd say it differently. I think, putting CCI device outside of the CAMSS
> node is a mistake. In the hardware all those devices are a part of the
> separate block, they share the same NoC fabric, etc.
> 

A simple-mfd model could be considered and pretty often it's usage makes
great sense, but likely it's not the case here, when phys are childen of
a factual CSI decoder. So far an umbrella/container device has not been
considered to the best of my knowledge.

OTOH I see no issue in placing phandles to the same exploited resources
under multiple device tree nodes, the ultimate goal is to provide a proper
hardware description.

>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>    Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 8 ++++++--
>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>

-- 
Best wishes,
Vladimir
