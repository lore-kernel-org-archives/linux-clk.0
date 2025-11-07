Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DB119D07E
	for <linux-clk@vger.kernel.org>; Fri,  7 Nov 2025 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762501148; cv=none; b=ZuDR/luk0qfvSviJ7Yk1XxBU4RRXeJsOdM8zFuGZrhibezP0VgQEYAqGu5kkjmY4mGG0FGI/WFnBIXfBt5SltT2UvusOTJKUJnaJO6blubLK1oYXXMJEKpMs8qk4kMICwHnIFpk3+JH6UGD0XX5+Bj12iXy0xayF2M9fDksH05o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762501148; c=relaxed/simple;
	bh=nnCjtR1hoLZU4W7X/7MNPNJQcSGKU7k8x7h1oCI6eII=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OMCJUHO40Kquflrj/5cybFJbyNoM765QjCN2tkvX9o4Uv6+bkB4+KNuLN2xGVcIZRbn+FyVf0NIK7CI6444pm8lku0NWPvaExuTu5S23EYE6r0cGLVnEOEPSf2yYrhei6hLiDqK+LSRKfxzX4Kuw4K+nvNfecFdsHWRMVJ6/W5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YwTAa2Qn; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwTAa2Qn"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-429cbdab700so20495f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 06 Nov 2025 23:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762501144; x=1763105944; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mPHa77n36avqCT0WJDJbXLaeZTnTn8F40uoG4mEoafc=;
        b=YwTAa2QnSR+EoY/3Zl/WPuyzQg2cjz34deC/rUji5H9LY06fhMK5lw91rq8bXgf4Od
         r9VZNMig0k88guiWV6zA6WKEJeLZew+arcEtQZWucrMW3kATmhAq8hBRDTNWPaMT8I/h
         YYOmHuFhQkzSsH8I5RA0K9VIxWWop0OE3YzkZRYQHuJujSbT+3X1e2QrJ1t/HWhg7BH0
         M0BOyRdxzjXdPkpyTDDs9pT6Jw3D3t9h3PfSPvKyt9a04hMMS4tZ0XXMPifAtYbO4tp0
         qo/laSqZZOsCqUt7QL5RTshgVhmUzcKT6aaS2hhy2wkWwjh9YBEgGAZ5Z3Khs4gjyVOy
         WZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762501145; x=1763105945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPHa77n36avqCT0WJDJbXLaeZTnTn8F40uoG4mEoafc=;
        b=V2S5VEJVTIL52DCpfZGUuDfxCsoVoNyIayyiPXk4CaRidrrto2+cehoI28Im22RHmx
         44I1DU73OftkUbNFhQtvBtS0PM7Pj3TAs89szimNFAzi0xnBLHXgaxpsKWZVjh6s+Tvi
         n+bvWI+aEGXLx3A9BpMc1aP8q+he7u3Mn6Ku0zqbjz3Mh1ovBkYhYIWo2bXoTDbDszPH
         KCtLXAF1bor9PEJDQ8JJzJbvEpjI+Jbw/wvWYuAnjcE08z2zpEnIrZoyGmU/DQIvzunG
         Z/Vj3DIG0OqgtXTbWhEpBp5pTESlxXnOFXPfHLPyYYg1zlPjezSW2yfYNIxoCDhaCdvY
         aO+g==
X-Forwarded-Encrypted: i=1; AJvYcCWN6zjpwecga6TrVCo3f4yxWqT24f7eKpyUPX8ekXprXmzwPGsTF040devR+lpX+PxdsXHfyx7nVCg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzNutlpGpGmzCzLNXsIE7UE7IX5NP9FwTX+zA+Z9y9iaerdGHEy
	ZlItCMbdmtXjxUx2o1JX3pSMN66sis+XX9OTzi6sPtFf1YBRP+rqqcIh+14ynNIS/BY=
X-Gm-Gg: ASbGnctWC786IxjHidZrDkYTTPA69Ftbgu4e2nMj472w5+u6gP5YkBeJxb2ssi2Ku5R
	D+fiUUZJs9b03t71aP2EQBx3W+CFPQZ3X8GLimvBaPBs3tzve4OQgWp11dGBshtcpvIO5C3Dvv8
	2LWIWi0Po7a1SuIa+XwdrXWxZNpLLPMeugJ44uL66wRRdlZinTancdFJ94j6NPRYXOzyeKy7vf5
	WOsTsxVbNL0k8y/5SnRsgh9dXYVhSod+Ub2Qb8hoCpTwj3ym9/WyTR2jJNMKKUgh+1DM2c5hrGi
	LOEezAuHuk1eGEz/Ma68kNOumf/IoDPG46OKcEER/HCiCnf/RTTnSXfRtp30hYtLcdN5rfSDln2
	rZPj2aqTrdytcTLwgFKW3noYi6Np0aghZYoOIhGZTI6HMCiKOTexOL4AyvQky64T6y+dalspoG8
	ag4YBDR/x2a+ZGZSMabkbT
X-Google-Smtp-Source: AGHT+IFDLMkEoshZyrAHGelWWORSuP9kBbhB31Y2VYCwgLGQG3gKyDXj4QZLEs9NxCYweAbW9efAJg==
X-Received: by 2002:a05:600c:8010:b0:477:362c:1716 with SMTP id 5b1f17b1804b1-4776bcd518amr8511855e9.6.1762501144584;
        Thu, 06 Nov 2025 23:39:04 -0800 (PST)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776bcd51dfsm32606045e9.5.2025.11.06.23.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 23:39:03 -0800 (PST)
Message-ID: <e9a3e213-5dfd-4486-be0b-e50e79970374@linaro.org>
Date: Fri, 7 Nov 2025 08:39:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v6 4/5] dt-bindings: clock: rockchip: Add RK3506
 clock and reset unit
To: Elaine Zhang <zhangqing@rock-chips.com>, mturquette@baylibre.com,
 sboyd@kernel.org, sugar.zhang@rock-chips.com, heiko@sntech.de,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 finley.xiao@rock-chips.com
References: <20251107013757.5013-1-zhangqing@rock-chips.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20251107013757.5013-1-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/11/2025 02:37, Elaine Zhang wrote:
> From: Finley Xiao <finley.xiao@rock-chips.com>
> 
> Add device tree bindings for clock and reset unit on RK3506 SoC.
> Add clock and reset IDs for RK3506 SoC.
> 
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>


You CC-ed an address, which suggests you do not work on mainline kernel
or you do not use get_maintainers.pl/b4/patman. Please rebase and always
work on mainline or start using mentioned tools, so correct addresses
will be used.

> ---
>  .../bindings/clock/rockchip,rk3506-cru.yaml   |  51 ++++
>  .../dt-bindings/clock/rockchip,rk3506-cru.h   | 285 ++++++++++++++++++
>  .../dt-bindings/reset/rockchip,rk3506-cru.h   | 211 +++++++++++++
>  3 files changed, 547 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
>  create mode 100644 include/dt-bindings/clock/rockchip,rk3506-cru.h
>  create mode 100644 include/dt-bindings/reset/rockchip,rk3506-cru.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> new file mode 100644
> index 000000000000..ecb5fa497747
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/rockchip,rk3506-cru.yaml
> @@ -0,0 +1,51 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/rockchip,rk3506-cru.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Rockchip RK3506 Clock and Reset Unit (CRU)
> +
> +maintainers:
> +  - Finley Xiao <finley.xiao@rock-chips.com>
> +  - Heiko Stuebner <heiko@sntech.de>
> +
> +description: |

You got already review. Month or so ago. Implement it.

Best regards,
Krzysztof
