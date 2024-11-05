Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018561D172E
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 10:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730802077; cv=none; b=gulNJYykn2STkLewtY8LAQyRIKaSLetr70+2sz+BSouSzIspD6Jo3APUJgi4XuMUZGRf0TyS1MSKrbeQ62pya3VRjC1euQ1KBY5r4GRXb+hiR/nQ0qAz8C+31oi0VvSc0Hbqd9BpDoxt6ety/MH0q/PXpjYVytTbIAWJVR4WYDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730802077; c=relaxed/simple;
	bh=t5ej7ZMTDzTltNF7X963OJIQrTWEDlW49GE1prreceg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=lmO5SnLiE0fNIF9t1XGXkEqv8J25IDFnh70ZN5oFfVsKv3DEwFYWV2LEPwD926n7nXd5+pY4KmPFPDKEgIjWc5245EyHPd+Snne5+CS4cvydRyN93La41XHbrt/bo8FjrxbkOnx15G0JUbsJ8pkGyszjBhhk4M5kTC/rJfIC2Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S79E5S7e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S79E5S7e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43161c0068bso44512755e9.1
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730802074; x=1731406874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=S79E5S7ehcvZpH4aucidonezD+vipqdymRbyXWS77zprE0vmRarFewbXDyP8YKyF0v
         QbfFn1gx8kiVozCFMkA02AWM5Oiw353nfGWJMEl3iA0PSRiIyF2tX5XvYg1AfgKh8NXS
         AhqX0ZLLGMbhxIZeiSc9KipKhkBu6ej0J7qBsHG5AMiVCEQboVyZ8t/SZYSYXQk0chzI
         nRKvIi7I34w76h+yW3Y9gsuv6TodLVtd5xM3Wu6GhkfXUVNDlGXkL7YErW0IawpTZ2oi
         zoB5k/CLo+NT2pZG2e5GWK8SpndKzDa56lh5A9j5TTs5QEthm4Y20vLU8ipqYPlA4mqg
         d+6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730802074; x=1731406874;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ArC80tKtjP3dBGGXx79noUAvUpR4S9jUKLPnbzjNTSY=;
        b=hSrUZtpzEKWxzD8mDg3jhm7zC+AcKp1kWLX1B7HXIkxlp/I4d+DTdbofGTTeYHP45L
         fZFH6GOtDDChCBEh6LK6NxB5s7ZRWnYeS81gJ2Oklvf5KNrTlNkk6CrWNCOumUf6t9NZ
         dqwVCa0zSP8Heub2KN60va4JPZgLCJ5gJ/xcSPdE65gRwr93hjXn+B0B4TTJrx5tsuZq
         6kDSQ9+EQiKSUU4u7m5FGd8GJ3chjnkdXkRAjjo9dx1dMkO9UO044q2LLJaZjRjnyyVs
         XU+Sql2rOBW8FhD+nhKFEM+rlOSCU2SdPT1JAtpWYIHj6bj67kjh2+s/eOdTMj/dGRaX
         cfFQ==
X-Gm-Message-State: AOJu0YwphjTsA79y2194uzS3b0K7szmU10RChgCnxhOz7sYsvDXepFu/
	vfhMRNboPh3p+AFd1kPnLacFa7P/HJgh98auQp1d85ID2PisxrzTNIiLne0FMaw=
X-Google-Smtp-Source: AGHT+IE2n92iA9zFLecVDleLRsQnsU2LzZqCh08NUKJAXXircidE3s23XD0vusQDwPGzqgQof5ziDA==
X-Received: by 2002:a05:600c:4fd3:b0:431:44fe:fd9a with SMTP id 5b1f17b1804b1-4328325118emr131647305e9.19.1730802074391;
        Tue, 05 Nov 2024 02:21:14 -0800 (PST)
Received: from [127.0.1.1] ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab254sm182319745e9.3.2024.11.05.02.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:21:13 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
To: Abel Vesa <abelvesa@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Aisheng Dong <aisheng.dong@nxp.com>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
 Carlos Song <carlos.song@nxp.com>
In-Reply-To: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
Subject: Re: [PATCH v3 0/5] clk: imx: scu and fracn pll update
Message-Id: <173080207299.1891569.12565190669016776250.b4-ty@linaro.org>
Date: Tue, 05 Nov 2024 12:21:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-dedf8


On Sun, 27 Oct 2024 20:00:06 +0800, Peng Fan (OSS) wrote:
> Patch 1 is to resubmit [1] with comments addressed.
> Patch 2 and Patch 3 are for i.MX93 Fracn PLL fix.
> Patch 4 is for clk scu fix
> Patch 5 is for hdmi. Fix tag not needed.
> 
> Detailed information is in commit log of each patch.
> 
> [...]

Applied, thanks!

[1/5] clk: imx: lpcg-scu: SW workaround for errata (e10858)
      commit: 5ee063fac85656bea9cfe3570af147ba1701ba18
[2/5] clk: imx: fracn-gppll: correct PLL initialization flow
      commit: 557be501c38e1864b948fc6ccdf4b035d610a2ea
[3/5] clk: imx: fracn-gppll: fix pll power up
      commit: ff4279618f0aec350b0fb41b2b35841324fbd96e
[4/5] clk: imx: clk-scu: fix clk enable state save and restore
      commit: e81361f6cf9bf4a1848b0813bc4becb2250870b8
[5/5] clk: imx: lpcg-scu: Skip HDMI LPCG clock save/restore
      commit: 92888f39193419c117e282cce7fd762ba78784a4

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

