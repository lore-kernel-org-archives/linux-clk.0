Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768EF24503F
	for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 15:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319351; cv=none; b=lVrHT8DUd0fj8Z0aYA1jaSMl5dqsnUBFxTiA0C6BeHOj+kiUjcMuDAJb4LLjflKylDJwOjwpxx3GbdG5KCKM7Zlaimxo2rp3g8/hS4EhA9i2udHahYAUuV1mPUwZ/SXZf1GLpK/Mw1wnZtwn251+MMVwVSp/CM8MYyiiTWqYGl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319351; c=relaxed/simple;
	bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HpvHtnZtH108t8zl7uskk9drnDba+Enwmtedc7p4AvCz2riJzFUnN/rAS0drdDrQ2A2DOjcWgYk9hpzMztZiEnkU/3hWEgxHnCwmHuEhN+JE198k4ojfjjALXe92tRWemVRNteyN/BW2lD8luAoh18Dv4X8arTuRkyWiMMwg16M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpLJAg6q; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpLJAg6q"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-11f1fb91996so447764c88.1
        for <linux-clk@vger.kernel.org>; Tue, 13 Jan 2026 07:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768319349; x=1768924149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=EpLJAg6qn+XEeGomahvnwnwTH1SsGUH2IkEnFZDPHzfjXOCAGYmIzhwisNw0Ji1z2f
         jgJ5N7E+qtd6CBYUerqddp7yEoqIAMzctbi0BTWNPf9KZrILqBGmk4yw6zM9o/t8jYft
         NfP1Ch7Mn9eWn21sU0jUi3vd+AbllqecE/114AdueyleJ2oAC8yIA7LSqsTmTFlUEPiA
         D2fYv7EVgRzgsoDsYyNgB9Ld5wZ8CEbc9GIssqBv1zeD+tptYP2CDYxGYHkwRLdMLacT
         vxDaaq/19KW4Y4jBaMwdz3uwqWvUP+D9DaN8bwZwOptIQWAY2FnKkyMWEMBGNCLDR7Uy
         iodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319349; x=1768924149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L3oLbFvwOOJts0UzMwGyJmDUy99A1kmDLLXXtP4qNCY=;
        b=t3RoZdzadnFLouoKCpb2nIOzi9fWqHFw98sYEitWlfMy6/5bq85WeEpavNSUUE1yyJ
         4eudsZ864odN8aalo8rQH/cmXq/2/xXMjbeMO7GiXTKLxpH+eqnxkvX3uRfS96hQiD62
         1riWyfrt6arrq8gZvjah+ZQMrj/bS76cUyZc55gkQOdlCCkoPt+QqvHdSw19EQEyBfjs
         17jyqlg9tmDJF0jFyl69KGcU3xbwp8ZS/Nv70U01hpWMdzhPO/0XZjzNyhDpkvTZ/fod
         CyRBLH7tA8tsT4LirwJ+8FWRvB+yfGFn9+cFJ4XCfI8U/Cmw+eJpfjj45vqRRCTHDVDn
         vNkA==
X-Forwarded-Encrypted: i=1; AJvYcCW6Ylucx/cS1oPLoLNt77jLJhIUJgCWL0sb/AF8a8DcOT8/qv6G/lODZLHfMWMboQqy2orx8hPZEiM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz60lmpbvQyIHkyobKXE1LCZcMUxbLyvDmAvPZopYjInZYPrzCO
	Ri+7QIdrf5tY2Mwfb4w21X7Xwo6hjxWQAftGzdw//Y1ZdkiBvRtR2/G4uErFHsWxNPbSA11m2dW
	KtqsNsiGmJNpnpttNfKNcPLibuflMMqpReJ5l
X-Gm-Gg: AY/fxX4hMrZ+ACgwbruifbRFcfmNKApYNiYIx7euCUXGs1ctWzuR2MrSJ6g0eYmhCP6
	sSQ4H5IVL5L1WTrhTJt7ebDahgLpfZcNEdkYnSn1FK2pRzZvQaCJFK3FrA4GIJiwIEQRKzPeoQS
	dF7esY//GInSo8qwywnMdpy+x9IBjh2RtBpLvzWxMYL4jbaDRpjWAujt6JL8aXzE65Z5HY8qVxg
	gOAvVr5rJexoCRPeF92SIz7pDs77dWx9P5esmlbCknLBqaOpJYWE/eSZZyAD1knOjZE01BLk190
	IDoTXRFMOELEm7KW8G0q/wh9GcFpVPgCnDi0catKwPewIBU3u5Nps/elxpoPVCX0IS14ppsjU1X
	8YjTcfw3/LX/ZLKmK1MW6
X-Google-Smtp-Source: AGHT+IEtf3xHFMK7bh85v7wy+tj/RylyAyqCoV9aOeql1xusdXvXq6rsq1/RBjQjsVrrgZEZyOQmOhuD4FnrB8WmMNE=
X-Received: by 2002:a05:701b:2207:b0:11b:9386:a3c1 with SMTP id
 a92af1059eb24-121f8b750d4mr14170039c88.44.1768319349465; Tue, 13 Jan 2026
 07:49:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113-v6-18-topic-clk-fracn-gppll-v3-0-45da70f43c98@pengutronix.de>
 <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
In-Reply-To: <20260113-v6-18-topic-clk-fracn-gppll-v3-1-45da70f43c98@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Jan 2026 17:51:38 +0200
X-Gm-Features: AZwV_QiQSE65KDDt7M1WU-fsU0Y3sGYlf63F7cu4HgA_-IsmphqZd0FRyAjQOBM
Message-ID: <CAEnQRZCUJKmH5TM9F9zMHpTtZ8K55bNL+7AtaMysyaCBru3wug@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] clk: imx: fracn-gppll: Add 332.60 MHz Support
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Primoz Fiser <primoz.fiser@norik.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 13, 2026 at 4:53=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.=
de> wrote:
>
> Some parallel panels have a pixelclk of 33.260 MHz. Add support for
> 332.60 MHz so a by 10 divider can be used to derive the exact pixelclk.
>
> Reviewed-by: Primoz Fiser <primoz.fiser@norik.com>
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

Acked-by: Daniel Baluta <daniel.baluta@nxp.com>
