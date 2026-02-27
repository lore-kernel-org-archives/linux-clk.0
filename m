Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576A847A0C4
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229814; cv=none; b=ZRByh3KGBpzMkkNms7keZB6ZNR1AzKuSqEdRVI1Yrv0X5TvIsq0be/ix/IdeqLGrY06JV4tlYh18dQzB6XmkIUzOqQlJmT4w8EoQ3sPiRsQbAnpzO1bfZD6uQizODbyJXl0/XuBTFe/tMCTioMvGru94RjHxua1L+8il/7K7TMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229814; c=relaxed/simple;
	bh=P2W5OeAUpE8W0m/2mG4JAdANmbJNvyGxA62EsO0TwaU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X0Wz+Er5VQOdQqU3m8np8UOaEs13DCv16IgLQYuT6OyzLPCxRKxb9AoOtvVTI/ubiAoIYvj+l7keirNPWWnkmXpVQ0RCf2Ndy1PMH7CRZ/x9qOAbiW1VLnjuK7cpXSdfTjti+wx8+Wrvw1jB3hQO16jUWwvP7K2RZmODK99NuJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AXVSIq/o; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AXVSIq/o"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43996323357so1309867f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229811; x=1772834611; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Iwg7YUZ0r1LAUEvFmzagwdKz0teH6aiApB7iFdGE2sw=;
        b=AXVSIq/ocUCopKWgIMKLku0MZiTnHs041Cc3ivkKPVigLW8yJqQnTskRlF4jVBiYpy
         alWiGfgf6FgnvJsxk7lRM06n+u76zEjj1PstVNtA4ZjX8HzVPVYFscR5Uq+SQphLo497
         8QjQRODilPB6k1yFQa/WRUX0/Ss8oiki3Kv+R29j/VlxNZzdyywmNG/8J+VWLV36WTvP
         HPnnlTSJ0WGyFmfEesaswDiYvqLOtr3hC5c0d/NsBAYaxm4z1vT0BbM0pqHbEoWpBvYh
         YCXi+TmUKsECzRc8D7vV7pxi0c1BgOeNV5MnZCAG/sjThRMF3rxwZ332zr8VFGFELWFB
         oXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229811; x=1772834611;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iwg7YUZ0r1LAUEvFmzagwdKz0teH6aiApB7iFdGE2sw=;
        b=BuAqe5pk3CzjbI5IPay8LA0troIZGE+RDtJZU3CwHbX2OckqSEd5TLA5BZNH9cxVdV
         K4JiGxIdc5cuE8dNNXuJOknudu8eZI5HEP56DgTxbEYacbjCcboPVxBxVFHQnEJ20d4x
         JFgFsukyNOp33MAjWzAKPb1LyatFikL+G5raZOmYYqlU8uukm0/5mJSHSk7GIc6F0iV+
         fDvFuAiQGHscaEAtuoyWiYJafIrLNWGJ61xJnRW+pZcSzI03WHWsWWQ485RbyLnaimIb
         tDC9pySbzKjyTwzpqFJ5p5kjNCxq1lrsrN/k9/Bz6lfv3MBf+k8xDUpDronB0EWI86yc
         fAKA==
X-Forwarded-Encrypted: i=1; AJvYcCXFPr/CBHMoDoyuaJWVjbGlRlRmqwGT1wWoCKpz5wr0vqfqcP3BKSxyKf9OlJu+Ud/OMVGgiXR/bbA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpydFzKOG/v2GJqPVxOiE118JVnkcv9uKUhXl57flsdiu7c1+o
	xSot70TAmC8jEFZz3dkqtHaxxd2dTK3iV7HscpT8gxZJJAqfu0+WAYa3trMNCzy2V9s=
X-Gm-Gg: ATEYQzwLovE/HNkHbX82elY0ufuiabAbor+pTMM1OID50SA9WvMvfU2OwSCm1LYwlrE
	Yd4hs+bzyNR/mvrYwlp63Tr2rfswqOE0r6PJRRbzjEt+tEiMqbqgzUuaR7bExFNI6e5bLEm4GlO
	34XtAw6nrW132D3oAgQVdgkXYyqXUi+aU9CF43Uoa6E0aTNannzOxyPP4AheFnhj18UZSdytwDJ
	nxcEpWuf4E4wLFems9IYLgIwmtzwUBmD4XB2CvDuFfjn3ELBsCDG5c8ttRcUnmOy6XpHU9Te+W1
	OdYpztdnax682PDjRX8xxdnhENEpClCf+X2sVY7OscPdfbXBcPIemqCSfdDtkZZiIuTjxuCKSJO
	rO/iC/yjKI2CXNOrOGk/h+lQHMiccBcLTgZ9qUIeHqhDy4P8f79M1JpTdubI07SUa2UhtFSOggV
	PqPjqWWnXxN1V10Jp1qS024sRauBHIpJpZEa4xWDsmwqCcW6vHeyHhaap+zEJnC1TODC8W7i097
	rMvHn4V8DkAAZjcg8AV/F5Y
