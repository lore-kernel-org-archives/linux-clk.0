Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1229016E875
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 23:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713827123; cv=none; b=IgVb+HQTZWlecLo/ZTntGDi7Am10oApmrHGNKfeMMlFeZKAeAcnSDE4D56FLMfNZsx2fWp5sVCW1qUDXelfnFCQ5sBOCh678kwIdTdLnF/gKZuinKcmMnhmD1+WV+KGL/Iv5AIFTTCEvqYJB0KO0Zxr2aIua5XKtn7M/pTyEDnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713827123; c=relaxed/simple;
	bh=wx/8T/vKCcaJWYUAQMxU2rZuG7A7Df188Vg4okM/Q7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gHhxEITO4SLakLSuVjnDbcovQGUsTkk/uZ520ij69Mk/A4RR4pCyfX24Laz5q1OIOhnnWScHyWFRxF0G6ZknozCLoGuROwjIZBEV23BZD9eLEwF+ncrSrCM3XTOvOU7n34OEWTo9f9zAaOAeRwMTL8ZbB7j3hZI/r0qv/0NEJyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDONaG6u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDONaG6u"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-51aa6a8e49aso5298217e87.3
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 16:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713827120; x=1714431920; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7XaZIqxZMCjb4/3jfqVEEePAUTYmBS+nTMWBfjL7PcQ=;
        b=uDONaG6uEXy/lKQlehtz1xTBhu3zt2fbPg9VN/VT+LIqPurkHRn3LtoIYyGiI5VNPr
         Kr6OEM6Rup+IO3OoO/DxEMQdj+kYjZJmxhwT46opPCB6Q27+oChb8oaLh/kN7z5Ghntw
         fJTDNzpbCbEIGy6cIU26nqGCw23u6+HciDd2vHfkwrlYGEi2IBFA0HuCmZxBbZnxEa+z
         cj91mTWJKBIC9qgr+cO64peIUK0SHvhNCVhh7fHL4mB6sl9VBlzKvZZVuFXfiBjcXkZf
         zChW6fnhCnzzGiBFE2JULBAIwIDfdhppvGBChooh5BNo0ny7aqjYT7AEe08dkR4qvekP
         /20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713827120; x=1714431920;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7XaZIqxZMCjb4/3jfqVEEePAUTYmBS+nTMWBfjL7PcQ=;
        b=k3l794QRt6SeQplUTaLg9N1l0eJLFeXhjzufxbee4whKATK/pRmv9mk6CyAqvW4xZd
         W1fQNWhbIUZ+AX0ML19AG0n/hDtEfpAXdcs8m3jLf2ahibnqQiZxkfgqBZbiVlAnsLEG
         0z78AXseXQlEQS+2V7cCQkgljfu4Z4NyOZdHqrVVMlQ5k+lKwIXWVnJtV7EkQXjixLYN
         O9Fae0OHfB5tj63Z3bdq9FdHZS/9zx7/p93AwbC8TxgPwZsqT7qxNe92AZhYYumEwGqh
         5WybDSybvD6TRrhMyXLZst8ZTR1nLBak7z0vVPnVodL3baoJ7C614Rx55Eow2egmcz48
         6yFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhTYyiwqFF0XnhXQg/HI9Sg+J7z2y8/u0plFxlH+cdGYrN9PZisvHeMzdZ6OiHoDnT4IbhENrFGSrz9gCd7GUMoEeYlZlo/2sW
X-Gm-Message-State: AOJu0Yy6J0OC0aNpcWurhiCmcMh7tUCMgMseM3k8GAjgLCHiQUZVMXGE
	5+W0Qr1FEanCtZLPQBVmUiwHID/y8sytGomdrKhwJ9ME9rrDw3r2o3KxrnHrYQM=
X-Google-Smtp-Source: AGHT+IHdrli7VEWYIBOZ+ewTnJcjKj0VMtA4SYUWpUwpDZrhHaQy3ZiGxTgvc9rCxsRPU7FTuDkhvQ==
X-Received: by 2002:a05:6512:200d:b0:519:6c2d:9bd7 with SMTP id a13-20020a056512200d00b005196c2d9bd7mr6183534lfb.20.1713827120237;
        Mon, 22 Apr 2024 16:05:20 -0700 (PDT)
Received: from [172.30.204.103] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id fb11-20020a056512124b00b0051ab2cfece3sm1574247lfb.121.2024.04.22.16.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 16:05:19 -0700 (PDT)
Message-ID: <5e2682bc-88cf-4aca-9e7d-205f4cfca989@linaro.org>
Date: Tue, 23 Apr 2024 01:05:16 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/6] clk: qcom: common: Add interconnect clocks support
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, djakov@kernel.org,
 dmitry.baryshkov@linaro.org, quic_anusha@quicinc.com,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20240418092305.2337429-1-quic_varada@quicinc.com>
 <20240418092305.2337429-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240418092305.2337429-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/18/24 11:23, Varadarajan Narayanan wrote:
> Unlike MSM platforms that manage NoC related clocks and scaling
> from RPM, IPQ SoCs dont involve RPM in managing NoC related
> clocks and there is no NoC scaling.
> 
> However, there is a requirement to enable some NoC interface
> clocks for accessing the peripheral controllers present on
> these NoCs. Though exposing these as normal clocks would work,
> having a minimalistic interconnect driver to handle these clocks
> would make it consistent with other Qualcomm platforms resulting
> in common code paths. This is similar to msm8996-cbf's usage of
> icc-clk framework.
> 
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

One more thing that we don't seem to have squared out is how to handle
.sync_state. We can just jerryrig icc_sync_state in here, but I'm not
sure how that goes with some floating ideas of clk_sync_state that have
been tried in the past

Konrad
