Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E2CD286889
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229833; cv=none; b=Fpv3/rlHUzYsxuIaxzAFCGigoclCY+AO3SWvEpG/POuqPYsNeC/OwCfqEKbFCwpDEWe3oTlCe9gHfUqccrAbzALL+j06UwkFXOwxlsSGzB90q8FjaBthnXsDjYrmJ8/jU9Ho/o2J63qfUavQzPchvMfYE+vhO8deyBV4UCiSb5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229833; c=relaxed/simple;
	bh=luIj6BR36tQU2HyGVodtszn4i5/No+68y/na6FloQMQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hMU0rVDLiWp41aVutAv2yMs78m8NxelfITpcX/UqE5uWvyMhJGgjARGwp78t3Br/YYq+c4vUwcoosQvWfKPivT+cM3wR35Drb+3vPutJNXalIhnf97v3Kjtz2FlchMIGpj0hELh+0LjiaJkcLSfBjDSw9Gf+aYrZTLOxIVkYG+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yLnJzUJc; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yLnJzUJc"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43988056dc3so2507906f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229831; x=1772834631; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zuSGsJkIR1LhU/dNFIV+PKzO73brARcfdXQ3T/xnWJY=;
        b=yLnJzUJcTTIj6PKNGJg8TiVa0TBAj3pL5ql3TgEZh2iy8DccZoZT1Uzk9rjJkk5YK+
         CBzxKtGOinQnvTneXCgQoWhgiW7qJxt92WN8gFAFAd3Yx4r8WV9PMNBIDQoP87yft02y
         j5DEwQMeHQKNpJqsptQxc6H7RNEvvl/44rZ8w2n2mux9IWKCwDID/1lEcX/0iZBNNsIm
         XZDl84B6VSYkX1L2/Xtw/c86JsL6c8cLlw4UjhMVshBZFJTRmb5JsnntEnXDdbNRIZac
         nK0Azc4C1esDGkoHc+M1ft9t+KSGHp3p2c9c4KAn3mDRQtdXtpFvd6JR7guZG/0SkDGo
         m7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229831; x=1772834631;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zuSGsJkIR1LhU/dNFIV+PKzO73brARcfdXQ3T/xnWJY=;
        b=GFSzmOe2DxkAhcFLJdAb/FJF/Dji1cl6IREu3ITWcDosi5m5Wc9rYO8+tnza0Xb2FG
         58b8uPAoofKm5H+5jxS9d/SrI5L3cmkOuvTj9NMScL9JsvnvlIdXAOxW68eTcNrLpnLH
         6ugOpfHjDT8M7L6Niq8MYn0JGhc+3/wCMSv64SJJag6aODgOOeEwxmJUEJsU6HQLPRDT
         AOQbV+f2DdCmACGCIaOeLYT7qq9saL+oRQkpogRtJ9SxxzEJzHdF5EIk2RNsifdoL0z3
         AKH3bYQbMSzFhYaombD94u5O0I/sAlxN2//CzKXXDclSDQYP42CEjcJZcFE0Keu9UWbT
         AE1g==
X-Forwarded-Encrypted: i=1; AJvYcCW3WEBvQOlHkakyTdYJTBOYuWr80B3VYt9/iiGxxO2llYxGOOqfTqmIHU1T7jJVFgmkC35zxMnFm5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPscH86zea1InD6zw4RRoPoZCAsqJ3OSsK9m+TfVQG7aUNt9c5
	2Wp7wsPHOcPmG7/ukLE2s9sS1auWVkpC4n7EmEe6L5uxgAksM/KPVEBDTv+1391CJPo=
X-Gm-Gg: ATEYQzwXIZd/obTrj2/sVCYvtrYgy7HUvL68ePMGUtkxebusL/D1u0tI0SQWPToFpWc
	LfhsJHxwr8yEPQ/KGhQJrZrJEHKdT60SWULt9OhscbWJZ1hATLnsfICU6EkyVYFH6/Shexo4zys
	+rNTXtGwCwh7MFIDxF1u7auiRAV68jt0ekSfrNMXbEwq6ZGw+gUUXfvFFcYpzmxdtVlkmuuQcqu
	cPPnK54PuzUWbg6s3T7qpAepwnfOGvopqNI1/NO4PxQgO/3fi7YkKRiHH4ZoZmLIpCVIw8D93t8
	mXxBw7GL00nXZnzNywbeUOdKy/8rCmGyYThiIRKepE+DOJbJUYUOj5HwEGP4OdDloZU4TdFnpr2
	kEZsOJa8MKoG1swQ0KGbZ7HqrITbXPc4tFxd5y0m0+INYg1/vg1499Lf6vobDeTtOiVhy/eH3G2
	NsffY1JDEzEwc3jNOuLovWJR7wbbXLwrVhsMev3+/EtI87My6Yx3qVl6BFQLe9Yv2DoWN1zVttb
	6LOK2y7IYFI6SzT7PhVVZ6c
X-Received: by 2002:a5d:4527:0:b0:437:664c:3f28 with SMTP id ffacd0b85a97d-4399de4a684mr5861038f8f.47.1772229830567;
        Fri, 27 Feb 2026 14:03:50 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b5b6sm9219659f8f.18.2026.02.27.14.03.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:03:49 -0800 (PST)
Message-ID: <9c7fff927b74795994202598fc05c5b81ccf3d97.camel@linaro.org>
Subject: Re: [PATCH v8 08/18] arm64: dts: qcom: x1e80100: Add CAMCC block
 definition
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 22:03:49 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-8-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Add the CAMCC block for x1e80100. The x1e80100 CAMCC block is an iteratio=
n
> of previous CAMCC blocks with the exception of having two required
> power-domains not just one.
>=20
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index db65c392e6189..f96411f481305 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/clock/qcom,rpmh.h>
>  #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
>  #include <dt-bindings/clock/qcom,sm8450-videocc.h>
> +#include <dt-bindings/clock/qcom,x1e80100-camcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-dispcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
>  #include <dt-bindings/clock/qcom,x1e80100-gpucc.h>
> @@ -5464,6 +5465,23 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +
> +		camcc: clock-controller@ade0000 {
> +			compatible =3D "qcom,x1e80100-camcc";
> +			reg =3D <0 0x0ade0000 0 0x20000>;
> +			clocks =3D <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&bi_tcxo_div2>,
> +				 <&bi_tcxo_ao_div2>,
> +				 <&sleep_clk>;
> +			power-domains =3D <&rpmhpd RPMHPD_MXC>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +			#clock-cells =3D <1>;
> +			#reset-cells =3D <1>;
> +			#power-domain-cells =3D <1>;
> +		};
> +
>  		mdss: display-subsystem@ae00000 {
>  			compatible =3D "qcom,x1e80100-mdss";
>  			reg =3D <0 0x0ae00000 0 0x1000>;
