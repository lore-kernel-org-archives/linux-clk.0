Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059503E92AC
	for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 09:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466461; cv=none; b=WoyOoQXlYCgasvkgj+Os/1KgBP4UonfssPoFFjeGGAHRKvwPnx3uapeZO4BDZemlkmgFmB5VGN93FefGVjxZT/q/fxiojoRwysgEZ4UDNBw2KAyWeNO5zN/yvE/qs1hlmDf1mR7vfABjgxdyjxZcPZAKvRJI+EbDBIwMCpfr/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466461; c=relaxed/simple;
	bh=l7M8Rv1FX6tc7M6wlAUtVT3zV3ehj2x0TDhS7wf037I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Slnp/pPqpN68F0FVxTgcMWvl00chhBqFOt0p1MzeG0YfdPTJAdi2afV1z6l9j2ytIphJfdwrfFCrIi4SGEclhxPMJ5rGtVQf7XiFFjTRnRvI38qGrvwaloNxvLiJtVcUrXJdsaiXSLAQIpCffFvy8H4rZBNkvh04RKz//iDyi3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nC+HOWQQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nC+HOWQQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c95a0c0aa2so51115ad.3
        for <linux-clk@vger.kernel.org>; Fri, 26 Jun 2026 02:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782466458; x=1783071258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aKllfYEV0UIxS9YR+qG1P28UUyEJha52iUC/4n2PQK4=;
        b=nC+HOWQQ9d66MDf/bNNaN0jY6P/P6zjdbm8Pvm+lV91sEkqxkqmPlmGmEazxRGk2+u
         pdnKQtrId1YUiu3C/Eu2RGKFJEtnD31010m/4Hur+WmxBO1g5lbInO0SPPK3J2lUDfdu
         IYEvidklxMFQRShVIbTGaYNyL3a7Rre6UVQsTSfVG77reAnobbELv7e8xxNfXX31Crxh
         KzuNpi0avVCbVHN1OJB7y5DI48xtwKwSxqUAvCnOT2NTsWeafOZ+VboxnPiB9GKM5tCb
         PxOeuHIAcejzudI4Pfg9j1tLaoYeuvlACtMZipmvvDfJrd+hVXAUqz8Dij/w/NFhEAuJ
         aKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466458; x=1783071258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKllfYEV0UIxS9YR+qG1P28UUyEJha52iUC/4n2PQK4=;
        b=FL5GVlxSyiTwLxFyQoLXtlfL06YZcgZfFoMb6VFXVrMZOxuscfhm5KBuAu6f8otglX
         AvjkCJB/PqtzNALlK/ktrYJJR9Vi/Ry2DEC092PfzXk36m3WSHWh0kMmBD8/ir6mw3yr
         bfJQFUOBFzvVAXZnjYApJAN+fnR2MpdMvWH/cj/XVs1MSmdlZrueWwUL8rbZAtXj7Vf5
         dXbSde3JVBWHodGBUesc9GP0zj/kRSoWsAeaG7GuAEzY8Ykbj0hFT2NIMUEnyCxJI/Ac
         ou1WDRK85ZHY3xnMjn3jn28RiM2ku75ntHuoyuHdul/dVfNpbZo9CVtQiE30BKKB818l
         ctxg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+oNXngCAZUWfWVEj7YVrOgSbLdmg9dtKp3QnP5YAc9emJJIL66JiURZAg1qDNe1zlBqlmQB0JU60=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxdqmKpYZzP/Ja4zhrXaN/iDDqpS8tspaPFI2VsuiWiNquBaMQ
	bG+VTbY9oAml41zloGn98Mozg9NsynrjXBYQm0WCigW7TV9c7ST6T2g=
