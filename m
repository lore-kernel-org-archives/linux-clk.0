Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E621305063
	for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 12:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755606467; cv=none; b=I6k0vmX3EU6zYmzj6th7mZ2q4ffYkyQIdTPHU97OOtCQuVN5PCXz39p93BVA/DpZFiDqYH28vwVPL7WbCFhRr2gJOxnEr/gS7ui5hFA3fcGFX1RceVnfoblBrNOdbHAE2MHAnkBL3VxM5s3znAK0uHgmZvU/OITlI+YlZItIVco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755606467; c=relaxed/simple;
	bh=Nv1pjUoOXSZoynilhAmAiRkhImajQkD3cwyCqkQSFdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nzhQwiAHv4LDo39MT8DnxxCUpbaXBFZo5EcEKxqtCHq+TqHKUATjtM9XPymR2RbXjigX+QnynZhipH7H53msaXcbYEQUb6j2WNzubOZh1lUrGIdgamfKAw0VEDQBrxamAbhO0LFuAQAlBtVpoVjifM6XxTxXKhK5u9twdWriAdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XLwnu4UB; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XLwnu4UB"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e934bcb7623so1829214276.1
        for <linux-clk@vger.kernel.org>; Tue, 19 Aug 2025 05:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755606464; x=1756211264; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TQJ9/fQYlFZB7BHFOxhE5rqON71LQpmFE+5hRcesI34=;
        b=XLwnu4UB/tjlTYDfWQlmTs5F64e8gESNq+mtrDvQ+/6D3AoAunnxWkOh5tnSBkHbyH
         +polz83DIAOnhlT8dduYky8acG83SSPNGzopy1SGBjqSzcPt9sDpYAHEjqsj1pXrFOC3
         GT67M11579NCcx7q328g0NZNQNEAzVj27xYmOtSwfbVlU6CnbBHyebP0lgBLV27Civv7
         Lkg5+dLhPP6s6k52KCZ6RbtozRp1BideOEClV158dVScJrR1ScFBfJJmcHFf/IpS3CYN
         xkIhjc51yoAVfORcsAbblZQCX23om4f48f+Fpw6O7xVPdK6/aguRBIXoLTCt+PK9ZUdu
         1IFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755606464; x=1756211264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQJ9/fQYlFZB7BHFOxhE5rqON71LQpmFE+5hRcesI34=;
        b=AnJ8HjmZjA9jrRnv8ebf8kYVor0st8HgbrHhIAAV3VM9UISx8JZ032/VDpapa/0HkF
         sKyjhHNLXALT8F8CesX8nnNAL0MIo/7dA5vCEEUyYTWNljXkpTCu9OVoYchpOstltujh
         fwVbdToB0hnYHA5wgkhqNJSdmrkGjOggED4fPVnyxEPhOAO6qmBv/K3qVfnO5+SbOzM0
         xp60+gHFWj03lr2/TNAvlO8LKOYgGjlbwk6iW2sDYLNUZXzHm8enzX45xE8Tm2vMCEP5
         GQWM/WlwEa4YtKLa4L7/HSQl9BGfo0wJSp5RJ2PV+soIHwtACzqiBB3qb3JNFp3Uc9Nv
         IF8g==
X-Forwarded-Encrypted: i=1; AJvYcCVlC8ltMlcKZDK+2GFwrf44OlicT9xwF2fsIWcM7kPaoDRig1k2q0sqv9OO2oQQViX2qmy/cG1QrcM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf58G5TPYWkophy/b75Z4YfeAddpnh3Zh/bdR+uhke+TfqoNK/
	j7CgzlVSvLsc790Ym2OMBE2cXTs9Gw8R3rgUI6ehtGH4c1X01pRjTnyKPF0QZOz2H3WZrz+SpNx
	io/P9xOIieL5VJ7VmeZ4ydVuwRaNQbDPpfPMwAvihZg==
X-Gm-Gg: ASbGncvom67wAMPaKHfL/VAUQlmVld5DypjTn0HcThpR+2JwNUk3Ey6FGXcfZ/iKkqi
	xwvGV+u7swyd651td4pc+1ASJPshnsDfObRIb/smQkeoWRIjyzUy4kAhsRcgGbAoZSzoyNrp6mK
	NVInvrl5YSGmgq4cvvsxIA447qsl6Y97wz2Ts9/C4vWrz1I3ZPuCmyGxllCTTtGsR7LKgahWJTS
	//RF0bZpuVnWBIkLg==
