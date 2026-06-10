Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F136322B8F
	for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 18:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114545; cv=none; b=lgOG1TAiGPDgHsakTuJEBju/cBSF7p9eNgsflDbp61pBgPwU2F60GJIH/kqrGhOD1h9J9kNplxwSOahn3uZH7IUfBhUWIOFgst7F+kbXPfp/5A+s6qm+M9O0b/LvrMgr/GS3D1OR7jWfr+Q+EsCJ6NRAmvQwfiof9mX03p6Mvzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114545; c=relaxed/simple;
	bh=Vz+Qc59Rtxnn7Ch0IoKjnR0GEZtH0evFqmN691McLno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=frlN2SlwR6jvzQTwrMwYmU2HnMWlyZmiNWcHhiJUgU1NMCZrpkUMNiCKf1WCrTE/QVBcAVSlMP8MAqigqkNPAhY9sqlqvPwty27AlBpi8+4dzbjPE4wuBD0SeYjDIIAepGsTnz76kHDdp5JBcQ/xI8Av3WEyLbeESeus9I1CGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xbwuKLYP; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xbwuKLYP"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-490ac357c55so74897705e9.1
        for <linux-clk@vger.kernel.org>; Wed, 10 Jun 2026 11:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781114542; x=1781719342; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=xbwuKLYP301fprJi9BymQ7ox3HmMp/A1JXUqS1pPoLxjVDvgYEVuqU2hwUfcykg7m+
         kNjY0JwszPjwtuLg//eINEX5XZuso4w+rcqJvxOpujcoJQxuAVtKvpiM2obqiU3qAMBH
         JGvlKmNdesGgjZ8D4rQjnQPd7jvPWYKD0jN30TS/32QULrC6KUgw46u+62tdM/7PK0sf
         ZaycmsWL0TYbxjyypyrOtdkRSCjIZBRjQGRq3u9fjGQnHXE1UswwgK8uvo02CB8aBZuB
         xg7ALIg8gCMmni83CcMs7jaPyNtnNZwY7afoM+hgmpjOaLeGKy5aXsVOLKWbFonsnYxN
         qotA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114542; x=1781719342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/N0HFnaXP6N5NwcEmCj/hg4YcEjr2pINzjuo8Ndg+p4=;
        b=Rr21R8awClyNpKMSmLciErOdeUPzLLEJpRDJLGldW/Ou1hM7emUp4l6D6Ifp4qFMXD
         w0Wk7Lq01PQ4Io2ip7Vatp1fH2fllE3mGpvgcxE3dhFr5Ga+QVdQfus59ptypnfoUrzH
         7Q2Iy33PUMZ0tm5DQm5QnHT40zBGWa0yfvXKGTgrfbjEmlACDiLcs1EZjUpHfrBY5jaA
         YKUJisMaqFmGEtdnxg2rY2/BPksounuirDHuFwN5uHAFP+sE3o0bnLW3SJ4tX4FITuxS
         0sgRf7y+Yc0hbBYKLTtvOKZE41aszeZyDJ0epxBox7jjRAuYvwLyKJSxLYOa8we7xjZE
         ec3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+q9Ebxtq01OD+zKKlfABHhwtJ67thqaxeApzbQAyE2mWcJ2UGqwwTeJr9ujf4TW90f5DJ7PdYzcyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcbfgjOmHZinat6ZsnBpKFX1Emyj0aWxijUiapb30vPEd34opV
	vXpj4cdTTzr5IK+ocdxRuTh+Rh2y4mNyWj93jXeJqm8vLHgjdX9etHxPtR+vkTRqyMI=
