Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7A7200CA4
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 11:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729249938; cv=none; b=jFRoFkW2UYVqJnRjhSmqSyhMZNzI8lB/JbeiGugOWJEU9ZgcZHvo1lzgKPwObGsfjLPPb5werc8hlhx5GN43OguJrgFd7aW7F+TK1b8qtw9pW3qB1mpCXNarpO7qz65DOxlorMNFu6htazGPHVbLhnSTMpulNAmcQ/G8sJDh2MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729249938; c=relaxed/simple;
	bh=sboLUVaWZDCOJMR+0tS0W8F9u4PFF4DVPPd99k5TIBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ribb5pZ8zKmkpBl+kisNNOc0Ztor1UtO5wXLWyzTTY/6essvvdGKCK5RSpLzjVGRd8yiP0qv5zg1PCEIVSXzN6pZHC0T59Oe6Vtqf4J4Dg0Yit2A3NBUuLNTNn1DvW/hoBq70QOorBQi7+Mv8dPMlapOS6vt0fH6z7wyp1M5dkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k/ge/sMc; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k/ge/sMc"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb443746b8so23392461fa.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 04:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729249935; x=1729854735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2s2ZCLF1waKizSxdSo7cWD0QLs8Ba/I3KQJi9DrQE90=;
        b=k/ge/sMc43oPz2J+PEfZo0Lja+MVIr60hQRBaw7/sJqiOXM+X0IVf3BR7F9TYhZ+EO
         NCmWJmLFmyMbxWVQhHPaE6Hn9uC929wAbc9uzWUresYZdabXNVPKnjCyKVCS3BYj3jp5
         XZelZiomRXxNu6hvNw3TDCLVMd86XY8zhj3upOLT/ZuuoKAWJqGo6QTDAKs/fe4DsV1X
         1VTID9Klsv/pJy+5KDc+IUmppgIWXpZ2KTQmxOHLC4wFrnB4sMaZgMkrDpgjZmaySITs
         CxZ7QtJ7fPxeJqNrGuH0FL/t0e8cemNiU74SNV6ASba1P+Oh8Huyh7pt6aCjNPtnaFwc
         hS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729249935; x=1729854735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2s2ZCLF1waKizSxdSo7cWD0QLs8Ba/I3KQJi9DrQE90=;
        b=KEuVHfqm8uRFI9ttA6mk9ACu48zlVTVhF9p30nW2Em9MU8NwhDfPxrZxiir93mb3Z1
         pb2tMUvAnyA0z8RvPESQa00UfZBRYFUNKwaVnZ+ZphVzGPYHGZDKTA5mDUjO5LjNYd/a
         8tqvuesvzK3II3kbJNM1TJMmV8G22d/Etv5ijUSlshPqbkTechrK/fynkhz2evYigPiw
         rIwCFC3QNjyK04OKsq/noA0OGtDFgkGHOFVL6WNH9yFcWmnfMXs5OIDWTBgs1naHy3tP
         W3+jdj94I+GfZtjQqw6uRh/fJnWVF1AK2eqK2oKoniT1IVBzYi3lQLMHPExT4t42s5b+
         lRAg==
X-Forwarded-Encrypted: i=1; AJvYcCUR3yF98QdY6EpM/ZUG5gtfTrNJVpVWdwlCsgfIksa+FML499gUVTFQjB+VY0Bs6P3oESvZ8E5Gg9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Ni9Mhlvn/0y7ItAYaYtV0ZP3dJqoozmoQD/VF/nD2pzY3S8l
	rs72V3SO92Jl5ptj06dmEO6dx/Ju+JOsZVoWomFXMm+Gar/hAvwsrzWTvT3TIDI=
X-Google-Smtp-Source: AGHT+IGdgiuS0f6dYbTG6111LuFSuvTL3Dx3rqn1aHYRUJgo6DJbnJR1F0rw0wpH3OGeukLOmxaF7A==
X-Received: by 2002:a2e:a549:0:b0:2fb:3d86:d932 with SMTP id 38308e7fff4ca-2fb82ea21admr11666401fa.12.1729249935090;
        Fri, 18 Oct 2024 04:12:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809a6adbsm1883801fa.4.2024.10.18.04.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 04:12:13 -0700 (PDT)
