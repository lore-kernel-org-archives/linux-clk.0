Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A0F4AEF7
	for <linux-clk@vger.kernel.org>; Sat, 29 Jun 2024 13:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719667843; cv=none; b=f7qOsYAi+rQK5azmQVxAI0Ljf4BOyDIeF9yW2GDxadvLx2wQEQnh6Vb88TFywOMEwwk563Dbepa+bD5E3tyscRFPPYzCLiYK1NhltDAk0/0FGx5iQOkylcWmgdR5V2gX4sk7HUxG4I1Do4SGlNBlpsikr21v3DOieRbji/hHLTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719667843; c=relaxed/simple;
	bh=SOSRf2xGbABYyJkyrOzqdHzZoZvGbDKQu4Io0KKd4fY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=p0li4lCLKTl6m38VfFAE1NAE/j4rYYP7tyktYjcaGPFKEYEOVH2ShazZ0nS37YuSh4xh98/U7baU4n7GI7AkkTmeRxO3GMlpjtniwFxlFbZ+BOJjEmqvn5OVBRlFm1l23GzPPhhem9iKsP7FuOTQJ8JkAtN7KR6Rp2SHZXUxH5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BRwOZJI0; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BRwOZJI0"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-57d0eca877cso1790337a12.2
        for <linux-clk@vger.kernel.org>; Sat, 29 Jun 2024 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719667841; x=1720272641; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CEplqgc1EUkrDgRyxKM1jdjFJoZG/7QBpRIZ5p4DyMg=;
        b=BRwOZJI0Xnfwvf5YKZ2EILQPoWNVohSRmYbpOpooDMn2cBYr3xq8kvocTFbYrY1QOY
         3LqKWPGVraMt7vSwaCLGrmNqVAE0rFl3KKHu0iG8m+lBcJf8RJghaEU8XwcVpZSU1a/h
         I+4cnaLKs9eBF5pWGwD/QhvCWKRp9JbA+kLVXVRfOiNZAp8/815LxEd6dJfM6xatqzSz
         x1BFPUknWdIfFi5bpg64QzO1We6DDhbnwFKP69tuqzxlNRiXI5ASGMX1WsFXS1AxBLcS
         cDV0POA35OkBstjiF6tko4s5DFIjPRvH04x+SK9FMTl4HzsJofalg1yRdKbZCV0E6q4j
         gMuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719667841; x=1720272641;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEplqgc1EUkrDgRyxKM1jdjFJoZG/7QBpRIZ5p4DyMg=;
        b=n49eRXEJoKep9Fl4ubjLaiWY1uJjNpqhXwBs97BrK/si6ILJpwkqAQsvWWfevD2Gf3
         ml7M6iJhJhxHutlJlbIU76qNfbES1eoL014hr86DvkM+tkXohmARrhcjKQVpfebasLu0
         sBly4WJ/J3a94Kf57pHlDBf+i0IAuVFPM3IYv/6x24kbAteRUHqsUQ8WAgjPRymyRVwO
         kNk6GY4oAcY7cZQu4XDRvvnfCK1+M9pZ+ZTT85fJutuXWmLynF/SHccTYYKc6RpmO/HK
         F/Ny7+mBr2Jse8YJKVNx2uNFM4eiaNXBwJ5ZVg9aWBit9DuI+XDc8Ww/cIewEtNC7z/n
         uOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNSoMHpFLngwyXE+vm60uLaIwZkeBIdKRlE0ND7C0zvN5FbF2CCrs1+tei4zIP8Nl0yl/05jkpxXrbW/KqLgN1ZiUYc3wSCY8E
X-Gm-Message-State: AOJu0YwddPf37mQqJMxU297k5+X7CZsGt6F8d1h6MEr/yy5xD6gKn4Fr
	ZeD6hj97T45neWSc1eND1VY87+BeswlEINIbgwMUPr7Ykv8UsrjIvknTo8mFgjU=
X-Google-Smtp-Source: AGHT+IFjYFA5Bwi5YkXtp2KPgMk/XhRypC3d/N4WcAg/MPXc1RhesuL87S0Eo6vXB5XJD873lymEfw==
X-Received: by 2002:a05:6402:50cb:b0:57c:80bf:9267 with SMTP id 4fb4d7f45d1cf-5879ede2ab6mr801572a12.6.1719667840341;
        Sat, 29 Jun 2024 06:30:40 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58614d504cesm2248129a12.71.2024.06.29.06.30.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 06:30:40 -0700 (PDT)
Message-ID: <8ffd8a3c-83e6-4753-8bdf-7daa3a3d8306@linaro.org>
Date: Sat, 29 Jun 2024 15:30:37 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V5 6/7] arm64: dts: qcom: ipq9574: Add support for nsscc
 node
To: Devi Priya <quic_devipriy@quicinc.com>, andersson@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, p.zabel@pengutronix.de, richardcochran@gmail.com,
 geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
 neil.armstrong@linaro.org, arnd@arndb.de, m.szyprowski@samsung.com,
 nfraprado@collabora.com, u-kumar1@ti.com, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-7-quic_devipriy@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20240626143302.810632-7-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.06.2024 4:33 PM, Devi Priya wrote:
> Add a node for the nss clock controller found on ipq9574 based devices.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---

Title: s/support for//

You're adding the node, not the support for it.

The nodes look good. Looking at the driver, the interconnect paths that will
be sync_state'd away due to no consumers don't seem to be super critical for
the system, so I'm assuming this doesn't crash

So, with the title fixed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