X-Gm-Gg: Acq92OG5TsYxfht09sMD/uVqJxHplBRH37IkS3RqgCUIDPD4T0Eylj7mKO/OVVwv2n1
	sAwgsyHFbQitm8l6NC6fSqO7pSAeVbvfOAA3p+JmQwaE568qIyd9XDgKVAG3wRI8SAZRch1bVkd
	PA8Mrm1/u4RjLdsHqhWUG88ewMEw3GyIXRyxQkb3jb6TM2fQaZJYHSye7Wps35lK2cp6ALtw8qD
	Ql0Qe8CQEPGXUsU9zIp8jXwi07olDgvRaaEaP73R5fYeBM2J8T6Mrdr8ixhrmMlrrHdJl8KLy5l
	CyAlO7VUAKB86vG8MDLXcUlSqTW8KiV0/PPaQURj85bPUHN6mLzcDJOfXfYhxNVoEQdYIzwFhsf
	3jVO0llxzZRLbcyTdCsmFMfRrBA2rV9BJatEoyQQbRmNbXkSnnr5Un7mYnmEZqJKq6YzuI2EQMz
	gUp71P09//HPneRM/FFWCdmp9tW6oI5rasqyTYkZqpMKBS
X-Received: by 2002:a05:600d:8444:20b0:490:c6c2:52 with SMTP id 5b1f17b1804b1-490c6c20071mr235234135e9.3.1781114542530;
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff23:4410:f160:c480:bee:c914])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490e2c0d360sm3170715e9.0.2026.06.10.11.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 11:02:22 -0700 (PDT)
Date: Wed, 10 Jun 2026 20:02:20 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
	Shawn Guo <shengchao.guo@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 12/12] clk: qcom: gcc-mdm9607: Drop redundant register
 update during probe
Message-ID: <aimmrJn3c0cJaYc9@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-12-5e9717faf842@linaro.org>
 <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad9a18e0-c2a5-4a6e-a9f3-677e923b495f@oss.qualcomm.com>

On Wed, Jun 10, 2026 at 11:01:34PM +0530, Taniya Das wrote:
> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> > From: Stephan Gerhold <stephan@gerhold.net>
> > 
> > GPLL0 is pretty much guaranteed to be already on (and voted) during boot,
> > since it's used by the CPU and also various other components such as UART.
> > We also vote for this bit in the actual GPLL0 definition, which will be set
> > as soon as any driver in the kernel requires using the GPLL0 clock.
> > 
> > All in all, this makes separately voting for GPLL0 during probe redundant,
> > especially because the "acpuclock" in the comment is a downstream construct
> > that does not exist in upstream.
> > 
> > Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> > ---
> >  drivers/clk/qcom/gcc-mdm9607.c | 11 +----------
> >  1 file changed, 1 insertion(+), 10 deletions(-)
> > 
> > diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
> > index 0bd4c12483cd..ce78ebc8ffec 100644
> > --- a/drivers/clk/qcom/gcc-mdm9607.c
> > +++ b/drivers/clk/qcom/gcc-mdm9607.c
> > @@ -1565,16 +1565,7 @@ MODULE_DEVICE_TABLE(of, gcc_mdm9607_match_table);
> >  
> >  static int gcc_mdm9607_probe(struct platform_device *pdev)
> >  {
> > -	struct regmap *regmap;
> > -
> > -	regmap = qcom_cc_map(pdev, &gcc_mdm9607_desc);
> > -	if (IS_ERR(regmap))
> > -		return PTR_ERR(regmap);
> > -
> > -	/* Vote for GPLL0 to turn on. Needed by acpuclock. */
> > -	regmap_update_bits(regmap, 0x45000, BIT(0), BIT(0));
> 
> This was to ensure that the (APCS_GPLL_ENA_VOTE) vote indeed has a vote
> from CPU. AFAIR, the boot up was not using this particular PLL vote
> register and no piggy backing for the GPLL vote.
> 

Hm, I'm not sure when this would be the case. The original LK bootloader
source code also sets this bit when enabling GPLL-related clocks, so I'm
not sure when/why this bit would be missing.

Either way, I don't think it will make a difference in practice, since
it's pretty much guaranteed that one of the later clock enable sequences
(UART, USB, ...) is going to vote for GPLL0 as well.

Thanks,
Stephan
