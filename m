Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B6737996C;
	Sat,  5 Sep 2026 13:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615386; cv=none; b=by7UXwbMx2oG5FQ7LQcJaIrfh6y6E3M7bYpceN8h+73rKzSX5HLOoaI21rdy7UOB2kJtTzbHynPMix/r65pCmfcmCX7oCCwqWwQnrbWL6LULGQHYlH6SJlmdEiTx+NYMuu1NC4LsHwyB5zajcHtUjy7m3tdIo+qS1226ZY/k6zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615386; c=relaxed/simple;
	bh=O6Cg52f3EnVkRNyZ3KIoqCCSnjeM0wVmpV9MVOGSq/M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SCrjqw/Xw6aTgktOxwsn+S9hSE7VT5dwOT6xeb18ADZQeJXs8YlF2S9LvX5Ww+Y+cODvlnSfSOUGjAFPAfhROYh39SRlLnNND04UTfm0fOHov52XjGqsqd1UExgjvOzgjB6Hx4h2Ub78yOCykz3HkSxT6z0hlDTXR7C3wJw8y1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=HwncwR6y; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="HwncwR6y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=dJ
	jbs7F/aSeREhZ4M4hX91XsW5vUHNRiOu4hPmmpt0Q=; b=HwncwR6yTjqlh4t2lr
	7kFWgKNfa7ZqR0434Jsqro3uBPiYmx0W+uu3Jc4pMYl/s49GrviT8VdefhIKy+ij
	VCK3FloFhoyDpPrYaOzIskGGXZRh+TnsOtcYaiSIydZ9APl02+T3Z3zjzPILerct
	l9GZybUFcIujlW56DlXFzxtG8=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wBn7IehGpxqqn1WAw--.53861S2;
	Sat, 05 Sep 2026 21:35:30 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: a523: Publish the MCU CCU module alias
Date: Sat,  5 Sep 2026 21:35:27 +0800
Message-ID: <20260905133527.64811-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:_____wBn7IehGpxqqn1WAw--.53861S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZryrWF1xKry5WF13Jw18Xwb_yoWDuFc_u3
	WxZrWDGa48CFWDAF15Aws5ur9Yv34rXrnYgryj9ryaqa4UZFyfAr4vqr1DJ34rZayxAFyD
	GF1kGFW8u3y5tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRk9NDUUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxQJwOWqcGqIkOgAA3e

The A523 MCU CCU is built as a separate module. Its platform driver=0D
uses sun55i_a523_mcu_ccu_ids, but the table is not exported for module=0D
autoloading.=0D
=0D
Publish the existing OF table. The main and PRCM CCU modules do not=0D
provide alias metadata for this module.=0D
=0D
Fixes: 598e4b6713b5 ("clk: sunxi-ng: add support for the A523/T527 MCU CCU"=
)=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c b/drivers/clk/sunxi=
-ng/ccu-sun55i-a523-mcu.c=0D
index 197844f..f5f0f87 100644=0D
--- a/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c=0D
+++ b/drivers/clk/sunxi-ng/ccu-sun55i-a523-mcu.c=0D
@@ -453,6 +453,7 @@ static const struct of_device_id sun55i_a523_mcu_ccu_id=
s[] =3D {=0D
 	{ .compatible =3D "allwinner,sun55i-a523-mcu-ccu" },=0D
 	{ }=0D
 };=0D
+MODULE_DEVICE_TABLE(of, sun55i_a523_mcu_ccu_ids);=0D
 =0D
 static struct platform_driver sun55i_a523_mcu_ccu_driver =3D {=0D
 	.probe	=3D sun55i_a523_mcu_ccu_probe,=0D

