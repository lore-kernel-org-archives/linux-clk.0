Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 861F2D515;
	Mon,  1 Apr 2024 08:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959869; cv=none; b=aLnp4XGg5usGXffgScFtRcUG1o2Oj09ftCzM/kgQLy3lxLzyqhTMs59/UIRbHtHT5yjdA0E9/0m029u8MpCFvhJtGMSMfqsiw3B1TaD41fC05GIokLkls6a91HWoiL+5QGLtpvyfejzxwa8U8g9xK44vEOzHBEkxVZ/zNDiAmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959869; c=relaxed/simple;
	bh=UHDVl3iRDdYI0DdjOOwUY+bd8BolB/6wHcZzUQYqok0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5Pz7ZC/3jljohMLZSEud40UWRKubrwSmYNrDrvSHjQIJuFFkmb3QzXduWWnx5UDwapcdKkSjMc3IxaJoyr1dcF+L49U+R4o8SRyRAOELE0Wo8PKDuNJiJP6mABGIyzQBSFTlpU0anCEcc5l0CZqCTpDMJ6A44vlCcIg+IjqYD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8BxefA6bwpm+eghAA--.13929S3;
	Mon, 01 Apr 2024 16:24:26 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxGBI0bwpmFydwAA--.10364S3;
	Mon, 01 Apr 2024 16:24:22 +0800 (CST)
From: Binbin Zhou <zhoubinbin@loongson.cn>
To: Binbin Zhou <zhoubb.aaron@gmail.com>,
	Huacai Chen <chenhuacai@loongson.cn>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>,
	loongson-kernel@lists.loongnix.cn,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Xuerui Wang <kernel@xen0n.name>,
	loongarch@lists.linux.dev,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 5/8] dt-bindings: clock: loongson2: add Loongson-2K2000 compatible
Date: Mon,  1 Apr 2024 16:24:17 +0800
Message-ID: <23d0d2f02810828cb77b613b09b8da8375713c75.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1711504700.git.zhoubinbin@loongson.cn>
References: <cover.1711504700.git.zhoubinbin@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8BxGBI0bwpmFydwAA--.10364S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj9xXoWrZr17Cr17Wr43Jr4xGFy3Awc_yoW3Kwb_Aa
	4xJ3WkXrs3AF1Fgw4qvFs7tw13ua9Fy3WakwnrAF1vy345Kay5tFykJ34akF97Wr43uw1f
	ZF4kGrWfZrs7GosvyTuYvTs0mTUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbhxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_JF0_JFyl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWr
	XVW3AwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x
	0EwIxGrwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E74
	80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0
	I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
	xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
	1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8_9N7UUUUU==

Add the devicetree compatible for Loongson-2K2000 clocks.

Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
index 83baee40e200..4f79cdb417ab 100644
--- a/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/loongson,ls2k-clk.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - loongson,ls2k0500-clk
       - loongson,ls2k-clk  # This is for Loongson-2K1000
+      - loongson,ls2k2000-clk
 
   reg:
     maxItems: 1
-- 
2.43.0

