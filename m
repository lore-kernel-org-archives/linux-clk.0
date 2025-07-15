Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB5D526E6E6
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752562413; cv=none; b=MRqDJ+HLxeZpVEY4lkgcUPtPk/nKSFClfepFmL3Hp6nfD9CNTFm9fqJaQCqmaRrsGo8NmW7SSdPlktZjIAldYCsBzS+Qw5GMRYLb0d+rFKqnkeZCeBUETwS8PLvq8YVcvjU8Ct/T8fdfT/kcCN3FdJ2EN8cn2roxTZn82fdD5Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752562413; c=relaxed/simple;
	bh=7Pgt3265MUvv0KO/DG+JIDcgier23nzqYxB6scwqRbM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=riqXkJkwcpUeMXGqMXcNnoqdSxDNi+c5oBIFg8kTqpM8zz1nPYxjGn6SitIG8lIchwXk0o3U8CFPTocU8lP+zULgIoGRDfuIvkKbZub32POwa+MCUJj2bOycMXjp8I4/RhNctG++PxKbIqxSNPfUYGgZjxu6Ve4EpuMkLD2Ddds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uuHIrnti; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uuHIrnti"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b4c37ebf3so8808091fa.3
        for <linux-clk@vger.kernel.org>; Mon, 14 Jul 2025 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752562410; x=1753167210; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IvcOD4Cn8eI42dR9/vuoZROCEodBzgnn8pqK2R/ysOA=;
        b=uuHIrntiXVwd0zUT0sDuSkjZTDDfill65Dx/43o8Euv00KMBwcesYrjIW+Bj6IvBCj
         cS3/biyblTHaHzV+U7KF6UB9+XDUhLgvSVuYyajNSp08ATXYEQekD6gjiA0yLAUiH/s7
         B9iVIDYM3+2IgEkrWxw4M52ulWQmHyLaxXsNbVorPffNIGEPTaKHx7t9/US+h6m+3nUc
         a3IEuD7NJ4Wc9pF5Lks5n356u0yRHXqkW5SNo9kgxeNGDWGCEwWCdaUOr7yR7jsmpmrn
         ogp6alvjQAhdMgKEp1qpWoWyReXbv+eylOhrPJPvN9B2tekORXKjITTKwdT4QuWlKHvt
         1JWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752562410; x=1753167210;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IvcOD4Cn8eI42dR9/vuoZROCEodBzgnn8pqK2R/ysOA=;
        b=FRjR6NOLAPP8gz00NtnXyhk1hVGfJhD01gi56OQ666CYEfFtsEOqvUW/VIJX65Wz9i
         QMUAvoRX7lq7J1wXzc2IgYB3kZXAsTgjlRATTPOWI2vL8Qc1hiXVeWyXheutQRVmHWjj
         xfRqLsjgVUvsaUXYf16QVpBYxa9Voul0285sPZc7b+p7Z0UH7mt+6asHtEt0zojKfKLx
         yewCp0h7jYr2/mAMkXrdWLGnrjo4Fn88017hR1EbVGvz3hfOzgSW+eMLqYgeaJUmSm40
         UHiFEKcJqZbglMptnzn1qJo3WWwx4u8eOOMAcJ+XJ2aW7lcEgMnz4hUeFEdvba5KUfgE
         r/NA==
X-Forwarded-Encrypted: i=1; AJvYcCXGcOvFIHb47erPEJNIrigFnAcwAisiy7Im0g8ThbdnihfQiDr5LlvQSivRazvLq97C8mgdIWkReLU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy44NVIBIG2Tqej+uaZUj96CQusVoKSfpH2fatEG9THZNJ/DVew
	MnQQ/EboGNkaFyz4ObkyrZGV48wiyTT8EBVvrSPxciofnq7+2CLO42T/5aHUuxSveQ8=
