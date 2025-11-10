Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C20830C605
	for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762775816; cv=none; b=MsFGF/reoJByGGkId9iFkwxsIEikkcbN1wQfTQpMiz0XSjZOIefJmWNYeFcDE0KtTnptfWczJuqmBq4uiOJbJuTdVSglam0rZ09FSXWZaS8dq/BeHk8WvLrgBMlSZ8seNYZvh+1pZIGmOuBZAGs2rNaMu3CjglyQxyJ1QCPTFKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762775816; c=relaxed/simple;
	bh=oUgierYSU3dRBhCJGCsjS3J9M3HkXvV59r1SNiAzvk0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwXPk6y5wSU3De5GIJrEwborM9yxv48KeiGJV0T4iUDX/CgXZwB0YI3fDuaZzaX1UJEVeVCLRy/SkxwEYOkuvYTAvoSTVmbx70pTkPZbxekyOv4kqqmYkAnJmgxvMnRtiKD0MTUPyqshRnAjVDQlGIyFO4juCVCLrMr7DVBZbd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yZ8sbvzu; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yZ8sbvzu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so2118693f8f.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Nov 2025 03:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762775812; x=1763380612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4g2z/CUdSCaQjy9LxpwOngAggO4WOQO9SBX2pApcNyk=;
        b=yZ8sbvzuAGCw2mrF/znpax5qC41Ec7OITzSh/dmx2az4dedT5WWB6bpqwtSq1I4Nlr
         oIpLrJxktDxHg06jbPw7jL2jKcc+0jSEAQd3c+S4v1KeOvQi/QSH90zJ/r6OyfXi506r
         hmTKfE/X0/sdzVMa9BE+0dwJJQdEftjpNt6jt1tHT6/j6tfYT6HVn/algXMNXZKO3VB+
         dRSM/3B6u/fUySKFFntvkD2WpNch/ElHnxg6XbZjgr8WjqdfdMpnrFgmL2piHu4dwSty
         M8OWYVWlLYbBk3RJ3adi7uPuosp/yzM+ERCRJasi1lgQxCnJnXtKfsoEfV5hkEUCGeMw
         hsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762775812; x=1763380612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g2z/CUdSCaQjy9LxpwOngAggO4WOQO9SBX2pApcNyk=;
        b=Lgf0WV1fyOe0ksz+iMNKYY2go5hq9WHQy+IHbPYe6Sgt4Sq80tiIgtnRQ3Dru3Kiq2
         kilCGUS19ZEltHNIjxZdLGVfu9KwDy3gyRQHUJ54Apyi1oLBSZdnynuHb96HJdFt8TV0
         6VjVTU6RN4CLuUM/HmqchCY8/kGpFiFpyIj7Yhsv/LCsuaTPIfBg3bLwFWYuWnD56UYD
         E4yPXD7K/uq8EWXPdvjgzkMHXPiARpSs7z1pzffNrc2lvDP7zW46yEfykz/QWlbpbBtf
         eE0wb2bfATLmH16zNN+a8uIV0kLoTCxPT256EU6aHk84BEwBuOIheSNSGmqGo9q3N31/
         NFFA==
X-Forwarded-Encrypted: i=1; AJvYcCUj0E0hqeuAqWT1BJsNNCdOueXm/PsByZ2VTtfp/bvwTOxUunXJ9BE3xTN8UM6Qu2PMDLFGAknaJBU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeUeSd+9zS+XlqSZu7sqtaS9KTDLwjnGUDNoMERsw5kAM1i0G/
	k9S0ocZPp+03+WSBdOFXXxj1zcMVG1h0XdhoRsUuIiD4anpMYVsZqrcxh/pxBhCEEkM=
X-Gm-Gg: ASbGncuSsp44ZDfKX74nDWx64w/GjZoidbcq3U/Q/P8d8w7ZVsSMeY14mKYpU6PV4Wq
	cu+cILp4WWxop8BuzqzJfzWFFJoykKPPpviM4I8IW/rs1ZkXz7LgwL7vq/CvM+CYn4ew6nfqkVb
	PBzPSP/18jT7bZzibd7IXPfeToc0v/tnvsog+FB8KA9UWNXZvf3+461K4k2NPTiASRMlQI4exKD
	C0QrR3f2EwQiZHvqDsJ2Sxlv821DFXv3xKHEe2liGVynvLGqON/mKSnTy7S59mvqgoNWANK+fwv
	t3uVzOJvsQzgoQDYX26ocl57NwB8WKEOtolo/pyG2FzfYX6FQpU54YBVdAVm5Jhcka0hKxRN7wL
	0C0T0bWdcFqo26DGoHI0MT4AW+rRILyPZouHK4j58wG/0RQqErVWK0WiFD9zcXmyo7t9togFGEw
	jUW/RcgMNmifjIdqTbAdCO4SdV06CESVLKTIAJqL7ikjgopsYwgbCMeuM=
X-Google-Smtp-Source: AGHT+IFbcw4K9ivqGLQddDZa5CrYY9iwv64S3IIlLZWbi+XRwqAEU+75TumzHzlJ4CnXK9gTK1CTaA==
X-Received: by 2002:a5d:5f42:0:b0:429:bca4:6b44 with SMTP id ffacd0b85a97d-42b2dc1f4e9mr6741662f8f.13.1762775812360;
        Mon, 10 Nov 2025 03:56:52 -0800 (PST)
Received: from ?IPV6:2a05:6e02:1041:c10:2b20:d700:6e9c:533c? ([2a05:6e02:1041:c10:2b20:d700:6e9c:533c])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-42ac679c5dcsm24735244f8f.44.2025.11.10.03.56.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 03:56:51 -0800 (PST)
Message-ID: <d36f89d7-2d18-4c24-840c-243d4fa10de0@linaro.org>
Date: Mon, 10 Nov 2025 12:56:50 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: thermal: r9a09g047-tsu: Document
 RZ/V2H TSU
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>,
 john.madieu.xa@bp.renesas.com, rafael@kernel.org, rui.zhang@intel.com,
 lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20251020143107.13974-1-ovidiu.panait.rb@renesas.com>
 <20251020143107.13974-3-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20251020143107.13974-3-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/25 16:31, Ovidiu Panait wrote:
> The Renesas RZ/V2H SoC includes a Thermal Sensor Unit (TSU) block designed
> to measure the junction temperature. The device provides real-time
> temperature measurements for thermal management, utilizing two dedicated
> channels for temperature sensing.
> 
> The Renesas RZ/V2H SoC is using the same TSU IP found on the RZ/G3E SoC,
> the only difference being that it has two channels instead of one.
> 
> Add new compatible string "renesas,r9a09g057-tsu" for RZ/V2H and use
> "renesas,r9a09g047-tsu" as a fallback compatible to indicate hardware
> compatibility with the RZ/G3E implementation.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied patch 2/3

Thanks


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
