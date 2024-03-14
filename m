Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC14218E20
	for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 12:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710420635; cv=none; b=MoZB0N0uxC23iqmHdNB3OkH7uiVmpu8B1JlRDPlONNo1fauQz1WafMW+mdafq16blmAuZfDmgjIcVCa1RUsdYsv+Bu1D2nZIH/zcRJ3+2qO2ROIBtFaFL1C79hIuv7owoFVz1DysXD/+A0cFrtEqQTyGgR9c4U8QCu6w3lS3j2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710420635; c=relaxed/simple;
	bh=SJYf0eYZHPK70nL/FMrYe0Mz5UbyrSCWCw2slFY0IME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZNGXHx20eq98aQkPJvvH+nwsqtlg6PvHn1bxYnfSJxtXwiUfFXd+kwkmLZUsxD/GDUQOuiFelSQCOSO2x5orYeENonEl92kcSQUY4PjVh5YqR7esTCULjXwBh4mjSVXH4tlKLaWsRD0P6fQmGBkpkdrgX/k045RXeoo5bvW12SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krkfoaVp; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krkfoaVp"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-609fb19ae76so10152207b3.2
        for <linux-clk@vger.kernel.org>; Thu, 14 Mar 2024 05:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710420632; x=1711025432; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZghsaZNCzPLJdRj6WkVSNSS+VYpXaG51PVVgNZx+0NE=;
        b=krkfoaVpzdmYYsbnyeydK+VkLipe+CHaD8ET3d2Mi9ggP24Ne0VbvsMtqlcK+588X9
         tpAKtLzOGdv5Vwd3Y0HnG48iJvUE5IQ5DxHgJ6iwovZiqhBgBYrijU/WW+xAgOf7r6MA
         Mkh16o3WzYVYgWQz9YflmaE76MEi2u5DnH4GpEQZHZsci6uJqbEyBTxbgKCK8eJ20EWt
         xf84YNsNp5QUaXh58O7d0XIIHBAl82ggK3CG0TXUrmLJ+64jKbP4Ci0gLqdOy72q7ZdO
         ktcTaJntXBKdryBWCuYJ14Z609btODBbCgL7dr+PdfHmRljnxKnlZS5iPjdRQ7nhw3Ds
         D2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710420632; x=1711025432;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZghsaZNCzPLJdRj6WkVSNSS+VYpXaG51PVVgNZx+0NE=;
        b=bSQGXF8NUdm6vxkBtKZtseglVk+rOUMI+u1TNBclsKP5CPDt1FEaUI1TnwArIWeaee
         ojeU0FaCqOi13TdUTQvGnBRcTWG5lAkfzGNAzbu7zMwfCHsVP0lOg4EwWAMsNDSJ7S8Y
         fVzd8L3DkOSQPu8ktG+iY+P0QjBBcnpiB6ZfKNyqhG45z9a7iEtAiqdkeglb+jBxXZO2
         09jJGIghv2xiNI8cd6GVr8KZc4aKXyDAEVQTyMx1XuKASJagH0xVHn/otidtkawWv36h
         PY0d22t7yxSGnf7Y8hG3wdCcSVKV8btqO2H6XZLTfCO2UDqZdidHGlBp4yeyxE6s3Msa
         RaaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTp/aBEE5+6iLJqWZNPdQ5xsQhKl+rDafKs6Z5XiJhwNbnDisnIrYhJn8+e+LmiqRV4QjQKA6poUrqMj8BHyjIRJ3H+bbuabEV
X-Gm-Message-State: AOJu0YxBTnVuNxVqE3Jk9nlVgG3cIfGXF46P9UWwh2q0LSKv3oK34QHg
	xcqxOeGXr2vkX/7ZNrYyzC+L6NpgeOr8IekdKQAZJFyKXPK9rbvMH+NUtAq70Nj8jke25ylDniA
	qjLuX13Iml1CLeh4tFMSTi9dVfiIDIWUGpiEkog==
