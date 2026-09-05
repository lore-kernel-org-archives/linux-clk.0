Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB1902DECA3;
	Sat,  5 Sep 2026 13:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615286; cv=none; b=Y6qFON1nos8500SKVF9IOEiSi4IOWy36PBVzP1lNA2R1sDn6Bi2fNwHmJRyrew7YfKBpTyjfvcNAGtmzRxOrgwp/EOkk8XaF1odyfK5t6bSEFsSRHFLbV0k2rUJGUNx5p1TPJpqVtOdAwHoN8Blj6dX78UYFKGEUXVzEM3WCcdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615286; c=relaxed/simple;
	bh=3SyOmH4yaHUF+oBqdEvq0D1eArqKBfFvJ21lBoGMSLc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nm+By7jCIXH2bcpe1rQ3WJgq90samrwOBXmRbtslwYz349/vSvWFbf1hQ4uq/4z4vnIXIsvY+oXfDuqc7EDyYmHhN6JZdp8LU1bIOHZCGJD0pRLI95VlBAfcm3MMbf9Lr5f+7i3LPVcC7g94zBUuNC2TaFKRo+TxY9Q7ouib+SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Gb14eWzt; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Gb14eWzt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=7Z
	iQ14PaKZnvVJYQMcokZ3A3QMdtNODA5hCdhtAeY+w=; b=Gb14eWztY+/ZTaUJ3z
	bMdWKBMcrV14ksX7NMTjXIE2dUoMpB2S8iWP7Fe7l+6pPdAJJU0bTqRe0CowhtG8
	ftEoehkGgWWgzDueL1D+/+AKzv/a74ryCzDItGPqOC3vuc1isLl7fk+GtObmElUO
	8uZqbkfyiU30XH8W8m7gJewHM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDnL50zGpxqMotiNw--.8161S2;
	Sat, 05 Sep 2026 21:33:40 +0800 (CST)
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
Subject: [PATCH] clk: mediatek: mt6735-mfgcfg: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:33:37 +0800
Message-ID: <20260905133337.64201-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:PCgvCgDnL50zGpxqMotiNw--.8161S2
X-Coremail-Antispam: 1Uf129KBjvdXoWruF4xKw4kuw1DuFWrKF1kAFb_yoWDZwc_C3
	WDXrW7Zr1xtryjkr40gF1fZFWIqa1DZr1kCa4Yg39aqryxCF1DW39Fv39rXr4UW340vF1D
	tr1kWr1xCanrAjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRRVHmqcGjQeNQAA3p

The MT6735 mfgcfg driver is built as an independent module when its=0D
tristate option is m. Its platform-driver match table is not published=0D
for OF modalias matching.=0D
=0D
Publish the existing table while retaining the clock and reset setup.=0D
=0D
Fixes: 0bd9b1211f74 ("clk: mediatek: Add drivers for MT6735 syscon clock an=
d reset controllers")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c b/drivers/clk/mediate=
k/clk-mt6735-mfgcfg.c=0D
index 1f5aedd..8a18ee2 100644=0D
--- a/drivers/clk/mediatek/clk-mt6735-mfgcfg.c=0D
+++ b/drivers/clk/mediatek/clk-mt6735-mfgcfg.c=0D
@@ -45,6 +45,7 @@ static const struct of_device_id of_match_mt6735_mfgcfg[]=
 =3D {=0D
 	{ .compatible =3D "mediatek,mt6735-mfgcfg", .data =3D &mfgcfg_clks },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_mt6735_mfgcfg);=0D
 =0D
 static struct platform_driver clk_mt6735_mfgcfg =3D {=0D
 	.probe =3D mtk_clk_simple_probe,=0D

