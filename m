Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F413B792
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 08:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735289122; cv=none; b=K8luWAoGHDX8nFVKyQfWfwaG3eQYvfLNCpvgzP6y4zPydsBN3PBOGCF7uKfgqiAVZH2ZYLLwLk/GT9n6ZFhZB9+VSvkUljGBWp0/DpsM+V0WeleGvg3Ml4yZbRM+hTUrqgtSisxIwLeyXWd+MTIvQ3vRvLB8O8fqVQvjTzVyBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735289122; c=relaxed/simple;
	bh=CLaRTwNrBEuvYmMR2ZHeWDlLDsqiojHM+Zpk2bGtvqI=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uWggnWjtx8nipE9iiuAJmldnU9YcxTf5JndGssUiUD4uYp9Iu6uMp87CBwI9sEk0hj3CDCZqJgcEWTI65INgd+wUq/oYRXv+1nKzD88MzNY2bbbejIAEcWe78v9bnH7BjhSqp5lBtRv3NUkhYPHJnIMv3Mrv5MoJ8Nqou4DUiro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com; spf=pass smtp.mailfrom=linumiz.com; dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b=NDNJRDDn; arc=none smtp.client-ip=35.89.44.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linumiz.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linumiz.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linumiz.com header.i=@linumiz.com header.b="NDNJRDDn"
Received: from eig-obgw-5009a.ext.cloudfilter.net ([10.0.29.176])
	by cmsmtp with ESMTPS
	id QxWxtcN3eqvuoR5y4txCga; Fri, 27 Dec 2024 08:45:12 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R5y1t5OIblDL5R5y2tRRpg; Fri, 27 Dec 2024 08:45:11 +0000
X-Authority-Analysis: v=2.4 cv=LLtgQoW9 c=1 sm=1 tr=0 ts=676e6917
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=NEAV23lmAAAA:8
 a=oIXfh7CG2JD6673A1wUA:9 a=QEXdDO2ut3YA:10 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CbHybnIOXmlSwaXNoaXYOUqH0/mYuZ8kkjuKjW87omQ=; b=NDNJRDDnw/y2q/XpMHCG2FL1sK
	oITjouXaGaiFTHEqjQ1JABwZmQ0zzYnzoflffHMbU1Pjkj15KTHaR7OyQNyL4t7Ldkku8gntKicsO
	nFBwg3skiPmnF+9QeKVeYfiIZjA+tjRroZ/t8+gAlEqXfTdHol7mNAYzGekP6uIRKCy7HdIfVFqgg
	nnm+VYrMucoVSeE+0O388Pz3oumqegJkOKSsrN/SP8rkh7MgdPwt86JlP2uH5MgmOvAAYhmVWmWEZ
	0y7OPy/Uj+4Z58HzetcOlpOv9tfweAhraj0p/KWJkKCX5dSIAHFhLZYOLEn0CGAUaoJdk1pbK5LvK
	zh0wxk8Q==;
Received: from [122.165.245.213] (port=48506 helo=[192.168.1.5])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR5xx-003AmV-0N;
	Fri, 27 Dec 2024 14:15:05 +0530
Message-ID: <9415ca9c-f303-4507-8cd6-cb08ee09e988@linumiz.com>
Date: Fri, 27 Dec 2024 14:14:59 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: parthiban@linumiz.com, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 stable@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: a100: enable MMC clock reparenting
To: Chen-Yu Tsai <wens@csie.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yangtao Li <frank@allwinnertech.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Cody Eksal <masterr3c0rd@epochal.quest>
References: <20241109003739.3440904-1-masterr3c0rd@epochal.quest>
 <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Content-Language: en-US
From: Parthiban <parthiban@linumiz.com>
Organization: Linumiz
In-Reply-To: <173124139852.3585539.10704015898700065278.b4-ty@csie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR5xx-003AmV-0N
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.1.5]) [122.165.245.213]:48506
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 6
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNLN8yl+7QwPEYXtm8Gyy2PPTJCMWWSVyK6oPVdVdHymxH2rv34/83F/n7K3NEwIRZ45y81xSnCPpe+rqG96XLkagCw9OPd/qf9LKnX+tH3lyqP/Yq09
 lydIFaG+MaThXC2+LQ7+U8sUaQ2/r/TrAyrv3MHYow1AJTkeL1t7MrJQdASzcnkREJQ2MDCPQnbA9zGE9gHiCvgJNwKQDf/SqqY=

On 11/10/24 5:53 PM, Chen-Yu Tsai wrote:
> On Fri, 08 Nov 2024 20:37:37 -0400, Cody Eksal wrote:
>> While testing the MMC nodes proposed in [1], it was noted that mmc0/1
>> would fail to initialize, with "mmc: fatal err update clk timeout" in
>> the kernel logs. A closer look at the clock definitions showed that the MMC
>> MPs had the "CLK_SET_RATE_NO_REPARENT" flag set. No reason was given for
>> adding this flag in the first place, and its original purpose is unknown,
>> but it doesn't seem to make sense and results in severe limitations to MMC
>> speeds. Thus, remove this flag from the 3 MMC MPs.
>>
>> [...]
> 
> Applied to clk-for-6.13 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!
> 
> [1/1] clk: sunxi-ng: a100: enable MMC clock reparenting
>       commit: 3fd8177f0015c32fdb0af0feab0bcf344aa74832
This commit is missing in 6.13-rc4. Will it be merged in the next rcX?

Thanks,
Parthiban
> 
> Best regards,

