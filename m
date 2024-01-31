Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BE3C55764
	for <linux-clk@vger.kernel.org>; Wed, 31 Jan 2024 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706685430; cv=none; b=M850c6bDY5CuZW4SEoDwEmxT4EAZy+syslZQ8R09L5/80kXBlHgdBZ1gc/iNcLEHcze/3ZEXmifILJPJYUNYFHZCPq8WDM89W6ve5p+7FaWEVvJahhkx0wZzVqR+ovWE9lLSyObfKUs4zn5KWouP30p5sKwryYwLU76us6F8Uuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706685430; c=relaxed/simple;
	bh=SBwf/LLGCzAHLu6vwrpQFfw+tJTtM2sMiItF7LdOdsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/jsk06gogrlS/oWcDrfHdC2iRgp32d+egPZUbkiK9spQOSEyjqZSVJRdiD03wTshXY+lGdUmkkI5qAyLP57Xp6iJPasl+/Q3vRWuxJXW5V6p/v6x4WkBtaxUq3y0TpDPL6chJa6jAcmVGja5XqsrsrUiad9E/IOCDQC78WGnBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=skGgilxU; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="skGgilxU"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dc6a631a90dso1170287276.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Jan 2024 23:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706685427; x=1707290227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i++Ghkf0yxbfp+SFq64kOAC5DCFdLn2FGQfA07BzBKg=;
        b=skGgilxUjyHfYPott6hjnYEwUcGIIw0iLZ79jmZDeoTwQ39TGuwMbYfSOSeR1xlylj
         KmPNLTPoxFsJwxfzStCQBl9x0+j+gA5Yvjo3wYuxEPKriaQgq2ByUszH4EPwE35vBKzY
         GaXKNuo/7a+G7t0FcS4oRg5A3f2GO1a/A9LAKud+MnfzVLc/FwUkfunju5D9hFFhavbq
         ZGICYfM7Yv7s2aPLbMBG9JNBR0wTf34KCtRDGW9T+8pXqVz9FcClOQNMF6FdVbKI3KpA
         qFQIIxUU3o45sNSE1RBBvB536zGlzscmCRlaNiu3jGFNQtxkpJSI73D0DaNVU2ivhgB3
         Np5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706685427; x=1707290227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i++Ghkf0yxbfp+SFq64kOAC5DCFdLn2FGQfA07BzBKg=;
        b=Tk59XkALKeHK8AfwbnBgGvQx/lPARs8yPajbyG1eXVsSQYLAshkIVE8okZrVGmabAq
         egML5EM9eyL34YOs0k4L5zvSE/NY1MI/2RP7mfMuAcNvuM3FnSM7gDQ0nQuULjxNyzK9
         dA3p/IksQOUwRasOLw210q7dVf3Nev1tg6iM5YfIG2ZIHc0lcKJe98L94xk6LdtItbGv
         N4gQxUnc3WegiwVvMcHoZNx+arluic5crQZ4cNbt86TGwD50d61cs/hB4n2usjLd8zr2
         1CxX6PWmGjJznnlBKLFVbyqAdUgV6J/Fs0nED/uCiOy1URijwRPyKYXVn4kjQjqXaQzP
         5huQ==
X-Gm-Message-State: AOJu0YwSC95AhoNMtOaUlJ94//DsMNygLp83I7LqZ7HJfjsC9ibi1CJ+
	5r6c0biUwDB709RZvE7CRvHT7SYinhzcI0e9H6yblWUm6lpznPNZkHGBDs6g2hE01HYp5qtze9f
	Ky+v6ps7Ef8sm3+2m2gzn1dR/cTT+2NoQpheHjw==
X-Google-Smtp-Source: AGHT+IFTNzxcPE7P1aDSv5JKuBB1enENzJJokT41i2jNc0I+1qhMXhMXCe1ePN6biXsX0bf+Ecr83unT7phgH6+21hA=
X-Received: by 2002:a25:6b44:0:b0:dc2:2e50:dc4b with SMTP id
 o4-20020a256b44000000b00dc22e50dc4bmr894449ybm.52.1706685427161; Tue, 30 Jan
 2024 23:17:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240131-ufs-phy-clock-v3-0-58a49d2f4605@linaro.org> <20240131-ufs-phy-clock-v3-2-58a49d2f4605@linaro.org>
In-Reply-To: <20240131-ufs-phy-clock-v3-2-58a49d2f4605@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jan 2024 09:16:56 +0200
Message-ID: <CAA8EJpqGhUiF6is9K0OeB+DW5BmTTEEvk1sEDkxV+cN5BWpNnw@mail.gmail.com>
Subject: Re: [PATCH v3 02/17] phy: qcom-qmp-ufs: Switch to devm_clk_bulk_get_all()
 API
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, quic_cang@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 31 Jan 2024 at 09:08, Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> Device drivers should just rely on the clocks provided by the devicetree
> and enable/disable them based on the requirement. There is no need to
> validate the clocks provided by devicetree in the driver. That's the job
> of DT schema.
>
> So let's switch to devm_clk_bulk_get_all() API that just gets the clocks
> provided by devicetree and remove hardcoded clocks info.
>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 63 ++++-----------------------------
>  1 file changed, 7 insertions(+), 56 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
