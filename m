Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C4043C069
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 09:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837554; cv=none; b=tIb8XLvG5XcXZdw0zHyp6+Qbla12H2e80QbTZINip0D07e0Bah2GWAdVS7WaO/TjhS8PPPJuWKZ4OtnsfmZzFGJriu4NkQtyZzFR5kkCeRe8AIT4sA0XrhJUvGGP+l0HDAsPCdmd16R26FtbFHF0sSEZfuuxBaAiOw8xSO/c+rM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837554; c=relaxed/simple;
	bh=6PSsCPf8MT5m6CKTyNMHZfTI8nn23Liu9P17dyBV634=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QyBQ9CBjuxBPaE95PYUijI8GKokmKL3SGJEl2sPjiYKrkL9CRgocXqmXw8k7abYd4+W5t+W+q2ATl977CN6HTFDV8zBDTg52TFAod/gydcKBf2HzmeKGyqbSUeXgIjCJDcBPRnt9/enoZccdHr8SOHjo/L8VJQhavDsyPvSBd0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mNVdQSvK; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mNVdQSvK"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so8854884e87.2
        for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 02:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778837551; x=1779442351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=icODYKZ/3Y13ZM7Cds9bqBGuxOVMpNeuL9sEGrF2bZE=;
        b=mNVdQSvKGtMlt5BLtbhw8qmtb/0zzuyVCkr2uzvVqLmAtMe7GGU6J+wh5442tvCuGS
         s3lWiYd8PrhBtuJOGzlLovpn58LWbL2MroYE602sB8yRKDzhim3T7xD7FAcGNlHe5SEu
         FZ7xbZY/ChyRhCAv2Wk1NdQ2DG803wIWdqhsrmUMdUwvSKmIHzvIhjEaZJORox+V5KbI
         udbK3O8ewETkuoyWW38CEx0r1aXeZjHClNeOHKSTYvO/H0yCUxtqQI/Qa5mcby64G1rm
         1Os0oltfidmaYuD3J7zFcPOxu6krhgjidYS6keu/KMk2ep1q2bECIpV5Di2SFfNzgoKU
         V1UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778837551; x=1779442351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=icODYKZ/3Y13ZM7Cds9bqBGuxOVMpNeuL9sEGrF2bZE=;
        b=YflkDLadsBlo2jcrCYrcBtVZBJcADxdgUDGFK75NZOYIYEHVXY68ih1TVdxXSQOSv3
         oCndvp4q7qANoDLyIidS0M4eqhYReh67KqpnVqhiCsa3OgBrqt/t/x2mABZAvUiFVdoy
         Pl6aMPqLrNcxlQ+FQqYXDNimOkeVJZaugPnBYhoAgyptqPsfXKs5wT1sb3FmQdSDnWLQ
         1IYtBOHmtK+5USdeVo+dWWYkNcu3bWO35RG+kbctIHetIidbsdym2/7ioS6bVCeyPXSR
         VJwEYrMPbKFMEErtOno3KdH0JiKFlbiwAs4x3JnXfYgcn4bk6ZhPnDpZQbAH5fO7GXP5
         X+Dg==
X-Forwarded-Encrypted: i=1; AFNElJ8O15e5UE9cXQlRMer1uWUKJERX57cei/QQsmD4hCA0+izZuvNovpaWgAPMvm1m3pRbsA5KN2QgZqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6emV97+qkBSgJhCA/JZ5d1tivKP9QaEthORsKOM7imJkjVXrN
	0SS2p+FDJeeQe2CNVQNxv4GR3q5UQPjzW6MFvfWfzE4OIQWBuUno/ZaN2nUtWoKO+iE=
X-Gm-Gg: Acq92OHeEth2IuVH8ulOR0gNGSlOPu+sb3RwbWnuHijqHqO0hGtz+u85MejMY95ZI8f
	jHfYvRXgjVk3BrZ/LmkwKuJ+bDmapO6jlHXvDb1pzKPH03jTZIA3mGYGwwAoAfcgoXYjzMsfWB2
	4jbW4pcnb2fmXYKW384t2mmCPpmfLKQFAQ72usHvKDphAlzoPtRqIkF1xP/u9S1X3rFMEhYoGSA
	BLgRbUU234xOpytSqz6waSRuFiUZ4If6zX6H8cttrgd3CPigORYIWvsy04XA8jcUo+SYS2PTdnL
	tViCidyHiKoNvxJwCp6nosyjfYeMEDgegatSa4cpWXSryY6WHkUDhbu7oSMGCar7FuSi9aYl5XA
	ZY8GHtYVK0KeF1A5pziEEzCE4c3aUSzL587ajkplIh3K0KmY1mFhZVzPQOn7P5UV3yhuRO5pDib
	HGaPPBnZNKO/b/MKsbzfB3dQ5Cw2h5LiH509GLGnl9F2jVQXtobNP7AhJnlcUEB+rzs6oaYnxhb
	O7O2ubYd2UXhH3ePhs=
X-Received: by 2002:a05:6512:3b9b:b0:5a8:950f:e92e with SMTP id 2adb3069b0e04-5aa0e73059dmr1300539e87.23.1778837551168;
        Fri, 15 May 2026 02:32:31 -0700 (PDT)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c5e5sm1181661e87.3.2026.05.15.02.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:32:30 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 15 May 2026 09:32:26 +0000
Subject: [PATCH v2 2/6] firmware: samsung: acpm: Annotate rx_data->cmd with
 __counted_by_ptr
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-acpm-tmu-helpers-v2-2-8ca011d5a965@linaro.org>
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
In-Reply-To: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778837548; l=2534;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=6PSsCPf8MT5m6CKTyNMHZfTI8nn23Liu9P17dyBV634=;
 b=iCYwdVYT6ikyAuAHFKMY96Zb8VzivsZ/FGir1N0D+I9Bvv3JY2d7O/aVAlgEV3biuCuMwQejE
 Qa50TNwhtNPAFrevpDUGgvg10E2bG3cpWCB7l19gLo9OjBj9FgBlE9r
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Rename the `n_cmd` member of `struct acpm_rx_data` to `cmdcnt` to
maintain consistent nomenclature across the driver (aligning with
`txcnt`, `rxcnt`, and transfer helpers).

With the member renamed, annotate the dynamically allocated `cmd`
pointer with the `__counted_by_ptr(cmdcnt)` macro to improve runtime
bounds checking.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
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
2.54.0.563.g4f69b47b94-goog

