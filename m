Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B0C1AD9D9
	for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 13:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722431566; cv=none; b=aTD/wY+gGSU7Gss/6NzPDqx7VHnK3ZyCSMytzQH03WciqS6VG/H6NrAWTeLq42FrTfSxJrwAI4jzDlkj6zMo/FHYoP3htt/sZ2zxTg75sbWfAUHYpwqPTIlcn9rC36Il+i5P5GnU4Dxm8iH2omRSzX305tlfTeDZhkUTykmjdKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722431566; c=relaxed/simple;
	bh=qFPHgeIMW1gfQ9EjXLEKz2PkwY5EiqpBjeWefyfIctU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sCQElaWSHoDV5IPBYZ/iBQeg/9epuP75hnkFI4lkKMS7JAZaq+p8SWOfg6H0t+8tuh9089KZAyyHTvqX8aignaSjqfsY2gUIK993CYor08j+seVvkBOcNp6f2K2iQHeUdtYj1FZ1b7/gxja2qNU0QK2Oc0uWlb2nVsDP0A4TXs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yt8sB5js; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yt8sB5js"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52f04b4abdcso9075778e87.2
        for <linux-clk@vger.kernel.org>; Wed, 31 Jul 2024 06:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722431563; x=1723036363; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3wPO5io9Fiq+8Cz2nYy2B8gHrLGSiZUTaKFQ+l1bhA=;
        b=Yt8sB5jsCdMQ2zGpQUEa9ZffF+2/jwj1xKezLZ6RpaKRZOIUtlX1PFuArG9tuhn2il
         4SAzu5lW0sq7JiaoHLR2+RJOtuFdlYeQRLU7IAX9tGtnGcBw2BVzTx41m7mAk2QQlMLE
         mRhzWfnTZgs31vrR85WtMUM2N1r9rNYkLxLYcNkRnJdSx0MUOZvdf5SOSZaHU786SmQS
         68lWYB9G5thMLzBgK+k/QR2J0wniKX86umPt+GvpHmzRbKbKvB7AESCe/2jrPn957YA/
         PNJAe/5INb1fLtJ8Fle5dJOEoSFr8SA95AQjalijWlT43RpX+XfXpqyBZcm7g3ACtEYF
         /Rfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722431563; x=1723036363;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3wPO5io9Fiq+8Cz2nYy2B8gHrLGSiZUTaKFQ+l1bhA=;
        b=HbO4BZHfM8sokmMCS25J/2mM3Lsg+YHA8T6VPahIRoVtWLW8uKLCNxqGFmcSfVus8L
         HFM40xXHkjC7tcq5H3UJmhiUo/HMzeF9fPo3IgO3DxAtMa5/SKdWMxU2Zggm0Ty4Zt0F
         t7LZBzOC7Lo1IGNjtEGQoYBYFmYP4mJ1QzK5JTPamzagpvG999CgcQF8w3BiEYc69YYG
         LKCBLrqSRP2Q/X3ITRvwA/HmVAP+I1XFFQc5TkVOwW5UGVOQzDFVLJqDVYbZvrMA05IW
         VYpMDcuY0w/+7cxX4pu85XrqGwfNJXkILKvGuK7HWzZ9jY7epcsu4BRyAqt8m3qC8D1j
         wY3g==
X-Forwarded-Encrypted: i=1; AJvYcCVkFNIh/OWi5yPz0npBRD98gZ4ic7EQb8L5flFpJuH9PSw8fnH5Voj9jx4pZi0uanBVl+l8avxx/pXv2tZv+kBHewxuG4xTxPIG
X-Gm-Message-State: AOJu0YxzpSPhzdbF1PIbgi+UOIAM4EPXtck3E1HH1PrjKhVcblm+LlvI
	eqKypMavLulmmVJU07MQRebqsebO0HFDCKES89E0GusH8kX/pY6eTRwj6jta2bI=
X-Google-Smtp-Source: AGHT+IF8UOb4KQI/0UVDYgflYuJp0DmJs4aWutYRmDvRhXlkI1Lu/RNu43VC91/zjHYdf/h1W/xzPQ==
X-Received: by 2002:ac2:5968:0:b0:52f:d090:6dae with SMTP id 2adb3069b0e04-5309b2ce519mr9332247e87.52.1722431562460;
        Wed, 31 Jul 2024 06:12:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52fd5c0839bsm2223322e87.168.2024.07.31.06.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 06:12:41 -0700 (PDT)
Date: Wed, 31 Jul 2024 16:12:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, stable@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH V3 2/8] clk: qcom: clk-alpha-pll: Fix the trion pll
 postdiv set rate API
Message-ID: <uc5imfadtdq4krsht6t4fbzdyglbzhlivdbw5rxgvwjft3qthl@uibz2cbw3x3o>
References: <20240731062916.2680823-1-quic_skakitap@quicinc.com>
 <20240731062916.2680823-3-quic_skakitap@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240731062916.2680823-3-quic_skakitap@quicinc.com>

On Wed, Jul 31, 2024 at 11:59:10AM GMT, Satya Priya Kakitapalli wrote:
> Correct the pll postdiv shift used in clk_trion_pll_postdiv_set_rate
> API. The shift value is not same for different types of plls and
> should be taken from the pll's .post_div_shift member.
> 
> Fixes: 548a909597d5 ("clk: qcom: clk-alpha-pll: Add support for Trion PLLs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
