Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3962219AA46
	for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721137488; cv=none; b=A+uvjjUuZZIOcqrw7o0xuopQnw5BwO1e5abkZN8ptm16ZfxKrqCITCqJQpyId/SRXGly9GR4QxJZUdsLJsv4IHqx8UljbBCWyv0Y8nXBWRR5XfnHY8czuDQpHJnhg2J9O/3UzfFrZjafgRXkKOkWAz7/a+1g5YJWVNRIQW8+C/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721137488; c=relaxed/simple;
	bh=qF2z35+sMltHxOc1VgxTfEf8aDED8ki06NXvVuf7QCE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JY75/qQPez/S8rwQPIoO18v24EhL30ffI5qKV1h30q0XxluvD99xjiv4EzH4WObw1QJ8tgHCL5X9iSNmzZ8wPCElz8sOfBqO23I6DLLhwnq/l2F9AZ4UJ+VzbO6yJcZXdFYtcQNHh1NJwfFGooBZrLQnudV094coN8LeiyfG2Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PeNXiryn; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PeNXiryn"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05a61303b7so2898788276.0
        for <linux-clk@vger.kernel.org>; Tue, 16 Jul 2024 06:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721137486; x=1721742286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMSSp6veBmjTrsSFSHpHaaBnQdaSZwPgrQ/EgS/wyFs=;
        b=PeNXiryn8BdqicRO8oh2b9XMIACUhk9asPxHm7+2NqB1FlmdS2iYbpMAAieFMaLDSD
         XE3XQE8uh5NjhYI04P+A0YODI1BkU3jepL0eHz71VGwDCPjYtUfx3veCZktS//XXkziT
         u4sK9Fnj4PpjDFdYiaMSwdqV29OD660WSOJsZpF6MIA7H/pz9WSHBDWgtAX88qCqoTe5
         bMCor/54WsCDESeEGDUuxrSU7B6M1GZ0BPu84un9Mz4bZjijCK6NJO/+Hss3dWmgcelN
         uL7VH4cKwNRpcToV9aRXp5j1xD+RHV35Gb4in6eUs+CEiBRk61O32lc2aWMwh1BtPJNg
         1L2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721137486; x=1721742286;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMSSp6veBmjTrsSFSHpHaaBnQdaSZwPgrQ/EgS/wyFs=;
        b=XsUH5vpiwHMXf7wPXvqCQ8HpeTWJcIllDcQOMofdg+FvCgAi8qkKTUttAoZL6Kq35N
         WjFpiailboB6a3s6D6VvnIqfls956hHZvofp70G9QXzO6R0PrrZa3mZyCZ7e1lUKN7C7
         BXWta3PaiC89AkKE6wKCQzUQCWi447+f9xll/gKd5HJLrvrvlOHemSxZjscqkL8vC/NK
         /qGUtkgvMdPo+PCz0UIhQ49e9583IT+Dek/DWQQgEbmMLd6Ggc3axogUMMCZPHICsreJ
         7T2tCx8gA8vwu6TB1EgqsHlaMtuQXEYHhICg6YZDwHJtC0b3EElzvHfAC1ac6RzlfHXn
         yDMA==
X-Forwarded-Encrypted: i=1; AJvYcCWMu0AEbtDonX3pAEIklA0REK0cW5XmyiWFM3T8iXtdPTa+uyXZ0cEr1mpSrxwQyYhLy+5LgE2SMVF3xG+hjXRtehcOMltAMawm
X-Gm-Message-State: AOJu0Yy53ntCVhbHzoaUsoEWHqpI1/XvtEU9RrgrV7eGzkRQr/RShCvE
	Gkt+z7N9EYI7d9+xJulok+s+cIjyMmJJTLV7DpdNyDfLpTDOohgmJmUeJ2mwUjNKNT/EC5LsZUW
	fl9RuQ9vOrj5kvcu1PcaRcoxDVtSsfchOfHjwJNbXBDx8d3Qw
X-Google-Smtp-Source: AGHT+IG/rzM+ieKCxdAt0e72AO2CIHO0AW2zvcYWqKkpa7h2Gpwy3XK13dCbfyR1XJ2KNkhxFbb/u/RN2U+IHqQ03c0=
X-Received: by 2002:a05:6902:c01:b0:dc2:5553:ca12 with SMTP id
 3f1490d57ef6-e05d56cd8bdmr3129594276.14.1721137486142; Tue, 16 Jul 2024
 06:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg> <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
In-Reply-To: <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 16 Jul 2024 16:44:34 +0300
Message-ID: <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> > On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> >> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> >> and byte1_div_clk_src, the clock rate should propagate to
> >> the corresponding _clk_src.
> >>
> >> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >> ---
> >>   drivers/clk/qcom/dispcc-sm8650.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >
> > This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> > rate should not be propagated. Other platforms don't set this flag.
> >
>
> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.

Yes, the driver sets byte_clk with the proper rate, then it sets
byte_intf_clk, which results in a proper divisor.
If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
byte_intf_clk rate will also result in a rate change for the byte_clk
rate.

Note, all other platforms don't set that flag for this reason (I think
I had to remove it during sm8450 development for this reason).

-- 
With best wishes
Dmitry
