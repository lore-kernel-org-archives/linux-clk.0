Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37074371070
	for <linux-clk@vger.kernel.org>; Mon,  2 Feb 2026 14:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770043598; cv=pass; b=uHCJ0mdbUIaDTiFs+S8RjIvaCbhbUvPMsXSJNzLddb8EdSAKoFIRnXiTRAgDOvf3lZbzErKOsutoXG/BbSlP0uAfsLScfrHrWzlK5I9rD8l8ynFCNmbBw0e3hy0Jt0LeSGZQ8gm6bh7Jlil8JEMhDW9zW0pMBR/um+OX+UFMCFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770043598; c=relaxed/simple;
	bh=6wKlGaF+HJlYg3oYlybm2siLLYbtx8o9sW8eaq0Ny5A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mKKe8wjbqiF0l96NBJbEPdpd62+1DxlhUojiJcmFt6O5LSsvjGznlEK3Bs07M9BRw7h6s1i1NtrvrU54hS2xTsbmILM0ex0ha1qkeND22BoBzPKmIOHz4YOR66wu5+fMIaV3EEs2SpAmeA9Ec7VT2GRSKmGGwOa/SrBBhxykYcw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fVOzYKe2; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fVOzYKe2"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso5048016e87.0
        for <linux-clk@vger.kernel.org>; Mon, 02 Feb 2026 06:46:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770043593; cv=none;
        d=google.com; s=arc-20240605;
        b=Y1ynesSnw2LHruwJprmadBMSNLnPtUHzGKkdQ/dkpQv9qsWYsF4ORX3ZDg5oVZ7/At
         3xqGF3xeG0YbTxgoIFMyOUvdJ6gLmUKbPdihU8i1X97itQmyMkKoR61NRKXCNlGXEotI
         NvhIZ45HRiWtPQuIxxnVCEIkIK3TlmYTA+f7EnymP4NCJ9SHwcOKwi/8cnBXS0xPMoBr
         Zz6qI1sfNbfArunknBQqXU4tl/XeKZYwe0jPnFhIZIaHEqocaGZp75gJ0Erocj6jnaY1
         kogeL/PGxFq/ibDkuvFsdqMm7MgKe3+BjVi5PIwWxPw4ZQFWFNQUA2HDqd+ccokt3Ep4
         Qv2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        fh=typTWDSqgAkh3URK/edoUbkPcZ654Bfg0Us5OyKthrw=;
        b=e6TZ45jhiN7ijfEDeysxASaGD7xRODJpRsryubdOLzsZ5HQfh6NuYr3ag1NfbYX1pf
         VzEdxAl1avYcZl7LhnkZ30Rl938Wk9gDTXu5WboZR1Pvk0Jek4z0218gCI73oukFj2Eu
         DInvv/1yld0ZVC5SLMgwWXOP6BSMLvvI4rQUf46J4aj7g94xQVmbAHsSegxlsPrsERI2
         GIOxFwhULbYiUiON62nl6U+iFM7lj1mC1S6b+0Nnd3JBVtHjBfGw3OnH+GRpJ95Lz+RU
         DkejknaTmylmHztWzRs0C4xF49yDhAOk1dCAWm7pysWWo0QmGS42F8ui5I7i0HyMgA+b
         +2Jw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770043593; x=1770648393; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=fVOzYKe2l2RRcFW+Sf7fGimY+tIcvF5zBMwbbs7M+DLbk0mH85UpGR3Jws6hsrL7ZQ
         gjeXyI2CZajzK2NznroXwsu7OdOwiwaT56j3YR/rIVcCra3Zep39byQ7bXnbiJgnA80w
         c03KOxxv6aHSdSZufwhXe7xg6221bjbExrwu/ii68LoBcV1FpXGkalsGpn7Vyti7RrQ9
         OeJpYNhAXBcR7UouNnwElYV5VJVwN3HcRVcsVQnJUiGTcY1afNNjV+z4S0KaVdj4poUJ
         bUMqzXekNZP8KrUlx8w0xMn8F404sCfaITXKzIbS5WU/GF0hxeR3//Epw7itz8PFJ5RU
         0g6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770043593; x=1770648393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CCxcsWChfDF2Gh4ycD+vyncq/ofeycyF+64lSijnMn0=;
        b=XGtswnUVDQrFHlG8JFCBxMU2V+NFqtDmy/Cs1KdVKzKPGqJuAuFx4XlF60qYghlCta
         pkiE9ebtiIcykBET63IIOxFHne+zAISYWCnv49aNiVKtU84Hem7Zw2cGJDpaGfiVSTsx
         M5zKpDe1uPa5BqfP5WbkFv7VG6lnjL+Ops3buBonURGfJK7SqJVSAuyaIvGadG9S/v54
         oDt3sepIWU3P6YSNPRL5IUaKxLJuVhpQK/eNcdDWnMkOMQ1OzQkokXmgxAN8fRhtCd+y
         naQjsjjgtWtvZ5Ji5ENY3LE6+0aIP2+lwL7nsyH7d/s/zRGDBLbo9GbMleQEQF5Dy+i8
         7+RA==