X-Gm-Gg: AfdE7cnJHAqbjIbLPO7KtwUSf+V5fT0WuFKWCvQ4/f9lXjHgRPgAmrz/uewWni9IdFH
	4jejvmZY3zBhSb4hZWRgbolA+v2jREZ+Pfca9JlEkq8k78ikqafKxSxAATsutNaXpTMwR++5O+y
	xOILvJIpGuMpgrsr5xghDs6vwcD2xja1Fff8BZT/ypqN9g8Y07HKX+SH1FHNiwlxDNpv46qRjno
	L0XYZtZIeplFtgDkYDs4Y4TUraktsX/CZpD/7snhy5Pw6Kfg5uUsrPEjFiVg8k+mP3YmM+4bzR2
	dk0Fpt49IbKBKp0W80+jFY1nQjm2i7NkBsTtbJEdaks5qetWIngooE5nKlfciyfePBY432C/cUi
	qCGYCCUil2ljA/LpPAQ1ipEPJEdHwnE+xt2FNyI8uvfvviCxUCUNbFrrAIhAD4uTN4KPTQGk5h9
	p41fmQcs6OH09vsQJteI4JLO5b82qavpEBbraVtgAYfVkIQcDSnU+GpoQg/dCeMPtNbcvfWEn43
	2vainn3Ip9N7/bw/PIPt90ra5LEwhOac4b94bN2xAZMlV/v3aUXA6vnrnXG
X-Received: by 2002:a17:902:f70e:b0:2c8:21c4:e14a with SMTP id d9443c01a7336-2c821c4e303mr8737065ad.17.1782466458239;
        Fri, 26 Jun 2026 02:34:18 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f63b2e18sm36677835ad.41.2026.06.26.02.34.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 26 Jun 2026 02:34:17 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] clk: si5341: disable input clock on probe failure and remove
Date: Fri, 26 Jun 2026 18:33:07 +0900
Message-ID: <20260626093410.67573-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

si5341_clk_select_active_input() prepares and enables the selected
input clock, but the driver never disables it. The devm-managed clock
lookup only releases the clock handle; it does not unwind the
prepare/enable count.

Track the input clock that was successfully prepared and disable it
from both the post-selection probe error path and the remove path.

Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/clk/clk-si5341.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 2499b77..14f80a5 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -74,6 +74,7 @@ struct clk_si5341 {
 	struct clk_si5341_output clk[SI5341_MAX_NUM_OUTPUTS];
 	struct clk *input_clk[SI5341_NUM_INPUTS];
 	const char *input_clk_name[SI5341_NUM_INPUTS];
+	int prepared_input;
 	const u16 *reg_output_offset;
 	const u16 *reg_rdiv_offset;
 	u64 freq_vco; /* 13500–14256 MHz */
@@ -1463,9 +1464,20 @@ static int si5341_clk_select_active_input(struct clk_si5341 *data)
 	if (err < 0)
 		return err;
 
+	data->prepared_input = res;
+
 	return res;
 }
 
+static void si5341_clk_disable_active_input(struct clk_si5341 *data)
+{
+	if (data->prepared_input < 0)
+		return;
+
+	clk_disable_unprepare(data->input_clk[data->prepared_input]);
+	data->prepared_input = -1;
+}
+
 static ssize_t input_present_show(struct device *dev,
 				  struct device_attribute *attr,
 				  char *buf)
@@ -1571,6 +1583,7 @@ static int si5341_probe(struct i2c_client *client)
 	if (!data)
 		return -ENOMEM;
 
+	data->prepared_input = -1;
 	data->i2c_client = client;
 
 	/* Must be done before otherwise touching hardware */
@@ -1803,6 +1816,7 @@ static int si5341_probe(struct i2c_client *client)
 
 cleanup:
 	if (err) {
+		si5341_clk_disable_active_input(data);
 		for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
 			if (data->clk[i].vddo_reg)
 				regulator_disable(data->clk[i].vddo_reg);
@@ -1818,6 +1832,8 @@ static void si5341_remove(struct i2c_client *client)
 
 	sysfs_remove_files(&client->dev.kobj, si5341_attributes);
 
+	si5341_clk_disable_active_input(data);
+
 	for (i = 0; i < SI5341_MAX_NUM_OUTPUTS; ++i) {
 		if (data->clk[i].vddo_reg)
 			regulator_disable(data->clk[i].vddo_reg);
-- 
2.50.0
