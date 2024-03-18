Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B861CD3B
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710775312; cv=none; b=Myowrs1LLCZPl0ENKUeUlenrtZGTGiYnzoU0TOUzIiz7L7cXRWYANa1K62H7yTG+V+u1PEMeC/8NDyeU2e4cDQDblTpWHWfijLGsSx/IQ6QHqrS9RA+iPLy2XTM9QfK+QN6o+6XmDlu8s9D6DCZ/EnQSJVTQToVynNPZ1UzH6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710775312; c=relaxed/simple;
	bh=fOMNZ9RkrucUBElQm7DZeJsg0EKL7/lwJeVNrUgtgk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ep3Q2n4Dsu/Tfh6hpfbyLGm6RfUP9eD8JnS9ssla7Qz3457rVpSPkWvO0IbAkmwvjVmKjWtdYjvNhdGljM2TYTM70FF82Cj96Pyz8qtKPrR1Kl5LhWwxVg9ZPzK1IcFGeuDR2pkE7d8R5/tKWb1lJ2+epoI42Ib6CaJt67ITrEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AySasqtO; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AySasqtO"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-609eb3e5a56so48363377b3.1
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710775309; x=1711380109; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuDnp5FuC/P7zMV0CMzQ7SKWMn/6RKLauSf7pCwN0Ys=;
        b=AySasqtOQHI6gpMFxXXyF6Fgc01CJ/5voQ3SBktO4Yxxzsr8hnJ+FarTkeWrop1+TH
         mBcCEoEPZZEjZQJMLCuYA+Uya+Dmjvdo8FqdP9ECoYqeUyOxyS40EcX9Ii1DNfzZ8twI
         h7lcMiiYwZZo5qlS/Etq7PYdwQlO8H96Q4CVNqLgH9EuNKXrpZX2UGcmzfRx/65SpSK/
         zBlRn+AqvvxLI1laLI+ZgcEQf9xJIvyWlr1hhRp11f2GHEdMPJDqRvPGPxDj8MY9gW99
         HxECwPD89GAJeXh93w/e2kXoSWovuR3N9pcGFQLkLpNO+X+ec9N5DSptW4hpoUWfnmO/
         Nhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710775309; x=1711380109;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuDnp5FuC/P7zMV0CMzQ7SKWMn/6RKLauSf7pCwN0Ys=;
        b=TuYUMdDHnoGOj2hLAbx//SZIZDZZm8DVX07Z8Tu5fZHdgsKdl6Okm4m1vhQOW674FF
         iCmnnmgIpgMFetZ8NVvVMZTeHX4E34CSvZYtMwxG9s08hM7yVg/XJBJKY/rsQYTNTVHT
         6jhmO1aHFGXmbRXoZXuHcWRcPVVeCbELEr6/lxUOXUmgYQWyPgnv/LDN4nbCBIs/HpHI
         qkkaSVn3osu/xqeiCj7bfrRpgiDjl1pXPmUjQdKVOvyPWItYVMsCzyY7RrBleKUE7ZVD
         wxeZLCNGDcOCbplRlgxy4i61LG45MSz2sZg7Cb4YGQB6AOS9CNCeydN9p0vlREykInPw
         iMbw==
X-Forwarded-Encrypted: i=1; AJvYcCUE3TneDDWTt8+6qvHu77tFkE/nckqUGArm/SldtgkYUsFkqIWeC4wO5W9ozGmgyfQOqGzi6hnngjen6O1TqxVCuT1g6PDZjDpJ
X-Gm-Message-State: AOJu0YzT1Hm6HeqXZX/3hmcrHYvguOUCBhtbUd4ONCtoRBwf7kmlXTjz
	3ELYClVWz3q53ZOetEOKZu5g/nwFiDXcve+zf97Yxs+R2GGedYLrYLzWkmyalnB90tYetzYeS2e
	UNIfg3rb+NCcluNzmMAw9fQ62s7H6RFf049l7SA==
X-Google-Smtp-Source: AGHT+IF0vRwq0/LTZx5W4OOx+6BDAgX2Cv7pmp/4K30l52XoHIktLBjVZGf3PZvQhq3f4F6CP5ViSyfckOvjx94eNnE=
X-Received: by 2002:a81:8402:0:b0:60c:bda8:cd7c with SMTP id
 u2-20020a818402000000b0060cbda8cd7cmr11623167ywf.10.1710775309518; Mon, 18
 Mar 2024 08:21:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-fix-some-qcom-kconfig-deps-v1-0-ea0773e3df5a@kernel.org> <20240318-fix-some-qcom-kconfig-deps-v1-2-ea0773e3df5a@kernel.org>
In-Reply-To: <20240318-fix-some-qcom-kconfig-deps-v1-2-ea0773e3df5a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 17:21:38 +0200
Message-ID: <CAA8EJprT0d1gn-JbPRdXUz2iMAjxzX2_nKjMxZNG5dvtjSmz_w@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: Fix SM_GPUCC_8650 dependencies
To: Nathan Chancellor <nathan@kernel.org>
Cc: sboyd@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org, 
	mturquette@baylibre.com, bryan.odonoghue@linaro.org, 
	neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, patches@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 17:19, Nathan Chancellor <nathan@kernel.org> wrote:
>
> CONFIG_SM_GCC_8650 depends on ARM64 but it is selected by
> CONFIG_SM_GPUCC_8650, which can be selected on ARM, resulting in a
> Kconfig warning.
>
> WARNING: unmet direct dependencies detected for SM_GCC_8650
>   Depends on [n]: COMMON_CLK [=y] && COMMON_CLK_QCOM [=y] && (ARM64 || COMPILE_TEST [=n])
>   Selected by [y]:
>   - SM_GPUCC_8650 [=y] && COMMON_CLK [=y] && COMMON_CLK_QCOM [=y]
>
> Add the same dependencies to CONFIG_SM_GPUCC_8650 to resolve the
> warning.
>
> Fixes: 8676fd4f3874 ("clk: qcom: add the SM8650 GPU Clock Controller driver")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  drivers/clk/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
