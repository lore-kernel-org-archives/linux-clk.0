Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15B3F331215
	for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 23:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768520582; cv=none; b=pNQqFJJU2g+A+HnRudFndnkv0IgOLdkiXDPlEjLbNwe4BT5PeIGVHHeFD9yPRx4d8G3pc1vVvS1iaHM0AVBadFWtCNPVZHhSF0/muXMRkpzVv5cxO2CvZ+Lw8pDC36ZW+YxkHwMmZDBied+PQlOSpt3UCVFApTRkmEUNPuubBo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768520582; c=relaxed/simple;
	bh=Ylr1ksiIyLAyPY7iXL/dycbAN3cQLzZmATzrikSFelA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f6TiNTcCnMelTF5NsOZFkMHeE0EAiAPG4C6vXHH756fztw79bBT7RM2UC/v37T276njJia2roRxi+fpaSUJGd5x8hZZyPrO7j9K8B8E21sr3qnUjB/rhxOk2hAB5r8p3WkaCyOdAj1A357Q+9WFnZclAhNFUnlS3ICyJj8itVKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=OwQ1zwsq; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="OwQ1zwsq"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7904a401d5cso16316627b3.3
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 15:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768520573; x=1769125373; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Wiua7ymfJDhSGN5M3Dn0d7IWpEsqVX/pz6WUwMkns=;
        b=OwQ1zwsqJddjTJitEZSy0LnAf0QQ2cEB+5midBl2oG6zvHiWl1myUbexlMtp1F3IRX
         RBqutwr6eXdmdk0SgwjsIvSt68s+8bZuMRKlFrbnST69AcFAawlGx9zradzEz6erIvmY
         F+iCF9l+L4ec5hi4i2k6yyueJmzdxDn7Juq2NW30nPDhhTvikrnEvVmxRHJOdN9FoaWQ
         2uKPsVmHr/wmUmhAzTb4BbUnvbSDA2O+v6noAgJNgDMuQAZ9CSsmsbRXPuKhvv9M3k1l
         +nyKDLpN+xkzGvfZ8Obv0fJlaxVOXMUV5+e20Fj/Onxxm9aGf5yolz96R1L2olv2Johk
         yxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520573; x=1769125373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0Wiua7ymfJDhSGN5M3Dn0d7IWpEsqVX/pz6WUwMkns=;
        b=AZNx5DB1PnCs2JCfgsL2d7DaY7HPqoLHpj54vW41KW/8C26oASQZKb9TIFXtzuCH+4
         5LLUd4Izm1GtVx6jN3B6eCbcDV9XFwScweDE5n+/7e8ZgMtnYm812nCUizW8XKffVKZ/
         3djN5C9p87KhC0fa6f9IoQ6WWao5v12K3iO0SW6/8NTIusZKgVd+hSpKe4ooFVZXv+WU
         +54fyBCcTD4TYgzMxxfrbZ2fDEIZgahFNyvJQNXFddksj10v/mEB3OUdCgoqLRUP8AuL
         TYUyqgSJHhaEvFdI1fgvytQFdrWrahcWgrEegzfz6ZyfJ3dbEXUe6nUhYzMckY0htIAb
         dCpw==
X-Forwarded-Encrypted: i=1; AJvYcCVr5xx0LmGy9qDxqw+oSDLVzweAcenofFJ2f+zq/qx4GJ7/Vr7eLnsOcHhQTQSsbbFRLifr/eC0apM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFm+Hv/BXQ4pcAvDxIO55EbzacUdKG54AQnYQdgulM+xUO16sT
	wqfsJTZrX3u8IwHG5gscfCnrBtJfjxX6ysPXawQkxCL934so12divxb6YFnwFvkeY4c=
