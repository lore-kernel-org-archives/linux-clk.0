Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6182F3C39
	for <linux-clk@vger.kernel.org>; Wed, 12 Nov 2025 08:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762937936; cv=none; b=bXN7G2DU4DX3irNWmoI7Gvajj4lV6mNLLSfIIM3QFqGZMMT/vSkuwymMt24nEOsh7Eu61fEOhg5IdFINT7httvIHSr9YCwrOuB4jd9Q0datXNdLajAeJaBYdX0O5d/BVUZap9ZOBUpfwjHHTfSv+LPkysv0HGYHWqeS0IpJrWDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762937936; c=relaxed/simple;
	bh=BvJ9QOK1WudzEqe/mVP9Qch6KeES8Cz5wJTG2FvjEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mXkOaYlRmlWA1r6V/7hJ7wczpeSk7X93j4j02PnpkIi+CWxKCsYC+vJTBZMFrMcb3uMZ4Xf0sfNAIEsbP1A5WlTfWj4S5KgWObzF4VqfVkWqxs6oGd2tyGBrgYPpAIa0yzyGDSK/Ek7680kG2/1W8QSSEsffOtF5rCq1V4ejnTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L9n5zMRs; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L9n5zMRs"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so3990645e9.3
        for <linux-clk@vger.kernel.org>; Wed, 12 Nov 2025 00:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762937932; x=1763542732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=L9n5zMRs+o+zZfxlG77C4v/E7UOyD2TnHRPNuFe0C4f9WeJGTI8wP75Qs+Tnry2TaC
         uKpy3WsT6pPvvTdMbfScfHNj6BWQdl6svZ4gnDBl6HBQ7TBbVnnMm1Yuu+FxEoZvltwO
         J6BVRFp2jKAKKaqSq0nCBjFxP+psQhJ7hVCPb6s8gYcK3oYQ6WGtyCBUnW4pjaykbwyC
         DrCRsA8s85f/i08GV5vp7FoKsg0uU4YsO9CzX8GYSRfOygifXkiPGJmgOeWwkN8H3HKU
         abQnoXZbrwVGXsgiZ9QkEtU50RzoxQiYEMDPWJz75CzJp/2FjERA9xelnNQ7uN291e3e
         a9hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762937932; x=1763542732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2PM3V5SUOmIRwUEw+SelsziXLyJorncDb0vBfck6mjc=;
        b=HAq3fqonYGulLDeQqREo6isbNLKl9Pi310LZrEdJgLmgSz6zDw8iSA6NQr4UtY3R9l
         BrUohZMIive+h+h20l7TVnkpq40hn1H2UFcMvU8qKa/GQvmPrI8jbYgwh+xZpO2EBRoo
         7HLaDFGncw0gZU9CoQj0qniyi/WynRuT16Xo9ENu6Ea1oIAYkKF3YyPdPIxbGTAN4e4F
         MOZu9xTZPxG+iyeLDOX9/twNlKoOc4SThdo/wuEpZReYmMmgATSXqsq3apC7+9vbaGry
         SFzdHFZvCXE34MmxXEr13kT8vLro6FLMTW91e6w4nmau803LHuFMtFbjlByi6Jv2ozfW
         FayA==
X-Forwarded-Encrypted: i=1; AJvYcCWQynSHc9NnkCe36Mu/SBbCO+JeKsv6gs9aTVSdDecT0ig+bpNUAEuPJY7Jv2RXLvi8ATJGfZHfYWU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLoc+njjVT/Td7NaFkYF/hetFGst++wdRL625AdXrXQCyoPc3E
	3fwCZoPdqK71cfyFwofnj2qo30xgJ0S+ACMdV+Vdx7tuHoPBfbu/ck7E3418bpjpaKA=
X-Gm-Gg: ASbGncvtNoeVj10TNC0tfhFpMPG1aY2drlfHkM7K5YDfNNUJ24LeBYrN7Ki8YHolHII
	0aylTIqfZnMmYvGyuahjRJ7RQdDvnbmTOLlqh6TehOfVaPz9/HkzPQPuac84OP8zgTEeStqRnHd
	OFQy/gIlhH4QQGd9NnD1vs8A0EnOWkLqiINyyL0RaFzWcPpubODjKzaT0SIgEy8k24HrZXf2//i
	UtlqyYOATbP1zkJEdyXx/uJd+DKNOgh1a7UV1gO3BVVCIoQDmLAniubY6fYKbgKC39A6dsr/RUp
	lB/ThoVbg5WF46xqEVhwhK7mJI127+k3mu6zByLoALp7TzHH/EuktOyHpEavTVKDtreRJ9K9N7a
	7fvHs2VDKhTjEsR2ImlaT6WWRluuhTCxTeYZATlRrskhQI6c2LvNVEyLIlrOq3jMar+3p/jIQ
X-Google-Smtp-Source: AGHT+IGGVYvDUcqcUiPZLSUtoqDWfq0dWOAgjoDY5T7sj0q34JOuNXmckY/tBFbuwEb7ShY09sMSJg==
X-Received: by 2002:a05:600c:4703:b0:46e:506b:20c5 with SMTP id 5b1f17b1804b1-47787086800mr14036335e9.26.1762937932076;
        Wed, 12 Nov 2025 00:58:52 -0800 (PST)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e48853sm23640245e9.6.2025.11.12.00.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 00:58:51 -0800 (PST)
Date: Wed, 12 Nov 2025 10:58:49 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, peng.fan@nxp.com, kernel@pengutronix.de, 
	festevam@gmail.com, linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] clk: imx: imx95-blk-ctl: Fix clock leak in error paths
Message-ID: <y6ospgarjnretdsankhgtudttqqjfhltjyt2u6hnejgeufbkcb@yhk7ejuexvr5>
References: <20251111114123.2075-1-vulab@iscas.ac.cn>
 <20251112023025.793-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112023025.793-1-vulab@iscas.ac.cn>

On 25-11-12 10:30:25, Haotian Zhang wrote:
> The probe function enables bc->clk_apb early but fails to disable it
> when bc_data is NULL or clk_hw_data allocation fails. The cleanup
> path also misses pm_runtime_put_sync() when rpm is enabled.
> 
> Switch to devm_clk_get_enabled() to automatically manage the clock
> resource. Add pm_runtime_put_sync() in cleanup path when rpm
> is enabled.
> 
> Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
> Suggested-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Next time, please do not send the new version as a reply to the old one.

Everything else LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
