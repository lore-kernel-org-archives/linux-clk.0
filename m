Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C611B0105
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 15:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730387581; cv=none; b=PH1FRMZ4kikVStGR80w3pYNOwVRRFizJzQOCSAim1hygPa7O/X/FUwu4+Wsz9+79Wrj/kxQx7eBtyDGmbuxtF8Yr4VGHLYqY2krS82AGOI1jNvqvVOZ1vw6pU0kEAK14ga5F/vOX9SBUnBWKfjB+UNeNTFYuLHHFqvR8VWn2sEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730387581; c=relaxed/simple;
	bh=kr02wbYSWNCkbF9WCD3f3jrehlBz4QKbygRTAdCmEHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1his6SQ4CqRLG2Nmn/7kBdFp6jRwm6h8HPPsLty18Igifbg3fsgR197LAcf6NYvC0SP4eRXmZwgyLFhh0cnVLNnj4rub7OtqK8f89sOcnnVZsjWInmdOlDW+cc9SZ68xtEWql78E0krsM49L2JaloC/H+oIB5GcGZp7vtVZMLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KirEsZq+; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KirEsZq+"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-6ea051d04caso8177107b3.0
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730387578; x=1730992378; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=KirEsZq+exLGPoyML4/+40BDpyFtnLYUgF7jco3Fe1XYI/0jgKqasZapXuRrWGVnmA
         KJ5fL0x6RzbYwNUhd+bXV0a7IfNYnYd+p7M5iz0p4fzPVCdf0zdB1hZIvXbIRNPktaFm
         sxgoKbelcctcSVYKGiXMJE0Mzm3Wa413MqdepmZK0BmhKYd3IsvvuDIuJLXNugYfen6x
         3rJhwSztP3HEpKLMdSKfucGYwDDynmj2VAoGJI7y3eTywcWvtJzKKdi6RY/OxZ4nxBd+
         /tYiVel0cV9Su+jLvN3iyyPQQjIZ0+mzeZ35EJe8psIQLCocH2msX/gpeMz3Cwoet5is
         ChCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730387578; x=1730992378;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kq/ZfQo178WpGnp7avIFwOb49kRFsd7BrjOS/dXjIo=;
        b=lopJMa92cH02RMVII/jmXOg6wQgCY1hbczWmPV3sGTdrr4nfmDGosS25iIlcCR/0bT
         5nTlxWV6RQBLrY78JTe8sYlm+beaT2ZddXehYn4Plx9joXWIMsKGCK7iIa52fyCGj3tk
         y7JMQcgmky+3n7b5WgZtFSIUSRMgab+xdKOzeaAELaDZqQ7W6c0wFBwSUn0GBoJcO4WD
         MJdePTR7Zt/vgKMiLI7T5VwFqzDYCUJl3PHSSNVCtmwKag/w9iwUu1qlrn1qS68VwE0C
         x+b0edo32TA7+aB7tJ52znI0cK3+bzGgw2h0NSjKELF0QmeqAnEGey6vei5wKBDA+m+r
         TF2A==
X-Forwarded-Encrypted: i=1; AJvYcCXnUMro4YOEu/a8vbvi6QThz0tQRazUWq4Yeegcx4APevq/2gfndrLDoOf0aZALf/8PjeRvmwdjiyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrN6z/m/M+ifKPlNoJ94YvMM/7mBRLAnKQIphdd237vODQr5LV
	3k3TM82G8S3NR3gdBsA3hPX7KEFgN+Mgqqxew9XZLTZY1EFiAyQu5v7J8I603AtcxOzp9hAvqu9
	xZ3FRlkpxk4cuWFpVBjWGTDRidSVLhILiPrf49g==
X-Google-Smtp-Source: AGHT+IGlMNJu4DDdD/Y1Axdwvh3uw+1T8q9MjgGCDRsqTJLHxT7tV2PbJ7zg2vq/LGfZxClDt4ZTbCxoj+EvkACSNbE=
X-Received: by 2002:a05:690c:380a:b0:6ea:4d3f:df9d with SMTP id
 00721157ae682-6ea64a8d45bmr3072217b3.4.1730387577820; Thu, 31 Oct 2024
 08:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>
 <zsgdwc6klccdbytdysgl342zllgmb7ttatjh4tnug3unyl7vl3@tlptei23yozn> <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
In-Reply-To: <1eaa1fc6-721c-46fd-bcc8-9b575d083dea@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Oct 2024 17:12:53 +0200
Message-ID: <CAA8EJprhyBpEyQYjCPopgEUVGF3ztGZ_6zo-QUPJ6=4VffEzZQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] clk: qcom: dispcc-qcs615: Add QCS615 display clock
 controller driver
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 30 Oct 2024 at 19:59, Taniya Das <quic_tdas@quicinc.com> wrote:
>
>
>
> On 10/19/2024 1:55 AM, Dmitry Baryshkov wrote:
> >> #include "common.h"
> >> +#include "gdsc.h"
> >> +#include "reset.h"
> >> +
> >> +enum {
> >> +    DT_BI_TCXO,
> >> +    DT_GPLL0,
> >> +    DT_DSI0_PHY_PLL_OUT_BYTECLK,
> >> +    DT_DSI0_PHY_PLL_OUT_DSICLK,
> >> +    DT_DSI1_PHY_PLL_OUT_DSICLK,
> > Is there a DSI 1 PLL on this platform?
>
> As per the design of the clock controller it has a DSI1 port.

It's just surprising to have the DSI1 DSICLK and not the BYTECLK. But
if you say so, it's fine.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
