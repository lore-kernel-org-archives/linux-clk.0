Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51641993B9
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 09:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729590828; cv=none; b=kGL0ByqhVgEJHasN4Pkt5P4BfWSIU8DttryXKUDvEUsTrykbFokX4NpRTKY9WZuAccO981fWnboNAvBXxIG+P6b5uS0Xbmjp1HOxBGfTee69KBtBUavMdlFhdl8C5UBsXBEc3rfn2mrKwU0ZhO2SNs3RWQAQWcPX84GV/Ocz2TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729590828; c=relaxed/simple;
	bh=Y46DtbVTP0E38ObjD6CzbJEhXZgRp0JJH6MXGub6VHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTafKmgGOLPj21xIsY31XyPJdk38XyE5r4sf5iw1G54oQohMKupx1ZrCDsIuAvklk9a+I5xq2ZnfmlZf2JIcZpIEZvHO0g63pyIFzVD8z7mYCtJvKMGk8StphphZIrRSTjvcEDl8KlPb8zt4Np84vHtkPF3Du3mEBiV2J4W+/wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie; spf=none smtp.mailfrom=nexus-software.ie; dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b=NZ4YvN2P; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=nexus-software.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20230601.gappssmtp.com header.i=@nexus-software-ie.20230601.gappssmtp.com header.b="NZ4YvN2P"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c99be0a4bbso7267398a12.2
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 02:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20230601.gappssmtp.com; s=20230601; t=1729590825; x=1730195625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=op1FRSJCS1vPXD/9QYtg2XAEFEXZ1E8zhO4zRpuc9J0=;
        b=NZ4YvN2PeZshISEcqNa3Nlg645xxyP+W9AWrRdUOsNeaoGle4GtDXukfoXNh0070xR
         zQMr9ms7/Zqtvdyrb0uTTgmVHfaKUWi4g9z10P97X0S5XozstAZEwNEQUgXqsjB2O739
         52hiy824yC2Z5CDXH3UJO7t8xtA++8YSYkYIOOSUqur5smrdeRyRfBTBsGreOpcSecd2
         ahiL6K4KM7ii8d6Oj7bjaO5AbvUXs7lIrbCFpFMSTyonVYYCLE6kQ/pPu7/oYZOJUXi7
         N+HS2hpyCZTYgEpGjwnSwCLgFNzVw/djOusmZJk3+rpoEuGN/2LXSuG3dju0VDpAb6mQ
         Dr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729590825; x=1730195625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=op1FRSJCS1vPXD/9QYtg2XAEFEXZ1E8zhO4zRpuc9J0=;
        b=HlU/gWDsOuoLLkcD8vfod+czE6NtULCPtt4gsod/z6JGz/TRJFXChFUtLqA/8h/cXg
         M3h9gVsGFy4xb1pEQacnPKgGO8NEVgZILx7DGd2kQqvzZpO64pH+YXURzeJ0IEi35kdp
         zaoNjj/zNDwyQUIPo3aVzNW4SyoMjW6T8+bh48/V1urRIlre/+bMMcR76LZwjzVIJGPV
         orxuKSf4n0x4Dc1HAzxZpHEq2cfmTGWTP2cP4aNsmh4QQl5+1e0M1gI6HjvqcNvPBVIk
         3hS/5Qp3YV8MnYI1hk/9w8EWBbgL6hrYjhzvyt2IryVxo9UMCDxBZk8neoXDLPbkdQA6
         62lg==
X-Forwarded-Encrypted: i=1; AJvYcCWURm1cuwZ6WWnXiNMQhIe9K02QNMXG5qPhAbpp1X3JYy29J9WLXQMgW6ubfdSXXlGoiq0OdhBMm+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHtMeFZ8HoxOfFdzqKpJt6OTZjXo0y98XQFo99n92ebmNavT1R
	YR0qjc4sFRFxJwStMFHtR3c4ZOBKVSOEZJrGon9r97WdalgP/ncbMgJ/f/AXZ0J/co80dD++sSC
	I
X-Google-Smtp-Source: AGHT+IEcLQwkHk5o2k7sioZOXKjv6teIn45f2gmoiG+SvQugsEWBRSFoR1zkrhOzSxxQycfl1GyexQ==
X-Received: by 2002:a17:907:72d2:b0:a9a:c82:d76e with SMTP id a640c23a62f3a-a9aa88cb1a7mr251886366b.12.1729590824875;
        Tue, 22 Oct 2024 02:53:44 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912f6644sm313292666b.81.2024.10.22.02.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Oct 2024 02:53:44 -0700 (PDT)
Message-ID: <8ec5512b-a8ea-432c-84aa-f920470c056d@nexus-software.ie>
Date: Tue, 22 Oct 2024 10:53:43 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-qcs404: fix initial rate of GPLL3
To: Gabor Juhos <j4g8y7@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Taniya Das <quic_tdas@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <pure.logic@nexus-software.ie>
In-Reply-To: <20241022-fix-gcc-qcs404-gpll3-v1-1-c4d30d634d19@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/10/2024 10:45, Gabor Juhos wrote:
> The comment before the config of the GPLL3 PLL says that the
> PLL should run at 930 MHz. In contrary to this, calculating
> the frequency from the current configuration values by using
> 19.2 MHz as input frequency defined in 'qcs404.dtsi', it gives
> 921.6 MHz:
> 
>    $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x0
>    $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
>    921600000.00000000000000000000
> 
> Set 'alpha_hi' in the configuration to a value used in downstream
> kernels [1][2] in order to get the correct output rate:
> 
>    $ xo=19200000; l=48; alpha=0x0; alpha_hi=0x70
>    $ echo "$xo * ($((l)) + $(((alpha_hi << 32 | alpha) >> 8)) / 2^32)" | bc -l
>    930000000.00000000000000000000
> 
> The change is based on static code analysis, compile tested only.
> 
> [1] https://git.codelinaro.org/clo/la/kernel/msm-5.4/-/blob/kernel.lnx.5.4.r56-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L335
> [2} https://git.codelinaro.org/clo/la/kernel/msm-5.15/-/blob/kernel.lnx.5.15.r49-rel/drivers/clk/qcom/gcc-qcs404.c?ref_type=heads#L127
> 
> Cc: stable@vger.kernel.org
> Fixes: 652f1813c113 ("clk: qcom: gcc: Add global clock controller driver for QCS404")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
It should be possible to test / verify this change with debugcc on qcs404

https://github.com/linux-msm/debugcc/blob/master/qcs404.c

---
bod
