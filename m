Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D4A3DD867
	for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 12:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268063; cv=none; b=kvbd7RMCm3DyDBG8/GKfHL3fufTgoU3MRRab3zWpBi7Lu8xlBBD59PNplKWFC4sZ7v9IDIDqM+nI3Dtl4PsR709lU2L/Cnb6cpSHLPAjEqjv5U6NKI9vRWnKan8raRz8mQMYVVYGO7A59DedeuKkIWWW8zAUj8nLE3xZpvgudvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268063; c=relaxed/simple;
	bh=Ju5wslSRsvwhk5WsIoCvEoMVc/9GYY2hK7MaGnkp3m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EhIocw9KZHb2faHg8WjEvLyOSHpPSqlG83ZhVX/RfVjoT/WSXavyqDrFs+MA9SOv//Mg7aoZLq15pWuFxRx6w2pYArxNMeeBgjYcyTXl+ZfCIxPTMLgWl7WT/IbdjjIfm61T3aEZvUV4BWjCBYdrilaZuR2wJlIKcXncxWm4hwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0nEZuJJ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0nEZuJJ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3991fff17f6so366381fa.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Jun 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781268061; x=1781872861; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=V0nEZuJJPBZEVohcRey7+kwB5rD/pDgVhUguGCMEZIPSJGhaY4KORyBlbr/uXtBasC
         Yq6nggKWLrKq579Es9QD6Rws9rEqvDDHz1UsfSnZJUzgGsibIV2RxA8sW1ReB3diKDGD
         LM5knXJheYf47JplRUpNG7UV/gKhEE41qOncd7VJef8rNGSZJMYjNaK/QkWvlpq+Ur60
         c4xTT7KsjSEtM8Q9hKNnW2Oj4c298HP7i1oMLyg2u30U5xjcjwMfGl1Nw2TEK8Vtf8Zn
         MfOYFixdfYzK++oJVmtoL3UGbm/RjGTsVrdl95qDApisCkWYWQbhvQFrdUZdmYq68T2w
         +jIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268061; x=1781872861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U6qY4NpZ30oPzo9/fz3bRiZ7Tbc8aHKKwIffAI9M1Bw=;
        b=DXUlh4Ozfhb0C7DNL4QR9CuPeMSb/qGMhE0WUrG7wL/KwD88MmAQkFllogJPmMDznU
         e0477KikjBtAXrSu/4p3tItzf0hb5GVyPH4B0zC7YrMmPNWLA+Ex/J29jfJOdHQf0HNZ
         rTGPf92hdjYfQSB34GOtk+GLzg1A9cr+U3xgpe4Vklt6LNnuR68//HObjm3ZvT5Sk2+Y
         Nom074i8gRzEiBK1/IXNnauAhrG3xhiW27uLBlwFuYiMNuAaVIyK9SqFm1mW4SJ2NQIr
         51m/lxAu8ed85MjGF4106pDvOKJsaUl/RIsVqdiLMreG/7MXrSeV0iyGXIOTLYapy+vO
         cdXA==
X-Forwarded-Encrypted: i=1; AFNElJ/t/YZZD88XKWcmpUJS12bt2EL9OaGRTFMES9zTnkz4DUpUkPRsoAoHIeMFb0jNnp4rbxc1KYDkpYs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMCtxaEGlWhTyo7skF/3pYUJSvSEfrcr/WWuId1woBJGocjVEw
	4cIhrQwL9jj0FbP0cDBWvTLQoHCUoTDlURrdTKu9lPesBpF9O9cwxpiQ2zUj1DbXvy8=
X-Gm-Gg: Acq92OG52F6IdRA3HiHRFssGOu1uUbDr37qxHdtGihsQ1VTKVvD0QE/nGaAJ2lYQhHX
	B8q1lnJjXN8IPcwGPic3EFWITLeu2iUwvLxHYPLsUSutzXPIZ/yB32SNqdOEp+XysTONcu+gBmF
	WDX1lrEgIuQl2eQCAnMDmLPVXEFaQcxqe4Y0cH5NWXS26eDP5+d6g2eqQPkkPGlS5V1DlgCyskM
	Kmv7bZ/UfiXIu8g3R9qwUOqCfS3VCdFEMfnrV96b/ZNAumpTzBLp+svmVL7EFt5Q90i8y3z78fn
	YjgmAptgPKZOl1x/4ikgaMjTjbwRULr4/rkHNZEGexTMyhcWJ1HTCyJ0eUtsbUlFYwt0FE3bYEG
	ESzMyjZpiWCwoAcIOi2SnRZtH92yYZWcUl43Uf5Xq6t4GpBxohDkoZ7rMrsWCRda8eFMN2iGsik
	mnKHapC2dormwkHaUyWFG671PHiPeE4hc6Nb/TmcpXQ/oj0JQ3tTuaSjNLmH+5cNq9i2O6AHfYY
	RLkRg==
X-Received: by 2002:a05:651c:984:b0:393:5904:7411 with SMTP id 38308e7fff4ca-3992b069ea4mr3516121fa.3.1781268060501;
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929c29aefsm5863241fa.1.2026.06.12.05.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jun 2026 05:41:00 -0700 (PDT)
Message-ID: <b1d23af2-a431-4d42-86ae-77bc4e528768@linaro.org>
Date: Fri, 12 Jun 2026 15:40:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] clk: qcom: camcc-glymur: Add camera clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Taniya Das <taniya.das@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260517-glymur_camcc-v4-0-9d00acffdbf7@oss.qualcomm.com>
 <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260517-glymur_camcc-v4-2-9d00acffdbf7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/26 20:33, Jagadeesh Kona wrote:
> Add support for the camera clock controller for camera clients
> to be able to request for camcc clocks on Glymur platform.
> 
> Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir
