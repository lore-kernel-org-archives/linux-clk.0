Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B59443
	for <linux-clk@vger.kernel.org>; Mon,  8 Sep 2025 07:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757317609; cv=none; b=PoP9SS9somj+6cibHCH/hx7biNO9loXCUOfM2DJFT9u/lPFDYPMnwb32j56bCtpQOpGLvklgvTfRjL5uuGpqCo+6qfhZ98+XzjvqoNbnAJ3POJHNaEuHa+YUKPJ44yyC91n7cE3FMEc134rQSkZqOwU3UpaK7IRZ0brErweeeio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757317609; c=relaxed/simple;
	bh=ZcFAyaemeAk8JLn7DChgM2B0OJSSjzqszGRTvZ5/O6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DE01BeRbBGYbBuh3ADCxmulAIVLq6dDCKl4k05H30iqCMHJEoqAHQcC82OZzcVOKJwfhXFfIl6GQqDLcY4TMCF8oPpAj8GG6nFH5NvG35A5xtu0UvrGmv4vPGTE9vod8/Sz2eSi18i37OnkoEqiHjzbR9sr+giNcTMUGnzcLkIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FOGG8cOO; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FOGG8cOO"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-45de2f5fe86so9039005e9.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Sep 2025 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757317606; x=1757922406; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VNAsSRzsosPIy3ZkgGv5CY0H+l21flmMwlSKUZ7UsXk=;
        b=FOGG8cOOVsCah8WwvN9CDfBgQcnbfhJgdW+kEDW8Rvl5uZA1y+Z4nnbsruvLUwZean
         50pskndfX7jyFWWskMhYJkgDrdvEHXMOiUJxas0+iKhFpG4waElycPoX71lUQRI2uNFE
         7fuvzk3n1Y4DlolGRMS7N9hgM/gKu4pWZI6elgjYkX+Chw3d3vDoUluN9vD0C3l4qeUT
         uQcPymnKRTg5qzwRFTb90EkPpndNCFNKLiKVh+E2yNmDfDgdd0RJZvSpT3EFJ7uAFV+A
         gYhPhqzNyoSA1KscsD5e46VlyxqRK7MTnXiOZUFE3FwBLrTReReOX4hEognVrw5zaS4i
         vRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757317606; x=1757922406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VNAsSRzsosPIy3ZkgGv5CY0H+l21flmMwlSKUZ7UsXk=;
        b=eyYiSN39sPXMYlhRWc9ZpnDCmrsyS2jc8EoSBPNcMvYw8EKg22WclIiTi7ujiAKnq/
         IDVOe+ltladBES56zg+DX5Eb+VfVCY6RY3YJARP9MqyWmxokzQZtBoL2a4QK+YqYMxaK
         hn4G/htt9TyORTTezGZJd7hShws/KJttcfvNBTJDOrhcVi87o/uOR+iiGZ/Qz9NHweHi
         RZeJLjdjlhOL47r+h7wGH/55+09359wugHqiCG8E5YRKEEEkFQ1XBzFFs+K25xkDvDwD
         QuBKUOVkMNNJCSwyDEXwgT4TQXK0YXXwTQThwoAAJQL23ECVQTx+Lxdnh/zcMidn6NhE
         v6dg==
X-Forwarded-Encrypted: i=1; AJvYcCXtEUF4wpD8VNei90C5SEOzDcSqovSFIgDFLy9LXjEAzvSV7hype+Qse8dsqSA5GTOWs3MJiRopAwg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSXHLc/OZ0EsHMBKmusZoqdWG2Hv/Zq6JGnMNj64plGVcsDPyp
	pDXgqsdsX4G3hjIMqNVdCdfz3rg0zdIs//xYctzmp6NTH7ONI4L+IKU0Px7yFefDyHk=
X-Gm-Gg: ASbGnct0MjO6sTr8l04uMs4GAj6dEEDUJlQVjcgc/3U03eigwapQBbA6vU7kP3maYC2
	cJs9arK6rRjuOmDDjZdHW93VuVu57E1i9SHQRFDzBtXzac+XKPjgbn9+2D6ews7YkvTXOydbdY6
	4jFO5uREV45+jB5JfCLbaaJE5tYNi8T5fF407Xui8KRhRsVQefssK0yTOlb737oAuFoj4TRw4mV
	bJ+Kp72eJq0YqT+dUwB6kNaM67Nhgnu9eG7SlXNgydZJtqyK4yMWML4Wmv+dkDRabgXiC7LW1Ho
	EzdFtg4tUBOfj0ts1uBAhx2I35W74ugS6UD1HQ9Tg5y6mzjpoWeAZsuUge8JNRakgqU2fvoB+jQ
	o58dONqrwxaVDilxzlOIQzTC8/rsqeJOo
X-Google-Smtp-Source: AGHT+IHn3jMawLrugAhLgtdrDjKbbgNOsVBJuZ/1bwRiJ8MlERu9wdEB+XckTY2iI9k7tkZoET5gag==
X-Received: by 2002:a05:600c:4744:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-45dddebfae0mr61565605e9.20.1757317606013;
        Mon, 08 Sep 2025 00:46:46 -0700 (PDT)
Received: from [192.168.0.251] ([79.115.63.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcff67787sm181785435e9.16.2025.09.08.00.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 00:46:45 -0700 (PDT)
Message-ID: <33e80e92-d68f-4919-b535-e76836fbabd1@linaro.org>
Date: Mon, 8 Sep 2025 08:46:42 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] firmware: exynos-acpm: register ACPM clocks pdev
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com
References: <20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org>
 <20250903-acpm-clk-v3-4-65ecd42d88c7@linaro.org>
 <700967d0-ad8b-471b-b2cf-6544727db26d@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <700967d0-ad8b-471b-b2cf-6544727db26d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/6/25 1:20 PM, Krzysztof Kozlowski wrote:
> On 03/09/2025 15:56, Tudor Ambarus wrote:
>> Register by hand a platform device for the ACPM clocks.
>> The ACPM clocks are not modeled as a DT child of ACPM because:
>> 1/ they don't have their own resources.
>> 2/ they are not a block that can be reused. The clock identifying
>>    data is reduced (clock ID, clock name and mailbox channel ID)
>>    and may differ from a SoC to another.
> 
> If I understand patchset correctly (and your cover letter supports
> that), this does not depend on patch #3, so please move it before that
> one, so both firmware patches are one after another.

You're correct.

#3 depends on #2 and I thought you wanted the minimum dependencies listed
somehow, so that the clock subsystem doesn't pull extra patches (that would
be #4). I will move #4 in between current #2 and #3.

Thanks!
