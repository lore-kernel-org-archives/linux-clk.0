Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072511CCEE3
	for <linux-clk@vger.kernel.org>; Wed,  4 Sep 2024 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725443004; cv=none; b=k31RmrYVqmHMfiBfKcS/g/MdDEmU1V8+eGPyXF7Ga5aSdOwO6rBkmOD+XOfbjxt+SzN2qTvm9Kz/mR3mZqKW7nqhAZJf9izc8U7lSkojnfa9NSpgBeKj7utO7pDT4MGeQ+Zg0xzNBQY8WD9IQk0ca4JpPWnoYLw8zuedaW7nL7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725443004; c=relaxed/simple;
	bh=kl1VpBp0hN2mGM+lhSKLvBfxDKtkWSfiDDLjjHLOzOE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=AnvJcZDLzWcpCyOx2KlM/6oLlSWCGTSzX6xgs/nhpaJnqZKGmGZjmnwmDg7y2Z5Wv+OVza53KuoFTpdEtQkoFEU0cyn8/AiWwXtDe1S+Kttbfu/1wFXYimj2np+dSHtOoKdIjgRkcvVancrM2Q34hmOBCeTefs47y8u3kpUFdVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIsXgIZ7; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIsXgIZ7"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5353cd18c20so820860e87.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Sep 2024 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725443001; x=1726047801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sWZolsXsCTYach8lH36h3ott3yh0cTGFzhMl58gyIUQ=;
        b=UIsXgIZ7iSFUd6eAWnAi5KmH0T4qhLmMPzqqycMyMlD78IbECSNmHi30J8Muzrqkqd
         ATUUO+Vz2V8CyQp9il1jGg32xd20CNj/p8FZL8SLz3ypomleh9uKxaCxAQ8Dh/LCFLgm
         xchfVy15NhMtPjvK+6AnbcymnbZk4d3NWGVCrU6Xb3GRoFj2I1qqf3pciFvvUWrV7oUv
         1Yb2AmUuJq+c7/wyTaKZlfjPoGc5LIo7Il8aK5QeZK55fMUejYcTXwMtL8NjB+mCtiEW
         PkKy4Ls1sIB/fGqVnh32lEe9W4Is497eMDIKIqrItnktrE/Si8WNWkyvjSmGwIL5yMBg
         KdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725443001; x=1726047801;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sWZolsXsCTYach8lH36h3ott3yh0cTGFzhMl58gyIUQ=;
        b=gwp65sSkFAcKan6gQNenYa0zasuWphBaGhAUI1dAnSZ/hkUIJPLMoaSRI41EQjLPQS
         zZdmZfinqzv3HfZGYvDK/bMYyjlD3w79Sz7zjou+ZzCv83584NdzoTjsrfFy8pRxLbNb
         074vYAaba/66V5Fwq1VQFzwruP2h129F7a35Q+KCZvJgZlEBmkJ1f8Xv+LtgZRnMdUmH
         EiGYOu+C2V95XWud0qb0SD2TnZ259ujq8R3Ek7ZtAQf/HcuH9x0jc3o/difAlkR73/ZN
         SSgLOxy1kUDid2RcdZ+AZE4Or7vVa9AX4VNmDl2SuUwHoV5/OZU4te9NP+MteHFPN8t6
         ppPA==
X-Forwarded-Encrypted: i=1; AJvYcCXXGToWfl+omsAqwA4ig0t/XqocM8+pk62pCg9aEyQbGILJ9PnrKlixDUHFdiq0q5HkpHwLPXxEF+8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh9OcBN88aGQkEJ4Y7pAZQoMz09/gv2RA2DE/c5VKQjN5EnTFw
	KUr13UswmzGlkjD1FcPJou2zyQvGvf88mOeknSMQT3DvR3h1OWX/eFBpicNaIpc=
X-Google-Smtp-Source: AGHT+IHQzzEaWIdg5FQFeuNQ9jdB9UOFp8iR16R1FSzfKc0rt/an2lTY0zgJAfLv9/Z5bc7o2LfPBQ==
X-Received: by 2002:a05:6512:304b:b0:52e:9b4f:dd8c with SMTP id 2adb3069b0e04-53565f22b01mr1327352e87.35.1725443000659;
        Wed, 04 Sep 2024 02:43:20 -0700 (PDT)
Received: from [127.0.1.1] ([84.232.173.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988fefb60sm788159666b.43.2024.09.04.02.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:43:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, richardcochran@gmail.com, 
 Michel Alex <Alex.Michel@wiedemann-group.com>
Cc: o.rempel@pengutronix.de, lee@kernel.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 linux@armlinux.org.uk, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
 Waibel Georg <Georg.Waibel@wiedemann-group.com>, 
 Appelt Andreas <Andreas.Appelt@wiedemann-group.com>
In-Reply-To: <AS1P250MB0608F9CE4009DCE65C61EEDEA9922@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
References: <AS1P250MB0608F9CE4009DCE65C61EEDEA9922@AS1P250MB0608.EURP250.PROD.OUTLOOK.COM>
Subject: Re: [PATCH 1/1] clk: imx6ul: fix clock parent for
 IMX6UL_CLK_ENETx_REF_SEL
Message-Id: <172544299910.2790271.1284838688580694607.b4-ty@linaro.org>
Date: Wed, 04 Sep 2024 12:43:19 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 02 Sep 2024 09:05:53 +0000, Michel Alex wrote:
> Commit 4e197ee880c24ecb63f7fe17449b3653bc64b03c ("clk: imx6ul: add
> ethernet refclock mux support") sets the internal clock as default
> ethernet clock.
> 
> Since IMX6UL_CLK_ENET_REF cannot be parent for IMX6UL_CLK_ENET1_REF_SEL,
> the call to clk_set_parent() fails. IMX6UL_CLK_ENET1_REF_125M is the correct
> parent and shall be used instead.
> Same applies for IMX6UL_CLK_ENET2_REF_SEL, for which IMX6UL_CLK_ENET2_REF_125M
> is the correct parent.
> 
> [...]

Applied, thanks!

[1/1] clk: imx6ul: fix clock parent for IMX6UL_CLK_ENETx_REF_SEL
      commit: 32c055ef563c3a4a73a477839f591b1b170bde8e

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

