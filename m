Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9EB21A4D0
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 23:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731453261; cv=none; b=Hh7pI9b1BnzgPT09vQyYbhC1CHh4KAw+hwLHT7M1yn4+QyAKniSID7a8MH5m6SsKTKcqmJdf4un30r2EMS8epL6s9s8CIaNkWWWkv3esTu3A5Mh/sVgJ1TvIFR1mFs7z/wqUMQA+Q4gHeIN6KXuQ/au/nKEb51uLdXry/TBA6dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731453261; c=relaxed/simple;
	bh=qF1EDFqGqqkIaKEO8cUb85MsqljnjleP4v3W6xE1Vxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKc4EtEXXVzrGg4wezOabZ8zkyWjozitwVynGfnXWIo/S6d5U6/HMRE2f5jijckw9Wt94EuhxjH5ccWTjNhMMQVJR7kY04BIT5ycFPkLSl4WLgMVGtYdlaUAMJeNTqN271QH5XE1+CU/9JoGPSUJ8h6AJRyBEM13phCamwmieqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=QZMvF45l; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="QZMvF45l"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B6B3588DDA;
	Wed, 13 Nov 2024 00:14:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731453256;
	bh=GM+Qq0NLS8qp404vTsp4172kiQG6SvHt3ggmFCSEXkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QZMvF45l8rxPgQgwVrybJsI6dbNYgMVLtClcyFvNBdTrOeaA2fPIsWvvRaQukexlX
	 swQP+gOI8yTJqxtYyusJXo1YKHl1VBwuOs3sirl1CXbKrf6rZ12StuTyiIeFUi94xw
	 Owa4o7RGI+HmjN2wIUMrMFIskf2D3eGEQwR0Pe7EQiZSkTeIE+P0yxuyZ70Z2nEjCf
	 GN6sd3TTGsX7fCnYVR0if4mRRvCG0OpBdAzJg2x/z66OpOZeUifqJZxputmunzuevy
	 4iUPtEPhW7Ln1UX8a8q7zeKJYDvMZ49P3D/f+vuAhVPudAfa3KpLVSxZARfx31CQmO
	 cvFfb26zNvfew==
Message-ID: <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
Date: Wed, 13 Nov 2024 00:14:15 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-clk@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
 "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20240531202648.277078-1-marex@denx.de>
 <20241112234206.558d5d5e@booty>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241112234206.558d5d5e@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/12/24 11:42 PM, Luca Ceresoli wrote:
> Hello Marek, Abel,

Hi,

> +Cc: Miquèl
> 
> On Fri, 31 May 2024 22:26:26 +0200
> Marek Vasut <marex@denx.de> wrote:
> 
>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
>> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
>> Allow these clocks to reconfigure the Video PLL, as that results in
>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
>> clock accuracy is low.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> I'm afraid I just found this patch broke my previously working setup
> with a panel connected on the LDB.
Do you need a fix similar to this one?

4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 
frequency to 506.8 MHz")