X-Gm-Gg: AY/fxX5fitySv+BPMxN25rcI5Tp1PbcKfmAixxVWav5oNk57s5AWP4r7mf6lqgZxjFg
	5kso4EoEgATVB23VJ0VLFK8LJwUmaiQK9gtj4T7axpZ2O4UbqrDXa+54XD0WVqb0UutraaMT/Wj
	AIbs82Y9G1VB7yavfKVxyK4yjKihD4BvstpK6OfQaazPuoooFDgg8JB0OjqTIuyo5UwWJo0LWke
	aRsekYK6/ZhLbf1K9zw5eJdTzNUsAC5VUGR0LqK/0pJDHKPy1+8DzYAHONvO7uhFwLYxxzUxnsF
	NhaDLIUy4FfmPXcoQLHzLgujSnmG4CKRgdIAgI5D8NbM9L8PhQOGNpZ7AkJH+FSJM70Ps369JKz
	odO6tzh3I5yMoirUwwHJUK2gfkVNlijGX2blYLajZwBXxJGzI4CtfhfklY+WWeE9QV5Ma8sGkIA
	g8sFUXb+h8luRmPX6AN/LCY9pWLYePJqyMsMbet3o3ASKd8+7ZJK6V9iEL3KfNbvKVqAeVLGmh0
	JE8fd6PVw==
X-Received: by 2002:a05:690c:670f:b0:788:1cde:cac9 with SMTP id 00721157ae682-793c52b193cmr12384547b3.23.1768520572934;
        Thu, 15 Jan 2026 15:42:52 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-793c66c72aesm3027117b3.11.2026.01.15.15.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:42:52 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Thu, 15 Jan 2026 17:42:07 -0600
Subject: [PATCH 8/8] clk: tenstorrent: Add reset controller to Atlantis
 clock controller probe
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260115-atlantis-clocks-v1-8-7356e671f28b@oss.tenstorrent.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
In-Reply-To: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com
X-Mailer: b4 0.14.3

Create a reset auxiliary device during probe of clock controller

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
---
 drivers/clk/tenstorrent/atlantis-ccu.c | 59 ++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
index f3a2ea49a82e..e4f56018907f 100644
--- a/drivers/clk/tenstorrent/atlantis-ccu.c
+++ b/drivers/clk/tenstorrent/atlantis-ccu.c
@@ -491,6 +491,7 @@ struct atlantis_ccu {
 struct atlantis_ccu_data {
 	struct clk_hw **hws;
 	size_t num;
+	const char *reset_name;
 };
 
 static const struct clk_parent_data osc_24m_clk[] = {
@@ -706,6 +707,7 @@ static struct clk_hw *atlantis_rcpu_clks[] = {
 static const struct atlantis_ccu_data atlantis_ccu_rcpu_data = {
 	.hws = atlantis_rcpu_clks,
 	.num = ARRAY_SIZE(atlantis_rcpu_clks),
+	.reset_name = "rcpu-reset"
 };
 
 static int atlantis_ccu_clocks_register(struct device *dev,
@@ -875,6 +877,59 @@ static int atlantis_ccu_clocks_register(struct device *dev,
 	return ret;
 }
 
+static void atlantis_cadev_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(to_atlantis_ccu_adev(adev));
+}
+
+static void atlantis_adev_unregister(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int atlantis_ccu_adev_register(struct device *dev,
+				      struct atlantis_ccu *ccu,
+				      const struct atlantis_ccu_data *data,
+				      const char *adev_name)
+{
+	struct atlantis_ccu_adev *cadev;
+	struct auxiliary_device *adev;
+	int ret;
+
+	cadev = kzalloc(sizeof(*cadev), GFP_KERNEL);
+	if (!cadev)
+		return -ENOMEM;
+
+	cadev->regmap = ccu->regmap;
+
+	adev = &cadev->adev;
+	adev->name = adev_name;
+	adev->dev.parent = dev;
+	adev->dev.release = atlantis_cadev_release;
+	adev->dev.of_node = dev->of_node;
+
+	ret = auxiliary_device_init(adev);
+	if (ret)
+		goto err_free_cadev;
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, atlantis_adev_unregister, adev);
+
+err_free_cadev:
+	kfree(cadev);
+
+	return ret;
+}
 static int atlantis_ccu_probe(struct platform_device *pdev)
 {
 	const struct atlantis_ccu_data *data;
@@ -905,6 +960,10 @@ static int atlantis_ccu_probe(struct platform_device *pdev)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
+	ret = atlantis_ccu_adev_register(dev, ccu, data, data->reset_name);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to register resets\n");
+
 	return 0;
 }
 

-- 
2.43.0

