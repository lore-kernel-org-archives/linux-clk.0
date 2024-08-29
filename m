Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3059C157A55
	for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 07:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724915233; cv=none; b=XpTuuIrAOdqUwdv5F+BHRAmKXaF2XWAPGBEeLGy0hizVv5U93ULYhG0Db6CTqkx7HmdL4G0a/WVRcx6wE9E5AnWB4es4V5z7I3MhGShjuIozjAwOJcyrqQ5MAkctd5GBduNb6Xwgnpfk0WIf3waxRqiXz2vhv0IEa3vujFPSdzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724915233; c=relaxed/simple;
	bh=iIrdz8xHWQOEmDFHwlLnKLxhlF+qVRPko7F/x7pE884=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jyoo58gmrVG9zCN4gldJ8KKjOyzJHV4VTzXdJRNyV501jDeJRs9ulJtqD6vdGl/vVnzwdse6ZjK/JVAJGGNELErA32C2VsArYTwob90rc8uxBRNwERVgMbebtDI/dzhzh1IbuC74yLyas5WrCG+oZmHudXHtTda9CVjJqrneMM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C78EhkWZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C78EhkWZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5bed72ff443so273445a12.1
        for <linux-clk@vger.kernel.org>; Thu, 29 Aug 2024 00:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724915228; x=1725520028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EDV7LYU2DJnsK4TmWVUaf/+yENKrN1KF0jvLEaGLdFU=;
        b=C78EhkWZlwdNl1s6yFdlE52bVdMr+V8Jflg7LLxWQ9+zV5DmAPxCcqt4Ar2E/rbLHm
         xtE5Bi60AJgqYRUj2e037uhCuUjvfoADqb9IcaSJ5no2w9XY1/x3ZNX1E4Nd4cpBnT9B
         yJ1w9q5y/xg2pmlaNYRE3dmt0tIF9tFzs4RZleE21fkIwG7VRFA6H7xESiABacL36O09
         jFfXvpPxmX8WRrWdY48OlqvRj8j42JOmwB0+4sGVGhvhoHzhjbHctnovhbZGPocDoiNY
         GcrEWvz2wC6Zn59xDtjBzbYpKKdfwUJk5fu3wAS0hVVxbwpPeiBEQuchd+0qXXLcgLmC
         pgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724915228; x=1725520028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDV7LYU2DJnsK4TmWVUaf/+yENKrN1KF0jvLEaGLdFU=;
        b=p7rNVecAEhRRbgckwIGU33bwBiI3qsGAto+fku9mmmUATOemPwcOKDoiwl+h8dHzN/
         dmpjBemslqKc+s9RWi/DVPfrrUAqd+UC9wO/6IlHGZBRhneXeILfaXLjpQOWftkIUsIk
         CdQKeNStOe1NJ72OUmC9T+t22ARqeevaOSAucTFI+XS+fYHimWo0H84db6XhRCyyFi1E
         /A+XyhBHFjpQOJNTgtBYgPhcQmWJ8XefEyHpNvMy0/Or+IcEM+oMZ2ZWkSQrklOwX2Xf
         3gQvC4Bal1no2zS6PdDzfRV/GMJjma8KhVmMT67dUtgh4czX6YD1jYi3sqPw0OJd+vuz
         cJTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLsn+X29FTv7nlAFfy5cb1WCPKl/pYMOtcdy0HsntukU2yU606MAQ0vE5m+Ote5OtNngUbm4mIO0E=@vger.kernel.org
X-Gm-Message-State: AOJu0YySuuurbzQn1VfyajllO0TzN39j/6GENOCn4pE7KjcXdoffybjq
	JxCreDPurHqOXe15kR283+A4GsPYm0wIljBPQsVmlCN5ojkdlNY/B8xJU5Ol1gg=
X-Google-Smtp-Source: AGHT+IFNrbFztgjXMHcLbgg0oT3MbRl4ZmtEJeLPKhMXUsVFcQa9Y3/vmFxcGOFsZGHW/LlDarOk/g==
X-Received: by 2002:a17:907:e92:b0:a80:7193:bd88 with SMTP id a640c23a62f3a-a897f8f78a4mr131638966b.36.1724915228420;
        Thu, 29 Aug 2024 00:07:08 -0700 (PDT)
Received: from linaro.org ([82.79.186.176])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feae63sm38563966b.35.2024.08.29.00.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 00:07:07 -0700 (PDT)
Date: Thu, 29 Aug 2024 10:07:05 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com,
	ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com,
	frank.li@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: imx93: Move IMX93_CLK_END macro to clk driver
Message-ID: <ZtAeGWtJDMyTVkjc@linaro.org>
References: <20240627082426.394937-1-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627082426.394937-1-pengfei.li_1@nxp.com>

On 24-06-27 16:24:24, Pengfei Li wrote:
> 'IMX93_CLK_END' macro was previously defined in imx93-clock.h to
> indicate the number of clocks, but it is not part of the ABI, so
> it should be moved to clk driver.
> 

Right, why?

All other providers have been using the _CLK_END from the bindings
header. What is so special about this ? AFAICT, nothing.

> ---
> Change for v2:
> - Use pre-processor define to simplify code.
> - link to v1: https://lore.kernel.org/all/20240625175147.94985-1-pengfei.li_1@nxp.com/
> 
> Pengfei Li (2):
>   clk: imx93: Move IMX93_CLK_END macro to clk driver
>   dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
> 
>  drivers/clk/imx/clk-imx93.c             | 2 ++
>  include/dt-bindings/clock/imx93-clock.h | 1 -
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> -- 
> 2.34.1
> 
