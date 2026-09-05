Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728C74B2CD3
	for <linux-clk@vger.kernel.org>; Sat,  5 Sep 2026 15:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788622363; cv=none; b=rf8qDkpcdLnbJy3jLDTIM6cnwp1rGzCgyqSTeeO7YhVhxbl4EiQwu8Aa+C/0FHDOFdwmETRnmRLKvlpNqRGdIrcCU4LbtGiapPVZvfhtoyxGj/B1e5pGvtBSO1hZlzmmB/50T0nq0tfebzovwNdkIad69W4av0niC6ol6dW34/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788622363; c=relaxed/simple;
	bh=HlStx7vx3piFzayiVi0TqGQGaEyIJNcVSIFbgAKrR84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DeX3buRHH4D49xz7JEINtMYm3dW4/1C5xKcJ/uyatgyvnUgX+Jxx717c/FxEig2IHM+vI/ZFBJ6er6J9YX4ubuvXLR46IS5QPFx6kWbBcV5NOIrnyJQRtlMrutHmidyk03RVJTE9hDiZVT9hnKsrz83TSZdIfDkwiEE5AExooaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4858303de5dso2480106f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 05 Sep 2026 08:32:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788622360; x=1789227160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rBqYYCS5py1zvvdbPLcK4Z1TQdgdHGp93LoH6od28Gw=;
        b=ACgLdxDMP5KzWIC95tbL5vLu47nfA2Q0traHOk5z3bW7rN2z60d9o0qKALdrmKjQZC
         oP5v6HjKtavwb4I9VKCIPiIaeeKjPYFfQqvPSegU6mvduySvFGWituh+gy9ZvanckByI
         kJjSar95xj3c/6OnnpRJJMUbrYV5tm6+Aqj4adkLHbbF6Z99/W0U7eKNMoUvUqYBkEZI
         HhI39kkTjEzAczelidao6qyJQpRz07xCIH3Z+kXTaY2dyLWje04rJ837EtidODGb9ZeJ
         A4V1KMQQ9bQlJoSPIK/ViviI2Ux/gTdG3G+Hw1/5WeaO8AZbzcpc8SyqBstpfXcTdz4n
         CdeA==
X-Forwarded-Encrypted: i=1; AKwUvByVAgi/x+YfiMNq5MsFDz5baLbBAVP1lnx1hlfDpyhXaiZ8eF0xCjFSP2vHyBaqRPC7hbEPI7czIRU=@vger.kernel.org
X-Gm-Message-State: AFuF++mlPMRVU45tp6A7XUS6AOkjJ73nqfiiebAz/sg9XGKMGl2yan4Z
	59adb/U4x4ELDjTGZGfM3to90JRVigJinhAuFqmQ1u1b7Evv/6WRaoVS
X-Gm-Gg: AYBFou1ZkU6CPoChjGkgBk+wh9C+UJlbgNfMNHrZ0ZsVYSGdaB+nE+pKRR5RbOKqWhr
	iX0PXaLeezAdiEIDGBJB8Sol4L2SOb2skkcKtsy+MWbGUeSM8MbiiHaJWVUdHzi8k8ysdcQfvOy
	c/XrDTEn7rDtcEHlSa0ZC1NuZDQ3sjNjBJAlIOtjbzcDkKP/DMHbR7AnSUQvlYEwGa7aNl/aIw5
	vAmXe3X3URz0URZN3eXvxO2GqUkz9L0+U8vaMkAswQ2hYmFfSKHSj2wka36YzrXv/xnSw0J9yKn
	fp4ntViQumg+ozrOExXUo1/0B0fXsWqXMvnoAClWuerT9el03hDPfuKgntxJzRybbA7OnbKa42t
	mJG/P6oRACPhW/RF9Fro0xKCb32IIwKgAvZxzkXkhrnETBx5w/0Wwshe2wlybPwC4ll4D8tGLgH
	Tdtyir3K2InARC6Pvqnna3HXF9oSA7CZANHvX9FBdQiwhC4SQqkkcaasDYPKw2//FhyRKPIF2Z1
	t7matucwwlRb23J1h0jlyurkQ==
X-Received: by 2002:a5d:5f09:0:b0:484:3332:d1ce with SMTP id ffacd0b85a97d-48586bf9cfdmr14652908f8f.0.1788622359412;
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
Received: from threads.localdomain ([84.68.179.181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c6ba4sm16691913f8f.25.2026.09.05.08.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 08:32:39 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Jian Hu <jian.hu@amlogic.com>,
	Ronald Claveau <linux-kernel-dev@aliel.fr>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as critical
Date: Sat,  5 Sep 2026 16:32:34 +0100
Message-ID: <20260905153234.133217-5-tanure@linux.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905153234.133217-1-tanure@linux.com>
References: <20260905153234.133217-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sys_ampipe_nand clocks the pipeline stage inserted in the bus path
between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
identifiable consumers - the three MMC controllers - so marking it
critical was the wrong tool: the clock should be referenced from the
consumer nodes and claimed by the mmc driver instead.

Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
have no single identifiable consumer.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
This patch depends on the MMC controllers actually referencing the clock:
the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
clock must land before this patch, otherwise the boot hangs and memory
corruption this clock caused are reintroduced.

 drivers/clk/meson/t7-peripherals.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
index 55d09e78593b..2f429ea86796 100644
--- a/drivers/clk/meson/t7-peripherals.c
+++ b/drivers/clk/meson/t7-peripherals.c
@@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
 static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
 static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
 static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
+static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
+static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 /*
- * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
- * used for DMA between the peripherals and the DRAM. After the clocks are
- * disabled, a device that starts a transfer cannot complete it.
+ * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
+ * the peripherals and the DRAM. After the clocks are disabled, a device that
+ * starts a transfer cannot complete it.
  */
-static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
-static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
 static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
 static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);
-- 
2.55.0

