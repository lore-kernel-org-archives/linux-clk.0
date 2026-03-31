Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095293A4F2F
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 10:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953836; cv=none; b=HAYosLV8lomeck0z7Rk0XkQQDAPFpDnXM3c41tYLCia4AtFVvmYtrzhWgc765bWQURZ+pvKJF8X5qjHTC7buDl5i0xvWEYvBBPY4cIZBjvGAf+2IEygcIxPzeBrsreoznR/4joseKq3Lypd5rGilMZTS50vru4oMIq2Gctp98zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953836; c=relaxed/simple;
	bh=JBv2meAaeKW1RSExJUkHk3aR1uS/gG/5/TNgpdUFCVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=D6SOoNTfzkzFSu9qJLZ4gz9/8IHl1zsZ685TB+RCwVp5M56LPdvb5n8QkafIoeq7Z8j3hDiY8ZIQJHLRQ5bYaWvft1IKncL2D+55455LTSwJ0evTZytx143kF9v0O2rhF1vpWWOe2Ss+Wmm1nqhLiqh5Hy5b0lDxKf0D8P0U0ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yu7gkyni; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yu7gkyni"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a277d9c5b2so831705e87.0
        for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 03:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774953833; x=1775558633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=Yu7gkynitjxFtcaLcpUh9dJq3Z2M8i0u8TW1Ckc8PJMKXFWpckT3vDtF3jdEqljARq
         PBKJh7vGRdl7HUqD36HCeYps+sLykOB0mM9aJ7QcPHtnxHhXp1Pry633YuWmAMFDcv3+
         WFFvBRvYmP5YnVESreTWExOAlBtGkk9QRQ2nZoD4EZJdnO0tjSffIk9C+nm+0CyieEpp
         Iai9TP09AUBib5dNKRkrIkdIMdkRaTs5IvK9XM171Zm3jEvak4YAQ4qYjKcXtGXEkckj
         hcT1qKDzuQHRoKbv8jUrG8/SGGjTwhvqLV7EQxG6SxnA3MKevavMTlyE4qbv/GgrGPBp
         5o+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953833; x=1775558633;
        h=content-transfer-encoding:in-reply-to:from:references:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTRjFtodY6zz6hsjwtMEZh9oRqLgaEJ+snOXbwMDaaE=;
        b=FrNcUS+f2iT2RmpmIVQ1j6CasV30rvl0N8hcLLQuXR3is6Dnc2WPuSez6ftQeLR2GI
         z9gPg7k1vXEyCwYTD2NaDi+/1iEDoywwsbAryJRk7PO/LwXeQaG5csB6amGYzoLmbe/d
         Fpv2W+dIDPJoKchKDQZNmPeF/tp9OjwAxqUkfAUCAp4bC52p2zzpPNm2hxn6d18j7A/f
         kYD8+6dfKWxXk/xqV52Igf9oHcK5hhlueG6pCnLsxZHzFLSwXOx+5/dbs4TAA8fGtKJz
         fFwjcuOnDXQSSaHZl9ZmLLdpgGYVmkRR3JWY/bqvXZh5WY33909encHyDtGbQcTUxpg6
         1UfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWdPKbML60w0sGpBaWNlQk2hyzC2MqDjTmET4HAiLDY4X9ZNzDhWjyrgXPOHDWfL/MD4IrMK2w2evo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwITpMgdtIp0eXHkYlD799tykvD40N7I5Hbg52ORCwhCW5XmKfK
	PP08QmnY8HKYMCUdNzvZ1zMu2/xYDsPMWpm80aWSBFYSJdUmPjiV8j7MOCGlsNhu9x0=
X-Gm-Gg: ATEYQzxUlHp7Sp+F50jOK7yiwWDyYD0RGy99h/xNJXAeNxtxKC9G0EyjkZrEYMygQgp
	EoOtL6/Rlu3L97q8B0Dv58WUKdE+WSl2sLs2GD4kdLCoAx9tZ5X1eXnGSmr+UfxVLikX6pG6B3o
	nL3p8LXildYyScuFxlvoh/eWDR0MtJgQtzqrY/Nrf4wQ7q2JAVMajvr4tTywiYfNPxtbcsFpuXL
	CTKJB3MjUvvyWjpAn9aEIrHMOnuT/z4uzbwYlP28R/qpeBysjUW83GARtmkh+oYJMRhogg3XgRF
	aRvCasV65g9aDaQqyyDSBwMtbtxwkh6Tx+OfkMUtiIbqEWnR5FSD4xL7iBDD34+faV2+JkWQyrd
	0N/j6DRRY0N/SiZIBcau10Jsmvtw1HfsEmoU88NEkS2iSqZRMbng9O8efcaIvwT/hrxcyEgaPlk
	wv8N4k3JuK+wl/aMh4rNmmjjAMy9WBOK3e4odIJspfHXDe5KfIf1D7iWNkGD/a+qEjCdGv/eNyv
	lJUEw==
X-Received: by 2002:a05:6512:4022:b0:5a2:82b9:afb7 with SMTP id 2adb3069b0e04-5a2ab5fa11fmr2488669e87.2.1774953833180;
        Tue, 31 Mar 2026 03:43:53 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b13fd008sm2350070e87.19.2026.03.31.03.43.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 03:43:52 -0700 (PDT)
Message-ID: <040edb24-3689-404e-b16b-c3ead54aba19@linaro.org>
Date: Tue, 31 Mar 2026 13:43:52 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: qcom: Constify qcom_cc_driver_data
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260331091721.61613-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 12:17, Krzysztof Kozlowski wrote:
> The static 'struct qcom_cc_driver_data' contains probe match-like data
> and is not modified: neither by the driver defining it nor by common.c
> code using it.
> 
> Make it const for code safety and code readability.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
