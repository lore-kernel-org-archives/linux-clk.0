Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BBC18EFCD
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 09:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729245415; cv=none; b=a7IHKUjraBrkYOwS/IbvORUV4dS3pW69UKwH+zHIPlR201aY76fiYcr0rJD4XJPdVHz7VpMR5eoNaV+UNEG72CgadfoBuDczlfHP18vegR91qhmFibdZ7PieohheQmvcXYd1+C3UCCeINRYZxriaQcIGjhnVa436lD2jwNCOEB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729245415; c=relaxed/simple;
	bh=7F02LSuaYG6QJFBmCRDKkgg4PK0fEcpJQMSscDg7UlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ft9gZ/zYkqPfWvqv88dzzIgJDwjgCamVngaaGTvoofJ3ynbog7Oa7vmVKQ19dq0RNreom7uk81koV7w9/yJQY7o2rE9dxAbwzD6q93NXSmWQDT/Y+RYCDxhowuJaN9yRZ8VTtc9bNtlo2fiVH040x7r/qXHVsLq4Trcv83jtA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BIM3AfgM; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BIM3AfgM"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb587d0436so20201351fa.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 02:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729245412; x=1729850212; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7LNTOM/u0GLXGMOI0m9ADZhvsMR3Q86VPixhtk5oFIY=;
        b=BIM3AfgMvpJS9rTaYmiGjRV26sQbxtxXSenjIjGpWs9EsiCbI64jdLUP3cuNkjK+Ag
         6kuEi3GZg8X87YyOGjBwJkUSP4ISP4nye58NfH8GU0Kmg9T1BsRJqG87qwg5Rx8EP9c2
         qkLOQvVdopL+v4k7lvXnuu3D+AdZN8YpHv818PYI+yqw5r/UUe+bSmNldKvqFOiPkUS7
         7yEKf8MLDn+yG6mp9bQmpH9e8waoXstOUK6EnAT18eUAiFxpqORiEuRq4zYgTDSu952B
         DW2AWmlJLL5pCzeUiaxgncBGZ9iQH6sQ1kbVZcK1AcnpzuMjXCoiHV3Wv7ZUL/tMKCX3
         oEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729245412; x=1729850212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LNTOM/u0GLXGMOI0m9ADZhvsMR3Q86VPixhtk5oFIY=;
        b=JtHdFJp8U65MJYGf8PC0ookUDvg1u2g9nYoOiV8FTYpmi1LwnUcA1jFFm1cqWcD8b3
         vjqpJiHstFvFXATh0xw3L5+G7UHuvcdLNqp33zzEcDFSmdCdPgjVHPb0jdZAPpyZKlbo
         xhT5INiKtgmHtW9XL43h7i27lwbqqSGmXwOvJt9bMam+pDpDwTjqo6q83vRmIeyTmLpI
         Uyir7/7//oAWB9YpI5nFlgDEpW4gmnMSxchq2JuiJ4V60obNED5mZo8oYDz+E6IQe2XX
         fu7OD0uBfRVTwwfmsQ29yEUvcmiIP0wxn88QMoMSQYUz5svrl3R7qQJuCDmsWmQliRVH
         aXQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzvGL7D32wJum+Q7tWtnayi72BgfhUy+ZDeqYo+xwmLeChvkqKlTzZHmic3jffVCnTWkNDvcoDUiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySDk8Ocz6xttXGZf7sbWrxutMnqtiyfnkcC5Gw4LAcsHM3JxdD
	lKyE0two7eSf2FqpGdfTMXYfjoEtnkZVrpZXDzueMEr2IoV2iL0csNWLl/B43CM=
X-Google-Smtp-Source: AGHT+IGeK8KzMr9lXPmuFDOy4a4IgVl3STdpDnUlPNvFi3vc36Dx0SsuLqG1dmfqX8sdyi9pbmxBAg==
X-Received: by 2002:a05:651c:211d:b0:2fa:cc12:67de with SMTP id 38308e7fff4ca-2fb83208e04mr9201491fa.32.1729245411950;
        Fri, 18 Oct 2024 02:56:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809a6a7dsm1776881fa.10.2024.10.18.02.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:56:50 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:56:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalpak Kawadkar <quic_kkawadka@quicinc.com>
Subject: Re: [PATCH 07/14] clk: qcom: clk-branch: Add support for SREG branch
 ops
Message-ID: <scwpcovoazmd4yrwtczghx4e5eopqoknknqzcr23wjve65bmxh@ih5efkh53g3h>
References: <20241017-sar2130p-clocks-v1-0-f75e740f0a8d@linaro.org>
 <20241017-sar2130p-clocks-v1-7-f75e740f0a8d@linaro.org>
 <be8639d0add779bcac0314d3c433d01b.sboyd@kernel.org>
 <we4stuv7td5jmvicsvsjowqg76merg5lmlgqj6dvqvqecsw7xk@bfz2kdjnt6kb>
 <5904599efffa7ce747772c0dcc1c897b.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5904599efffa7ce747772c0dcc1c897b.sboyd@kernel.org>

On Thu, Oct 17, 2024 at 03:28:13PM -0700, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2024-10-17 15:00:03)
> > On Thu, Oct 17, 2024 at 11:10:20AM -0700, Stephen Boyd wrote:
> > > Quoting Dmitry Baryshkov (2024-10-17 09:56:57)
> > > > From: Kalpak Kawadkar <quic_kkawadka@quicinc.com>
> > > > 
> > > > Add support for SREG branch ops. This is for the clocks which require
> > > 
> > > What is SREG? Can you spell it out?
> > 
> > Unfortunately, no idea. This is the only register name I know.
> > 
> 
> Can someone inside qcom tell us?

Taniya, could you possibly help us? This is for gcc_video_axi0_sreg /
gcc_video_axi1_sreg / gcc_iris_ss_hf_axi1_sreg /
gcc_iris_ss_spd_axi1_sreg clocks on the SAR2130P platform.

> 
> > 
> > > 
> > > >         u8      halt_check;
> > > 
> > > Instead of adding these new members can you wrap the struct in another
> > > struct? There are usually a lot of branches in the system and this
> > > bloats those structures when the members are never used.
> > > 
> > >       struct clk_sreg_branch {
> > >               u32 sreg_enable_reg;
> > >               u32 sreg_core_ack_bit;
> > >               u32 sreg_periph_ack_bit;
> > >               struct clk_branch branch;
> > >       };
> > > 
> > > But I'm not even sure that is needed vs. just putting a clk_regmap
> > > inside because the clk_ops don't seem to use any of these other members?
> > 
> > Yes, nice idea. Is it ok to keep the _branch suffix or we'd better
> > rename it dropping the _branch (and move to another source file while we
> > are at it)?
> > 
> 
> I don't really care. Inside qcom they called things branches in the
> hardware and that name was carried into the code. If sreg is a branch
> then that would make sense. From the 'core_ack' and 'periph_ack' it
> actually looks like some sort of power switch masquerading as a clk.

Ack.


-- 
With best wishes
Dmitry
