Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3631946AEE0
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 11:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845587; cv=none; b=Lf+hEXvcOeyxcQM5Z6y9d7RuwTJpccR+d0IPBiCyezgRD9VetmOtk41YuTdlYQKBFx1gHmjcwEweckutSylH3CIcWNICsbDc6U+YhmfiV20FiKrAh9eWqUPcbQAWWmBJkghKEDnKeRkLaiIugKKGDGpbCI+XEZq84Q+amLu/zuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845587; c=relaxed/simple;
	bh=smt36ZMu0E/3hioXX+dDQB8jyC41lVD6s2fMbH5KKrs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=i+uR6mb+HvhbOf2XyOfijcFQhnKlmb1wU6ZgOKC+40rKUHg4ESMupUZrnbcXIaR9oReQGdINkfoRNfk6RyY3l5CggXYgGBUq8oz1XwdJQ9Jt+9TPrshpNDaH7rl8f9oV1ILqmzuXRsh/Al154giErFA6RrOX1N2AdESFchmXlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j0kHrw5b; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j0kHrw5b"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so547411f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778845585; x=1779450385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pvxma9zQmCdm279DUidXmwLHduEyeRuxuVZscrFTJwA=;
        b=j0kHrw5bDqYP+T8XwHDP81N+FAir8ksH4BJ4lsPhhwffD6kO1MhaxC3UjVZDH+tvup
         NyzqyzTckeYLZcCUjqoboqT1ccqEbZdvpNFQE2yhw0OT5jiFE5RPrEZ+/LFH+HTCtmrw
         U/4oBZf22+aFFgGAJdP842GUN8ulTsKuwFzin1LLZszyG1HbFIN6qM+1HETsKMGql9WI
         Q79ncug+y4T09q2AQpu/mAk/o7dItWT4jft8xviyUmnhAN8/NLzsX3mNLYnGvVv707c/
         6set1woztS7GE8Lqf4uwoyKuPWq0V7ePJydH0V65zIbfjo58gqM88fW+U8bpfR0f1NdQ
         gbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845585; x=1779450385;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pvxma9zQmCdm279DUidXmwLHduEyeRuxuVZscrFTJwA=;
        b=SF46jvPCjLcpTbaP0GuHYFCh9ZbELqajA3xc63DkbbHO8Z0K5+Zff87oTHim45gQKU
         IW0TZnQskF3t/wpHMAMS7ATzIECFa3Z1lCN4AYXbLHoSBRHnQufXRkBr5btJO4HJEoV6
         DTCtV0hSb1q80bhaEfBNF2JWvp6regZxzJfcs61b7xaznlTLFw5JP8+KR4PyD+U+GTCn
         oZ4MWowimPekesNE+ZV7sAl4/E7eH3uPOdN3fABFdE2khoBiolQdN/u5osLDNPDfLYTz
         PHyEYfd7Tfw9a5wjcCc/NJcZ5FHyDa4gfhissZYM0YnQKdrjqaIKfboGXJNIPXkFQ75V
         Dbiw==
X-Forwarded-Encrypted: i=1; AFNElJ8WEH5Vpj2J8oHe0AZtIjk1JSM2flXeL+JCJ+b+dbhF+Jx67cPiZYtYcbbb4LXc9kqhi8MKhIsGXNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Z4K1NaAZ0P5QFtwsBLo8E1eREuZknHYBP0n5CkG7jmZBBYJs
	K6xswKtl+/MjaswmDVst1IFUv2dfIEQvYTQdXvRG5W1BYn0W+QVzfnrfdOHD+n1PIRQ=
