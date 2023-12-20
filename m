Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 143041DDFA
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QjHVGf55"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c256ffdbcso63805035e9.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 01:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703064321; x=1703669121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNLsplrCByiiEO/VQ8K/C4vgbzwu3BXO+e3S/xG5KzY=;
        b=QjHVGf55xwOa/MGQrs361SpQz8txQ4ukz2ZZg+lhBEQ1gEaCCUW/8HvHjyutO14lUX
         qY9+p/dw6zVuzeU/YWyNoAtbm4GrvTOMbhdDbiUlUX2OexSfK3IHv8aMYPNYISkwO8XX
         tmokyazY1jmSC2v8CtyY0/cMsnRfvKmW/itKkPnvZB+y6i1RKiQLFetSZfOEtkz824Ax
         e9MTXEyd8DQkF4idZhDMhIB9SKvtbsx7MXJePsr8e6Xd4e28pWtEoF2lzWC0jjrGNRQC
         ho62UXEAAmngl79eyHmeGlhC2gURWxUKghD/kFcgo1/n6LjC1fnS5WxelvI85SSZaJNr
         yaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064321; x=1703669121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hNLsplrCByiiEO/VQ8K/C4vgbzwu3BXO+e3S/xG5KzY=;
        b=ruX+28L7Ynhfg193VtD4CiapOUeDZD3SNT4Dm17VP9GpomPe9WPPJZ4jya9p7vPadJ
         DTKrAj4q7hmK3tcPJyIQftCFe6ds4oDgVmOI7ygfIE9SfJ/ScCqn3fgn5rerANjGL54j
         wyGJ6JKyDZNrAppHEeI59V1MAUfiROG/rWWUZ48J9XL4bKGZyqf1NuqUD4+AKTLHDFrq
         VQSCbTWtaW5Xyc3z8gEJvbJ+JS2xyX5swxeHutohDDWdxQtNWhuroDBCxM4eqlC64CHS
         iyTV7rM8USsyyavCxMc8fkrS9GI1jAiXtwuTQ9QhGLwbxcfuHj+kcgJn37g7SX0XIGcB
         PjJA==
X-Gm-Message-State: AOJu0Yz2eBQu+p22DEVw1rCJ61C1xsPsuleliq9qmclAMARboJKJ64Ho
	h0aT0IKJAi3/ugF7EGfQC9x8jg==
X-Google-Smtp-Source: AGHT+IGK4MOmUVNrkIe3tz5OvpxlNRswa1Lm0seYTH4CgnJnmpTQMjGdMCIaGM4e0FKTvrdrWkXQDA==
X-Received: by 2002:a05:600c:3b26:b0:40c:de2:148c with SMTP id m38-20020a05600c3b2600b0040c0de2148cmr10050483wms.47.1703064321146;
        Wed, 20 Dec 2023 01:25:21 -0800 (PST)
Received: from hackbox.lan ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id be8-20020a05600c1e8800b0040b397787d3sm6921936wmb.24.2023.12.20.01.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:25:20 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Cc: peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: scu: Fix memory leak in __imx_clk_gpr_scu()
Date: Wed, 20 Dec 2023 11:25:12 +0200
Message-Id: <170306426324.94631.3566102445536817606.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231210171907.3410922-1-visitorckw@gmail.com>
References: <20231210171907.3410922-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 01:19:07 +0800, Kuan-Wei Chiu wrote:
> In cases where imx_clk_is_resource_owned() returns false, the code path
> does not handle the failure gracefully, potentially leading to a memory
> leak. This fix ensures proper cleanup by freeing the allocated memory
> for 'clk_node' before returning.
> 
> 

Applied, thanks!

[1/1] clk: imx: scu: Fix memory leak in __imx_clk_gpr_scu()
      commit: 986439a9b3a32a6ac20042ec17acd443f1e7e86a

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