X-Forwarded-Encrypted: i=1; AJvYcCUX+Qb2xmjPV6iFQRuCMl+sWwRRpOAUYy9fysShak+rOTVpnStZnoowmcJ8T5u2lfJHduBjOopZmPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIC6JdUtnf3rdl5Bgjbp5vkVTtqrb1liPGs4Bfwolj7z6ejiFY
	679Zw1wanmvIyV7t5HddRxzLT7eZ1im3Cz5G1yHh4BBX4yqpsz6g/TqIZuVjZgr6oXRekIJPUeO
	PdxrQYlCDtO/F3RH66Hv6cSbv/6B06yVdUQScsdimEA==
X-Gm-Gg: AZuq6aIAnq5+uFsJyczmiIgJor4DQONPKrnKIRR0B2Er0tgjjcnVk0Y4L/uAaeBW4HV
	ORd2gwKJhVc2lsZs6jEe52EF1imrcQtIvOVry78B/SUprpKRl48HiEZemjeCFLZuWCqDb7yodp8
	+nVi3Njz4w8h3Un94/kJ40DrtzXwdW3K+6KHnJHnNjCYHsl8Tsl7VVB8IwlrmOYfkrmwB6VV+4Y
	VWjOHY/bpIzni200x+YoBX1zXcBrPM/isDiOjMABKFwfCagbGI73KyS1/ZBIqxjCVxwooWQ
X-Received: by 2002:a05:6512:3d07:b0:59d:f1c7:3e02 with SMTP id
 2adb3069b0e04-59e0d88d299mr7865289e87.1.1770043593213; Mon, 02 Feb 2026
 06:46:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 2 Feb 2026 15:45:56 +0100
X-Gm-Features: AZwV_QhOzR0E6k1IfUGRMUbn9MQFxH_pvh_89KhmlNk_aUHzuxVlk0zPxkYMZY8
Message-ID: <CAPDyKFoNX087ZhLkQ_n8-42WNQcL06noSuPJPDG87y0andVdNg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] media: qcom: iris/venus: fix power domain handling
 on SM8250
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, "Bryan O'Donoghue" <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Hans Verkuil <hverkuil@kernel.org>, 
	Stefan Schmidt <stefan.schmidt@linaro.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Dikshita Agarwal <dikshita@qti.qualcomm.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org, 
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 1 Feb 2026 at 11:49, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> As pointed out by Konrad during the review of SM8350 / SC8280XP
> patchset, Iris aka Venus description has several flows. It doesn't scale
> MMCX, the frequencies in the OPP table are wrong, etc.
>
> Let's correct the Iris/Venus enablement for SM8250 (unfortunately also
> stopping it from being overclocked).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Do you want me to pick up patch2 for v7.0 - or what do you suggest at
this point?

Kind regards
Uffe


> ---
> Changes in v2:
> - Fixed example in the new sm8250-videocc schema
> - Link to v1: https://lore.kernel.org/r/20260131-iris-venus-fix-sm8250-v1-0-b635ee66284c@oss.qualcomm.com
>
> ---
> Dmitry Baryshkov (8):
>       dt-bindings: clock: qcom,sm8250-videocc: account for the MX domain
>       pmdomain: de-constify fields struct dev_pm_domain_attach_data
>       media: dt-bindings: qcom,sm8250-venus: sort out power domains
>       media: iris: scale MMCX power domain on SM8250
>       media: venus: scale MMCX power domain on SM8250
>       arm64: dts: qcom: sm8250: add MX power domain to the video CC
>       arm64: dts: qcom: sort out Iris power domains
>       arm64: dts: qcom: sm8250: correct frequencies in the Iris OPP table
>
>  .../bindings/clock/qcom,sm8250-videocc.yaml        | 85 ++++++++++++++++++++++
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 20 -----
>  .../bindings/media/qcom,sm8250-venus.yaml          | 10 +--
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               | 42 +++++++----
>  .../media/platform/qcom/iris/iris_platform_gen1.c  |  2 +-
>  drivers/media/platform/qcom/iris/iris_probe.c      |  7 ++
>  drivers/media/platform/qcom/venus/core.c           |  7 +-
>  drivers/media/platform/qcom/venus/core.h           |  1 +
>  drivers/media/platform/qcom/venus/pm_helpers.c     |  8 +-
>  include/linux/pm_domain.h                          |  4 +-
>  10 files changed, 140 insertions(+), 46 deletions(-)
> ---
> base-commit: 44ef70faf71468e0ae4bdb782a6d43f0614b8ffa
> change-id: 20260131-iris-venus-fix-sm8250-f938e29e7497
>
> Best regards,
> --
> With best wishes
> Dmitry
>