X-Google-Smtp-Source: AGHT+IG97gsKZcgBw8yoxoOH6iJ/zmZNBipww7VBkc48blNZ1mkCDF00bj7wxIeufwiUJrD7H0JBt/u8CbJO2ltmMQE=
X-Received: by 2002:a0d:ea16:0:b0:609:fc2c:4d8c with SMTP id
 t22-20020a0dea16000000b00609fc2c4d8cmr632942ywe.28.1710420631754; Thu, 14 Mar
 2024 05:50:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240313-videocc-sm8150-dt-node-v1-0-ae8ec3c822c2@quicinc.com>
 <20240313-videocc-sm8150-dt-node-v1-3-ae8ec3c822c2@quicinc.com>
 <CAA8EJprrrSTLBoLGMSJw3g9BEcL6y+To1tr65b+AzNz01MgjTg@mail.gmail.com> <1a2a7d7d-ed67-1c90-d3d1-4529dc07effa@quicinc.com>
In-Reply-To: <1a2a7d7d-ed67-1c90-d3d1-4529dc07effa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Mar 2024 14:50:20 +0200
Message-ID: <CAA8EJpqFzwd1AN7Pt1oy6WQ86P9LEWnfEszBdvK_gaDq_KeFWQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8150: Add video clock controller node
To: "Satya Priya Kakitapalli (Temp)" <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 Mar 2024 at 11:14, Satya Priya Kakitapalli (Temp)
<quic_skakitap@quicinc.com> wrote:
>
>
> On 3/14/2024 12:46 AM, Dmitry Baryshkov wrote:
> > On Wed, 13 Mar 2024 at 13:11, Satya Priya Kakitapalli
> > <quic_skakitap@quicinc.com> wrote:
> >> Add device node for video clock controller on Qualcomm
> >> SM8150 platform.
> >>
> >> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> >> ---
> >>   arch/arm64/boot/dts/qcom/sa8155p.dtsi |  4 ++++
> >>   arch/arm64/boot/dts/qcom/sm8150.dtsi  | 13 +++++++++++++
> >>   2 files changed, 17 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/qcom/sa8155p.dtsi b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> >> index ffb7ab695213..9e70effc72e1 100644
> >> --- a/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sa8155p.dtsi
> >> @@ -38,3 +38,7 @@ &rpmhpd {
> >>           */
> >>          compatible = "qcom,sa8155p-rpmhpd";
> >>   };
> >> +
> >> +&videocc {
> >> +       power-domains = <&rpmhpd SA8155P_CX>;
> >> +};
> >> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> >> index a35c0852b5a1..6573c907d7e2 100644
> >> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> >> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> >> @@ -14,6 +14,7 @@
> >>   #include <dt-bindings/clock/qcom,dispcc-sm8150.h>
> >>   #include <dt-bindings/clock/qcom,gcc-sm8150.h>
> >>   #include <dt-bindings/clock/qcom,gpucc-sm8150.h>
> >> +#include <dt-bindings/clock/qcom,videocc-sm8150.h>
> >>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> >>   #include <dt-bindings/interconnect/qcom,sm8150.h>
> >>   #include <dt-bindings/thermal/thermal.h>
> >> @@ -3715,6 +3716,18 @@ usb_2_dwc3: usb@a800000 {
> >>                          };
> >>                  };
> >>
> >> +               videocc: clock-controller@ab00000 {
> >> +                       compatible = "qcom,sm8150-videocc";
> >> +                       reg = <0 0x0ab00000 0 0x10000>;
> >> +                       clocks = <&rpmhcc RPMH_CXO_CLK>,
> >> +                                <&gcc GCC_VIDEO_AHB_CLK>;
> >> +                       power-domains = <&rpmhpd SM8150_MMCX>;
> >> +                       required-opps = <&rpmhpd_opp_low_svs>;
> > Should not be necessary anymore.
>
>
> Whenever the rail is turned on, we want to keep it in low_svs state
> instead of retention, hence added this property , please let me know why
> you think it is not needed?

See https://lore.kernel.org/linux-arm-msm/20240226-rpmhpd-enable-corner-fix-v1-1-68c004cec48c@quicinc.com/

>
>
> >> +                       #clock-cells = <1>;
> >> +                       #reset-cells = <1>;
> >> +                       #power-domain-cells = <1>;
> >> +               };
> >> +
> >>                  camnoc_virt: interconnect@ac00000 {
> >>                          compatible = "qcom,sm8150-camnoc-virt";
> >>                          reg = <0 0x0ac00000 0 0x1000>;
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >



-- 
With best wishes
Dmitry
