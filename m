Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDB64AEF1
	for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710771543; cv=none; b=rNqhfCwsnv+ZqaEiksRe/d+jpvMx3iuRULpD/fTyVmD81Vf4s/HfQee/I5rfwQwc1mpwZ8tbL+y2y09qKn6/h2mDIhoFBD1VBDJOP2LsV3ar4VdUTg10EeNfo4Eo3iNJFilV5xGrsEYMsO5upMGMdg5ZaZhqFzfwN0/0jqFuaSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710771543; c=relaxed/simple;
	bh=UtoQrV8V4WHcjC1HvrWHCQs9LMwKtT9GXyBCr3rwGhc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=epfbpGHp6dnQm6cTv7MXD4VSZtg97ik+DLKxkPkyMuQrY3W6upGGwZrxf9qIRAh7ZCpRr+IYXS1WEFY/A2TclFmHzkAojpXX4zltPKlYVra1XuJCoyuO6am9BpIGIRTZAEDljCuPri2iS12Bx/6qYVebnejl25Hg4FbBMA8LqA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UP0WJzz3; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UP0WJzz3"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-609fb19ae76so47035447b3.2
        for <linux-clk@vger.kernel.org>; Mon, 18 Mar 2024 07:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710771539; x=1711376339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T8/eBwVdC8e/Zu5B3miETRaLCkLZGjLcGDUAWsXNX/E=;
        b=UP0WJzz3CZz8Gzd7s3GryUi7wfBHASAXDIEovRDrKKr8QZdgEQJHLz2ffjugBu/l3B
         bRFtmjq/ARNmiR9eLc+teYW6IUK9gBl8Kuk1h/aGAkShPczPbUFcmoPN5HK0xeOq+zwG
         K0wTYxu5PTZyZv5Elzh/BCMXGRuH943/2SRNrzDFbiIB2B2tY+CT5Odn0E5RoAdq9x6v
         hBbfJJhcCVEYDFt4Om5G9HuGuWRaS4iBAt8u8fab6ivogs7Fc7xra7R3I9yt4gthlDax
         I9JMgTNCQ7L2YVsfKu5vfvZtNmb5DAv/7CduGcbsJzlk4H+uGEX3eu3ZGyu6NDAYqlgK
         7+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710771539; x=1711376339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8/eBwVdC8e/Zu5B3miETRaLCkLZGjLcGDUAWsXNX/E=;
        b=AikFqvia04Aku7JRO8kFYE8T7MHkwDLIaMFHExgtD3wFTyM1OjSDxTBIITOTzakoS7
         BwPMpvetWEpR6pXs2jZ/MIAFhQdbMqOqAtDDV0xDV870c1vtNOvjQdNRT4MRAFNtBmGc
         XbmSacGVzGVebBdBoW+Wxw8/0IrY76DpP+h2Og4Jj2pwnj23WdgVb6CukFUempxR4Ih1
         msXH5cCvZIRjwHWa0OB7hw/1obR8i8JohZFRSCi6ibLOM47y9/t7XitUhLkcdveBYeUT
         5BscLD5HiK5eOnqzsJ1gojwsjrW+8P6nmgzFUihMsUsBLT+/Wk8X2gnZlnKEb7bnucGd
         Ln6A==
X-Forwarded-Encrypted: i=1; AJvYcCWxlNAVvmqOQ/HI5rSPkESsvNqSxenb0EKXdQm4s1cyHjOfgwWFL0ZlgM/bZDCyPHmkyaWa3oeJvCnK6HqFmc5Pk4R2uTu8hEDb
X-Gm-Message-State: AOJu0Yzg3Rq7NyNbqc8JhEEjnlF/rODDT21HypIlfRQA/bSXDDGoBR1k
	GI5jiNKBl6gqmKjo9To/Tjjn8W5+Gz4V3zvQmHkgJyvc/8cQq9Lek/E5zvWJcMRwaIxzkLEGXQx
	wqvuJpJwwfR6YKX6U7CElJYlKdlR0WXPoaXyK6A==
X-Google-Smtp-Source: AGHT+IF3f/CCR3DdCW9EhoZwH11fEMIYWHeUtnck7qTC0x9yNt+rbxfUfkX98XpGGqmd3SSienqf8G8v4kmrNcJEdj0=
X-Received: by 2002:a81:d514:0:b0:609:f062:a9af with SMTP id
 i20-20020a81d514000000b00609f062a9afmr12882787ywj.19.1710771539185; Mon, 18
 Mar 2024 07:18:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240318-apss-ipq-pll-cleanup-v1-0-52f795429d5d@gmail.com> <20240318-apss-ipq-pll-cleanup-v1-4-52f795429d5d@gmail.com>
In-Reply-To: <20240318-apss-ipq-pll-cleanup-v1-4-52f795429d5d@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 18 Mar 2024 16:18:48 +0200
Message-ID: <CAA8EJppzBpsLwU6Uk4LxWCL=EK14=NG5Wdpq01wSdWQp6wGKsw@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: apss-ipq-pll: constify match data structures
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 13:20, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The match data structures are used only by the apss_ipq_pll_probe()
> function and are never modified so mark those as constant.
>
> No functional changes.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/apss-ipq-pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
