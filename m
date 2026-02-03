Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB8186348
	for <linux-clk@vger.kernel.org>; Tue,  3 Feb 2026 23:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770160858; cv=none; b=OdqN2/W/ABaDQLbYdAQC9nF0R76/Hw6ZNtdkdxJ6mr/olCEDULk3qikFCGeSJWH6aNyT2vdfDDhfDWwBJk/XGQCPfSiAaWs6KSwKO7jpl/f0eYkfkMho8WlddWZ5HDNM+YrSe1TupAerwDIasvPedrUIwFskg5FR7SUmaU+C9kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770160858; c=relaxed/simple;
	bh=DBlsEnCNWOdgU65s3UGQhrlX8AWLWkEiqvqbN717n08=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q336ahmxpiLIAYUAx1y/YbDPORUBn/Tn2sqjyyIfUWr+G0HoFQf5d9/clOEsJOtC0MjvHhIzCgMocqI0lWMtAXpMpJ9dYuFxyRRyObk62IELlT3TVHDaPMKG3/MPGgpeeCbhpwaRxtBU0g2V/yQHtQQoxlYfVzXngSSrywkvuX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eNMZfLj9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eNMZfLj9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so65220595e9.1
        for <linux-clk@vger.kernel.org>; Tue, 03 Feb 2026 15:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770160854; x=1770765654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kP3cETuc1CkrPsq53s7PbxZQOsGNVLDKkivfucBoVDY=;
        b=eNMZfLj9tkKmMOs7kikYt2+qc5gx6WoZ55jn8TNRRC1cjpDOasTzJW4rUI/5wNRWXq
         SrUNGKbwjHVJaBK8MvjKvfPOqTXD+6NmgLuNSZDtt1+g5LlL9yC3hN7vCoX2zFOgAjpp
         22GvTZLF/qw5MTX8mUbdvMDfxgvkiKU8sHhvdNk0VM+mBPFdmgb5ySpZXtQuiSwf3+QR
         JrW390zUgThE72BN26Quk/LbSP0iU9l9SsxBvkKXkyc1Xt76uFILq18uUQjDaYicR+Ay
         YryAXBbzSUvq1vjS/HnkG/1uQRRETkKfaDj54bMCoszy1nxEkbudE7q4C7KfVf+E0+is
         ct7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770160854; x=1770765654;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kP3cETuc1CkrPsq53s7PbxZQOsGNVLDKkivfucBoVDY=;
        b=eT6dARiicJps90TjvHrYIpO2ebn80d0PWoZUr9oqIjZC+feKyVvnx9yItaXqZWldRh
         AQXdjQtsGNGJqNArichN20E/xNZwtjUH+OvB0SeUYMDXk1ijBNqU1G6vrFltg2R1KGxf
         3IyVOPQYK2SwEQ2TRQQ7bI4pq/BGd4kv2mBPUG4R1u4gZGt973T3UKYZFZ/274mDiLyn
         HdlUW3nkvGO1kPJTbztXlEtT2m6GFSP6LOamRczPiemla3EIy6I9rsIDxUiqfEFLqPIa
         46OK7aCTYOWzLmgXWC3IHnmyjXmwYxiwyqSiqjmwyp7iMX9faPZ/pDgddQTNNbLHFjuk
         Vm0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzGLNRlJAhvbAQggjBShiuZLDM+WfRqXSPyBE4Wz41oaGnvN6DXhj6+SHZ5V1QBQMrQuuS7zmpk1c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoWoXhZ+NqFZ3WLit3wrlSNKYwzVSojoSzIMXVope2jw2VLnr+
	j4EEkXSyEBOWouLLgqd8jTJCmySiQmGwtzvi1p1dnKIIY9oyRIrW7KPmSuM18c8j/0E=
X-Gm-Gg: AZuq6aLTyaLs+PuAp56H1WCKDCjDQmghqRV8axmQsqq41yQjAMIRBpZIUvAMnLxHuJK
	uQo7U+yqlBIdNJAKRxEBClpRmdFES91atTL+PP1nkXWQpdUlnhuclIkeLNd145K/FoV2qwDxDnD
	cIdN+UWU8vz4aSGfy35zpqcMJ8h6/dJ3iFDzB9qSyupVx52cNuKaFelvfItQoIlUf25rarQXI9d
	seHlqTLt+qaSX2xMa3MwUtIsZTSkIRi4tJwc1zQMu6zmeGcZicmogy4F272IUpnbqxiXM6wJ964
	ikBLH2gV6RrGfKKYEpEvRNIXYWMQ3XsVbvzA7CDEBetlF90gq5xwOK1KGwQcjybN/M46Xpejc/B
	9mQdYM6Wszac0UcLSkqBWiY+hnxPogQKJQCQ5CiIIVUshoKaiq9zjHL9qX8zb0fPaFtB4npZmb7
	SoPzNEeozFssQ0DlnXtlpSKx4GEtNCW3pyz8TBGzDkp4uwSe8sMGj+W1FaAi8L18c=
X-Received: by 2002:a05:600c:5491:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-4830e935736mr15228825e9.4.1770160854462;
        Tue, 03 Feb 2026 15:20:54 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe86a7bsm4055075e9.8.2026.02.03.15.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 15:20:53 -0800 (PST)
Message-ID: <e31d9865-5002-49fa-b6f0-06328d3d6a12@linaro.org>
Date: Tue, 3 Feb 2026 23:20:51 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] pmdomain: de-constify fields struct
 dev_pm_domain_attach_data
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
 <3gNulq9mtM9Uxcj8IfIzusuPDhOGNCEcCGQrxhCBiYbh2DCGhUpRYpLgY-KfrSj746f6RWqzl90Fge-7U_CsUA==@protonmail.internalid>
 <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-2-6f40d2605c89@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/02/2026 10:48, Dmitry Baryshkov wrote:
> It doesn't really make sense to keep u32 fields to be marked as const.
> Having the const fields prevents their modification in the driver.
> Instead the whole struct can be defined as const (if it is constant).
> 
> Fixes: 161e16a5e50a ("PM: domains: Add helper functions to attach/detach multiple PM domains")

This doesn't really fix a bug though.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   include/linux/pm_domain.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index f6f6d494f728..b299dc0128d6 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -49,8 +49,8 @@
> 
>   struct dev_pm_domain_attach_data {
>   	const char * const *pd_names;
> -	const u32 num_pd_names;
> -	const u32 pd_flags;
> +	u32 num_pd_names;
> +	u32 pd_flags;
>   };
> 
>   struct dev_pm_domain_list {
> 
> --
> 2.47.3
> 
> 

Other than that.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
