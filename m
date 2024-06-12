Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB2716C685
	for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 10:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189283; cv=none; b=GiduUEWl6clj+fEICm51DEz68TUTmeEk7e88nJ1BLjknvI9TssKHE9bVfD7eT+f9iep4StWc9CvmCcjOoF68Ja0sivJj+8aWlOxAnTuBXLYWeVE9tuwHUElot1fI6Di9pL2XfkjfkCArXubNhzwYY/D0sLz8+lKhiO7v/VJxHhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189283; c=relaxed/simple;
	bh=20EnR4B9oGwKGQC/k4WySB/Ui+rinhaaE0N6AueFY5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0M07qwoTOcF8pNKF8FwwDJ9dQ1DcFpsYf/JtWd+ZurUCdeMKiCctjTogoHmK7o8CdBp+Hu6Sq9nPrQ8AKDB2unKIKxktQgfhPdYbwI6gqhP5HLVLZcNC8iBSCJffgSN++QRZ9IoKq/qcjrIIW6+dIF+QJYG0sJ5DgcFn4AEt30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E72eM1ty; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E72eM1ty"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52bc274f438so2900459e87.0
        for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2024 03:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718189280; x=1718794080; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BOYIiBVLWWNhLv834B8QQY4TviVSReDY87Z0lnFv424=;
        b=E72eM1tyDlME9DKI6HInZ+Yawt8nKqvTLK/eGSDU8c/GZ32OcpwUeneZ5jCD8TAx1T
         f55NZt/bk8Ng6bfqdumS1qs7sv8AwseIOluEjn1FqKN+IpNs3nm+3cRFaAlSNcbXDxG/
         LUFnxNxLHxZVI6QshVEsCBeBSBkncemGbbvof8+0AgLICCkybV2I0AEVGH6HMYNAPZMg
         iCVsuUZpW16nSfW9hwBVLT792r1dcwZ0k2ZW7J/C/oor2bbymKFqXYH1r2nhb7lR1d4l
         TqbMIu/mO6FC8A5VrhcKrlXCHD6pUuq3ES8e9Fwpf+jXRY9Yg2HRxdIlnQhVdIqfsgMX
         D0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718189280; x=1718794080;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BOYIiBVLWWNhLv834B8QQY4TviVSReDY87Z0lnFv424=;
        b=MSFlYdJeFQfOY2TcsnHvGp587UZPgbbyZpFBMk/4mT9/atQid2Z3Yw1UAjwBQnEwNz
         bpDR4kI/3l6fIuLmeYg7sdzz+1v0ySpMtMD5y+ku+k9bshmao0nr1IBtCJlZm8V++G8a
         Hb76fTa8gtNjoGlB1bEClWjgr//0tiPIFUpImVufEho+6r+XzFDhfSWK9Gvi/KnbQTZT
         S1j2kfnknPqptcMgAPjjIm96/asJQarF6RXkjdzR7P3BzflZkF5+ucqvqgk8A0vUB9xI
         jbkl9FnzdYCHNc5GTNc1eekpl1YnijSgHmQbMhRJJPOXz++0B1faWvpIdvP+sTL7wFev
         VEtA==
X-Forwarded-Encrypted: i=1; AJvYcCUVOYoLHeJpKY5S4qyyeEE0DYQbzMAR5MzAHyN7Of+LjbrtF+XKf+IWRr5G5XDMdhSPUNfQAdfrAU8HDtShm/M//Ul0wUbhAkRe
X-Gm-Message-State: AOJu0YwTJz8K6NPBUGeE0ES2V98Bpphqke8HbxLMJJYslc/+FVVZcApR
	aFosE8kGSmC4yv4thbRZsfZ9bXw3FlwI+58VPFFIhh6x/JY1QKo+a7CrCTHjr0Y=
X-Google-Smtp-Source: AGHT+IHYnnycu4Y9cBGG4mG+C7yb8ew6JhlTtfaGyJs51KgIPt8VnfXq4FNjPnKruO2C3p0Lu88OTQ==
X-Received: by 2002:a05:6512:4024:b0:52b:c2be:8694 with SMTP id 2adb3069b0e04-52c9a3df581mr1224757e87.39.1718189280264;
        Wed, 12 Jun 2024 03:48:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c903b972csm856375e87.36.2024.06.12.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 03:47:59 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:47:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	quic_jkona@quicinc.com, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 05/13] clk: qcom: gpucc-sa8775p: Park RCG's clk source at
 XO during disable
Message-ID: <hs4eeic22snuv2qeytcd7j7zomcdx2di2bk6iuxswfb3qbsdiy@st4zgvnf4ow6>
References: <20240531090249.10293-1-quic_tdas@quicinc.com>
 <20240531090249.10293-6-quic_tdas@quicinc.com>
 <2fd8bcea-8bea-48ea-8052-d7fe6c1e8f59@linaro.org>
 <61eb731d-1928-4d72-97a0-397d8cf45e0d@quicinc.com>
 <d7jtqigvcmjv6swbifprjmf7ofgselxmrssbkptmbr2cj7izt5@a33lyesbdr5u>
 <9ea7bd3a-0d41-418b-8162-266862e1467f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ea7bd3a-0d41-418b-8162-266862e1467f@quicinc.com>

On Wed, Jun 12, 2024 at 04:00:47PM +0530, Taniya Das wrote:
> 
> 
> On 6/10/2024 11:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 10, 2024 at 02:41:10PM +0530, Taniya Das wrote:
> > > 
> > > 
> > > On 5/31/2024 6:53 PM, Konrad Dybcio wrote:
> > > > On 31.05.2024 11:02 AM, Taniya Das wrote:
> > > > > The RCG's clk src has to be parked at XO while disabling as per the
> > > > > HW recommendation, hence use clk_rcg2_shared_ops to achieve the same.
> > > > > Also gpu_cc_cb_clk is recommended to be kept always ON, hence use
> > > > > clk_branch2_aon_ops to keep the clock always ON.
> > > > > 
> > > > > Fixes: 0afa16afc36d ("clk: qcom: add the GPUCC driver for sa8775p")
> > > > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > > > ---
> > > > 
> > > > Should the same fixes apply to 8350?
> > > > 
> > > 
> > > Yes Konrad, it is applicable for 8350 as well.
> > 
> > Can we please get the corresponding patches (as a separate patchset)?
> > 
> I will send the patch for 8350.

Sounds great!

-- 
With best wishes
Dmitry
