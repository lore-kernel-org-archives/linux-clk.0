Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3293A3128AB
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229668; cv=none; b=LdL/dZiIi78+zoPzAxZ7hsIM8xmZ+GlxUBdI/DYHJLCMRsg73HsUqda03g0whdUaMdfdz85lKVaRoKDWVQvef7a9r1LkR9HDRJeX9qb0AOuTAovz9LA6ziQaNFXvFwKOxeLnqFzEFXCDY6o2zgHLnbTDoMRlbwR18qIx4ko2Z3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229668; c=relaxed/simple;
	bh=mAzcRoJBasmeGlXQNqZiZH4u/NL//5nG7PikmKl8E6U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HfWFxvZtweSsu7EGnRmlImhcYdXafLABtTIjnHNfe7f2HCeioIMUQm8CZXIht9pnlGjYVIdOtdbUUwTVuwzTwIL3oeDWGWVnnqC+ysG8ndA747uYwh1oWwuV6MgVuZuo0mtoQkQQPgxVLNJ+Jfp8u8sduLBcpkYPVIerIpHaG3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QN2PkoMv; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QN2PkoMv"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4376de3f128so1735781f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229664; x=1772834464; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qfcMSv/VkkX2uxiYYkJjDIlwc6S46+mM12tf1ZM4Tyg=;
        b=QN2PkoMvMlGWfE+Gestx6+y95fnJ3wbNZOdqTV/KUwM+iRFcg4DxfZGzK58RrSOmp8
         A+TGIcFCQDukgXjgWgghnX6GCmaUe//uC6XjfFXG+0TDmgkzhUnJQ8mkeLNKkxPnXB0K
         AR0BGUxlD99y1t6Z1NwzW0pB8oxw1zbBJ/b2tRlHAlKNxojsKyk+am6Jfr0JZHhZGJbN
         DP+QPX2uSwzO49jliT80YsZiwY3ReTuypO3FOYxkasoVyOIBVpiQUMZfCg+7XyQGgkDD
         ZO+t54nUuGksQa9BvYK57IUzXy98tY5p3UrAfUCWd454edDNTjCkJiKvBcUfQ34pyvXa
         okcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229664; x=1772834464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qfcMSv/VkkX2uxiYYkJjDIlwc6S46+mM12tf1ZM4Tyg=;
        b=SCIDyKciF+xnzR6KQXKRic+Hkwk2l6OaF6WEAkcRxJfBCNFSLPdh/Yevc0UWZjgZGC
         pOO2eJV2Z0INqHfhAewOfqr7yHJtdxgE+kEEOHGGQQ4i97NoDOH0uR1m1ccClea80oz9
         uMES21oCiIa39yybECHRNRrRxxYSXxdkeFUbVUwV0IGXQH9mbudh3hdsoE+fRxR9Smuk
         bRqdHEjVXhhlSaoP/U0dvS3ppZSZVtv50mx2JcvU1XhLFN+kQsv2v2fQuQcUq4Axcd1e
         iXxOYc70eGkO3ijXp0EWqRrw695oCrpyEVfDWkAOyDBZEROswqc2z/E13J/edUd/Eefb
         ppFw==
X-Forwarded-Encrypted: i=1; AJvYcCXMJS9WsFdhEBR29kr7UzTBeFfK5wdxKmtnVL9Sz+xyIMlV9c+XCd39dDwq9uTI7dM1M0f/zGq+mfM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb0l/sAaX/PbGZCJj+2N6XNQP4YNMqWoAakdJmHSS97NNQStDv
	x5hathC/tSeQUsJZe278cU1LjxG/IJv/0o52l6CdUjvrFnmWVJW+UF1zD2AGzAgd/gE=
