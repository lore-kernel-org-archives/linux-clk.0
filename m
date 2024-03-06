Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDAB5823B4
	for <linux-clk@vger.kernel.org>; Wed,  6 Mar 2024 12:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709728245; cv=none; b=WDWEzI9MCrChUcyfQ1W+7mXABaOMmYDDS1xq+gNxRlP0f7AhB4G02Uwk0h3HNVfiPaNXvLRVfp8wYkSktp8/PEkAM5lP2n5kZO2/klS98JwEd2GQkAPgilvG923eCDzRuwTt0hsYb+Gu3XsnHh+G3ESmyJtZ9e3QW4NhtAguhOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709728245; c=relaxed/simple;
	bh=PTcII2kQV2pmaV0bp5yVc1A3TkusgNPV9AvWwya2aM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+eMgYZy1GmViG/78c0pCYMxqpfqYOXKYSUkVHf4RUudxQc0317a575bRuWfyMZRjftVcjxNGPemz5hNcDQeAnhnxBwhL7ibeWEghQKO9mHhi85jcMWciURZtiSAp9AuvUIKjzn8qvTMTR0ouVX3MGWKbfHQlULWXwEhOXPwPas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QxQExzBL; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QxQExzBL"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-51336ab1fb7so5747701e87.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Mar 2024 04:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1709728240; x=1710333040; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FWwYydqmepf5IjC8UK5UPiYxznThwpO9On1HRbhq+ho=;
        b=QxQExzBLlSRev0RIX7Ljc8LtvdR/VLPbDslsHYt7v/XVD5QDPrDllTvjlaB8TUNvOP
         O9xFlrlt34yHyZe3ooJxYCaYXeeeleoDPveXOWZEIsjWyBjyOhhTshEXQDEuAH/wz+OS
         DmultETQ5tVLlbgjeO6gBjlOcVaSsoU835ekuwwm180/Xgnt9oIovXRR9NwDuKh+VfGT
         PHdauLue2e/yTETgiZXNp/K1hZ0knnxAz5YltRoSxmcrdwM3UmMv4acYAQFX8iAj56QN
         U83J+00/h2pXrFRqjREWK+uU85BQw53VbS+31BiAPz8edQnIU7bfGk8lqXs1G7TPl/Ls
         BAkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728240; x=1710333040;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FWwYydqmepf5IjC8UK5UPiYxznThwpO9On1HRbhq+ho=;
        b=KIWR3V7TKFHMtGn4Pt9Dt5JZiiVPcRJc1Y3+U6FylRnEbZ8oZETLPRt0ZSYGZzybK/
         7lvpF9E7/SPNcX/3Q/fQyKSMszoOL0/FTHxZCI7sCY9GRgaguqhU7Q4Oy1pUORrSSnqC
         SKDY/XvmrnmGkURLq0E4yqCLB+C3taf7QqeQMVB0OvS2oetZOeCsusoUFzac0jXQDYa+
         eYByXZk+3Yr595/hiDn6WPeV1V1VmdxQUL5xPlpTOxBPUxeveXZbb5ycsDmIQXcWS6BC
         7XpSfx+F3O+Z7s09mGARoTqmTTxJMgF4aO2SajD46dHfm+hyPiOikLOVPGpywQW1TMN4
         mOMA==
X-Forwarded-Encrypted: i=1; AJvYcCXdgewFIJ7kvkuEPTmupdjws0ncaSkxC7sDkLc1PR0B8nTiGDW6PFd8m6pcBKF4tQ+tvyHH68WGktnaY8Hdpuw2kTLIC/xKHi0a
X-Gm-Message-State: AOJu0YyL+8AYedkpGN06tSv5c5Rlh3URsNUUegIdR3dWVZanIPghnUfv
	quPhw5pkvLksnSOJEDdRsdsVyId+X7O2KyKXJYAN1/hFl9ILV7e6jharmbj1QrY=
X-Google-Smtp-Source: AGHT+IFzQxkuAqjr7PtbZ+hs10zWX5jwQjG+s5deSaQKkphYRc/ItJqyZozL2B6+P0S18GrP9IEDhA==
X-Received: by 2002:a19:f016:0:b0:513:1551:f0 with SMTP id p22-20020a19f016000000b00513155100f0mr3119939lfc.42.1709728239546;
        Wed, 06 Mar 2024 04:30:39 -0800 (PST)
Received: from localhost (h-46-59-36-113.A463.priv.bahnhof.se. [46.59.36.113])
        by smtp.gmail.com with ESMTPSA id c8-20020a056512074800b005130d251b57sm2624706lfs.166.2024.03.06.04.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:30:39 -0800 (PST)
Date: Wed, 6 Mar 2024 13:30:38 +0100
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: r8a779h0: Add thermal clock
Message-ID: <20240306123038.GA3396349@ragnatech.se>
References: <befac3e8342cd552f580d34be863ef84403c541f.1709722056.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <befac3e8342cd552f580d34be863ef84403c541f.1709722056.git.geert+renesas@glider.be>

Hi Geert,

Thanks for your patch.

On 2024-03-06 11:52:04 +0100, Geert Uytterhoeven wrote:
> Add the module clock used by the Thermal Sensor/Chip Internal Voltage
> Monitor/Core Voltage Monitor (THS/CIVM/CVM) on the Renesas R-Car V4M
> (R8A779H0) SoC.
> 
> Based on a patch in the BSP by Cong Dang.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-clk for v6.10.
> 
> Changes compared to the BSP:
>   - Rename "thermal" to "tsc2:tsc1".
> ---
>  drivers/clk/renesas/r8a779h0-cpg-mssr.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/renesas/r8a779h0-cpg-mssr.c b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> index 71f67a1c86d80f4c..5c48e645f0c3197d 100644
> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> @@ -192,6 +192,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] = {
>  	DEF_MOD("pfc0",		915,	R8A779H0_CLK_CP),
>  	DEF_MOD("pfc1",		916,	R8A779H0_CLK_CP),
>  	DEF_MOD("pfc2",		917,	R8A779H0_CLK_CP),
> +	DEF_MOD("tsc2:tsc1",	919,	R8A779H0_CLK_CL16M),
>  };
>  
>  /*
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
