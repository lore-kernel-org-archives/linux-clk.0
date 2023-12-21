Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E11745DB
	for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rGKHlCRt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40d352c826eso9675285e9.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Dec 2023 05:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703163800; x=1703768600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV0pLhc1eNEl1ZlcZJjaTsQkbCWEhiomsd6unkLFjqk=;
        b=rGKHlCRtA4ArjWFndzqlKIVP3vp+6PJIY7OVbvjbhuXKfokId2z81ly8xoWl+LFvXj
         0k8nfAa1QL7oRSIhsCVcMOGZzDmciJcL7bqEZar1GqL8SoQhHn0JW9HhabDRwqR9bFBJ
         u8mWQmhJ8joPnIOx6yLO7ba8PjWNh2WvDBjxekcvceLhHjxzo9zHKMJpnMDbdRk+GA3W
         8HXbWezTGoKGEG8ubhp8RccyYWIzUk16MoOXWn+wI/nwi9iyeoYzKyMQFszFTwgx3Dov
         Evm7iST/Boqoenrrwv1mQ5PIdoXTivKjILGCv+bZ5bbNdD3XSlFNjKNijMtW2O1DcTuV
         BXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703163800; x=1703768600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV0pLhc1eNEl1ZlcZJjaTsQkbCWEhiomsd6unkLFjqk=;
        b=ZZE3J01fNme3xNw2oGHso6JIXGcHrbZ32hGM4CRi4NhIN0DILH4rCx4rlUiyudmKtB
         KS1YzK64yb4gX2OAgus/ksC+8NBlnGJvOM1pbjJrriAPBQsqpvBkI8KqoSU6+RX3UrGP
         xoBRjFQlTEj1EytjH/FtScGLd5wia7AT+GuAq+zCfPIKsWH4MmuJoCoPsv1HQkbKTxpu
         jlfeZwLx1/CKB/afpqRL0BRuh5KrFOdKD188pLs24TC60/Oiw6a855Ui23rzs+fESwQP
         H1eg3tB/CBijb5ECCAurGqQAsXwLZF/6TFebdcSJJICPb8fM7kdng/pGY79NAA1f8U8S
         4S6Q==
X-Gm-Message-State: AOJu0YyQn/kdlJL5czd3r6sk21XEulUCbmDo2WdK76eyTtlxWLJYB1oL
	QtWIOuBxtDskgaZS5E+aMbAzBQ==
X-Google-Smtp-Source: AGHT+IGKsaJTN83KjRRHH8cCmgQL1O4crtaE1PWiINYVCRwM7jAdDKa1rYTlbRJxuhg6htojieQNew==
X-Received: by 2002:a05:600c:1c10:b0:40b:5e21:dd49 with SMTP id j16-20020a05600c1c1000b0040b5e21dd49mr770884wms.119.1703163800473;
        Thu, 21 Dec 2023 05:03:20 -0800 (PST)
Received: from hackbox.lan ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b0040b36ad5413sm3229791wmq.46.2023.12.21.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 05:03:20 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org,
	peng.fan@nxp.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	shengjiu.wang@gmail.com,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: change naming of fvco to fout
Date: Thu, 21 Dec 2023 15:03:07 +0200
Message-Id: <170316377039.2868388.1010743948171671677.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1703068389-6130-1-git-send-email-shengjiu.wang@nxp.com>
References: <1703068389-6130-1-git-send-email-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 20 Dec 2023 18:33:09 +0800, Shengjiu Wang wrote:
> pll14xx_calc_rate() output the fout clock not the fvco clock
> The relation of fvco and fout is:
> 	fout = fvco / (1 << sdiv)
> 
> So use correct naming for the clock.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: pll14xx: change naming of fvco to fout
      commit: f52f00069888e410cec718792b3e314624f209ea

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>
