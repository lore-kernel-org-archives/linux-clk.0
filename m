Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C59D634E9
	for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706098258; cv=none; b=U2+QE0TMXG0COp9wmc9NT4mLxbrpO9U2ZW1nchfdLWCZWoyeWPkCVE6wu/HhDFcJFdlOitJ5htr5XfTRYCSS8qIr7M6JmX20ataRzqjMN+KvqdUPjdx8mN0x7ifWThB81tS2b9pngd4ZWNH6+1JBhrYHd0xlw38MV0e0B8rr+F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706098258; c=relaxed/simple;
	bh=hBBe2xh59Q4+C63aRE6jewMWx0A0Jwfw4ICW1/4xxvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=doTh15F8sLphYshU8CMeajfhVazY+HVU64GSeIvaShbqM4DYinVJR1QaLT4wo5f7OmJaHhQfbhf1fndaON9u6/lH41JMDYcwLXjju0NSBZptE23QbA6DR2CIABhEA5gkT6OQib31PVS5XOCSQoKKk3Ja5fDFlQDNOEKOP0gdDtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTdGRbzQ; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTdGRbzQ"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2cd0d05838fso64001081fa.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Jan 2024 04:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706098255; x=1706703055; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jxqLYnJl0Q8qohdE/H5PX6zIbzKF8rVClXxhczfIt+Y=;
        b=aTdGRbzQ0IzNOcCw53gXx1ONy4dFroCtZUnBDZ/1TO01/PXtmHhwT4JlaFSPKR51Sy
         BkECo2AEkDzNhZicocNjDKZr1iTgq95p34vHI3Jgw5Ek7uTu+gpL7K6kfDwtIRNjlwoR
         jiQmEF8TevNI3MK9ehy5rF7QVzS/DtqYVCuVQ18e5q5snnh/zvUcABiD4j1zU35wdOWW
         XcFXgxcVZXeu3uyIH4MXyvjSSCKFLekxR5A/HKdZpBDlQZm8qOIprThZT8IVKLJvNDrt
         QChnb5bkk6HeAT/qBqtcOqXQ/od4HIO2g8XWWnt8C2fs6YSPMQ20SA2bM71JvjRKv/Ih
         NRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706098255; x=1706703055;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jxqLYnJl0Q8qohdE/H5PX6zIbzKF8rVClXxhczfIt+Y=;
        b=eZk6pUjajvAx7jYdBFWwjlnab/vJ0imwPI3uXspEEEY+PCvoWlYZrlw1Ck3Yqwal2w
         Bpu2f5O3TP5Q7fofgmSCFXdCb6vnViY4iJViM/MVP+9Vv/HB39444Mr5J+kQfj5FHCzg
         /J3DcIWanbHdlnwsbQVhIodppLX0Xsvps+8jYaWi0hMGNF5x/PFXUh7927069nsbKkIf
         8WJcezRU8BzP3g3i99XJLlgRimepcR749QBieiMBT+lqhEAWGZwM4NUnYTIPECEXczDr
         p6MB9DDLQpsZuNKAF+GEqWXNj5hgOcs+Jrm+7m8247gxoi+0j+1LmMueImYKBtpJHN48
         yl5A==
X-Gm-Message-State: AOJu0YzuG1YX2cBEFM5q42W9V/45WhuApBD4MY7WDzdhsnnzVtOgMkiS
	0qxnSg5MrS+52kiP1HvWQRp0AJflocRYIsO+88rpga0/52jboUzJkoAwkpaiGog=
X-Google-Smtp-Source: AGHT+IEaLmOyU1xEoCIKY6SDGgPvE9yM+XwFW3GAikfxY2Ntww+EkTI1EUX72zmAXJwNZw0kGholAw==
X-Received: by 2002:a2e:87c9:0:b0:2ce:19d:211a with SMTP id v9-20020a2e87c9000000b002ce019d211amr681590ljj.62.1706098255309;
        Wed, 24 Jan 2024 04:10:55 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id c3-20020a2ea1c3000000b002ccdb771df0sm3869539ljm.108.2024.01.24.04.10.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 04:10:54 -0800 (PST)
Message-ID: <5192c3b1-46fd-455d-aa67-b05bf5c54e19@linaro.org>
Date: Wed, 24 Jan 2024 13:10:53 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] clk: qcom: gcc-msm8953: add MDSS_BCR reset
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>
References: <20240123-msm8953-mdss-reset-v1-0-bb8c6d3ce897@z3ntu.xyz>
 <20240123-msm8953-mdss-reset-v1-2-bb8c6d3ce897@z3ntu.xyz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240123-msm8953-mdss-reset-v1-2-bb8c6d3ce897@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/23/24 22:03, Luca Weiss wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add an entry in the gcc driver for the MDSS_BCR reset found on MSM8953.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [luca: expand commit message, move entry]
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---

I found some more definitions in lk2nd

88:#define  GCC_CRYPTO_BCR                    (CLK_CTL_BASE + 0x16000)
106:#define SDCC1_BCR                          (CLK_CTL_BASE + 0x42000) /* block reset*/
125:#define SDCC2_BCR                          (CLK_CTL_BASE + 0x43000) /* block reset */
150:#define USB_HS_BCR                         (CLK_CTL_BASE + 0x41000)
155:#define GCC_QUSB2_PHY_BCR                  (CLK_CTL_BASE + 0x4103C)
168:#define USB_30_BCR                  (CLK_CTL_BASE + 0x3F070)
189:#define USB3_PHY_BCR                (CLK_CTL_BASE + 0x3F034)
190:#define USB3PHY_PHY_BCR                 (CLK_CTL_BASE + 0x3F03C)

Couldn't find this one though, did you confirm that MDSS goes off
when you assert it?

Konrad
