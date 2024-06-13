Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99A712D757
	for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 16:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718296936; cv=none; b=jqeYKC9Gm/FApagTbeP4aXU+WMYQ2aGFTSDlbhQn93Pmbpb7I+QQk9jeIee7lqUKhetSzXRQ696lisy0epZxzw1+TDam+Jw02yuG1C3d4ZDSE6F2jjk/XYCWXEjy2APwzjO8tdZHoC8dLckReoAXUdrPXEeT4IHMZ0VAdUzMe/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718296936; c=relaxed/simple;
	bh=d4Zivpa+Kr91lXBluwGJv6NkuP5Fp/Zrezb2fbHpfBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6JNYPWwHGrcqbjXKro8m6DZlE8Z4eMSl+SsUt50A6Blv0tAGCDl1nkN6G2Z+aOjrJPkm+ir3szKS0IVll1zttsjTFPT/QeSborZWaOD7t2joCucNRv2pDc1klm7TWJ+gYAEQRtCOn4es8aSNW3oWMrWO9fHhune2BAejyeH06M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3Pr1YCE; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3Pr1YCE"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2eaea28868dso17201441fa.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2024 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718296933; x=1718901733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KxumJDVbsP4QVPvesFB523q6d4QgJEn6x6IfBmiyMhg=;
        b=z3Pr1YCEhkXBwJrTn7gf9IZ2MzkV5tT+9bpEIjRhcz1ALhzp6dnKrXQvys9HQRX+Hl
         GN3V9Ozdz7xvT/o1XqnMwsYJK/yXGuJlZTlsByCjAdfbhwlrV75cVKzEMcs8H/nz8cG5
         H+ttvmSW0AP7FB7IQ/1CQ/6cwTl/Ury2zsOi4+KE9hzEVbjjYHW4B1C8q0/vCUj0hdfw
         WurKyAElCEWu6s+RiUUMWJWGft4ILwiH+GmQl9yo1SDszcYXEdScQTGuLKNBUy9RkgBg
         d/kU+CLg0KmNIe3Ny0Va5CYo0jKqCcdgrYGpw2VABqZ7mQStiJX9YTCL+1iQ5tgy/3ia
         OvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718296933; x=1718901733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KxumJDVbsP4QVPvesFB523q6d4QgJEn6x6IfBmiyMhg=;
        b=YKuzqpeIw/AhYBaZIUURCASsbJBPiRYsl6mI1Ai5Pzux9sNbNiDLm1GNYasCctspRG
         U3+lHIsJ+vr6wmsoC6dgr7cUkXTkQRES0p6YBHWbJLP+HJNoPy68x+P30DG5CzEGAeA4
         UlIWseoPjjMRXBoYz/gup6k4EjHPl/e4MD+47axaB+wNy0GwV1mux3pFHNWoW06uOdeN
         p3mSW3/2TSGgP1iv87v3B001MENxEsGAJ3tbjBepZbxc9cL05s+z9rPvxz0Dr1i9jSYa
         MbTmfOlOYsQ6GFfe1ZhISPp7nMG4WXWpLDlhylWilhapUayGSzpXIEotF4ZPwsfeLl4T
         cAMA==
X-Forwarded-Encrypted: i=1; AJvYcCXfGLaIsDU2FXJ5cwTQszKgitNBWYmJIyXJ3VXoXpj7KZePS2damWKwf+nNxXHbR/0zTivGuchyTXK2Xfq/pFpXLtSAq2jwom+8
X-Gm-Message-State: AOJu0YxxyO5Ry6vYtE7yhYCJ8aMKyYiM6DBa1LHd1N2ZlUkmv0V55JLb
	PM3jtAaBQ0Pb3aNM3h2oXIPwpsgIr/G913D2I0DhgVTC8wisobuM7QxJElA0hzw=
X-Google-Smtp-Source: AGHT+IGSM9D0UjKqMRrpwUBDckCv+L+W8oy5sZf9E5Weqo0lZ3R41sisP7y2M9mjYoz1A9XbBfJtww==
X-Received: by 2002:ac2:57c3:0:b0:52b:bfa7:66a1 with SMTP id 2adb3069b0e04-52ca6e56ed4mr226505e87.5.1718296933016;
        Thu, 13 Jun 2024 09:42:13 -0700 (PDT)
Received: from ?IPV6:2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76? ([2a00:f41:900a:a4b1:9ab2:4d92:821a:bb76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282564dsm282363e87.9.2024.06.13.09.42.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 09:42:12 -0700 (PDT)
Message-ID: <1cfd671b-a4d1-4edb-a2f6-b91b6edd7b22@linaro.org>
Date: Thu, 13 Jun 2024 18:42:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] arm64: dts: qcom: Update sleep_clk frequency to 32000
 on SA8775P
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 quic_jkona@quicinc.com, quic_imrashai@quicinc.com
References: <20240612-sa8775p-mm-clock-controllers-v1-0-db295a846ee7@quicinc.com>
 <20240612-sa8775p-mm-clock-controllers-v1-8-db295a846ee7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-mm-clock-controllers-v1-8-db295a846ee7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 12:47, Taniya Das wrote:
> The HW supported sleep_clk frequency on SA8775P is 32000, hence
> update the sleep_clk frequency with the correct value on SA8775P.
> 
> Fixes: 603f96d4c9d0 ("arm64: dts: qcom: add initial support for qcom sa8775p-ride")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
