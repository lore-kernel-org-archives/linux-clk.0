Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793186585;
	b=nKQZ1w9HhT4UTM+ftC+xu7b2P1blMJotx6eH8wS+B3Hh/Oj/gfOD4mDjTsA+8Zu2GSPS
	 gV2Ij1HD647NSi1T5XoRfMG5ce8qn/UPcAKFEVvqkwi2Di37HNjTmac5SMZ6+NfSneHNt
	 XEGpKTcq51jXq4DE9gm8ltk/B/XfxOF0uv43IkQd9HOgZ2M4w5s3aWy74H7p83AvTD85c
	 Oub1w6y/3DIBtZAto/7mUUm8OUBTk0kGt+Z1hTES5sFrvq5iPwE8J0iuaccSh/WKUxDbh
	 garUju+QZ79oc+RboMZ4gZjG+0lnpW0ethq5ZmZdX8rQebExkv6L1GKoPnrfuv8ZKXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793186585;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=8jmB9RanmjeScw6lxO3L8ylBkN0Bh3ZFb96COO2bVGA=;
	b=Z9SnDOVClljOFghDlxyxVicWMi/siss79BBSM0D4jMu7ff6IwwveDu5L3Vf4xO0oPWu0
	 xY8FdYYr8MfN0w4tCHEfeREfYiCWn3jimMdPVSX5xmGuw5qTi34u8TobH8A5cn5yPih3e
	 w5kcKcZmmK+HEkgTrEONiZ7ccjzP+RpNNLQdn48VcjzCMxKEo+hdaR9WWR+RFQgZGPMfR
	 +PnrE7b1/OiavZyes8d5ECQgQPwMy3BzCOw2hdCYBNrZAvP4XKr5FY15SCxqf3nyt0qEE
	 v8L3EbmXJN8NoGeWX8TUkrVyYEVtSaEVOQm08bWt75bj1sWetRKmjUJVuO2bGT3AUAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b="i+/skMd/";
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFC4606A31A;
	Wed, 28 Oct 2026 11:23:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFC4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=i+/skMd/
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261028112254euoutp02b26cbd638eecd1de5239047e5366ec4e~irbBUW4tQ0198001980euoutp02b;
	Wed, 28 Oct 2026 11:22:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261028112254euoutp02b26cbd638eecd1de5239047e5366ec4e~irbBUW4tQ0198001980euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793186574;
	bh=8jmB9RanmjeScw6lxO3L8ylBkN0Bh3ZFb96COO2bVGA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=i+/skMd/joxmQpIWha/jNQK0UIdTcPIoVEd5fvdz8Izsa0FMZ/GVtJm/TVSDc4Wlf
	 PSmKOj7Xwg6LjngebJx90KPoph5FvRubzdJqkrAB01tQXiW5g0Uhg7YjWQv336Jzoz
	 0zfJhBqZpNGKdJMpWVeGSx1ReAFKZwymkmP5q8wo=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261028112253eucas1p28a4257d534aa730b8a96c0bb58fdfa31~irbAWgQHl0931009310eucas1p2l;
	Wed, 28 Oct 2026 11:22:53 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261028112251eusmtip1d596afbaa8e50b7128171427ede9319d~ira_nxioV0551305513eusmtip1V;
	Wed, 28 Oct 2026 11:22:51 +0000 (GMT)
Message-ID: <ebd333b0-39b6-428f-b8fe-143faa8949bc@samsung.com>
Date: Wed, 28 Oct 2026 12:22:51 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/21] drm: starfive: jh7110: Enable display
 subsystem
To: OOHehir <oo.hehir@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, alex@ghiti.fr,
	andrzej.hajda@intel.com, andy.yan@rock-chips.com, aou@eecs.berkeley.edu,
	bmasney+clk@redhat.com, chaoyi.chen@rock-chips.com, conor+dt@kernel.org,
	db@domibel.de, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	gandalf@winds.org, hal.feng@starfivetech.com, heiko@sntech.de,
	hello@big-grey.co.uk, jbrunet+clk@baylibre.com, jernej.skrabec@gmail.com,
	jonas@kwiboo.se, jpeisach@ubuntu.com, kernel@esmil.dk, krzk+dt@kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, luca.ceresoli@bootlin.com,
	m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com,
	mani@kernel.org, maud_spierings@murena.io, mripard@kernel.org,
	mturquette@baylibre.com, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
	palmer@dabbelt.com, pjw@kernel.org, rfoss@kernel.org, robh@kernel.org,
	sboyd@kernel.org, tzimmermann@suse.de, u.kleine-koenig@baylibre.com,
	vkoul@kernel.org, zhengxingda@iscas.ac.cn
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20261012175941.258219-1-electronicconsult1@gmail.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261028112253eucas1p28a4257d534aa730b8a96c0bb58fdfa31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655
X-EPHeader: CA
X-CMS-RootMailID: 20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20261012180005eucas1p133b9ffd7327e5e62e3748fcffbac3655@eucas1p1.samsung.com>
	<20261012175941.258219-1-electronicconsult1@gmail.com>


Hi,

On 10/12/26 19:59, OOHehir wrote:
> Tested on a VisionFive 2 v1.3B with patches 1-17 & 19-21 of v5 on
> Linux 7.2.8, plus the clk patch that was 14/20 in v4. Patch 18 was not
> applied: it conflicts on 7.2 & there is no Rockchip hardware here. The
> same kernel also carries the out-of-tree PowerVR BXE-4-32 enablement &
> the SiFive XPbmtUC errata patches, so the GPU could render to the
> display.
> 
> - The dc8200, the HDMI controller & PHY & the vout clock controller
>   all probe, with nothing left in deferred probe; HDMI-A-1 reports
>   connected.
> - kmscube (GLES via zink on the PowerVR Vulkan driver) runs at the
>   monitor's preferred mode: 1683 frames in 28.1 s, 59.93 fps with
>   vsync, picture confirmed on the monitor, no GPU firmware resets.
> 
> Only that one mode was tested; the modetest sweep in the cover letter
> was not repeated.
> 
> One error at boot:
> 
>   i2c i2c-7: of_i2c: modalias failure on /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
>   i2c i2c-7: Failed to create I2C device for /soc/display-subsystem@29400000/hdmi@29590000/controller/ports
> 
> inno_hdmi_i2c_adapter() sets adap->dev.of_node to the controller's
> node, so the I2C core registers the controller's children as I2C
> clients, & on the JH7110 that node has a 'ports' child. The display
> still comes up. Should the adapter get no of_node, or a dedicated
> child node?
> 
> For patches 1-17 & 19-21:
> 
> Tested-by: OOHehir <oo.hehir@gmail.com>
> 

Hi,

Thanks for testing. I'll carry your Tested-by into v6.

The modalias failure reproduces for me as well. It doesn't come from
this series: inno_hdmi_i2c_adapter() has been assigning the adapter's
of_node to the controller's node ever since the driver landed, and the
RK3036 and RK3128 carry the same ports child beneath their hdmi node, so
they should print the same message.

Nothing on the DDC bus is described in DT so the adapter shouldn't
receive an of_node at all - dw-hdmi doesn't set one either. Removing
that line clears the error here with EDID and every mode still
working. I don't think the fix belongs in this series though.

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
