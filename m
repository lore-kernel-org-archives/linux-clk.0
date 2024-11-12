Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D698219E31
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 21:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731448437; cv=none; b=DkxL+bb/MxNrQ8EzuKi+I1Ov5MzMskOBJKSB08nOqG8ktB19qreCIiElu95SpmXkPGGN2c0O+g+Ic5EX8YSNVXMoVTsT0d+x5/ItQe1ZWX8z+yp3RazqSpKZIl4cIUvJk9KaLLKBhjKboUVn411VRLoPNZEVC4710dZ+lVxWE+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731448437; c=relaxed/simple;
	bh=/zzi+Sm3IfKmepVKvgtCUfNCm1ncLHSViZHXYjpxNjI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DM33xm1hKVOcwVDbJPz8GJuonGVJL3p9vB/c25hu8lAJ0KqfsEqRNwoX+IlJwZmA7Dz6N1eIY45a3W7kMbAzVxdDJCNFBez9nyfqHfUrrqCvAuus386ZzlrtNf3FuaGTsArLL/p/iwQAig/Z1XflYx6dVT2+wZXDanbRvoqljxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=quIs6HjE; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="quIs6HjE"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 248EB894B2;
	Tue, 12 Nov 2024 22:53:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731448427;
	bh=pNcgNPQUS5w0e2xKLQNX2Q32FCLJRV3b3KQ0eTd0R5k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=quIs6HjEPhWbHZZO5Fd0JVWw1y6YB8bAEzDt8tGe+NJuQNCS6lFXVGmzSTlGie/dD
	 Aw7u6x7DNAO2JMpLJU3hMsYz3SGP5KJUW5QTjPTKScP4e6WSpw7pgopn1rtihPiR2a
	 sqSCcVNR+REIoEsFApgikIteur/9Phrc7SwC2p5Tiv8kIS8a3cdla6WFlkC14TP9LX
	 EcaupzPEX71WNKHgHBILE/4leawvI+jYM8gOb1b6vd7+MZiAGlEsvEYwZz9Npv+sL7
	 Q5T2t5tksanbPr6RCIEaUoqewzJu79OtjKRoBA/hX+L1WR+YH8Ohvm5VBf7f0g4Lr0
	 m028EPCXj75eA==
Message-ID: <0a62d3b7-b435-40cf-9795-2fb4ea80a693@denx.de>
Date: Tue, 12 Nov 2024 22:27:09 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: pll14xx: Extend dynamic rates support to
 PLL1416x
To: Liu Ying <victor.liu@nxp.com>, linux-clk@vger.kernel.org
Cc: Abel Vesa <abelvesa@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20241111214516.208820-1-marex@denx.de>
 <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <e58af9fa-f1b2-4d1b-8ca3-d256a7dee4ec@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/12/24 4:26 AM, Liu Ying wrote:
> On 11/12/2024, Marek Vasut wrote:
>> The pll1416x PLL so far only supports rates from a rate table passed
>> during initialization. Calculating PLL settings dynamically helps in
>> case e.g. multiple video outputs are used and they each need their own
>> separate source of accurate pixel clock on i.MX8MP. In that case, e.g.
>> PLL1416x PLL3 can be used as another Video PLL for another output.
> 
> Just want to point out that i.MX8MP audio AXI clock is supposed to be
> derived from PLL3 to run at 600MHz in nominal mode(i.MX8MP data sheet
> specifies that rate).  So, if a particular i.MX8MP system doesn't use
> audio, PLL3 can be a free clock source to be used by an i.MX8MP display
> pipeline, otherwise, video_pll1_out is supposed to be shared by i.MX8MP
> MIPI DSI and LVDS display pipelines.

In the end, I started using Audio PLL and Video PLL PLL1443x for 
accurate pixel clock generation and PLL3 to feed CLKOUTn where the less 
accurate PLL3 PLL1416x is just fine.

With the disparate display requirements, sharing one Video PLL for 
multiple outputs like DSI and LVDS is unrealistic. (maybe the next SoC 
should have some nice PLL per display output)

> Currently, IMX8MP_CLK_AUDIO_AXI_SRC's parent is assigned to
> IMX8MP_SYS_PLL1_800M in imx8mp.dtsi.  Although it's rate is assigned
> to 600MHz, the actual rate is 400MHz according to clk_summary because
> the divider cannot find a ratio to reach 600MHz from the clock source
> running at 800MHz.  Looking at imx8mp_audio_axi_sels[], sys_pll3_out
> is the only free/appropriate clock source that can derive 600MHz audio
> AXI clock from.  Maybe, someone will change IMX8MP_CLK_AUDIO_AXI_SRC's
> parent to IMX8MP_SYS_PLL3_OUT ?
Is the 400 MHz sufficient for audio-axi or does it have some negative 
performance impact ? If the later, better send a patch to use PLL3 for 
audio-axi .

Thanks !
