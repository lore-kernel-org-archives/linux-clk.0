Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com [209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D0019004B
	for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732795755; cv=none; b=AKB9NZo9qhnF+U2eReY+wYdy5YRAvekZCXShFZIPiuxZEUoG6KnG+CetmNsNUoyuLvWoxHrO0YyATGBQXNxWUfvwgiyyMSQ4S38nGr7b11h6+EAzU8UBnZtPi9b4N+MkBCy0JzMHTYWAZpqWsxAz+gBDopTj3zkDefg1SNVDU9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732795755; c=relaxed/simple;
	bh=RW3VZirTHPIW66UyzCS45tHNq7eH8+C33ljA4Nll6ZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RS56y3w2BRXwujIsG0lYhCWFWUmlPO2EJaudUyNQYf9IyZaCxUWFwqlJ5Pk0PlfTa4JXR06sklEcjp5PAZyzEzdXVKg8BcJUYW4zrlAc4Dcp8aTpZIH8zwRq9ZM46apxsHMsCWt3yZ/Fs9w8TMZ1w203EJmhCkIGloGwYFMa0fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g95C0Zm5; arc=none smtp.client-ip=209.85.208.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g95C0Zm5"
Received: by mail-lj1-f193.google.com with SMTP id 38308e7fff4ca-2f75d529b49so469531fa.1
        for <linux-clk@vger.kernel.org>; Thu, 28 Nov 2024 04:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732795752; x=1733400552; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fwTWwA6azgLnozBWQBgEU2aEg7DOq4OXVVpm7/SKa7w=;
        b=g95C0Zm5icFPawGfuyhIa+KLv+MwhNzbFM1YSsW1F8Bf5DR5/yE3mNlX8xruokEXjc
         9gM6/92l2s6pjxAr8GuUOlCAS47vO7DPTFpwvZzeDzwv5Q3rUams2cp2Zny4M1Yq5dS2
         reuhGFhpyaa5e8ahzzmZgH8KTvQ642ViZCZEZwnX+bVtgURS4j2yW9GwVuSE1zBV0ffO
         fiImHbCqwPGkNZhxYiTGTJpBul0xWAlaVtLcrdRvjZvKCtEN20DpEEJAYoeI50YE1tXW
         YY2UDU9aT3V39nxaI1n5wx8ED/M9NdKK7++ucjdbmU7dtk+JFZAqrlpLwhpSciRtRkFx
         C0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732795752; x=1733400552;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fwTWwA6azgLnozBWQBgEU2aEg7DOq4OXVVpm7/SKa7w=;
        b=B2o3nXXDo7f2vwHWOfOSb+KKthf1bmBTmew4UY2Mtvj++gF8Aw+ooxEbg+setTJVUM
         epIGTbfx21fHSNB7YZwQDEPj0ziTL2Ar+k7M6mCYjOKQesweXU8Vy/JDOknPhltDOOdV
         6knXscBzU3o8G+l864RED58oxhG/J1qgAdTmj7ooLeI7g1BqOKy3iOvvLu7K08JBjsgP
         L3JNhOiMXT7Bk1ukPxTP334kIcNWaulXSp9TG252zM7u6E+B9y5bxpvPARdB8NwruDzR
         7AJAxVdyQxDmQdK+/hsxMG9xLaZ/Lp978AVC2fe/ZzszG39+LT1aYM7zORtiudJ1rx/4
         76iw==
X-Forwarded-Encrypted: i=1; AJvYcCWXr32z0Qji/y7ln5dMm/z1Af66CSSwjIruYubx/cX80zh/jLvjcpg3TJaKZweG30NQhs+dwJEPdvM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTy+uaGa1udoGtAzok4xv3/KlAiWaRhltgxLpdip1hXm/K0eYc
	JxvkDPmcnYgtqzA56c1Z07LlxC1kj5fkO7mJDYe81SdCd0FoQ+b2CG3AFlSzJGQ=
X-Gm-Gg: ASbGncu+K2QPqvNIf+K8LzoDKKfvfuw30CeYq/08LU87ZBIwlKfwHg+wdi5uPS0wNBA
	hF5MVuPupyKTkkbCPOj/4UCzTEirblS6Ba19Ep3vqm2eUx5jvrh1A1SKF59BDPgGYuuN0Tgyqjw
	+OMZ9wT5oftcXWn9ZyQEMQCzHmdy2yF7HMYEp/vKqWU755zN9zKDcLmLpnSgMQoerl/4BxGgrdn
	umSvzMLIkN9PxWzo4VPKJMBLssi6rYGdcUFznpFyfQOezjTI1fEgMEkJWPIli/hkNqP7V8A2xHg
	vrr4wkiy+OVDVfKizb84oS1XEC6n
X-Google-Smtp-Source: AGHT+IGb+CquWGoLlCxlMN54dryp8DwwxL61NpjsPl9cVKA1OdiBA+RXxSDRUTTEFIMowEslwGRMSw==
X-Received: by 2002:a2e:a583:0:b0:2ff:a97d:98f4 with SMTP id 38308e7fff4ca-2ffd60ab680mr9240231fa.9.1732795751941;
        Thu, 28 Nov 2024 04:09:11 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffdfc9bd7asm1726121fa.94.2024.11.28.04.09.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 04:09:10 -0800 (PST)
Message-ID: <a73a3b5a-cd83-4f87-876d-ea99ef8bbd70@linaro.org>
Date: Thu, 28 Nov 2024 14:09:08 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: common: Add support for power-domain
 attachment
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-0-4348d40cb635@linaro.org>
 <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241127-b4-linux-next-24-11-18-clock-multiple-power-domains-v4-2-4348d40cb635@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/24 17:53, Bryan O'Donoghue wrote:
> Right now we support one power-domain per clock controller.
> These single power-domains are switched on by the driver platform logic.
> 
> However when we have multiple power-domains attached to a clock-controller
> that list of power-domains must be handled outside of driver platform
> logic.
> 
> Use devm_pm_domain_attach_list() to automatically hook the list of given
> power-domains in the dtsi for the clock-controller driver.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Please simplify this change, please do not ignore patch reviews, if you
find it possible.

https://lore.kernel.org/all/8a33c0ff-0c6d-4995-b239-023d2a2c2af5@linaro.org/

--
Best wishes,
Vladimir
