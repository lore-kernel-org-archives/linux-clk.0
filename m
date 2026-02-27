Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A84E47AF7E
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229947; cv=none; b=BHXF/M3jHu42QsCuA+ZDaiuJjfDmt1AO7CVD5vwjE9Acqrdt2tkuKm6eZpk4r0/iTTT4QOcC3e7sc9FkArFthkO/Nt0uW9ic/nFJQQKDJp2mycTHy1YUw0sa6SwCP16HQst6i6kD8590jMRSblkp7QDY4VkN7kvE4Brl7VGdWIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229947; c=relaxed/simple;
	bh=Gb6QcE9aWdGZHOycjMfnRVrXJxZtn+RbpOpm64+TpQc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pVhp2WpfqbbT3c0CV9/zWMtdqENEEd0HqEFDqYjLb8dv4cIn5EwL1MkE2lf+ZKzxK7akm2KAR6xf0TIWNV8V2UnsBQh+arQ8AJIX7d33r+taeemROTYTkTwclKcj0TrxAA/F6l5ZThYlfazFRLt4+6zl9+nj2DCPcLtwLHt+2Zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=krn+TKrO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="krn+TKrO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483703e4b08so22391705e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229940; x=1772834740; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=krn+TKrOU3HnqkakNzoqDwrOdJEX7JC2ghY4PugqZBTlT/GGRbRooh/6Oc8NR59y/i
         pAORAZY6QmXZd6GPc5/HovR0ciI1rwvCEqY2vzbgaVrBxa959moB3qPbE3Sazn8bvmwi
         mE8B9OK/5pOyKnXBeRUt+Etu5KXZABUJjlshNuvC206YoKp2kqIp9baaT1bcv1e7kHJv
         0988yw8J32p+5KckVtUTEoFIv4Cjw2Cqz9fKqBXfkqzA9CZli4mtAngOq8fYJu6XZDCx
         7TnuAVnhiLSlfMMHB/lfQI2F3PU1vbDfZD/3453IpXiOrH5Cqk+7HEVTx3aNtjh4eOIh
         554Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229940; x=1772834740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JMcfUdK/nUzNjmnLhc+bvOBnyXoR2d2FLx4EtX6jrQ=;
        b=OoIkU0Kj9NSsvcZBP9YvylBAoWnQV/saWSMMyYi97vYwm3WnOhENsVzrq5ESKq8mZY
         HwsSyvsSYdKJQP9FMWtymAI/N/H1icAM3x2/eT2V4ew78r2qGmJgXmPKTNFGym4coQlR
         p1V4++POt6IDgquU0ofaarfuVjvXJd/C2bg5d9WNqyTpc5PPzCyav7mtk8u741ZsuHg8
         uYwnoDbzYUjRfRoUfZ8CMOofh3qMn27j/XqCmlbf9xGkQmjYOI8sUCOE8kFNrjQJ9HGq
         lvs3LjkiLie0z+DKVz7JxMOJktpucWD35wijwPX2mUw1jbA/3kLhV56hkWPhuAUPXayj
         n7gw==
X-Forwarded-Encrypted: i=1; AJvYcCVm9Q+G15Y+V21mLlvQBHLs6Of+0iqmJpVhn1VwfM/2QJWOfmp8T4feQTa5GaYeug+5fCgMdbLSA80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3a9TWO4iqXYU1G7zciWy8HhPjqhf3NHLSpNMWMBOoM2NnRIhy
	aU6PU0pyaAPzU7kMs+ZJ7Da9u7YeocmKba7rQdkU/R0BWBN0eOcQI/CvVMrILDGv04c=
X-Gm-Gg: ATEYQzwXuqa0YTIUbfVhctJe0qG5MKXNGbf8mITdabefAV/rTPGhQadcQ/fJsRxL4At
	eiCcplCGYHAhkl682VD4jWUYktNsDyQo0ROjqK0FyfaYtDcWuiq3mE949fU0NwEfurLdtLc1Hn0
	jG3QgXArSUSr2zt+GwAvq6LXrpn0jGm3acQyHbNV66GM104QVbWQXA+gk8h7HeT+uhB0TiXZBvy
	ExnHWU+8i/OxltT9yDFrHDd011/LwaRebZlTaI0Pzenq7s+BIMh+yrtrOovmMc2ucHNWqGCtccp
	t+3ENSIKX/V9iGPP8xy5Oh2F0grexvXQiESzo0MNLkpbIw4JRF5xb8u7hSHd5r0iFuKjUzTk1zf
	0o12NveqsMQ3zvz4vuE37ocF2cqxVa5XyhOuhi0eWPKQyLmkG7o3lqZyFh52vj2lQfHy8GFF/Zo
	eYo3f2VTjU6E2qtoGQ1Q0fBqRpkuJUf94k59vVpfqv3OOLGUafI61V3EEVMYlZLXmRx8P7hhZ94
	1nQCHkiAtDpRKZ3lk+fOx4qLYABtUgAOo8=
X-Received: by 2002:a05:600c:1549:b0:47e:e59c:67c5 with SMTP id 5b1f17b1804b1-483c990de68mr72621495e9.8.1772229940362;
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765c67sm10252283f8f.32.2026.02.27.14.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:05:40 -0800 (PST)
Message-ID: <a90ab7f217e3d2ad4ac9b926fcb5c9d8a6ce43e6.camel@linaro.org>
Subject: Re: [PATCH v8 12/18] arm64: dts: qcom: x1e80100-crd: Add pm8010 CRD
 pmic,id=m regulators
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
Date: Fri, 27 Feb 2026 22:05:39 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-12-95517393bcb2@linaro.org>
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
> Add pmic,id =3D m rpmh to regulator definitions. This regulator set provi=
des
> vreg_l3m_1p8 the regulator for the ov08x40 RGB sensor on the CRD.
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index ded96fb43489b..c89f5ad0aed56 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -865,6 +865,36 @@ vreg_l3j_0p8: ldo3 {
>  			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
> +
> +	regulators-8 {
> +		compatible =3D "qcom,pm8010-rpmh-regulators";
> +		qcom,pmic-id =3D "m";
> +
> +		vdd-l1-l2-supply =3D <&vreg_s5j_1p2>;
> +		vdd-l3-l4-supply =3D <&vreg_s4c_1p8>;
> +		vdd-l7-supply =3D <&vreg_bob1>;
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1808000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p9: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p9";
> +			regulator-min-microvolt =3D <2912000>;
> +			regulator-max-microvolt =3D <2912000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {
