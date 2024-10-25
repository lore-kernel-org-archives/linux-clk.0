Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0147613B787
	for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 14:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729865140; cv=none; b=ZJpbCTUuPMliuRCuZtNLHlv7hNZqtS/xbLMX5P6bAUnYSP0j8iJMKbOQHr1HP1tyUSx0tnkKjzMo9xY7PAZWcWdPiaO8hyTmCHCKEZz3kQveASyoyXkMfGhoCTeqqzuGYbJhQZyoO3e0g54rCadp75EaBkwqEdcahMo9MITv7as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729865140; c=relaxed/simple;
	bh=mhPDdtyt330mcdM63wrN5tqVH3NzsiWGOIKFvHowOnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glR+6OadoWzlyweMDoWPmFX1WtdFq1p6EidDgCY8y2NGQNDg6wTXQayXzu114ZrMpnEu/Eoj5CyhJoxpZZ+iN5KvMWrjFfmcaT1kNFDkcBWf6H6SL9LwBpSTy/HWhYNmknbahMF7T7Z8Ty+v73Na4WGmy8XfVVSVqKqxqjD6wgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lf17I1vr; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lf17I1vr"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso21855091fa.0
        for <linux-clk@vger.kernel.org>; Fri, 25 Oct 2024 07:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729865136; x=1730469936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=lf17I1vrXdqO6F0j2qoezG9jbFtdOSQvx3DnPG1uk0O45aIUYqEhOK4Hp6Q7PYZ/vt
         foXS0PvU/7Uytt1n2bMCCRQhHlNf8upT0k9CmFIyeS1LgFhLSRCO//LmuQS8iJx7DKrq
         1rWJWFP10mNffvj6Nzgnh4wh4qUYfTlncRUh/ispnOH10L+kWYjIqAMusH8HlaV9C7gD
         ovRbN5HRAylRnM2f3IUzKur8R2q86g2uRg4BrWT3SINT5aZeoWMYAt3Kz4YsBPEnf4Hq
         CahBEL++Hgtg21qjtCj1V88F20HPlzqhRWg1oZKchJyxZvNF6yrM7AteTalotjg6u5dZ
         2W8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729865136; x=1730469936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rn9Pt5hyYOkst6E9UWfygPgyliex/XcNrU8hJHBnOOM=;
        b=eXV/u8ryqR7LeetNTWh7ZJ/1i5UcehFgFsBfFqSOX3N3SB9v9Yee6+Di+2QxmefDd9
         EIN9zkEG3STt69XIsodi3cdAn0/oDjpxUynx2ESrnXwsZze6Kr6o+CZjiBNTkboZJ6RC
         ZHk10AW6aE9ziSsvBG0Ab7TjJyFAlpDGgKYX7fJ/JR5eJ7lltyBUQuksIHDBdru4HWcl
         8D8KwfaMtXlVJ8yKcbE0qr4tnh5MCbiQ+BENRAfpC+w0osopEZOVZe1+XHO1cGxNd9qG
         cUVlkBYx2btvRQfm4i53sp6nS8JP6zX52x30rmNMx+Uhq79fF9qYVOCMRKVmr+00B7AQ
         94ww==
X-Forwarded-Encrypted: i=1; AJvYcCWJouzap4s3pWRbQHH0OkUhNXUI5PMCr/0M9VPOI1JN4hlByg9uFqKU19YJkVBxwC0MLatdiNKIhPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIwwgmscc7j2syBxhFNHxGMpWY7r01zY0WFXl2fEkQIMPgfgt1
	3uTTgIDXgLuoDOZSObslgj+BpW3MnzQ5+JRJ+EKU8A+SwcGRG+EBJ6McW/OFGkg=
