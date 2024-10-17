Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76A41D0E36
	for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 22:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729202721; cv=none; b=IeQRWBselvNpiIt6ExtGOxGB3BM849R43d+qveap6ojApHLs7nGxZugjpOoWdf5RfZd41dZ8t6je6BsyvQzXqj3hxsGjKWnoSkzpSjb+1E59es8gV6o03GXLRY0FzA+ayPE5UUjhx7um43k6FvqHT3GsCHub1rS7IS3zlsna8Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729202721; c=relaxed/simple;
	bh=jD/Fe1lX59bLh+CuYejAdhr6Bnz41dgOxAI/o78O0Ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8uVDd8cEpyBMi8XMZ4PcbvyrwLcZoLfU/aEPsyXy23PPDji8zMIzLzZ4ZIq/a3eoTZDRZgrp0MOAm9m39NBIDl5Ulu+Qy1Y1KHBAMnhUY8yaT+3YQtiiuYfv6KNQ1TkuzOarYLc8voWaFRNh6JokxB392KKr1TRtioYyTvFkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aLWkIlkb; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aLWkIlkb"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb498a92f6so18376751fa.1
        for <linux-clk@vger.kernel.org>; Thu, 17 Oct 2024 15:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729202714; x=1729807514; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tZT7lMat6/ClXCJCRy4JE1uWNJw8YfQq7oksTJj7I6k=;
        b=aLWkIlkbfyFnu5gnEUvAL+nci19+lN+T7fn50RrXAC1GdIfZ8k6Db7t0A7ogkSOQDh
         c5Q3BSBP4cc4sQ/GutOspBbm0Th9WkoIbMcCIzIWVOwYou3ra3djy1Pfg28LeDqtDBnu
         IIbn3YvJII7jCXXTLZYSVHQLGFArx3l34CV58cZICYOHpgGzImurq56HJMq2kqQaXUZw
         rD20/xC1ZQh3NoVAhyUDnuW9hoE8dqZOfTHvKnV0HPBcEJpanfu+1gLrZ24+fHOZSJaP
         7VYL6huS1CrlooIxWR57dAB+RwK2yoJojAO68KSlCANLOeSqQOxf+vvnj6qG1GgXdXI3
         D6xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729202714; x=1729807514;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZT7lMat6/ClXCJCRy4JE1uWNJw8YfQq7oksTJj7I6k=;
        b=clnQO1ru/GqknqaUn88ectwXcjlfrPHiBrYoPBJBrVsbV6ts2c9SsQ1brsAqdV4owm
         IVvF0sLJ/aOW5wi+jMhOkWkscHkjlsYYxTTEnJSEMde1yqhoyGlit9LFJH+BAWVYisFx
         iNWs+nn0wCm9gG3CJ/agvKHE/hvGJyxJ21NPDbeyRoSm9P/YBG0qm/G8cJYniRh9CEe2
         O5SyCtqLwkAagdaf326ZkLvZA7V9sHUQbsl2dzg/20iWFe7Jh9hC2BhzSE7dqUV3bCR6
         T4Fiq9z/NKF8Jbkdsy7QsaaIAfhp1jXMhB4/11tW4guckgBvj6/HeRKwR8Ri+oIqhG2v
         sVFA==
X-Forwarded-Encrypted: i=1; AJvYcCXUCRew0CgDeVQL3w4rJ18JOs0QhGHkVPYmBKtQy2KZfoMDnCNTQBG9/TAdL52iPDw6vYLvQTdR6BY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfMMEAmYwivX/IvVtku17+iMHJpcChW7g/a3daGyqYSMzLvaPc
	hfKfqSmzBB3PXYTjzKA6u+I47mWk63DsUrh/lgQGJBKywWefTZRZ5zo5q/XXDcQ=
X-Google-Smtp-Source: AGHT+IGMFrsX5XS3bpPZ5ASfvtmHtmQVAlaFsEfGRjHV+zQlL8LHl5ouQpgKLnGjkIePHpyFAhQPBw==
X-Received: by 2002:a05:651c:2115:b0:2fb:5f9d:c284 with SMTP id 38308e7fff4ca-2fb82ea2827mr555711fa.16.1729202713782;
        Thu, 17 Oct 2024 15:05:13 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809baf16sm433451fa.68.2024.10.17.15.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 15:05:11 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:05:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 06/14] clk: qcom: clk-branch: Add support for
 BRANCH_HALT_POLL flag
Message-ID: <jcjncf5k5syvcvwxoopksisjvvmw4cvxo35nieqf63mquj57io@fumh4jnh2e4p>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
 <d7989a770f0eb35a5ba346beb5e7548c.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7989a770f0eb35a5ba346beb5e7548c.sboyd@kernel.org>

On Thu, Oct 17, 2024 at 11:03:20AM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-10-17 09:56:56)
> > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > 
> > On some platforms branch clock will be enabled before Linux.
> > It is expectated from the clock provider is to poll on the clock
> 
> Unfortunately 'expectated' is not a word. The sentence is also
> grammatically incorrect.
> 
> > to ensure it is indeed enabled and not HW gated, thus add
> > the BRANCH_HALT_POLL flag.
> [...]
> > diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> > index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb 100644
> > --- a/drivers/clk/qcom/clk-branch.c
> > +++ b/drivers/clk/qcom/clk-branch.c
> > @@ -76,6 +76,7 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
> >                 udelay(10);
> >         } else if (br->halt_check == BRANCH_HALT_ENABLE ||
> >                    br->halt_check == BRANCH_HALT ||
> > +                  br->halt_check == BRANCH_HALT_POLL ||
> 
> The name is confusing. The halt check is already "polling", i.e. this
> isn't a different type of halt check. This is really something like
> another branch flag that doesn't have to do with the halt checking and
> only to do with skipping writing the enable bit. Maybe we should
> introduce another clk_ops for these types of clks instead.

SGTM. All clocks with this flag use clk_branch2_aon_ops, so it is easy
to switch to a separate clk_ops.

> 
> >                    (enabling && voted)) {
> >                 int count = 200;
> >  
> > @@ -97,6 +98,10 @@ static int clk_branch_toggle(struct clk_hw *hw, bool en,
> >         struct clk_branch *br = to_clk_branch(hw);
> >         int ret;
> >  
> > +       if (br->halt_check == BRANCH_HALT_POLL) {
> 
> Remove braces
> 
> > +               return  clk_branch_wait(br, en, check_halt);
> 
> Remove extra space      ^
> 
> > +       }
> > +

-- 
With best wishes
Dmitry
