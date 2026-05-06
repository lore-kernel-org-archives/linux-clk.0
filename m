Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E943D510
	for <linux-clk@vger.kernel.org>; Wed,  6 May 2026 11:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778067567; cv=none; b=gohBlx6OUHGu+UlVdZWHpyb63PQe8dv1wlphXOawQSXSEOxz31jlzGq772i8Qxw3i+H0qR8XtfqDSgxjeLos5AxSjTu/GortBWmZ00WZEpZ/vnsBZp2scWsv8JZFkFU8pTwZIEATcliel19DP+Jk2BL5N4H8lcbcSjpNcLKgQeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778067567; c=relaxed/simple;
	bh=InPW5aIoFLfi7L5QYj+FWyGxWg+TtOroOI35/SgGMrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jAmWJ8wnbESAJ/sZFzqTVDuteZ2PfKhq38tHnMJnCgJQ717y/vuMmq/jc+n6qKRqw+9uUrPe9TWzhhvarr9YbZOYTqz3aP0StI2gwqUkjGqV3OHC4ZOUDqOhKhsXgTe2IbhNVReR8ikdOyfXwsrz3ueDWhb+ViHyl2prsBMo210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c6zrL21F; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c6zrL21F"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-449de065cb3so3981311f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2026 04:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778067563; x=1778672363; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=c6zrL21FYNzEy3XDPYIAPJ+OMWEEd/E8i3oP3CjsPFRvIfDN4YuvBeDip+LUt4jds5
         UfYPpWGtd4g1nRgOB71YAvBOUAu0wgFpiNTwxyeRb92sr58EVDkb/hFAXC9hFu0Y/5l9
         8p9MO9OwUnF1STu75Kj0BCyG9ciVnxrguHN7PK1A2Pue7sVLvGEY6UIqUrzOPChlriTI
         jVeHxTYbdhL16AgxE8uAqI7WKfypImy4rlIHKTBuoFFbl8sNbT7hiTXv28jnKpq6Vfjf
         1/LQFFB3HDIkgaIIQsZF+t8ERpjkmomQwko7nuoh/zaqcR41aDCmAIdk6WkhmvZowTID
         TUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778067563; x=1778672363;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvGC3o+HXUBsO1osZIafgMiKf+lkJO3vUojNNgCQ4PQ=;
        b=DWl4TjlM9+BGLz1XK4vUI0/cFKzrnkEI6eY6ZalELKP+R6l5ITDrzVa/t0A6GogwrX
         UkJScBkieKvcGSd6QJOBYhs32dotl3FbfeJDSWfEOGMb1GoCv9o29egjS/crv+Ob4GVj
         G199QvM6ajxEc/sD7hljllEwXarXVLttdEYHLZf9Zm/hB3ge3M62YrMTIeECf1NtMUdL
         xL+FwgXJvAu6wjDmupyE//IW/yjtIOufLy7QVcVAU7SUo+5n7ywevbrH9LYvsTtKgoni
         FdMdX6SgaIuM/cNX1zoIMPha4sf+pH3y0jWTbydYEQ4pJT+7YV2GEUnPWzRQsY8uRns3
         gjIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+FtLTpBOigceGC5pGdYceRMcy3KvH7mh/bpVIHKoMXWw4c/40bHTl/Equofcmf4fOXBqGIpFsLRV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Gt+eInSqYkAfVhZO2i/2q7JOgIYN49VmiH+jrUg5qn/gGDko
	s6DRfHs74pVIxYgSJV0l2udRgjdp0IM2SDpNYUwtHwu+++Ciqj2jR0FizJwc2uMmFb0=
X-Gm-Gg: AeBDievQNvOKcVWKyRrs7tA9ju4sd1jR9MTVHvil3hsD6TECHfUDlST+I3ivwGfMi2R
	QfecHxD136jZIwSC3IgppMscf/azD07VymY3udHO5CmlWOwiSRKVWthBEwSjNu6a11UayCvh8ZR
	621c4kidhSpYpKD5/WD8/ajV00PYXE9+HEFuGc4vH2cFExP8zpSzc/1CPQhifIjwMeGLC7pn1zt
	NOjCyqe519dVk6pNEUdcCBPKd/S3vBwQTZcPKEb537o6EiTPT9WlzzeKJZ+OmW4L0OGsvTP1IpF
	tlrcHGE44K0UkPCVAmjNcdXjPQ1tRBB1MvRdGbwwSIX23en2t6FaImUxJo7K17XhN0XC5oxnO3T
	etL1+ehDwTRj7k9/dr83pIXLA2/TR+LdxbMaL1QgxSXqQFw33tbOotKtOob78vaFcbIpMHVDVPG
	zUxIgMfbJXx8Gk2zDGPHTeQkTnLVT4P3tRBjfilVEhv5epgZNt039Gf2FvA0q/y4Jl8ZVQq1udc
	m3NZzT31dhwQilVPw==
