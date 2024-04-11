Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B21AA5D8EE;
	Thu, 11 Apr 2024 02:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712804311; cv=none; b=reve+hD9od0q19Z9rx/iNHqAm+d06bLr7pGC/zlREiy9KEJLPw9QRBz2sY6awSzc4APHnx7p8U58r6d58f6UjdxY8cVjgAvk05vhTWeuHHYs5sTE+2/PvRVlfjhiPz+NhBaX8ukS0Ut5ioPjlUchZGgnaC1bSSgN4inbGz648yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712804311; c=relaxed/simple;
	bh=H+6KligDtfbXeCMGh0nniJKBGuen+8IuMp1hIkTuS6c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BlNKB93XPep+KQqPnYJhxSq9VoYv1ySbNtl4sg38dUHQcqZ1I2bVLwrLIkv61HE5BE9SHUQ4KHMC/Q2jBK9R/IBl7JNG1dYDDwV0utrC3jHIW0C6zkq++vm9ELxZ+NL7tdbdaC4zXpg/e2PrwGZRT+4b5z12731th/o3S/1M9IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [112.20.109.80])
	by gateway (Coremail) with SMTP id _____8CxF+jRURdmxpwlAA--.621S3;
	Thu, 11 Apr 2024 10:58:25 +0800 (CST)
Received: from localhost.localdomain (unknown [112.20.109.80])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLBPLURdmz8l3AA--.34105S2;
	Thu, 11 Apr 2024 10:58:20 +0800 (CST)
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
Subject: [PATCH v3 0/6] Add Loongson-2k0500 and Loongson-2k2000 clock support
Date: Thu, 11 Apr 2024 10:58:05 +0800
Message-ID: <cover.1712731524.git.zhoubinbin@loongson.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxLBPLURdmz8l3AA--.34105S2
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7Aw1UAFy7Xr1rWFWxGrX_yoW8Ww15pa
	nxuay3Gr1DKF18Zrs0qrW0yrn5u3yrJasrJw45t34UurWDC3WDta1Ska1YvrZrZryayF9F
	vF95Kr4UCFWUCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUx529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1l4IxYO2xFxVAFwI0_JF0_Jw1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
	xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0
	cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
	AvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E
	14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07j5o7tUUUUU=

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
V3:
- Remove the dts-related patches and update dts at once after all relevant
  drivers are complete.
patch(1/6):
 - Drop unsuitable comments.

Link to V2:
https://lore.kernel.org/all/cover.1711504700.git.zhoubinbin@loongson.cn/

V2:
patch(1/8):
 - Drop LOONGSON2_CLK_END, for it is not a binding.
patch(1/8)(3/8)(5/8):
 - Add Acked-by tag from Conor, Thanks.

Link to V1:
https://lore.kernel.org/all/cover.1710926402.git.zhoubinbin@loongson.cn/

Binbin Zhou (6):
  dt-bindings: clock: Add Loongson-2K expand clock index
  clk: clk-loongson2: Refactor driver for adding new platforms
  dt-bindings: clock: loongson2: Add Loongson-2K0500 compatible
  clk: clk-loongson2: Add Loongson-2K0500 clock support
  dt-bindings: clock: loongson2: Add Loongson-2K2000 compatible
  clk: clk-loongson2: Add Loongson-2K2000 clock support

 .../bindings/clock/loongson,ls2k-clk.yaml     |   4 +-
 drivers/clk/clk-loongson2.c                   | 549 ++++++++++--------
 include/dt-bindings/clock/loongson,ls2k-clk.h |  54 +-
 3 files changed, 329 insertions(+), 278 deletions(-)

-- 
2.43.0

