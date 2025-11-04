Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10E02ECE8C
	for <linux-clk@vger.kernel.org>; Tue,  4 Nov 2025 12:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762257840; cv=none; b=POzwclKcgqbOBPv4rKOVzOjjrJ494VK/1BPpbJxRG0u3YnWEHi6KYY1OUXroVYEv0MMAQbvN35UphFmHvPWE58+Atqmc4CLEo8H1X6mm3CKO9sVXUh0uNif/Nt2SwGnuqqiI3l/UPqPEMqImuS+r1omVA/0q1A5M+RykClsYaL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762257840; c=relaxed/simple;
	bh=j0EXgrYnvVA59AWsBuPviuInGMrdX8MUdYFnXuN3nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=csuz2+XhTdRMvpNIuJkwhDAL1lX5RgHLdI++XOP5mxxga/QHSY4aSExpEr+gKHWJ9KQpjs4RECB/d47mH8Grteqs5OljrSQ+zV0oU7vmkWDSr+u9cTzOjqYXAOcU5KT3vkCuwqzKtcb4h5g0rjkknqoUgg50cFr0IKRSFp48Zfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLVBLjuT; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLVBLjuT"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b70406feed3so1227285666b.3
        for <linux-clk@vger.kernel.org>; Tue, 04 Nov 2025 04:03:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762257837; x=1762862637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=RLVBLjuTdkrv3mYRUgR7W8IF9vBK9wu+UToFWAx6wOYG4zZrlHU2/SmFnjrP5SOgMH
         g+lGWXMR0+nSQb9m75KuVNt0cWxKue4/493Zt/mzWwzIrIsYF53qlCNQQaQg6HljN28c
         VDA0cwsJbTiK5Iu+7aeF57yAV60CIWd/pQv0dAXVQiXasysKDyO1ihJ5aDvZIF58MFuy
         w1YoNTFXrdu8PhLi4Ge9nWhMlgQM+LgiDHFmsSgCvSc+qS5RRSJaMeY3sXbmNbs3iSJD
         m7miRS2QrUFlnXFa8gi2QkLlJfE27QUNShjLXzzlChBRslBTogSM5d6NZT7Lav95eMOi
         jjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762257837; x=1762862637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=XramL7UVa75pHVZAXZWxyJCuhApcmfLJZ9UOaweR/vtfmBaVwLdU9ruN/ic9hRKsCF
         tsUN/DRAPxBta2bxPJnLwCfd1/a1OCfG/oSalkSpcf6vXjaNCLaT6x37Xxk0ATIaf0hh
         Tv7hSmDvgfvzJ6ATsj3O7ohpgo1TUdDcTYfe++pAxM1EQJiZNaAS9KZkGYvAd4ExovBU
         moXoR3Se2RR4tiLWaobWunPNfyte5IHX4mnbrZxWCylBcBpmP/Hs3mviYM+wWr9of9/I
         7L9rpZ6FXChpmyWk+ua9xjxW/SScbjee1TNsFP3/qXa29z45s0IgogxrWaNZ9dblJfYJ
         l3qA==
X-Gm-Message-State: AOJu0Ywi8rlbyLgsZOMBdGGNsmHBF0UXUnPVBMy0GKAZ8LP27g0py10T
	FyVaigzlrftxHNaBd0FfrqI6zX4PL8G3s4PvlXapQZbQnpwRH2JpxEIX
X-Gm-Gg: ASbGncvwvBTdOUk22knYPapTpN3hjxs6HBL7DSbAzTA8nexREEZkuhkXjG58ymb6MkC
	YROf7MOb4P9QgAAF6fNUBHsOJ2Zzp/b3Kg0YLkB+tDfGZDllFUqbIdvKJGToNSYlMQksZAzAQre
	9+/fJngt0xt80IFDgz9pZ2C37ZjyTxzcaNOJIplcCdZ4eXg5VinqOVYIT+JCl32ezt7+J9jslYK
	fXqk9MKZ2RG4qG3bXkpo7q0tijVcSKodlfNt33LWCtNsnB9dZlRTFR3B1fLQgxVKN2aXDatGPNv
	aYNut/DmwnhLyE1kdzCdckXIUs4z3dQMEHBtG6yYgvKPwiKRwDhTh57LdP6AvuMtS4kpRjQaFda
	SXYrbMsIKCHwkJGYrteS2mazIthhHdm207Fv9oBTUxSFF0Ep9c5vj9VQLta1W0L+ZPwOICCK6K1
	sS/A83C5nr2YCk6d0N1GmMqMAVRw==
X-Google-Smtp-Source: AGHT+IHt2fE/H6FCE9dPp9U8nFD+BbuQEZr0YcTeeDYKJn0Q0W8ZsDGbQTHbvxjqtH0OMOcDf7SSqw==
X-Received: by 2002:a17:907:9484:b0:b40:da21:bf38 with SMTP id a640c23a62f3a-b70704b654cmr1611290866b.36.1762257837013;
        Tue, 04 Nov 2025 04:03:57 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723fa038e0sm200894166b.54.2025.11.04.04.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 04:03:56 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v4 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Tue,  4 Nov 2025 04:02:54 -0800
Message-ID: <20251104120301.913-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
References: <20251104120301.913-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0

