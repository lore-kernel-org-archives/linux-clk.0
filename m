Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D85241F37F;
	Tue,  1 Sep 2026 15:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788275658; cv=pass; b=OeR5FiQA3pfCLLB4eafo6LxAUUQgjje6sE3bHao7iDRono0jJSK1z0xmFyT55sRD0W799pPrQEJv4JHmQFsqJYm7c10FZRXaPk+ADRpH+G040cbfzRx9djj82r3n1pPCAj91RIOaD9ABwP+3Hv826+IUWPwCetZ59Rie4Bg+gBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788275658; c=relaxed/simple;
	bh=iGJnTglys8pbYJBdqAYlDadMEZQMZPPrBS8OB1VUAbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDBZR8mmIoZHtVZcNneIYbhT/C7dkKfk7ejXXzjK6fhP3QsKlqr7d8djjxzeU/YiiEQlGbErmNeCfIc7O+v99fu1vWFq6/RRnS/O1MrjTMLT4EKGQ+LakZjTWarUPJGm9bw0KUcyMwT6Oo5b5Vs0B1v8nJlOQXcLjd8PE9YlDsg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=c1kzbC5G; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="c1kzbC5G"
ARC-Seal: i=1; a=rsa-sha256; t=1788275637; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=VXyw//D9atWhae4pSE5cGcAIjgUbqZv5Q+/++J/8ZwwGtL1HaV/1qXdu88Kd+WR386Cx8jjzrQJN1PUV7BS1tgNGHd/76duWW651d2uJGvP0fghHAgremEAJ8Tx50afxSMztLlLzNEpWSTzakKpBU5GwHPqbAPHZ3esw/k6pQRo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788275637; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o4KYhJdCwBe+SxoLEa4AxrQNZqlmNDYC6sJ8UWY4Hc0=; 
	b=QCw9PSIS2A7oAUJShvxQywxoSp57bg00U4bWU3T8R4/er/5Q2WCGqQuBfoVX5twygpupL/4aU15/GDLgtC/k8jOBpKVxzTdXeOFFHQMfipZhmXuZIEqt6p5WzfPpthRwWaVRbiB5hcFgoElz9yzix5l4p3FhO7ekMGqAnymjyq4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788275637;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=o4KYhJdCwBe+SxoLEa4AxrQNZqlmNDYC6sJ8UWY4Hc0=;
	b=c1kzbC5GPWrFe/4tByq97LXZvLIf3tKO2YjgrNtq+IS20jqciqIQDPfe2Hm6N866
	WKREsg/jFsiQwwGXBo1hREnf2GWPorGoPbNM3DSViByOk1M+h9P2jUeebcR2BstpjZQ
	hJDtbLuBcr8My3+O7dqVB7sPMg5g+UEPmHLeoids=
Received: by mx.zohomail.com with SMTPS id 1788275634800229.52516383730926;
	Tue, 1 Sep 2026 08:13:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 01 Sep 2026 17:13:35 +0200
Subject: [PATCH 2/2] clk: rockchip: softrst: Remove unused num_regs member
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-rockchip-reset-refactor-v1-2-936576523b21@collabora.com>
References: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
In-Reply-To: <20260901-rockchip-reset-refactor-v1-0-936576523b21@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

Not used by anything, but set. Get rid of it to save an entire 4 bytes
of memory, which is not nothing in this economy.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/clk/rockchip/softrst.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/rockchip/softrst.c b/drivers/clk/rockchip/softrst.c
index c59589b02963..b463f59cbf36 100644
--- a/drivers/clk/rockchip/softrst.c
+++ b/drivers/clk/rockchip/softrst.c
@@ -13,7 +13,6 @@ struct rockchip_softrst {
 	struct reset_controller_dev	rcdev;
 	const int			*lut;
 	void __iomem			*reg_base;
-	int				num_regs;
 };
 
 #define NUM_PER_REG	16
@@ -75,7 +74,6 @@ void rockchip_register_softrst_lut(struct device_node *np,
 
 	softrst->reg_base = base;
 	softrst->lut = lookup_table;
-	softrst->num_regs = num_regs;
 
 	softrst->rcdev.owner = THIS_MODULE;
 	if (lookup_table)

-- 
2.55.0

