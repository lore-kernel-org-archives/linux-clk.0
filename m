Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746AD1DFF8
	for <linux-clk@vger.kernel.org>; Mon, 15 Jul 2024 06:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721024483; cv=none; b=MKm21kfH+rvoJkTrpSrYN4eb1eLlnFwryE3k9rPKl1l/JFgv2lYoKo0nveHvKIdFR5ZKyfJ7eiG9GzdZVJz856PisZVdozHwTjMLJZWnRjndfGSl35kNxr/L3Pnr8WADZjHLMpxluoqf5gOqjqtTGDvo16JaWYX0huXNiynzjJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721024483; c=relaxed/simple;
	bh=D6XqNP7Ocjw2YrA4F9ERC7JrymvGT0zCRzd7DfHQb5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNtpdEF3J1FSjUaIUVZ0FGtrrgb695LoYp6DssVWA/09PDH7ODc59ge5AfojmbIqqlAA/bxuPsbmztv+yRYfVQM9XDBaB6h1dbHVgwDj8G89b2Z2jz9WR++wQCcw86srKt2hHeyi+c4kY1kwzXWLm/FsdSqhBh6Qhboj6njeOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xk/Vnsko; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xk/Vnsko"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so4083141e87.0
        for <linux-clk@vger.kernel.org>; Sun, 14 Jul 2024 23:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721024480; x=1721629280; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=10h7AorBoHJscK+IMdAvqhx2IYEBB33opsawba3ThY8=;
        b=xk/VnskoLU+N7UdRakjSZHFNKtad10E5suLJPEKNs8prCCQoJYJ+W0MTa9eaUrO4aO
         C8iBqAOD7QZVoO+Qg41FMkl3f0Oz2IxQBPqOQe+2wOzjV6h9vN0uZ0dAxiWs/yMdDcKH
         jm7nZ+IkMFufAQguEgQzvqnHH0K3t8w5/xJj8q7H7bp9yfNZiLnnzG0JPRVKgyDLQWN8
         abC1HXqBxHNbR88CyExHu/vYsmwGfc3goqNV1VYu+yUIMRQGAq5zR2Jo0MqkmZG0agcJ
         E1p9hCgfgk4xIwaw6dwNpgY/50CB8z59YG2yaDzmfNR2n5DO17cpm+daBP64O5BFr3ct
         HECQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721024480; x=1721629280;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10h7AorBoHJscK+IMdAvqhx2IYEBB33opsawba3ThY8=;
        b=nUqfDI/UJb4Z/IaD+Q0UuOBuBSqwGMUgya5A3QodaHJGqC+tSubKbSBZbUXcNuE9ya
         p/UypLfnIXxWT0C/O1XJBVOeTcfJakXX4l6JjHRihNOeUBSitwdEQFVvHY1kT3+8VTo7
         LqqttfyxVFLmyTOyr+ZqWPU5MKT2QLfM0U+PEC/ep16tngQ63CpbB8J2hDlM2XK21ixo
         Oz0VJDgM2q0lgo/0KxIQy2PT/YBNyRf6BUi1VdXid3yTaUHcaWuNMoxQoynZ06mAp1Uo
         DMh8N3QVl09Ri16G4q6AwiFIkA+vUccd7X7EOn5o8tdnE9cpGiuvPZaA9t7RgPRecqWJ
         sbCg==
X-Forwarded-Encrypted: i=1; AJvYcCXPbkbvcLlSfbWp0nVLDFoLypx2lzd9/ql6QGl5zXiI+WWmk60Y2+EW6MnfUOot3PZ1mUndPqwlHGL8dgwolL9zQSKGshGaij24
X-Gm-Message-State: AOJu0YwC/ll8Uo+8qVh+fidNt3lqxSsfLZEiPHQOkfa9S968oc1TZaWy
	eKhktEOqqIUuJx1sYN6WsiouiE9xRQA7sPy5GzrURcm4o4rq+d/bfz0qoUUP1js=
X-Google-Smtp-Source: AGHT+IGIypb/Qu3E+HlICgtenyNPJ1eoKnIT5Y8g4jzQcW7TIRmsNUzmEcdGrxNLhSAXxoKHuhmA1A==
X-Received: by 2002:a05:6512:3b82:b0:52c:e084:bb1e with SMTP id 2adb3069b0e04-52eb999126bmr12945618e87.13.1721024479558;
        Sun, 14 Jul 2024 23:21:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ed252d7b4sm739852e87.127.2024.07.14.23.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jul 2024 23:21:19 -0700 (PDT)
Date: Mon, 15 Jul 2024 09:21:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Constify struct freq_tbl
Message-ID: <ixuyjg5os4huflsjbizfvde5kytvg6ekccjq72mpkiiiunin6y@pqkhiu6xoznk>
References: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e8aee66fa83a4e65f7e855eb8bdbc91275d6994b.1720962107.git.christophe.jaillet@wanadoo.fr>

On Sun, Jul 14, 2024 at 03:01:58PM GMT, Christophe JAILLET wrote:
> 'struct freq_tbl' are not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>    7595	  43696	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>    9867	  41424	      0	  51291	   c85b	drivers/clk/qcom/mmcc-apq8084.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> 
> I hope that it can be applied with this single patch because all files are
> in drivers/clk/qcom/.
> ---
>  drivers/clk/qcom/gcc-ipq6018.c  |  2 +-
>  drivers/clk/qcom/gcc-ipq806x.c  |  4 +--
>  drivers/clk/qcom/gcc-ipq8074.c  |  4 +--
>  drivers/clk/qcom/gcc-mdm9615.c  |  4 +--
>  drivers/clk/qcom/gcc-msm8660.c  |  4 +--
>  drivers/clk/qcom/gcc-msm8960.c  |  6 ++--
>  drivers/clk/qcom/gcc-msm8994.c  | 54 ++++++++++++++++-----------------
>  drivers/clk/qcom/gcc-msm8996.c  |  2 +-
>  drivers/clk/qcom/gcc-msm8998.c  |  2 +-
>  drivers/clk/qcom/lcc-ipq806x.c  |  8 ++---
>  drivers/clk/qcom/lcc-msm8960.c  |  8 ++---
>  drivers/clk/qcom/mmcc-apq8084.c | 50 +++++++++++++++---------------
>  drivers/clk/qcom/mmcc-msm8960.c | 30 +++++++++---------
>  drivers/clk/qcom/mmcc-msm8974.c | 52 +++++++++++++++----------------
>  drivers/clk/qcom/mmcc-msm8994.c |  8 ++---
>  drivers/clk/qcom/mmcc-msm8996.c |  8 ++---
>  16 files changed, 123 insertions(+), 123 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
