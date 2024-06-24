Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1C91386D7
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 11:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719228153; cv=none; b=NlEeSf09tL2i2vp5j64STMLW7wan/l/JnpEYAcvRb1w8nqgYt2z3hWuRxJtP8nDrMtNsGqwf/4mXiOxAgfRaONXYpoKT/Rvb0ff/i/jrpO2uNwucBUWpIA2MLskRp1Yo5Ki4uCbCFjlzMG7vuNQ6axZ+dX4lfBzbQWihpdJw1EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719228153; c=relaxed/simple;
	bh=tj/iTCzjdXvi/zfbFIrmimPnpDiaDxpS/wGQiHsbX3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h6ZrxhPTHj1D24l757OxdHzDhGa8aN2vZ3Wzu6HMtFaSQXzlwz9Hdi/Gp6qYVmeLGV2A4z1zA9L29+d5lVedMbWELdaDmEWSdnISiRcoZwgqujblzU0SuzSSVVPIM1lf/5jNwlKY8Eg5RGTE1VgwNo2QHXo17AxFZkXDST51Bxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QuCakSZD; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QuCakSZD"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so51894861fa.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719228150; x=1719832950; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gWZ/zkTzOz+4RUMc7GXfG9YQuN8dDai+AXES1QteZ/E=;
        b=QuCakSZD1Nb6EUBu88msViSAVa7Kf/lGdqZ/5e+eTARfPfvkmVvFs3dXTolZMDLy2v
         ftZiFe3HM8n4HOPK/R2kLuP7ulqJW8BFxZ7lf8OXAy1R2nikjUjqnp4EQGng3QoxAXBL
         qv7IutSeLituCvkwX3WmKRgPS/0pfZI03I7ViumYAdoz4ENrihHdxKJXUu8np7ObDTKA
         RMYEg0i+T769qcHseKVU1LHcqw0uxYw7krTeRjBF2eNXKV/Swp7Lj1sjUmdnmseqT/mc
         M2WwiuJFZjC3OLUEY9VCNkmNbBs2b+Z8sx7WM83UbDcX4+hiEdccGsZbfMDriU2t7oJP
         cZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719228150; x=1719832950;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWZ/zkTzOz+4RUMc7GXfG9YQuN8dDai+AXES1QteZ/E=;
        b=AZYcn6hofqkACub2AaiEbM5hSLlro9yacoyXAFfFCG5J+nEvDeMQDoRedkaKHESih1
         tB5HTWB9grjl/mDhjJkoVWuM7KdsHN9lxfLdT96CGnxKlJbeFhei32gI2H7rlWtyuyCw
         6xMA+C8/qkG7OFjC+Mi1K9cOZaua+ZzN8u8n0xA8mldzZaY1NS2ycrSZOcHLtzQD7owW
         XuQJcwI2mnaRAZuSSDY1PAI5GV5CY2892y0BDf0G4K6tDfKD2jt+94kqEzFlj1BikMr2
         bhe/Jmp0n1QKlo94/9uPsYHEwoFPcReE59eSU6bWXUok7xWLGg7SZzkCLYV4uL4jI1y0
         cPTw==
X-Forwarded-Encrypted: i=1; AJvYcCXtcOpqed57ELiPPzOrj9fYZqDllA0PeOM4aCOjbF4X8UQYhQ+X1PqrBo1qAvyZsVK/cDUMmkqqMVibtCVsd8xoTwb+wPG4VxCN
X-Gm-Message-State: AOJu0Yz1kldgzZ2G9F/zZFjh16ywt3YrdMonoyDeIY0HiPzLFrqkoweS
	ETQHvTmq6gb/3rMjvqvc4RIROMA4b2bEyTOVShXwI5NhOuCweE1Apdfv4QSkKbc=
X-Google-Smtp-Source: AGHT+IEdzIJ3YjVg/cE36iG6t1bmSvgUzscBQ4gPJYkUm80mgCexRGGdLZEulw/LZtp3Pn6VrM7qhw==
X-Received: by 2002:a2e:97d6:0:b0:2ec:5172:dbbc with SMTP id 38308e7fff4ca-2ec5b2844damr27182781fa.5.1719228150408;
        Mon, 24 Jun 2024 04:22:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ec520fc3b9sm7800581fa.114.2024.06.24.04.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 04:22:30 -0700 (PDT)
Date: Mon, 24 Jun 2024 14:22:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add soundwire controller
 resets
Message-ID: <mzcofsmnqkxgxarcbxh2gqtdusyzpxr4edjcpurerurzape7da@4dky45iy5iph>
References: <20240624-x1e-swr-reset-v1-0-da326d0733d4@linaro.org>
 <p6ooqgfwld7stzevozs7huztputc7vpc7652wx6rvg4cly5mj5@fwrzeu6alhgq>
 <ea57a3a1-1037-4d59-a384-50c98e1f9387@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea57a3a1-1037-4d59-a384-50c98e1f9387@linaro.org>

On Mon, Jun 24, 2024 at 12:11:08PM GMT, Srinivas Kandagatla wrote:
> 
> 
> On 24/06/2024 12:08, Dmitry Baryshkov wrote:
> > On Mon, Jun 24, 2024 at 11:55:29AM GMT, Srinivas Kandagatla wrote:
> > > Soundwire resets are missing in the existing dts, add resets for all the 4
> > > instances of Soundwire controllers (WSA, WSA2, RX, TX).
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > 
> > Could you please point out the driver changes?
> If you mean, soundwire controller driver, it already has the reset support.

No, I was looking for audiocc drivers.

-- 
With best wishes
Dmitry
