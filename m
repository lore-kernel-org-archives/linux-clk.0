Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804050;
	b=kiPs61bPPpShKqdsT3gMjK36pwl1iGZ6y0kQa77J25Fjbed1iIjfbPyr9gFhO1cM2vJ7
	 QF6fm6zMU+/PQRIYWtTNLlMnTE1BS1MMflrkII7tYJxNojxHOHk0ajdcMcpflDjMUoZsl
	 OyPPlI1K9ejqJdGlJnSEZXEjUDpH/gboEEG+9WeLmQiisHDlJM1Eq61Z+P2NUIK/BCWTX
	 Tt1VU4Jrp+2u3KcIhCkpvURFi+G5ax1d+z+uI54PPqsNXy8f35zfouEzlk5NpO3AVtNvf
	 gqkL4HgSn2eGinnS7zI9Y3wiZSBz1Ktqja1OTyFWeePZZ1SlXZH4qVsCPw4iadboGhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804050;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=kACk4DNsJRkoKPadv9XX9hMPYj3GrFJQKsWh+CJvnFM=;
	b=1ElVOHC3fbUCZGff19cXjibvVTFBNrjpvefUG+s7lpFu/BU9wvfBNaHgWRpJPOCmfQbc
	 QwOW1rQeB+y2R7MCtywY8ROSjw41JO5xSQVOqil2Ssu4YKzURmIYrL4DLO8P0b/ABn4ph
	 DsOn+jsrn/txtokd3nf3/TWvq7Jgf+TQZZUq1Uus8OsIUXMkriq5OgKBpFR+P/co0jy6G
	 f5sTN533Rokdj6RVwA2jf9LZxhui12XLHM/0EK+rGG1gJlejutZgPGHXHltlARzLaXOkF
	 uin4I0ZWkrENxGunkOX9gVMrx3hod/R8W2LyMQPOE808x90FY5V801CrwVEHJHOdkWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y679kHWW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23BC606A32E;
	Wed,  4 Nov 2026 14:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y679kHWW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE0781F00A16;
	Wed,  4 Nov 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793804049;
	bh=kACk4DNsJRkoKPadv9XX9hMPYj3GrFJQKsWh+CJvnFM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y679kHWWNV7v0Zt3/FfQWF3YOvHs8VxmDPDjVLwwGAYnWWuZcENfuTdqBqjNdbA3s
	 ZVPhbwE2oUcYcftPCkNLSHmk+C7YRUxV2zxlcD5nXTmFtVtOPfFJNt+Z1Tn/7En9v/
	 xGgnVgMEOLS4qWpRKI4lqTfdPwVNnmJ5vPftfVry39tpkW+VkMTyiK3qeAipsDgDaT
	 0TsnepRDEL93y6KbV2JuWAKGzcC3tA0gG8PYIhJ6V/Ii2MMUYajsD1d2tnmMYpDc6x
	 fRWNJ+mitqx/SC8kCHfUz8pAeCScTKX9R6ew+4iZAMXZQ/2c0oEBh53+An3w+Bvxcr
	 tFbIrcMOsKiTQ==
Date: Wed, 4 Nov 2026 15:54:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] clk: hisilicon: Remove hi3516cv300 driver
Message-ID: <20261104-sympathetic-toucanet-of-patience-294ced@quoll>
References: <20261104145118.952453-1-robh@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261104145118.952453-1-robh@kernel.org>

On Wed, Nov 04, 2026 at 08:51:16AM -0600, Rob Herring (Arm) wrote:
> Remove the hi3516cv300 clock driver as there is no such platform
> upstream and only drivers for clocks, pwm and ethernet. There's also
> been no changes other than common cleanups in 10 years since the driver
> was added.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  drivers/clk/hisilicon/Kconfig                 |   9 -
>  drivers/clk/hisilicon/Makefile                |   1 -
>  drivers/clk/hisilicon/crg-hi3516cv300.c       | 317 ------------------
>  include/dt-bindings/clock/hi3516cv300-clock.h |  36 --
>  4 files changed, 363 deletions(-)
>  delete mode 100644 drivers/clk/hisilicon/crg-hi3516cv300.c
>  delete mode 100644 include/dt-bindings/clock/hi3516cv300-clock.h

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

