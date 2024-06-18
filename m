Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B092613EFEF
	for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 13:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718717285; cv=none; b=I/ynGxtakhLKVKQR8UB0TeQljCVqMUEM2wuoSaJsySclm40LtqxfQqr3zVEYwhpRHaH4QFFzEvHB3pqY1I8ecgXYwTe4qIZC+sdK2V5VjJsC/5GU768/NKhwFWILxqZglnIBCOycJekOvMz5jAerDJKTJWVePgzF0bQZqz8dwJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718717285; c=relaxed/simple;
	bh=P2iR+XJO20kjFPFruIuBNlrh7wkDA2ddjm99o7r11VA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/aNV47ixWHTbWKfl2dU7Zd6kAEItjrJ2excJgoquerEqmHMelQtX5YEEbtaGmGC1Y8An6m4QESVnewll+lAV6XitpbU+9wduNhuR4o0uNdCx4lyurtPgQ8yDKjm9lRJFtpzONmdjZh7rMkycdOe7ROjApnvHg/L+XUGC5MB3j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzGSzlo0; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzGSzlo0"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ebed33cb65so61547921fa.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jun 2024 06:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718717282; x=1719322082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cgj0IrDomaUjzBC0KLU+PFvHZCf8aMEd+R22qNfiYxc=;
        b=PzGSzlo0Z7lcLsYIFQIg1tI22pHyBodDYcKzL62oZy4QhRUf6VKi7jAkbOGs12SHVc
         zqZALJROERTqlP99kIRMpOZE2uRAFj3/y9Kqbz1eOQYyBHZLoWtRgyPt6GhAoVUXp6Sy
         7gDwIgsO0jPuM4ryC+9GbzUHL5kPYUyszMRp9I+9GBrSkyRPuUJj3oC5j0XoyNGnWKwM
         TKQYvFetVHzpS5r0UGqVbluXf+YjRa8ZEQOI7d8h1jrbbS3318r4fhPUqByaZwslkV6T
         JhHlKglb0XEh7dB+9zhdmw8GtvBsj5ReBCnZUToGVsQPrku4FrIdNO85E92cp/Wj+vtY
         u1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718717282; x=1719322082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cgj0IrDomaUjzBC0KLU+PFvHZCf8aMEd+R22qNfiYxc=;
        b=L79jO9f1Q0i1LK9CWVPNUwEuP4vozrxP6Q00PzEzm2e0gN95aebSeGPqHkqY4vNZ0E
         sBE0A7eS6JAVAKZBqGH6x2SsIPk+QTpQv/Tm6mtdd0qEhcbKNMp4BNIEXgNa8bS0byuc
         iwX3uQx46XuXhoDCrjJCBhCRIucW2w2aFb+tONxcIPwnMpcIrQa1IxsEYTJA9BHALLoU
         DtnzOM84BRCdx+ArCazWIubbMy6FenxWY9O+T8/A23k2eJFEjNtqt6l6F3hKZD3035Fz
         PjGpL/R3s9Pxh175gH351v+D87OedRqMsDUxx7Rp5o4JEQW9VAcgyNeplYD9+lgQdX3O
         D8Eg==
X-Forwarded-Encrypted: i=1; AJvYcCV2rs2DpKa+qlwZxjGgybrMOdjnBfLvBciKoRduWk7OrS7bj6UarjsVj85jQ8rq7Z55BlMlvUR8CxE4kZrHgrzWsGqeDmH3Xv3x
X-Gm-Message-State: AOJu0YxqCSy7RBIpenU5doVZF57zQOG+6ZEMp3DwZdfOGiSGhNVzAAjo
	C7bWd5EcpBfyGS9Q6lUVEDoyEl3LJuuGFdafAC85jbi8HgKbd+sm6V/smKrcf6w=
X-Google-Smtp-Source: AGHT+IGK2g/5pEGb2O7+YJ6KcJ8OGiwXCrOkIFFOMVK9jdv1m3RTPGFryY0YEY6iI7i+KanST2Vzzw==
X-Received: by 2002:a2e:a306:0:b0:2ec:343d:9677 with SMTP id 38308e7fff4ca-2ec343d975amr15666551fa.39.1718717281835;
        Tue, 18 Jun 2024 06:28:01 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283? ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec05bf44e8sm17040531fa.14.2024.06.18.06.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 06:28:01 -0700 (PDT)
Message-ID: <9104638a-fe7b-4503-91de-7bff3c518eb2@linaro.org>
Date: Tue, 18 Jun 2024 15:27:59 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
To: Taniya Das <quic_tdas@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Shazad Hussain <quic_shazhuss@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, quic_jkona@quicinc.com,
 quic_imrashai@quicinc.com
References: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-0-adcc756a23df@quicinc.com>
 <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-5-adcc756a23df@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240612-sa8775p-v2-gcc-gpucc-fixes-v2-5-adcc756a23df@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/24 13:08, Taniya Das wrote:
> The RCG's clk src has to be parked at XO while disabling as per the
> HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> clk_branch2_aon_ops to keep the clock always ON.
> 
> Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
