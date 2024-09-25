Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B00A158DC4
	for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 08:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727251527; cv=none; b=XVt4S5EsQiMBAlwqzI5EYw/FNC8Xbgq55dxB2GvD8eXJfsfvKPPBtn7lrdOOyVFpeM+FmlNewCW2qkjXeY6NUIjv5RKJnKfC7GNEfYXXRM+h1V0Irp+LTkKNcAUt2iU+jjvuAvQCoGi7LLetdBmKTg5kEwo9N95azLkt53qs/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727251527; c=relaxed/simple;
	bh=Ge+7LszBaOT5Dm6+t5UCLcHOk904zSSAP9mOUFtAaLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKagvFrCvFhh8DrQnCQsUkcbwTHV0fNLivmNBRi3NjsKuvOUDlP0J5X1EPa4NWZTxeIJihGtw1Iz4xP+ZM7cWYRX9LC3nFUR7Lif8mxaIJhSVLAs8zs6DZWAyLfdFclposyO97d3e4K8XDdTT7QI7fVvfFJBX1KN6SmO9rDabRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yc9/tr21; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yc9/tr21"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-37cc5fb1e45so187665f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 25 Sep 2024 01:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727251524; x=1727856324; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fmE1UeERqrchW40NVacg6nrSR6Vcco0wZ6da4wq9+7A=;
        b=yc9/tr21EW3GzcNSMPS2Z+skDSEURgLHh543NbLFnQy/R3ccxmO4zmG48598TV3/8R
         MbQl/HfzMXpMd6YqAXIGT8giyg3w1d7+bczZL0jJwnnLZOEsbTHZanyFKjvG+HvJjr64
         GHbcJCSrI4S2wu9ru5NELW5sFvLnGcChKkjvpbCaAB2wuejaC4uXagXB/ofxLTvRF9oo
         D+Pkch73c++xHNqwtxx+x640Kj+CBdDIfiGICpZ3fCy3VZaQ2Hx5s9eMK5yowW1Xwbo3
         m7LpIbi/d2xfX0z6cgq1Do6TlnTsSyOPXXRR5nngfz2yc96Q9o3nDi1AT5SiQZvv5F/G
         F+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727251524; x=1727856324;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmE1UeERqrchW40NVacg6nrSR6Vcco0wZ6da4wq9+7A=;
        b=p18t+2DBP7TBY2pwirdQsVlBpWJBt9aXhG5fGzNFrKepATpv0F3GeF35VMnJlCj1uX
         Nybrmw5dMhkTBfuoUn/hCfVV7GfKGKfH2p8MnPbl+xAc3W2PMEbUu1vy4MOEH3LXUlHJ
         0IRF+7aWB+AHvStCvo0rjSkg1a/ifMXKoa24HejYmyOC2D3ODs5b0j56CcyFJtxDKF7k
         vgj8XlP/RmSF9quF5BeMIBVjuyyEZ936NLpJbT6FDqhuWx5ups6R3n2+ew6hscW0nuBf
         tcnrVEsxHioFPLS/F6GRBpxSX5+iPQctSdFQr9g4WexdGc9tn7E5w59dujIKY7bg0VzF
         +4oQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU8fsC5W3F9gG2uNPcw8oHj80kfwchDIGoMyjHkV3nYlpKaSprcH3RuutQkDubrIEkDPdA9x5kbh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycKefIprh+x5EUFzROEAbV9BW4b1qKIoHN1Zq8nZkHmqKwTnSe
	aEqtXXUFpOJHtII8ocyht39O9IsICYtJct4ckuVoVqNKaXSZtdtsMnsoCiJnVw==
X-Google-Smtp-Source: AGHT+IGu+EQFdqJdQRNdKI2O1nnUzgvF8rHWsav7UIwu3lMA5nKO4ePunuX3F80nTqxwvNWJ8lBRwg==
X-Received: by 2002:adf:e7cf:0:b0:374:c64d:5379 with SMTP id ffacd0b85a97d-37cc247945emr1246796f8f.27.1727251523891;
        Wed, 25 Sep 2024 01:05:23 -0700 (PDT)
Received: from thinkpad ([80.66.138.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e90cd8c5asm40971185e9.1.2024.09.25.01.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 01:05:23 -0700 (PDT)
Date: Wed, 25 Sep 2024 10:05:22 +0200
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <quic_qianyu@quicinc.com>, vkoul@kernel.org, kishon@kernel.org,
	robh@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	abel.vesa@linaro.org, quic_msarkar@quicinc.com,
	quic_devipriy@quicinc.com, dmitry.baryshkov@linaro.org,
	kw@linux.com, lpieralisi@kernel.org, neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 6/6] arm64: dts: qcom: x1e80100: Add support for PCIe3
 on x1e80100
Message-ID: <20240925080522.qwjeyrpjtz64pccx@thinkpad>
References: <20240924101444.3933828-1-quic_qianyu@quicinc.com>
 <20240924101444.3933828-7-quic_qianyu@quicinc.com>
 <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9a692c98-eb0a-4d86-b642-ea655981ff53@kernel.org>

On Tue, Sep 24, 2024 at 04:26:34PM +0200, Konrad Dybcio wrote:
> On 24.09.2024 12:14 PM, Qiang Yu wrote:
> > Describe PCIe3 controller and PHY. Also add required system resources like
> > regulators, clocks, interrupts and registers configuration for PCIe3.
> > 
> > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> 
> Qiang, Mani
> 
> I have a RTS5261 mmc chip on PCIe3 on the Surface Laptop.

Is it based on x1e80100?

> Adding the global irq breaks sdcard detection (the chip still comes
> up fine) somehow. Removing the irq makes it work again :|
> 
> I've confirmed that the irq number is correct
> 

Yeah, I did see some issues with MSI on SM8250 (RB5) when global interrupts are
enabled and I'm working with the hw folks to understand what is going on. But
I didn't see the same issues on newer platforms (sa8775p etc...).

Can you please confirm if the issue is due to MSI not being received from the
device? Checking the /proc/interrutps is enough.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
