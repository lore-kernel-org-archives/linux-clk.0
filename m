Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 175181E7C16
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728489448; cv=none; b=l5pyYgjW2fMQmyJy7+KSmlsttbcNq1RWgFeJx8vQOU9vAdHBtaiRS+9bBAIdkeAEROYL9xP46bstwXeWRnFrVtihIAMy4VbkrMleGq7tgUw48EuWO4m9DZvuJWXIQmcyEvUtc9IjOHb/Nb+TCtCpT6sy5xQLa5VEhDI6RJ7YMNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728489448; c=relaxed/simple;
	bh=vrhvjbhG8OdVFx0NG+PSXqXho24Jigne611qnWBqko0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slqCj5g0wGJJqvD5oWuazSDQGjtQ23aj52zBTBr4qcA1fiHImTRseOAv78aeyNawuZfftnQ32McyBWp4X2tps8NZfB4Ct9bLceDUEl1bWuzbI5dxFQ+PnIOTwPpHeyyx8qjvBw6zDyk8jP//GjDbhhczzNVSJ5YfFRMgcRp68k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=YZ5+vt0I; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="YZ5+vt0I"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B6EBB88363;
	Wed,  9 Oct 2024 17:57:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1728489445;
	bh=OpXxg2HPPb36VzEMRGPP5fuLV8xBG/0keikb0GF3PJg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YZ5+vt0IlN4+K8ecx9YKyGYBP41Z3aS0CIQCawLFxQ+OAyPcrwRZNwtwqDjtcIVRg
	 kHk9cKLUq9NFkbD1h29FuXpM8DdKM21Bb6qHV/9AYc5/eSFrMfRLMUIbdN1CC9iWXP
	 N7GMBJAVcwh7b0KzwiQdt2K2QD3B1QEiCi8kiT5TXCrvFDCKGxCLDKArfeDc3NFqgf
	 GrtSJNTpTqa023X2WxquD3zrMiYfQYhy+yphmVXYGE3TlU+ujyxY51nPMWMJXrEIPr
	 ZtNMkwI2/LJjaEe3iS8K+rOUWn34uScb3z2ohSgzIjfKIZ/bgoLU6Nn20iwhXIrAaJ
	 veu+S5L2FKetA==
Message-ID: <8b38fbb6-50bd-4135-8737-aa174c6084da@denx.de>
Date: Wed, 9 Oct 2024 17:43:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
To: Abel Vesa <abel.vesa@linaro.org>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Isaac Scott <isaac.scott@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Robert Foss <rfoss@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Stephen Boyd <sboyd@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 imx@lists.linux.dev, kernel@dh-electronics.com,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20241008223846.337162-1-marex@denx.de>
 <ZwZrtajvhpq50QPH@linaro.org>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <ZwZrtajvhpq50QPH@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 10/9/24 1:40 PM, Abel Vesa wrote:
> On 24-10-09 00:38:19, Marek Vasut wrote:
>> The media_ldb_root_clk supply LDB serializer. These clock are usually
>> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
>> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
>> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
>> results in accurate serializer clock.
>>
>> Signed-off-by: Marek Vasut <marex@denx.de>
> 
> Any fixes tag needed ?
I now replied to 2/2 , I think this is feature development and should be 
applied to 6.13 cycle only. I would like to get input from Isaac on 
whether the DT fix I suggested to them in the original bug report also 
works, and if so, that should possibly be the Fixes: patch for 6.12 .
