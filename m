Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA552125AC
	for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 22:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714084301; cv=none; b=IwN28c942gAzu2YsjjIIYofMvkw0J2uh5uWsV4Bop7G0iSQ56R0EBz4nfpY/6Cz9mXnQFakmCRuq9PkDhFZjrvFQiD8y8aQzH5WGsWCAiAuv1ivrP7VhAj9YE3UcpJfjjQCRKcvgFXYJJndkeIG1yGLqF9xQRdesiO2AKYaYCBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714084301; c=relaxed/simple;
	bh=gksQjALYYBV7m5YVoxumNd3IEta5GfPli9GAbRgn46s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AOvCUc7zNtJwhev5dA5kX/eLDwcoes0+h/epEh8YVP37iSKhSMHZH0BGXX4HYg9MoXBrYnzKmCTVf/TWuuriNNgSlGIojZkCUBsx22ZDkSO/89w28z3C8kwWmcdA3e1he/qnhk3bkQx0lTqo9y4S0vECpJTI0jlwPzydDxnYWP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Mvf1CTPa; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mvf1CTPa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-34c09040154so920112f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 25 Apr 2024 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714084298; x=1714689098; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iQymZcJrX7eM2hkF98kCr3YSKPUK5K901cXvsq0BsxE=;
        b=Mvf1CTPamT2TsWc5tOif02xLAcuSJR2zWA/lu5Fs6P3sExnb6WL9VLX6p7ocdX6jOd
         E2dsTWwIOInI3jKq9KuRNY4XPyncnX856hmJyfSkPZnrBrzunBvPoHf0B7OHLbyPcMlV
         UhHbC+RV5b3SkMTXPEdHT7Adiq8IUVStyZ0kNlU/sk5emfOrX28JaKmQUNOo6772d+kT
         YCqH5b7s4pVNtUPrluDr/HgHEAnuT5UuBC95AOeTolhAoa+MHClt/VFzY6iMQi7LEYgn
         3rVBAWE2mIPzMI2X/KPNlMQKS1er30PtWoBkfNGnbtbQjLzXkm2C4v9S11aMtURDR78l
         nOJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714084298; x=1714689098;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iQymZcJrX7eM2hkF98kCr3YSKPUK5K901cXvsq0BsxE=;
        b=UBnw29vipBiYsg4LUf5YxJjqgfxKmMAMSz6fFoGYEHl/Pz5Fv6Doc3dDRUJLPrL/bC
         7rc5pym4xel2pT6MVEPEtF9bIy2+w4kuDUrHDmTrm01sz6PzewduVgzx32EpzLdTGSss
         Wkhg87CUS/dquAxVC3VYmh0HDVAumm3I9+HB99SBA2K46t8Ln7i9XIrQyFPFlXarPHxm
         2ftI7YxUVWosq2+yxDqWPE/amMMU5dvEbU4BSs/3gFq3ctEBaa6ZZA5ti/4Oh7vk0rBv
         NeBUMCfoj12c1wvhm+F56NFwXLdeipZTOttZ4JUWMP+xkwG8Wo5PIVBDZUW9m4197Jyw
         pJxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPgut6sdnL4Bbkjv+Pf54EZ22nV8CBkSLfeThrqFvGuJ00iffQR5RGBfjZ7uVs+IHdXT2ZgJszCyex95a4Mg98AGo/dB0AbYdK
X-Gm-Message-State: AOJu0YwXN9khRLlR4Chk7SWbAi0wc9ShohFObNeOYbRqmDFrWd6dXX6H
	ydlYObVE2RbV6CRX/MuQSMGDWaLkbSyY01aJyNIEiTd63ezsp59wXPSMb+vmY+U=
X-Google-Smtp-Source: AGHT+IHkzZ2SICsUYMinEqYHpIjtdhmu4Brlj8n2BvJPkf4bejlYroHN08Te5mq9YQm641G0dBzS/A==
X-Received: by 2002:a5d:5348:0:b0:33e:cf4d:c581 with SMTP id t8-20020a5d5348000000b0033ecf4dc581mr533294wrv.41.1714084298056;
        Thu, 25 Apr 2024 15:31:38 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id t11-20020a05600001cb00b0034a21842accsm20211737wrx.86.2024.04.25.15.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Apr 2024 15:31:37 -0700 (PDT)
Message-ID: <6f8d7ea1-a3cd-46c4-ac7b-e220b7ee74aa@linaro.org>
Date: Thu, 25 Apr 2024 23:31:36 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: mmcc-msm8998: fix venus clock issue
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>, linux-clk
 <linux-clk@vger.kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>
References: <c325691e-1cbe-4589-87fc-b67a41e93294@freebox.fr>
 <22628ff2-6128-4ac9-89e3-d978f57be378@linaro.org>
 <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <2394efa5-713a-421d-84cf-f6c1b2ad26ac@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/04/2024 12:25, Marc Gonzalez wrote:
>> I'd expect 0x1028/venus core to be absolutely necessary fwiw
> Considering the absence of public documentation, these register offsets
> mostly boil down to cargo-cult programming.
> 
> Thus, using different code on 8996 and 8998 risks provoking the wrath
> of the embedded gods. Better, safer to cast the same incantations.

If you are concerned this isn't right, motivated and able to do so, you 
could always build a kernel module for the downstream 8998 kernel - read 
back the new addresses and verify the bits that have been set.

My guess is that something in the boot chain prior to Linux has set the 
bits in the GDSC - lk for 8998, it'd pretty much have to be the case.

---
bod