X-Google-Smtp-Source: AGHT+IGPO2N8dVilguOrd+D3mg0S1fdvTrVMbg1ZQKzSI2X+KHFMOXe6V+CSQpm6d8eAH4CXe6TVWw==
X-Received: by 2002:a2e:4c0a:0:b0:2f6:4f17:aeaf with SMTP id 38308e7fff4ca-2fc9d586fc6mr34505861fa.45.1729865135784;
        Fri, 25 Oct 2024 07:05:35 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4612a5asm1984121fa.122.2024.10.25.07.05.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:05:34 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:05:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jie Luo <quic_luoj@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com, quic_suruchia@quicinc.com, 
	quic_pavir@quicinc.com, quic_linchen@quicinc.com, quic_leiwei@quicinc.com, 
	bartosz.golaszewski@linaro.org, srinivas.kandagatla@linaro.org
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add CMN PLL node for IPQ9574 SoC
Message-ID: <g3wh3yjkzgdfwbj4hnabtmziwsmqn3cloffblhshrkgj3tx4h7@2w2ho2mvs5c6>
References: <20241015-qcom_ipq_cmnpll-v4-0-27817fbe3505@quicinc.com>
 <20241015-qcom_ipq_cmnpll-v4-4-27817fbe3505@quicinc.com>
 <abro3enahzbugcwokcyyhwybbokestbigvzhywxhnfrdjihni3@7ej2hkgbgtf6>
 <b336724c-1fea-4e1e-9477-66f53d746f09@quicinc.com>
 <CAA8EJprVNOLO-CoorNhvKrrSD1bNKdFrzth5BL0GHXffPv62jw@mail.gmail.com>
 <32dbf7ee-1190-401c-b6b1-bc8c70a5158c@quicinc.com>
 <cqgkc3qpupbv47rqxiyhe2m466zxcxepyfcgyaieo2sggffprx@mstqi4pqoiqc>
 <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a2448df9-9b8b-4b7e-ada5-6f26d7e7da97@quicinc.com>

