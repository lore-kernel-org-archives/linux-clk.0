Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5B2BE5D
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GzVIFIT4"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-5e6c8b70766so5112697b3.3
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 23:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703142334; x=1703747134; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b2l/21lwZTw7IQF7dk4Fcyzt/h7TEeXxjAh9LiPFqQY=;
        b=GzVIFIT4t9JqJIHw2czuo9D4EjjMvO0ZlYwFLq7cWVEm/Ou6gfup/1CiByIChIaD76
         ck7SLlDtLC570+p4DIERV3blTntjRo/kgxeouTfxylNhnZFX/vtytctsZD4LAuHsSDCE
         5PJlrOq1ktUVhziZxizAvTnP0vOM8u+jeoov30ak2iHEUaQQFR5Lqz/6Vab6Y3uwhKNL
         YZGSWGP9UlR/oZzmF10vhonMO46CL0ymUonyd7JbxhopNnUNrLBOFcWQQYFULv9vEB/G
         7A8g153rKvhkC5Gntb6KhBFKceB3Bo8X0Rlf9tXYLXN9Mc3VpgvokSYmL6fE7EEx1hQa
         mPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703142334; x=1703747134;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2l/21lwZTw7IQF7dk4Fcyzt/h7TEeXxjAh9LiPFqQY=;
        b=fZs461wzU0VpqAb+kiyiUKqVMYI11+4chELaFyAySLzdn7Vtfy5n971k2Z2p9sQQ3z
         mW7EQwuXClUrm3AfMyD1jiWYIY7jXbtF3/KyMqSjR9QNifsOB1rn3Z4E0aAoPekaUAPJ
         3wkJHOp8YVFt7gPfYvqniU1JpajJ7aSWSkV1SAo5WDQBtVcOrTPLHC0U2QHT2eVJ/I97
         oJ4eriBvPRWhJ6BfRMdv140NcdQCI4SitbWXf90GiDYLaA8Ka2HKlLHC0gPULv4gXIX0
         R3Mlpq6dwUm2p0Qluh11W8WQxI44cS+9KuiJkjMKWKMpLJp6jee3P30RvWnHfjxL5vlW
         JqHw==
X-Gm-Message-State: AOJu0Yz9gimJXQGvvcbxWpyuLxPnXJL4A9Fzy5x0CNr3RarcSG8IUR6R
	gcpbnS80VArG0/GLYnxcZQe/7ePL/GrcOuh4nJT9mA==
X-Google-Smtp-Source: AGHT+IELCozVLl1R8n3zTGGFMiCWNYuu11PkXOo81lZp2eT14pMFwMTk6tgZ+aXRxGDYl64Al13t8L6euZ+ocJlEixA=
X-Received: by 2002:a0d:d286:0:b0:5e8:c7e4:e7a6 with SMTP id
 u128-20020a0dd286000000b005e8c7e4e7a6mr936045ywd.71.1703142334551; Wed, 20
 Dec 2023 23:05:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231220-sa8295p-gpu-v1-0-d8cdf2257f97@quicinc.com> <20231220-sa8295p-gpu-v1-4-d8cdf2257f97@quicinc.com>
In-Reply-To: <20231220-sa8295p-gpu-v1-4-d8cdf2257f97@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 21 Dec 2023 09:05:23 +0200
Message-ID: <CAA8EJppbXZQcMw7UGka4YCQDdEJKD0hda=QdsEyNcjYf9U0PNQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] soc: qcom: rpmhpd: Drop SA8540P gfx.lvl
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Johan Hovold <johan+linaro@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 21 Dec 2023 at 05:51, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On SA8295P and SA8540P gfx.lvl is not provdied by rpmh, but rather is
> handled by an external regulator (max20411). Drop gfx.lvl from the list
> of power-domains exposed on this platform.
>
> Fixes: f68f1cb3437d ("soc: qcom: rpmhpd: add sc8280xp & sa8540p rpmh power-domains")
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/pmdomain/qcom/rpmhpd.c | 1 -
>  1 file changed, 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
