Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CB13101B0
	for <linux-clk@vger.kernel.org>; Wed, 31 Dec 2025 10:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767178618; cv=none; b=axoxf1/fVVKf4iADq+7dgPaCz4/lmbxl1Y4XefZ9sEe7iq0JfuyOBOrkgoNCXjneGMenc3WMMRoNZwdQUZs7hMIY7nWDM1buEWN2+I4cXY/egBbuPKJPtBfuab+r/JfSQ4DaPV5M7IIu6gLwsAYFDefYOgImsGA5FKTyYHLwv2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767178618; c=relaxed/simple;
	bh=gsvl1XJ48HrY4nODG0MTCbODAOb6WMQKqG7cDrnLhF4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XTyv2+Iio5Vu2fNnqvphNbnTvAUDlUPRp7DteKVei6AUUBz5hzNk/x4yTRWw3pnQY1wVVmN+uqGiRL6X0Lp/ZAUXNdrGInOoX/LL9HzJvc7Fx81C7ZCupiO0Ksh/EngCIRTiKMjyFlmWPiexah+lmnQrpjUqthix9iqBIO1mcCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GmWnudX5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GmWnudX5"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so107199565e9.1
        for <linux-clk@vger.kernel.org>; Wed, 31 Dec 2025 02:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767178614; x=1767783414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7R9+4upUD30LvVBHKBIsvpaPmqe/LxN03we2YAJ0+o=;
        b=GmWnudX5lpAJstB9doSzEkJbRvhiixjhMM7nbsJU0WG7OK4GGyvOjNF0+ZBUjg/kAj
         LuhCfkLT7WB/OX+5viuW7BSo856S1R168RJHk59L0/v+8Cd0tudlK6lVZnSj4RhGl35f
         PqMjZ76qaQBGEbfDcW4IPqe+dIHkox4NxmxuW9r9o9wJdk9yanoIHI0nn3NqjAHabbWt
         MgYUFfaAr1s962rNxm9ILE13IZeHUoDD8fi9u7rentq7NL/sjZiYJNIMvaGnSVcxdEyr
         3JVuq0FBjo/SYkgGCmQb2IDiJQFkqqAiZd8scXzXufly4B/T6grQQV9tjKxnuhqP4yBp
         FaTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767178614; x=1767783414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i7R9+4upUD30LvVBHKBIsvpaPmqe/LxN03we2YAJ0+o=;
        b=dfqpEfxO9yZ46ifuWa2YhQJCvxQVtu/Yx/Eui8U6PEEVPNCIERc30NCEtZZuecbqY/
         4U5h7+hC89n6Bm9ZYJniwSYwDA+aBWq93luVL7Kmd0dDuthXZnS1bh6vKWWCM8U1xhpt
         F+KS260WSlZUU3EFmIyG6mMmH3JenGF9y4RUEgz5f6wy+JsCrJGLI74ELKJJOfoxr95O
         rJRiLMs256I1aYtNaUa4EgGl/QZpowBTdEWhxwAbs6vNfPRHltUMpNwYlJpiAbpnRIGI
         UBgQjLileNa4XEDDnaaaD0//aZYqZlPBkF2uBb2lA0Vc1gelaLNh4I8m6D+yb0kUSlSm
         eKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBtHf2WjRJs+51QU/5ubEFQcJjNfn9ZamSs5uLlNwHG+abjj9nFyeMbUghV6cN0AcAcFL7ZU3GWT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuTD8eZHPNm4uWWrHFqjEhj4cVKpZ3mmx/opUYYrL+8H/rpqpD
	qBc55ggQdEpTMVnYXtk8vPtvNlaQvRsb6cRVX3DyP5HiSn11u/OYFqfw
X-Gm-Gg: AY/fxX4h5pRfnh5OlxJ0o2ldW8Aoz2Zhm6Q+1SMwYgwr6Y4gmoB2DOA0vcTarIfuXXc
	Jzrw0owlxZ6ToOwTUiQKm8HfyXLrDHwyWYIw1wKbutogxDwWBqhJirfwGl0pLMnGTqScS4/MmXJ
	gogUJyk84NsBqyXjWierOWN53CukZlL82rg1bTl5hydFFYbc6ArJn53dGABScR5RqKTkDMzmJsl
	1JsWzZ/rDM+W2HLeAnsROePEFvE4abc+BfsK53hHjeAce8uKnXeVrVjtlSsa3q4wF8Et8LrFzVi
	0D3yGmqZ1qE3kJva0mDYxJFpzvGoDQWK5FPrL0PTB14NvcS2nCLYlAvA8Tyk29vaa/GawCGFLQJ
	QVFg8KcCgwmDe7rUiPanpI9xDKzEx3Bv3K0T2I9Q5fKtg6KLo8mhZ9DiO5Mxb+u+pD5zOAmteG2
	La45ZTrf/WjCJMyGAW4h48RO5aPjvZnIc2IcrUKiPyp60gB9h9hit7K2eDSglwxRg=
X-Google-Smtp-Source: AGHT+IHDZb5mskiCuLOc+8SBDEk/OvIO6Pug2fQj87O+qUGMgHUJl5YBr1B9MzEZuOqkC4xwyZSO8A==
X-Received: by 2002:a05:600c:8595:b0:47d:5d27:2a7f with SMTP id 5b1f17b1804b1-47d5d272cd4mr54788585e9.26.1767178613627;
        Wed, 31 Dec 2025 02:56:53 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47be273e4d5sm696441795e9.6.2025.12.31.02.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:56:53 -0800 (PST)
Date: Wed, 31 Dec 2025 10:56:51 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, Troy Mitchell
 <troy.mitchell@linux.spacemit.com>, Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 1/6] clk: correct clk_div_mask() return value for
 width == 32
Message-ID: <20251231105651.430f75f8@pumpkin>
In-Reply-To: <20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
References: <20251231-dr1v90-cru-v4-0-1db8c877eb91@pigmoral.tech>
	<20251231-dr1v90-cru-v4-1-1db8c877eb91@pigmoral.tech>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 31 Dec 2025 14:40:05 +0800
Junhui Liu <junhui.liu@pigmoral.tech> wrote:

> The macro clk_div_mask() currently wraps to zero when width is 32 due to
> 1 << 32 being undefined behavior. This leads to incorrect mask generation
> and prevents correct retrieval of register field values for 32-bit-wide
> dividers.
> 
> Although it is unlikely to exhaust all U32_MAX div, some clock IPs may rely
> on a 32-bit val entry in their div_table to match a div, so providing a
> full 32-bit mask is necessary.
> 
> Fix this by casting 1 to long, ensuring proper behavior for valid widths up
> to 32.
> 
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  include/linux/clk-provider.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 630705a47129..a651ccaf1b44 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -720,7 +720,7 @@ struct clk_divider {
>  	spinlock_t	*lock;
>  };
>  
> -#define clk_div_mask(width)	((1 << (width)) - 1)
> +#define clk_div_mask(width)	((1L << (width)) - 1)

That makes no difference on 32bit architectures.
I also suspect you need to ensure the value is 'unsigned int'.
If you can guarantee that width isn't zero (probably true), then:
#define clk_div_mask(width) ((2u << (width) - 1) - 1)
should have the desired value for widths 1..32.
It probably adds an extra instruction.
(OTOH so does passing width as 'u8'.)

	David


>  #define to_clk_divider(_hw) container_of(_hw, struct clk_divider, hw)
>  
>  #define CLK_DIVIDER_ONE_BASED		BIT(0)
> 