Date: Fri, 18 Oct 2024 14:12:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 06/14] clk: qcom: clk-branch: Add support for
 BRANCH_HALT_POLL flag
Message-ID: <gmw3fkvtcoorsdqxdqgr4ioew6wuvtuuvy44qv6fpyrs6wgbv3@jqyayktyxfvn>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-6-f75e740f0a8d@linaro.org>
 <d7989a770f0eb35a5ba346beb5e7548c.sboyd@kernel.org>
 <jcjncf5k5syvcvwxoopksisjvvmw4cvxo35nieqf63mquj57io@fumh4jnh2e4p>
 <dfafb945-69f7-4378-9bb0-72eee37de235@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dfafb945-69f7-4378-9bb0-72eee37de235@quicinc.com>

On Fri, Oct 18, 2024 at 04:32:47PM +0530, Taniya Das wrote:
> 
> 
> On 10/18/2024 3:35 AM, Dmitry Baryshkov wrote:
> > On Thu, Oct 17, 2024 at 11:03:20AM -0700, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2024-10-17 09:56:56)
> > > > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > > > 
> > > > On some platforms branch clock will be enabled before Linux.
> > > > It is expectated from the clock provider is to poll on the clock
> > > 
> > > Unfortunately 'expectated' is not a word. The sentence is also
> > > grammatically incorrect.
> > > 
> > > > to ensure it is indeed enabled and not HW gated, thus add
> > > > the BRANCH_HALT_POLL flag.
> > > [...]
> > > > diff --git a/drivers/clk/qcom/clk-branch.c b/drivers/clk/qcom/clk-branch.c
> > > > index 229480c5b075a0e70dc05b1cb15b88d29fd475ce..c4c7bd565cc9a3926e24bb12ed6355ec6ddd19fb 100644
> > > > --- a/drivers/clk/qcom/clk-branch.c
> > > > +++ b/drivers/clk/qcom/clk-branch.c
> > > > @@ -76,6 +76,7 @@ static int clk_branch_wait(const struct clk_branch *br, bool enabling,
> > > >                  udelay(10);
> > > >          } else if (br->halt_check == BRANCH_HALT_ENABLE ||
> > > >                     br->halt_check == BRANCH_HALT ||
> > > > +                  br->halt_check == BRANCH_HALT_POLL ||
> > > 
> > > The name is confusing. The halt check is already "polling", i.e. this
> > > isn't a different type of halt check. This is really something like
> > > another branch flag that doesn't have to do with the halt checking and
> > > only to do with skipping writing the enable bit. Maybe we should
> > > introduce another clk_ops for these types of clks instead.
> > 
> > SGTM. All clocks with this flag use clk_branch2_aon_ops, so it is easy
> > to switch to a separate clk_ops.
> > 
> 
> The basic requirement here is to just poll in both enable/disable, but HLOS
> cannot update the CLK_ENABLE bit. The clock could be gated by the bandwidth
> vote and thus to ensure the clock is in good state before the consumers
> start using the subsystem.
> 
> We can definitely think for a different ops, I think it is better we have a
> good name to the flag.

Granted that we end up using just clk_branch_wait() in enable and
clk_is_enabled_regmap() in .is_enabled, I think that separate ops might
make sense. Anyway, as this concerns only 4 camera clocks, I can drop
this patch for now.

> 
> > > 
> > > >                     (enabling && voted)) {
> > > >                  int count = 200;
> > > > @@ -97,6 +98,10 @@ static int clk_branch_toggle(struct clk_hw *hw, bool en,
> > > >          struct clk_branch *br = to_clk_branch(hw);
> > > >          int ret;
> > > > +       if (br->halt_check == BRANCH_HALT_POLL) {
> > > 
> > > Remove braces
> > > 
> > > > +               return  clk_branch_wait(br, en, check_halt);
> > > 
> > > Remove extra space      ^
> > > 
> > > > +       }
> > > > +
> > 
> 
> -- 
> Thanks & Regards,
> Taniya Das.

-- 
With best wishes
Dmitry
