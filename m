Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3173F4C622
	for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 10:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713781384; cv=none; b=gip/ByL19Nsinn3XGwYlekARDp6wV4TNWAT/TWpcIIv5QOwpXslT/RtW2oycUsFoDxFxY1rsh06j61GQD9TQ32j5LnFFUpv6gZ49tGaXxR0Qk1ZBUlgM+FjHfScBONHir2rJAs/fOHL9DCAEYgGqbYP+cO0Wjl7YYdxJYUV5hSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713781384; c=relaxed/simple;
	bh=07OTTh3dMLAPH+A9FRxh3NIAtWMJ48u3f6OlZGS7JpM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Twu/nDEAFwsXFM0WAzCET+dVeyWJ/5v/IcQ3Igk4yoFFs8o70/VlaRKvH6eCqiF5W+t8jEkXZxFwCLQF7KggyXpks9amWXx0EqrNG91TiPzdXsHrIOZIzYTHo8ODXIrmiSMWC1EvTTdeH/sazLdpohmkRK91cBR1T+QTQWOhQFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6V0Dptt; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6V0Dptt"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a524ecaf215so430728766b.2
        for <linux-clk@vger.kernel.org>; Mon, 22 Apr 2024 03:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713781381; x=1714386181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4MOAzp//r12KAAFcyy7AD2TaQ/ckhSJhCVYAqvJqv8=;
        b=L6V0DpttSrD55U8KoZPpuyxUyhyyFKozkdnsUnVWgD1FNUYPZC8d/lWHuJZbOV91KE
         IIJmxYT39SSe0jpKLzYfAVHnin6osbeUEdsYKvxIkSWo+fp61THQoabdWHr2z75NcI6y
         sFAebirSrxtq+KdUh+Ke7HmHjcVpar5eb0QV5QFPOheS2U+51zJ+EyCfFttAJWPW8YX7
         iEIhITpIq00c//34n35si8/2CoPMybKKKSQK0KaNCc29KEHCVjF+CO4L13/HZp0RqYiN
         GCcwljzolJM0CIE3lpm5qgWHy9K6wB0533C88PnQfjzEzTo0xEEbPgXRD0hpgLtQeA0q
         jWTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713781381; x=1714386181;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t4MOAzp//r12KAAFcyy7AD2TaQ/ckhSJhCVYAqvJqv8=;
        b=Rh3OQvTmq76XbbZ0W3srAhvgp2zSmgMuOaJ3ikHuTo9WPK4z/8+Wy0ixMG9MynOYGV
         4OIV++07X4obGTQdxAM9CWopi3D0Hm3L4HRK0LLjpO8OEB2G7mSZstC1ar9AiwQtPp7S
         zm9Iawo+2n2ZRlZVC/Mmu/dJGebRqO2I7Ofn6/7QytNOSFP5Hs6H1ZvqFUibFydFin/v
         mrOHrr4iZKkbxERBhwQQ/Lkc1404qnJUFl2+5x4JCL2M4hMT0rGykwPUpaCH8ubKJihL
         8B22HcfOxD7a4aaK/YAlMqZfmtB5bnBiFrJyQDg8tA2HF1tXeOK+7YTdHDrxJX+jYvZU
         VUBQ==
X-Gm-Message-State: AOJu0Yy36COuZY9OwtQM13S0OYSBd+I6hqQbwm08hJ/fzmNNjZ73O9iM
	N6/acvvymUDPNsUl8MqqS+zLf5YmUpsu+TvHLqqzLPwJJHjHyBc/HLvsX90ayUM=
X-Google-Smtp-Source: AGHT+IFnyaraDFtScDsivKAmXIVP6iLhVp9T8zalf4+MLsH1Tcsb5njnl6Kyb0jK1oQE4aO/N+eAEg==
X-Received: by 2002:a17:906:794c:b0:a55:a126:ac29 with SMTP id l12-20020a170906794c00b00a55a126ac29mr4331781ejo.62.1713781381229;
        Mon, 22 Apr 2024 03:23:01 -0700 (PDT)
Received: from [127.0.1.1] ([62.231.100.236])
        by smtp.gmail.com with ESMTPSA id bl18-20020a170906c25200b00a52295e014bsm5595887ejb.92.2024.04.22.03.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:23:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1711026842-7268-1-git-send-email-shengjiu.wang@nxp.com>
References: <1711026842-7268-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH v4] clk: imx: imx8mp: Add pm_runtime support for power
 saving
Message-Id: <171378137990.2925916.18282394508064276962.b4-ty@linaro.org>
Date: Mon, 22 Apr 2024 13:22:59 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 21 Mar 2024 21:14:02 +0800, Shengjiu Wang wrote:
> Add pm_runtime support for power saving. In pm runtime suspend
> state the registers will be reseted, so add registers save
> in pm runtime suspend and restore them in pm runtime resume.
> 
> 

Applied, thanks!

[1/1] clk: imx: imx8mp: Add pm_runtime support for power saving
      commit: 1496dd413b2e0974a040fa93a2ddc51cc9847fd8

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

