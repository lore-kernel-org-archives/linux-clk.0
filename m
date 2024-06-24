Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038D213D521
	for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 13:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719234347; cv=none; b=e9atFa2WAFi6u2ivvamr6lLkTFWoE27Gb8Zd/IF2fWw5NVuk9hvxoodHyWXJINM+CW5ro0RN013SMC94II8K2ONMC5UI6sI1xxSEkL/U3Np7IR9sZp+Y3attpsTVEF25Bro4NE7ttnNhw76r+PALEYZA9SfkcVZTmNGCu1XfDvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719234347; c=relaxed/simple;
	bh=J6s9FmYbwu6rCJX6bvwxo/5qkXV+mK8snTTnxvMNwXE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AuCujipgQN8/rM4N6e+wcrW5Uk+KC98yBweGw9gOw1vLcsG8uTKND2fJ62izbJ1c+Ln6mz8gbMPCVWCqsJPYtlrwRRlAqtUAIu/odJvV3GEv5knfbkNquvpvV+4aeu2i1rZFJeOe7lysOc5hMJIDduCI/o4DXDDLiRFVaEoZuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AIaMXfyb; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AIaMXfyb"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-366de090da9so1686004f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 24 Jun 2024 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719234344; x=1719839144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgg5zTIauTsPF3TmgnW+tc9VxrEyT7qeMnvZKfv7t60=;
        b=AIaMXfyb5FfZ0144JOGJ0UYRlciJmbJ5m3GKG0gKRfZZjJAUoU7h4iALxZwkNplUDd
         dsm0Ha2URwWuAIEkUfZBieTnK4Q2TGnkVjdLxUBIJ2KKn+TxrjVXjClMuVelg69ENt7H
         XbbAA0APE+J6xzMTqeZ4GJloJ7Vxd2IsEu+VddOJuGSk4wiqLnxmC8MpJadf48H3Qk1m
         u0zDdBXTyN+QPlgL1tlc4eBkAYMQqN/39xJ1942Jrn3c4gZTUhhDII953PtsGrD4Yw3S
         008HmH/N6rxVnSGkDxBSiNj5BTcuO/oT0nS/xQssts1IgLYkErKeCF6ApmzUsN1ZiJLS
         F9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719234344; x=1719839144;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dgg5zTIauTsPF3TmgnW+tc9VxrEyT7qeMnvZKfv7t60=;
        b=p3oxxQDG2PZ0090lLS1DLE2qsemSabc2FprKoQqItEOQnr//nvMtRlKRmbPApFit8c
         A5jaybarwyDC2ILcmzBubPHGoq5/y/hz8WRR/CGPcq3Yg+kLmELiGR0uHlpbS50yyUpc
         RqLeYnXVuH7eU3ZEKjIdq7LLi0j5jVZSXz033pywwds7QBhYbnAl3fX0Pf1ycxgisv/B
         4fllUYsewA7VOYOReh+h1oHt3aNOYwu4qxNIK0L/BkBPbbjlsO2WoY8X4yucalS9FuOx
         8wFiT7OUic/L+l4Z0XJDuPQXaz1pntZrc5sK04/YpfKL25Tb/eXTaqkBYoiEFJTdqPP8
         uqRg==
X-Forwarded-Encrypted: i=1; AJvYcCUGhKQKQmOyXoGM98BnEf5hJl1lkoBc9oY3z0amuYIjMX0+SlSCZwYEHBynnryTsVE+4e+4a+oLocUxzV/9lNRd4GNbsV9Ii/TX
X-Gm-Message-State: AOJu0YzDvnag3PfXBnsYY39eU0ZifjHRbwr7/LOanfZXxgRz0Jg6CNEO
	ILPD9Vsx2e9vAaQ4zv8L0YemkU7kFDaqTTJfgsjU7WSRAwpwP+oWlkpEmCW0U2Q=
X-Google-Smtp-Source: AGHT+IHzHCAkqhDnextCQWEo9v/WpPPKLVyplH9dWufwCaoEQzUNTJUM0of/AP9vtdGv3PM0Y5Zfog==
X-Received: by 2002:adf:eec9:0:b0:362:c971:d97c with SMTP id ffacd0b85a97d-366e962cb55mr2719410f8f.63.1719234344223;
        Mon, 24 Jun 2024 06:05:44 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3663a8c8f07sm10047839f8f.110.2024.06.24.06.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 06:05:43 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: imx@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, kernel test robot <lkp@intel.com>
In-Reply-To: <20240624024351.488492-1-peng.fan@oss.nxp.com>
References: <20240624024351.488492-1-peng.fan@oss.nxp.com>
Subject: Re: [PATCH] clk: imx: composite-7ulp: Use NULL instead of 0
Message-Id: <171923434299.3353313.590319710383846542.b4-ty@linaro.org>
Date: Mon, 24 Jun 2024 16:05:42 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 24 Jun 2024 10:43:51 +0800, Peng Fan (OSS) wrote:
> Address the sparse warnings "
> sparse warnings: (new ones prefixed by >>)
> >> drivers/clk/imx/clk-composite-7ulp.c:85:24: sparse: sparse:
> Using plain integer as NULL pointer
> "
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: composite-7ulp: Use NULL instead of 0
      commit: 466da3d2d967ee87d82060df2bc9c6ad4fc4af49

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

