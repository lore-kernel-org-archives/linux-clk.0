Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43960421F01
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 11:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068548; cv=none; b=stlLHF6r7wODpEY2RsYX3TyZiilvvXgBdgdWAAsnuWL6Ehd0nZ1AClMRXU9lEyMQoi4cEuRxlepP92VWn/9nE1CJQqFlM7TwpWsVT7xELmGrj7iazZMrPhDztg9tJOLVJCbVePaHlc2WUXeaCWcLTsnd15eGgYn+GSp1a5oLwDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068548; c=relaxed/simple;
	bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J/GurlWvW5IX0SlxdKszGsiBatAyuLD1mDL9z0ww6Z84Y+N5V5MvN/4zdKhn27beISkEvcYChFWTXux7aFCFq5DkBGyx/p2STZG9NCqT73c/d/wcdrVgk4FI+vVupE2p/ygp8vD5oFR2QbUJBm2OtgM0PPxM1sUAj/Ojt6+oK0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPszSXkZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPszSXkZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48909558b3aso69592555e9.0
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 04:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778068546; x=1778673346; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=PPszSXkZdHjtJzs5MjldOEAoC4JUfD38aaWzAyeJfgphJuos45Iqg4EN/pqYjtVqUD
         oI1ofk5IVEvTqETtL0HJdpD+9tSiK+uJ4H94UGgNta74tebyQ4pYNW9b9a5dlJd3WL/0
         0NHslSg0MSQ9EweYBd+kwNtAeIKQ5ZdvxMuE2/I5EZw2sSEBFV6PSvNoPbdpDri3E1Lr
         4HznolFdwh0UcIvaPARDWlM2/mC7lZ5cK6vlR6zIJK+oMPEOKGQpe5T5zuq8Xf1RLS7n
         3WCMaqrga2vkMos7Y8EQwSFoElxnoDOZ3R8QMP6X1qilw6RGJ2zHPK1izLTajWNvz5ym
         y8pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068546; x=1778673346;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15pEe5GNPxLteORBQfGrvAQ4jQMZUEhpWDnsiYVvo5o=;
        b=KujbbaIWLrrBZQxZRZ8M32OfGZwMjZKTSpUpCxh5gUrVIPBLepZ5ek7OGFNVNN353v
         xwB9zvJpWJYZzRCtBMUl7wbfG+g1HI1kquoWVOC1qedBHNwdqX3UEE0a3nhpIzGFJkPb
         4CfzinRVH97ifA+J+GHCk9L9jeHfgnU6O79dOkyx4O/uUxYxFvDgxvKs3mPj9UCLZ3D8
         +xHzZovosYvPUV4MbYw/+5WGaDgxqojPFoWUs75T7A9puMiFv1Q7p6ymquz2ROsSclYh
         YJ2xceG0qAinCVGG5SE26+osnWgREWLtqiSpCvGUEXfzV55JFKOoNWIlnJijrpgBMVX4
         Xu5Q==
X-Gm-Message-State: AOJu0YyZiqCKIIMHZXijAJU6xtj9hQnoIe4RKmfVAIbl6QPiefa7Rdyp
	cLgqzrxsflZfwBmNQblgjJkkbAq0H/2Oc43B/A9XRngl1isBmL1Dka3S8F3JWTJeDok=
X-Gm-Gg: AeBDievB7uzh/lPIjJeya09LmpajTdLsPVxnlz/yJlat6L+zXqe0fXO71r681WNmE2C
	7VCmgHcEAEMTHLcj9MSS0oSMWdWGrSwxDRUy7dcdr+FjZBny5nNFR6Krvg5m6z0qJfwyj05JacF
	7LvnKqsLfflIMvOq6HD9RTG6DdN3NDmyX01n7SOPqjP0BgPlq3rdRLcR09AVMgoDbt5WJh0NEoB
	EUnRlRdj064+sGAb151pftXsGfYUcQfLD6q/WYdo/YUYWq1XF3BggxsF45xaiVj4H2R1SifL+lr
	L+a+fSYG7PuMU0q9wK0/ksLSiJz7i2bQo3JznhI4kyoS4LYjJEDDOKWHCtaB45gjFEhU832r4uY
	A+sB1AQ5Setl32hetDIODImAbsk1LSh2pWLr4rCFGwA4ZUC26eF2ryyUcKpYbLyQzopdOkIZvZ4
	IqG57tyKymTtJtS9t/BRfYS2d5No/3eJJ9NyDrBRDaN4Y=
X-Received: by 2002:a05:600c:8b65:b0:48a:53ea:140b with SMTP id 5b1f17b1804b1-48e51f4e5fdmr60307745e9.28.1778068545639;
        Wed, 06 May 2026 04:55:45 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e538d2878sm69999385e9.15.2026.05.06.04.55.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 04:55:45 -0700 (PDT)
Message-ID: <f094b0e2-3c45-42fe-9228-3a3eb2b90185@linaro.org>
Date: Wed, 6 May 2026 14:55:42 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/15] clk: samsung: acpm: use
 clk_determine_rate_noop()
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org, Juan Yescas <jyescas@google.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20260505-clk-determine-rate-noop-v3-0-f3f829fbacdf@redhat.com>
 <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260505-clk-determine-rate-noop-v3-10-f3f829fbacdf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Acked-by: Tudor Ambarus <tudor.ambarus@linaro.org>
