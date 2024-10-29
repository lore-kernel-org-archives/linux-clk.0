Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E371E507
	for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 14:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730211540; cv=none; b=LHG2LvxG1rEzZilDxMRbwp9MWC134kJaj20K3Gv+LTAiECpcm+PqteoEVVeY3yQBRaQuJ7wJExkekr20TZkRKf+Aqa0Z1nRFOtH4L2A/7io4RnXZzLiCHkZiS8vpLnC1hzez37M5cXwFY9Likwf1yXMeF/9CaFOU/CSf6hX2Xzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730211540; c=relaxed/simple;
	bh=6vXL5MZ5Qywe7XXCx6FgvLJmxw7eAoDH9VlpzVHv6xQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmSPQzW4mzTK+uMeyTtWHuzjHoEzDTCVHNs0Sjmy2s8kAHxMXzD6edmTTLtNbLCk9t/yX3p/cfvuYlxuDA5PuTBYTrS/fKuTddp9mF/cN4z2VwVvtf4WTM5e/7mZpYcjCCKPihRrlUs2lLGOr1dyuxxD+QSGwRLGOc9pTmyM8Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WWBaIrxS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WWBaIrxS"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so5169404276.1
        for <linux-clk@vger.kernel.org>; Tue, 29 Oct 2024 07:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730211538; x=1730816338; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QBBr9PVNtdgQsTniZ2+GcCDI9QqqpSb+yyyMoN//IIw=;
        b=WWBaIrxSthGia1IwR5OItD4t3Nu0GhS+/gPM1D1U4meckwV7Ds/6PNcbw+zBiA03H+
         qPSOpOA7sZAftTUuewzFoyMJ0E44islECMHp+QJ5Y9pUrYy2A6Ih5pqoAwJzrL/u6pYX
         9x4oMKlLZnaKl+zTgP+fBPIhF1oH/fhg1S5LoupLGJa1eTCvEh7pukzmwM8dBzWDowX8
         uJS3DsaXEod+zbrHOsENUbPzjFw5uaFhvVVLJ0guRf2vE0QHXpSTT0eS7jtLMFUZiP/v
         4vSbpGgv36tvfeKbjS2PYMTNg15ncYJsaZ7RTauR78SviB2N7g6Lacr3NIzKvy80ESrH
         s7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730211538; x=1730816338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QBBr9PVNtdgQsTniZ2+GcCDI9QqqpSb+yyyMoN//IIw=;
        b=DvP1C17Eu7GoMvFSWTGgXVcivGTwN2Xe/Nx8KqT5G3xI/p+9/s8fhlhwfAzAoVFLiW
         zMPbFlO20b4BkntVRC3VXPtcoiGWU2+xt2zQIOLhxXxVexugYYV+UkLzu6eUHLPbyz2B
         p2lX652G4irqJXCUhPrfY44FFXu2HeAbn7KQU0+vOggWUyHWg01NFZsphWa3UEpe8GUw
         3YrHdi9cSsPE2UgDZWUjPoTgfdHYguw1sLoobyhK73HLtPqVthpWqtzTT3GmfQ+bLcGs
         VD54DJH+YzbVIyD8KdOQfP/QHcEElvc5mBjTlADThpqaGg3kw0xSTtTgE5WYZ1KMgxqq
         EAcw==
X-Forwarded-Encrypted: i=1; AJvYcCX6AXpl/UYXPAe8k5iDcjx9CxTvYCEwYwkZg/iZl6/OuFgIfX06myiu0a8heK2pPahe7IlDnKgRpFU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb6jB/c/klLSKSHgRhJDgpLNm4d7sHgk5dRUd/zWcDt0++GGcJ
	lLm6bMJ9szg/MKG1NRFdkQeh8g18RkL10WP/J3nF/llyUvOKAOl6lRQ24fZDWBzI7CUbrKykl3C
	vQRjbLq6VILTgKP/fMTwJU61sUUeAQ0hVPaIhPg==
X-Google-Smtp-Source: AGHT+IF2dDM+2wHeikQnbusjP6tus4NSSa9hS97g++mzsFrCKMa6E+sBpWqeOs0vHXBac6MRluw4GV/WHJm4d3jAe9g=
X-Received: by 2002:a05:690c:4886:b0:6e3:3326:91e6 with SMTP id
 00721157ae682-6e9d8ad527bmr128784717b3.44.1730211537715; Tue, 29 Oct 2024
 07:18:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028-qcom_ipq_cmnpll-v5-0-339994b0388d@quicinc.com>
 <20241028-qcom_ipq_cmnpll-v5-4-339994b0388d@quicinc.com> <crcbzpxjnbceilqccbwr7uyak6z6zdwr7mhfcyaw6vvpcce6ko@zrojbtqi4st4>
 <b5e6e81e-dab2-43d8-b52e-85b6cb0d0209@quicinc.com>
