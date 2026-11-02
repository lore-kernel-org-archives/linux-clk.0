Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606779;
	b=M6bMCcUTndXyV/dozMPKxIur+7Mn1W8BQA4gybCoI7T9LXPyulWOS+1Da07KhddqbrfX
	 mqw8BK56E5K3eH8arHwVpfBSJEr1IugkudTFx3ZKcZ0lmlngfcqwEOU1hxP1JKNXxuo24
	 NITmvju9ZaQkbSVTCEWyfxo0N68jFCOscy/L0tUDQhxuTzk/d6c5CJZ4HRfC+UuKhEhl6
	 wA22Hz1VE6Tdv0C9OvK4jYCPc8aD2Z/2wKm1vfNvRv+yS0N4Bkqvo7Qmf2EqfiXTr2lfL
	 Agq3WyglnKwlOubTp/KHAbjkWedxEq67LqR8ChqrdZKBPRyfUj98btPF+AkiYWqA3rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606779;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=sqpao1/I/tLYCesD0l9knVmMOKVJ/faaut6nm1UzczM=;
	b=eCoM+7TeqRlxA6cI5Fg1MvBqQOWzPVDhssRN55o44v2itVILPB/0hG2om/rI7nsVWC+9
	 7/2hRQUh7BcbxedCGEAaVwijkLX49yDTbhcUY1xI1cNClRkHQ+wzlnY0NVs/zdsXKPzsq
	 ZLaRU4EvHkHXIfnAcn2sBJ7ldp2mpD4ZCC8HCmReCOPWRTEyq2koLuMKa1hXRpa2ErpXk
	 TVJMZDLr4oGqwNImENp7zH3IL0mDDsSL0GGZl0bHMGkFDBBpYUDT5j7qOeE26/e0HJO2t
	 3Zfg73UMZXVI+E1g0oKPVMXhJCcwygZYlY7rUXZstHCrYAoRyTAwaWi2JFPUKzTtXNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aszE74dp;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD0E8606A326
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 08:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD0E8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=aszE74dp
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261102080608euoutp026b23ab33b8f17b110a35c7beb0ddd7c9~kK9p4c2Pe1797317973euoutp02N
	for <linux-clk@vger.kernel.org>; Mon,  2 Nov 2026 08:06:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261102080608euoutp026b23ab33b8f17b110a35c7beb0ddd7c9~kK9p4c2Pe1797317973euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793606768;
	bh=sqpao1/I/tLYCesD0l9knVmMOKVJ/faaut6nm1UzczM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=aszE74dpYbZ6E37WTHbG4dgOWJk4AiMqF4sFgZ6V0zm18fWmlk9qMzOVzRtL8B2gz
	 nzSKA/mQ4wuDDjhaMo1cXkv1b1dOxROSREjZikN5hippxFkMlx7R3knU4CrvVaELkT
	 x2TvwC8oamNl/KGVSKPVECKykKr2r01gvq5f1KrI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261102080608eucas1p29e19aeaa46f3f25c2921b573f9c732af~kK9pBZEyM1106911069eucas1p2-;
	Mon,  2 Nov 2026 08:06:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261102080606eusmtip23b97669eb77931e6c6d21f15001254a3~kK9n-x3f70436304363eusmtip25;
	Mon,  2 Nov 2026 08:06:06 +0000 (GMT)
Message-ID: <abf751e2-c03f-411d-b27f-1d822c084862@samsung.com>
Date: Mon, 2 Nov 2026 09:06:06 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/3] clk: samsung: fix probe-ordering races in
 exynos5-subcmu
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi
	<cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Stephen Boyd <sboyd@kernel.org>, Brian
	Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	Henrik Grimler <henrik@grimler.se>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <af5958f9-5a76-47bb-b78e-b17de38d66ee@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261102080608eucas1p29e19aeaa46f3f25c2921b573f9c732af
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
X-EPHeader: CA
X-CMS-RootMailID: 20261030075332eucas1p16331988bd7df20db9538066a613a42f2
References: <CGME20261030075332eucas1p16331988bd7df20db9538066a613a42f2@eucas1p1.samsung.com>
	<20261030075325.517182-1-m.szyprowski@samsung.com>
	<af5958f9-5a76-47bb-b78e-b17de38d66ee@kernel.org>

On 01.11.2026 20:03, Krzysztof Kozlowski wrote:
> On 30/10/2026 08:53, Marek Szyprowski wrote:
>> This series fixes a group of related issues around power-domain
>> availability and probe ordering on Exynos5 platforms (observed on
>> Exynos5800, e.g. Odroid XU3/XU4), which can leave clock muxes stuck on
>> the oscillator instead of their intended PLL parent.
>>
>> The issue was analyzed and patches were prepared with LLM assistance.
>> The whole patchset was tested on the real Odroid XU3, XU4 and Chromebook
>> Peach-Pit and Peach-Pi boards.
>>
>> Best regards
>> Marek Szyprowski, PhD
>> Samsung R&D Institute Poland
>>
>>
>> Changelog:
>>
>> v3:
>> - instead of removing more __init annotations, simply fail driver probe after
>>   the init sections have been freed; this should not happen anyway
>>
> I guess you did not pick up review tag(s) from v1 because patches changed?

Yes, imho that was a significant change.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

