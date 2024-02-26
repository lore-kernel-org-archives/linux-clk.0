Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0B01DA58
	for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 09:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708939012; cv=none; b=TrSXHaJY9Q4KJswI1SgnEA7eIiWqtrU0KICXwpoXGCH5KaVwD5yEeFvQjq7l0J+sluqHciVBHgPvHkjbe9XSPZKa/D9Pwx7J9778kecyZjpxxWfedFH3JTbbJrRmcCj0W25ayJNoDUT20WJVLQnkIpWLxIpY4Y24UlGjA2kBPnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708939012; c=relaxed/simple;
	bh=Upp2iFcc875yCuJA5X9ShBlOF4WCgv9wR6a1vPVlUjE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Bg0QvHrS06f3xsNvduPqxi70SRDdjeDpGEtl1VJM+IGOZwGZOSVaoserc4U8/yqDcroWrMeB9VxgiQ7v4Kz8YHxe70VvboFoukZME76o8gnLvpxxFouLwhL/RThHhBFDnBXPXPV8ZQnCPOzQQr/t16eG9BbMTTY3UMWbOa9DELg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ic073+E3; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ic073+E3"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3e4765c86eso329767666b.0
        for <linux-clk@vger.kernel.org>; Mon, 26 Feb 2024 01:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708939009; x=1709543809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JMmWZOmsO0vyhq4eNQPTY608ecp9OvqMQOtT08KRhk8=;
        b=ic073+E3eft5HhZVlZT0LmN2JXx3kQv+clDS8krEa1fTxt6G8qnc/9zSvadM9SSlQ+
         x9IydCGoG6gJwpG8k9Sb6jZlGBxI/KcmUz2aSXfZualiuGjocjGebCN42zgwge/PUcZm
         3z76Ld3SxpGQtW7LxQSrQRSBhQZjQFjWtmbDSIZ2ACEYQk0WlypuOyLGZS/FuN4w88a9
         hNFFo7Et9b4TrxMmZN22yQMW3uTO+2H5wcdzShuqAKSqPZUKfnkSfofOQ6Z1LhASnaJL
         gNJPwQn7DmViTvJwtqL/XD6gTl8fiK4BoFatjMDv/KP/5sqNTqgcYjcDvb/nAObtvT0E
         WuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708939009; x=1709543809;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JMmWZOmsO0vyhq4eNQPTY608ecp9OvqMQOtT08KRhk8=;
        b=N6/TrRBNUubfbAnNPs5NoPwx+YypHsHNc7DnddfYjgDv70S/ClBJVvN8q4MNQQQevZ
         gM6ffb8j94zRM4aq4eeM5g40DD6zpVGPZOU0g0M+RQ4oNDhNL/VDuUt+b2KDoZXjr4Oe
         GtYWX94wSXZ1f7XkP7/tfM/ggjJ3AJvfQIQFCLjiN01RKN95NiydU1MWx7Zf+eCSWkr6
         YEc+aurP1Rx2jEmyHRFsgsn0qGM3q9sx24nUExfacHwGxO2gw4JURhn+hnbLqEgV+HW4
         bhqU8XY2qVkU3MlURuenXXXsYole3W0hDGbiY5w2xxRDzt+wmcM0KrocSW00q3cKnZ+K
         FgJA==
X-Gm-Message-State: AOJu0YxEb6Aql+05GfW7clvO+3eiD6jriRBG0cm6L+xgU5JHoPg1asJl
	ablY0H9O30qgBHAbNIuc1fbxClbl2S6WEtenHQS8/om4ZX8oahwWhPFQzn1J9I0=
X-Google-Smtp-Source: AGHT+IEyIbiGGcmhV5IKj2JAF5rpef/IBwu4K0kyDJ0jA11wqSHhARelVSGWrrVgdR5wuJbi84CiMg==
X-Received: by 2002:a17:906:408f:b0:a3f:d927:4c0d with SMTP id u15-20020a170906408f00b00a3fd9274c0dmr3937942ejj.26.1708939009689;
        Mon, 26 Feb 2024 01:16:49 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93])
        by smtp.gmail.com with ESMTPSA id ts4-20020a170907c5c400b00a3ef17464b1sm2225053ejc.9.2024.02.26.01.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:16:49 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, 
 shengjiu.wang@gmail.com, marex@denx.de, m.felsch@pengutronix.de, 
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1708683351-8504-1-git-send-email-shengjiu.wang@nxp.com>
References: <1708683351-8504-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Fix SAI_MCLK_SEL definition
Message-Id: <170893900836.1770969.7795991183882277509.b4-ty@linaro.org>
Date: Mon, 26 Feb 2024 11:16:48 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 23 Feb 2024 18:15:51 +0800, Shengjiu Wang wrote:
> There is SAI1, SAI2, SAI3, SAI5, SAI6, SAI7 existing in this block
> control, the order is discontinuous. The definition of SAI_MCLK_SEL(n)
> is not match with the usage of CLK_SAIn(n).
> 
> So define SAI##n##_MCLK_SEL separately to fix the issue.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Fix SAI_MCLK_SEL definition
      commit: 13269dc6c70444528f0093585e3559cd2f38850a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