X-Received: by 2002:a05:6000:400f:b0:439:8d48:544c with SMTP id ffacd0b85a97d-4399ddf46camr7891925f8f.19.1772229810563;
        Fri, 27 Feb 2026 14:03:30 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75a0f6sm11738508f8f.22.2026.02.27.14.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:03:30 -0800 (PST)
Message-ID: <d2d9601db1e4f6066a6c034c2f09d6e6f8b62a32.camel@linaro.org>
Subject: Re: [PATCH v8 07/18] media: qcom: camss: Drop legacy PHY
 descriptions from x1e
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
Date: Fri, 27 Feb 2026 22:03:29 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-7-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-7-95517393bcb2@linaro.org>
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
> x1e is the first CAMSS SoC to use the new PHY interface. Drop the redunda=
nt
> legacy CSIPHY descriptions.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 37 -------------------------=
------
>  1 file changed, 37 deletions(-)
>=20
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index b1737b5d52160..0ebe634f5d96b 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3895,15 +3895,6 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>  	/* CSIPHY0 */
>  	{
> -		.regulators =3D {
> -			{ .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D 105000 },
> -			{ .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D 58900 }
> -		},
> -		.clock =3D { "csiphy0", "csiphy0_timer" },
> -		.clock_rate =3D { { 300000000, 400000000, 480000000 },
> -				{ 266666667, 400000000 } },
> -		.reg =3D { "csiphy0" },
> -		.interrupt =3D { "csiphy0" },
>  		.csiphy =3D {
>  			.id =3D 0,
>  			.hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3912,15 +3903,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>  	},
>  	/* CSIPHY1 */
>  	{
> -		.regulators =3D {
> -			{ .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D 105000 },
> -			{ .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D 58900 }
> -		},
> -		.clock =3D { "csiphy1", "csiphy1_timer" },
> -		.clock_rate =3D { { 300000000, 400000000, 480000000 },
> -				{ 266666667, 400000000 } },
> -		.reg =3D { "csiphy1" },
> -		.interrupt =3D { "csiphy1" },
>  		.csiphy =3D {
>  			.id =3D 1,
>  			.hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3929,15 +3911,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>  	},
>  	/* CSIPHY2 */
>  	{
> -		.regulators =3D {
> -			{ .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D 105000 },
> -			{ .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D 58900 }
> -		},
> -		.clock =3D { "csiphy2", "csiphy2_timer" },
> -		.clock_rate =3D { { 300000000, 400000000, 480000000 },
> -				{ 266666667, 400000000 } },
> -		.reg =3D { "csiphy2" },
> -		.interrupt =3D { "csiphy2" },
>  		.csiphy =3D {
>  			.id =3D 2,
>  			.hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -3946,15 +3919,6 @@ static const struct camss_subdev_resources csiphy_=
res_x1e80100[] =3D {
>  	},
>  	/* CSIPHY4 */
>  	{
> -		.regulators =3D {
> -			{ .supply =3D "vdd-csiphy-0p8", .init_load_uA =3D 105000 },
> -			{ .supply =3D "vdd-csiphy-1p2", .init_load_uA =3D 58900 }
> -		},
> -		.clock =3D { "csiphy4", "csiphy4_timer" },
> -		.clock_rate =3D { { 300000000, 400000000, 480000000 },
> -				{ 266666667, 400000000 } },
> -		.reg =3D { "csiphy4" },
> -		.interrupt =3D { "csiphy4" },
>  		.csiphy =3D {
>  			.id =3D 4,
>  			.hw_ops =3D &csiphy_ops_3ph_1_0,
> @@ -5362,7 +5326,6 @@ static const struct camss_resources sm8650_resource=
s =3D {
>  static const struct camss_resources x1e80100_resources =3D {
>  	.version =3D CAMSS_X1E80100,
>  	.pd_name =3D "top",
> -	.legacy_phy =3D true,
>  	.csiphy_res =3D csiphy_res_x1e80100,
>  	.csid_res =3D csid_res_x1e80100,
>  	.vfe_res =3D vfe_res_x1e80100,
