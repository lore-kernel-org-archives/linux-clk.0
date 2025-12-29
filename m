Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [13.76.142.27])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBEB9289E13;
	Mon, 29 Dec 2025 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.76.142.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767006034; cv=none; b=ZpR+LFi1ACkAfq4bo6NjRlaBRXicYlhWPjh8gmk4Yjxg9d9CDRQdUcIez+DikbQexh7uu5ZdRw0uaRES4Toe55X8VXDezYHwypn6dl/dFU7L9oTqm3qyK4Cf9nnO2xOZQtOts6YI+wkQ5g9fAPFzxx7FkNQzPbeUTbW2pwLCsJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767006034; c=relaxed/simple;
	bh=h4KDr/HQweAHhcdabg3ti5YnKKeeRqgowkaWkp2II7A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rncOQlMU9FIUceSvoyPH10VG9ZfC/57rdIIBwNdgNZaq7fgU9vm4hSpqavKZDJeIQx+Tf6xBRWV1mmheQid/TAuwV+WoHsNMbs5mJsTH/U5fVn8l3lC9wgEIgYkPR3KilU/NmdLZqPiDWG87rjW5CFFAo24BVhvu+iJn/HjabsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=13.76.142.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0005152DT.eswin.cn (unknown [10.12.96.41])
	by app2 (Coremail) with SMTP id TQJkCgAXWq02X1Jp8KOLAA--.2041S2;
	Mon, 29 Dec 2025 19:00:08 +0800 (CST)
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
	Xuyang Dong <dongxuyang@eswincomputing.com>
Subject: [PATCH v9 3/3] MAINTAINERS: Add entry for ESWIN EIC7700 clock driver
Date: Mon, 29 Dec 2025 19:00:05 +0800
Message-Id: <20251229110005.1257-1-dongxuyang@eswincomputing.com>
X-Mailer: git-send-email 2.31.1.windows.1
In-Reply-To: <20251229105844.1089-1-dongxuyang@eswincomputing.com>
References: <20251229105844.1089-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TQJkCgAXWq02X1Jp8KOLAA--.2041S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF48XFW7tw47KFy7CryrCrg_yoWfKrb_Gr
	48Cay7XFWrJF4ak3ykZF93JFWYkw4xJr4qg3ZFkw4ay34Yvr1DKFWDX34fZw47GF43W34U
	uFyrKFZIgF13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbhkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwAKzVCY07xG64k0F24lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK6svPMxAIw2
	8IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4l
	x2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrw
	CI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHCJQUUUUU=
X-CM-SenderInfo: pgrqw5xx1d0w46hv4xpqfrz1xxwl0woofrz/

From: Xuyang Dong <dongxuyang@eswincomputing.com>

Add myself as maintainer of ESWIN EIC7700 clock driver

Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 12f49de7fe03..cea43d90e4ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9364,6 +9364,14 @@ T:	git https://github.com/eswincomputing/linux-next.git
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
2.43.0

