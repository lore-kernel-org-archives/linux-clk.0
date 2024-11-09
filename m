Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D4C10E0
	for <linux-clk@vger.kernel.org>; Sat,  9 Nov 2024 00:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731111374; cv=none; b=K+7LRK4RKgAxZb7FNn/eCjEzFH7GVPjsEPcChQpxs+hVggHBiFywy5ok2k0HSu2436PvOEdmp7FtYVajtAtwrwVulstn9gBnRUY5rlfJ9BHrDLw/06AWkpc6zEyqSN/Z5vxeIZ1PWncRfDzZRF6boXcpxnmhmTe2hD6zPAT1QP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731111374; c=relaxed/simple;
	bh=KOv7yLqvrL7i5RWY8vGm6ti84TeK4M0M8cCt+d+gOyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xv5iqbKnPLwEcYt5YiYgjXBt64MxjTNFP9chxv6UIrklIAzRkda2xDhTiM/dU2Kixt8z6h/2ef/U9/BqqQGJlq3wmLiRjZ4xESX5U+jzyYIhPFbzWJubAfsjD+njiUy5v9ZM5/f23GVpeJT2NedYlsLTgD1VF3b1FOfjlmZsvw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=taiwZRae; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="taiwZRae"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so4268008e87.1
        for <linux-clk@vger.kernel.org>; Fri, 08 Nov 2024 16:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731111371; x=1731716171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGhilPTYeg4CyrC1ajXDu2yJKamxL4VSKRjoPuRcjU8=;
        b=taiwZRae3KYDamT00SKF+F8tikFlyqVcHM6H1v1JFx93/TrEJuRRRJ4LCrqHfwkr2B
         s8ZC9v/MM3nPP+hhn904ntR/MyUtwlch4rZMnz55esCa/sILFniLi7s23wiq0hEbVzed
         fh/y+oN6pWr9AlTvSMphscEy/aWuX6nIcdmspkEHhAdmf3W4MejNjA3a0E+4fYjyd2Qi
         J+Iqhaumol1jSJUdutV5w6RWWpD4kFjgETH4kRvBmarjBaITl8uCeU3+1DIJHDVHZJcI
         bRgwNOITreZ7FVMnj/4YOsjoepOELUX91faRBVJ8WV4nJphRWZO+ZpBr9mf/tcbZ1RyV
         qgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731111371; x=1731716171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGhilPTYeg4CyrC1ajXDu2yJKamxL4VSKRjoPuRcjU8=;
        b=HThUgQnTxXXMhVm0l2XOuMHPlTWXEgpwduA/XRFRvH58fuZes9VwR0cbEe/NZIr+tL
         wMhEvoyj/OR9oX/tLvbJXAAUWBMpyg6qsoWqXQzKbJo0uQboi0660Ne1Wap8ZZCu9hA+
         3a5Yo7wcJ1i5G0Vroa2oapbs5iNMn9IxTBrTIbdkBmvGz4hUsX3wdXGTHYMJzIl/OxHu
         gNoGOflUPbNdzTvAeXDGspAVAHJ+nBfx1sx7XE2ThrSLPNIC+xSfi6rZIajrfvataA8d
         R8Y3sCYgRRpV6C1o1KMPofTmSrdrbWNLvD9AOWlm9UKpMhRtYFrfSOQA+9/BVBH3e7v0
         +gow==
X-Forwarded-Encrypted: i=1; AJvYcCVt65JF26dnlItvMUhADQEFQsbizjrf9O2UBvSAZ2J+ooV45dON4fQgrdUAUJqHsoepjyLUNALUWAY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4LpyTYwVVCC53VrVc9SxrzTDRozrCI9iLWq5qUUkJ2XqLpH//
	LNm3Fk453e0Us44R0Q1U8hJhys+lvInOCYysngfC6a1h3m/47w1eiAc9cf/JZ6U=
X-Google-Smtp-Source: AGHT+IEqYf9aBjOBoEcwnsK9UikKIHqLQGQCIxw7C+lbTDny8+xpVnselPyLLsqGg72umh99e0IEgA==
X-Received: by 2002:a05:6512:687:b0:539:f696:777c with SMTP id 2adb3069b0e04-53d862cb2e1mr2782918e87.29.1731111371244;
        Fri, 08 Nov 2024 16:16:11 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826856d2sm791159e87.65.2024.11.08.16.16.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 16:16:09 -0800 (PST)
Date: Sat, 9 Nov 2024 02:16:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 10/11] clk: qcom: videocc-qcs615: Add QCS615 video
 clock controller driver
Message-ID: <cwiai67gs2o3tj3bjziao26uxg3yrbd35dknkvjerbe7cbgfca@qhjtij23yn26>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-10-7d3b2d235fdf@quicinc.com>

On Fri, Nov 08, 2024 at 09:39:27AM +0530, Taniya Das wrote:
> Add support for the video clock controller for video clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig          |   8 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/videocc-qcs615.c | 332 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 341 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
