Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=101.71.155.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795859145;
	b=4dMyCmjBICXPFesrKMqmiCVSyblayH1owkdelZ0ZNHxf3kY2EndyXCby9HB1ubtD1VUB
	 ttoLnc1xXYq3D8hiradwsxxdG6KbXZyoMPPjD1vr4vck7/4LqqFYS66mi1kkPWxSdIZwl
	 RkUXu32bMjuJnOi8WVMHte2vylhc4Fm2qARsqpKS2lM8gS8e4X+ScwcOwTdYytlFt7e7k
	 wmpZltE9MenZEf4sMx80ihM6FbgYyLTe5Bo2uFD5utBxFQIS7qgQvaBJqY8CNA8BHwOKD
	 XN+fRFoSEdYtUmep+geGqx52+LErNjtom66Xro3fWOO9oT0YrBCwUDX0jDb5LFAbNjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795859145;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=gSyjsmHc8LX/g/eZNAKvONs3IMZTeyCYPd5ojYwnEZY=;
	b=ONq4O713UlVea4E0vbxpfYyYlK2Qwje0/3aWt7bljhlA73eXB6ymFqE1MK5oi+KtStYD
	 JtJmJuG9xQpMcaD8fJ09lzldCe1j9vxnoTseGctohjkdZ0pn0Ic+NQOvDGv/AIr3E7eU7
	 zeERmEGDYtNzhsZvvDAMnwO4atdcEBEtsbprmHANDSdUAXZg7EyNbg0Ae5OKvWVrzKNMq
	 7a9Kh8eQHZuYZadsF8+UiF6T7Au1t1tSFqgvwoQA7Lx8fTSyrySGrU0e6YrpxV0xmOqKq
	 90gIcp8i0VD8wtaeLe70WULjRb0R+T8BFIzDXMOZGgulyctajChMyriAjyi/+IVnbTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZU62VlH2;
	arc=none smtp.remote-ip=101.71.155.101
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ECBC606A31F
	for <linux-clk@vger.kernel.org>; Sat, 28 Nov 2026 09:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ECBC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=ZU62VlH2
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b0885;
	Sat, 28 Nov 2026 17:45:40 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: abelvesa@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	m202171776@hust.edu.cn,
	peng.fan@nxp.com,
	dzm91@hust.edu.cn,
	lyx2022@hust.edu.cn,
	zero12113@hust.edu.cn,
	mr.bossman075@gmail.com
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] clk: imxrt1050: Fix potential use-after-free on unbind
Date: Sat, 28 Nov 2026 17:45:39 +0800
Message-ID: <20261128-f81b700d6c-u08-2@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
References: <20261128-f81b700d6c-u08-0@mail.sdu.edu.cn>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa2218bcee803a1kunmf33ff7a74520cc
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaTE9KVh5OSkpKHh4eS0pJTlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=ZU62VlH2h4hE9/9zWZXysoJSdpxPrrhnKu0pa+ttn59nFXYcNZaOGZ45Sdg+zs5gQAS67EE4YGTQLO8+RzbVhhrLk0W5Kv/Z8+5rujWLCLCPjRWTq8P8Eaj56HnE/6LzPlM9ea9/jL+O0DY38z3gKG7hq9am9iyGFOb8mJu7snE=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=gSyjsmHc8LX/g/eZNAKvONs3IMZTeyCYPd5ojYwnEZY=;
	h=date:mime-version:subject:message-id:from;

The OF clock provider retains the managed onecell data after the
driver is unbound. Subsequent clock lookups can access freed memory.

Manage the provider so it is removed before the onecell data is freed.

This issue was found by our static analysis tool under development.

Fixes: 7154b046d8f3 ("clk: imx: Add initial support for i.MXRT1050 clock driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/clk/imx/clk-imxrt1050.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imxrt1050.c b/drivers/clk/imx/clk-imxrt1050.c
index db152c66d66f..28f4534cbeff 100644
--- a/drivers/clk/imx/clk-imxrt1050.c
+++ b/drivers/clk/imx/clk-imxrt1050.c
@@ -150,7 +150,7 @@ static int imxrt1050_clocks_probe(struct platform_device *pdev)
 	hws[IMXRT1050_CLK_DMA_MUX] = imx_clk_hw_gate("dmamux0", "ipg", ccm_base + 0x7C, 7);
 	imx_check_clk_hws(hws, IMXRT1050_CLK_END);
 
-	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_hw_data);
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_hw_data);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register clks for i.MXRT1050.\n");
 		goto unregister_hws;

-- 
2.43.0