X-Gm-Gg: Acq92OFrMewjvLP/gtCn9FJ4jYHIvIbfq/7Pe5ZpIkKyfGJt6MTu3QoBKokbc5ZsJun
	w2KLa7GlHQn/lt53FjJpr02hbZVBgxTWdKhvOK4HTH3SAhrW7Y4BMRDb8fnzIaMkAcVRUEUHZit
	gIRAOvSyRg8DCKcG3z1nmxInemSKcLqP38IYEGTLq9t5u/G48QqE4V384awiVr4Nn1esxU8nWBd
	lw6eNgsP6qycxl6Y/CQAuKxiCnk+bB2bJCpM3B5utuDAeZqhxZqECrnLaRMaNO4L/kEYm29hs1d
	dLPP0vTGqR3hYykcpOq1SUGwymjr1TfhC4F+QMUrOR05bOct9xZZsVxcFiPLRg7eaZPZaGffaf8
	2sEFT96eUxP1ZQ0kxbhJiyQJvg/jhF9011gekv0d0F7SuuTx+yBkVaSbUpjMsNJrfq0QVuzRBJg
	BjMUXbgJroXo35YDGD19mq5/rdLe9M+UKsX6PhnOzl+ik=
X-Received: by 2002:a05:6000:402c:b0:453:9897:76aa with SMTP id ffacd0b85a97d-45d93eccfbfmr12213466f8f.21.1778845584636;
        Fri, 15 May 2026 04:46:24 -0700 (PDT)
Received: from [10.11.12.109] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a5653sm14852612f8f.35.2026.05.15.04.46.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:46:24 -0700 (PDT)
Message-ID: <06c264c2-07cb-4157-aa2a-2502ae1f4bd6@linaro.org>
Date: Fri, 15 May 2026 14:46:21 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and cleanups
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 peter.griffin@linaro.org, jyescas@google.com, kernel-team@android.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
 <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Content-Language: en-US
In-Reply-To: <a4c287df-0300-4fae-8a2b-23e2358fb740@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/15/26 2:44 PM, Tudor Ambarus wrote:
> Hi, Krzysztof,
> 
> On 5/15/26 12:32 PM, Tudor Ambarus wrote:
>> Changes in v2:
>> - collect tags
>> - resend as sashiko couldn't apply previous version. We want
>>   sashiko's review feedback
> 
> That didn't work, sashiko still can't apply:
> https://sashiko.dev/#/patchset/20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355%40linaro.org

the correct link is
https://sashiko.dev/#/patchset/20260515-acpm-tmu-helpers-v2-0-8ca011d5a965%40linaro.org

the description bellow still applies.

> 
> cut
> 
>> ---
>> base-commit: 5e9b7d093f3f77cb0af4409559e3d139babfb443
> above is v7.1-rc1 (signed tag)
> 
>> change-id: 20260505-acpm-tmu-helpers-4c5af0e2f07c
>> prerequisite-change-id: 20260423-acpm-fixes-sashiko-reports-ae28b6ed5581:v5
>> prerequisite-patch-id: 18d89d0e2bc0efe2cb366746ac4db36f4682f061
>> prerequisite-patch-id: e877f865862ee94f5750b877b5fad863d8acd7c8
>> prerequisite-patch-id: b5da16b5c6d6731ea519ed68302fd52ce57c7ffa
>> prerequisite-patch-id: df5b1d9df4c8894afaff645c9eb84aa4e3daeeee
>> prerequisite-patch-id: be74a55583acb36dedca3e118f49633172979617
>> prerequisite-patch-id: 31ebc7bd806d4d466c256049f32e3270e2caeeb6
>> prerequisite-patch-id: 7ea0832fcf76e4f40e18b74083904e7e37e1addf
> 
> While I see I forgot to update the dependencies, I don't think they
> matter to sashiko. If sashiko used v7.1-rc1 and the prerequisite
> patches it would correctly apply the set.
> 
> If one goes in the Sashiko link above and expand the `Baseline`
> (show details), will see:
> 
> 5e9b7d093f3f77cb0af4409559e3d139babfb443 (5e9b7d093f3f77cb0af4409559e3d139babfb443)	Failed	View Log
> 	^ this is v7.1-rc1 (signed tag)
> 
> krzk/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731)	Failed	View Log
> 	^ this is krzk/HEAD -> krzk/master -> v7.1-rc1
> 
> Shall your HEAD point to the krzk/for-next branch? Happy to resubmit
> the set.
> 
> Thanks,
> ta

