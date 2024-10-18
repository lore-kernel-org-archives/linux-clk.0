Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F542038D8
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 10:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248837; cv=none; b=cEmQY4F6RP6Kol9zMqQGnP7Lc7vj7CkDK3Tq0w4mZK0A4HRX1Sf5npAfQgBh9cabtePGS+8hZQVn9otCMyqSsyg9BikGbCOAh9rSnnjSKnX6XGSuLbjDzXKoIZVJwCQ/o8gQATepu5UUDPBMnQbyS1wHguAe25TK267vNTxb0E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248837; c=relaxed/simple;
	bh=JNAetrbEIbz5zuzdBDzLFQEl9H+Qjb/uUZ6JMT9FvW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MCsE9GmlIGHRiHLK/cRxBdVvfqOLR9xNCUY94JzDgWimK+ONBMYE/6YcdmnVSc7FxPBvIRWkNzBxpdwo1R18PInnO3qIWwRG73Wk4uqoSEIMINMcic2G3Mm6uWLHrkW/dl1U2qF8jFzAd5lkFQJW4mAjpb8OowIoP3WQYFdaWBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AAuOyt5H; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AAuOyt5H"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539fe02c386so3099743e87.0
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 03:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729248833; x=1729853633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T5fU/r5k+1l/mFX8IZlxjUuhGDPCi/JTXvQgnrX+XHw=;
        b=AAuOyt5HbGSPIr0Srnn8JsoZITXhsub7Xd8TNFTXfM0RcZlCuqSbzlv1Iurm65OlZ9
         kStbcVUdliyiW2GZXD6nBiwzHEJ0ugRMMSwKdfHshg4MVhErm4N88pGgJGmmfsSCyPLq
         w/XLKbQJ2jzZm8h/sCbvILk2qLUwH4EOySW1+E4U5OUbHQSi6qDNozbTprgyRwzaiKoq
         KFEzJfqMPQ1OqTC8d8wtYd/6uvzvx4DVwZX2koGI4op///eSsmT3ljJ/Xh/a2c4J063g
         zSgIUXqpq5+xQ8zFFuL50hlIQ1w1GC4MT0bXx5F70O0fe7hVvSK9wgaqtr+ewwgfc1fS
         mMwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248833; x=1729853633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T5fU/r5k+1l/mFX8IZlxjUuhGDPCi/JTXvQgnrX+XHw=;
        b=la6qvbm7DQb0ZtuSHAxpna/INz6Qs2gOPVNuI5+cFsnIxhmb6Nt/dzgY/P9J6UZIlc
         9HdFPguotLKxVlHsEWfoOi/JWlanDNwthC0v0eVgEwGfvHUepFws2J3dQnZUn0qbspg0
         X2FpJ4wzFwRy4AiN6c8KLbTtNmoZSMTRmZ/iK0j9gC8Pb6JOJsFKt1JqgtxbLZlPK85D
         zkSKKxUiAyU5iXmDKmSJVGbai+JMvLVRSKzVk75sJ3UqpZXRditXcos9Um/mAFbae9CM
         8p7W9T9X1VVYb1T86Ex+/yP5AkuM24UkDdlFv9fmNEntKaRcae9lnsEiEtkRr+uTFCpP
         1rPQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Npop4r7K7nujkov7f4WcGpaURORjfrEXsW+MBp/1mAMo9xFTyAHJhdAKHohcJ/1AMjVr+1BnGpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYg3PNpgJThCetZPRFGm3dJ9y/xJjJC337lsksFta3axYybHV2
	s1wcChDxW1B4mVEG62xMvc4ZR/2aUVsjScnQ1n8lAVI70G0/4UPf17IQzP5x6Rw=
