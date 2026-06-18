Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C908F3B2FC2
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781782647; cv=none; b=Ip4UYI2k527g++FWaIAoGx4dkSxD8nM8pFM/G3VjHXSUVufP3AWFGebQM/ioiNg35U0KgcaPFU0B1Upqx+lOx12em3KEU1Bk+8nXyNHSo4UsHDsedDyDyoVuRIOHPDABLlIK0uUOPhU/isVPYCuj9lH/ZBXVN3ABcBW2Uc0AtB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781782647; c=relaxed/simple;
	bh=fpa/H07iVRbVBLt1YaDl0sTETMOvCiyWgWwZf6Kug4A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:In-Reply-To:
	 Content-Type:References; b=tcutXdL7yqKr0rA5jA3JHCMLnDQM22MqQtDKh6hzotA9X2RRP2+a9tRWkwnzTmjW8QoS1L2OI9SmKjQKSe1jWjUP5drPfHUeZjbcohdj1aMLKHxLoOA+oU0/xTjTJqIe1cMWZLnIGl5ZKlICzy/9Pq8WPbOV4obzERg4IGswQvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=i1bV33TJ; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="i1bV33TJ"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260618113715euoutp0272511a8edf67eb85640cfb9abd2e372a~6Kd318ZCI0753007530euoutp02L
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 11:37:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260618113715euoutp0272511a8edf67eb85640cfb9abd2e372a~6Kd318ZCI0753007530euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1781782635;
	bh=yudMLDN6lpMb0Z/7uQmRfp4PbQdrNR6BkrAQrkb/XA0=;
	h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
	b=i1bV33TJT0EVirmuBK597IABsnI95i8FFnxt/YA9bl2bvII7ecKhk9DPE/xTrV8Og
	 Mab6B9cFPvqkmKbLfQV+1U/C0D6IzXa3M7JJuYx+NfMu1O+j0VfcWbtYK8Zuj5z5Qx
	 0L9Zzz6qUSWL2+L25K3Q19NvQBPRSGRaeUXz/GkA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260618113715eucas1p2340cead7e78cb4b3d1b91a7f2c23874a~6Kd3lMwT81088410884eucas1p2M;
	Thu, 18 Jun 2026 11:37:15 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260618113714eusmtip2cf281128f9e3ec3839f51cad471e7dba~6Kd25GYMe3002730027eusmtip2F;
	Thu, 18 Jun 2026 11:37:14 +0000 (GMT)
Message-ID: <d4c1e329-78de-4d02-99e5-3e4887bdecf8@samsung.com>
Date: Thu, 18 Jun 2026 13:37:13 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v2 08/11] clk: qcom: dispcc-sm8250: Enable parents for
 pixel clocks
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Val Packett
	<val@packett.cool>, Bjorn Andersson <andersson@kernel.org>, Michael
	Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Johan Hovold
	<johan+linaro@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Dmitry
	Baryshkov <lumag@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Language: en-US
In-Reply-To: <6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260618113715eucas1p2340cead7e78cb4b3d1b91a7f2c23874a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
X-EPHeader: CA
X-CMS-RootMailID: 20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35
References: <20260312112321.370983-1-val@packett.cool>
	<20260312112321.370983-9-val@packett.cool>
	<CGME20260320113219eucas1p1bc2f238b689c55ba256c4694eb067d35@eucas1p1.samsung.com>
	<2f5b98a4-80a6-4611-9615-ab0202a8c455@samsung.com>
	<f9511ec8-be32-4232-9168-00f967c29508@oss.qualcomm.com>
	<6e0d6119-c7ef-40d8-bf0f-6a5b6f6b00cf@samsung.com>

On 16.06.2026 16:31, Marek Szyprowski wrote:
> On 16.06.2026 13:33, Konrad Dybcio wrote:
>> On 3/20/26 12:32 PM, Marek Szyprowski wrote:
>>> On 12.03.2026 12:12, Val Packett wrote:
>>>> Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
>>>> clocks are enabled during clock operations, preventing potential
>>>> stability issues during display configuration.
>>>>
>>>> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
>>>> Signed-off-by: Val Packett <val@packett.cool>
>>> This patch landed in yesterday's linux-next as commit. In my tests I 
>>> found that it triggers the following warning on RB5 board:
>> Hi, I was clearing out my inbox.. Is this still happening on the latest
>> next?
> Yes, still happens here with next-20260615.


I've just played a bit with that code and RB5 board and found that this issue
happens, because enabling the DSI PLL clock fails for unknown reason.


Here is what happens just before the warnings (I've missed that in the initial
report):

DSI PLL(0) lock failed, status=0x00000000
PLL(0) lock failed

It looks that the generic clock code doesn't take care to properly balance
enable/disable in __clk_set_parent_after() when enabling one of the parent
clock fails in __clk_set_parent_before().


With the following hack the issue is gone:

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 8cb0db3a9880..c59326d4877e 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -510,7 +510,7 @@ static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
        rc = dsi_pll_7nm_lock_status(pll_7nm);
        if (rc) {
                pr_err("PLL(%d) lock failed\n", pll_7nm->phy->id);
-               goto error;
+               rc = 0;
        }

        pll_7nm->phy->pll_on = true;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

