Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795279173;
	b=a8H3++jBlB8SLuTHqxN1uUNg961+GbXHOyETRrV24iFQG2ggforBNPe42IqXDb4wuboa
	 aillwiNi06oCV5tmfVeQtJZdoiEvIroHK0PVB4PjMVgbhMU6Or7q6wL+Kskp79AJYYLtM
	 hJW+VviWaTYbq5VsJnoN/3ETvchjQS+k2UPzDw/IiXzqE5IMB/QfcIYXNReXCmLBprc93
	 WdO+SPnmg2/TNAxouqdieGFIYoQkQDra3VRR/ZtTy+8tFEVh1HIpHR2XrgiQUYJl5yH4Z
	 Z25NTe4+4v1dIGQf1n5NTaDuMV3N+p9xe+cXCVFtsH6GMsMoCYmJCO4+dUyJOBzXLlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795279173;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
	b=pF5eXceGDQ8xJU2oD6TXoz/EFbb6reQWhwFuyrmNZfB0pk6ycKnN6MKjMHSTRB+605/B
	 5M18/pkFp9X4PnTDhxi8fgqrQr5v/t4NcJ+ij+BinWlN0oheAj71E0baTJp+MQor1utE1
	 clddwnUDX4QxlLreheotFAfxMagfQEQklInzEKlLWByAbCasvDiWDrHd9WiuHDjFRBrVi
	 7W/NpE91Nf/GKK9FlDvrKDPIn+G3HUQ3vH5yAbbST1QWF9KxyoxINqsmUXcV+ROw6d6a9
	 PWNPjoX1ALIEpAXzEYB3Z3Hs09PD8331yHa67Oiy3PvZxS+UnJnpqrp8+DMAX680b5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elwNxqNl;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D2F606A320
	for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 16:39:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12D2F606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elwNxqNl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso16287365e9.1
        for <linux-clk@vger.kernel.org>; Sat, 21 Nov 2026 08:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795279171; x=1795883971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
        b=elwNxqNlg9w5HA4LpyiiqlhnV/mtuNlaGEuQHi7q1/TQd1LxWvhsEROrLfyl+oUeQt
         RdhMat5q2HO24mh7XjReHGhzbHiWH5k04ifg8LlWxuel68EZ69OLJozB7gZqJH3PqD7/
         dyEN1Z2uYfE1PMdC4CkcLFlgejYSp/b+149udohvf91lqJk/weZkc/cdNPWIX3E7+x1Y
         5KIJyvRXSCSfQcz3klDvWB7u7gIC9qSNF2mM5aEY++25AaAwTzWcC2XS2EtgsY+uYWo1
         ofWKvYFwvgjEgKCL9PVjZ0VOU9LwZsYwv5rI6V+uokTIAXmN7uM5SFoJqmGm00TNMghq
         9gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795279171; x=1795883971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pLQTRcXUJhUmLmDSMnhR3mvBdnibH29NsZJ/odBJs3k=;
        b=0TtRffXPGIy0U0Vn2WyBzLQTr48CiNReuQ39bypk1rptIpjj5BU6WwVIMoVo4P3+1R
         YBC6/h4z+V6YR3KZXTaMFfGv/2QMnMjMTUt4auJ5Wl75zHv7KIMuwneK4fQeVYYlxavm
         D1cETSYejFbSETJpRiDTU1HPRO15FOJTpw+CYYgZyvqj1oPcF4ihkX1oo5Yyt5MPP5J7
         TPzcHNAsB/F1tiZ7AT+N3SA69KNOf917ym/X2A6OHwEtkx+RqLl3gvMTk9ZzNN3Ftn7w
         9F8qCRy7RVYdS7OEDczEQwFp5Bk19xMtbIzkNjQIEOblzRAPVZ85d1XrdD2KdGsk5XoH
         AmCA==
X-Forwarded-Encrypted: i=1; AL+hErHEfhgrt6qRwKbOOII8wBtx5CBkPpZT/G+QuUlM1GiI5SF3xP/Tuc4Zma8JZ4oIGhEt36tRl5cG2jI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LMlr3cO7DgYzeOzYBQ72SS5QawRwH8YxCapdO0dAlSpsoRROJ
	LUw61YgzaPjIsS3QdtgMynguJhtPIb6CMRf30iXUyHTeMv9zmyASnK9j
