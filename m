Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AC0309F06
	for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 09:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761124074; cv=none; b=t93EB32ctjPhZQeJOONoRGUaJ0JTIu1VFBl4FapzfJizpqB7FuxzIKZRtTk6QaGyHAleond0cVOVKsTmEwQJ8W9aUvkDMxwqnOQnIJFh4AfHUywB+jRH/A0mKoKQ/veRkxYpGNA/AIbqC0+YulBo2yFGKoAyBG257IO3K5gOTMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761124074; c=relaxed/simple;
	bh=CK4ye5gW8ZQIbFQzPoD9lWgtQo2XoUG4XijMpi4CeCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i3wrF0rOGifDZnQb/45y4jIi4DdoHOjRtmu7Nc6Ovb9RGG/YOQmpqzy22ppY2PSD+yKtEzC+yJw7bTD35Nf7zk5VUH0aaPJUiFXqgx34ZZw9/5Kko6y+sX3fU7Sud6XIVKut4/IMhzr2uYV2aHEchSa7hkdrCi43aqiR951pL5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vWkTnnCx; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vWkTnnCx"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-471bde1e8f8so16566255e9.0
        for <linux-clk@vger.kernel.org>; Wed, 22 Oct 2025 02:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761124070; x=1761728870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=vWkTnnCxDGCfAS/HR102S0nuMNvpFa6Dy96qaXniOMLn31UI/w2ZA0Ur8BsqJHghXh
         Hbo/lR3O49NQbfQQR9Dcp0txzX6jrXpmSMrmoHZIsjDbbsYC4A/MQtvYJMW8Pv07G8kx
         eMBsSMfGaoyOIXnrqEY1wIzaPFfQIP3aIO4LoLVw2Uqdh4G9x8tRoEXODXP5j0tEh8AK
         tGmEiqM2YFf5fEDW58NX2O+3DnWqr/dNrFI4OoKWGfaM/IYtx/01DcJESJGnfrQTjsuj
         y95avoxVvYDiSolnHWBud9u+fJav3g97IrACeAFWBOB7u7Q/tMy89LauCaRdbijgOA1e
         fVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124070; x=1761728870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P1flJABJq76WrUF5m9yiOezJjduWZm513fvxhMdJAqE=;
        b=LDUNkjdY7Sn9TpmMwQVf2dREDsBtSd0GO96knCpgrRBv0SQsrwq3Uh9zPEfLjCvBQk
         Xyox2GDXC5ItowczlP6tEu9IPgUlnntXsPAKBpRLqNQjwYIjPMDuyWnv6MEZJT7K8UVj
         GEXgoXcEkPmK9m3PtyNXIGgjmnis3r6R+xCoDcjrFzzIue3CXyAh2nk0QfTAMQClnr2g
         IsyDNxWBnYuWYcvfxDoUHFM/qgrS+ZcY/TjUTXBLF7bgManXeaDmpG4JMUftjYREMTwj
         cWwtO03JOWNE1LKsJ0De3k1o7zDTIQcJuJqi8yQr5ZRpFM+xmGrFV8r/79/XheNnN5qw
         Rf8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIzi2x2v2+bvyLAnfUS0nJw8FNeSbwiKJP1uWWT1enpzpdwVZbrlv2IerCR+R9kywjnpbhrOjbavg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8d44xueQwzjs6y8MvfPEx+E8VU2i4FV5gT0INN1xueEy9x9Yi
	2+mUrUqUWBKnx+z/9gEheb32qWJC2jfbMebaQfUFnNkO7VCwGRJfNQ8YdOGkSU+rFw0=
X-Gm-Gg: ASbGncvs9MwnCJ4wiPLtP4ksCBCuv53zmLGVNeTQBUIiDHMXAaGDsuuLWkg1R9HWpQ/
	I1rmAbeZcigoURD+P1u2Y4uRJC2VhCjBUWUqCGyOBBl8ys0LoU7N/0g6C1LSWq/DPRqjuCpOZRl
	EbS66Cf8NtqgHKbOPYF9XzOlb64b3/otoDFzT5EOWKZDOZYM6sh0HAZcR7uBrkeGnn7//+ckirX
	4Bdjud2C216FVcfE89Z3OMjvY8zYis0LrTUGl1iranTSG9n2hQ+TRti6c8aIP2hKnAKzvQ4Fa7t
	+Wf10Ep8RrG5Ydir5DCqIhweTPdCzzergTlHodDFqCRi9cjs+h7RXuPG7wFKq9c68OrEWre9spL
	0yFZgeCXDDCy8WweUZzzypx4TaES+y8X6dSV6h6M01s2vMP0j3teq0/8PTbUQIaBPASHTZwi9
X-Google-Smtp-Source: AGHT+IGFFlqpwATAAZ2BKrCrVb9D7HfZ5rwLRuh4BV5B0Yi0YMlAwBYfX4e0exoRZ0JufSPaMzAqQw==
X-Received: by 2002:a05:600c:3513:b0:471:1415:b545 with SMTP id 5b1f17b1804b1-4711786d625mr156848555e9.7.1761124069502;
        Wed, 22 Oct 2025 02:07:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c428a16bsm38447755e9.5.2025.10.22.02.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 02:07:48 -0700 (PDT)
Date: Wed, 22 Oct 2025 12:07:47 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Taniya Das <taniya.das@oss.qualcomm.com>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Message-ID: <5j7dxbp6biaweup6k2gizbx2g5cf5kzf34jx7mhukrcto7mkz6@3azkzkr7bioc>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>

On 25-10-21 20:08:54, Luca Weiss wrote:
> The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> parameters that are provided in the vendor driver. Instead the upstream
> configuration should provide the final user_ctl value that is written to
> the USER_CTL register.
> 
> Fix the config so that the PLL is configured correctly, and fixes
> CAMCC_MCLK* being stuck off.
> 
> Fixes: 80f5451d9a7c ("clk: qcom: Add camera clock controller driver for SM6350")
> Suggested-by: Taniya Das <taniya.das@oss.qualcomm.com>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
