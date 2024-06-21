Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A88C16CD0A
	for <linux-clk@vger.kernel.org>; Fri, 21 Jun 2024 20:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719001335; cv=none; b=dcHUC2ykXX9oF9fSW3aI+A9Zm8oEZBalrppK0zHptvZW2eirPSeSMAZIhhjOlXPeR7jQPJFYbsIUvMgYu04u2ZPjVjd+NpPlqqXvHC/FP4YSax4iWxPx2LYtevsPb8G+3LclwSvoZ+JmhAaIt9/4SxEOa//lOpOtK96AzFyG80k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719001335; c=relaxed/simple;
	bh=uT47aGYaeA7E5gF152nqCcmCnTiYQfrvoIFO/51YbsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nc4DiDnl82UtKHVj7wrBYcMnE1sZD156Z8uZo9kbpeSGDpMVoxZy59Uj5SItk2m/MedJIwvb7FCw4DJmY5DoGd3+W56kcId89eyqiE5oOdBsDUWeEdW5+FjX+mBqSwFu7NBLBnpTpWPCrnZP03MSQf/EUiQm0afBUIPcH5IJnGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=PTcDBvjf; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="PTcDBvjf"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6313587D10;
	Fri, 21 Jun 2024 22:22:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1719001332;
	bh=Lp+0MWXiYZu8vEEJX5UevTIsfmd+jlIe7gyXaFfc2hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PTcDBvjfzihuICx2+7VHZSVhehHv7XmYF9TbtuDEvV40tobb+fC5zNHjLR+v8zG9n
	 aeHg7kq3P0JohRU0xs3PfMCt/l3sSiiVCQzIkCdUHq2z3euz1atljG3EAPempX/X8S
	 Frd1w12zoCdaF9pRD6cvnKRxXUrwn98yyyDVczIEp+XC71OoXOMvr/XSzbT7ukMWc7
	 0jTJmCH+0/U6Ld6smkthdL9APvJlH9CHK7wNi++MgzFQ57XsPFLAUnsEtFptzP3ghD
	 dw0qoe37wLsL6WxcpxbKgLRsfEdF/s4XOioXwRwSj66ALTqeVWS02qv+QRIwy5LR8C
	 YY1NqZ3GjPwUA==
Message-ID: <a2d7ef0c-e4f7-4029-9f4f-27eca47d3573@denx.de>
Date: Fri, 21 Jun 2024 22:22:10 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Adam Ford <aford173@gmail.com>
Cc: linux-clk@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
References: <20240531202648.277078-1-marex@denx.de>
 <CAHCN7xJA2i+k-n+02Km+83YXVEse=NDR_KmwQzhdTmCAJkP+BA@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAHCN7xJA2i+k-n+02Km+83YXVEse=NDR_KmwQzhdTmCAJkP+BA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 6/21/24 7:52 PM, Adam Ford wrote:
> On Fri, May 31, 2024 at 3:36 PM Marek Vasut <marex@denx.de> wrote:
>>
>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
>> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
>> Allow these clocks to reconfigure the Video PLL, as that results in
>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
>> clock accuracy is low.
> 
> What happens if you have both a DSI (IMX8MP_CLK_MEDIA_DISP1_PIX) and
> an LVDS (IMX8MP_CLK_MEDIA_DISP2_PIX) display and both try to
> reconfigure their shared parent clock when their resolutions/clocks
> may not be the same?  I looked at doing that for the 8MP, but I was
> running into display issues.
> 
> For example, I was trying to test an 800x480 LVDS display which needed
> a pixel clock of 30MHz, and a DSI trying to run at 1920x1080 @
> 148.5MHz.

I have such a setup on my desk, I ended up putting one of the LCDIFs on 
Video PLL and the other on PLL3 (spare unused PLL) .