On Wed, Oct 23, 2024 at 09:05:09PM +0800, Jie Luo wrote:
> 
> 
> On 10/18/2024 11:38 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 18, 2024 at 10:03:08PM +0800, Jie Luo wrote:
> > > 
> > > 
> > > On 10/18/2024 4:11 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 18 Oct 2024 at 09:55, Jie Luo <quic_luoj@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 10/18/2024 6:32 AM, Dmitry Baryshkov wrote:
> > > > > > On Tue, Oct 15, 2024 at 10:16:54PM +0800, Luo Jie wrote:
> > > > > > > The CMN PLL clock controller allows selection of an input
> > > > > > > clock rate from a defined set of input clock rates. It in-turn
> > > > > > > supplies fixed rate output clocks to the hardware blocks that
> > > > > > > provide ethernet functions such as PPE (Packet Process Engine)
> > > > > > > and connected switch or PHY, and to GCC.
> > > > > > > 
> > > > > > > Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> > > > > > > ---
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi |  6 +++++-
> > > > > > >     arch/arm64/boot/dts/qcom/ipq9574.dtsi            | 20 +++++++++++++++++++-
> > > > > > >     2 files changed, 24 insertions(+), 2 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > index 91e104b0f865..77e1e42083f3 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > > > > > > @@ -3,7 +3,7 @@
> > > > > > >      * IPQ9574 RDP board common device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     /dts-v1/;
> > > > > > > @@ -164,6 +164,10 @@ &usb3 {
> > > > > > >        status = "okay";
> > > > > > >     };
> > > > > > > 
> > > > > > > +&cmn_pll_ref_clk {
> > > > > > > +    clock-frequency = <48000000>;
> > > > > > > +};
> > > > > > > +
> > > > > > >     &xo_board_clk {
> > > > > > >        clock-frequency = <24000000>;
> > > > > > >     };
> > > > > > > diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > index 14c7b3a78442..93f66bb83c5a 100644
> > > > > > > --- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > +++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
> > > > > > > @@ -3,10 +3,11 @@
> > > > > > >      * IPQ9574 SoC device tree source
> > > > > > >      *
> > > > > > >      * Copyright (c) 2020-2021 The Linux Foundation. All rights reserved.
> > > > > > > - * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > > + * Copyright (c) 2023-2024, Qualcomm Innovation Center, Inc. All rights reserved.
> > > > > > >      */
> > > > > > > 
> > > > > > >     #include <dt-bindings/clock/qcom,apss-ipq.h>
> > > > > > > +#include <dt-bindings/clock/qcom,ipq-cmn-pll.h>
> > > > > > >     #include <dt-bindings/clock/qcom,ipq9574-gcc.h>
> > > > > > >     #include <dt-bindings/interconnect/qcom,ipq9574.h>
> > > > > > >     #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > > > @@ -19,6 +20,11 @@ / {
> > > > > > >        #size-cells = <2>;
> > > > > > > 
> > > > > > >        clocks {
> > > > > > > +            cmn_pll_ref_clk: cmn-pll-ref-clk {
> > > > > > > +                    compatible = "fixed-clock";
> > > > > > > +                    #clock-cells = <0>;
> > > > > > > +            };
> > > > > > 
> > > > > > Which block provides this clock? If it is provided by the external XO
> > > > > > then it should not be a part of the SoC dtsi.
> > > > > 
> > > > > The on-chip WiFi block supplies this reference clock. So keeping it in
> > > > > the SoC DTSI is perhaps appropriate.
> > > > 
> > > > Then maybe it should be provided by the WiFi device node? At least you
> > > > should document your design decisions in the commit message.
> > > 
> > > This CMN PLL reference clock is fixed rate and is automatically
> > > generated by the SoC's internal Wi-Fi hardware block with no software
> > > configuration required from the Wi-Fi side.
> > > 
> > > Sure, I will enhance the commit message to add the information on the
> > > fixed reference clock from Wi-Fi block. Hope this is ok.
> > 
> > We have other fixed clocks which are provided by hardware blocks.
> > Without additional details it is impossible to answer whether it is fine
> > or not.
> 
> There is an XO on the board which supplies reference clock (48Mhz or
> 96Mhz) to the Wi-Fi block on the SoC. There is a multiplier/divider in
> the Wi-Fi block, which ensures the output reference clock of 48Mhz is
> supplied to CMN PLL block.
> 
> In summary, below is the path to receive the reference clock at CMN PLL:
> The clock path is .XO (48 MHZ/96 MHZ) --> WiFi (multiplier/divider) -->(48
> MHZ) --> CMN PLL.
> 
> There is no software configuration required for the entire path, as it
> is fully controlled by bootstrap pins on the board. There are bootstrap
> pins for selecting the selecting the XO frequency (48Mhz or 96Mhz) and
> based on this, the divider is automatically selected by HW (1 for 48Mhz,
> 2 for 96Mhz), to ensure output clock to CMN PLL is 48Mhz.

If the clock is always fixed to this frequency, then it's ok, thank you.

> 
> > 
> > > 
> > > > 
> > > > Also, I don't think this node passes DT schema validation. Did you check it?
> > > 
> > > Yes, the DT is validated against the schema, I have shared the logs
> > > below. Could you please let me know If anything needs rectification?
> > 
> > I see, you are setting the cmn_pll_ref_clk frequency in the
> > ipq9574-rdp-common.dtsi file. If the PLL is internal to the SoC, why is
> > the frequency set outside of it? Is it generated by multiplying the XO
> > clk? Should you be using fixed-factor clock instead?
> > 
> 
> Since the reference clock is controlled by bootstrap pins on the board,
> it may be appropriate to define the frequency for this reference clock
> in the board DTS. Given the clock tree described above, I will update
> the cmn_pll_ref_clk to define it as a fixed-factor clock as per your
> suggestion, with its frequency and factors configured in board DTSI.
> These values defined in rdp-common.dtsi will be default values that can
> be overridden if necessary by different boards. Hope this approach is
> fine.
> 
> In ipq9574.dtsi:
> cmn_pll_ref_clk: cmn-pll-ref-clk {
> 
>         compatible = "fixed-factor-clock";
> 
>         clocks = <&xo_clk>;
> 
> 	#clock-cells = <0>;
> };
> 
> xo_clk: xo {
> 	compatible = "fixed-clock";
> 	#clock-cells = <0>;
> };
> 
> In ipq9574-rdp-common.dtsi.
> &cmn_pll_ref_clk {
> 	clock-div = <1>;
> 	clock-mult = <1>;
> };
> 
> &xo_clk {
> 	clock-frequency = <48000000>;
> }

Sounds perfect, thank you!


-- 
With best wishes
Dmitry
