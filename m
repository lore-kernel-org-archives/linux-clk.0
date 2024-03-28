Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C727EEFD
	for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 11:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711625790; cv=none; b=SN8KglIvg/sNXIAoEd0Gfd53GrKH2plqssVnYZG+UQ9zWNaHLlLCpLsj2prWdDg84HW+pOykbuiEqyiDN1xty6rRv5JwJMW5LdXoJiw89VIg1+/hRIupUjHoLrFg9Ul/Q8+GV4yLfeMcHFr+7hOu55BqBLytICK4g4MCV72C16s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711625790; c=relaxed/simple;
	bh=ilFiE9F2pbJK4CUMlqxrCeQ1cVjq7bZKPhWVwfSrj9I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rp61hXtt1Jwzog/YQROOPolNUoojuoHNrq1PCVp7fUO66WhlHQb51PFb2WZpbUpKaiMkB02hRWu482GVpk+Fd61EzZCYWcb0yAz4ADBYvdyVT4TcERwo/fT2LKbnBiHWT5E9tkCrkmmQXChvF002IhpEEPO6bgZ68qkCPmWiHrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tdAUr0hF; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tdAUr0hF"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-6962950c6bfso6423266d6.2
        for <linux-clk@vger.kernel.org>; Thu, 28 Mar 2024 04:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711625786; x=1712230586; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/prkjkwBayqxMQUYRG7IzJfpOCSd/2k5XXEN/lDQzgY=;
        b=tdAUr0hFkCKJHDI8qlWl6HmDvuVsRGRbk+cOnoNM0xtRJVUo8vnVMWnTq1YHS/Qnek
         0SKBtiPBIvk2jnoDiRajZAp/6IUnu9CLE613IGXZuuPOaYpdHRWnNlH2umhL+w4zUYeR
         npz7YouK6t2Us/FuWqUH4JeTDyyTPyyu9fxi4sOLpm4sZDsOAz33u8R9lFarj/qnwsg9
         yZh5EBQogMSxmQZt2kogAd40HzvtCo+ePt4wTd4CZqqh5FRx2VdqWv9gF3MPRzwuo8Up
         yVKUuDx+hgsuPaEr8FHyw76hUqhGOMgGsBITP+yTOJGJx+tZkb0IH+mAQGz5andLHwuG
         +YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711625786; x=1712230586;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/prkjkwBayqxMQUYRG7IzJfpOCSd/2k5XXEN/lDQzgY=;
        b=D7ZIOwv+/MCRA1ckIwCLDmGYBz0ffp2aSQVIwVrJ2qLZVXMXUFSOnLgdUM+rJXdKOt
         Qx9AExa1i28NM/MxqBun4+w73RV4uIRAliWnkWnKwzjqp6KG3yGBRWpmDgPbsrXhKfV3
         w/RCU/4wBQdbl/HxUhLF1hJTHuk3VmaEgn/I+wTvRAczvosNGOO97QAYDw1teA+FXhr/
         7ixMdGw4AnHeOK3dyJ0/TVg3VBQxxncHjEAjmPRecyJg/W9zfj9yg89lL08I82OHT7qT
         PrvpEa2NLOOgrsTuG3x11/CS6IHEOkdsc7BHYxqrg0OgIwhL3TEFTyzoHrj2QFpKGkQo
         2c+w==
X-Forwarded-Encrypted: i=1; AJvYcCXq0QlXIoIvS6APHEzL3QuXcBdQfws15FsvJr5Yo9uzpXr5JTLJzeCxTLzWQojFpmsnyAAzQ4I51mSAKYjkCwKEFeOTYIS6od8r
X-Gm-Message-State: AOJu0YxGZByR0AhhyAT/YtLp1Mo4+yRwJ4R2/vFWCjpyRGWw6/HMwovN
	u4LCT3S+c0HF5BYqna2uDlxg9xrLZoA4hcWvd1z1A9sRA1+mC78ig5wa4WLavnsc6vgOH5fFo4t
	s688zjiaWL4WTdGDm+eql6mKNIFFMKu4KtKobyg==
X-Google-Smtp-Source: AGHT+IECGMP91OnvJpnEQBoQ4ZvbqvFkvhcH6wJdMgASlS9vR/dFRa/h/ehJAtH5CkKObHpqEYR5kJ/+W/XF3z8Eh9c=
X-Received: by 2002:a05:6214:14a3:b0:696:3704:712c with SMTP id
 bo3-20020a05621414a300b006963704712cmr1853382qvb.63.1711625786555; Thu, 28
 Mar 2024 04:36:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326172813.801470-1-tudor.ambarus@linaro.org> <20240326172813.801470-4-tudor.ambarus@linaro.org>
In-Reply-To: <20240326172813.801470-4-tudor.ambarus@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 28 Mar 2024 11:36:15 +0000
Message-ID: <CADrjBPpjK15MDTcSdOhiC6FnJcofDGArEvrkhdz+CHoFzpFheA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] clk: samsung: gs101: propagate PERIC0 USI SPI
 clock rate
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
	cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
	semen.protsenko@linaro.org, linux-clk@vger.kernel.org, 
	jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Tudor,

On Tue, 26 Mar 2024 at 17:28, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
> When SPI transfer is being prepared, the spi-s3c64xx driver will call
> clk_set_rate() to change the rate of SPI source clock (IPCLK). But IPCLK
> is a gate (leaf) clock, so it must propagate the rate change up the
> clock tree, so that corresponding MUX/DIV clocks can actually change
> their values. Add CLK_SET_RATE_PARENT flag to corresponding clocks for
> all USI instances in GS101 PERIC0: USI{1-8, 14}. This change involves the
> following clocks:
>
> PERIC0 USI*:
>
>     Clock                              Div range    MUX Selection
>     -------------------------------------------------------------------
>     gout_peric0_peric0_top0_ipclk_*    -            -
>     dout_peric0_usi*_usi               /1..16       -
>     mout_peric0_usi*_usi_user          -            {24.5 MHz, 400 MHz}
>
> With input clock of 400 MHz this scheme provides the following IPCLK
> rate range, for each USI block:
>
>     PERIC0 USI*:       1.5 MHz ... 400 MHz
>
> Accounting for internal /4 divider in SPI blocks, and because the max
> SPI frequency is limited at 50 MHz, it gives us next SPI SCK rates:
>
>     PERIC0 USI_SPI*:   384 KHz ... 49.9 MHz
>
> Which shall be fine for the applications of the SPI bus.
>
> Note that with this we allow the reparenting of the MUX_USIx clocks to
> OSCCLK. Each instance of the USI IP has its own MUX_USI clock, thus the
> reparenting of a MUX_USI clock corresponds to a single instance of the
> USI IP. The datasheet mentions OSCCLK just in the low-power mode
> context, but the downstream driver reparents too the MUX_USI clocks to
> OSCCLK. Follow the downstream driver and do the same.
>
> Fixes: 893f133a040b ("clk: samsung: gs101: add support for cmu_peric0")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

regards,

Peter
