Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390792F99B8;
	Fri,  3 Apr 2026 09:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775208941; cv=none; b=saNUCC+iJm/FZ4/zX7D0UVI8Fw+m8SZ62egaW46CRPx8s41dPrqNKfVYvq6c7LZzmmcGT4v+4kr4SJgrJV8SCIB8medlUArhKE3nQvrJzAUZlAz0p2IxwlpAT2EZmmD8N3U/4+IQh2OPuPfDynUBkJzp7U57MmGX5cM7zH1bNbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775208941; c=relaxed/simple;
	bh=3aOgzOA4jLwxhsbvBWrKAOu+pLgm5ki8Y0k6FWbFxsk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EUSkl4JTdVUtiInZOT6tGLhREBYVxvwrGUYFAmn7GahHu2h0odQuQjN36bfNJHzHTnoiCiEca5jb9ng56DAmxds/mPV+aC6904RbmiSkS9hGHZG8hBmTzLWIRH9Xo8ylr7VF6OppdOC6jLpgjjZssqNZq7KyaEBXuKyIOuKUKLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgDXbHHWic9pw4oOAA--.58504S2;
	Fri, 03 Apr 2026 17:35:19 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	p.zabel@pengutronix.de,
	huangyifeng@eswincomputing.com,
	dongxuyang@eswincomputing.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com
Subject: [PATCH 0/3] Add driver support for ESWIN EIC7700 HSP clock and reset generator
Date: Fri,  3 Apr 2026 17:34:59 +0800
Message-Id: <20260403093459.612-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDXbHHWic9pw4oOAA--.58504S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF18tFW7Cw1DCw4xur47CFg_yoW5Gw15pF
	4DWF95Gr1UXrWxXan3J3W0vFWfX3WfJryakasrXa47Za9IvFyDJr4IyFy5AF97Z348Xr43
	JF1aq3WUua42yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUmjgxUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add support for the ESWIN EIC7700 HSP (high-speed peripherals). The drivers
provide basic functionality to manage and control the clock and reset
signals for EIC7700 HSP, including mmc, USB, ethernet, SATA and DMAC.

The clock and reset registers are mapped to overlapping I/O address ranges.
This causes a resource conflict when two drivers attempt to request the
same region. Use the auxiliary device framework: the main driver
allocates the shared register region and passes it to auxiliary
devices, avoiding resource contention and duplicate remapping.

Features:
Implements support for the ESWIN EIC7700 HSP clock and reset controller.
Provide API to manage clock and reset signals for the EIC7700 HSP.

Supported chips:
ESWIN EIC7700 series SoC.

Test:
Test this patch on the Sifive HiFive Premier P550 (which used the EIC7700
SoC), include USB and other peripherals. All the drivers of these modules
use the clock module and reset module.

This patch depends on ESWIN EIC7700 clock controller patch [1], [2] and [3].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=8add6d87dc69c0620c7e60bdc6be6b3b0092d9fa
[2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=cd44f127c1d42833a32ba0a0965255ee6184f8c1
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260331&id=858f6273cf003e97c817903a07d8001b483fe40b

Xuyang Dong (3):
  dt-bindings: clock: Add ESWIN eic7700 HSP clock and reset generator
  clk: eswin: Add eic7700 HSP clock driver
  reset: eswin: Add eic7700 HSP reset driver

 .../bindings/clock/eswin,eic7700-hspcrg.yaml  |  63 ++++
 MAINTAINERS                                   |   3 +
 drivers/clk/eswin/Kconfig                     |  12 +
 drivers/clk/eswin/Makefile                    |   1 +
 drivers/clk/eswin/clk-eic7700-hsp.c           | 339 ++++++++++++++++++
 drivers/reset/Kconfig                         |  13 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-eic7700-hsp.c             | 151 ++++++++
 .../dt-bindings/clock/eswin,eic7700-hspcrg.h  |  33 ++
 .../dt-bindings/reset/eswin,eic7700-hspcrg.h  |  21 ++
 10 files changed, 637 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/eswin,eic7700-hspcrg.yaml
 create mode 100644 drivers/clk/eswin/clk-eic7700-hsp.c
 create mode 100644 drivers/reset/reset-eic7700-hsp.c
 create mode 100644 include/dt-bindings/clock/eswin,eic7700-hspcrg.h
 create mode 100644 include/dt-bindings/reset/eswin,eic7700-hspcrg.h

--
2.34.1