X-Gm-Gg: ATEYQzzj+grw5S4LL7L/0ajGCFbTcVNQggD9Cj9ONbR9gd+Zm8G1E3R3pgMi1IYBD2W
	j6WCQJzzXPO0u4cdtKBM5+Lw0nBS6LriKNeUjDFFIHDjFFt/V8UghzlG/5wxuNz3IstJ3nQrHPU
	TN2Nmr/GQzd5okgqvgD9fYyK47vLsSXeSrBMr8iANwaFGcp4ipwKxMVT+HD2ZsKcSCaY1rK6v5C
	uE0K6WQoKWgx1K7s4qFr/ol6A3sPv75v3dZ6DvbotiXygQslDhwpX71ng9YkQp9iCVuuRL8ICq4
	VV7OAJ3J5vJEKvtgoKS14k3L6zRABq4LtnFoSk9QCQJ39mfZhxFS3a7b95dAkXlhTgLi4ySkVCP
	Fmdq14t76o+3ul85MY3nJKTnqPKCoM2rXGhkYq/NOe6i1LaYN4KLFYBbsa4L9WFcKN4hwoCsx8y
	66FzgRtTuVxasvPTntivdz9H5UMwho7+iawGEf/0AV/cLjKsFEFAdVxOUzc6Q9l43voY/S112wc
	HNAEhRR1zJ8Lsbyo+JIqdI/
X-Received: by 2002:a05:6000:4301:b0:437:719d:a753 with SMTP id ffacd0b85a97d-4399dddb9c8mr6708195f8f.11.1772229664528;
        Fri, 27 Feb 2026 14:01:04 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c71b75dsm9137081f8f.17.2026.02.27.14.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:01:03 -0800 (PST)
Message-ID: <233492977e4d890fa90fcbcac66bcbb918d63bcd.camel@linaro.org>
Subject: Re: [PATCH v8 01/18] dt-bindings: media: qcom,x1e80100-camss:
 Assign correct main register bank to first address
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
Date: Fri, 27 Feb 2026 22:01:03 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-1-95517393bcb2@linaro.org>
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
> The first register bank should be the 'main' register bank, in this case
> the CSID wrapper register is responsible for muxing PHY/TPG inputs direct=
ly
> to CSID or to other blocks such as the Sensor Front End.
>=20
> commit f4792eeaa971 ("dt-bindings: media: qcom,x1e80100-camss: Fix isp un=
it address")
> assigned the address to the first register bank "csid0" whereas what we
> should have done is retained the unit address and moved csid_wrapper to b=
e
> the first listed bank.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

> ---
>  .../devicetree/bindings/media/qcom,x1e80100-camss.yaml       | 12 ++++++=
------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.=
yaml b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> index 2d1662ef522b7..9aaed897f7e0e 100644
> --- a/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,x1e80100-camss.yaml
> @@ -21,12 +21,12 @@ properties:
> =20
>    reg-names:
>      items:
> +      - const: csid_wrapper
>        - const: csid0
>        - const: csid1
>        - const: csid2
>        - const: csid_lite0
>        - const: csid_lite1
> -      - const: csid_wrapper
>        - const: csiphy0
>        - const: csiphy1
>        - const: csiphy2
> @@ -190,15 +190,15 @@ examples:
>          #address-cells =3D <2>;
>          #size-cells =3D <2>;
> =20
> -        camss: isp@acb7000 {
> +        camss: isp@acb6000 {
>              compatible =3D "qcom,x1e80100-camss";
> =20
> -            reg =3D <0 0x0acb7000 0 0x2000>,
> +            reg =3D <0 0x0acb6000 0 0x1000>,
> +                  <0 0x0acb7000 0 0x2000>,
>                    <0 0x0acb9000 0 0x2000>,
>                    <0 0x0acbb000 0 0x2000>,
>                    <0 0x0acc6000 0 0x1000>,
>                    <0 0x0acca000 0 0x1000>,
> -                  <0 0x0acb6000 0 0x1000>,
>                    <0 0x0ace4000 0 0x1000>,
>                    <0 0x0ace6000 0 0x1000>,
>                    <0 0x0ace8000 0 0x1000>,
> @@ -211,12 +211,12 @@ examples:
>                    <0 0x0acc7000 0 0x2000>,
>                    <0 0x0accb000 0 0x2000>;
> =20
> -            reg-names =3D "csid0",
> +            reg-names =3D "csid_wrapper",
> +                        "csid0",
>                          "csid1",
>                          "csid2",
>                          "csid_lite0",
>                          "csid_lite1",
> -                        "csid_wrapper",
>                          "csiphy0",
>                          "csiphy1",
>                          "csiphy2",
