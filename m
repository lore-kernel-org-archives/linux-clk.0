Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CA83A7853
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953886; cv=none; b=jS2c+cx/+dpJij/cpFnv7Cm9oXzov5rGGcSh68FEOHTotZEHdGQQ96Xwa5BfWD+kP6Hn/5uoSAsgsdcvhHZ/ge158iT8M9Qq4Fv9+9LdLSPf14drI3EIVgkoZF91M4RFs7xEhtI2Dl/ri/ebM6ZHVxRb3scb4Ml72kJrNIgdFP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953886; c=relaxed/simple;
	bh=Kx9R5TN1HIio6tDkgZf+A60NKDGQ+/JEVT66L35t3JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HQBg6UZ61IIo97v/ek893BvWHZ2evqgc2BnCRt4/qbb3XkqrCSjn30QH/afLh8vMc0XcQhJvOiKakUQMmI6U9H8zPxhVzcFGDuOGGmha61rQk+GRBaOVewFFl5gZUbgyVg4Ece/NEJMWExGtwfmSvYShyZ3P5WjjW7U8PYKa07w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrdgJe1+; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrdgJe1+"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a2bf521011so33255e87.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953883; x=1775558683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=RrdgJe1+dHqHGm+kPyHQYM6ELxtg5EoBxN9vkfVn1aLCEqDuR/77OVtJvKL1vYkjU2
         uf4Qgra9c3qAzAhVNVB9c9F/jM/kSkTDtJ3qKFZncOd/RYvq8Yee6/afWi+VnmwHr2ci
         ZBSa7HbqVL535Qs1m8t7ENlH9cymOhDDZnyTNIH/xpNssFxPmGYMMP9vIGzjbxuZeZGf
         qtlA1g0VvYKoJDL5czlI0Dj1aB+nFqI9iIzkJ3FR05afZpUj3jKQJr8053WKG5rhBb+X
         +ospjeiUMeOU+mE4oVSsvakA21qwFbehCzImIbpErT+LyX6aM3PTWVa2q/D6D31No2FA
         91QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953883; x=1775558683;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ltyTFwopAt48x4pgd03pJK6HEdSrWRvPeSYlpAsSeLU=;
        b=f+qYdW+7UG8aZG7szSs9+axjpXPRflS11VQwxnqRegU5zQICmfoaSowJVQVtddiPKz
         SEYDi3/rsgAUeDwJAMGPe/W47+XYNQ0+jI/uX3SqcwQnBTp7rsGP2aQ4L1lvd8VmcLlE
         FNoVKIvB4XE/bSdK31b/EG1Lf0/RaC9KW8dN8lhffWRGSizVH1zKACBL9PCUjtYElyXz
         zW31xYJO7pfGmuZHummkbjASyvRJgRnqEHTy/ygFMz3NI3REE3zErMpBQrMvw6bFnK6W
         lXztGr+N4Tk2dP8qGRWR2H7uLxfLCnX7E7Ldewf5V1p0wlfyLfWnl5h9vgroZeAUrwqp
         Y0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCUIGfvdsx/JKn+yFO4DY2OVz1gWx7a1NfEjKvFutbig8wv3mpWO2QxKO77lCv6AcHTqNve0wj3Fo/o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw995bAxQpO1itroHmWU+1IUmUbanfrHRAKESgq5rDYMT4DK6fv
	FmhRbm3h5l6lQT7m6ffaodRAN5A9GrCuqLan7ffYyZ7snOBcQIoESwW/8Sq6jd4UQeg=
X-Gm-Gg: ATEYQzwhYIcWivy6rbWXa0aJrPnlX4V/bvv5N4F2XzIRRYbc5D8WlmABHtlCahux13+
	4rasTYmIj2g6aqGbYl92S9nd/o4/dY/R9s/j+IXjGw99WmkBfCofg7/aIHwyRJ/2Cg7eUmXLCy7
	yutmlaGsfQDvouBS/ZMPRYFE1LTxXAAaaUvnf9W5TN0BW9XVXPlX/vOAq28+9dKkB4J2dYAnLmF
	3omNKENgNYjpYAIiDvt90uI9xd4c5RNFqu7GOB+HGUQZeN/cJvG1tiYh5bfg3QTVScgzei4daw3
	8A8yVVIkanbfbgs0BgAnjrzw0KI8CF4W0p8qVYwuQVh5BKUw3Ph/qYFvXdV3u3JKp/t0ITf81FR
	lydZsGtlqRL4bM8Pjg7VAOIBZ9e/OKjmztEt/aq5V0do9hyXGDbbuDW4rHu/anWbiZJPzrRulgw
	Hdzrl0/dUrbvoav6OwXN06WqTYSnmfFZyVYI0KpnXn2Np/loii3NAA7dQcfs++R67uvl0jwFD0G
	5kwJg==
X-Received: by 2002:a05:6512:3b89:b0:5a2:b53b:a457 with SMTP id 2adb3069b0e04-5a2b53ba55bmr1795381e87.3.1774953882760;
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b1403f69sm2330915e87.29.2026.03.31.03.44.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:44:42 -0700 (PDT)
Message-ID: <ebc7630e-c87f-4c17-a743-05e0639d5093@linaro.org>
Date: Tue, 31 Mar 2026 13:44:41 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: Constify list of critical CBCR registers
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-4-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static array 'xxx_critical_cbcrs' contains probe match-like data and
> is not modified: neither by the driver defining it nor by common.c code
> using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
