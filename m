Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC09B3557F8
	for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762877145; cv=none; b=UZzhK/tUNLszMZPG8tSeCQKvBs0Eh5p92toY6/t93Kie8Mn3DSbWp9qbmS/T+FH7XQnu97f4MatW0ABPoN4jmWBokTAISOYJS2TfO2JIzEinSNWGtKVzOhUlY4OHR8S24RLHfj0beRK/GV1wvVI/OFVLYXCVXEZFrVR/gn2lwkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762877145; c=relaxed/simple;
	bh=bh/aGYh2TxqNDfolJ2dzfp2J9SHIt4utWVkJr4yXJW8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=acP928ipK55Cg0PgjpPOoPMtSvhKOrbt22Wc3QeTn21riGW+zgYVGgrbY7AU4/6j6i83k54vA+foQCzu50/hNkKqQSCK5fX6CgWGOtfe5oHSsUufzHwq29gm0WYgfa8LbqTIPFOSWaCeKSU6gQC2E/KN/9F9IFeCGAoJtAjcfhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoNaWb3y; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoNaWb3y"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so21318755e9.0
        for <linux-clk@vger.kernel.org>; Tue, 11 Nov 2025 08:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762877142; x=1763481942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=GoNaWb3y1+D5XYlQ/izJ4rwTyemnzfXKoco2C5nUeZ8rZRi4nmwyxP/0W7g7AH26B6
         MydFRLDiiM2kjNQ9pp1+pHAhNOoG4hSp8LDLhfwv50i3J5wSXFJACAZdO1XLyBcQolWJ
         nwarMB7O4zmAIEig80pE2RUmbI7Ob/y7HrPodJd6ivDFpllw4li42EbkuJyhM+u3Tkcl
         MKV5m0buEsFLjTaAErJS4ZbzZH0RlTgjVvo0b9koC+kv0XywMvdVIBzstljHDJ/n9mmh
         /V01Zh/rPku7kVTI/8ssHs8Ga1wcF22ZxGZyyitVE/OMbWZ0i3aFDGLHWy4ZMGia52+S
         bkpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762877142; x=1763481942;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RZXbES+suQSnoFPsMGN23SzPRLTGjJvuz6wdaZN3k8=;
        b=db/yHoltojXnafKErTucHUGPggjIx1T0tcpI8vD5AAQVn7ztGSg33yK/lJjnxLawr8
         qf0rljV0pz3ByW4WLugBf/dww96X9KfTTLl9HMuA/7uIUL3IGkmGOtnxcAkeiS2m3315
         GMURvvtSp6tGhIsWWh1op+u0psgBzx1O34Ip6wHtyLAQRZme2YOdb3Ib6+DLfziZoE4Y
         0fJQdyJ8Hkgb+HRorlem1am5PMocvx4osMq7L4YLU501nXf02awDhkYuIoPhbUh9ngxZ
         ELh+u8vyFfkbXREcDAQD51K/sHXR5BcZPGqVpJ9SYAr8TnzWoKaDd85qBB52ZAMzZ1Kr
         CMEg==
X-Gm-Message-State: AOJu0YygvIfmkw/ZFr4/HF3dGgjfl6Aqn36IBd7XRs2bamc6x9MMGB4p
	meekxsfNfrF2TF8qTWGHouzoW+2LT3AKp4qpXkVylisLICotuf/+xduiRZBrG5bzkXM=
X-Gm-Gg: ASbGnctmpBmq1T0gtbabQHtNtUbZDwCFtOjacOcLXr/3buDFbdYdN3lvfaAtQPWX6Zc
	G646yQmQsBF2/MdXntMt7Zrdd/BhtpSAQc2xvT8QwHBGCZGRiaYyV0bGgvUCsdrGznQaBJ3eyyF
	K2YpYnB0umbs0BI7Rv8aiwlip3Jyd51vcuNh1G4Y6bgmJqnymeYTnk96LNS1XX9IgJM6P9DAPiH
	kmuGSSqOuKFC0lXayLPPshCiFKlDa4p9eMphyNcxSFfPeTlYnN4EFN2DYYoabh5SpzaPTmTv6Vf
	3G2sI5HoaQyldoIs7pVPnaaOuGyak8o+il/PegD2IyxTlTCH/R329HGk7zLyD1NrnLWHvj620T0
	7aPx6YyS0B4WtoH9x3CMkBnV3I046PuX+YsyBVB8pL9LoZK5ZX2l2JhKruV3M/ZWLXhkDJyqL7l
	m5q/v+XzanlTXyvy6gKv4=
X-Google-Smtp-Source: AGHT+IH+MYmpINWnsFKQUpl4/+4Jobxe4uN5z+gwXyp65Xhhafeom17agVpTYxk/6AzKP9Q1JVntow==
X-Received: by 2002:a05:600c:4ecc:b0:475:de05:661f with SMTP id 5b1f17b1804b1-4777329400bmr113603115e9.41.1762877142176;
        Tue, 11 Nov 2025 08:05:42 -0800 (PST)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm384957555e9.15.2025.11.11.08.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 08:05:40 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Fabio Estevam <festevam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Subject: Re: [PATCH v4 0/8] Add support for i.MX8ULP's SIM LPAV
Message-Id: <176287713958.95002.12532568280694164920.b4-ty@linaro.org>
Date: Tue, 11 Nov 2025 18:05:39 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Tue, 04 Nov 2025 04:02:53 -0800, Laurentiu Mihalcea wrote:
> The LPAV System Integration Module (SIM) is an IP found inside i.MX8ULP's
> LPAV subsystem, which offers clock gating, reset line
> assertion/de-assertion, and various other misc. options.
> 
> This series adds support for the IP by introducing a new clock HW provider
> driver and by modifying i.MX8MP's AUDIOMIX block control reset driver to
> allow it to be used for i.MX8ULP's SIM LPAV as well.
> 
> [...]

Applied, thanks!

[1/8] reset: imx8mp-audiomix: Fix bad mask values
      (no commit info)
[2/8] dt-bindings: clock: document 8ULP's SIM LPAV
      commit: 3b521bf8c51246466e2c337f1f2b60acfdfe82d6
[3/8] clk: imx: add driver for imx8ulp's sim lpav
      commit: fdc1dc7dd53b95805d3943ed36785c1ec812915e
[4/8] reset: imx8mp-audiomix: Drop unneeded macros
      (no commit info)
[5/8] reset: imx8mp-audiomix: Switch to using regmap API
      (no commit info)
[6/8] reset: imx8mp-audiomix: Extend the driver usage
      (no commit info)
[7/8] reset: imx8mp-audiomix: Support i.MX8ULP SIM LPAV
      (no commit info)
[8/8] arm64: dts: imx8ulp: add sim lpav node
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

