Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAAE3F822B
	for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 16:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786465326; cv=none; b=AY3KnX+lv/Evm77umqmxPsrz+uUOduRQocmOKDCfaOF08kZRyGJXliYFJWO7j+sMyOgxvnrEnaCkW7AMTZTO0bhVJ4ljcsq1YuEgLKjrrwiq5uffY22WfSUPU7qttUARtEjT51B5mdjSGcJo1cR35SXNKtW7kd5Dzz+mcE3JCnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786465326; c=relaxed/simple;
	bh=rBY73z4VZc4Ny+oWgQzv4zD6snr0f7FgurZo09CYdJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oNZfwzIS3Hjmnl3PT5eBbcvdzhW5lv0/CYjkz8lO2UK6sctRTbwuLl7c5RpS/NhYrf0gyhxPXQH67m7N4lY87JpHAe8BPx1g8jR2FgMncI6rxSiWb7mddmQmQxwe2jpZJb6kPpOgtAKgtbaGAUTgVI1HYNc6xkxTEfznQb3nN/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fL1EFVtH; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fL1EFVtH"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so29288635e9.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Aug 2026 09:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786465322; x=1787070122; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w5NxFq7IcCs1xSnAO+oR3n9k6fwPCVP/WmcDz5wXiMU=;
        b=fL1EFVtHJNBf/cKhydRfwhpRSy15sLKaza625CYKP4SdXC3pOqPVKNOKxm0KYh8X6z
         er4yslziRXVZUQ05WRGzO8uZ/rGMWeGowK5lzJEJrviGfNs8QS7P6EZdIgKKn+bABtW7
         JPXluRy3sOzSzeG2N3Dt+p5h0t7/66Am3wP/wXZNKBopzZvb5ou7mOtAZRHJ+VT23mv/
         j7JffcZamDSWS6ySz4cRXlloPhcX8UbgJkdJ2O61+ZUpIMU9bax7wXrFZ6xsu4u12V//
         BzmSF9EM/E7zTd5KP6uzM4z9GeIVyas6wD2wFM885RiKw9R5aW1zgGcx3t8RkkiqbW5S
         NFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786465322; x=1787070122;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w5NxFq7IcCs1xSnAO+oR3n9k6fwPCVP/WmcDz5wXiMU=;
        b=hbezRp8R3atRYjK0h1wQY29Nb3sKmSRGb0SlW2MgTVkuNbhauFr1STS1Cai6TpK0YM
         HthNdNcjUivUO/EGoCyDbEEzY1kh80CRR+23v2j7O5AGshYv80yzqrU0nqBuuhT/Xqe9
         8Dj9PYTroV+avPj+RwkUG2rJWopjQWC6Y6c8MmDrEHtyN6FYIUJbVU0tyKOegwZyJo3O
         51SuP2Ep9oCZz/pWJ0wFx+NLz7/PVEo6wpXDl793Q+HaiSNBQpbGR0wSxRdib9/07J2S
         s+JYIsrjzoJrDW6GZf2MLBCZ7Dy1BiWOG9MvGMx+i3Xz5APE43WeNyl9JZ7WurMaVcWd
         LKbQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4KWGmZQNpQjFaPFPCJSh4mCmtZ6CblNFc0gcvQv5DWNjb3DA6SHBkU9Jc+khBSAZEV3aUadd2P/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXTtKKAKV4ay8t5Jv/K4QSr5hIAV4cBgf/ux8Xle/FsJfR3do/
	SX7ChksWTwAM/loNx6onWaab4DC1NXzE7rkdnkL3s0kqQhqCmwFlV8E3
X-Gm-Gg: AR+sD12RkTQZ0xBKtFYkTyVs/RLU1cfPgtonWL+u0PR632DUaay6U5ovKpiJY8dLlzd
	rZjXlayBaiozXEtJANzyMf8n4cr+zFLGWkdlh5qQnoa58kqnMUtiqT4S6vdQ9x2tPAtEg3SOXL3
	Xg9wdUk7PWRqEQFtcwagt1C9TiT9URewFKOOdmbs1yBgWFu3F0qhaAxDMFjPzC3XASiZYsQPS53
	wlgYVVQUqluSsBjuvUJ2PeBbcAUrIeGLAPvhMd9f/Of6w0qize6gbVg51YwKdep0aAcGoDvL4Kh
	vAT5aFQAOYwgIVPlYu13+O1Hv3dlLi5otjhujZhX5sd3eY5o9PPFxkdNYA0ZyCamqU+DfzCfIbN
	EkJuRt+4cxYpOz3owTjIVlzLGUX85uXJo4FMciWBIMXmn5LG447kvr82vo2LHpWj8PZjdccdQEa
	5b3VjSE1UGcdv6CJgaqOFtPuAug54eE4w1mimW48MZm/ZRhr2JjqkoqZ6BJ9ffXN305Fkq58u4H
	q5FusXT1dfRKiiZuawb6GFXxTmov4FaBT2l7JZVSgOVEuPjGwq43xzxrQB3S8uGFc+Nb79+rzHc
	DBMEw8XO65AQdsik7L1v9ohY/FGc5syTmjoZE3P4RudqtWmO28sqsrCDe6bckLSEpQwoQRzI79r
	pISY=
X-Received: by 2002:a05:600c:6088:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-49978475c11mr79962715e9.19.1786465321722;
        Tue, 11 Aug 2026 09:22:01 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-2a02-3100-a133-e401-bc8e-d36c-2d08-c5e0.310.pool.telefonica.de. [2a02:3100:a133:e401:bc8e:d36c:2d08:c5e0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977de1fcesm31270905e9.1.2026.08.11.09.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 09:22:01 -0700 (PDT)
Date: Tue, 11 Aug 2026 18:21:58 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>, Brian Masney <bmasney@redhat.com>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-ID: <antLQUuTFC_NXWu3@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>

On Sun, Jul 12, 2026 at 06:03:01PM +0100, Karl Mehltretter wrote:
>   clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'
> 
> Select AUXILIARY_BUS directly, as other clock drivers that create
> auxiliary devices do, so it builds regardless of the reset driver.
> 
> Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---

Friendly ping on this patch. It has Reviewed-by tags
from Brian Masney and Andrew Jeffery.

I don’t see it in the clk tree or linux-next.

Is anything else needed before it can be picked up?

Thanks,
Karl
