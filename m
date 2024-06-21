Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C315624C
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951903; cv=none; b=Ih7mqHyOBu9ieWcpIcHB0+MiOec5aMKoPV5jpAB25S9RlKC5S3pqcvyqEzQz4yu8ZmdcIjxkkDd3VJfHkmDbIIaDMpTPvFlCF6DSEkQ4uSHTG43d7db1mZCeHki1VDXKLxqdDBXDEvVGrleYROuK/lpwharOywGQb7sUu6OUnR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951903; c=relaxed/simple;
	bh=IXZaJwoonaXAaG8nRSLWn+rv7pzccaEi+tHComAcTnA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=SHwqYdNTXwmrHbsas22PbaE3TST3MuCL/t07p3mGiM5jsZqHmhZayVofYWXCwqfzCM9+52cWZOgfD9KSZhyGfAXWl6FwlWG4SNYpkVrdtzPri6dtn3ROKZ4B3xFIkMe0QlQlac/Hx1Z/Kpiyje9XxaHj7V9Ik9InfbotnJs3kDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M31VWUOe; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M31VWUOe"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-421f4d1c057so16001545e9.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Jun 2024 23:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951900; x=1719556700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bjXqcRlv34M001faSimJYUquwzCRuq58MB8h3usWsF4=;
        b=M31VWUOeSXLT1h/DBcG0O6RhprZcTRoZLKE69iPsMlpeyw/Gl09otZfuwdVKcuKBbm
         UVptyREkmjlnX4TJhAr3Z8HwLZSGY6ZAVUI1UsqWZ9U0hrT72kYTxXKyRqZX0ZXCwPhR
         2vX+y+6RsQs1y0q59c1QJavv53wdcgeXOAL9xLvpXjcTpjmCO41sSgCk0yRBr7snmsqU
         41H5bdHuZCwnLYJ3pbR9JHLrZ8zjKDd2+Ydr2C5hpAgkju1j+kskTjrZllNlBbtSElob
         +toDSxL8353cqc/HkAG/l5IgsgsLhWqMsztISyWp/YumZa8u5PN11BWTUrmf4RWi7Iir
         8uXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951900; x=1719556700;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bjXqcRlv34M001faSimJYUquwzCRuq58MB8h3usWsF4=;
        b=LFoGJR89mil0IzSnEPOgyr0ZHuRBQ1hggV3moMg8gGVaWyPk4D2Rc1pEjxUioyZZq9
         i9yez6o/h4W1P0nVrYQiDhxoVCM+ufxU2YtBFaOdKZgG+Ai/xBKgpHqgwV75AplqSzpG
         cFLv3mZvzOrNoasBG4CRjuaYQpeGgQNc4sPB1IQWrbH0wbqslEVgxAC38O2/iQWXu9Hm
         DDC63Z+o0+inLgTzb9YWYLC/7YuljqUutsBR71vTYDazJhBes2ndSdQB7IXR08F4kAds
         oj/G5e4PWuS4pPamHh7TmDV5jD3lmnktlEjp06QsqRhBV65tEKZS65faX+O0YQolzMcl
         rR6w==
X-Gm-Message-State: AOJu0YyybUvlxVlTwMF7x8N0cTVPndz+oe8PeFu/0+q35xskpG2da09l
	lgDO0URVslb93VhDmrcBMv3fZv76f6LgxNHp1GWeDjTLgqatD/HezpsymXOO5kg=
X-Google-Smtp-Source: AGHT+IEiWE3LOwtpN12PBZwo+HPa101V8ycfDZ32up/OGnZ40ETADhDqdiNS1elyZsP4oUBOaW75YQ==
X-Received: by 2002:a05:600c:3b8d:b0:421:7ac9:460c with SMTP id 5b1f17b1804b1-4247529a970mr54295265e9.39.1718951900172;
        Thu, 20 Jun 2024 23:38:20 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d2122e7sm51100865e9.40.2024.06.20.23.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:38:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: linux-clk@vger.kernel.org, Marek Vasut <marex@denx.de>
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>, 
 "Lukas F . Hartmann" <lukas@mntmn.com>, 
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20240531202648.277078-1-marex@denx.de>
References: <20240531202648.277078-1-marex@denx.de>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
Message-Id: <171895189899.3641239.4256976969663530341.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:38:18 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 31 May 2024 22:26:26 +0200, Marek Vasut wrote:
> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
> Allow these clocks to reconfigure the Video PLL, as that results in
> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
> clock accuracy is low.
> 
> 
> [...]

Applied, thanks!

[1/1] clk: imx: clk-imx8mp: Allow media_disp pixel clock reconfigure parent rate
      commit: ff06ea04e4cf3ba2f025024776e83bfbdfa05155

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