In-Reply-To: <b5e6e81e-dab2-43d8-b52e-85b6cb0d0209@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 16:18:44 +0200
Message-ID: <CAA8EJpoQO7=v8QWeH8MAgX4uU=m4VJqfC3J5PKyySM2TBcHWiw@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, quic_pavir@quicinc.com, 
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 15:31, Jie Luo <quic_luoj@quicinc.com> wrote:
>
>
>
> On 10/28/2024 11:39 PM, Dmitry Baryshkov wrote:
> > On Mon, Oct 28, 2024 at 10:04:11PM +0800, Luo Jie wrote:
> >> The CMN PLL clock controller allows selection of an input clock rate
> >> from a defined set of input clock rates. It in-turn supplies fixed
> >> rate output clocks to the hardware blocks that provide the ethernet
> >> functions such as PPE (Packet Process Engine) and connected switch or
> >> PHY, and to GCC.
> >>
> >> The reference clock of CMN PLL is routed from XO to the CMN PLL through
> >> the internal WiFi block.
> >> .XO (48 MHZ or 96 MHZ)-->WiFi (multiplier/divider)-->48 MHZ to CMN PLL.
> >>
> >> The reference input clock from WiFi to CMN PLL is fully controlled by
> >> the bootstrap pins which select the XO frequency (48 MHZ or 96 MHZ).
> >> Based on this frequency, the divider in the internal Wi-Fi block is
> >> automatically configured by hardware (1 for 48 MHZ, 2 for 96 MHZ), to
> >> ensure output clock to CMN PLL is 48 MHZ.
> >>
> >> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi | 16 ++++++++++++++-
> >>   arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 26 +++++++++++++++++++++++-
> >>   2 files changed, 40 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> index 91e104b0f865..f026c2a9d0c0 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> >> @@ -3,7 +3,7 @@
> >>    * IPQ9574 RDP board common device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   /dts-v1/;
> >> @@ -164,6 +164,20 @@ &usb3 {
> >>      status = "okay";
> >>   };
> >>
> >> +/*
> >> + * The bootstrap pins for the board select the XO clock frequency,
> >> + * which automatically enables the right dividers to ensure the
> >> + * reference clock output to CMNPLL is 48 MHZ.
> >> + */
> >> +&cmn_pll_ref_clk {
> >> +    clock-div = <1>;
> >> +    clock-mult = <1>;
> >> +};
> >> +
> >>   &xo_board_clk {
> >>      clock-frequency = <24000000>;
> >>   };
> >> +
> >> +&xo_clk {
> >> +    clock-frequency = <48000000>;
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> index 14c7b3a78442..ad9cdb1f76db 100644
> >> --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> >> @@ -3,10 +3,11 @@
> >>    * IPQ9574 SoC device tree source
> >>    *
> >>    * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> >> - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> >> + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> >>    */
> >>
> >>   #include <dt-bindings/clock/qcom,apss-ipq.h>
> >> +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> >>   #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> >>   #include <dt-bindings/interconnect/qcom,ipq9574.h>
> >>   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >> @@ -19,6 +20,12 @@ / {
> >>      #size-cells = <2>;
> >>
> >>      clocks {
> >> +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> >> +                    compatible = "fixed-factor-clock";
> >> +                    clocks = <&xo_clk>;
> >> +                    #clock-cells = <0>;
> >> +            };
> >> +
> >>              sleep_clk: sleep-clk {
> >>                      compatible = "fixed-clock";
> >>                      #clock-cells = <0>;
> >> @@ -28,6 +35,11 @@ xo_board_clk: xo-board-clk {
> >>                      compatible = "fixed-clock";
> >>                      #clock-cells = <0>;
> >>              };
> >> +
> >> +            xo_clk: xo-clk {
> >> +                    compatible = "fixed-clock";
> >> +                    #clock-cells = <0>;
> >> +            };
> >
> > What is the difference between xo_clk and xo_board_clk? Are there two
> > different crystals?
>
> The xo_board_clk of 24 MHZ is generated by applying another divider in
> HW (by 2), on top of the same 48 MHZ clock output from internal Wi-Fi.
>
> XO (48 MHZ or 96 MHZ)-->WiFi (mul/div)-->48 MHZ-->fixed factor divider 2
> by HW ---> xo_board_clk (24 MHZ)
>
> We may need to correct its clock chain representation. We will update
> xo_board_clk as a fixed factor (div by 2) clock, and refer to the 48 MHZ
> input clock, using a separate patch after the CMN PLL patch series
> review is concluded. Hope this approach is fine.

Yes, please. Don't try to 'shortcut' the hardware description.
Describing the actual hardware is the best way to work.

-- 
With best wishes
Dmitry