X-Gm-Gg: ASbGncvHctpihNIkJDassuqDGiGVUbCtW9syZvpSm0GdWuyrzQ+m6M1m0L1jJeUayOB
	YtbUJlea8g1fDn3k57No+KB/XWTPWu0SDYkKwWGZ66ev0eaxU1YFsswqE1u0BaVyQ9wIr7HmJSK
	49gnYcTI8/6Q/AfdBkHY5h+diND4pZUVs1Pqz1wmsCIHSJ9v6SCxn1ScsaJTuKZnA+jqpY+TdyJ
	MHR0BKd0w8Pd8vJq9P2wG+nbvxEiSGv3ZtRJJM7no+bHiyJ/9dsGIMBexup8369lreOQsXEkvdr
	Yqg9EhrOLhUk/woQgExUEwCgqrq3a75yCl7tTyD1YMqvvTDKuyzQsuTHWiN4n2qLHV99jNyEw4p
	eJPgFgs1N3XAmZBoZL9TWZSM/fBoRim9hOs6LTCaW7OCbtlakycj1N4WILBU5eSyAohsaBiSXTu
	CH
X-Google-Smtp-Source: AGHT+IFodu1HnNtyzy2FJlD/fynnVpnoIvnN8l+K4AJ3AsUd4f17BT9WXmpIiPUMoelKfh8FHowKUQ==
X-Received: by 2002:a05:6512:32c1:b0:549:8fd0:ddaa with SMTP id 2adb3069b0e04-55a1fc78578mr60358e87.0.1752562409993;
        Mon, 14 Jul 2025 23:53:29 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55943b8abfasm2204780e87.255.2025.07.14.23.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 23:53:29 -0700 (PDT)
Message-ID: <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
Date: Tue, 15 Jul 2025 09:53:27 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250711-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v7-0-0bc5da82f526@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/25 15:57, Bryan O'Donoghue wrote:
> v7:
> 
> - Reimagine the PHYs as individual nodes.
>    A v1 of the schmea and driver for the CSI PHY has been published with
>    some review feedback from Rob Herring and Konrad Dybcio
> 
>    https://lore.kernel.org/r/20250710-x1e-csi2-phy-v1-0-74acbb5b162b@linaro.org
> 
>    Both the clock name changes from Rob and OPP changes suggested by Konrad
>    are _not_ yet present in this submission however stipulating to those
>    changes, I think publishing this v7 of the CAMSS/DT changes is warranted.
> 
>    Its important to publish a whole view of changes for reviewers without
>    necessarily munging everything together in one sprawling series.
> 
>    TL;DR I moved the PHY driver to its own series review comments there
>    are not reflected here yet but "shouldn't" have a big impact here.
> 
> - Having separate nodes in the DT for the PHYS allows for switching on PHYs
>    as we do for just about every other PHYs.
>    &csiphyX {
>        status = "okay";
>    };
> 
>    We just list phys = <> in the core dtsi and enable the PHYs we want in
>    the platform dts.
> 
> - The level of code change in CAMSS itself turns out to be quite small.
>    Adding the PHY structure to the CSIPHY device
>    Differentiating the existing camss.c -> camss-csiphy.c init functions
>    A few new function pointers to facilitate parallel support of legacy
>    and new PHY interfaces.
> 
> - A key goal of this updated series is both to introduce a new PHY method
>    to CAMSS but to do it _only_ for a new SoC while taking care to ensure
>    that legacy CAMSS-PHY and legacy DT ABI continues to work.
> 
>    This is a key point coming from the DT people which I've slowly imbibed
>    and hopefully succeeded in implementing.
> 
> - In addition to the CRD both T14s and Slim7x are supported.
>    I have the Inspirion14 working and the XPS but since we haven't landed
>    the Inspirion upstream yet, I've chosen to hold off on the XPS too.
> 
> - There is another proposal on the list to make PHY devices as sub-devices
>    
>    I believe having those separate like most of our other PHYs
>    is the more appropriate way to go.
> 
>    Similarly there is less code change to the CAMSS driver with this change.
> 
>    Finally I believe we should contine to have endpoints go from the sensor
>    to CAMSS not the PHY as CAMSS' CSI decoder is the consumer of the data
>    not the PHY.
> 

1. This is an incorrect assumption, unfortunately it was not discussed
previously for whatever reason, good news now it gets a discussion under
drivers/phy changeset.

2. The whole new changes for legacy/new CSIPHY support is not present
in v1-v6 of this changeset, it just appears out of nowhere in the v7,
and since it is broken it should be removed from v8 expectedly.

It's a pity to realize that instead of providing any review comments
for the CSIPHY support series sent to you one month ago a lot of time
is wastefully burnt on a broken by design change development.

-- 
Best wishes,
Vladimir
