Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF648210EC
	for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209754; cv=none; b=DrqU4G8aUHsczfmCFBmU9nYtDfZ0Q+UhOlarmfvMDhtpbuSAh96wOsF1dSR25DuYp6/8EjUEYaMmodNn1qalmEFYna1X2bDKUPxwR79grVhDrfZsiAuTw4BamzEmhUPQU27cfn7xzKePq6MajVaidyxdRxM2szdG+ioSaLqNpZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209754; c=relaxed/simple;
	bh=drdFYOrEjEZZrQPn6blYFIY9QhufSQCcwyTzafmSIHc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=elPYDlMDkINHX4DAY3OCvmOSHmcTr0GTtGks2iM8E1xJ0dkb/Ov4CxS+WAEcJQBcn3IzKOCaqZTaHCt3dDniwMizNQYqlFe5TtVzN3cDwxKonTJ1z/4D0u2Cz5cUebQIWpra/CRiXS2+Rn3eVi51iRVSnS0fbpkURGjwriQIecE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VSPdeGXt; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VSPdeGXt"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-64f4fd64773so73813697b3.0
        for <linux-clk@vger.kernel.org>; Wed, 17 Jul 2024 02:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721209752; x=1721814552; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LL2uY9ouT8695FraeZM3uIpWSuZKwhAInrpmi+yLgbM=;
        b=VSPdeGXtUq3LDXlfUm7MAyQINhPS8/mPB4tkgq9Sv4NRPo6Q1p/K5Q4+KrkMMvlHgL
         B9+JKZtAphoCYnkYbn4WC+46OOJG8Ud15V42lf5/XIoGPgcrV8tVICgKjp2V9nvgRLQK
         uB2xVYELCSqie4GgOKH9h+GlTkRsvhvNjv+TPmskCIcu2x4GzGzQ6PZMqWGVBxtYYW7E
         vt6zD9Rn9S8rubzWVxKLE4rEMCL1f1zL2hiTXDadGrpyAanpb/oxtVahwLcxruVEN9/s
         hlqNs0RUro5gYOO0u7m1NiXDuAeOJihYT4C/xUQPNMZxWdRrwtTDGZZ2h8PoPClSarzq
         7udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209752; x=1721814552;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL2uY9ouT8695FraeZM3uIpWSuZKwhAInrpmi+yLgbM=;
        b=LGxpoLoHBLbaENHumFCm6/ztDSTuCvLVy0RZmqDDezmkP3tnyOPVNFgRjP8Hc1kI4l
         GynV16UN0Nt+tc3R0EbmpfnTBYrBwa8CCxhYymrKFW6aljuld146p873woCS9KCEOXdr
         SwOn15C/W+OxKr3wICscdCULSMcan9zCLyzwBevJqcQwP4Ve/a6H74RHGkRFnc9B1669
         f4z/eje5WmMMJ+4b5UeS3vmcVFTtNayZ93Z9BQPkziGgl8QpbEiRDMDD/k14bvV2S78Y
         OvkuTM34D8WuCQuOjo3aMNfsk27W64cL4ItFdWBWP3C8zjd7SYsy6ye6sJpgup5GT2pB
         EdiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3qOCCAr4h7ANBYCTrs200PHb4asvviCRIJ4T4/JkZCvpTszVVHYRenQWd096RQ3ukgAbtZqRpQjPzD3L6n4JgHLtfECrfC2I3
X-Gm-Message-State: AOJu0Yx6ppXqSO7r5Ybcdl6hJhqfovwM/T8ZUCTgAhbEY1lzZOtxrGpO
	rq/5mUCHtjnmlhTQhsgIklokvBqsyGQOfUmvzaQ6ymMgrnybh6NXx5jInwAJfjfvHY6CRaLeHhV
	MKZjbAvVrQ6JyeHH1FjNPNwvEsS7fccuUBsA2Jw==
X-Google-Smtp-Source: AGHT+IHjmMFD6c3evR25tinvxOr2rkpD+ML4O2P6BsHhDsyGohpJopMXy1cyYtbnmZhlLNx7godvFt8mE4znoTGHtng=
X-Received: by 2002:a81:77d5:0:b0:664:4b9c:3ec with SMTP id
 00721157ae682-664fd78f3bamr16513537b3.10.1721209751656; Wed, 17 Jul 2024
 02:49:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-1-efb4d927dc9a@linaro.org> <d60cd97b-a1da-4dbd-910d-92cd62762afd@linaro.org>
In-Reply-To: <d60cd97b-a1da-4dbd-910d-92cd62762afd@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 12:49:00 +0300
Message-ID: <CAA8EJprvS-bM47BTmgtA=9NunW1Lpy-9dLdYmSy9RuL6JyQENw@mail.gmail.com>
Subject: Re: [PATCH 1/7] clk: qcom: dispcc-sm8550: fix several supposed typos
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 11:08, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> Hi,
>
> On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> > Fix seveal odd-looking places in SM8550's dispcc driver:
> >
> > - duplicate entries in disp_cc_parent_map_4 and disp_cc_parent_map_5
> > - using &disp_cc_mdss_dptx0_link_div_clk_src as a source for
> >    disp_cc_mdss_dptx1_usb_router_link_intf_clk
> >
> > The SM8650 driver has been used as a reference.
> >
> > Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8550.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >


> > @@ -1146,7 +1146,7 @@ static struct clk_branch disp_cc_mdss_dptx1_usb_router_link_intf_clk = {
> >               .hw.init = &(struct clk_init_data) {
> >                       .name = "disp_cc_mdss_dptx1_usb_router_link_intf_clk",
> >                       .parent_hws = (const struct clk_hw*[]) {
> > -                             &disp_cc_mdss_dptx0_link_div_clk_src.clkr.hw,
> > +                             &disp_cc_mdss_dptx1_link_div_clk_src.clkr.hw,
> >                       },
> >                       .num_parents = 1,
> >                       .flags = CLK_SET_RATE_PARENT,
> >
>
> This one is NAK, I checked and on SM8550 the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk is really disp_cc_mdss_dptx0_link_div_clk_src
>
> I checked on the SM8650 side, and disp_cc_mdss_dptx1_link_div_clk_src is the parent of disp_cc_mdss_dptx1_usb_router_link_intf_clk,
> so it's different on both platforms.

Interesting. On sm8450 disp_cc_mdss_dptx1_usb_router_link_intf_clk is
also sourced from disp_cc_mdss_dptx0_link_div_clk_src (at least
judging from the driver file). I'll drop this chunk and update the
clock from the sm8650 branch.

-- 
With best wishes
Dmitry
