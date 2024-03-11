Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A676756760
	for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2024 18:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710180495; cv=none; b=B4ynbyBAFtDpDV5mdAy5e7Qc7hktwNyDVFwZbcqsugmIpmSPjg2Oiw+/qMkVnyoSH9MhF11ArPxtLWAshJuQviMRFapvVfR3nx5d9wS8Xarqhk0bvNtZvawSAOwSFkeM2VeZf3mTMmSh//MFiVr9TigxMtBXksuPmrRF3MvbVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710180495; c=relaxed/simple;
	bh=Cmko//sBJYEqC6CF+c84J08C8jz6SB2p1fGLA87CQjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XJmTDGpKtdr7FJ7Mxnt6JHtjt0fCtU08xld+Bq+VMbtKSiPb2NpHW6aGQXAmJ1hZDIP7kiHZztt3nKIAMedQCPRCD+YC24yWyqRgC7eebSwAaIQ6quYSv1VIPc+rAmeWQwRTYsZrGHFRWyK3WI0a35tAqqc4jfi2Fhei89dOYY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Uo9vuj8g; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uo9vuj8g"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51325c38d10so5617802e87.1
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2024 11:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710180491; x=1710785291; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GdAvpgJ6KgtulG4GgWKU8j8WvSWhLjlXYs9zNUw6VUE=;
        b=Uo9vuj8gwrHx/bvSppMS/FxpZC+4jLr/WPNPa71Okf6H5teaCrQc1XixnzJgm/LbY9
         07zyHy14VPNN2zNpgb5m+189VFhfHAgC4zu8n5HFgpnphTGOR9N1LVsnc8acLCPkhSAT
         LyLY54BBFjMYpvD+eVa3tx6Hah+T38P132/GE5ffg5ZaBNE5OzRFPwdNMpc2PQtQUKrC
         TkybuDKbDfx3FG8FGImwaniKNUPlBELcrMHY/7eVfAfOWd0LEyGoi0H7sH4cg0hnT1J1
         i0sBHoAg3uQsACWRCmgmm5s5VmFF/zXsR4AFegH5UZKiNhpChWZAiErW4Ud0CJ3L0QA5
         8HaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710180491; x=1710785291;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GdAvpgJ6KgtulG4GgWKU8j8WvSWhLjlXYs9zNUw6VUE=;
        b=wb8d9qivQBqotHQ0+PSsSauryQRw5KPMBMbqBVIykvvpZFrdvWdEJ29KQgDgGQh0rs
         PJCty6Zb8fJuQPIWwLtqCpLjrqvGmPPvKJf7y33ND3isr5TkOLfMX0hTHehzl8x6L9bD
         IVjHWBAKcPPQEWXtlss/zWeUro9zEfkIUIplI8pGaRu4ciTXJC9nRR9G+WMfQl2uceUc
         hD6fSUherWLzEjrGylpVTUQ9Sbo2PkBh+5BCJwiCUkE2CNk8fuOlyqMxZRi3+/ZN4//2
         Xt2dX8Ktv350/qCEMRNilBpiwmp7LGSiIJZRwtQ4bMR4FXFiOmOdG6JzXWCBLRVgr0Lz
         PZPg==
X-Forwarded-Encrypted: i=1; AJvYcCVeNgSoJY8/nL5tJF4bdIGp1a9+OVZC9SIRSdAscmYRUJ0lN1EF5w48hPgQSm/DE9ZSgi2dPM6smn/hmV6Lzva3nFJSxI3/DZtZ
X-Gm-Message-State: AOJu0YzItHNF9QcixiHqJqMyj+BaY1XoYRBIVl7UJ5OX6aDnAFacxGQt
	9a3NwNRDukTTkqhcPmQ8nx8o+aMdbbXKz3nGgkjFfuffoRbSLmrFldUlMC+UU9o=
X-Google-Smtp-Source: AGHT+IGWxtUfvowwbYHZ81ILlBPneI8LPDnoaGfZGl2zcauoCYrxYCX6xPC0K5XwQynu0RSwe2iq1Q==
X-Received: by 2002:a05:6512:476:b0:513:9be7:7112 with SMTP id x22-20020a056512047600b005139be77112mr2399808lfd.29.1710180490668;
        Mon, 11 Mar 2024 11:08:10 -0700 (PDT)
Received: from [172.30.205.61] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id k22-20020ac24f16000000b00513b61bc392sm11724lfr.2.2024.03.11.11.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 11:08:10 -0700 (PDT)
Message-ID: <e19ca61f-894e-40c8-86b9-dbd42df4aa46@linaro.org>
Date: Mon, 11 Mar 2024 19:08:06 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: camcc-x1e80100: Set titan_top_gdsc as the
 parent GDSC of subordinate GDSCs
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Abel Vesa <abel.vesa@linaro.org>, Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240311-linux-next-camcc-fixes-v1-0-d126ae0b9350@linaro.org>
 <20240311-linux-next-camcc-fixes-v1-2-d126ae0b9350@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240311-linux-next-camcc-fixes-v1-2-d126ae0b9350@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/11/24 01:33, Bryan O'Donoghue wrote:
> The Titan TOP GDSC is the parent GDSC for all other GDSCs in the CAMCC
> block. None of the subordinate blocks will switch on without the parent
> GDSC switched on.
> 
> Fixes: 76126a5129b5 ("clk: qcom: Add camcc clock driver for x1e80100")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
