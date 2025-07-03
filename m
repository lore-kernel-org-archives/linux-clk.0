Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19762EF9A6
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 15:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751555394; cv=none; b=fcSglvt7E8JC/N/AhuUdtiWJKh2XusDK4Ux4/wHSJBdoNdA9srrqHJNdBxu+Z4NFf4KrUZgJO95cGISRbuj4ghsZGGT0KxCKOsgXDd+GUyC3282yHalOunaGf4P+LDXesZA58l3CkxaL4P5RFd0kVUWpBEVwbsTwJ5z0HSAAuMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751555394; c=relaxed/simple;
	bh=Wsw3m3WVgS2qsRwThMHxPLJn/WaYhLMQQfJFrjeEZQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fzdqsFm5XBvoGXH3GFQeBjvFc47kRucxSKBcWxGK/vIQpNhI0vWmIsBpN8+fpNzqfVzYss6XPwfvY2Vx9ngywSgMvdRBuUw5onEBQfC5R+u9UaDlX39ZN58ILEcS194uIQcUfWG8KnXLsuw97UmoWMjzYnU3ALoPfws6N/JrhOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H0HNrWDT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H0HNrWDT"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so5323268f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751555391; x=1752160191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=H0HNrWDTAvxJpZcod/ekeOsdb3y3KQH++bQlyxAOeb0/2gb0tacPilTW8Ml64bTE7Z
         dBwhndgBO0gJKNTiixNuroxEPLKJ0yjdz4ZFo3FjYI3MjLjoaKZfeXf3iltfFVCB+8p+
         F8rPpNmENNVQsV5MOTgB0yaPr2R9rDSIgB4sZxenBv5aMBG1qniJgiYqn+iucZRofq0P
         I5yRrpo+QKgbcD54oKNxcsUw8rusdjkK2Am0IQDcMjV4yGWD5+yXqon9okDIFzacN3GR
         z9TwYztMhikWhdt7t5xlHXM2NnxBofv/Os9jbBGHbjNM8w0w8fl9VpzdiegftE9yOTz5
         R59A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751555391; x=1752160191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4xswAcOCiDxtwue83ObsxfZ7pep/Cfzt8s7Ua/cbyI=;
        b=EkMrgas5ZP24iAaf6qw1AJ6yjb6PiGQhMdwB4TbzXHFMX2DHwmIA699eAfpBVbBaxM
         HoK8VP5gmk7DM5LTCQwNHJtM2Pm6gyIXcHT3QwzxtRKjp5SQkGxqnLwG1hwgU+KzxVNM
         eZqaUj/FM5Vc27y5QX0108JCvCwJBn4imJbI9C9cmOvcmHxKunmWkfcFLH2XSrEqS2XD
         Ed8qAmmFRRbZ2kkl6IQ329OqDYKQPX7U9XMvjlt8NMy4i+5FsMSd8TrBmbiqXCvuSrJp
         2wO7ALO1Ag2fWg81ImiYkgwV8xvQ4nqdaXMWLXgjMbSqqtPyCY+iZub00pkFgcAsgQHw
         BapA==
X-Forwarded-Encrypted: i=1; AJvYcCUkQmeUklPGZqNIySdTHPxSIRPY/S3wgmvFQ1c8EytSrl0ujLM5ra7mJ07Wpyr3cjaEzqJ4I4y7qBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBtxpGXQksblR6ulhCrc62M+bJGWgmrEc7efDcb/47FII69UJH
	YcT10yvlHW3Fpq6HvvDkA3mcl7kogJLcPYnAt9xgn/RCwNGKHItZW3sxbjAWa1n2oAA=
X-Gm-Gg: ASbGncvt4ViSx8kltCUo2wGDjm4hok7GvYdraJRHqIDSU0ZC0UBnvpkXa2qqOVy6wqF
	1y78OrLcFOFawEucWxlfNvfB6EbgbDuNLwYUrx0Z3dQfV4cw4KkzjQgJtZv4e549UziL+ncvHI2
	axUC2bIpFaHC7WhX0aXUwmzLTAEggNCV4vl+TsDWaB10dNnAgPOZk0buzfumJOh5OwbnFojIUBB
	NjEBh1XXD0lqo5BAyJvut/+LLc9I2gfgHEKn4Heox2PPJe7mOON2hGzsIRDHN5xivXRLQS4bMCK
	gTMn0MDinbhNN+pH8aZvSQuLKR46mHzFE06kbmHihxzkIGwBzRuRpFz4oX8=
X-Google-Smtp-Source: AGHT+IEmRzbd+GUqMa9EtpxZkxLu0N77USju2BDfKfk5a8aVAGwl1ML9f6DqwUQeD0xjX4cStIATAQ==
X-Received: by 2002:a05:6000:23c9:b0:3a4:e7d3:bd9c with SMTP id ffacd0b85a97d-3b32bbd66bfmr2181064f8f.17.1751555391014;
        Thu, 03 Jul 2025 08:09:51 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c8290d670sm10712164a12.30.2025.07.03.08.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 08:09:50 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:09:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abelvesa@kernel.org>,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: imx943: Add LVDS/DISPLAY CSR nodes
Message-ID: <aGadO/7e4ndjK2Wg@linaro.org>
References: <20250703-imx95-blk-ctl-7-1-v2-0-b378ad796330@nxp.com>
 <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703-imx95-blk-ctl-7-1-v2-5-b378ad796330@nxp.com>

On 25-07-03 11:40:24, Peng Fan wrote:
> Add nodes for LVDS/DISPLAY CSR.
> 
> Add clock-ldb-pll-div7 node which is used for clock source of DISPLAY CSR.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
