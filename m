Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08C387580
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229724; cv=none; b=C3fLU7v9Lds8hX7/cbuzGVlbh7Ms8suw0kfKLRf+mFw9oIvfImU6WjCGg8Bv3suVmtafIfxA1jS9o8WSnKr/CUgtAljhORurfnKICI3YJ9tBPRSeC4WD35lnQ918miyi45wl0QiIN0A0eaOTsWWS8xmjt6z1WYtLy6XTX1AlLgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229724; c=relaxed/simple;
	bh=0XfJAAwPpqZPTa0S4qXdpqC5AbA+tYTKPN+ODpQiwPw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E/i/ofn3F13tGIEwtwV1MkMjQgBbkRLMUqEBlM1Hf7hbr/+O4DBy3tSwqsDjOrGFdtAHhBahxj1N9qrb4H9XfC1gLDUPWnRrApJq8EXWCkdVDMZkJ6PIQTxSrWF0mKAdKWo/Rw5Ot93dh699qaZpqVdKuJutQjNboWhZ1t125as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zb6xL1p9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zb6xL1p9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso21862405e9.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229722; x=1772834522; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tBsw+oV5b4W+q0aJyjGVPBNMIWpF08k90ryvmytPfX4=;
        b=zb6xL1p9x/bHkcL2dvE0RE2kZQVvdWVq5/8k0525HWTE9GdQ2gqRbOYqhyU+CbUVAw
         UExSA5PXugxtuOEXJJF9VZe6qT7L2MivWLvU9OtuWan8lWAVsOM0Utg6Rvv2IeYPF96D
         AyJ9G70FhrbTBud4F36hvrfDweCrrLnK4hxyFgVsR0MppdzWbjcKPKLhPRusaDQ1G7mk
         nCGHZAgErcRLEVi7dT3hNM9KiRh7YGF/HoI3ljGJwmUwW77rTyoyznLCDSul/4WSl4TA
         XjCANZkwbJZhRDUViZG//MNE/KNiw7OEnzPlGCV191uFQTWoh1KbOYdszu45e2Uc+ngb
         nAmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229722; x=1772834522;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tBsw+oV5b4W+q0aJyjGVPBNMIWpF08k90ryvmytPfX4=;
        b=sAiwpDe960ecZYe1mUCLAO9hxBMVafCo0Cl9K/akOaZ3hHmgQCxK/nJG3xjXSILuoa
         R3cW6W6WZCjmjMHPnxSBv+Y2ipb44x66e2jAJ4NyYsdE/WsxNrxaCpI7pjrfd76l1P+R
         7EfWUtDhRQ0fH86PQRiVGk9R1eRycKlyJ+0G49gEbZYLgXQbV75eriqeUtMXh1Twr2Lr
         qTAMPTgvNLlmy4AceHbKtictmWtRX0hTjpVuxKNk6/NfmzQAStW1w+dOPADnSoGz4KGl
         2cA+ZsbWRuc7HE9yeaNMQA1CmPQuUXfy2YA0J3/p/El1Z+IMxPdLul7myODvV4L8S+wR
         Leug==
X-Forwarded-Encrypted: i=1; AJvYcCVUgMCMVgCaRU91t2Hxu4HKMRa+ahOK5sy6p4BBnvOQgyuV0QIJBzAbDCx1tji1OLw0u7oE1OPyfc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3mZzCBgpR8Iru/vEfdI2STI01g0n90s+cj8KHinSsu1T9YvQO
	B9Bdf194cXfVZzPivm/Cjx491vjSBPHKK6qyJeIifS1e/A/7k/0anzzyNnWaPGrJCmM=
X-Gm-Gg: ATEYQzy3VpMkybbEGgV1IsI4iWmwDHfc7rKLw2qWe3Q33LKvPHWPx8VkduRHzVxYcAa
	S+4qcj2YEl3Pt4xhy9ZcudBytRs+krki+i17Fxcuc1xD27A0yhxqB2oj8570IDqNMZ6Gtum087U
	k3IFP3MwEm6ZnkJiS/NHoZwj+nY9O8ShKnlOIFIyamgze7BM3GhiyGPPbUrhGRdJhIs0mZZjY97
	OF9lfEZjz1G5BkLaHhLMznBy/IOvr1g/B7xf72rC7pIU4xyV5eTGmQII2TSZ5mmk0ekGRWF6B6j
	0LTmU0PyG3AnVG9A+vsuH898eoj8Szb2XhzXIsSGVFhAKM8aqkFsu8JCA4aarZ5Wi0gfZFO6Rta
	RYW/tQ7Z/Dx7/j1P6ATAdSBKtRosHdpMo0aCGoVPI7L2z/2+qEXphSNxAeJvBZt05vRUUwjm1r5
	XTXQZueRZaNzr+IwbgC30014/0KhBm8xdXHBNExrXNZGSqVpC/SkY+8xp29NWnDmmpRRnEwaO2y
	yRy/K7sMFVBv6W0jfsz9oDZ
X-Received: by 2002:a05:600c:c8f:b0:483:bf23:1915 with SMTP id 5b1f17b1804b1-483c9ba68fdmr70282765e9.2.1772229721570;
        Fri, 27 Feb 2026 14:02:01 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c765b6esm10086901f8f.33.2026.02.27.14.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:02:01 -0800 (PST)
Message-ID: <e00a03a6728a92f34f7fbb431254f908d0ea49f9.camel@linaro.org>
Subject: Re: [PATCH v8 04/18] dt-bindings: media: qcom,x1e80100-camss:
 Reduce iommus to five
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
Date: Fri, 27 Feb 2026 22:02:00 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-4-95517393bcb2@linaro.org>
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
> Rather than bury the BPS and IPE inside of the CAMSS block we can define
> them like the CCI/I2C and CSIPHY as their own individual devices.
>=20
> Remove the IPE and BPS iommu entries from the main CAMSS yaml. There is n=
o
> upstream user of these iommu entries right now so this is safe to do.
>=20
> We will instead include these iommus in the BPS and IPE device nodes
> instead of jamming them into the existing CAMSS binding.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml | 5 +--=
--
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 462b1355c9fb7..d39013d4a83e1 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -98,7 +98,7 @@ properties:
>        - const: sf_icp_mnoc
> =20
>    iommus:
> -    maxItems: 8
> +    maxItems: 5
> =20
>    power-domains:
>      items:
> @@ -353,11 +353,8 @@ examples:
> =20
>              iommus =3D <&apps_smmu 0x800 0x60>,
>                       <&apps_smmu 0x860 0x60>,
> -                     <&apps_smmu 0x1800 0x60>,
>                       <&apps_smmu 0x1860 0x60>,
>                       <&apps_smmu 0x18e0 0x00>,
> -                     <&apps_smmu 0x1980 0x20>,
> -                     <&apps_smmu 0x1900 0x00>,
>                       <&apps_smmu 0x19a0 0x20>;
> =20
>              power-domains =3D <&camcc CAM_CC_IFE_0_GDSC>,
