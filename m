Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3DE2ECD1A
	for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 10:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757671989; cv=none; b=rC9PZvuRRaUgmWclVpOZ84RoW1J79McfwaT6QiW1/tTWsyZWNga35k/IPx2dcSutvqI15Pbwibrg2h3XDMd1cRC9jdwnTYTJcZYG8DzXjdH5gV3CSlJj8tCj033jXrOLV9AqF6YruQdhvKiskP3RiOx/1GEPGYL/gHF0F+5ZIDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757671989; c=relaxed/simple;
	bh=X6t16wMfNguzOH1YS0pAbwIHjWds1uPx3polU7pfZS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=noDyBr6MOmDAHhLvL24UOLakVUmlTPcIOCpHnEri/ganHQpJizzhQqAIfbx13V1WidCHC6O00s04wK0b144qPI1h41uUUW6ZFQfJRw4cn+fqr4yQfqlo1CV8PGe8GSQki2oAbvF7K2X6swxL8uSik6fLXjPje7qEzNoMD/k+3UQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sPjzKbxB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sPjzKbxB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3c46686d1e6so1246867f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 12 Sep 2025 03:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757671985; x=1758276785; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ogrvh4x3WIFqZnyWHHbCEFIhgIBr8KAgDXVdkxwiS4=;
        b=sPjzKbxBPoWT9xYk/dugSRJSiQgzFYpnANPISWpf4SSM3bZLG8lgWmjI+cVt3U+FiF
         ykMrnjsRPSnFyM/QGdT+Ur7VJW0X118fCSGBt07nfAdzDEyGM1oh2wPt+r5Knmg3s8OT
         jHiKv+mLRXYqVLonsAATvAFTmkiTFdSr0sN75cE3yISI0LhJwfaZapVB9XNzGJX/NkSZ
         WmE993zvxZbb8s3YtEZJ3tLeadmNbvdUbuTsNHgVhzJCH7TOf0/Uwwa0cDtW6A4L8WqY
         B+IfIGSYvLZobjBopQ4XupdBdfpmoJ8pIwcqYeJGjC4dRBFlM/eVr+rBpCeJoxmhysbg
         iBWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757671985; x=1758276785;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ogrvh4x3WIFqZnyWHHbCEFIhgIBr8KAgDXVdkxwiS4=;
        b=C1YKPHHCjW+claat0Qv2dsgw3kvpbtVdnce0VboJexA8gi4+3rZ4jmGqrx2GYO/8+o
         6jhA8ppY9Syphr6pmOrKwylIFuw3a6ktDYavtCCD/1CzpqA+uulAcLMX9n0X/mIdzz+f
         lU9tP3z/zDyrneIPxsjT/OwlOQt4L+MBdWdLN+1iPbFBgSB64edECzjiTxffiWEKT1OT
         C2wl+2IxBHcgcPba7zmZwcUgVs6BbDWGrTimrM27sGs+CYs7NF/KC0oXkn/cL0XPdMWy
         mbdSBxouTTZjWA3baSQhIVFVHmTvrjcjnSXO+2SMfkBEz8OSVJd6elTZjJQYVs1eDanF
         smfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsf1lZR92bVjUz+gT4sRt1FWSQr8LrQW3LepM9lWD1weKtbH2EC1glHsgTUN1zbNOFSBmiOxDaTtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0y8zZALbwv26NxgS8IzvgpGd0MCYBr/Gxaf/jkHc5hMjwA3hu
	mgw5HtnwJ8gG/webPWHlcBHuL9NZ0aRbteoKGoHOKIFloHiKOZGfLSN/NL9O8C2HC0Q=
X-Gm-Gg: ASbGncskBANfeP/4Dal2sb2FjTOeq8Guf9xRy8YsK+Vx7jZo2DLdIO+HIIFB2o8DbVD
	9i4onBQrLldsAHxnHKoqOEBkrst0v2IZPxfrIYy2HaVkecmOr1U4adBRJPCNZJZvxzA5XOT/fKP
	5IGfa4pU87y1yC6mrC9Uuc3Wh3pDUB5hyk391r1tI0znplWv1ScWwWpvSkwNEYd1RwbH9RpC+cu
	CCfYHEjUwEtpKf0UCKp4ko6F18oDEfqcenfn9h1SN/SOG2OTfd2juinHVeURA6bJ/1IjWI4cOMp
	L0bKNYnxxEWdrKyftQvNV1dy+tY356mWn/gFlX0Nt6RpOgHaf1GqtHhXUC878TGJXLn3RJhbylh
	NRfI/B+GOLjymQYzUz7X6D/7TniTlAXRo0+6PtWGrswjPePo8aJvb1egY/My7nQgLh/ixVvVnoF
	8qBVqExef3f9kJJ/HwJD5/MLg7DmkvXA==
X-Google-Smtp-Source: AGHT+IH1zom6LPRnNBHMonuIQJ/D9nKfSF3IDdc+LGoQK8bZbXWpZodVhbfY3TzofC5JKbf7Hu0Gpw==
X-Received: by 2002:a05:6000:270e:b0:3e7:9d76:beb5 with SMTP id ffacd0b85a97d-3e79d76c25emr549344f8f.14.1757671985367;
        Fri, 12 Sep 2025 03:13:05 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e76078fe3bsm5975071f8f.28.2025.09.12.03.13.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 03:13:04 -0700 (PDT)
Message-ID: <bf54b526-2dc6-46f4-968c-9a00f43b569a@linaro.org>
Date: Fri, 12 Sep 2025 11:13:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] clk: qcom: camcc-sdm845: Specify Titan GDSC power
 domain as a parent to other
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Taniya Das <quic_tdas@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jagadeesh Kona <quic_jkona@quicinc.com>, linux-clk@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20250911011218.861322-1-vladimir.zapolskiy@linaro.org>
 <QzAPOBSJJ2DSDLJ71RGr_7pAbeHb7IIdtAj1wpI5h7rfCYIQw13c4RjvXdAy3N0lrJdhgkyQJYIRS4Pc7_di3w==@protonmail.internalid>
 <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250911011218.861322-4-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2025 02:12, Vladimir Zapolskiy wrote:
> Make Titan GDSC power domain as a parent of all other GDSC power domains
> provided by the SDM845 camera clock controller, and it should include
> IPE0/1 and BPS ones, even if there are no users of them currently.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>   drivers/clk/qcom/camcc-sdm845.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
> index cf60e8dd292a..fb313da7165b 100644
> --- a/drivers/clk/qcom/camcc-sdm845.c
> +++ b/drivers/clk/qcom/camcc-sdm845.c
> @@ -1543,6 +1543,7 @@ static struct gdsc bps_gdsc = {
>   		.name = "bps_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1552,6 +1553,7 @@ static struct gdsc ipe_0_gdsc = {
>   		.name = "ipe_0_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> @@ -1561,6 +1563,7 @@ static struct gdsc ipe_1_gdsc = {
>   		.name = "ipe_1_gdsc",
>   	},
>   	.flags = HW_CTRL | POLL_CFG_GDSCR,
> +	.parent = &titan_top_gdsc.pd,
>   	.pwrsts = PWRSTS_OFF_ON,
>   };
> 
> --
> 2.49.0
> 
> 
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
