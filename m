Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01631F1524
	for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741821936; cv=none; b=Dws93nkiS5Iza3ObtZWIOx3pqCpaK26qkD0r9pQA2mmQ+ijjV0OP7UwuveD+pFVDOLbBJC/yOkO7264bdaan3sqxNBTqeTxxx5PkIIVNXXGG5KpMh9QMkuqgzqfVUXsPZNxVMVS69y6wacNiMy6vVi+m81+GEQbqwel72m0FE30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741821936; c=relaxed/simple;
	bh=KNOXCxB49IWpZXkEuShUxxFDdmvuAFP6JtXUlRzTWE8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJBf/JS2tVYKBjUUc6DGk4HJHw90cs99jX/BVC3KJuZIhu0hXeH4VmjQjz5Qc3WEWqKM4/tGoMZjAp07VWYPBAF/etHpdvfHeqSb6+ATsW3ZrDAl8namciXv7XIhn3lcxi4wHBtoRFG6p1eaxSc0jXKTYzn+nLp1bCTKBAXnHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=POsKFPb3; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="POsKFPb3"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e60cfef9cfso462435a12.2
        for <linux-clk@vger.kernel.org>; Wed, 12 Mar 2025 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741821933; x=1742426733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cbP3u4ukcH6UtAZm28jTjg95b8wU0mnB31L/HtHfr/Q=;
        b=POsKFPb3cgKruwzgXihPs4RTCjHoXI8CqbOhsYbLezi7cB0EY3kF126c2kp7FW0Glm
         TQvUHOGxFY8P6mhcJnv4vNI9+svwl8VBoyQWuxNlHuPduNPN4BgwZXbzoj3Fzs2jDr90
         iMrpEfZ8DheLnb2mHVEhU2HDrDBYCsOMMtlO5d0PPYNG9KxFkRtDoS2MItq0D6ChDg3z
         1pFVywx21U0JImeOrn7mHdTMFs7R3mt7EqyFjqLPQeKQga81Cgpc8+qSA7ON1yldeZrc
         NgV4cDxJoU7mqbgRTEVJX3lLFJVn092ITMY4xbEUin+oA83PR+pZUNElMYsX7MwfNnto
         3O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741821933; x=1742426733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cbP3u4ukcH6UtAZm28jTjg95b8wU0mnB31L/HtHfr/Q=;
        b=oCyyk9jmHCYnI14G5mVppOHOJUj9cHMEjFP8eoAalwpAGhjBxlU3a8QB0U44jtCgXD
         y6ur68sTOJkQmbmrObfM+k31krhM7EOJPR34A+zXI1NsK1stA8w6e7Oc3aHd/QnrBc+g
         5O+vDqkgSk2PhI6Pd79lV2CmxVHUXl/6pBU04vV/bgDuwHXvb/2pU5S9h0lAEcwptDM5
         pLtG2EgXiyl8sE0xAyHWgn1nAKCTr8Nff8KdQF3LBUKtfiklZACZJG7tGgj1jukf+kHr
         fjKDyFHMY2c/UP1DGmK1lL/KpZf6QjiTtAPA74q+9pw2FvebUBqRYZqu5gVSwhUZbF5r
         POsA==
X-Forwarded-Encrypted: i=1; AJvYcCUSyae3g/KWGekv/ur1UxwI441Ja5328nbuEZqiY0Q6RU5JqO1YrEYWfxmsvXVBMEKwfhADN40VQ0A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyraH0hoBauerNKjn+ycSm9kivH7ZPBR7EeFVHGZWHJ8M5IroHF
	DKOyFZ4uQ2lHAUKBxFwniu7QBUk2urU4PDF5Va/DbTfw81ttEOL8B+3MD5oRUqU=
X-Gm-Gg: ASbGnctNXy9OrlUrioYfaM5SIx9Y4rgJgrrEoqRCuIwrT+e+m9CQfDslT2NpqX/m6Hd
	bRiWbKneEuoyf5baY5tLDkEsl0JPVbGGazzsZ/5vSbLi83eKfMx+EXqEiCiJLPNsa3xy6/TxheI
	QNrBW6U0Fyt+M2ZNhbXdh8f9rH2v29xQQ0W3hBwKyf4wooqs3gbWsme1d9opmNv/L4T0hSNRQmM
	rDTN0OCwNL+J6+DzqHKYgxMsFwTpOUajvDdoi6EZf5k05uHP7/2hMnNZKsursI1MQobbTXrNWBA
	JGY3b7uVxbyo3g+Gs1POCiRuIaZhnJcwBsnqVMg7j6ErgUkiIwZc8Bgedjll6tP+Msxs88FmXXP
	5qVBzpLKkvHDo+dJ/rEyEOQQTCTIYFo8rNqGvl+CBL1BnClJU1c661StcjlfmGG2CXPfKdy8M7b
	QZNB1nN4ctYTk849qglZwKJtpz4NY95Sc=
X-Google-Smtp-Source: AGHT+IEQ9vjHKRKBUp2ycACrS8aKwBtnDiyRwBCDM+O3Ys0xwiBai+d7QgwA4ZAZ03T6YvvBIIvtoQ==
X-Received: by 2002:a05:6402:4489:b0:5e7:8848:f567 with SMTP id 4fb4d7f45d1cf-5e78848f991mr10629817a12.20.1741821932981;
        Wed, 12 Mar 2025 16:25:32 -0700 (PDT)
Received: from ?IPV6:2001:1c06:2302:5600:7555:cca3:bbc4:648b? (2001-1c06-2302-5600-7555-cca3-bbc4-648b.cable.dynamic.v6.ziggo.nl. [2001:1c06:2302:5600:7555:cca3:bbc4:648b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816afe1f6sm27754a12.77.2025.03.12.16.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 16:25:32 -0700 (PDT)
Message-ID: <4a5ace5c-728e-4ae6-90d0-94270c83db3a@linaro.org>
Date: Wed, 12 Mar 2025 23:25:30 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: qcom,x1e80100-camcc: Fix the list of
 required-opps
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250304143152.1799966-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2025 14:31, Vladimir Zapolskiy wrote:
> The switch to multiple power domains implies that the required-opps
> property shall be updated accordingly, a record in one property
> corresponds to a record in another one.
> 
> Fixes: 7ec95ff9abf4 ("dt-bindings: clock: move qcom,x1e80100-camcc to its own file")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   .../devicetree/bindings/clock/qcom,x1e80100-camcc.yaml   | 9 +++++----
>   1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> index 5bbbaa15a260..938a2f1ff3fc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,x1e80100-camcc.yaml
> @@ -40,9 +40,9 @@ properties:
>         - description: A phandle to the MMCX power-domain
>   
>     required-opps:
> -    maxItems: 1
> -    description:
> -      A phandle to an OPP node describing MMCX performance points.
> +    items:
> +      - description: A phandle to an OPP node describing MXC performance points
> +      - description: A phandle to an OPP node describing MMCX performance points
>   
>   required:
>     - compatible
> @@ -66,7 +66,8 @@ examples:
>                  <&sleep_clk>;
>         power-domains = <&rpmhpd RPMHPD_MXC>,
>                         <&rpmhpd RPMHPD_MMCX>;
> -      required-opps = <&rpmhpd_opp_low_svs>;
> +      required-opps = <&rpmhpd_opp_low_svs>,
> +                      <&rpmhpd_opp_low_svs>;
>         #clock-cells = <1>;
>         #reset-cells = <1>;
>         #power-domain-cells = <1>;

This patch is fine as there is no current upstream user that depends, 
there's no ABI impact.

I'll take this into my tree as a precursor to a V5 camss bindings but, 
it'd be nice to get it merged ASAP.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
