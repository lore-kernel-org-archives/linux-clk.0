Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0E720E70B
	for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740147261; cv=none; b=tW2125UIcy11XMcptdpE1nrNrASJZSZo0PbOImiZ0+l/KtU5DPokPmGira3my+ovGeRn7Fa/tqfcYPWGENnoVupGeSUQLpc+uYhUeZqel0a3Ze3UaXSYeWwaZzWxFIOzIp7p2UeQ2io9t+zOWsHKAllHY6JPHvJm4JLZpufTaKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740147261; c=relaxed/simple;
	bh=8R1ntMvdxgNOKHWq3nr/j34/07DXc1wBynfM1J+M5UQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UEDu+gDm+n0s6Y0pBV5MV6LWMbBZPUUclgbDBWsR4QBWipT+hdcAvWsuCx6O+Y65F4k1Frq18VWrrnBxSjSPLZdbOyfcG+ny/tivStScfhXiyngJ3oNv4UGqxJn1r2P23FRPK96PqTsSCc9tm4bBOr9Spp7eGboIHoFIHp0Jgz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H1dXC+xm; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H1dXC+xm"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-546210287c1so2289335e87.2
        for <linux-clk@vger.kernel.org>; Fri, 21 Feb 2025 06:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740147257; x=1740752057; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kjc5mojYE3t4OSrHJVJCVcArh6fCjBoE/KbptrPihx4=;
        b=H1dXC+xm8xwCUrggGtHs/j+pHuuJfcs/GrE8Ohv9Ovv3T2hVzQUaZ/TzSIqeTNN4yb
         4VcPgCyvNHhRVI7EGLpDvpFifDZkT6AeQOCPdA5I4KbZiXuqYE16My0AMA/iFk6JrB1o
         aTPYN3JmOxHR5swrNAK+Rby+EE0SsD9tcoDq/MiaR71/YYE8mz7lbrUQfDbY265FKsFZ
         Jk5fh0uoQK2CN4pzmuQubNO4U70wRHcWPnt3othhntAWEPImafRXc8aRyfbwsMbVnJK0
         4C5OEb87m6i+a83jCCdyPoZPeHqepidDGV/2mHfTrPiRusk0F83I9D7RzG4R8eC/T6tw
         e1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740147257; x=1740752057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kjc5mojYE3t4OSrHJVJCVcArh6fCjBoE/KbptrPihx4=;
        b=lhU6I+KNOG6neVsuExTFR1K0BZneQq34+Ks7klKN9C/8lgt8oc4wWmL1hfQEHXzfL2
         kJayHVoC4BIpu5V7Kqijevc7dMk9/Aq+6WQx1CVyAgKuGdvE4y2aWb9XdxThm6ONMnYg
         0ttjoB5615r/Rk4qBcW/istBno3PMH9Q9yM6z0NkN5gHoJ+dSlo2XlqUYcAkpbAubPzX
         nzW3e90i/41KGV2TS9dINtagJcsJniew/2XpoXqVQZmiWJUFca0OoPBNkO4V949OXclx
         5mc50RvmMXro56sUFuRYjl7e+Y+dKEE4bg6cTESvU0mj5mVZR10ZbU4BOJBg0O4oCjgz
         5iiw==
X-Forwarded-Encrypted: i=1; AJvYcCV8x2TGmT+cGr/ow12OIag8LdOXCmZMG+t2ZK27fC+X4zXRSOlyLhcuVbMd7aA5pIAAqJlLhzHDRtY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBZGLdES9L8eiAtLycKH3LZeX88We1acZjLV7+THouPJeiOqbE
	Mx1sPGgQtMxYEFBSZ3Ta7/KTUb7uRz/k02k4oRsU29OeZCG08Gu7glREK/ScNIo=
X-Gm-Gg: ASbGnctfHipJ0R0tlVCGp+ZjMA5QtyUSO0smm7BMUeib5AHFTitAf7E9OxuO3zjB4Ol
	aCmBl9UiMBDNT/99WRu2pjjvdGqIkHVCVNzoM1VCsPZVqPRsudRh28uxyfpLkreeUz5eA3LgC3m
	/ItsdLOWdM0cfBVEKiW/2HUfZKqe6nt7pJHr8wbWuVAxL35I0E7oCSce5omzydAW6sggksQ1LD+
	+7K/IEA/vGGIOJSmqeNvSa/L1w0VOkU0JXgpzOlS+WqJ8/5geBQGTkDHjRDoFDIDb8xaVRP90YH
	pADWKLMrY4zv9kmwR3pt/W0Z7wDSiUaSIncepCRJJDedyW/NVdOEeL3X13VDOwSqN3BZputOzOw
	AErqOZw==
X-Google-Smtp-Source: AGHT+IGE3i7E5NeJLGZxn4+JQpuFC+AkpZ8fzRpeljlxc9T2QsR4EDahxkpiTqdExMPqOpBH1TyfSQ==
X-Received: by 2002:a05:6512:3a89:b0:545:2a96:34fc with SMTP id 2adb3069b0e04-5483914820dmr1344462e87.31.1740147257524;
        Fri, 21 Feb 2025 06:14:17 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-545280ec98dsm2394749e87.42.2025.02.21.06.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 06:14:16 -0800 (PST)
Date: Fri, 21 Feb 2025 16:14:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 04/10] dt-bindings: clock: Add Qualcomm QCS615 Display
 clock controller
Message-ID: <5f5nt4g3fy7446gxnjg53n4uir57hm62ewgusekls5sbmadwez@pfxmhrkck3zi>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
 <20250221-qcs615-v5-mm-cc-v5-4-b6d9ddf2f28d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-4-b6d9ddf2f28d@quicinc.com>

On Fri, Feb 21, 2025 at 02:50:15PM +0530, Taniya Das wrote:
> Add DT bindings for the Display clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I don't remember responding with it, nor does lore find such an email.
I'm totally confused, what is going on?

> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-dispcc.yaml         | 73 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-dispcc.h     | 52 +++++++++++++++
>  2 files changed, 125 insertions(+)

-- 
With best wishes
Dmitry
