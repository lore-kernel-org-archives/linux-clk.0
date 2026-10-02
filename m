Received: from vtj.irix.systems (vtj.irix.systems [82.76.27.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E01F3BAC;
	Fri,  2 Oct 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.76.27.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943570; cv=none; b=T4pa+PZ4Q9Z+ZPXTUcEY+aBigvLRctnJOn1eB3O+BLhqbwPNCPUjrPnKQY/jy6CyGsBhwdxwJxCqibXAh5y9QlU3wpsAnnSwOPbjmRbg43fvOjrYCPaIrFfshH02Ffa4KwQnkKV8UmdJg8i2Uv9F9+0JhLbe9ByMtVTKd/xsICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943570; c=relaxed/simple;
	bh=xPZSbUGTMsJwDa300AsPoK5OJP9M2TZIOqOXjhLjNwI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BqN76MEbsYJo3tDbRLD/daq3K3Fqha8LQ8t3U8wA+8irQRI/cmvfiMLNa736cMTftmhMy6fGY1bSjwlBYcV7JOiOOsE9oKsOHBkCgd6+fbWttNYeEIaPM9PFpPl1GjgVR/UXuw8PzZn7MDs2IQ+8kz88oKW2GlMyTwBzsh7x0s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com; spf=pass smtp.mailfrom=andrei-z.com; dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b=fWRWafuA; arc=none smtp.client-ip=82.76.27.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b="fWRWafuA"
Received: from MAILGW-HP.hp.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id F2312644C;
	Fri, 02 Oct 2026 15:19:26 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=HCiiTBlsl9PRGqckLng9
	fD5SFB42eRFyx3EpVAOBDMo=; b=fWRWafuAD4FqG5WcUFTjB1CJtfYoRnB+wM/R
	Ln/1SUfzyOI9eQxBzfHjHPQLEt/qONO3oYbrlai0diBxpdFMMK1KfEvMCHsVwkXu
	rDo2eZr7BNLulx2ielQm5xlgdRGdOmNrJOgzo+wCLVedMk/DIBykHKhvNQUzRBcB
	urnZoIGx48bJaYYxqPi8GCuHtmsyOVIBoDYzJSg9M2R1kln52cigA09pSmNFODwW
	aoHpOGPmQQxf0exnfAXqYZq3u2LSdODMuhjGIzWe/k2WQKcSFBicPpIT4Xuy3YPg
	qK3WmlAh9TD5eoKPqbsbfS3UVn9r7RAunxDdAHLUtXIOM4mTrA==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 1E5FC63AA;
	Fri, 02 Oct 2026 15:19:26 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:19:25 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from ubi0_axi_clk_src
Date: Fri, 2 Oct 2026 15:19:19 +0300
Message-ID: <20261002121920.994608-2-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002121920.994608-1-me@andrei-z.com>
References: <20261002121920.994608-1-me@andrei-z.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)

ubi0_axi_clk_src has CLK_SET_RATE_PARENT, but its parents are XO and
the read-only GPLL0 and GPLL2 post-dividers, so propagating a rate
request can never change their rate.

It does make the clock core treat any rounding gap as a GPLL0 rate
change. Requesting 400 MHz (GPLL0 / 2) while GPLL0 reads back as
799999998 Hz makes GPLL0 the top of the change, and clk_change_rate()
then re-runs set_rate on every GPLL0 consumer. That includes the live
NoC clocks and sdcc1_apps_clk_src, which is gated at that moment and
fails with "rcg didn't update its configuration", leaving the eMMC
controller and the board hung.

Drop the flag so that a rate request on ubi0_axi_clk_src stays local to
it. gcc_ubi0_axi_clk keeps its flag and still forwards requests to this
clock.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index add6a53d4df5..620b9ed72138 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -1197,7 +1197,6 @@ static struct clk_rcg2 ubi0_axi_clk_src = {
 		.parent_data = gcc_xo_gpll0_gpll2,
 		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_gpll2),
 		.ops = &clk_rcg2_ops,
-		.flags = CLK_SET_RATE_PARENT,
 	},
 };
 
-- 
2.47.3


