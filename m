Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3F6BFA6
	for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2024 21:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718573401; cv=none; b=Lcx8z7X94idKezDov8bpGTu6XB9gjk0o6XBELqIV4XFAbQ45G28C+/Qgr8viTYzr5soRRZmZzuEQ1bTiPgWPfDjqdJZFwdrEKpx20sb8f79CZMbu5NHXY8gYWvAgzFASiZLD+EcoWLXKbwn8WSDgq6W3NjlZ/4AjRbDQWvL6oB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718573401; c=relaxed/simple;
	bh=77qTZ2/jNB1s3kvHZeR23oY3xoIE8oX+Pbgo1oPSZVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxq6rjjdtilMK0D/Khcpri/pKIf/QAo4+GecYzTvJYmadcBHgZlit5OVvsCWMsSdkoP37B14/nmLE8hC/QiNPowcW2Cj5OgB1fVS86+jhSYiMBH79ZuoYeZtSmivuaQB7MTP8l/WuMVd2UXMwQ3hzQ9IrGCSGvggLaC/kMStFM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aafkBiRj; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aafkBiRj"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a6f8b0b10f4so10755466b.0
        for <linux-clk@vger.kernel.org>; Sun, 16 Jun 2024 14:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718573396; x=1719178196; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=aafkBiRj0Yn6c/bZ1p14eumNaiQ/bsJFCm37mOdKdnaPCC4XvrnCYuioEZO8WssSwO
         6U637L21bQHhTg9w8tJYYy2hKeR+SxJFPzkLdWhOqoJXYHBSsa+J8nCyN8zpMloL6K8a
         yZUuxrMnQUV//AliVgRgGoPDPt6bySgxZDyxVSHd2vxjKufne1dBh97wtR9uIOQj3Mdm
         B+I9ATkEwxemVMAnxE2mSgRDXyEvY6plAI8GZrMxr9uc7ZPCeDgVP5XVP9xpsFqqvvTS
         aV7UTIsvHOTjdhVbLbtgTs3qS3/NHg4Yp1UEHVf1ajOhEsb/6atr3qlZNA123inXNWDi
         77oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718573396; x=1719178196;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmVQxJoiRRnVxUmJPLxuy9ofoBMY/z2Ox1ZWQdCQeiQ=;
        b=PBG87uffBnXEUrQcVql4MpVQ2aZW0dHrBpG+99e/Rkre/XIhDGh5ZlDt1YcRWdvMfz
         UXq3HEt0gJTl3m6EeTRJe+Oc0mfE3KjsceD9vs3jceExqn2JT4Yj/YfqJxZMUXJSPFEd
         ho+DXx6KpexH4VK8K4MCCjUoSp82If8m+2J/HL/igiH0Cmh2FRzbjEjCwBhGRYWuQALe
         GQqAV+ZE2SgdVIAJ+8dnr7rEQnojITki7JCn3Xxy8oHt3M3yYq5Qqunk1HKYkE4Ynzvr
         VtOgwFnUkpv8R1InraObxX4nNJp14yGrABiTmP6ktzTd3SYvrGBVIv5EaKHsFnV4ZQAd
         cUKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLQ5+RMGk0CarfW6WIvT/HGurs93+T14j0NY6Gplg2CyLsdYp2I8TbXxR4hBXVRzBjiTARAJLd7IP4o5iIN7rB4/0RFXSYhwk8
X-Gm-Message-State: AOJu0YzvN4ON3BZYV48nZCIHiOWBJxYrh+4MSlxP4vvVyo6ZKBD76eHk
	EAE0wefuVsPhW6HpGltjEtBdrdIFfdD+ApND2yHzB24dTMgSmAHJ1Wu8vvU7NbztKBsg0aVGPe8
	6
X-Google-Smtp-Source: AGHT+IEvUS/odyJPhKK7Glqf82cIjEvLFIs9anp+ZsBOp8SFgZaTIpP8nTwgP28wMtCwtrwni3h6Dg==
X-Received: by 2002:a17:907:c302:b0:a6f:6337:1ad5 with SMTP id a640c23a62f3a-a6f63371be1mr650604966b.27.1718573396000;
        Sun, 16 Jun 2024 14:29:56 -0700 (PDT)
Received: from linaro.org ([188.24.162.56])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f5f1c8d6fsm384984166b.0.2024.06.16.14.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 14:29:55 -0700 (PDT)
Date: Mon, 17 Jun 2024 00:29:53 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: drop stale Anson Huang from maintainers
Message-ID: <Zm9ZUWpievH+P8Yc@linaro.org>
References: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240614095927.88762-1-krzysztof.kozlowski@linaro.org>

On 24-06-14 11:59:27, Krzysztof Kozlowski wrote:
> Emails to Anson Huang bounce:
> 
>   Diagnostic-Code: smtp; 550 5.4.1 Recipient address rejected: Access denied.
> 
> Add IMX platform maintainers for bindings which would become orphaned.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> diff --git a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> index bae4fcb3aacc..74cfdcf1c93b 100644
> --- a/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx6q-clock.yaml
> @@ -7,7 +7,9 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: Freescale i.MX6 Quad Clock Controller
>  
>  maintainers:
> -  - Anson Huang <Anson.Huang@nxp.com>
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Sascha Hauer <s.hauer@pengutronix.de>
> +  - Fabio Estevam <festevam@gmail.com>
>  

For the clocks, please add me as well. Don't mind having more help from
the others :-) . But i.MX clock bindings usually go through my tree.

Thanks.
