Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD709165F05
	for <linux-clk@vger.kernel.org>; Sat, 31 Aug 2024 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725087418; cv=none; b=q4PuLsuOXeRAwGeZWjFIYRaS2U2u9vs0LwsDKfh00g2dzxfHyyb0+Aqm3JLuAqqSVvSAuvy7paKaZG+DQDcJ/PAPwxv+Xo1/XnogExf14HF0vUqzn/VpvpjkhhhYuYPy9MFys2/+iDbOW4xvpJ5dSmrIC8087EM3FuyWX3eYawM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725087418; c=relaxed/simple;
	bh=8+xb/c5q8Te81bywgznH7epprrs+vus2sJDb/zrAqlI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DmG1T2N9h4TaMZWjujoXs5GxIagH9fEsdH7cmgEgkzB6nEWxz8To0dQ6Hkux3OaRbDk0AtE5pG5dIOAf5yrs7cmsbXtWXOFSnGah4d31425dyX3ZHEQz78L0hEi2KpTrmx9j5E42LXiD44pN2B2FIWFYaaAfoylGh0b15idk37A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ipA2EL28; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ipA2EL28"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e115c8aa51fso2686497276.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 23:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725087416; x=1725692216; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=35/Cpco2p2doBWBoqkU/4WZL7A9fRuozoOMEP5DhBlM=;
        b=ipA2EL28NfkHMF7Bu1AE1NRHUWJcX3Jg1VVzfgrd6xD/g/xekeEJULFMdm5ZNaVbnw
         spp67cqXt7EZZrUaj8yk80QL6M5R2lzkRRRtdg4/F5NH2gh/kCu3E2NdOTQwube2J6NI
         cDvDsZa1cemjGvwLj2MOgrk1/kFlE+IJq6LVi5vwqRn0iXio46lFvKKBR+AXTv862xdj
         1/zeYScrc/34ICH/mWL9lEJogDtZ5TjTqG7oWmdzGuLmh2EkE5m39wAB/IFQUJ1ipCVu
         IrkqFE2FuG+/gO7R6IiKnfQCbATqLRq3xLy2pZyk9GzkN/MsMCFmQ5XfAgML4RJfp47N
         trIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725087416; x=1725692216;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=35/Cpco2p2doBWBoqkU/4WZL7A9fRuozoOMEP5DhBlM=;
        b=PRM40X8jEmaPGubFb7HENEDSZapspPB/3SEzDZXPpEt/26cpbGai8zY5UPEJLUfAxx
         YBXU6JQIb/6dyEYjf236DH4dwCFuHGsOt15e/YNoa5uxLC+c8wVccYDju+qd+QokIaex
         UNVvSWWMpboKIdLvtdXOs0TEKdr9dy+qqmJ9fSvZu/VRJdRY1b1KbUFw6toTtsD5LC4y
         ej1Biwp6ARcddaG9zq7B2wDig4dCMeoWNgWOUl8WqPEdXbN3wKFr8yITzj4zk+GINf8p
         upXi9y7f/p/lx/xEnDSSS17rIcEMOLxLvmbGl3N4rjrz9/O8PhohBn+EODf6AZDTkVLX
         uZWg==
X-Forwarded-Encrypted: i=1; AJvYcCUYrzHNZVSEnNJ4Q+dHlJxj8Nc9l1j8CJP3GkHbuHliZ6mBPLTLiIK6b8ZInb30soG34DhbLfrCEMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXlLPqBabDl5AKkM3T1Rs+MBp4zNeM1AxAb9LlckPzWhQ88q/O
	nUyLLRWJeewXuoxuU5qOamPs0P8z5NKh3QzrjwnG1SEf84NzUOQCo/Sfz1SWfeALYlXfuVdygAz
	//WgRhF6glUWGdCQ/x4RFCqjq1PBDKdxY+vA93Q==
X-Google-Smtp-Source: AGHT+IFWbLWA4IjXvF5bKeQh1lJtnNOkDsN8Sdtsfq95rr64K/eYP6o6HPpIf8dFbQYhHTulhF5MoAz7eON8AeOpAgw=
X-Received: by 2002:a05:690c:d81:b0:6cf:8d6f:2bef with SMTP id
 00721157ae682-6d40eb67be1mr51383017b3.7.1725087415578; Fri, 30 Aug 2024
 23:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829082830.56959-1-quic_varada@quicinc.com>
 <20240829082830.56959-4-quic_varada@quicinc.com> <gomm5yozebwfuhmgziajmkflbj6knmbwae4mls5kuwl5ngcbrx@mndpiktfken2>
In-Reply-To: <gomm5yozebwfuhmgziajmkflbj6knmbwae4mls5kuwl5ngcbrx@mndpiktfken2>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 31 Aug 2024 09:56:44 +0300
Message-ID: <CAA8EJpoSZwqw7_UVVXzwOd77Xh6j5LzKus-ZfuL_f5yrc8AYkg@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: clock: add Qualcomm IPQ5332 NSSCC
 clock and reset definitions
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org, mturquette@baylibre.com, 
	sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	konradybcio@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	djakov@kernel.org, richardcochran@gmail.com, geert+renesas@glider.be, 
	neil.armstrong@linaro.org, arnd@arndb.de, nfraprado@collabora.com, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org, 
	netdev@vger.kernel.org, Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 31 Aug 2024 at 09:11, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Thu, Aug 29, 2024 at 01:58:25PM +0530, Varadarajan Narayanan wrote:
> > From: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> >
> > Add NSSCC clock and reset definitions for Qualcomm IPQ5332.
> > Enable interconnect provider ability for use by the ethernet
> > driver.
> >
> > Signed-off-by: Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>
> > Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> > ---
> > v5: Marked #power-domain-cells as false
> >     Included #interconnect-cells
>
> Then this might not be GCC-like clock controller or gcc.yaml
> should not include power-domain-cells.

qcom,gcc.yaml already doesn't mark #power-domain-cells as required, so
it should be fine. See qcom,gcc-apq8064.yaml or qcom,gcc-ipq4019.yaml.

-- 
With best wishes
Dmitry
