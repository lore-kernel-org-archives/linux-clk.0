Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A9382F17
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 11:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782472508; cv=none; b=gy16Q8Ss8Fe2QOUeKDok3wv//is6c4Kf1MvrgnaxDH2qQy7P2MQwZbCSOsGTgfBa5iOoh2EtwZnlGxxv/JMgYIF5cVKxj2ycyumukmJRwHWRLVr7UP/F7K1N+vneSlE1H8kUl8C/Hgq4iisYejD7hikooPI0v4FcldkARD9eQeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782472508; c=relaxed/simple;
	bh=t0EnBvyYKtlT2m4NKrmxp2OprTsX8mozrOnIZAtLFIs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=mfTA+mM9X3uXytl6lBrFG8G//+KaMIj45X+r6q5uEg6VZaC90+UAlHUschwQIyFGqLfFILDQztr/nKAEiLJoVg3u+Fz4i1/ryX5bIxweOcUfYM1OQb4+65xWYECMfyvUPUDKv34O9chmzjxNQldNCWxG+Q0bzGiPSvXbiIAJMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JU56IzW4; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JU56IzW4"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260626111504euoutp02f1ec9abfbccfb9567c051a837dc04562~8nUx7hAJk2468024680euoutp02Z
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 11:15:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260626111504euoutp02f1ec9abfbccfb9567c051a837dc04562~8nUx7hAJk2468024680euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1782472504;
	bh=qMxZRe3OcvLJqLoDf7Eb4NKS9R8/hQ9Mz/EhnSJd94I=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=JU56IzW4pOTVEiTGwlJ5a/Aim7WqayEQpAkcfmkUNO+2C+JhMc3jEjNF50nmpooeT
	 dxwjqhExLL2fZU/9FuVHb6k+T8Acz/RlW7QKVRSblqHbHpz6ZshNsZKfXuOCIz69DK
	 vFkL3ldgWp1yJcMl4XFiHfGyIeKvqyBU0v+c7cKU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8~8nUxwBVi11347013470eucas1p1x;
	Fri, 26 Jun 2026 11:15:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260626111503eusmtip225060f4d954b5c77cef1ff4a225fd091~8nUxI4EZ20500005000eusmtip2T;
	Fri, 26 Jun 2026 11:15:03 +0000 (GMT)
Message-ID: <a2114981-632a-4001-a360-ab78542a1d7a@samsung.com>
Date: Fri, 26 Jun 2026 13:15:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] clk: qcom: regmap-phy-mux: Rework the implementation
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Bjorn Andersson
	<andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Taniya Das <taniya.das@oss.qualcomm.com>, Jagadeesh Kona
	<jagadeesh.kona@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>,
	usb4-upstream@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750856c8-ac82-4d05-9c8e-702d091e930f@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8
X-EPHeader: CA
X-CMS-RootMailID: 20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8
References: <20260409-topic-phy_fastclk-v1-1-6b4aaee56b90@oss.qualcomm.com>
	<178093139446.244194.9422100472802070367.b4-ty@kernel.org>
	<c675lcfptr4xgg4hcjp66unmuozgsvgwvtymh7on6jcipjrdw7@jy4h7fkwqwjg>
	<750856c8-ac82-4d05-9c8e-702d091e930f@samsung.com>
	<CGME20260626111504eucas1p1f9f7ffbd3655c400c6d7bd35e11fccb8@eucas1p1.samsung.com>

On 26.06.2026 11:46, Marek Szyprowski wrote:
> On 11.06.2026 21:38, Dmitry Baryshkov wrote:
>> On Mon, Jun 08, 2026 at 10:09:55AM -0500, Bjorn Andersson wrote:
>>> On Thu, 09 Apr 2026 13:57:45 +0200, Konrad Dybcio wrote:
>>>> The sole reason this hw exists is to let the branch clock downstream of
>>>> it keep running, with the PHY disengaged. This is not possible with the
>>>> current implementation, as the enabled status is hijacked to mean
>>>> "enabled" = "use fast/PHY source" and "disabled" = "use XO source".
>>>>
>>>> This is an issue, since the mux enable state follows that of the child
>>>> branch, making the desired "child enabled, MUX @ XO" combination
>>>> impossible.
>>>>
>>>> [...]
>>> Applied, thanks!
>>>
>>> [1/1] clk: qcom: regmap-phy-mux: Rework the implementation
>>>       commit: e108373c54fbc844b7f541c6fd7ecb31772afd3c
>> This breaks at PCIe at least on SM8350. The attached WiFi card is
>> not detected anymore. Rewerting the patch makes it work again.
> Same on QCS6490-based RubikPi3, after this patch the XHCI USB host controller PCI
> devive is no longer detected.
A few more comments. I've checked the PCIe initialization code called on Rubik Pi3
board ("qcom_pcie_init_2_7_0()") and there is no call to set_rate(), which would 
change the MUX to PHY. The PCIe init code only calls clk_bulk_prepare_enable(),
but this became noop after this patch on the mentioned MUX.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

