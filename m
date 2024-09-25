Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485F31714B0
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 12:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268752; cv=none; b=cP5g5Ojn53H8F/mF9oN/N73/wzRRILkp3h+P06s5nWwh6cxzGxY2FTPb0gxcIVxFoL0HyIEkHGlGfROyezkZnDLYXasnVR9UZMMgKDHfLMOdYcH3RM+AF96r6dN7606qXW3SrTUhm/+v3VDqkw4oZ7oX5Jc0wY2G1m7Xu+D2MHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268752; c=relaxed/simple;
	bh=v8nFyWsksEF8DTF1lg3ZcP05G+mbIViNLRepJVEIEcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWSUYjtUqPY+8W2kjISR52E5WBQ/eFuW5gEwLueJ1SyILNOrawcVFzaWlEIwjeSSualoXKTVf4iJmAXnsDstYYa9IdeThMDy7B4hdMSrvVEw/cD/EZA0H0E+hOMOF6asAaFJ50IitXF0zZrgYyVDVudiw/rKORmyEp3A1iBzsIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQjWamgQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQjWamgQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso65893745e9.1
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727268747; x=1727873547; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PsYnTiQnoLJmTLqLligtuj1TznoQqpggCMnS36XtOaI=;
        b=gQjWamgQeu3mY706fYbRPb4Gs8vSsRR+e3bgL0K/iQzkJPdYswAepkH8PWLUa+ixnq
         zsedIwwnQWGWYOwXHRSrXF+4Hr09O0fSNJ2GCTnWxq7d5TUordl0GkJalTEfCDFYEwrQ
         1QnXG2LijNVLY3x5r+Lsf7Z8MUTyUENcxBAZ0iwDE/nkYLlL3BLl5+iXTYzD8ckJJWH7
         GRyBABHG5O3v6VBswCiSVwgVUX9nn8hW0od394L5vTTLH/y8b7juIG+Utpsa+7ftOd+L
         sqSogyw7Fp8+0lDCLDme/zc07qyj1VAzJF0e7NgI/MFPhAIA2AWgL25k426fXseOFgTz
         UlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727268747; x=1727873547;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PsYnTiQnoLJmTLqLligtuj1TznoQqpggCMnS36XtOaI=;
        b=o4qj3I6AWmkr7xl23cr7jLI4/LQtsOZYE8G0rQ/pBVoDWmucGS8hgtoictFxhCr3Rv
         9QGVy2Z7Fam3v3ezSzGm/FLblzij1zsXm5q2AxCWSDms7sZSjHKAnwQbhrGdpBNlswhv
         Df8m4uEX1IKs/A3p9YKau+xZqLDnLegwsW/HJgnws1476astuagQrU+HB/a43FDvFXh9
         7VvIQ2YLFbHCsBh7nPCUbcagtjgFeyHmZaTSibKm8S+xQ++a2N+da/nu31/t6f6q1/tX
         eZJZ7EBg2Jg/E4WNaR/R3JGqTbLL4u2Su7AQDI16lEqjXQRAo48KJmSgYbk9uAA7xubd
         FYIg==
X-Forwarded-Encrypted: i=1; AJvYcCUaQOgh1PgB9BjDS7vPP73dbnlSmwfL6I9zvbYTUZxzPCIPiww10lKP32PASqe+7KgsmY6tvbjmMs4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwljYrBPK3g76YoHTQMXJkUHJM6d0BCrM1ApwHEYdgl8njj4z7m
	XFqs4SJKzDxPUBLZnIPYjTPBCV+1eS+kfFeyBGyr+B9twB/IxMSVZ1A4RR90hw==
X-Google-Smtp-Source: AGHT+IG4lPaaPhhTrY0nQowUBPj7qZopeTwFGYzQZG1u0Frm/UegncIuXWSeBUCFGZpQxJONnfZ1dw==
X-Received: by 2002:a05:600c:3581:b0:426:602d:a246 with SMTP id 5b1f17b1804b1-42e962456cbmr18604785e9.32.1727268747527;
        Wed, 25 Sep 2024 05:52:27 -0700 (PDT)
Received: from thinkpad ([62.67.186.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e969a8bd5sm18569155e9.0.2024.09.25.05.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 05:52:26 -0700 (PDT)
Date: Wed, 25 Sep 2024 14:52:24 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan+linaro@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>, vkoul@kernel.org,
	kishon@kernel.org, robh@kernel.org, andersson@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com,
	sboyd@kernel.org, abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <20240925125224.53g6rw46qufxsw6m@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-7-quic_qianyu@quicinc.com>
 <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>
 <20240925080522.qwjeyrpjtz64pccx@thinkpad>
 <4ee4d016-9d68-4925-9f49-e73a4e7fa794@kernel.org>
 <2731e17d-c1ad-4fb4-ab60-82ceafeffbaf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2731e17d-c1ad-4fb4-ab60-82ceafeffbaf@kernel.org>

On Wed, Sep 25, 2024 at 11:46:35AM +0200, Konrad Dybcio wrote:
> On 25.09.2024 11:30 AM, Konrad Dybcio wrote:
> > On 25.09.2024 10:05 AM, Manivannan Sadhasivam wrote:
> >> On Tue, Sep 24, 2024 at 04:26:34PM +0200, Konrad Dybcio wrote:
> >>> On 24.09.2024 12:14 PM, Qiang Yu wrote:
> >>>> Describe PCIe3 controller and PHY. Also add required system resources like
> >>>> regulators, clocks, interrupts and registers configuration for PCIe3.
> >>>>
> >>>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>> ---
> >>>
> >>> Qiang, Mani
> >>>
> >>> I have a RTS5261 mmc chip on PCIe3 on the Surface Laptop.
> >>
> >> Is it based on x1e80100?
> > 
> > You would think so :P
> > 
> >>
> >>> Adding the global irq breaks sdcard detection (the chip still comes
> >>> up fine) somehow. Removing the irq makes it work again :|
> >>>
> >>> I've confirmed that the irq number is correct
> >>>
> >>
> >> Yeah, I did see some issues with MSI on SM8250 (RB5) when global interrupts are
> >> enabled and I'm working with the hw folks to understand what is going on. But
> >> I didn't see the same issues on newer platforms (sa8775p etc...).
> >>
> >> Can you please confirm if the issue is due to MSI not being received from the
> >> device? Checking the /proc/interrutps is enough.
> > 
> > There's no msi-map for PCIe3. I recall +Johan talking about some sort of
> > a bug that prevents us from adding it?
> 

Yeah, that's for using GIC-ITS to receive MSIs. But the default one is the
internal MSI controller in DWC.

> Unless you just meant the msi0..=7 interrupts, then yeah, I only get one irq
> event with "global" in place and it seems to never get more
> 

Ok. Then most likely the same issue I saw on SM8250 as well. But I'm confused
why Qiang didn't see the issue. I specifically asked him to add the global
interrupt and test it with the endpoint to check if the issue arises or not.

Qiang, can you please confirm?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
