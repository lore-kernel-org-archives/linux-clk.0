Received: from mx.denx.de (mx.denx.de [89.58.32.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40411B0431;
	Thu,  2 Jan 2025 13:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.58.32.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735825729; cv=none; b=MwN5AuoOsdWlJKHkS8h3ON/xORn52pEGKNt3T3adQeqGDuDfWfGS7oCt6ANabGSdBtFU9VWVXrdYE4NbTbLGJHfACZfKXzlaXjH815d3kcprXFB/7NqgN187xse1PYe7k7JNXA0iP9bWB0mpbQmPsqWm0rIecayd/L361XhcSkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735825729; c=relaxed/simple;
	bh=YtSzit6LoCB7tcSX2rplRffugEkLd1fkOc5/zoIy6sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L4qMIpWRo8mjParXZAWZlZO5DjPnnrB7FTTe/Le5uGjoRiiLG+6VFjSgm0Uj5BgUBIMnkUhwaKOyPZW7kcWKgBqmDjJeCAN+f2iyIUTJFo2UFbs061eJcZylVpiP6ZBArsXC3IA9J5v0iMlb3Hl98WWNcnT8/PuDVJnIle+Xq24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=elAiaQiB; arc=none smtp.client-ip=89.58.32.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="elAiaQiB"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED0DA10408F8C;
	Thu,  2 Jan 2025 14:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1735825724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=15t9ZhyD2EL60IMfJo8zc3aw4cpOSTR9eeiviG1C6FM=;
	b=elAiaQiBbNVs1rHp3/n7UySU9eOa3ejxvBMQi9aK5SOranx5nJwBM00HYZjkihIXBpt9LS
	wpWHaG6x/8ZS7nB+h17UOGZE72i3QtZbPOK89WBQAs/55hEnx2b2/90jM0SKs2o9xX3s+3
	fE3epddAp1qHUobmLdZK8oBC018joYaT/RhwwkTlFd7lr2Jf8S2LObB3vqqLEnStD3do22
	bcoug9PjG1X1MIRIORPskenKAhjd1JNDZzkajNknQtMxOPLR75vb0ZvqjcJJMwR4+pUQU1
	/NenP4oI3pe7UVgB8cKxsS4D5vx0UIjQOMC4y6MBhV/1XcR/z/nNsj1KwQd8Lw==
Message-ID: <72d4c42a-7ebf-484f-839b-631d61ac950f@denx.de>
Date: Thu, 2 Jan 2025 14:34:29 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] clk: fsl-sai: Add MCLK generation support
To: Michael Walle <michael@walle.cc>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-4-marex@denx.de> <D6OVE2W07NDX.2Q4AFF46TWCWJ@walle.cc>
 <36665ab9-16de-4f77-a55f-b7942dc0c1bf@denx.de>
 <D6RHZ8B051X5.3NA8EAPRI62XS@walle.cc>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <D6RHZ8B051X5.3NA8EAPRI62XS@walle.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 1/2/25 10:58 AM, Michael Walle wrote:
> Hi,

Hi,

>>> ..Which is the
>>> normal use case for this pin. This driver was created because the
>>> LS1028A doesn't have a MCLK pin, so we've "misused" the BCLK pin,
>>> with the restriction that only integer dividers are possible.
>>
>> I have a system that is wired a bit unfortunately, I need to source
>> codec clock, where the codec is the clock consumer and needs to be able
>> to control the clock (SGTL5000). SAI MCLK is the only way I can get them
>> out of the pin I need, hence this patch.
> 
> Which is also the default case, no?

Not quite, there is a difference.

If SAI (audio driver) is used to control the MCLK enablement, then MCLK 
clock is not always enabled, and it is not necessarily enabled when the 
codec may need the clock to be enabled. There is also no way for the 
codec node to specify phandle to clock provider in DT, because the SAI 
(audio driver) is not clock provider.

If SAI (clock driver) is used to control the MCLK enablement, then MCLK 
clock is enabled when the codec needs the clock enabled, because the 
codec is the clock consumer and the SAI (clock driver) is the clock 
provider, and the codec driver can request the clock to be enabled when 
needed. There is also the usual phandle to clock provider in DT, because 
the SAI (clock driver) is clock provider.

>>> Also I'd expect that the imx
>>> SoCs already supports the MCLK for audio applications. Isn't that
>>> the case?
>>
>> That does not work if the MCLK has to be enabled/disabled by the MCLK
>> clock consumer .
> 
> Why's that?
> 
> Don't get me wrong. I don't have anything against this patch, I'm
> just confused, why that isn't already working with the current MCLK
> driver as this seems to be the usual requirements.
Which current MCLK driver, the SAI in audio driver role ?

Does the paragraph in the middle of this email possibly answer this 
question ?
