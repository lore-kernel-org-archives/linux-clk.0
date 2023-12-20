Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0AB1DA33
	for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 09:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dWDIA76n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40c3ca9472dso62119645e9.2
        for <linux-clk@vger.kernel.org>; Wed, 20 Dec 2023 01:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703064376; x=1703669176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIOiLB2Y5VwtBzbNpxoHadPRDJwG7P92r7UB8wqZ8Cs=;
        b=dWDIA76nD8aBMDoWBf9kpSlflG2CVdOUga5uSIeVg4E4DxGCuRCLU2+HUnU8CHuoBF
         fj5zVgJB+0T+SEKJ/uuF+IorrFbeVcNmeAQYN7ynFctjAnrn7IOWyX5K59dA9GO/MJ3j
         p1EFToab0csWUW+0ePqdYxOvRPhc7RiPjHtUsBMUls8jQXVmV6Mv9djKvPVz6EqvQJ2I
         nm9s8/B2Vc1PrPT1oiVZGHW5KgMtUGDj1FkYXbR08typ5NcN6c0M9blyocbXanPCFt4W
         o9iwfS6jK0r5k6Q9Nwj55rDfLxfTHcJxRoVGtvzAynlol833rvQr7vfWkHs95zBCCSzA
         A8kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064376; x=1703669176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BIOiLB2Y5VwtBzbNpxoHadPRDJwG7P92r7UB8wqZ8Cs=;
        b=WxXHoG7s35qvH7gCx0ZLritlsof0DpKIJ8Wpst+8jgha8u53vcaAR5/IqXS0v1A5XL
         nq46/Hv5OxkBE3YhmfHA4kXZDKSTA8t7scnD6ml9lP/JX4KcTD06LE95BJga7Zig8LGJ
         vlKsKoSf05mkcwoEZc56NQ9JkVIxCZEtbGPS6WtOUIyrp98jOxHxONf6jZ31x8Eoel8t
         hCP8svislvVtm66c5mpBuhsx617q4MqynbQG3zXS8CohLAF/2yFjrIMc/o9P/v9EMCpj
         QyIXFEzEKx0tXLI8mLDQ2DJ3iYts6RWu5g074FaEMjaivWKGdyOpNGbtD4n2G0f00E6b
         aP5g==
X-Gm-Message-State: AOJu0YwGYLGZ8xD6bqrgJByR5UBSjch+mue9QWxYQxKFvio19nSNe3Gq
	iy5nM1Uu0eyQ3Rg6uAdvqoprfA==
X-Google-Smtp-Source: AGHT+IH2UZnhz/+iuiPscZaqVvx3IdUZnuq981UUJucK5IVx+E2gFoh5sqs9GkAqczWA/NbCfYh0bg==
X-Received: by 2002:a05:600c:829:b0:40b:5e21:c5aa with SMTP id k41-20020a05600c082900b0040b5e21c5aamr6462070wmp.120.1703064375951;
        Wed, 20 Dec 2023 01:26:15 -0800 (PST)
Received: from hackbox.lan ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b0040c4535f1a2sm6340087wmq.39.2023.12.20.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 01:26:15 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP Linux Team <linux-imx@nxp.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	"Oliver F . Brown" <oliver.brown@oss.nxp.com>,
	Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>
Subject: Re: [PATCH 1/1] clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
Date: Wed, 20 Dec 2023 11:26:11 +0200
Message-Id: <170306434511.107637.11193901614064155915.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218122407.2757175-1-alexander.stein@ew.tq-group.com>
References: <20231218122407.2757175-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 Dec 2023 13:24:07 +0100, Alexander Stein wrote:
> To be compatibel with SCU firmware based on 1.15 a different clock
> routing for LVDS is needed.
> 
> 

Applied, thanks!

[1/1] clk: imx: clk-imx8qxp: fix LVDS bypass, pixel and phy clocks
      commit: 18e17b2a160382475a7e3211ce0acfb0dfbee633

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
