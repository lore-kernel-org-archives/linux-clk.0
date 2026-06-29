Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BAC4266BF
	for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782748203; cv=none; b=iTwpDMQZpLaxa9zxlDHEnLeVA93dRjnJ8mUn7nNq9H2q8+ddEZ1hPaB5pOKxCF9MSkdm8F94EyGCrsdaihMKKLOBubjmR6/YnF0Zb3DxnwWDlW3YEEvbGWBp3Q3k3UFyB3YqvjxpSFjkifxItuxQtwELAwa7/dnPCAait3stu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782748203; c=relaxed/simple;
	bh=FvAkBlrDul53MqSf7dXilrxpK5UVNoLSDDz7Vhiv9M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCAVd6Xr0vzCI9oSaoZevXocDKGH7s8I4tkGmGjHt7yQCjyQDQ3CPABC5d0fQ4NGYFishx2gsgUeSM1G9ieeeBTQ+P6Oq9SZ/vLZ8lt1DDWfadMgfIzIClrZ6cmDFu8gJdZJ2uUskgZLRqBFfCdtPpaGRwx2M0NWwbSLgxtRRpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFbWDVIr; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFbWDVIr"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47231f1f8f3so2625259f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 29 Jun 2026 08:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782748200; x=1783353000; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S8F/AaDG34/iqAettwKK6d/jlB5pV0kvSFjCSNAXI1E=;
        b=YFbWDVIrWCerve3gbXxWJ39kbKOMTYzPAYwNX47zI/AWo6wELjuFgFDbXmHAYH4P9C
         h7My/ZpbdYaJ82fDuBOaZCq1NLMsmQS3eeTl5IGW84DY8LxFlU6wp0xo+1FR2rr2MnDG
         1urS++pm7yza9dD6xQFAqjQUk3jnIDRRzDceKIHOfD9R7c/UNL5eCF9XHzYGYOx33eUr
         GSVU//nMLK9i2VIjYUv6LkKtz/F+SslY/Kb/GTPEh3RekYfr4caZf42kFMF8Y6mSS3nU
         WAyP5AOrsfU7RYrT+nDaxwXFMKUVeYHaFuhu1axvswOg7pkrPRNW/e4gYn33jACWtn/V
         3szg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782748200; x=1783353000;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8F/AaDG34/iqAettwKK6d/jlB5pV0kvSFjCSNAXI1E=;
        b=GrSNixWS4n/vWBdxeHShGSP5KGeKo6xd/EhspxWNSy3W7MtJBoHhgoru2Qzk0OUgMW
         lh6HEcWskpgbTCN3X638ABVxY71AmAI7eFEdFo+I14/wb3CYUspPFzw6rxAOtqYYK/KT
         KXant68o0m2w/0xN52Y27gO89k595KJAw76aZkafBx0WDBz3nSvX9ktwtfLLBra406LL
         kVXfsjuFdJ2Y0TAWZ+tM3d7mpfltWNReLJNnNcJt9bq6C0wJdiA8BaRD3Q94GC/7XoNq
         XJZB34osv9u2XtQXeECCvEFSxTogPoMlfSgds0CmBr59bkmqYzM+boeG9KfPcXq93BZA
         UAbA==
X-Forwarded-Encrypted: i=1; AFNElJ84Cnnb86avQ4NPkShW/b4+Q/1Xzgh2P4cLpRe3zTkLtOdItruVJ5pBqPJSpcYDTXEm6kZuEvvFZHw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7xSYs3lgTpO7mOjqvreP+gwHl1IpLhe9HGXK2NOUh+Pbr8g8U
	09cSHmR5W7hXFA3PWkCmlfYtL1Q9XMkaA9AYiinSXipPN++mKwIAhY6SI9nxbBcJlZQ=
