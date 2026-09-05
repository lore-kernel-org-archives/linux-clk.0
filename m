Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6457D3815D8;
	Sat,  5 Sep 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615325; cv=none; b=MbxzfaiembMEdUMDpGb5wyfNGXhiFdPJArSxTNeNaXT22LD+pQpRqMM9mD2bS82hwkJQUtIhdyHiikaTu9zOn0ZbDR+n9qE9toif9eOy9ReM7gRrDaHgZj2cAsJjB/DXKzTnk0K/0N/AM6L2L/zEH5UYT7tsTL8mPsnHRocI/b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615325; c=relaxed/simple;
	bh=Wt6I/aU/G1XMdfSJMQIJsUTd0Z2usiR3V6RUU90FSl4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tefPDgfCma69mcNlzFNP02UxQ9o1guGuP+sLkISdTf52hDe17ZdvBSGEerNGaVI2HPQFTK4VHaaaa6EUx0fJxMbHuaclPgn1SxbgITSKQeNRTV0HosjbLswSF/z1ygZb8TVfcysEJwPO8gGciKJZvpwHIeIqwRhZ6/iaoivdKUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HZe6aquM; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HZe6aquM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=FO
	br8zk9lwX0SnKtG4JNGHiNnmnoWGmqHJglX3yyxo4=; b=HZe6aquM6Sh+cv781J
	CParfciaUTDsKmtySjBC7rS/zOhx1VkF46q9PC9ol36HIQf7MBdrwWb00jMDx1J2
	GcjqiJtCe40S/zXYwPK5eAaWhtMKv29bHJUljVAY3lej3icbAU2R5nctiFtGLAdL
	AzVkb3dnr1md9LWGxm1fhuYh8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wA3rmtcGpxqLTNrAw--.54824S2;
	Sat, 05 Sep 2026 21:34:21 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sam Shih <sam.shih@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>
Subject: [PATCH] clk: mediatek: mt7988-apmixed: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:34:17 +0800
Message-ID: <20260905133417.64373-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wA3rmtcGpxqLTNrAw--.54824S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XrW3tF17WrW8KFy7XF45GFg_yoWDZFg_uw
	4DZr4xuryDKF9Yvr4Fya1fZr9IkrWavrWDXFyrtw1ava4DuFsrZ39FvwsYqr17GryvvF1D
	JFnY9Fy8Cry5ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxh1fKGqcGl0TVAAA3a

COMMON_CLK_MT7988 is tristate and builds apmixed as a separate object.=0D
The apmixed platform driver has an OF match table but exports no OF=0D
alias, so that table cannot be used to select the module on a device=0D
event.=0D
=0D
Publish the table. Keep the existing initialization entry point.=0D
=0D
Fixes: 4b4719437d85 ("clk: mediatek: add drivers for MT7988 SoC")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/mediatek/clk-mt7988-apmixed.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/mediatek/clk-mt7988-apmixed.c b/drivers/clk/mediat=
ek/clk-mt7988-apmixed.c=0D
index 416a4b8..24f4e7b 100644=0D
--- a/drivers/clk/mediatek/clk-mt7988-apmixed.c=0D
+++ b/drivers/clk/mediatek/clk-mt7988-apmixed.c=0D
@@ -75,6 +75,7 @@ static const struct of_device_id of_match_clk_mt7988_apmi=
xed[] =3D {=0D
 	{ .compatible =3D "mediatek,mt7988-apmixedsys" },=0D
 	{ /* sentinel */ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, of_match_clk_mt7988_apmixed);=0D
 =0D
 static int clk_mt7988_apmixed_probe(struct platform_device *pdev)=0D
 {=0D

