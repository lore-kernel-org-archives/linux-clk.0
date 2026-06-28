Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CA323BD1B
	for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782663609; cv=none; b=ToyUYVr4yLmYeXTg+1Egryr31kxM0rbOtJy9B1v6wBV6HrG9rSjr6NCGc4IH4KhNwuEOq5BuSkR+mvKBP7AhZzLI7zdQh+l0CxHJB5y8Bu3mWKv8GEWKiZGIdNSlpluakbVOtSFuntuqKQ5qxaeDl5kygxz66KqQWKi2QcWCChE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782663609; c=relaxed/simple;
	bh=Nbf5EGGn3lkHfjDRMtqBw1NucK30uj5U/Isd5BvJ2N4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAaB+J//By9b1Dfbsy3rS6zj9L66I+N8zyj+fD35bVSD+qZEd6I4m0qgmDovGM66mn9Jx/dHf5xGCK9hm28d6gHA0wUIl4T8hX5BpIYYqMjgL4SHwLwSWWjph0mev38Xd0mu6WNLEx5fSPJdkE360/C5NrVqpMXrgNVL+fouOP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a+UVTpXV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a+UVTpXV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-845b6d9bf39so1148084b3a.1
        for <linux-clk@vger.kernel.org>; Sun, 28 Jun 2026 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663607; x=1783268407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDpZAt2IrybbNfg1qPYm1EXtgIkqc1OGq8+ZjA8nsrg=;
        b=a+UVTpXVcnRWrHKuWdKKrX4y86bHLTtlQqeVedKdo7g7U48u4UJxLpaZHmuP9Ows0K
         TUQf2B6UrNtXLCy4z5Rj77WDKpVirtDsmMGl4E3WEdiLarkfQ4gFBpt5aqep2u8d78ql
         IhWLXehPrQ+2yXxrXJw8IQkINrF+G0l33F7GQE/eEcOugwvpK+BG71vdAZh2feW8GvDX
         GZKnCZCxpO1L22skVSxs4RK6xSXjr3CjA4YsQO0cjWTxq9g20iz+mu/D78YUtNdT6E5G
         gwX+/La5ok3yfun0inbgWyEpbmscRUFFGVHUXDDV5Uu79SJf+5jrqg+rjzcaqwok9UWm
         A2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663607; x=1783268407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sDpZAt2IrybbNfg1qPYm1EXtgIkqc1OGq8+ZjA8nsrg=;
        b=CVnBG/Eg3VDHdmzwhtZXkG9IkR8aSXPkIc2Pj2BNT8jPEVfq2tUoFXBKpDhASt5Gv1
         eGeJimW/71ZSOMJnA2RzO2rWprFaDRPTKcGmKKY2hFWVxi8utiqMH9DdYjp1UPbc1j0P
         WRn64iki+ufUrZx46l3mxNQlI3rGwg3BF6jNVm7BusVJfUOf5XuahhUBiWYBCjOHLMB5
         LCp7blfuL/ZthjX0onrofxn6LvIQ3jXmDW2GRsTy6x4fPNzmDem7xmolv2HBUuqc0AkJ
         mkuzYgtATCGOzk+TEiRpt8R3H5B5CG8wJUgJro3KoDgvqdZaEiPwp1FLwvvu772Qg2Xe
         Rxxg==
X-Forwarded-Encrypted: i=1; AHgh+Rpvl4m+NmvV50PdnKkkc6DBEFIF1EDFKQ6xrPldFNF+rjPU80O+ZB8z0gHtEKOizcn9RiClBnW0zsw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzUqHgOzzxIpFYbw3Lyh+k+fmiRZJCMN5HxMV/ka3f3vcsqYL
	5Reo075LpWP1BQf878lc5UUVvwlHJtbaumm+lhPrYQkeQgvPf05putk=
X-Gm-Gg: AfdE7cmel2OGcBP+ORYIZnp3ABeUoTJSaxHI6rcgu6piXNcna1NQ/tAXRBXtl6Jn21k
	auvdwAcPUb2598xhLASiptga5dnnccHeTNOWgIpxknOaNABr0Ewqb2bzYQnQwCxw3Qfwbcocw6M
	mQ9lNjaph2mTh0XwFiahQApzLozhe4J+a7dbdDa6aR0D9Xn2XPO7gF/ksx6Xi7DnkHx0MYy5c5b
	D9Frn9P8mwMJJrWPGTUdOVehH+pcUVHja7JWfbyPpdGyWGBpWqZHj4qaGYyMlsZfffXCdk9//oC
	zzJ88rTagt9xaHyiOKA0GbTxK7Gg5On0OEAov3kwvBuIE4uM9T0UxXE3lXWEwklaRzth7ur9HrS
	YWlM9yLtcphfilUBYLlCWfHbCZCe4kuyPnUppdqW7dbmtVvO3hbr/JXgywGSvUINXOeUw2nMalk
	ZynbMGpB0imOAn8bbKzUQGpHkfbMgwgmTNJUfnmje3XV2snIxTZiFHCtkqpxWuBYTxyozgdS/Ww
	DZKRX08Y/lGmRn/zD+tCsb0CydjgFBqGDuHNtnMPcovraRu9w==
X-Received: by 2002:a05:6a00:4511:b0:845:d2e3:b9c8 with SMTP id d2e1a72fcca58-845d2e3bb71mr5830594b3a.28.1782663606629;
        Sun, 28 Jun 2026 09:20:06 -0700 (PDT)
Received: from localhost.localdomain ([14.5.152.27])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3fcc5ffsm10063450b3a.9.2026.06.28.09.20.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Jun 2026 09:20:05 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Mike Looijmans <mike.looijmans@topic.nl>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Myeonghun Pak <mhun512@gmail.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] clk: si5341: disable input clock on probe failure and remove
Date: Mon, 29 Jun 2026 01:19:43 +0900
Message-ID: <20260628161958.25876-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260626093410.67573-1-mhun512@gmail.com>
References: <20260626093410.67573-1-mhun512@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

si5341_clk_select_active_input() prepares and enables the selected
input clock, but the driver never disables it. devm_clk_get() only
releases the clock handle; it does not unwind the prepare/enable count.

Register a devm cleanup action for the exact input clock after
clk_prepare_enable() succeeds. This unwinds the prepare/enable reference
on both probe failure after input selection and driver detach, without
having to re-read the current input parent later.

Fixes: 3044a860fd09 ("clk: Add Si5341/Si5340 driver")
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Use devm_add_action_or_reset() for the prepared input clock.
- Drop the prepared_input state and manual cleanup calls.

 drivers/clk/clk-si5341.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/clk-si5341.c b/drivers/clk/clk-si5341.c
index 2499b77..2c36757 100644
--- a/drivers/clk/clk-si5341.c
+++ b/drivers/clk/clk-si5341.c
@@ -1426,6 +1426,11 @@ static int si5341_initialize_pll(struct clk_si5341 *data)
 			SI5341_PLL_M_NUM, m_num, m_den);
 }
 
+static void si5341_clk_disable_unprepare(void *clk)
+{
+	clk_disable_unprepare(clk);
+}
+
 static int si5341_clk_select_active_input(struct clk_si5341 *data)
 {
 	int res;
@@ -1463,6 +1468,12 @@ static int si5341_clk_select_active_input(struct clk_si5341 *data)
 	if (err < 0)
 		return err;
 
+	err = devm_add_action_or_reset(&data->i2c_client->dev,
+				       si5341_clk_disable_unprepare,
+				       data->input_clk[res]);
+	if (err < 0)
+		return err;
+
 	return res;
 }
 
-- 
2.50.0
