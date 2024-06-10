Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E77273611B
	for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 18:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718043583; cv=none; b=o8rBJWqWat0FGWm+jBBlson69Lz7zIMd59A+MASXPhaq3AEpbQr1tfWUwhkYo72PHNO67gjGGqYmLorhxXLfUljGuQxeyaVqj3woWI4bKkAzPfJg0A1H7OKRXGKMR+jttX4ipYTwfTfzcaBZS7XTeiKqwRXBchMWixw0bE+9jlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718043583; c=relaxed/simple;
	bh=47BCQF8Rh+QGgFZLQo6+hqRSv3uSm3xpwFzwGTdHyHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqWpNI/6RCMnCoXGB8F1EKpP0TQzeYOwggI2dY2i1wdk8nNgXALDrO6q8VXwXuFpMXuDZUUxOthxckdO0ykZpjjLSVJ9lFKCswRoShsKUTfm7S5P4uOZ4L5rfS6F5Qdf3VnsyBHbOEbGt4AGpSuErIq/f1DGMvM7ny2y3L4tArI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BJNWFhCB; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BJNWFhCB"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52c8342af5eso1806069e87.3
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2024 11:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718043580; x=1718648380; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=21LE+HbTdC+wLsWIIw1FKWiQ20yLnLoT2yGU1mgzcko=;
        b=BJNWFhCBFRAvxIpOv3VRsX8GDS23Qk1ZpfCcwvPImSLygxZd4YeHNPYryWYXukaOEj
         DCr9qhQ38Jp+bduEyLC8GmC3nGToujYX+h7SVBxmLQEOM0Q6X+8HK4QSB4oXSG3BRh6a
         S3sBqjeYHFCNKX/T7Xug1wiFhOrh9hjNCODrwDtauxEaWfhIoes23eXcEO9LEVgDhZ71
         Pmyg+0/yU8DFpQ06I8JOvjC9W3K4Fm6ynlps9UsIw23tuCIjTF9RTG9Uk0SSTW3zuSp2
         gU241sJg5BDBy/z60EBuADYFfwtqicuKnemz5qPUCG3fOyvZaKidtxHD7Mhh86wY+CZy
         5zkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718043580; x=1718648380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21LE+HbTdC+wLsWIIw1FKWiQ20yLnLoT2yGU1mgzcko=;
        b=MRIYMgojbmceQ4mcBHjWwpylwRuOW7YlgwDXQMwuIBUS1QAbjD34Ruw+1s6oFbiLbg
         uuSd1BUwrjVSb0ufZbIDjen0sieFWPvjX451uYoxpV4S9Xgg8QpVbvzhmMpj/CVcAo9y
         RAMvTUh9AihmZXOXwdj+B596p6KoDA7gzU3gwSF0B+uQN3L07cQgqkMrJb068Y5jv7pl
         ZQc9xpOrZZBBiIGJZHyeYToJdz+3wcMRnlwnLG4i5ndLYClEEhtcU9NY3Yp5jrOPRL73
         XRelt3Npr0gTNNNLl1K+h+OygXE/O9wpscKC4sYtA/3igGeQ8ZsEFS9ReFIE2GLb0nd3
         eoAw==
X-Forwarded-Encrypted: i=1; AJvYcCXFRIEE/j4PBI4vwCXiqZEAY+m2/BQyt8QcEG8JCQwMWcj8GRW7oT6lZDd7MW4BhuCADQdSzHO3NH1VGA/SVJBPvQheFll1aOG8
X-Gm-Message-State: AOJu0YwUHvcr/G5+aQvcT8aVsFz86ZijRWn80/R52eKv6GxEUZDYLmXE
	wpJ83siC07S9pt1EL5ahfWfqoDlZP6rfHWsSk4qUrPn2xTPvQQ4l8jpCCheBm/o=
X-Google-Smtp-Source: AGHT+IEe5zLTeXfSDypsVj9LEt2etqwojlWcPSamBIXz+Vf+eBN7/kP7SDke+LFUyzxpMMPpNRUQ9Q==
X-Received: by 2002:a19:ca5e:0:b0:52c:322f:a8f9 with SMTP id 2adb3069b0e04-52c323eeca9mr3933999e87.27.1718043580007;
        Mon, 10 Jun 2024 11:19:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52c7f2f8f41sm1185412e87.148.2024.06.10.11.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jun 2024 11:19:39 -0700 (PDT)
Date: Mon, 10 Jun 2024 21:19:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, quic_jkona@quicinc.com, 
	quic_imrashai@quicinc.com, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: lpassaudiocc-sc7280: Add support for
 LPASS resets for QCM6490
Message-ID: <iqmmhqg7huczocozodymwshc4kvt7qrxmok6iyrq32eyg3fmgx@yqrojfiha6ir>
References: <20240531102252.26061-1-quic_tdas@quicinc.com>
 <20240531102252.26061-3-quic_tdas@quicinc.com>
 <6aad6a71-dd2f-4682-91ea-835357342ba1@linaro.org>
 <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2800ce74-44ea-444b-b00f-e07bbfdd4415@quicinc.com>

On Mon, Jun 10, 2024 at 03:49:18PM +0530, Taniya Das wrote:
> 
> 
> On 6/7/2024 3:00 PM, Konrad Dybcio wrote:
> > On 31.05.2024 12:22 PM, Taniya Das wrote:
> > > On the QCM6490 boards the LPASS firmware controls the complete clock
> > > controller functionalities. But the LPASS resets are required to be
> > > controlled from the high level OS. The Audio SW driver should be able to
> > > assert/deassert the audio resets as required. Thus in clock driver add
> > > support for the same.
> > > 
> > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > ---
> > 
> > Please stop ignoring my comments without responding.
> > 
> > https://lore.kernel.org/all/c1d07eff-4832-47d9-8598-aa6709b465ff@linaro.org/
> > 
> 
> Sorry about that, it was not intentional. I had posted the v2 and decided to
> split as it was delaying the other changes in the older series which had
> more functional fixes.
> 
> 
> Picking your comments from the old series.

I think it would have been better to respond to the original email
rather than c&psting the question. It drops the context of the
discussion.

> 
> ------------------------
> > +		/* PLL settings */
> > +		regmap_write(regmap, 0x4, 0x3b);
> > +		regmap_write(regmap, 0x8, 0xff05);
> 
> Model these properly and use the abstracted clock (re)configuration
> functions.
> Add the unreachable clocks to `protected-clocks = <>` and make sure that the
> aforementioned configure calls check if the PLL was really registered.
> ---------------------------
> 
> These were made for alignment of code, but existing approach was not
> touched.

So, first patch to fix the old code, second patch to shuffle it around,
please.

> 
> ---------------------
> 
> > +	lpass_audio_cc_sc7280_regmap_config.name = "lpassaudio_cc_reset";
> 
> Ugh.. are these really not contiguous, or were the register ranges
> misrepresented from
> the start?
> 
> > +	lpass_audio_cc_sc7280_regmap_config.max_register = 0xc8;
> 
> Provide the real size of the block in .max_register instead, unconditionally
> -----------------
> 
> This had a little history behind this approach. During the driver
> development the ask was to avoid duplicating same descriptors and update
> runtime what is possible. That is the reason to update it runtime. The max
> register size is 0xC8 for resets functionality usage for High level OS.
> 
> Hope I was able to clarify your queries.


-- 
With best wishes
Dmitry
