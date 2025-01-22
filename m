Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1DB1C4A0E
	for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 22:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737583974; cv=none; b=aLpoi49+n6mrdRgoyKzDeqkrEgTR9MwqQP9NWht7kr7Ymno3ejGS3cjV9oGmseIEwBv7pc/ZDLM4JS5LDw18CbSyQuNHZ+DAIfq10CRc7K3yedeJJ9+jTw3XQ+O4gJuSHgsSqizTP7rUSOljFWswdYTuR2FzIUDzp6bPzzHK4c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737583974; c=relaxed/simple;
	bh=zx6nlq4TdF0oc0AA2sY4ngyfD1Q7bR2PjwPmdky7ar8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p/YWe+hQWs6d8uf42FFTX+gZ0++aKW/b+fRsI7pkLjGwQCxbMtgULwO5xZBVDQk3bDyRpDMdrxhSSvtVKYJGKeEyfKlc4MUu/PYX8rq0SJ6iHVs8tHn+/jvZwgbkiquTPLOiuXKZcTdh5Z80QzpO7Axa7Cnq3FeG/wqxtbEOum4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zL+NHhjJ; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zL+NHhjJ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53f757134cdso297553e87.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Jan 2025 14:12:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737583970; x=1738188770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftW+4Yw00+JFJ6rlbyJpHGoVvPKx//uXTQZgt05Kuj8=;
        b=zL+NHhjJvWHLux1KEZsClkqjZBrZ5iGKr1f8/ttdVjvoTb+oBGZ2gp9kypL6rHyI0W
         MJ6di82rsjXxFJWywJRcUrs7SxQqiCUHHb5JHdk59FNmY+FRJxB/IuQRCoUXTTNLAYvY
         y3fxzuZi/MsuDreqaH2YW7CWBVEzTiAmcQO0KvnDQuawYGkv3dh7jW4WbrSXjEXcHp+o
         WBflquknzc3u+luM8AK4Vi0eA4X8pUC8XX3Kq9qfEDcIMmPDsYaPPw1iqgTlOg2Wfv9+
         W6VAgTrttZVJTmUXU7gOpMYiqQPUjfxZOTlC4JP4xyVXffnKf/VFb+hG6kQfkWsSs5vw
         CA0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737583970; x=1738188770;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftW+4Yw00+JFJ6rlbyJpHGoVvPKx//uXTQZgt05Kuj8=;
        b=q6NeqDndlRvhYVEHqURdPQujvxBa6IGErRhS66FNXJiQ1rbH5iaIXoNn3iCgURafxW
         ohsPOfHfDMiD1aEz5TbQmKSOP5cfMqreBw7KKyAuczVTar6zxyV/1Ve3+wEjFbSprksm
         cnomcewko+waRYvvMWRgwX6O8KoJF+vRhhWRI2yLfzEL29bRSNwlg4xOphUB20Souru9
         nG2rW8eASLt1p4Isu2ROAdiwbMlPpP8TbX0rWAeqx42MLQa7snUCC4+K8RKZtmk0+8dg
         r2CkasdoX3v2uOWflJGjF4XwQFVxv+91m7648LtnxCozkLNDegeAmR/x4Pjc4eK29DQd
         BgVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVx5+PhEpXPTnDIu0T+LJHhb12tDpycA+qzvfGWskhnsX1LsIzrvz4kQ/U2wmRSlD2p1PwmUnbnMPY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhAenu6tgXuxrSqaX7DlRb+esU1ofCDLwwNjmVWLj1tUByb+9R
	EhYCWpFq9yPeqx0fk5N5g4JR4G3hncregKoFuOg9yWrDw2ZRQT2tozW7uh9nFiI=
X-Gm-Gg: ASbGncsYvR2trDNVPCRq2N7cbH85m+K3+yWmDJi32GQFHWvH3EojXZeEIXqQzo13hzQ
	eC3v7ORCsWfsJmMjUnbm9FyEjGdAQx5dtIbuH8BQPCxVf3ikFcL79ARA/Ch9C7dM/exRLSy222m
	iD5KtAHjg6jSRbdw9Lg6rkec6ZjK6dKwB3hlRqHlzN7WyOLeXHiCU5G+VeOMxjld41LjG9Ek1KS
	CXllYdT0cv2DcmxerBsBlf4q88Z34G7z60X87V3w3NyvBkfVy9INDaZPNLuI1pp8OpGzNQm5TpC
	rURrhupe42wd/H6NFafViiqVjU7oUKqm2YfhPOte6c+UwiHYUw==
X-Google-Smtp-Source: AGHT+IEKgozzQWCaRMcmqnr6uwOlEaioHrS4zp6iyVTx4JgfzDbdyzNfJ4Vpq0ndepnddZS8lGCd4A==
X-Received: by 2002:a05:6512:1312:b0:542:1b63:141b with SMTP id 2adb3069b0e04-5439c2674d3mr9341377e87.32.1737583970287;
        Wed, 22 Jan 2025 14:12:50 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5439af78683sm2366610e87.242.2025.01.22.14.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:12:48 -0800 (PST)
Date: Thu, 23 Jan 2025 00:12:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jordan Crouse <jorcrous@amazon.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: camcc-sm8250: Use clk_rcg2_shared_ops for
 some RCGs
Message-ID: <fye2hzgb7pbd7mc7txdl6c57uohrs224ivicgwy3xxqzximard@gvwsey2yqgin>
References: <20250122213427.28169-1-jorcrous@amazon.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122213427.28169-1-jorcrous@amazon.com>

On Wed, Jan 22, 2025 at 09:34:27PM +0000, Jordan Crouse wrote:
> Update some RCGs on the sm8250 camera clock controller to use
> clk_rcg2_shared_ops. The shared_ops ensure the RCGs get parked
> to the XO during clock disable to prevent the clocks from locking up
> when the GDSC is enabled. These mirror similar fixes for other controllers
> such as commit 8d4025943e13 ("clk: qcom: camcc-sc7180: Use runtime PM ops
> instead of clk ones").

I'm not sure, how the mentioned commit is relevant to this fix.
Did you mean e5c359f70e4b ("clk: qcom: camcc: Update the clock ops for the SC7180")?

> 
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
> 
>  drivers/clk/qcom/camcc-sm8250.c | 56 ++++++++++++++++-----------------
>  1 file changed, 28 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/qcom/camcc-sm8250.c b/drivers/clk/qcom/camcc-sm8250.c
> index 34d2f17520dc..450ddbebd35f 100644
> --- a/drivers/clk/qcom/camcc-sm8250.c
> +++ b/drivers/clk/qcom/camcc-sm8250.c
> @@ -411,7 +411,7 @@ static struct clk_rcg2 cam_cc_bps_clk_src = {
>  		.parent_data = cam_cc_parent_data_0,
>  		.num_parents = ARRAY_SIZE(cam_cc_parent_data_0),
>  		.flags = CLK_SET_RATE_PARENT,
> -		.ops = &clk_rcg2_ops,
> +		.ops = &clk_rcg2_shared_ops,
>  	},
>  };
>  

-- 
With best wishes
Dmitry
