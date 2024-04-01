Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD39C121;
	Mon,  1 Apr 2024 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711959862; cv=none; b=Xze2cOMQGz5g73geXEKG/mZHpMROM82i1spG3VrkWJj40x++BerNCt6kjTY7NBWQD01RVXUcygVQofsu4SQJ7OtCku3oIHimL8/rH4mhRWo9axkgDQePtdD75JEHcv0SsSLB/0tAIlYfaXO5fonKOwwxkX5vhQoAydcVE0cYItI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711959862; c=relaxed/simple;
	bh=L12lUHlozcoVb+KBswLm5T+95y+6c1clmdhh8enkvVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lADfBcboaXnXLxHgzjsN4qZ2JbrUlL8oDfVMh20c9yo5Xfz90hVvscicmBcoKGWXWoWysrTxhJHAuFuuVjuxdmozkiozW1oQwp9FjfBG9vVDitFTnPTHaWJiqQD/UhZ3JRAKMktLZWHcsR057N6nTSTaK8IZRGSbXRA2mGT7JSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxG+ksbwpm0eghAA--.59680S3;
	Mon, 01 Apr 2024 16:24:12 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxaRInbwpm_yZwAA--.10527S2;
	Mon, 01 Apr 2024 16:24:08 +0800 (CST)
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
	Binbin Zhou <zhoubinbin@loongson.cn>
Subject: [PATCH v2 0/8] Add Loongson-2k0500 and Loongson-2k2000 clock support
Date: Mon,  1 Apr 2024 16:23:52 +0800
Message-ID: <cover.1711504700.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxaRInbwpm_yZwAA--.10527S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Aw1UAFy7Xr1rWFWxGrX_yoW8AF4Upa
	nxuay3Gr1DKF1xZryYqrWUArn5u3y5JasrXa15G34UCr4DC3Wjqa1xt3WYqFZrZr43Aa42
	qr95Gr47CF4UCagCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1q6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUAVWUtwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	tVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r4j6ryUMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU14v3UUUUUU==

Hi all:

As we know, the Loongson-2K family of SoCs (ls2k0500/ls2k1000/ls2k2000)
have a similar clock structure, and I support them to be configured with
different parameters (e.g., register offsets, etc.).

To make it easier to add support for different SoCs, I refactored the
original driver to make the whole driver as understandable as possible.

Briefly, I have divided all clocks into three categories according to
their properties and their parent clocks: Independent PLLs, clocks based
on frequency scales, and clock dividers.

Thanks.

----
V2:
patch(1/8):
 - Drop LOONGSON2_CLK_END, for it is not a binding.
patch(1/8)(3/8)(5/8):
 - Add Acked-by tag from Conor, Thanks.

Link to V1:
https://lore.kernel.org/all/cover.1710926402.git.zhoubinbin@loongson.cn/

Binbin Zhou (8):
  dt-bindings: clock: add Loongson-2K expand clock index
  clk: clk-loongson2: Refactor driver for adding new platforms
  dt-bindings: clock: loongson2: add Loongson-2K0500 compatible
  clk: clk-loongson2: Add Loongson-2K0500 clock support
  dt-bindings: clock: loongson2: add Loongson-2K2000 compatible
  clk: clk-loongson2: Add Loongson-2K2000 clock support
  LoongArch: dts: Add clock support to Loongson-2K0500
  LoongArch: dts: Add clock support to Loongson-2K2000

 .../bindings/clock/loongson,ls2k-clk.yaml     |   4 +-
 .../boot/dts/loongson-2k0500-ref.dts          |   4 +
 arch/loongarch/boot/dts/loongson-2k0500.dtsi  |  57 +-
 .../boot/dts/loongson-2k2000-ref.dts          |   4 +
 arch/loongarch/boot/dts/loongson-2k2000.dtsi  |  19 +-
 drivers/clk/clk-loongson2.c                   | 549 ++++++++++--------
 include/dt-bindings/clock/loongson,ls2k-clk.h |  56 +-
 7 files changed, 408 insertions(+), 285 deletions(-)

-- 
2.43.0

