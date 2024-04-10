Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EEF17BB23
	for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 17:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712771869; cv=none; b=inffnEImCJ5LEMt3qg0MR6+TJwJS9dwXH1TF/UYLuzJ1tlz+ZVC1xsaI/xInVoJVxnPvt70GwAuDxCMTp1LRf09JEUIDUc41KpLXlb1y3f7Nz8xtu98W5sDvzxhOFzW7e2109Mb58bSXv6COVawoobVtSETYEfqFs9v6l6tDN5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712771869; c=relaxed/simple;
	bh=KSSlk8bsMALzU4aLOuDQa//L0banKdQVAiOoA5qSe4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=k/8S6vrzBlhL/6JARzOOa7XoypmkQZ/GCRdENcOgm47eRNdH1BKGYYO+JgGPWcDhT7Yh9Usi0PPNDwJzV/D3VM2Ge6br1FMkPRmFAliBGMgVq+CGmYpwWpllxv6owewb5LoVH0x3hJR9kLg6VTzqeIQRnxKbH4ISHeHhycZ3rws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZnfKzdLO; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZnfKzdLO"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-516cdb21b34so9035538e87.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Apr 2024 10:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712771866; x=1713376666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VriGxSmeAMrd0HbAi17rP97R4YzqX84RVPW8DEU7SU=;
        b=ZnfKzdLO/4IMEV7kbHAfKh+shAIF8ik3U6tXW67i05NSKi7M3bUYX8rRFTiXyp6Cu7
         0qzdsvqZ9Ctrq/qyOlrVIW+rYJH7+5e1rodVxsJtjJo4/GfDpJKlBtPp3bEwRkoGN4/z
         RyZIVhsMuyefSQ0WmUCDtNVUF3VnwNF2FfJJlH+BnBA22f67HW8k5MUadV8u3S4m/2I1
         2v63R6eQsqWp5TvKC+9PHpohjb3ntEyV4Q9XRhBMpQ3WIJTm6uKDBleGXBVrtN2QnPCp
         ko2i33Ywibxalei5L/NuQvJzaWGJdIjQDjL9wE/YFzvG9gtGOOQgT/VXJFY/35eqKBPX
         KomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712771866; x=1713376666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VriGxSmeAMrd0HbAi17rP97R4YzqX84RVPW8DEU7SU=;
        b=N0AtURP/YGZ7ZpmfuLy14z7fEEM9myohxJ3H5BXBwF2wVwMg7aakgyKmGEiR0cUzGg
         i2O+ugPw0cTxWwmyYTYLBg2Em5drrMDd1ugNkP8g+lBKdmQfGDI2htO8A7Xr4Giu04Fj
         SxgL1M9PtPgJvUW0ZJblfDCqiQw/keSR9bTVdx2k54WeAzuvYo5V7VOK605Zt3PW/yLW
         CH4RztTmChBh5Qz9tgxrFV9GnY/fLes23/l7Kn6STsw4U67Mmy2WBN2v+ZemAPzJXb7o
         MDzC6UMyRgwF70BjPA0QhQaK2mLCVnGc9R5TexTFdxSPYMzwlrIso5rXJEQ7VIf2s+Xm
         NbhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQCW61bBfD+Em7tZAsNkxIJJh7NcbXQJnydiBzvKmKqwWB1bF1oan6vC+stCGqXM5Z9mW8EnDJgcXvZL1pIZuUqChMgGhQp1k7
X-Gm-Message-State: AOJu0YyLxGxfi1GubC95moujXj1FQo1iyiu5pnDMNdTpBPozzmmQbXCx
	SWp10nAnBbfqe5c9Yf4I9t1KmYpOpbIn4NOwrOH+SWTNij8q0TrllebMQNqx5lc=
X-Google-Smtp-Source: AGHT+IEMn+7QOBZoSPpCqOFaNsmBHfuxXi2Pq5xTIAsOtgQ9XvtVpkTgTWFxslo2PrKeDv5iStEd/g==
X-Received: by 2002:ac2:4198:0:b0:515:d1b9:3066 with SMTP id z24-20020ac24198000000b00515d1b93066mr2133456lfh.46.1712771866030;
        Wed, 10 Apr 2024 10:57:46 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y18-20020a196412000000b00516ce0257a8sm1915241lfb.105.2024.04.10.10.57.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 10:57:45 -0700 (PDT)
Message-ID: <16bba953-d6f9-4701-8b95-56b3231c5f6d@linaro.org>
Date: Wed, 10 Apr 2024 19:57:44 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240410155356.224098-1-krzk@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240410155356.224098-1-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/10/24 17:53, Krzysztof Kozlowski wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.  Clocks are considered core
> components, so usually they are built-in, however these can be built and
> used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
