Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CEB81B948
	for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894832; cv=none; b=HpRKgLx/uJSw4mcODKSzecQIxTfFzCI9HUI1l8p1KVj1GuB5XdYX4gDSHaOiZ54NV2R/fxxN81oC/srhU236usAjkB6kl9CgLtTqzq9zwhu6pkL63C1umDSy6GcfVIrN80mgFMVr9OtZFVr1Ss9fPVF9AxtPK6rX1udHO1pehjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894832; c=relaxed/simple;
	bh=pO/fjfqP52luWPyzHvXMSRdec7CH5CUXt6VU7mcGtoQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JpbxbBU5R5HMgyOI30pVnWdpP4K0ysOsvvra22y1Q5mKZMcs8GRSmgrKGp9vFUb9mRao7+PAjeB+7AVsi4kMy2o77Vw1gJPzJzDggAWcR5nXB5LJYzVPUbtF2aq+3gxKZJznmF2VxwdmAhIg+1UzbSYYnzo78BtPLkM68RCmMaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cL0DCeNH; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cL0DCeNH"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso2500865276.1
        for <linux-clk@vger.kernel.org>; Sun, 25 Feb 2024 13:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894829; x=1709499629; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xgGCNw14CM63x3Ljb6h7tLbgFJYcbu+B0DpPVMSSl9o=;
        b=cL0DCeNHmaGgHTSr5ThlOtkdmt5076ISlLNRlPumuvDFZZPsgGyTngH6VAH5dRNPss
         dtel/YGBzsp4Q+jtVK1DyQ5e0YGaRRExLWqj3K3+UuRdVuXIJxKZUwYGkY3xowweKwZc
         EC0nMdzDHJDjUTyzFRh2tiX1yVcrvfxxLQwonWZwh1qscokStbe2wJE/KYFIkAjEr6LI
         yVHIK3qkQK6T6nzM3QC9fIdNOy9BtBtvSF/pPPsrTioWcIUBVxPmrtbe0mPLBuczZOG+
         pHeUUAruEZ3qBinJs6LfLzNZKXcLXXqQ6Q8paJ1cSezV+RoJa7ZI63HdIjyjCDhwJTzi
         zYwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894829; x=1709499629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgGCNw14CM63x3Ljb6h7tLbgFJYcbu+B0DpPVMSSl9o=;
        b=pGXsreuPzjPka2jXDZRyxLY0HDj8uwPADrjx6/DUfWcLAGq81a6px2MvlJHKSSdpXa
         bcHarytSodO80y+guyTJtryi/dxXrnOSYjOTTmJ3n8kVjqc9qw4U/Unq1hmwyyYZSZRE
         PK+p0icF2PwCZecTQSjy0/bxp5yKsBRkBUoE5mvk+R/McrdCPGEok+R0InypCxD7jeAf
         ccCqFzUqj7RwUIJZRFERAUloBaZpz6X6XSnKQX8y/abumkYZXozFTov0sHZkHrCwS+Wm
         1sSXYHlT8m/D21G7t0x23WuqJOQu8zo1z0aILomQrTN9KNROrYeaDtAKc30Q9sLuSO+v
         z7TA==
X-Forwarded-Encrypted: i=1; AJvYcCW44niuVX5TQBFqSgvr03DtwpQksf0iTcdXdPMM7S+3qP1ZZJ1ZsybZ846X7K/BoUCFswiMoWIhWVzZ9ERoUBrJqJ7MvSYNgEna
X-Gm-Message-State: AOJu0YwXjkqnGdShl85frFHnKtTQq881OlvJbF/xZkTx5LotCSubUd0m
	tLvbFeRd3ZbNmtYOGlIEV3PP9lGZboenukqB7TSH7hLaP/gZq/fFGSUkMc91PIzGOvAdnl/PrQo
	vxrcKxZfs8f9xL3BqhRFxRYNgMQ7qioMDESME4A==
X-Google-Smtp-Source: AGHT+IG07sqdBrmi76PmU6vRNgZgcPLN/vUFwAZQm2ZOZ34/pUmYl31b6jlNceVxM1Nl7J/4FC7Dd5QCHvjuD/E3jKk=
X-Received: by 2002:a25:684b:0:b0:dc7:4bc5:72cf with SMTP id
 d72-20020a25684b000000b00dc74bc572cfmr3218800ybc.14.1708894829190; Sun, 25
 Feb 2024 13:00:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225-gcc-ipq5018-register-fixes-v1-0-3c191404d9f0@gmail.com> <20240225-gcc-ipq5018-register-fixes-v1-2-3c191404d9f0@gmail.com>
In-Reply-To: <20240225-gcc-ipq5018-register-fixes-v1-2-3c191404d9f0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 23:00:18 +0200
Message-ID: <CAA8EJprEhxN7_bHnq7rJRbBUQUKyjSGBpCiLT_bDLmwF5SjO7A@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: qcom: gcc-ipq5018: fix 'halt_reg' offset of 'gcc_pcie1_pipe_clk'
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 19:33, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The following table shows the values of the 'halt_reg' and the
> 'enable_reg' fields from the pcie clocks defined in the current
> driver:
>
>   clock                        halt_reg    enable_reg
>
>   gcc_pcie0_ahb_clk            0x75010     0x75010
>   gcc_pcie0_aux_clk            0x75014     0x75014
>   gcc_pcie0_axi_m_clk          0x75008     0x75008
>   gcc_pcie0_axi_s_bridge_clk   0x75048     0x75048
>   gcc_pcie0_axi_s_clk          0x7500c     0x7500c
>   gcc_pcie0_pipe_clk           0x75018     0x75018
>
>   gcc_pcie1_ahb_clk            0x76010     0x76010
>   gcc_pcie1_aux_clk            0x76014     0x76014
>   gcc_pcie1_axi_m_clk          0x76008     0x76008
>   gcc_pcie1_axi_s_bridge_clk   0x76048     0x76048
>   gcc_pcie1_axi_s_clk          0x7600c     0x7600c
>   gcc_pcie1_pipe_clk                 8*    0x76018
>
> Based on the table, it is quite likely that the pcie0 and the pci1
> clocks are using the same register layout, however it seems that
> the value of the 'halt_reg' field in the 'gcc_pcie1_pipe_clk' clock
> is wrong.
>
> In the downstream driver [1], the same '0x76018' value is used for
> both the 'halt_reg' and for the 'enable_reg' fields of the
> 'gcc_pcie1_pipe_clk' clock.
>
> Update the current driver to use the same value used downstream as
> probably that is the correct value.
>
> 1. https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r4/drivers/clk/qcom/gcc-ipq5018.c?ref_type=heads#L2316
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