X-Received: by 2002:a5d:5d87:0:b0:43d:762e:76ba with SMTP id ffacd0b85a97d-4515b525abemr5169570f8f.17.1778067563093;
        Wed, 06 May 2026 04:39:23 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4505238e6e0sm11852350f8f.6.2026.05.06.04.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:39:22 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 06 May 2026 11:39:04 +0000
Subject: [PATCH 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with
 __counted_by_ptr
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-acpm-tmu-helpers-v1-2-a9cd5daf8355@linaro.org>
References: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
In-Reply-To: <20260506-acpm-tmu-helpers-v1-0-a9cd5daf8355@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 peter.griffin@linaro.org, andre.draszik@linaro.org, jyescas@google.com, 
 kernel-team@android.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778067561; l=2479;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=InPW5aIoFLfi7L5QYj+FWyGxWg+TtOroOI35/SgGMrQ=;
 b=pubO52w85UBt/AD2Icw0FjZhzPE1/uxNCqZC7wE3gbz3G3T+DYAk/KG32A46kRsJt6nvTwNLa
 uopL717hhx2AY4JcFM/7kgruUPkFO+YPujpA0lG1qTAm3QoXYbGW4Zg
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
maintain consistent nomenclature across the driver (aligning with
`txcnt`, `rxcnt`, and transfer helpers).

With the member renamed, annotate the dynamically allocated `cmd`
pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
bounds checking.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index 88a06842753d..fac88c427d2a 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -105,14 +105,14 @@ struct acpm_queue {
  * struct acpm_rx_data - RX queue data.
  *
  * @cmd:	pointer to where the data shall be saved.
- * @n_cmd:	number of 32-bit commands.
+ * @cmdcnt:	allocated capacity of the @cmd buffer in 32-bit words.
  * @rxcnt:	expected length of the response in 32-bit words.
  * @completed:	flag indicating if the firmware response has been fully
  *		processed.
  */
 struct acpm_rx_data {
-	u32 *cmd;
-	size_t n_cmd;
+	u32 *cmd __counted_by_ptr(cmdcnt);
+	size_t cmdcnt;
 	size_t rxcnt;
 	bool completed;
 };
@@ -432,7 +432,7 @@ static int acpm_prepare_xfer(struct acpm_chan *achan,
 	/* Clear data for upcoming responses */
 	rx_data = &achan->rx_data[bit];
 	rx_data->completed = false;
-	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->n_cmd);
+	memset(rx_data->cmd, 0, sizeof(*rx_data->cmd) * rx_data->cmdcnt);
 	/* zero means no response expected */
 	rx_data->rxcnt = xfer->rxcnt;
 
@@ -584,19 +584,19 @@ static int acpm_achan_alloc_cmds(struct acpm_chan *achan)
 {
 	struct device *dev = achan->acpm->dev;
 	struct acpm_rx_data *rx_data;
-	size_t cmd_size, n_cmd;
+	size_t cmd_size, cmdcnt;
 	int i;
 
 	if (achan->mlen == 0)
 		return 0;
 
 	cmd_size = sizeof(*(achan->rx_data[0].cmd));
-	n_cmd = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
+	cmdcnt = DIV_ROUND_UP_ULL(achan->mlen, cmd_size);
 
 	for (i = 0; i < ACPM_SEQNUM_MAX; i++) {
 		rx_data = &achan->rx_data[i];
-		rx_data->n_cmd = n_cmd;
-		rx_data->cmd = devm_kcalloc(dev, n_cmd, cmd_size, GFP_KERNEL);
+		rx_data->cmdcnt = cmdcnt;
+		rx_data->cmd = devm_kcalloc(dev, cmdcnt, cmd_size, GFP_KERNEL);
 		if (!rx_data->cmd)
 			return -ENOMEM;
 	}

-- 
2.54.0.545.g6539524ca2-goog

