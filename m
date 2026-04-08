Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E803D171B
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775657129; cv=none; b=fy5lxe921CS7YZYNCbyzYIpOm97KEfpkTZ8+JzzH0jfvg91OC084KJG4nvN58jdE/8w9QcAW9hGHEqPeVDUMdSYdpBP6GwratcmyN5zLu7VkZfGU9xRXUy7t9el6nFNpX4iPK9+305/lbWxLrxgu5sfoG8ZGBRlaUFio1OvRIYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775657129; c=relaxed/simple;
	bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=jqVRGk40r0jOtv4cjOviRQzIsh0EAyXi1xgD72HHEJ9hHe+ixMD13Z/yJPTlwXWAXOzuY7zki34Nlr/7pGYZLDKJJE/uDy2NWnBQp71Hf9iCDqNRPP9qMabi/3w4JVeKtQLUDb3BilBXEOS7PvhTcgUZ9CmI431MmMC+iDOIE9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fFywtgs2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fFywtgs2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b0046078so34683875e9.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 07:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775657126; x=1776261926; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=fFywtgs28FzjFE+RY0Q7SkaL7CnP6buZjte7Vw4lYPQg3lJRuTr7vV9SGlkU+PW66w
         d68PY5ynKBkRA+7Usm7OHFvkkKXQVfUJvFwiGCQDWA4RUTIcNKg47AjWuV/CyWECxlO3
         BinEnXUqo0b4yT+b5Oyu0ARnZ7uCiZnbP7r9YLTkJMy4kZcfjM3cVq+IIGYGOxFaOKGv
         71DQzVXP9SwI3zGu7mD2TZKoyxV8+aen81uDzVX3CTcPO+AxfY+NMdcyMGEBDCBdoo+b
         BVkOoFhYepTTgok/g7tAQiNvbMHj77ImLsjhPIX1MYnKgRcF7pLkCxgcqCcS0f7l6hKh
         oVyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775657126; x=1776261926;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q/HxfJDEIZsacxEvj6AcEnUXO0EJ6z7DmUUMEIj9M7s=;
        b=OEEAHrDAol+OO12cSz4Pu3q5fjjy8FobhErYQaVykF30g5VJ0ubKoGZCCFDkkKZHso
         W9UbmDcz0FYSnb2KLTGUuHn9Ygw9Wv9KGW9qn84MLo/NILgYego5jRGYM/JoNtWnuYGa
         trFLvDmjBSxNnLhMCy6KZ9LpMIeBO9lmcnVMIgdyaXSCQtdjiakeqpNuf+UObsLjSyDT
         3BYPbwK5FPlAzrWo/SLSREzKkLtHqFGbjKuEQtXZlGHeAYXZxe+e7DRfNWoNxCFQ181f
         ZFKkwaiI5ongXdlauY/nn+5DtCkWrnRncD7E1zeNPsqRsCa0B2CayYEhLrjRxu/3K59R
         uEDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLZ+WtJ5nmm29753qtRWZVCdSRFrqcoKXbGv1HoykTyEnMtsf1k5IrFSp02waWQeGZF5z57J6W3Vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmdkGv6N5vaarU9KY1Oeibf5wy4X1wHv3jUghLRrKf1XQBjChr
	FPXaG6X03+hrUTYx26se+FI8x/6JgPbBpN0SKY5oz8BvHLanBs7TrjW00D6+CUh4qCc=
X-Gm-Gg: AeBDievRzlXOIyWbsm8svexpJDh8zFhmNV9KNiABmqqDBWoTBZoaDyIDfItrxkRzMzq
	PuVTDoRYMwKlZighwk0Low8l1L6Df39i2HVmsGcaGZo7Q9AKljTzGvPzDyKOisgdhLhphs7AChl
	rxYJ0a6YmJazMFk0IcVQy9yLAEjyVGezjZap2aO6CTzdiztTWaKjCjYkXRCk0g5z4TipmGtYLYT
	VMEiVBTQ0WyKV1TmBkAAXmeanDl/XRI6fJKJa0W6I2AJsBXX3qeHYb/gwP2yhhLo9oqdaQ4YivX
	FoUjB+cJ0jAv2SL9MUW7ae+lF1iUu1A9BjUPx6t3RDgNHs/lsmhAovI8zCkpyqjNZ2gRCizyJQj
	xJX9mBvGmvNe72A4DVflySdGVLCOxDX3dUXciaR/ljQQAjzhzQY/2W5mR/OWEc9d58PDnvqqjA5
	rSxCJiODmpJ9ZWNpay70c/ZCTdZZ4HRLuxwoJz3TR7aLMNGNsZhKfGBGCtEsL8TLqSIc0HjTFvU
	UqlaYowOYaRMuBuDQ==
X-Received: by 2002:a05:600c:638e:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-488997b23c6mr299995865e9.24.1775657126171;
        Wed, 08 Apr 2026 07:05:26 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:9775:58c0:569c:bd74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm61358898f8f.6.2026.04.08.07.05.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 07:05:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Apr 2026 15:05:24 +0100
Message-Id: <DHNTX1T5S2UO.28SO88SS2HDOZ@linaro.org>
Cc: "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] Exynos850 APM-to-AP mailbox support
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>, "Sylwester Nawrocki" <s.nawrocki@samsung.com>, "Chanwoo
 Choi" <cw00.choi@samsung.com>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Sam Protsenko" <semen.protsenko@linaro.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Jassi Brar"
 <jassisinghbrar@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260402-exynos850-ap2apm-mailbox-v2-0-ca5ffdff99d4@linaro.org>
 <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>
In-Reply-To: <d9c714fa-988c-4b0d-b756-c6e7a40da587@linaro.org>

On Thu Apr 2, 2026 at 9:45 AM BST, Tudor Ambarus wrote:
> Hi!
>
> On 4/2/26 5:20 AM, Alexey Klimov wrote:
>> This patch series introduces support for the APM-to-AP mailbox on the
>
> If AP initiates the communication and APM responds, shouldn't this be cal=
led
> AP-to-APM mailbox?

Yes, there is some inconsistency in the naming, in the downstream too.
If this has to be aligned with datasheet like in the comments to another
patch in this series, then name should be APM-to-AP or APM2AP for that
matter.

But let's keep it logical. I will rename it to ap2apm and will re-check.

Thanks,
Alexey


