Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A7F15A87F
	for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 08:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724834754; cv=none; b=gM9GRPL67kkOmUOQuvpGZTykapNczIliTe1mEFwFFHs228sRhuGuuiPppSReMLngNBrsvseY/RAOn1XzuEdFBCDd2EI4qfj7OiSoCRCfLzlYIyCAjHliuQYFws2t6miOiaWgIxApo2EZjF4/kjlsEncrNEwbouj4hSQL9GVSQCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724834754; c=relaxed/simple;
	bh=yu4Wy0wOcgEQcfzt1v6vuNg/URcukRaqet6Jqj3F69g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J+sZUEVf36M9LADyIhQzzXmZoJ04FwmHj7DVeximuCnjkKyEC3U61aQkyNqf67S4Y6lUBwLemYkrOX8EtOp090QEp3H9LfQgdN/CIhJphZEFtua/fy/R8tWPM1MJ7gDAULc9VQsXHvrKGL/I+IrK8WMZMPV11dv4eposSWkfA4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=siNh6tgY; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="siNh6tgY"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53349ee42a9so7693318e87.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Aug 2024 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724834751; x=1725439551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vdBIi5m8EWzWp93xlsbcf9ZPOqz4SwEvCdHpMtK8yDU=;
        b=siNh6tgYFdG5L3dy1prcX5AvluHDhQibkzL3uRB7JgU19vPcP/Uym7CaNt0hwxfoQo
         BfemX837yo4Y+Gd3Yg/ENT65IiAVmERbvmGo4y22IRKRRMDZtJCthC8ilaNq8Kd+OoaA
         R5X/vFR6l1RO+Txljh0D68N3q6ji8u4Q4Ax5QaVG57MdFkozKYjPb+dwh2SnEDtEmKeU
         f2r/Y0LQloVmmmzt6LCIdCJ9QRxQb/RKzQ5jeJy0n53XN9oZYrgv3yYvsit6eMBibIqh
         mLPRBwRryM0bNyIARcyTtBu9K30ptIm0g88eHwpPJgt17Tn06ESGpTQvK1+hz67Lersz
         +wZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724834751; x=1725439551;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vdBIi5m8EWzWp93xlsbcf9ZPOqz4SwEvCdHpMtK8yDU=;
        b=sI0T+T8x3YIhLlagWmkVLe57cq3xguDs6hbDbGa9a9XbBFeS9KUewgqp8sf7WcCyy0
         U2ynMKtI80TEIOXlbA5I/44TFUrnCg4uCcU1Od7kV2mfdTyoGehSp8A9bOCbzdWIMCAV
         72ZR4dIFAWssZnMNiEeaHFy5FIP8RQlqRn+pGNsQqKfv+YLlOYTAeNR7bE330J6pLEcq
         ov6vaLurODCiiwyXo1kyi0N22N93SVjq+fR3/lKNPJtvsUiX5dzVdksjxH8fdIqs165/
         q72Og035ko4YouiR3BuigUuVL9Hn0q6AD6Eu1SojT5S/899sqVXVBMlxLjd20+YUpKjK
         onvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwxX29n8hzS/f8ATPKumGoMwp61wAA6NMMHxagTj37HbmatYNnkOvCrQv/MNA9m51w4WFhzk0M2rY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZpz1bOjw/a8q9fSw81350oB9lMNggyTPz5zRJi7yYZnTKWhOx
	x8fIjblA79UTqE93mB6u12RzfVKB8vfCm+VzX1ATEVi/eiRqiU24eqisCeBumG4=
X-Google-Smtp-Source: AGHT+IHWxfcTIgRBRkO/+YAr6ZW+2Y5xXvy9KTaUM5ZOJKXQFVXhMO86M5E4uZUCWTKcKt1OVXzUNg==
X-Received: by 2002:a05:6512:224b:b0:533:88d:48ca with SMTP id 2adb3069b0e04-534750c2934mr986691e87.55.1724834750626;
        Wed, 28 Aug 2024 01:45:50 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e5878562sm211665066b.156.2024.08.28.01.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 01:45:50 -0700 (PDT)
Date: Wed, 28 Aug 2024 11:45:48 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	festevam@gmail.com, abelvesa@kernel.org, peng.fan@nxp.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND 1/4] dt-bindings: clock: add i.MX95 NETCMIX
 block control
Message-ID: <Zs7jvCHO+ifC3VaT@linaro.org>
References: <20240729012756.3686758-1-wei.fang@nxp.com>
 <20240729012756.3686758-2-wei.fang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729012756.3686758-2-wei.fang@nxp.com>

On 24-07-29 09:27:53, Wei Fang wrote:
> Add 'nxp,imx95-netcmix-blk-ctrl' compatible string for i.MX95 platform.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> index 2dffc02dcd8b..b0072bae12d9 100644
> --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> @@ -17,6 +17,7 @@ properties:
>            - nxp,imx95-display-csr
>            - nxp,imx95-camera-csr
>            - nxp,imx95-vpu-csr
> +          - nxp,imx95-netcmix-blk-ctrl

Move this above vpu-csr, please.

Also, for some reason, this patchset doesn't apply cleanly.

Please respin.

>        - const: syscon
>  
>    reg:
> -- 
> 2.34.1
> 