X-Google-Smtp-Source: AGHT+IEqnhsANVIdb4jsU6NziP1X9+cELpuZr6T5YnuG/2aBSh1ttrm6J/pwrdM1qD95PdPHG6X71Q==
X-Received: by 2002:a05:6512:3a8d:b0:539:f8c7:4214 with SMTP id 2adb3069b0e04-53a0c755f1cmr2062086e87.28.1729248833425;
        Fri, 18 Oct 2024 03:53:53 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151f0d33sm183896e87.150.2024.10.18.03.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:53:52 -0700 (PDT)
Date: Fri, 18 Oct 2024 13:53:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Stephen Boyd <sboyd@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
Message-ID: <irn46t7zhmvhkpbvc56o5f4ta6ftiksemdndt733fon53oimzr@tyhhlwgdq6ez>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
 <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>
 <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
 <5904599efffa7ce747772c0dcc1c897b.sboyd@kernel.org>
 <scwpcovoazmd4yrwtczghx4e5eopqoknknqzcr23wjve65bmxh@ih5efkh53g3h>
 <67795327-74d5-4b5d-b778-bd0f90c58e97@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67795327-74d5-4b5d-b778-bd0f90c58e97@quicinc.com>

On Fri, Oct 18, 2024 at 04:20:45PM +0530, Taniya Das wrote:
> 
> 
> On 10/18/2024 3:26 PM, Dmitry Baryshkov wrote:
> > On Thu, Oct 17, 2024 at 03:28:13PM -0700, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2024-10-17 15:00:03)
> > > > On Thu, Oct 17, 2024 at 11:10:20AM -0700, Stephen Boyd wrote:
> > > > > Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
> > > > > > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > > > > > 
> > > > > > Add support for SREG branch ops. This is for the clocks which require
> > > > > 
> > > > > What is SREG? Can you spell it out?
> > > > 
> > > > Unfortunately, no idea. This is the only register name I know.
> > > > 
> > > 
> > > Can someone inside qcom tell us?
> > 
> > Taniya, could you possibly help us? This is for gcc_video_axi0_sreg /
> > gcc_video_axi1_sreg / gcc_iris_ss_hf_axi1_sreg /
> > gcc_iris_ss_spd_axi1_sreg clocks on the SAR2130P platform.
> > 
> 
> SREG(Shift Register) are the register interface for clock branches which can
> control memories connected to them.
> 
> In principle these SREGs are not required to be controlled via SW interface,
> but on SAR2130P, we had to control them to flush out the pipeline for users
> of Video.
> 
> We are looking into the feasibility of extending the current
> 'clk_branch2_mem_ops' and can share the patch.
> 
> You could also drop these clock interfaces for now to move ahead, as I do
> not see VideoCC support and bring them as part of those Clock controller
> support.

SGTM, thank you for your comment!

> 
> > > 
> > > > 
> > > > > 
> > > > > >          u8      halt_check;
> > > > > 
> > > > > Instead of adding these new members can you wrap the struct in another
> > > > > struct? There are usually a lot of branches in the system and this
> > > > > bloats those structures when the members are never used.
> > > > > 
> > > > >        struct clk_sreg_branch {
> > > > >                u32 sreg_enable_reg;
> > > > >                u32 sreg_core_ack_bit;
> > > > >                u32 sreg_periph_ack_bit;
> > > > >                struct clk_branch branch;
> > > > >        };
> > > > > 
> > > > > But I'm not even sure that is needed vs. just putting a clk_regmap
> > > > > inside because the clk_ops don't seem to use any of these other members?
> > > > 
> > > > Yes, nice idea. Is it ok to keep the _branch suffix or we'd better
> > > > rename it dropping the _branch (and move to another source file while we
> > > > are at it)?
> > > > 
> > > 
> > > I don't really care. Inside qcom they called things branches in the
> > > hardware and that name was carried into the code. If sreg is a branch
> > > then that would make sense. From the 'core_ack' and 'periph_ack' it
> > > actually looks like some sort of power switch masquerading as a clk.
> > 
> > Ack.
> > 
> > 
> 
> -- 
> Thanks & Regards,
> Taniya Das.

-- 
With best wishes
Dmitry
