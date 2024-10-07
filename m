Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75321DE8B0
	for <linux-clk@vger.kernel.org>; Mon,  7 Oct 2024 09:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728294892; cv=none; b=XrTWf5sTj8uWOpblw5+C/os0Bxl8aHZKakWo/K/l4WkBZDRiGrD5WGToWz9OXlS5FUz6uB8f22A8rCYrAe4qTM/NF2FCOHaaVLWLZZQ+BQ43GNl1iAJGCT6sxgUaSqS8/EbUvJ6OhbPa1YVOlngWg6SXkL9LzcMj2aUiQDMI2P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728294892; c=relaxed/simple;
	bh=XPuTahtxHfXasKgZvlJ24F5uRaM7cQ4b1F15SQPxJl0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFeXgZzN7wYz5quRFnuvP3b+Gw8R24j9jImTwYywWK5W4Ics+x0Qh4YD6v5jZKXmasUB3Hex1r4j/kNSFAAQsk6dXRIHEB8oZ0V2HPEaaee0CXgl41exTuZJcM9c9gDwDrMJgTW6rIr/oKN9VmzHL1Pflpz/d6w0yQyqpPKWwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2AekC6b; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2AekC6b"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so42942565e9.1
        for <linux-clk@vger.kernel.org>; Mon, 07 Oct 2024 02:54:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728294888; x=1728899688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gaUYthw6ApPY7iMEBlPEvXCrC/ELjE9zT9gwyCjWi3k=;
        b=T2AekC6bVcBTuQpMKcq8+kdZELdWRHWLETkG84tpVOJKPJW8sEnPY7s/VDZET7rOIJ
         pNid/w3I3a8mBR5nyLsg65+2jxxUvdHwi7tpiy2URL+nNFzBf9AAoP4t8zDL/Ro2OKnD
         K7ZCPxtGHg9yI8TzOqQwm1+as0U0KORlWK1ruX7ZrqkDE8G+2rj+mVaJjVrZ6pDF8xuy
         oMrZmv8yF5Os31LL2UNz8XIHYwqKVgcmAw2l6tz5Jzaa6sG2/ydqDgTYn2dB7GWR1fjh
         638n8SrrJO8lE4j/FDYM8fwk1Ve961wKkIU2PAeYpE2Ue75NNLSFic2Tq4u3lXpfrEzP
         F17A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728294888; x=1728899688;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaUYthw6ApPY7iMEBlPEvXCrC/ELjE9zT9gwyCjWi3k=;
        b=lRPqganLaDxHr5wf3Fq80/6DWnSqNXalKzQ8lEgLBy5kS2LeDSXNkfxDtTYyupGHLM
         4APqaL0/XKRBg+/9mEXzwd8wM39gEua23wNTx316NoPNnSGzSlPSCxmNMmIZnmqo1lo2
         pE7LERLNuz2te6Q50tDUjR05DF01pyULfHop6z3dqIwF76/hHn2VHMiILyYmwUQbe34N
         A6p4jsuQ9GfDnGReTDxBwx4c4dJH8Ip+wg5c0UED3QWwSsdIfQy6hnYrGWJ4ke0qUhx2
         Ek02e/4L2CQaY5T8I8x+DNAwfzNPDKqOQoONJLL4c2WgAHN0O40I5UIGOm6NQBsc6LPu
         8JYg==
X-Forwarded-Encrypted: i=1; AJvYcCUDeCwidnsDgxcFaglsCuIsp5LN87V30lxu13fszeHFXXlf6qMz91SWdZitkEt/uVctrK6m4Z4YWa4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8NY2IvOb4OiHJ3qyFA+UmSr9mDnifLsQT46Jpoji8Yw8Tf0ba
	SdNIw0JQLXvuBJ47oQtlSOoMIJgaxPt2qloiZJ8bjI+kdZUXHgIvmrNbllzA7k8=
X-Google-Smtp-Source: AGHT+IFVxjKENE97XWETeGH6TckcY3Iu3heqkwwXnzL72mlbXZp4BBGafyTCRPMtDD9hj02mIVRoVw==
X-Received: by 2002:adf:ed8d:0:b0:37c:d569:467e with SMTP id ffacd0b85a97d-37d0eaf7aa1mr6482622f8f.59.1728294887935;
        Mon, 07 Oct 2024 02:54:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d1691a56dsm5329817f8f.41.2024.10.07.02.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 02:54:47 -0700 (PDT)
Date: Mon, 7 Oct 2024 12:54:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] clk: imx: pll14xx: Fix potential integer overflow
 on multiplication
Message-ID: <3e0def9f-ebb6-4171-9395-1da118b0ea29@stanley.mountain>
References: <20241007084840.1167527-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084840.1167527-1-colin.i.king@gmail.com>

On Mon, Oct 07, 2024 at 09:48:40AM +0100, Colin Ian King wrote:
> The calculation of fout is using int multiplication and assigning
> the result to a u64, this can potentially overflow if the int variable
> mdiv is too large. Fix this by making the 65536 a u64 value to ensure a
> u64 multiplication is being performed to avoid the overflow.
> 
> Fixes: 53990cf9d5b4 ("clk: imx: pll14xx: consolidate rate calculation")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

mdiv is always clamped in then 0-1023 range by one of these:

	mdiv = FIELD_GET(MDIV_MASK, pll_div_ctl0);
	mdiv = clamp(mdiv, 64, 1023);

so it can't overflow and the Fixes tag is unnecessary.

I think the reason why "fout" is declared as a u64 is because we were worried
that on 32 bit systems the "fout *=" operation could overflow.  That looks
reasonable to me.

regards,
dan carpenter

