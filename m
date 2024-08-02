Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B015AC4
	for <linux-clk@vger.kernel.org>; Fri,  2 Aug 2024 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722626452; cv=none; b=I3KrlmkP+XN+Lks9QmI8Zmd9HR9s2q7C/D8n8balzS4RBFS2E3EBbEVr4ERTbfj770szHCa9vXdD8EB16l4vohI4gPHtp4SdkJHtQVgaTw9kuraMJCvR4XQzo0nOx6z1TE+Z5xo8IHmRNTDqcx+7wwwl6C77rP6IcqTiA6y5UNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722626452; c=relaxed/simple;
	bh=jbgPxUaRpWe7IUV6OPVfKHMd2VVjNZeOVIHBRBVc2Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVWvH40nZuSvJW/UM07i13sVXN8RuQML67pzyXt5vK9Uw1pxK7zBiMoCKVozsTZyPJxWNQEdvgsagtY5TI4TfyEUaf9iGHuIWrj3T5LmQEVS0IXuApaeD/65SLku+CA2sF5+7pWqji4Aqy3sKMWntwoIUHg4MxU3wKJHJNKi+nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h7f5owDH; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h7f5owDH"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-654cf0a069eso68196237b3.1
        for <linux-clk@vger.kernel.org>; Fri, 02 Aug 2024 12:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722626449; x=1723231249; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=h7f5owDHZCyceSJcMJflUWGrQOKrmAMf/DVuI2Y9BVtqZEYDSY42rZlJns5OQv4Jgm
         kYUdmYFVRH9jgJFVUY/lzW8fZjdQ7bpUHhAwfFrNCPL1hO7ZwVGFNxZV4GPWy5t7W7pN
         5AspOYE4RzVLoQfp8jeSCUuXwyeKvH+htIIqS4kzQxdMtr8A8hP/yHWq1GhdDTv4baZ8
         s2QNueIaZxpEq914c4C7ZD+k5x3xFP83LeCV6WOlIzF0lFCTRGw8nUyhNKTAwY9ys28A
         6IWuNese7icnurDLtGsbd/otB2W3tDN9JvK2M4pkqtE5vYCxPhp3e/8eUu7AFe9z0jDr
         sgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722626449; x=1723231249;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gZNwK4s34iYGvIbS46dI7pOTIc2gw03JA9isN6WtOpc=;
        b=WkjU4DeAVT4JyZf3Fx7PoH4IRP0sdXe8UzvH44uvIm39L44HiTx+iK+rV/y168cD06
         zGBbtD8SwZ5voZt3FZcTx37lD5eEsTHD/VtiNgS2qz1rU5Ld1dMJMyp3X5W+t02QWe0W
         eXVSJmK18ifoc2Xa2jfSxGlBUl+YlG5gro4Q2LnmbOpkeoAPBNRyORLGs2UP5qJAcpMI
         HyKKXJHRoXcy1Q+xbK40596TtT5UpdIgBuP9WgyU9p8IFNRgBxFzqIlVrET1Vi0yGTOU
         cbPqbJ70cqBUHvUAmq+Lu8TQx/8LnhjtLM/RthsGmqbSLEcmUcVxC4X6Cabi+YFuNxS8
         wtdA==
X-Forwarded-Encrypted: i=1; AJvYcCWGkNK+0RPQxaELm2OLp255lfB6sQtO8Zq+6/6j5RaJ6x6/oNc8gwRP9w2f/n413dQ6LrjvKuvOrkxMhGuf4Q0U/13061DwWcrO
X-Gm-Message-State: AOJu0Yzclqn8FTSFQncG1aVw+gpbSf4VWmSCbGuWkoWYDUGoZWG2Vkq/
	2bSLAfXm+PSAvBGJTN9fqaH1xFYeidI2r7TWAVDtTk0A28pZ9dX/zJ6LNtzJ+Uc0ZBF0B2l8Jdf
	UYo5q42ogkcZN8iQCBlySQt+xv56QzXbfPRGB2w==
X-Google-Smtp-Source: AGHT+IEqzG5OJVYb0N/hhSy3/aCVZpwuaC57g1J8oBIELAMwqUOkxVNDUu61cFnvy19WDb7qlbHaefm1NS450MOTFBE=
X-Received: by 2002:a81:c20e:0:b0:63c:aa2:829d with SMTP id
 00721157ae682-689637fccd4mr52822217b3.44.1722626449505; Fri, 02 Aug 2024
 12:20:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240802090544.2741206-1-kevin_chen@aspeedtech.com> <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
In-Reply-To: <20240802090544.2741206-9-kevin_chen@aspeedtech.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 2 Aug 2024 22:20:38 +0300
Message-ID: <CAA8EJprcmQvE3PjySxBKq7Qv3JHJHhic2aQ5MDnwZaf-D=K2Rw@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] arm64: defconfig: Add ASPEED AST2700 family support
To: Kevin Chen <kevin_chen@aspeedtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, lee@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, soc@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, shawnguo@kernel.org, 
	neil.armstrong@linaro.org, m.szyprowski@samsung.com, nfraprado@collabora.com, 
	u-kumar1@ti.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Aug 2024 at 12:05, Kevin Chen <kevin_chen@aspeedtech.com> wrote:
>
> Enable CONFIG_ARCH_ASPEED in arm64 defconfig.

Why? Usually the defconfig changes have "Enable CONFIG_FOO as it is
used on the Bar Baz platform" commit message.

>
> Signed-off-by: Kevin Chen <kevin_chen@aspeedtech.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7d32fca64996..b393735a695f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -38,6 +38,7 @@ CONFIG_ARCH_AIROHA=y
>  CONFIG_ARCH_SUNXI=y
>  CONFIG_ARCH_ALPINE=y
>  CONFIG_ARCH_APPLE=y
> +CONFIG_ARCH_ASPEED=y
>  CONFIG_ARCH_BCM=y
>  CONFIG_ARCH_BCM2835=y
>  CONFIG_ARCH_BCM_IPROC=y
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
