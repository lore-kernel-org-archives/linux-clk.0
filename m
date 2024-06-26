Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B7B190468
	for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 18:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719425484; cv=none; b=EyZJlwPpzh2YIdPSg/puVpnrw1Lc5vg36HStoxDxo9QYOE5n4yp42kN5aun669F3ONiavYFw+8f1UjEYWML7jSwCYoFmILKWk7hxGPEDlDC+Oc6dQRWKL1EwL/34r+HtwnUbMcLrcog21CxhFm4Oad2o4AkeRK1Bt2x4fzh4GUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719425484; c=relaxed/simple;
	bh=H7/ec739+hu73Yci+SuVYmQL5gYpe3oSoD4ttritvGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aAj2SOSwUga3yVPE+23r1esfSOa7xLqZkdYSV06JcHyEkQpldN7cmruLHbHDaWWCJF4lrPHUgR0jAzIoJTcjQy9tTlNZxmaq8/yq2w/TRwL6BDlCS2sPQYhEQXpUBTKWsXah+ht99bubI2Q9EpxRlTpJilkULSqD+HsR3E5LV6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sCqKLKIw; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sCqKLKIw"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52ce9ba0cedso4701238e87.2
        for <linux-clk@vger.kernel.org>; Wed, 26 Jun 2024 11:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719425481; x=1720030281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nDQ6BSgk4EuJqJOFP+ZJw6IbdRTjUCi/RgKB+9BTmiQ=;
        b=sCqKLKIwoTmnpSolGB22A7BxqqZV/P6qvELBHwVLXnoVRTvwAt9Cnn/h1Rr44hpoHy
         RjSOq7nyTnZwrgRtndEdM2A152W6I4R2wokJB6FA6Nbx7c+AP9Y9KXIc1p1nW15H1y8u
         C4P8M9wQsWwhnkgHGdkmzRZrvc8py1M54tJ5ycvgfCmBuB/+hKofwEPHP6PqOAyYk8IQ
         hMjj/4xLA6f0y9iBMqKMQBLQmTiA6I+iItY/FCnuYZPfydezl6zaeMooSVBXo1YFD8aC
         aa+SeWz8qAn/je6XiC4foTCWlKwOR6+JhMMUUdGM6yWsZk3/Pujpv70B1+7JLHvc6DNk
         4zhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719425481; x=1720030281;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nDQ6BSgk4EuJqJOFP+ZJw6IbdRTjUCi/RgKB+9BTmiQ=;
        b=DD5e/iKK0ToGCvaiuhCl/S/gwlRBP+qfN2OyekAUQX5HCcDrnSt390TCydbDeSr/lp
         PoUxHQMHiwwVG/pc81+7HD0Bp2KXy7Leiu/BHc1QCdYMl1ZqH8ywIhyCPPfzMFS6fPGk
         pOYkrepaGLW6eHEPYw9RBeBtgFkmefYIxiNwyW1VyYjVnaNJA8RPxfrTrUJqeILFfgnH
         872YmQKrgCaIjiGBOkJIn2M2mHnqOO23AJXMTtSL8VaMxmfDiuCh5c6BDdtX8u65uBi2
         V7CA+qDARvIh96KC2UC1wx+JIT0igH/FF1HkLAJDfDJ/SbhxgEAU0JgBSkEHNZsN2KBR
         OSog==
X-Forwarded-Encrypted: i=1; AJvYcCWZBZ5gs/gh8UbDslV0/woH4O35aKdnZ5h7HqV/0nzGhIfE/BXRqgS0b7bPhqoP4DksSIGZOKuRMBhnoN9jxhG3GjsOhkkeH1fM
X-Gm-Message-State: AOJu0Yy5cVuO4j47nUft9hnvHqifMeLE+v4NTjyEDUxolodHtGi46XQ1
	dPGiBa13oTFcPOf11p/fPlsWScFn8LUofzd+zuSPdW4zpG9cvRVxJYNxVGOXBjo=
X-Google-Smtp-Source: AGHT+IH0WYXPdgWAwfB8r6Eu6OYUIW4epdYd2iRt+kvq5t9zs1qoKhBabD5jbHIsxoBf7I72tPmXQw==
X-Received: by 2002:a05:6512:3caa:b0:52c:df74:1577 with SMTP id 2adb3069b0e04-52ce185250dmr12057912e87.45.1719425481087;
        Wed, 26 Jun 2024 11:11:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52d9b245fa2sm388158e87.155.2024.06.26.11.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 11:11:19 -0700 (PDT)
Date: Wed, 26 Jun 2024 21:11:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konrad.dybcio@linaro.org, catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de, 
	richardcochran@gmail.com, geert+renesas@glider.be, neil.armstrong@linaro.org, 
	arnd@arndb.de, m.szyprowski@samsung.com, nfraprado@collabora.com, 
	u-kumar1@ti.com, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH V5 3/7] clk: qcom: gcc-ipq9574: Add support for
 gpll0_out_aux clock
Message-ID: <n5flflug5fkxuxvlqe22o32xo2qp6jnv4xrwpv4wfbef5xzc2b@gjsw6mb6b6ux>
References: <20240626143302.810632-1-quic_devipriy@quicinc.com>
 <20240626143302.810632-4-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626143302.810632-4-quic_devipriy@quicinc.com>

On Wed, Jun 26, 2024 at 08:02:58PM GMT, Devi Priya wrote:
> Add support for gpll0_out_aux clock which acts as the parent for
> certain networking subsystem (nss) clocks.
> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V5:
> 	- No change
> 
>  drivers/clk/qcom/gcc-ipq9574.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
