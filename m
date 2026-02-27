Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DF347A0A6
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230109; cv=none; b=Na7HGzzUug8qSPcLBIPieaeJUtG0IFvhE5mrk3upEJAfCOQV9DkTc0RXbDmsbty2UwXZQcjlU6j62jHO7RgkI21QEVVHE0+xpchnvL2/2R6Kr8MbtzZ1eAzUaPAvumrLmb8fcYdMZquCiLhUqrjzAl4lNaqj1N0A+5dbCagptY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230109; c=relaxed/simple;
	bh=Mb2V1kz8SmOB9dG55Z05i6Vkzl2XRS9xEoOEgGRATdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CCRI/Ob6fq+07bqsnWccgWBAn1Lz5969TZJAJnOISOP0C1b4IMbDQvW61JRB6NnVF2Ul4rhWGtNGK2ceYMS9Iz/P/HHsLqIE9EKOdP1ArwFeYOAoZB/7UgBwC+SvrKKy+QEp6FZd/97VoE6c1qlYEgq2xkIHJGOZaWf+7Hv5Was=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yXIRqj1e; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yXIRqj1e"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4837584120eso18232515e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230106; x=1772834906; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=yXIRqj1eze4KGVBYoOdu/Zk4LqnljqcMPMFbhEUm587B2C3KDeiHzrtR/GcGTEFBVl
         twfHMZxiP16f3Mn//uYN+VA1ycrjSLx2TEUmIhLuwOyRzPeidErRgvfnE9KhfC5ml+vB
         b89IE7YlAn2ukIMILAa1gD4N3YXjjW50+lQqIE13z82M/c8X3hPwrctb1Uw2Fa+nmIYU
         UZ8psFWODopboDVWk7cRvpw3drxZ3+6s3HFDQgamINrc8UyF4gKXXyncQuZZ5Zv68M3Q
         qlPQlYr3I7r/WyzV4hk/fPh8FsgSapquAM14ArWSLZ/f2G7uDis2kLbwCaLO3DcbioVh
         zICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230106; x=1772834906;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dA5B+tb+Eq6OoOsXIA4NDTzmJV2und0D9K22z1ftkxg=;
        b=U0LjF18Y5/hFWq5D+SrOZ9BYKeyAN8VY9oVwXIPgAHNiHaat7c6bzos2eqyYMPrGEh
         HcXG7XAV438aOc33uzvW3jaUq4sswkzf6QOSYUoCyyeLXpKrypKt7rsTDxsDgXdl4yWl
         hkRhWs1gXdZ8E+Ho7o7Ay9DFtl+Sfdjf0kUOyhyHMHoXH4F4kFjRxLSjcPTupth7Jtdb
         FHh7ARGgHx6QeAYn9pK+E7bAjX/sOhJJyoslS+7VsHn0OoumsG1EuuR81hKPcbOw5GoZ
         YZi76mm0ZIxHeDMDFEhSDetsznh1URDcQzbKwjLdpwuClAwfg2pu7hJVFpiuapdJ26ro
         cbwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUfRw1oXJALv03XQ2dkPW/XYPXR2uU6KnZjQCiSXKMkXiSRUNaqlFQQ1mXmWNNUuxbqhxiz2iPG0s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDvLRgyWHZoNluy8QDRJWo9uTB9O/2lkPckQvyDSVil3WvhZUh
	5iNv/wIaLvp1ue047zCWLxKYJ5t2rb4EHTNWz/7vsfXxAubNSPXyv0NAbrmiwKonLgU=
X-Gm-Gg: ATEYQzyV87vPHVqXFupFTuJqBY6856TAl2iEjVde/6CfTrbzrs0Nus8gGxfEwfko/Ik
	MIJra3UK0hU65y9Fc0QwNiP1+vXeFG+/p4GZ6f9CIo23aCbkKnmqyJ13Tc8Zlkk6q+oTdcn0CLC
	lwtsp1N2QEX7BkvA+69WgKY7oIuUxHdYWyMKujZ+oJN0YzI7UBSQqJTrstrBJdtt1phaKgnYm/s
	g6kydqEuMQ0h2pcvMB7Flc6B8XFEEAQ26PYikritNzf2UkMW+YQXzh9gpZc7u9eN3CuPS7wZBOn
	v0jlaJupIxkjSqTjZK0y0Zut+dW1PaIn3jYnvLVjhbb81Ed5Ya/HF7fgdQfKMwqjoells7PlyOp
	asLFGxp+5HyKdRgYgDuFgnmwe5lGAmXgTg8iMhxFBJDj3+HSKGEKi2pnQj0WIgQmXYoEARln7qo
	AcPSziQpFDJtDImO1WgRgjwdGWV1RH0+DeXo6o7dzarfBzYCs4kLbXeya1eFvtQqHKYWpISOCiG
	q353zZ3JbqcZWRohzqdqgQs
X-Received: by 2002:a05:600c:1d12:b0:483:9cdc:8ac1 with SMTP id 5b1f17b1804b1-483c9b9eb7amr63356545e9.11.1772230106259;
        Fri, 27 Feb 2026 14:08:26 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483c3b89c99sm130583315e9.15.2026.02.27.14.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:25 -0800 (PST)
Message-ID: <58900cdf8f5159116b12278ba31da4aaea8d6cc5.camel@linaro.org>
Subject: Re: [PATCH v8 16/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add pm8010 camera PMIC with voltage levels for IR and RGB camera
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
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:08:25 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-16-95517393bcb2@linaro.org>
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
> Add voltage regulators-8 for Camera on slim7x including:
>=20
> - vreg_l7m_2p8
> - vreg_l2m_1p2
> - vreg_l4m_1p8
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.or>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 51 ++++++++++++++++=
++++++
>  1 file changed, 51 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index d6472e5a3f9fa..f10dff1da7f8e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -795,6 +795,57 @@ vreg_l3j_0p8: ldo3 {
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
> +		vreg_l1m_1p2: ldo1 {
> +			regulator-name =3D "vreg_l1m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l2m_1p2: ldo2 {
> +			regulator-name =3D "vreg_l2m_1p2";
> +			regulator-min-microvolt =3D <1200000>;
> +			regulator-max-microvolt =3D <1260000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l3m_1p8: ldo3 {
> +			regulator-name =3D "vreg_l3m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l4m_1p8: ldo4 {
> +			regulator-name =3D "vreg_l4m_1p8";
> +			regulator-min-microvolt =3D <1800000>;
> +			regulator-max-microvolt =3D <1900000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l5m_2p8: ldo5 {
> +			regulator-name =3D "vreg_l5m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
> +		vreg_l7m_2p8: ldo7 {
> +			regulator-name =3D "vreg_l7m_2p8";
> +			regulator-min-microvolt =3D <2800000>;
> +			regulator-max-microvolt =3D <3072000>;
> +			regulator-initial-mode =3D <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +	};
>  };
> =20
>  &gpu {
