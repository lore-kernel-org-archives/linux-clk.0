Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A8026FDA5
	for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 07:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752563961; cv=none; b=CbSxZ5NkCpWD9nM3jkN9lIDXa4/gNptL2z4KMyM4swRF9Zeqw8mNdzT4unh+3DSta3U+460qBXeHrDzkxL0fR7+NLxTiVpdo58ManD0nsWzC3ChK7e6e1pcJve6PajKsRMS8hq6JR6vd7hsVAWyuuaZya9RY0YG/EW8nbzlhVmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752563961; c=relaxed/simple;
	bh=dOb9Epf/TTGBkZ5gyzcRhX8nkY6+Xl8serOtV4krvFA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK4XKTawYRjooovx1H9ylEyUrB0jwGbM8bkQQSja0rd9tk960s7Fza8shOJqToxqohxmhDgEtJAEJ32sD9+dZA6VX0Uss5RtKn6YpMkIMsefe0Ej+/UDuf77EMtxR8Cgd1ky+UD6gK8IuTZ2VINP1hYEaf7Ns8U3bRkil+ylwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IL2rJNoA; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IL2rJNoA"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-558fd84fd59so752682e87.0
        for <linux-clk@vger.kernel.org>; Tue, 15 Jul 2025 00:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752563956; x=1753168756; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RSJvNlWoWjahN3C/yzd7QKoGlsR79XtnIfFExv1q1o=;
        b=IL2rJNoAuObhJpOEXDT3LhkNDxmMhFUZ7SNrXTUXbt4B9rRH9lFxisWwpr8rdpCiNa
         8Csr/zifh477uqmedPTsrXXIXE7ccOJGq8zKr64UaI+rD7LfXsBKoNTuTq9MWRz8slBa
         wZEWkyetyjLKsMawGfOMjY6mLKtr9Os3f9mbs06g36XiJL5NBiKPwLLkDAD5Xlb2QUyA
         zf0CCiahELywgUIWfzdZ90jX1k8NUAg0SwspWRijGPQomLIxsqwn3wLm8opWpJTkXSIf
         FPi9IKN4yxMCrG/9lCgq1IX4AOkvYr/lRflj4s75DZWgg8JMzctiitEBQDdWX4q19rJ4
         reqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752563956; x=1753168756;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/RSJvNlWoWjahN3C/yzd7QKoGlsR79XtnIfFExv1q1o=;
        b=mYBv/Ub5e/AuhJdSSyR5rZJn6pWqEhMu5CEpYd0YIHkO9QAAaZQPCdVa3YtYWneB8T
         IHofrdgMr1UMj1pycsJA6Hd6yXFy4tM7Rv/luv7KzjXaAKMRMOd8hLxrE+hUEd9palnD
         qj4wExS1+oO25ojeAYaaeN8sBFa0ZC45djdmtmaFaCtsD+ejylLnfM2E3/BTIRGV60Gt
         DxYig5FkANxyeTbNH75YnNaDbUNajEkscBrjC4QWPKXvxTx5Z9/hOsj1v2iOS+9vFICR
         KfMO21Q3n7FPJVGb1eBG44BITZj+q93ROW6VZIw+MYjRE4UzcsjvmdoEL70NpFnxDsH+
         Qcsw==
X-Forwarded-Encrypted: i=1; AJvYcCV/ZrXucUT8NQNPCLNeh2Qw9t4leSSogyHg1fdSCeAhfwGehj8Bp5PrfUWbjhx69ZQBU0rRjGsjI6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz7Mxce1cadhbD6xTHlfcJk2ozKwgjK+ecdW+6TLsHhUMxVxbk
	At382I7v7d0iCClYByrs9brRZ1ARZkNAqFNGH/NyCGoZqBTVSDv4v2nYJfVci+DLLWQ=
X-Gm-Gg: ASbGncscqSWM7UJqkoDIo1rqrveUQlTJ5z6uSQBs23tC5U23+mIz7x26BQCkaxHq40L
	aXi2KmjW3SA8Gqvc54cxK4ZyY4S+Jr4VONFf+TMKj5WBi9eu2tpbdNnjwjzhAFrN6l+W75r7hL4
	r3rziH2cfMvJ1xaXlqIJppfSnk6U97Xv3nBPLW7T5R035fSus90Aa2pVyHvY0cVtut5e6jcIk2G
	pmnH4Suu3/K8JK7aSuv0LS26bVGXWH6tMlsFdYlen+Orjeh0pFX7tqDbke4HZwpLeqh7AkUuu2b
	9DvEgjJHtFJuryJt1+JA2pW008bf+Ogs4BmJAJaUyx5PRFPRBgFw7fbXrj6TrLiDeb/VQoptB5o
	OzHwFFMzScfVllqxLVfokcSvGxC8+onKAxVEpsRDMXemJ/4ph6Sv17Y32AL+NAFnrXsEr1VgO/l
	aS
X-Google-Smtp-Source: AGHT+IFIHphgOuWL4hHbYQo8BUYKQWMRs2PJ8O0o5nTLr+EyV7m9/xz8o904WRm6rWfLBy+6fENRug==
X-Received: by 2002:a05:6512:4027:b0:556:2764:d207 with SMTP id 2adb3069b0e04-55a1fdce413mr78512e87.11.1752563956166;
        Tue, 15 Jul 2025 00:19:16 -0700 (PDT)
Received: from [192.168.1.100] (88-112-128-43.elisa-laajakaista.fi. [88.112.128.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a05daa619sm1688569e87.41.2025.07.15.00.19.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jul 2025 00:19:15 -0700 (PDT)
Message-ID: <bd7cab62-f0ba-440d-8dc2-3304afe884df@linaro.org>
Date: Tue, 15 Jul 2025 10:19:14 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/15] Add dt-bindings and dtsi changes for CAMSS on
 x1e80100 silicon
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
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
 <9361e954-e2c9-41c6-be4c-12b0e4f367f5@linaro.org>
 <5f3b2bda-92f9-479a-9af7-5d08e420121d@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <5f3b2bda-92f9-479a-9af7-5d08e420121d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/25 10:01, Krzysztof Kozlowski wrote:
> On 15/07/2025 08:53, Vladimir Zapolskiy wrote:
>>
>> 2. The whole new changes for legacy/new CSIPHY support is not present
>> in v1-v6 of this changeset, it just appears out of nowhere in the v7,
>> and since it is broken it should be removed from v8 expectedly.
> 
> 
> Why? If it is broken, should be fixed in v8, not dropped from v8.

There is a conflict between these new v7 changes and another old and
still unreviewed/uncommented changeset, which provides quite a similar
functionality, but it has slightly different CSIPHY device tree node
descriptions and their connections to CAMSS.

This technical conflict should be resolved before making a bet which
one of two CHIPHY series is better and should be fixed in the next
version.

-- 
Best wishes,
Vladimir
