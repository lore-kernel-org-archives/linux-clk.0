Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03D92F431C
	for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667455; cv=none; b=NJKEO5UjReo8I0Kih5F1SPKp8RaJpdHWmUJ6m9E2+Xs+EEUJtwOjwzHHbC79pIClQizMbrk6PzaCFeIoQmibwOvf53mvq2CclaM5wJk38IjJA0CKTT2QwjGZbK344+fA1uMkCgHxa3nE/z4VJqG6ZGe4iVewJFd7O9m+bxPzrLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667455; c=relaxed/simple;
	bh=TvaafB06rCr8tuOU9vZPWgCbFPy7lxlkirtCxoG7TnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugsCu1jXY2DSf7GzF86uCBHXdq+Qx6tnjCbqy/LAvFS43p4gp9KRAF4qH0UCgqHXapX9rcX9HmgM5N92ro3eSb7h/0+XlLewG/q93iRFLdxurmvjH/zoHEMzmVkykY43PPNJJdWAoxrrF4YdSZxMu+0WfRA/U4nXk6xmVihbMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKWIEuwd; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKWIEuwd"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60bfcada295so10186309a12.1
        for <linux-clk@vger.kernel.org>; Wed, 16 Jul 2025 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667452; x=1753272252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=DKWIEuwdV3WfAvD59J3wSXUSNPGCXpxIbgmNYePCmgf9TRt7rzkjeo7wygymi1F3qX
         th9mPmmdC8O+Io47KjXRJT6Ym5JxSfilh5jxpUjWSFc3mHSKg+bVBCwQIQdw//5Ek13R
         z0MHerMgQyQkeuPaxo2AN/P+rEoMbZMe7t9m++BNZIGsm27cE3L9REYAWLZMp+8De1wo
         P1qZLCg6uLPZrzsxIG5xwyBGlf4Gm/5Gj5frtCd2ioofKVt55vIjzucAaysMgeCU567g
         /5LSxauKDhRm+4dzVtu8GTippY8jEsgR4OR0kPuXh4iMa/+oa42D6Ns/+kSByzVcytou
         AQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667452; x=1753272252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=Rv/DLiAXWQ3C1OXpxD9825JA6bz4XHJrjQ2k0+ERFy45yqIouS4wxqkk10RF7grZ/w
         8y6IoV1g0CBk76OGX34++6uBUZK5Db73OBkj/NRlqyvM0KpR3aB3R4Oryse6mvh95kpz
         hP9CemyGDdeML9IMMVgLSNRsVydwxfOzH69HpOdPiykAVKqXJdjcndr4z8eygI4gs+IF
         Xve9WyN91nwCjp3rJbnKX5HG8FextQwSnp43bFp9fgx7HT9B19dPW+xxc6fAaHTFk90G
         oZebBeFhtJVYhpuDrD3ajBzBgA/9cm6Zh26L14LhXaKkLAtfjMiK+fj/wIW1jH6mQS3z
         i6OA==
X-Forwarded-Encrypted: i=1; AJvYcCUFSp1Bktte0VANvjovIpa1LJN2qtWNvP/ZeUBQmyAEYBV3A05zFxaAWqE3rXKb0VhSEcH7R77TNio=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYkXiE4HdCTy2svRfeVrq+xnfbYjFywN679altP/VM7bQS8TWX
	E+0Qzc22QkuUaS+04jhPK+0+/BDdzBFtvcD7Ok/0ASxJPVwLAEMqHDrXSn3SDIBPEKQ=
X-Gm-Gg: ASbGncvKfVUhNKbwlrVqUZPbyyT5VSq5/i5hVFvlKKTpVqO7Z1lLnN5ZMiLkuT7+EsE
	JZJOpaspHfXTlde2zimfN9tbLU1/WsE1eMkVUL0VpL2x3pDopjZskdslsXKwgW5230b6z+XmPcw
	E8fmRr4c1xEckwNJGxP/+xhJMz4ZvJyxmCHSFWH4OkdRIeDerF2hyQW0vx7MU/I2gXcE9ni7pjk
	BjBNWLigcieb49seJPz4EVirfQAopqvFvR+ULy/JrBVe3sHJhkXOJF3pOHH/d5J6ANiCH4idL/E
	Iv8JKG9CpdtDM0V6D/aj4wBsTFhnxmKpqKkv7Vhjxb9qaTBdzV6uBicN4tlaV2gsyvBzD4KZr8O
	2JyT5qhkV1KpR+xy9lphNBTDJQb5p5w==
X-Google-Smtp-Source: AGHT+IEhSGvwKZCfWmTvLUG6dGYIJWTd4OdkmaI9VTlT7Ykv1sEpL5pIQSQFmLdV3hms4bc49wFnVQ==
X-Received: by 2002:a05:6402:348a:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-61285bf41c5mr2186091a12.31.1752667451997;
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976d9f7sm8622193a12.54.2025.07.16.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:04:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Message-ID: <aHeVOYUhLu8uIhFe@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>

On 25-07-16 11:15:05, Laurentiu Palcu wrote:
> Currently, besides probe(), the platform data is read in both suspend()
> and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
> structure.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
