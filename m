Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44FD1D27A3
	for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724782355; cv=none; b=Y5RqkyBl2x7dv0fxjEpFvBF9x+ggviSkj6K6XbVwwtAoQ+7QqrNQKkaaEZR+aP7+R0AHj07pWRq9O+FUbr1XpBRM7PREzCj6gfQFD9okOiSpW6kMMuUg2S0i1mrPozzLRGV2EI4i9NgaQ2YlqBpwIhWx4pZrg0QpuXLmTbiuHGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724782355; c=relaxed/simple;
	bh=2Gq+2musOhFx/RMETG21n43RSloaFRXCaGyo+L3E4Wg=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LUP7ekptteE9oMzdjbGGwCDd9LQ5z0DiurpzTWN5IWJk6Fm+oqCFugOcWYTlCPCalZev5lLyhxRsAC1Yqi953cya1RwzJ2NvFOun+kdfyQ98y/bD+8X0QlGjpkhSmYeqxhKHwS9No2pSwLdltJeRr9UFbstc2XSv9/eilOCPku8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MqRSE37Q; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MqRSE37Q"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3db16129143so549411b6e.0
        for <linux-clk@vger.kernel.org>; Tue, 27 Aug 2024 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724782353; x=1725387153; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/+UZugxSnKhmm7RFCDsmleDRPP8DXg1UAuzoT1y4+P4=;
        b=MqRSE37QYR6tDVPksZ7r+UQJrE1wWQCz/ZDGXZEHnPoIqYDPTHnyBBqhGboHLS1N/D
         Zkkc4v1QBEabawegSsFJrvVa3OFdLh/WNjVnbX9nLoDcXwLAKiMScsCpmDtuxs/6vhm/
         hkbkbf2/Nc5eUvt8Vy15xLvTTaH8RqjOeIAvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724782353; x=1725387153;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+UZugxSnKhmm7RFCDsmleDRPP8DXg1UAuzoT1y4+P4=;
        b=nkwGshk41QpX4nDgaSwh4eb/0h48Mnnab/JqFZl6OKb9omD3i0z4Xn+s9iFA525gDm
         wvcrpF7W7BulMHVUT5oSQGCJImR13Xm/QhrkJmGhNa7Jv3ZJU6GjHfiw89uMAuZtw9Jc
         Hoxon4iIghATCPUMsqXU1k7tOwjogr/9Q1+Z2XcYNdzzSl87DOvr0ZKUvOt0Szvrzfc8
         AbQn9G0r9L6+YwKq/KsiHE/5rwCInz77CqdeJ+BKdfLG2bp3MfhuMJHYhtq003FBYdSq
         u0+SBwG3V5oTbYAxE+VDv045HuXd61tYO00VKFv3i+7uXa4pJNI9RN6wVTcUJK6jfFJt
         SMvw==
X-Forwarded-Encrypted: i=1; AJvYcCWlaw/MNbE+3JWVMZ5VYwADSRtr5/x4eHPCGsoWSvBbDEBkY1pEqUNFHeiqqJuTfLetF1fWAnmhpW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNpaBq+rDDHtbYTD1mr3kVnvFdRoCJzmIiwyXSn5mhG5mRYBHb
	2llUZBR7DzxI6GqBDBVv9bbO4Yy4JWALNiYKk8ycUCFb4KjrI9EAkZLv9liQDnkS90GY+aBDAG9
	oYbjfwsVBSZ0YZ3b3TAGMo11D5RhBMApv3Gac
X-Google-Smtp-Source: AGHT+IGl0H4rNd8NW0ENgt9xGW7rk51tX57pU2aohNgYNq8W5Pr4zVblVKQwHr9lpbRFsQig9r5rX8R15eQqRrrD7jQ=
X-Received: by 2002:a05:6808:2118:b0:3d5:4256:26d4 with SMTP id
 5614622812f47-3de2a86e26amr17368925b6e.7.1724782352645; Tue, 27 Aug 2024
 11:12:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Aug 2024 11:12:32 -0700
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240819233628.2074654-3-swboyd@chromium.org>
References: <20240819233628.2074654-1-swboyd@chromium.org> <20240819233628.2074654-3-swboyd@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 27 Aug 2024 11:12:32 -0700
Message-ID: <CAE-0n52rYVs81jtnFHyfc+K4wECvyCKmnHu2w9JhPNqvMYEeOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: qcom: gcc-sm8550: Don't park the USB RCG at
 registration time
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, linux-clk@vger.kernel.org, 
	Konrad Dybcio <konradybcio@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	Amit Pundir <amit.pundir@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Stephen Boyd (2024-08-19 16:36:27)
> Amit Pundir reports that audio and USB-C host mode stops working if the
> gcc_usb30_prim_master_clk_src clk is registered and
> clk_rcg2_shared_init() parks it on XO. Skip parking this clk at
> registration time to fix those issues.
>
> Partially revert commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration") by skipping the parking bit for this clk, but keep the
> part where we cache the config register. That's still necessary to
> figure out the true parent of the clk at registration time.
>
> Fixes: 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration")
> Fixes: 929c75d57566 ("clk: qcom: gcc-sm8550: Mark RCGs shared where applicable")
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Taniya Das <quic_tdas@quicinc.com>
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Closes: https://lore.kernel.org/CAMi1Hd1KQBE4kKUdAn8E5FV+BiKzuv+8FoyWQrrTHPDoYTuhgA@mail.gmail.com
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/clk/qcom/clk-rcg.h    |  1 +
>  drivers/clk/qcom/clk-rcg2.c   | 30 ++++++++++++++++++++++++++++++
>  drivers/clk/qcom/gcc-sm8550.c |  2 +-
>  3 files changed, 32 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index d7414361e432..8e0f3372dc7a 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -198,6 +198,7 @@ extern const struct clk_ops clk_byte2_ops;
>  extern const struct clk_ops clk_pixel_ops;
>  extern const struct clk_ops clk_gfx3d_ops;
>  extern const struct clk_ops clk_rcg2_shared_ops;
> +extern const struct clk_ops clk_rcg2_shared_no_init_park_ops;

I'm considering inverting these two rcg2_shared clk_ops so that only a
few clks are parked at clk registration time, to minimize the impact of
commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon registration").
We're up to three or four band-aids, that we can probably wait on
applying if we make all the shared RCGs determine the correct parent at
registration time but skip the parking, except for the display clks on
sc7180 where that exposes another problem with shared parents getting
turned off during probe. It's possible that other SoCs will want to park
their display clks as well to avoid that secondary problem, but it can
be an opt-in case instead of a change to all shared RCGs.