X-Gm-Gg: AZFdTZdOdomlFh7k4OL3URI6m1uDaWD6ryzrD01WLrfNzuWaEDmyh4+pnEAIAfPXKzy
	HtoCP0sHMa/UsCcSsYWMNEYw3ZJ7rnfbqPaqLqxdkelJIapr5ban1CBeYXMrbrK4C0A0r6+1+ds
	hXOWeGEgGnA46e+rKPjiiYpaD6Yiwd9Pwu0khPK7dRefFkNjXALcZCISK7otOW/R9bGSRvYkgkX
	DzZ8Oe+P3E0E8OJiIFRqU+BnJkYv3DB3HSSOZ1P39Wr6Rh8WeApwWnWf8s9gTPEj+UjcNr7i/I9
	cxStlEPuh2t2sbceabIygV08l5MadPGeBObeDkeRcI9BpV7qT2ORDQaUsTKDdPG4FCDLnSEoE6d
	Qmm2/wRuarbN0Y3KFwQPjGfMYuf7xymmVjV+psydMU77YplX8Ru/Eu2J0mS0dEL12f961tHkAar
	pyEDaDBIicQ5hWb0S1w59+Ot/isR4gDJjrLP74klHFkkDwYwhQrLWSjz5fe8ypZRsyJHzpTaiwZ
	3DpSWwJdtFI98tu1LTXIao0mBKVDoDq6mB5PocZmJaYl3TgvZ9fl+s+cEHUvfcsYvTXcjB0i3Ft
	cZ39vD4XzMD6FK/yUQW4sBL+06gy0ojn/GFOXu90zAbrcVd+RvNBYWIWUOhjclZPTeEOqz1z
X-Received: by 2002:a05:600c:1549:b0:4bb:741d:ea8 with SMTP id 5b1f17b1804b1-4bb8880ad4amr140075845e9.7.1795279171363;
        Sat, 21 Nov 2026 08:39:31 -0800 (PST)
Received: from localhost-live.home.vlan10 (053da81f.dynamic.tele-ag.de. [5.61.168.31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8d4f9aa8sm140114675e9.4.2026.11.21.08.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 08:39:30 -0800 (PST)
From: Joshua Covington <joshuacov@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joshua Covington <joshuacov@gmail.com>
Subject: [PATCH] clk: rp1: allow the clock provider to be probed again
Date: Sat, 21 Nov 2026 16:39:15 +0000
Message-ID: <20261121163915.86681-1-joshuacov@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The clock descriptors are static and are registered directly. The
clock framework clears hw.init once a clock has been registered, so
when the RP1 device is unbound and bound again, the second probe
registers clocks without init data and oopses:

  pc : __clk_register+0x5c/0x9dc
  Call trace:
   __clk_register+0x5c/0x9dc (P)
   devm_clk_hw_register+0x5c/0xe0
   rp1_register_pll+0x24/0x40
   rp1_clk_probe+0xc0/0x168

Keep the init data of each descriptor and restore it before the clock
is registered.

Fixes: 6486341721a2 ("clk: rp1: Add support for clocks provided by RP1")
Signed-off-by: Joshua Covington <joshuacov@gmail.com>
---
Tested on a Raspberry Pi CM5 with 6.18.64 and the Raspberry Pi
downstream patches, where binding rp1_pci again after unbinding it hit
this. Applies unchanged to v7.4-rc3 and builds there without warnings.

 drivers/clk/clk-rp1.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-rp1.c b/drivers/clk/clk-rp1.c
index 1dd276dd2..5c3929e93 100644
--- a/drivers/clk/clk-rp1.c
+++ b/drivers/clk/clk-rp1.c
@@ -363,6 +363,7 @@ struct rp1_clk_desc {
 				       struct rp1_clk_desc *desc);
 	const void *data;
 	struct clk_hw hw;
+	const struct clk_init_data *init;
 	struct rp1_clockman *clockman;
 	unsigned long cached_rate;
 	struct clk_divider div;
@@ -2418,8 +2419,15 @@ static int rp1_clk_probe(struct platform_device *pdev)
 
 	for (i = 0; i < asize; i++) {
 		desc = clk_desc_array[i];
-		if (desc && desc->clk_register && desc->data)
-			hws[i] = desc->clk_register(clockman, desc);
+		if (!desc || !desc->clk_register || !desc->data)
+			continue;
+
+		/* The clock core clears hw.init of these static descriptors */
+		if (!desc->init)
+			desc->init = desc->hw.init;
+		desc->hw.init = desc->init;
+
+		hws[i] = desc->clk_register(clockman, desc);
 	}
 
 	clk_audio_core = &pll_audio_core_desc;
-- 
2.56.0