X-Gm-Gg: AfdE7cmiZE2hnFZEkaxGHspiCJO4CWT/aBdCU9BsJy5Wet2FnjbzZyHC9gyDS4AGzOa
	4Uir2q4AMBj2suX/y2foZxuA7oBngvMcHDlfpjddE8IpJnh0MfR8hB3mqFUYZp3lmtueS8PdTS2
	Qz9WbunCf3mH+RaLuT5SqyXUQvZHX60gI4jD6lz0h7Dcg1aPT8alYDd3RIrvmI3d1P+lsYexChB
	kkt6iDQt2dUck5Gi0xnvt+karkx3cUnVDcy3uSxLofgwUXZc8eZgoWLC0NBgu9t/xIVchXDAFfS
	/hrTylxORJj6nxQmyiHu0zZV2LTF+v1y8a8vQgyPuUHdCoEGO9fzDN7QZu2hzjgZti4BAwavJ9D
	kkR+4KezzJw11pMraywB/hXxHRzaaO+O/t1M9hpq3kbMP0Za5L5gLF0i+dSEu2/jWZYfKG6Uo3q
	7/S85a8lxaRRVKvLUNwxIyyWI=
X-Received: by 2002:a05:600c:6288:b0:492:490b:a604 with SMTP id 5b1f17b1804b1-493b82c3c58mr3530045e9.37.1782748200122;
        Mon, 29 Jun 2026 08:50:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:5f1:38dc:c145:9ce3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b76e03b9sm15543205e9.3.2026.06.29.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 08:49:59 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:49:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
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
Subject: Re: [PATCH 04/12] clk: qcom: gcc-mdm9607: Fix BIMC PLL definition
Message-ID: <akKUIsKtWXNYSaxA@linaro.org>
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-4-5e9717faf842@linaro.org>
 <022fb465-df10-4d95-a05c-1ff8e59558c1@oss.qualcomm.com>
 <aimlsgJssczxBGhQ@linaro.org>
 <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b30fd97-b298-435d-83a4-944e536bc8d4@oss.qualcomm.com>

On Tue, Jun 16, 2026 at 12:52:48PM +0200, Konrad Dybcio wrote:
> On 6/10/26 7:58 PM, Stephan Gerhold wrote:
> > On Wed, Jun 10, 2026 at 10:43:12PM +0530, Taniya Das wrote:
> >> On 6/9/2026 7:44 PM, Stephan Gerhold wrote:
> >>> The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
> >>> match nowadays is gcc-msm8909. Looking at the differences between
> >>> gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
> >>> definitions for the BIMC PLL.
> >>>
> >>> It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
> >>> MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
> >>> used for GPLL2.
> >>
> >> BIMC PLL is never controlled from High Level OS (APSS). These are
> >> controlled by other subsystems and voting should be via the ICC for BW
> >> requirements.
> >>
> > 
> > The driver doesn't really control the BIMC PLL here, the PLL is defined
> > with fixed/shared/read-only ops so it mostly just exists to model the
> > clock tree properly and have the clock rate readable for the PLL itself
> > and any downstream consumers.
> > 
> > There are multiple drivers that do it like this (e.g. gcc-msm8916,
> > gcc-msm8939), is there a reason why we should drop this?
> 
> My fear is that the kernel may have stale data at any point.. perhaps
> unless we set CLK_GET_RATE_NOCACHE?
> 

Looking into it a bit more, it looks like this "read-only" feature with
firmware managing the clocks is unfortunately a lost cause...

CLK_GET_RATE_NOCACHE does help for the clock *rate*, but the clock
*parent* is still cached in the clock framework (and only read once when
registering the clock). So if you have clocks switching e.g. between the
BIMC PLL and XO or a GPLL you won't ever see this properly in debugfs.

In addition, when enabling a child clock branch we make a vote for the
registration time parent (e.g. the BIMC PLL). But if the parent changes
later our vote is never updated and will keep clocks alive even if the
firmware already dropped its votes ... :/

I will drop the BIMC PLL and other firmware-managed clocks in v2 like
you suggested. It doesn't seem worth the hassle, and that's what all
newer SoCs do as well.

Thanks,
Stephan
