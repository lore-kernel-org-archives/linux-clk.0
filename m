Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B758BEA
	for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 13:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745413960; cv=none; b=STYhPfDjSGcPLiccN9LnVJZ0/P6h9b6smGBmvfrxjZwVs42HEtsQLlHnI37CFyChr2v3OlkSQEo/xdXSy8tx59Dox5iWRVteqfZYX22DgaPga1Y4RLDFfJFBmEK1Xa0j1P7ZuRx6qgf/V9ccSgnk/7f0x4u1gVUOD7LKgtdm9wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745413960; c=relaxed/simple;
	bh=fIUyCjQtOjmd1WAoagxHXNlbCDt6PUnMgQToMDKJOYg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6ULwaX1g3iWYw347pX9He8NZbQtnLc+X5vdsB4LINXOgkyLLbCiFcJb4iCfdVxHLPfOzsltI35TN5elWWC01YovQwqFulw33w2pEbEeFNYH6ni8mW4CXd7CZ9ku5CQ5JnGYTvQwCxP6hKp/qHXDDfZ/zpv0xakn678Nz1pe81Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=km3pGIHW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="km3pGIHW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-440685d6afcso60325555e9.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Apr 2025 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745413957; x=1746018757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=km3pGIHW+rl0tcZCtsnXFg9iMq3QjFCep3q/69bY66WtRjEi46MBIEUcQGoHQ+D3YP
         qKOc+N1ieFkZvcT5aBwOqAFWIGnHHj8r3Z34SS8z2VRcIwi47g/lVlft8QzYxUtJiMF1
         VDbdSCKPAJhpkrG1Bb9ilULrcN24sAX9egmzmxTWbdyBxI5cIMCv1wToNLK7gVOXjja5
         rAt7tfeunuiysHbcu7Lqbc0mMToFaQv2WPwQrv4QvFVgrCUeH2mJfwYEp5KdLwhl8SAo
         iEwTP2pGE4ltXxEHk/gGbbau39bYMcqTYMXSjfLtRTIohyG5ayXJt1My8Hy9e6jb7P10
         ccBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745413957; x=1746018757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EnNh4nAQm+RPIaXKRaRvi+wY8Sx0Yyg+NpjwoekcfHY=;
        b=OwFwAwW0Db9OUfXr9fNaeNAI8hzbPcuEwcxX5fMGCPorTXSPwlE8LS7JthXYenmkYF
         fYCf9kkB1OoGNAmuSFRWMWpOb88YpjBDoX9Kn6I6/WGgBr0kVBHhOSywNBrSbZDx2Xgw
         4JojZ92+KYLYRb8ag7Wwk155peMtB/F2bMPgUN7UnxKnEXqmL8cK+rGpiND/wgqN/P6C
         ghP4Sq5zkYlA3l6V9VV7FnWweZYERiJ6M7bscn0GFr2F8V1lm5Urgh9s0p/ZBErYzrG7
         LeN3OcCSczsh3cM2D+AQVg7iS3fXD66pmZDqc2HZyXURW4K6KGD1z9tR0iUekC43vIgj
         4VEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI3VBCJv8rl+mXFCdJsoQLhZqpNBKZJ4IeY6Cbk1Inl44O6mkU+bGb6OfwbOtTo4iPWkY89Crwxa4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeUpTi7RfDIrbyuFHWEf2xH5tu9ecE56D057Hzu3AOi+PvTJex
	EDroaDrWrIAXiDsulJ3DyCIfOvLcA5VD22FldxKtj8O1F+nlotEDcHY/M8CjKXI=
X-Gm-Gg: ASbGncte8iDmSNkYP86cYhoCS0vvklXHomJmGmTKzWXnckJFQLOdKQafSI+lqWG3l5Y
	7fcxo1N0yaOXDGLILHJpTBSND/dqdCr6VzAy5hcNXjIe+tAfay2AJoO0ahmzpuXwfYjj5vZBYr3
	j2ved4GJ0gANj8BoM+vN29LvsWyCsARpbRCnasVq0GyWlV7EMdcMznxgcotVK7tKgudi19kEhVy
	K/ldiZV/SWT2aEoHzM1IKyMq17NKOmfVa2yZuuvsTVhU0jIEt6E/6weVQMCo1TiqM4cWBpP4rFh
	Sa8xnC9jNJEfExZzC6vhW0GTIZ5L71MtREGPbAKAq8UCVQ==
X-Google-Smtp-Source: AGHT+IFLiGEPtIUG41rtNhf8o9bC64yoKVgiB+tlF8MOvnBbCSYDUU6BGbHcm/6Whcb9nIfm+cjAgw==
X-Received: by 2002:a5d:588c:0:b0:38d:d666:5457 with SMTP id ffacd0b85a97d-39efbadef97mr14579817f8f.42.1745413956864;
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa4207fcsm19078159f8f.19.2025.04.23.06.12.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:12:36 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:12:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v11 12/18] clk: imx: add support for i.MX8MN anatop clock
 driver
Message-ID: <09721eab-1adb-4001-880c-10ffa1961918@stanley.mountain>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
 <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423060241.95521-13-dario.binacchi@amarulasolutions.com>

On Wed, Apr 23, 2025 at 08:02:29AM +0200, Dario Binacchi wrote:
> -	hws[IMX8MN_CLK_DUMMY] = imx_clk_hw_fixed("dummy", 0);
> -	hws[IMX8MN_CLK_24M] = imx_get_clk_hw_by_name(np, "osc_24m");
> -	hws[IMX8MN_CLK_32K] = imx_get_clk_hw_by_name(np, "osc_32k");
> +	hws[IMX8MN_CLK_DUMMY] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_DUMMY);
> +	hws[IMX8MN_CLK_24M] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_24M);
> +	hws[IMX8MN_CLK_32K] = imx_anatop_get_clk_hw(anp, IMX8MN_ANATOP_CLK_32K);

I'm just CC'd on the v11 of this one patch and I really hate to nit-pick
a v11 patch...  But I don't love that there are so many unrelated little
cleanups mixed in with the functional changes.

I also don't care strongly about something which is self contained in a
vendor driver and I recognize that re-writing patches is a pain in the
neck.

regards,
dan carpenter
