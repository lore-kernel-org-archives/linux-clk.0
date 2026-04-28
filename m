Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71C728469A
	for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 20:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777407992; cv=none; b=FyJ/AyGVEfVldXCCeY2uY4DPkyT/CbcjcPxGfjwMTNWGnDyDzThRudK1IBe14+81BedPhogTwMXYLapLe6iYh1ih/EK8HB387DcO6L6jzxSl1Ie+fXPZY5wHvGvQiQgM3J2B3ySgDkh7biJoltNVw9zM8U21bbCgvs7QOoVFi7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777407992; c=relaxed/simple;
	bh=bikCYCChr7YkCUSK+pLWX18yTfLp9aN20MtL2K2GstY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=XbbChX5yjBr90aPePqg0d+mV61t4qndEEfK1pNQaUR3iNAd561s9wZK99cJzEAzzaeelNOYI3+F0PwPVdHPZTRIBpvSQkQQ7I8kv0AvINh52DenoVLYptO4cvKRwzKppNgvBTh5dPpCrpjynkYkwpWKjYrn9fEX4i4xzdCRWW0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UZ7Uy8nI; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UZ7Uy8nI"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so106616895e9.1
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2026 13:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777407989; x=1778012789; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=UZ7Uy8nI2+NOm8dpnjNNSb11MMuUBVTWQorG96Z9b22UBZwbnwkPAlHmmG85il8AD9
         Sw/7FzGb5F4wzlj8+Y3OyDOM4ppwwpIirs7Kj3J+v8VNDqbrfgsGVQF1EvygTCYRou3L
         /Mk49+Yniu2XxoFd6+lkgHP2oXe0dukmmxcS6r03r6O20G0jXHVP0+omwb7zryAdhZej
         J1FNxtA4O8j7148p3VYhlRRKwwiJuk9NLnFv4JZ5f0nS9wYYNlDucsZZA4HmU9veB9Bq
         WmYG3AlKNL5FdweLUdqaLopCeDszF0c/l50xoXhP0Ci557j7xiRsUfwhi2wOcotYdI6y
         yCkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777407989; x=1778012789;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U2z5CJStQaZH5C1yDNgwonipIcrAGaww4SYiAIYI8F8=;
        b=eRkNOy4JKMQwOWKXcGbDzqVfvxjXYlz4Z0pexe6wYXWxldsOJdATeNxVje08Epgtmn
         gL5jy8qvMlchxFnpVaEj8eE6on2XiIr5BpNOUuSfolyLIwhKvbFE/wFlBquRNaXH0CCq
         jwsyZMJZH6nx1UxDoN8quKq5CyfBbOID+6lmIxebFspk86Jf5YvROUf49hpS+hNv02FZ
         y0Bs12XIFNZgOrc9Oi4hCwaH2I5RjUdFF/GyjNwX/SV92g4+em9LJCfki3VVCzB2oP8a
         p7Aid8WxmvhtFvC/miAHeAqog5Vk4bk+ujQWP6GYyZW9S0I/OefSsclD8bSQCt+F2cSv
         PLcA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZfU3x17QAC766STWwxemzpJJ7UepQGLkG2dJBMUOVapHqrUU9fiXGTRNeEi13BJRpEUy3x4ZHdzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQSLHo/l2g5JkQ/LsOk5nfCfQ9z+ghLAlKL/HXzrCd4/gWIBQT
	jPLfEQN6c10jGooZ42cYyfIALWuULuCGp4rODgpQfJDEjsb585Lpq7bwBj+R6Ogidpo=
X-Gm-Gg: AeBDiesL30bCT103hvg9M5zE+T1w094dgxniiJO7VvkXW8HE8bt7064E0WjMLGvdmUF
	gv6nig9NEFf7MNeTshvbMbePewsDD+LyW3k6TtaDYst+pZunqJdp20YeEVOgWwoC2GwCOLnmeoj
	gWhAVl1IijJGcg4lojjM8D+oH8kGbn7JI83xlG/5ikLjng6XD9arVbJyiLj6UO8wPucg+hDAnNh
	RBAeWE213oIBHD2JxQTzO4TNNSHyyTrjacb0/G9L/zOZ+Y7t+6htv3ukkkIkyfVtXOaHLyfmzkV
	L06QhkpziBZDLXqIrflurUb9VAEXPuI4XP71dLVEErez8NlbMPDmJC070ns+wR5LC+7WAsierat
	zVncBnER4PHghmxpzn+X35qa5vAdPL8q0y5UwcSghXzYWLDOKWT+YWMCdLX6+5TY0S9WmFbVY42
	ppTG8d/+GATl+9vZVdIwVdzgBBcdmwMinaW0THAuUAbxSJJxWwolG+59hRMorORN4icxzkx5WsR
	ZjzIU1UQZXcEQraOWybMANb
X-Received: by 2002:a05:600c:4f0c:b0:489:1c2d:211e with SMTP id 5b1f17b1804b1-48a77ae5386mr75966715e9.5.1777407989369;
        Tue, 28 Apr 2026 13:26:29 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc11fcbsm10511235e9.3.2026.04.28.13.26.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 13:26:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 21:26:27 +0100
Message-Id: <DI52JP9JH6AH.3I5OKWOZ56MIU@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] mailbox: exynos: Add support for Exynos850
 mailbox
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <20260402-exynos850-ap2apm-mailbox-v2-2-ca5ffdff99d4@linaro.org>
 <a02a693e-b06e-43bf-ac5f-8253f298c83d@linaro.org>
 <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>
In-Reply-To: <DHNSP3FVR4ZQ.1PIRHF0KJGKI5@linaro.org>

On Wed Apr 8, 2026 at 2:08 PM BST, Alexey Klimov wrote:

[...]

> On Thu Apr 2, 2026 at 9:42 AM BST, Tudor Ambarus wrote:
>>>  static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
>>> @@ -57,7 +104,8 @@ static int exynos_mbox_send_data(struct mbox_chan *c=
han, void *data)
>>>  		return -EINVAL;
>>>  	}
>>> =20
>>> -	writel(BIT(msg->chan_id), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);
>>> +	writel(BIT(msg->chan_id) << exynos_mbox->data->irq_doorbell_shift,
>>> +	       exynos_mbox->regs + exynos_mbox->data->irq_doorbell_offset);
>>
>> Use FIELD_PREP from <linux/bitfield.h> please. You will use a mask inste=
ad of
>> a shift.
>>
>> I would rename irq_doorbell_offset to intgr. It aligns with the register=
 name
>> from the datasheet. You won't need to prepend _offset to the name, we al=
ready
>> see it's an offset when doing the writel().
>
> Sure. Thanks. Let's use FIELD_PREP.

+       /* Ring the doorbell */
+       writel(BIT(msg->chan_id) << exynos_mbox->data->intgr_shift,
+              exynos_mbox->regs + exynos_mbox->data->intgr);

FIELD_PREP() wants a mask as a compile-time constant. Unless you want me to
add switch/case for different SoCs or I misunderstood something I don't see
how this is gonna fly.

Best regards,
Alexey

