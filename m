Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2280D33D4F4;
	Tue, 10 Feb 2026 09:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717101; cv=none; b=F9ti6DIwHE26yy4yfpScKEokrhm+xwEyeO4qvxCS4T+N2bszO0KB07u5RQKFK+7bBj0aK4l2n2MB12Ib+xShEcdmlLoM39snTh7++opZkk+T2oCyquNnFwPxNXx6MxatSPisPm6ggCKWShQFhaVE/OzwuivK2MTVmw90tIGIioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717101; c=relaxed/simple;
	bh=fSc8hRxalT4NKTahbnGTJLpnT1hue4GiSVAhrj8HoVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ixcp9aIHhPB5O7gSgKgiZ1flaU6qVUi3/YSFDqR8Ytkm2bUJ90PA4/0tUTq6JH86D9b4twgxNRYFeT6dFQlP2sNIfnzuoCNsicVKonYYuP8iI4UovzI8w8cAGy5Z2y0m+Kq3AgrmKmVe/XmCpuPR1ib33m2sGlpHPnB+xDWkueI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app1 (Coremail) with SMTP id TAJkCgBHlzec_4ppDJAEAA--.20471S2;
	Tue, 10 Feb 2026 17:51:25 +0800 (CST)
From: dongxuyang@eswincomputing.com
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev,
	bmasney@redhat.com
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	ganboing@gmail.com,
	marcel@ziswiler.com,
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v11 3/3] MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
Date: Tue, 10 Feb 2026 17:51:22 +0800
Message-Id: <20260210095122.894-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20260210095008.726-1-dongxuyang@eswincomputing.com>
References: <20260210095008.726-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgBHlzec_4ppDJAEAA--.20471S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF48XFWkKr1DGr1UGw4DArb_yoWDArc_GF
	4xA3y7XFyrXF1ak395ZF93AFWYkw4xJr4Yg3ZFkw1Yvw1Yyr1DKF4qqw1Svw47Gr43W34U
	uFyrKF9IgFnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhkFF20E14v26ryj6rWUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRmZXOUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add myself as maintainer of ESWIN EIC7700 clock driver

Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index db2c5a663867..87f9de46067b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9499,6 +9499,14 @@ T:	git https://github.com/eswincomputing/linux-next.git
 F:	Documentation/devicetree/bindings/riscv/eswin.yaml
 F:	arch/riscv/boot/dts/eswin/

+ESWIN EIC7700 CLOCK DRIVER
+M:	Yifeng Huang <huangyifeng@eswincomputing.com>
+M:	Xuyang Dong <dongxuyang@eswincomputing.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/eswin,eic7700-clock.yaml
+F:	drivers/clk/eswin/
+F:	include/dt-bindings/clock/eswin,eic7700-clock.h
+
 ET131X NETWORK DRIVER
 M:	Mark Einon <mark.einon@gmail.com>
 S:	Odd Fixes
--
2.34.1

