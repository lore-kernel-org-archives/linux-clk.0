Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901048;
	b=TK9/Hvn8yqnyL50PLuM8mQfSrNXlylQAxWM9/ywKaIOnCtxPLGvsfWwZ/HxPxUCIkV3F
	 hf09pvS9+u7O32urj7qhqm024YckpFa2Fv0uMVJTrqOap4TDXajOTa5R+MEABZgDEUNLA
	 BRrvbv1A6oRehgMlNEKqyddCXGbOBMwfL4oKgQcD3gtKDmZyqyeQUZ4gMcNrE9HKRRd0V
	 YibmQHISL2xV70W56BLJyVOUmxeBuVX4tPJBteXQ7hKVtTS9tVplIQHE1/3IeplNauYXq
	 dtGJavOK/5eHv0w9FlqH+cEDAoNtNvc7Yju2XuMCHg1FRVgWIxHRqtmvfb3HDBLhcJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
	b=ipMIzEvINSLu6nRI819S4srzL1xGsvy8ZNEpwmjTUJxFrduLWvj1mSojpl9hTLGy+MG8
	 wJVWxb5wO5nDMJVrTfkbnDydFPChV03ec9jLMfSflQuHADDK0jInG64DpOGaoLReO5A55
	 vM8vUjIjsEPNoYgI2cI295JaUX3dtw9G4klYONt07YagkojpoivE3KBt2SiYL80hd0gYu
	 CIYOnG3m02b7PGDebd6oHZa1mRWJgGIO+TF9/564Qyf+lXgVylXuY9LfZqS/4VlEV7DKT
	 paxQJDk7pN4h4HOtnZeTt4kRuBymauMm4bvHRxYwNfm3d2ZUZdJH4WQv+2uar+6sPuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E73606A331
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 17:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5E73606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=D1BjaDN3
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso23714415e9.1
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 09:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793901045; x=1794505845; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=D1BjaDN3giwMB0xnnxKh1bUEQGpUhdG0kZk1gL7UF+p8WHizQRl0jrvNOxqK5rC+mw
         lbOmz1xvnjGBmSjQ0L4URnpCpFMDBK6JArKhf9oe/V8DdOrZ7EsJWSxnJvz3CeDMAiGr
         1nHN8W2vedsKHq8hWMannwsk0SLpQsSzIZ9RCwe5wGsw3gUwygbw9odDIgzyrgnJyF+W
         rB07uyL5ihzRlcut+7HOIJoPIHu5+ajeuww7vD2yZA2wzinaO9bppiZhMkWs+8DmRyOW
         VmmPurtaeI1wwyJeEIH5caj/9g5UapocpihJlzlrNt+F2hIPwBpPi5RXCe9nDO4/DwGE
         EVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793901045; x=1794505845;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T10mg0NCtNOcMbzwRpRiIpkOxV69UeTO/LUX0z+nOPY=;
        b=EfI9h7QfqhmId90d5QCYKDlG65LZ05YecdV8OBiLdz3iJ/TgzVHgNemTeCa6+CjBk+
         dACsf8DnFparaWeVjpJLrXiaGjpOU8Ui6LfO68YYr/bK0FovQy5AnOMnkQFoRwueq7xu
         ILMtRgU0kmxVmfc3Rc6ORusWRs24iaB2iaNSv5yrP/s0XjCL+nKabAQAuUuBwrAgXrWL
         Z6pdGq4R2UmM/L/N4HgZqE0fLrMEZu/5aTfAqLfTOMzSRnA7A1L3Hg31+rffdClW03Ba
         VOxnBDAnbELsFJkhoGpU7hTC0j3N8sD0kiG75u1wF3w56R1UjJUPJyk6+VQ0OLYMqBm+
         JAKQ==
X-Forwarded-Encrypted: i=1; AKwUvByJIX5Yr8DdlIPCSlVnX+KlkzxLLncNTSmO1VY6JyomSvL8TpTOQj8fjvKZT1r0n7TPChWetufR7uM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rHVw7hEHrkUNeokvAn6Lwk2eCh7e2iDIntePIM2LfPp1zf27A
	eqI7Nr8FweJjIVfwgox/rG5n3j45wvLkTckqpqddLopw2mk7gPKUhF9cSwCY96t3H5Q=
X-Gm-Gg: AYBFou20OpU7exJYcdWY6W79H6N/SCXe8pFlWDTvfM/2tTlXTcHCqHrqNpM0tzZrgwA
	NuIuTjGhwv9In+eh9z7EetcbvDX4Kuhihm6wGjGKbG38pxE7dwGjX0rG7n4Z0NIZiX92Ub/DptU
	8GH3Ypr2AcYav6oAii9hF42HWECnRkvLLplHm4un2FSwUoQuc7W12cgGL4NXJReTEx81VkvRqT0
	9w1tpQR0h5xZ3wk9VV2LHYl1yZO4QYWnAlrOiH9AOAHkw5u6YM82IYAEv3ii+ThzlW/ieomj4YA
	ElEnOoiUZZAaEiRGIJAf1JBVEr/RVS9NXJGk+G7dgKHimHzpdxFV34nJGOsUCwCAmSin5P1eah/
	EqQyEh8kCAznJ3qHoYa1cD8qoifx8Be7ABfgxHLFYgSJgL6W3UHgkbtkV2pCJsgXSjpGb4FVQVo
	F5eQqypjiGpo+JdHBSfEXR0g5y3t4cZyJrwcXa38i4L29ocdDkegRMecpPvYL7evEjZjG0hv5Eq
	r9TQwnL0QezWJRWhUYAFZXG9Wja6K7h0MV22KyUPEdYmY+0lN6LUUi7i+OA/H2YlSAhRRf8khXt
	lC5Hs754u4Xk5F2J1dbE+QNaNrr3jL7TtUOHM7kF0gb7/yRn
X-Received: by 2002:a05:600c:6095:b0:4a3:7344:13b5 with SMTP id 5b1f17b1804b1-4ac182dcb98mr390804805e9.16.1793901045109;
        Thu, 05 Nov 2026 09:50:45 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4527fed5bsm200497845e9.3.2026.11.05.09.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:50:44 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RFC RFT v2 0/3] clk: meson: Refactor PLL pre-divider as
 a divider clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
Date: Thu, 05 Nov 2026 18:50:40 +0100
Message-Id: <179390104084.2573818.1569105668888286892.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RepJ4XPfeKmVot5v9YpoyqtS578offaAhAsWd1iXvqU=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlvDn5uK2lTkH16raHEndtv5saPH5IMuqqOZpy7sclwE
 0/l/tmlHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjI37mMDJtFdLed2ra09Lmo
 zrWDh2rO+B1+Oq+XJTNH61xGbjJDpBTD/3TGS63HFoWsmzpr67XN+jMYOd2f1k7Z+adJdorCzW3
 tiewA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> This series refactors the Meson PLL framework to remove the dedicated
> PLL pre-divider (N) parameter from the PLL implementation and model it
> as a separate divider clock.
> 
> Currently, the Meson PLL framework models the PLL pre-divider using a
> dedicated n field in struct meson_clk_pll_data. This makes the
> pre-divider part of the PLL-specific implementation, although the
> Common Clock Framework already provides a generic divider clock.
> 
> The pre-divider is not intended to be dynamically adjusted. Each PLL
> has a fixed N value as part of its configuration. Most PLLs use N = 1,
> while a few special cases use N = 3 to satisfy their PLL input frequency
> constraints. Modeling the pre-divider as a separate divider clock
> removes PLL-specific handling and simplifies the PLL framework.

s/framework/driver

-- 
Jerome

