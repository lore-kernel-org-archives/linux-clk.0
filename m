Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E301D1747
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802050; cv=none; b=ScG6JIm3htgMufPbE6IWIPhTBIQs2gJQxIRHfMDQ7Pr60HcuWdiqph5Rkwz1VQ3Fgdtxkn6nOMfYm6KoUOyx9Z5ZIU8G0dXDLfegBg/hl/ip9Ks1w2Ppi3QBR3hwJe+0QK0vwiCO4FhfOVm08ndC03EX9ezF/zwkemJWHN2DzRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802050; c=relaxed/simple;
	bh=n1xZDNUqhbesFuiMzQ2YOyPMXWGrOPosEm+4pCyIEIg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mHcUcHNVfaw3flkeuxi43b+5VNJBUx8qydT43cSAJ/z7CPK6cKEkMpJ0FtoImB+KDf75UufFwbESUtK+CY0OGtrwNOaK5N6wh2RpnQXIxj2+S9pgCr7L/MhVic5+OOoDBy40oUF3URNu04sdA9Us13VDGHq3ornPmW2CfewyHV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hLF5b7gR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hLF5b7gR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315abed18aso44445415e9.2
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 02:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802047; x=1731406847; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=hLF5b7gRcQ7QavqRijTi7lbURPWI0n+yb2oz5qy9rwlwsE+MGPKktZeOfpsYZKkpeO
         H4p5FJmrp3XFuvNrbVcjyJQyWkzu6x/y530Yvb8eynEbuWIkAChJx+IDKgXbtpqKrTk7
         fpVN3CnJAEN6F5KhGDWeTheU+jXv6CayR0OB94Cp5G4+abvryxDq2vgj9qk06dkks5RX
         KDNA3ShuyPrrnLGq8X8RlVLFl6uv4kIdcOYC2SrGCQC1IKRch3o7DE2zHlHsJWbacs2s
         ewNkfJgiw9w7gw9A/RQztQTvYZERQWVGFnAo2dFTZCDedg8pm4u9UQE0c/UHDhM/bINQ
         hH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802047; x=1731406847;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6HBjokQWj4T4+WepKSLqPJvgW6DqwGUQ8oY/ZOD6S8=;
        b=uBKdWMsGB/BCjx/lNKtFF7y6S4EGqVV3LPe+pEq7ETkyl+3MYEGKaEjjKNmXerQdyg
         /X6HM5CjhCv/Q9c/IuJ7avfqoCdetp3nXZgK9l2oydSvIgFGTZfUORkTMmCNT7tLie4t
         A2DLX4avS5s0jykee/GKRjNVKx5eVTe2dPgmzlrvdx6XViRVprl5DPj5tCJFjOa4lgQh
         IwV013jsKxFOssYt0UIU/8XIYY2kEvHJdwtIFwdri1cfDR8Ej/nYHcRVTOGjwrAzeX9q
         vnsBGwEDDAHtswyX3XMtSG5ZaOfM64PLBxSh5G7951I3K6Wqnqc/gp+rHCqFNA6/7jzy
         PrpA==
X-Forwarded-Encrypted: i=1; AJvYcCUv+Quu8BON9mygNqtxPtcaxNJlz8KN/6eflGGk2w40WBCWETXEnrVj6tmzA4+8noEW2ixMX3Itgkc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxD2VoZTn1A3qISwh9b0dZ6c5v76OMw0fXJ97JGOpCTvaRk6gj3
	1pXQ87h2WlMDEeoEf4CpXHk06BFAfAAQFh7+blFdmYnUTn6MGFI7yzmkD6jUYfI=
X-Google-Smtp-Source: AGHT+IGiCKZMB9E+p4Rzra+IUjFqsLZgXkfliq+gY4mk8e94l3nXR/6qBBzd8yl42Q8JhaJlQ14rrw==
X-Received: by 2002:a05:600c:6046:b0:431:54f3:11b1 with SMTP id 5b1f17b1804b1-43283297a21mr128723995e9.34.1730802047103;
        Tue, 05 Nov 2024 02:20:47 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd9ca7ebsm213412005e9.42.2024.11.05.02.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:20:46 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org, 
 mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, 
 shawnguo@kernel.org, s.hauer@pengutronix.de, ping.bai@nxp.com, 
 ye.li@nxp.com, peng.fan@nxp.com, aisheng.dong@nxp.com, frank.li@nxp.com, 
 Pengfei Li <pengfei.li_1@nxp.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241023184651.381265-1-pengfei.li_1@nxp.com>
References: <20241023184651.381265-1-pengfei.li_1@nxp.com>
Subject: Re: [PATCH v6 0/4] Add iMX91 clock driver support
Message-Id: <173080204542.1890849.11473057431035200273.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Wed, 23 Oct 2024 11:46:46 -0700, Pengfei Li wrote:
> This patch set is to add some new clocks to binding header and driver.
> 
> IMX93_CLK_END was previously defined in imx93-clock.h to indicate
> the number of clocks. However, it is not part of the ABI. For starters
> it does no really appear in DTS. But what's more important - new clocks
> are described later, which contradicts this define in binding header.
> So move this macro to clock driver.
> 
> [...]

Applied, thanks!

[1/4] clk: imx93: Move IMX93_CLK_END macro to clk driver
      (no commit info)
[2/4] dt-bindings: clock: imx93: Drop IMX93_CLK_END macro definition
      (no commit info)
[3/4] dt-bindings: clock: Add i.MX91 clock support
      (no commit info)
[4/4] clk: imx: add i.MX91 clk
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

