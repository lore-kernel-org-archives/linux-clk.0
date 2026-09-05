Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E519A362156;
	Sat,  5 Sep 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615222; cv=none; b=aIbwgCNWLb4c5kUZCferGX18o0G4tGDnsbt2r0wMarBkr9+RLTjxXpDJksuRvhXoDPn0l48VbLNmqsHHFFCx+f2ZC4te+mk1FhiFKS+OdEV790WbVYkkTO7S/eudU+BHBjsvOM4lyqAjilYW1txNXPPsGh9cyJ2xfF2Cdc6Ls7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615222; c=relaxed/simple;
	bh=Z1ZAX2uEYyVMv4TdY2rwsi2q9yHKRszxqfQwgQrGiBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KYRW1uGX4HPjZIEe0jW6+Ik+GTy5UdLwg/9/o/nYI1yhgHXi4PJLMduRtTxdvzXYtiAEmtQ6aX87JkAWGduvxLF6dLkdyXhCgBxT/KgvpBZ8PoSJN/Aco74punJRHVL48gRqYGNGlxeORP44eiYCbgA0d74dTpJwurPXmvLa1Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=fvSJ78Z2; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="fvSJ78Z2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=u4
	uq7fmGlh/XA4usOS9KLTTti8JWGLl4olBoqOeznME=; b=fvSJ78Z21fx0Jfmfq0
	UMDmcoKpLtF7sumJQ2HaxhS4mFm2LVH7D+9a3pkapPASKGWYM2dsbWIEcsi+80I6
	daVABUGBZzsznT6wuuIMMmZpmMF4NDpLg6HXKza/woLQheZMgrlhMwAzVRPuQHtd
	Q7fiGiOIBLx62bFAmiMuXK7VE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wD3P5sEGpxqJrZuAw--.15361S2;
	Sat, 05 Sep 2026 21:32:53 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] clk: mediatek: mt6735-imgsys: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:32:50 +0800
Message-ID: <20260905133250.63975-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wD3P5sEGpxqJrZuAw--.15361S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Wr47Zw4kAry8ur1xWw4fuFg_yoWkJFX_C3
	WDXryxZw1UtrZY9FWfK3WfZayxKw45ZFykXa45trW3Xry7CF1DXwsFv3yvvr1UWa40vF4D
	JF93uF48CFnrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRvtCDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxgVJEmqcGgUObQAA3S

The MT6735 imgsys driver is a separately selectable tristate driver.=0D
Its OF table is registered with the platform bus, but is not published=0D
for module autoloading. Loading the main MT6735 clock driver does not=0D
load the separate imgsys module.=0D
=0D
Publish the existing OF match table.=0D
=0D
Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock an=
d reset controllers")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt6735-imgsys.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt6735-imgsys.c b/drivers/clk/mediate=
k/clk-mt6735-imgsys.c=0D
index c564f8f..813241d 100644=0D
--- a/drivers/clk/mediatek/clk-mt6735-imgsys.c=0D
+++ b/drivers/clk/mediatek/clk-mt6735-imgsys.c=0D
@@ -41,6 +41,7 @@ static const struct of_device_id of_match_mt6735_imgsys[]=
 =3D {=0D
 	{ .compatible =3D "mediatek,mt6735-imgsys", .data =3D &imgsys_clks },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_mt6735_imgsys);=0D
 =0D
 static struct platform_driver clk_mt6735_imgsys =3D {=0D
 	.probe =3D mtk_clk_simple_probe,=0D

