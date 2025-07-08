Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD032E337A
	for <linux-clk@vger.kernel.org>; Tue,  8 Jul 2025 16:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751992464; cv=none; b=CBiU2jqcZRJuk+b3v1ck4gDI7fNZqMQVFjjpcpF2xHtDKo9pcr37rnqSg6bfUmyfZc1o23BpmnSH3NcuZndFWsqgFWnY55ZFa/Yy/8LjiFbihEqsiU6wwyaVhr6645I0v7OUXuzjcDwQHJMKNEoyNCF7P87PfQIkcdWzUf0IA0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751992464; c=relaxed/simple;
	bh=egjXBQIDVMcPJrFuesqfHI+sAnZEJZw1CswxrACs2UM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3rZtVk1nukyv98bizvxEUjj0EgJZ3KttFuNj/KLukdDgSxpEkDc4C0evpI10Li/uO3FGOSXc5J+s9Yb0FW8DRpFbgR2FuZhg3NlioARkcLnoonHOLXP71tZx2HRKhguFJnXHVuhR1QzzoTITF3Jg8KDnuoAFLL/qkLZR5fPV4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zTwCKCBE; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zTwCKCBE"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3cd8fdd77so965743966b.1
        for <linux-clk@vger.kernel.org>; Tue, 08 Jul 2025 09:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751992460; x=1752597260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=zTwCKCBEjZVqNGlOUf66R0xz6GPjDzoODQCQjowRKc4kLXpR2NdKTHja9tpXiUm7vE
         sGZDVqSVjSoZs3+qRNAn6eHGTdYG8hkw/xj81WBWGY6vOqpQHGJ/Jdr3010WT9oeihic
         GHuvL3gOxCkxl3hHhH+9ILkphOMi2csjKtISJSNZadKlaueWEokcGdhaWbZ/NYQefMVD
         BnuibIJLAEXXhA6JPVgxmnr+in2fd2FkmuvVjyvpBHdF4KZr7l7Z1GEjXOEiKIREoHZI
         vlFgmrsh8yjsjEWTtFmRv9XlLd8MC6QCWf/rEBgAWY5OsyEgqfia3wnUlh9DDJuKEgpL
         baCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751992460; x=1752597260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0at4FacdZ6pma9HH5OGwEa8HPAQDJiRPxVtv3dm2mI=;
        b=HAjwUcDWvp4Yp9qnf/XK9d2zGkgXv8ivF50vA03TSF8qw1dI/5WFZv/KA7T9LTwRqQ
         MPt9dYYG8bDXJ5VjUZUNlwl6MAxkb4va9qbXZUvSXhWhENodi60bwc4WiVjUzYiuKZZB
         PD+tFrL5dL3D/B95pmlvYZki6GNAtcbA3x9dMZmGLaApuaSpqYhy5VLcOctR9tOQGEwN
         Ru/p9WYLQkPfqAwHQ1ik63Ftwk2e4p93oD4QBl2I1KlWD7v/4hLMJOX4lFP77gg8N/pE
         NSXSi5jxnYV8esKgEiFmunHtQ4AY5XNRt0rKBP+VRewtg0+JwYHMNbIbJt55jL7o7Roe
         ukYA==
X-Forwarded-Encrypted: i=1; AJvYcCX2wUORdOhgyvLyeQAnmsshlDKP5CjjnGHfDcOCCp56Yld5b7ZEe4XGo2OHjNP5H4ys9NxUGjsZl7M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/r6DLyHRMo1xG+EjS3gUkwktApCX0nai4slSIY8dSzmk9fMRz
	zrWOVYVflK90qvuRuEdswe+q0pnciwtfsvfxqdjl75ZILXFcwvgOE0q+TsomkQTEeb4=
X-Gm-Gg: ASbGnctyOF0u3Cub+NZF0BR8BnR6HHroavV/NPam9l4bESFmhnO+oHzucnI3XS6ilUz
	wafTs2FWdhZ9srddTLgYo3PBOHKdJrruAwUKOmBviD1/8EweuBNA9xWf5ORX+VSGv7dYdJhl+5c
	6Yh6UtL/y//Otvi3EzfzlgfJbzYYITfmZGnrcKIsaaGAgV+z65uE+MHGuR0zQg4YX5pAX46kmPq
	nzBUmMM1oNsV8zLWb99br7OHBxs2i2nOpN6DNpcRAJBN7Mh4FN2jNTqia3EgTcELfgLStsdb3OM
	XsndmCZ9rnlKoV8HZ1NEOZ7u/FxXSb3/qjT6qR3JUdoYQwadj+IMq8gEIm0=
X-Google-Smtp-Source: AGHT+IGKBE0r3i/OgmjaRqVmGAN5LyHLg8zBEZZguDeNMFqqfCLNiGPwn8x/2LgZv96cHHN089ljmg==
X-Received: by 2002:a17:907:9496:b0:ade:422d:3168 with SMTP id a640c23a62f3a-ae3fe6fa77cmr1690286466b.37.1751992459765;
        Tue, 08 Jul 2025 09:34:19 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6bb1effsm934223466b.175.2025.07.08.09.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 09:34:18 -0700 (PDT)
Date: Tue, 8 Jul 2025 19:34:17 +0300
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
Subject: Re: [PATCH v3 5/6] MAINTAINERS: Update i.MX Clock Entry
Message-ID: <aG1IiVXZSl+/4+Xg@linaro.org>
References: <20250707-imx95-blk-ctl-7-1-v3-0-c1b676ec13be@nxp.com>
 <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-imx95-blk-ctl-7-1-v3-5-c1b676ec13be@nxp.com>

On 25-07-07 10:24:41, Peng Fan wrote:
> Update file match pattern to include nxp,imx* and fsl,imx*.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