X-Google-Smtp-Source: AGHT+IFRBAMqbjVrBOTdcqCFqxd0nH4dT+3B6E2uJUNFB6x6KANXkZyugb9RUsQkwMq/iR7D246ApID8/zxfeOWdOJ0=
X-Received: by 2002:a05:690c:688c:b0:71a:1234:3529 with SMTP id
 00721157ae682-71f9d532028mr22641667b3.21.1755606463949; Tue, 19 Aug 2025
 05:27:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
In-Reply-To: <20250728-topic-gpucc_power_plumbing-v1-0-09c2480fe3e6@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 19 Aug 2025 14:27:08 +0200
X-Gm-Features: Ac12FXwryiFxmL3QF8klQ7lK3nu4VpQFZS0iCSqAffd276Bc50rHoj93F3N9QSM
Message-ID: <CAPDyKFqOBJxnNWWQvrFLy=w2FWb9bh0EvQ4_3d3zRBaDMWF03w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/24] GPU_CC power requirements reality check
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Douglas Anderson <dianders@chromium.org>, 
	Vinod Koul <vkoul@kernel.org>, Richard Acayan <mailingradian@gmail.com>, 
	Andy Gross <andy.gross@linaro.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Jonathan Marek <jonathan@marek.ca>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	Akhil P Oommen <akhilpo@oss.qualcomm.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Jul 2025 at 18:16, Konrad Dybcio <konradybcio@kernel.org> wrote:
>
> In an effort parallel to [1], the GPU clock controller requires more
> than 0/1 power domains to function properly.
> Describe these dependencies to ensure the hardware can always power on
> safely.
>
> Patches 1 & 2 are separate (but related) fixes,  which need to be
> merged before the DT change for SC8280XP.
>
> Posting as RFC since I only got to test it on SC8280XP(-crd).
>
> [1] https://lore.kernel.org/all/20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com/
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

This doesn't apply, as I have just queued up a series from Dmitry [1]
that requires this to be re-based on top of my next branch. Please
submit a new version.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20250718-rework-rpmhpd-rpmpd-v1-0-eedca108e540@oss.qualcomm.com/


> ---
> Konrad Dybcio (24):
>       dt-bindings: power: qcom,rpmpd: Add SC8280XP_MXC_AO
>       pmdomain: qcom: rpmhpd: Add MXC to SC8280XP
>       dt-bindings: clock: qcom,gpucc: Merge in sm8450-gpucc.yaml
>       dt-bindings: clock: qcom,gpucc: Describe actual power domain plumbing
>       dt-bindings: clock: qcom,gpucc: Sort out SA8540P constraints
>       arm64: dts: qcom: qcs8300: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sa8540p: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sa8775p: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sar2130p: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sc7180: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sc7280: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sc8180x: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sc8280xp: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sdm670: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sdm845: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm4450: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm6350: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8150: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8250: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8350: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8450: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8550: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: sm8650: Describe GPU_CC power plumbing requirements
>       arm64: dts: qcom: x1e80100: Describe GPU_CC power plumbing requirements
>
>  .../devicetree/bindings/clock/qcom,gpucc.yaml      | 155 ++++++++++++++++++---
>  .../bindings/clock/qcom,sm8450-gpucc.yaml          |  75 ----------
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              |   6 +
>  arch/arm64/boot/dts/qcom/sa8155p.dtsi              |   6 +
>  arch/arm64/boot/dts/qcom/sa8540p.dtsi              |   6 +-
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi              |   5 +
>  arch/arm64/boot/dts/qcom/sar2130p.dtsi             |   5 +
>  arch/arm64/boot/dts/qcom/sc7180.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sc7280.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sc8180x.dtsi              |   5 +
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |   6 +-
>  arch/arm64/boot/dts/qcom/sdm670.dtsi               |   4 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi               |   4 +
>  arch/arm64/boot/dts/qcom/sm4450.dtsi               |   4 +
>  arch/arm64/boot/dts/qcom/sm6350.dtsi               |   4 +
>  arch/arm64/boot/dts/qcom/sm8150.dtsi               |   4 +
>  arch/arm64/boot/dts/qcom/sm8250.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/sm8350.dtsi               |   6 +
>  arch/arm64/boot/dts/qcom/sm8450.dtsi               |   6 +
>  arch/arm64/boot/dts/qcom/sm8550.dtsi               |   6 +
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |   5 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             |   6 +
>  drivers/pmdomain/qcom/rpmhpd.c                     |   4 +
>  include/dt-bindings/power/qcom-rpmpd.h             |   1 +
>  24 files changed, 240 insertions(+), 98 deletions(-)
> ---
> base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
> change-id: 20250728-topic-gpucc_power_plumbing-646275aec2cb
>
> Best regards,
> --
> Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
