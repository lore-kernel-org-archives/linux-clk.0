Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D8E2EAB62
	for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755850451; cv=none; b=FkXxuMQU9iaMAS9fNlGdeZVXITuIa+Huzej1AyncUi7PHLO+qknQkd+fMLMIf4LFO3tDlbtiJZquvprOAQQRmV+8uRSLYUcrcP4pOo41Vfht9ijCgfYsYnZ2Z0QZFS/dQIV1GjpYACtLmwze06riuYjcKwKTQ+Fttibisww6zRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755850451; c=relaxed/simple;
	bh=ISKJzVPXu4k+ZO6I9/7b7/q2WElbo9A+JMC+LqnOasU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dg7fE1NbL1BmLeHdqBtvTuYDgOtFjYUSOZCFf90Wy9bCMJdK13Gh53eA97d1ZXeGiTaFy3t4Bn98IWauVY9ahilVnRA2aErRx+6fXfO1zZoDYUm5DiZcTBj11M5WfJ/qfbPHFJqQQ+7K19yBd0H2kcLsocMZVO9a+2KGeqOUSv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LmdAC+0M; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LmdAC+0M"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-afcb78d5dcbso272401366b.1
        for <linux-clk@vger.kernel.org>; Fri, 22 Aug 2025 01:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755850447; x=1756455247; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=LmdAC+0MOvfF50Fuxs9TAbyHCdTDFlrQIbzbTUQ/F4/qTWpROoYBUX0dRV0vHEnGaa
         G2UdjJqlhQcveJELlToq5PXE/AzlsCnFZhyn0qOlRc57S4YPHuOMzwcLulZkD/K5potN
         ovOLU69OfOXyaZKKiMR4Ko6EQZFs+g2hi0b+MiCjS7mnX9EQneu/mNOe3LaBCtR6MqJu
         G/BFQaqrbVnEGxDpJtXbI8PiHN2nfAsEUWraAEfcKLrOd8JMtgBB4zJuITnTXcUDZZZ8
         laSRZFzGv003bbnZ6Wi5ZcR7mnXjq0sOf7K8yMbBpwuE2woAao252VKl6EINTL0uh43L
         cbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755850447; x=1756455247;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPvTo2XEETbDk4TcDNA4R7e2eQHtVrkf9abfQlGJ7VI=;
        b=rCA+25vDtuNyqNWXt7fOvP9aWLddvzpxInqLJ5KFwuWc3o00ZkT8t0HSTcBYdTWa7T
         GLNwKrWgxepnVLxzUiAySxcvxDz5BmMxKNnnQlcJE+cheaS4JYSZiukGIlIslKi9dUj2
         KUt7xD9P42leJ4hSAgBtAD5rxjwjWMG7tpMNHXboiZq9zzTQqofsCTtnYnO+clCECd0Y
         YIPUFDkJ/05l05k6tjBjtlpE5spmveIVJqxsrWwEF/l72l+kzG4L1TOdDtm2JGVV5Jph
         tX+JHzXgbMmiaxIkPknxzTOob+rRoan4qAGvm2GzmMq9u455P2o0qr2Qa/liBBpEDJbB
         44xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUl+vUm7NLE6c1HqaszFenF0SSKJDn1EtRF6xKTgkoVPzx/Uccek00XSN5KlLS2MqBgEKYjlVO5Elk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8e4MPhWOcirlsg990BGkQst15YgHMnhdutWF+bFVKYu/fPRn
	HuuNEKFPhlUsGFWVesHF119wPb6opIXgvSuOpUdB1Jh6Q1Ug4fGzFeQM2otCuRuYLI4=
X-Gm-Gg: ASbGncuMf/4/fo5e/P8nubwLbkw7TrOVmV8WOIKwdZqHS+esM5bscjLx/R3KbTlOY/h
	Rb7qDi9DRovOzNMWiSYgV+1y0U8EFHcZXjT9zk3V/G/qhx5id1s7EWLquOUIX7nbxGbgWLJoZFn
	wTwwH2vcrQYFuSnbj/WlH2ERWiDSw1v20VXidSOn8wQjuhpAR0CSRSecCbeOAZtlAPxz3sdUUF2
	sTqe4vgsFxDvNmcTubbHwXoJ1wIjNliQWnfrSYnvMcumC/jkMh1iTYZUI/CYebK5C9G6mqvnkF1
	IXrbBFNRg+6BWF2mKJlCVbIPEfu/HqxCtkNXwFmEDZZ9ENqICnhYOmDxjqxe0wmzwVjz8zt2dBw
	i4pJARPI0zbYQvdUTFooDJX347SMQcd/B
X-Google-Smtp-Source: AGHT+IEGEVoS2KNiJz+rap9NchIlTHp1e7qqv0SERyT7o+gtgwKhQP2IflgiPn4RYqUiBzAj2fr7cQ==
X-Received: by 2002:a17:906:6a1c:b0:af9:9ab0:6f3a with SMTP id a640c23a62f3a-afe28fd7ec3mr185456266b.23.1755850447341;
        Fri, 22 Aug 2025 01:14:07 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.104.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded309ee8sm559576366b.27.2025.08.22.01.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:14:06 -0700 (PDT)
Message-ID: <720799b1-04ce-46da-b643-1adbdfc661e6@linaro.org>
Date: Fri, 22 Aug 2025 09:14:03 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: samsung: add Exynos ACPM clock driver
To: Brian Masney <bmasney@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Griffin
 <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, linux-kernel@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 willmcvicker@google.com, kernel-team@android.com
References: <20250819-acpm-clk-v1-0-6bbd97474671@linaro.org>
 <20250819-acpm-clk-v1-3-6bbd97474671@linaro.org> <aKdmurrT1pFtLSI8@x1>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <aKdmurrT1pFtLSI8@x1>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/21/25 7:34 PM, Brian Masney wrote:
> Hi Tudor,

Hi, Brian,

> 
> On Tue, Aug 19, 2025 at 11:45:38AM +0000, Tudor Ambarus wrote:
>> +static long acpm_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>> +				unsigned long *parent_rate)
>> +{
>> +	/*
>> +	 * We can't figure out what rate it will be, so just return the
>> +	 * rate back to the caller. acpm_clk_recalc_rate() will be called
>> +	 * after the rate is set and we'll know what rate the clock is
>> +	 * running at then.
>> +	 */
>> +	return rate;
>> +}
> 
> ...
> 
>> +
>> +static const struct clk_ops acpm_clk_ops = {
>> +	.recalc_rate = acpm_clk_recalc_rate,
>> +	.round_rate = acpm_clk_round_rate,
>> +	.set_rate = acpm_clk_set_rate,
>> +};
> 
> The round_rate clk op is deprecated. Please convert this over to use
> determine_rate.

I can do that, sure. Shall I also update the kdoc for round_rate(), mark it
as deprecated and add your Suggested-by tag? It would help other newcomers.

Thanks,
ta
