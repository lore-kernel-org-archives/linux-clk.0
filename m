Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC42204F78
	for <linux-clk@vger.kernel.org>; Mon,  2 Dec 2024 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733151752; cv=none; b=bu1vA7HwTiwJuV9LI75whcpHVj+MmzYgCSH5MKSJ1oUikUup3lBrtOvZyejm6+YKleQtd7aRq4mjXICcjHoEm56Kb+nUEYX41nbU94+W8Q3i7Y2jM/fkq/4A27HqlXLx/mG53Xxk1juuKgkLjAhec8Xwxk3DjM30KD24cssSTaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733151752; c=relaxed/simple;
	bh=Tss2wX7BVTMGLLgBPwI3Bxd0nhDmhT/WVBqiMlc+Up8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=atdDYlcF6p8PcBfpeUwPKPA3Xf1zAdA2zDvco4FgZxnkqz9qnx4lNFjzKDJhXlifUBBPsGDQ06LyK5HmZ3D3nx57qr3xXU7oR8QR3ihDKYGeQyV/k/xaNhHJN4Lu/AAx/hYf4NFOu6X/JdysJVQqmnSn4AxyLIqb7s/zbmyzGJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gBqXi62I; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBqXi62I"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53dd668c5easo4627007e87.1
        for <linux-clk@vger.kernel.org>; Mon, 02 Dec 2024 07:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733151747; x=1733756547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=gBqXi62I/Aag3MjA+zhShuDWP3UFuchk2GVFlIRZKWrbvYGMzXko5zbPLI9gwRItP5
         6K0hMuwez0ls52h28yW731k1xIqGRkxipaqqwvvIiEp9Rac3YyrNDlHM6E+bCdkzyl5W
         0c720nvOv1XODUMKy/WTpvLq1WSCiZRm2wCUQt1Zplc5dHfT7NmCqrPG0KpGE56ECgb7
         Bq8CYdPP0MZ8FrzdYQqJ+ijpwjLJG8rqH1QfpRkhgbOgNQiYrEwHObrMeronAlVpeJ2T
         kWSZhat9PugcZz2PtwXJw7cDCN9uG0MKucA04EnsM5wWCpEtsHcz9W9bNO/squ+CjYFV
         Uapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151747; x=1733756547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YvM66VLjGaWFMoBlw0v965vjYa9KnUHS0gdOSnCBuU=;
        b=AxS9MK40z68CEM3ZIPDCLYTUYCehgjAnE1u9xMe+m7HScJUgbZe7AwKpQ+XPewjt2M
         KAdqWsUIGZD9J+c7BySmULNFsczWH34TllOLYGujQbGnXK6BDMcZaZ15EM1rCyVF8gCG
         QIdwmkPWXo39rZM/u5F+k9Ytt4Tlt8BZfjs4YlfWCGhE3aZrEW3SwcfPj+9W8pF9TvH0
         HQ0zPzG1OZYATEYtbVPkQhRO5dXEF6HQ2WC+Tow3vTEbWAIiBdURatsqSuOObJ8IiFQk
         wweka+DFCo3aaKJSKkkDFf5XMrza1GLX6qo2HDihGErIgdyTmRO7c/SIC+Czl5tfbths
         ZiVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIaXk6CJgmsFPtGLWOxzf637VWO1xIQxLZBr2ODIbNobwAtfO/XJ0DwO0f9AKkl5dZm5l4x/ipWug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKTFNT5hjqo4w5algSe4OTLniTR28EJoexsZvuuZmw/pMlqvbI
	vYJUU3Jy3UWGMQl/ccO8evsMTCEwojoObRXftVIePB2DmWQ39j5JEko7C3sXCks=
X-Gm-Gg: ASbGncvOAl38pnmc1y/Pke6U9/X+rlC8jR7TXAC+iMlNRJHz2SB2mMx/3BYSy52QtUb
	qE2cI6nFiHZCbeGhfHEn5kLRmUIaJ442iORNJw/3yDHJflqQCm7qMPEf7QR9cfkL0EAMHNjPsEB
	Rj/d9dX7HDtt/IECBaPiuVgS58G3HEavIi/kIkhjUUmUxn55q0TGjrnvD22yc9rGPPdYmWYPuPb
	fKNJwi7aUlEORnB3MmKcGHDHsW8DRSzEydMpb5rZaP6I4KQ8Hw1mW2et/EYzWMSEtFh9bcSBL7t
	4fu+gQIuMn5oQOzC9MKebw3ykIWi0w==
X-Google-Smtp-Source: AGHT+IGpWLZTubAjL+EcRvPsaRs1q62SFavCte2XH3l1UUlQtQ0yI4iXJlCQ+K7wtS1kFUnHwKp47w==
X-Received: by 2002:a05:6512:3b0f:b0:53d:f786:c364 with SMTP id 2adb3069b0e04-53df786c447mr5437857e87.19.1733151744243;
        Mon, 02 Dec 2024 07:02:24 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6442e26sm1491277e87.67.2024.12.02.07.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:02:22 -0800 (PST)
Date: Mon, 2 Dec 2024 17:02:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
Message-ID: <2chygbm3yjozhkhps64oae5gwirdk5b3orsybss7jgutu5g7ke@4jskpnermxfm>
References: <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-0-54075d75f654@linaro.org>
 <20241119-b4-linux-next-24-11-18-dtsi-x1e80100-camss-v1-4-54075d75f654@linaro.org>
 <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02dd5593-38ba-4344-aa64-0913eca45808@oss.qualcomm.com>

On Mon, Dec 02, 2024 at 03:27:11PM +0100, Konrad Dybcio wrote:
> On 19.11.2024 2:10 PM, Bryan O'Donoghue wrote:
> > Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteration
> > of previous CAMCC blocks with the exception of having two required
> > power-domains not just one.
> > 
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > index c18b99765c25c901b3d0a3fbaddc320c0a8c1716..5119cf64b461eb517e9306869ad0ec1b2cae629e 100644
> > --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> > @@ -3,6 +3,7 @@
> >   * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> >   */
> >  
> > +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
> >  #include <dt-bindings/clock/qcom,rpmh.h>
> >  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
> >  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
> > @@ -4647,6 +4648,22 @@ usb_1_ss1_dwc3_ss: endpoint {
> >  			};
> >  		};
> >  
> > +		camcc: clock-controller@ade0000 {
> > +			compatible = "qcom,x1e80100-camcc";
> > +			reg = <0 0x0ade0000 0 0x20000>;
> > +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> 
> This clock is not registered with the CCF

Isn't that be going to be handled by the CCF on its own (like orphans,
etc)?

-- 
With best wishes
Dmitry
