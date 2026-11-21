Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795285101;
	b=UE5Evlv98H/1a+K8qw/ycXOJ+XCkPdrhcsN1jrKvUpHtBSRv7ATci/NMHQaBijRb2LyL
	 86H06pQ2z3GzgcWzQ8UAzh/303qkDBBKAXK1p4wqYZyCBui6wbxVN6lcFlb5/BG8UCK+v
	 gGO69zZa/K2EBNLSAbzsmW1LpnHcWZVUC7fbn36Nkvn6YNlbKs0cw4tNWkitiRXa9+QbD
	 pkcHgxVVo1PWEcjdqfy0T14SaaH9bnFwecLJQFARn//0Ip1UULhrYD4zTlaNJ4c0M6OU2
	 Sa6Ad/866dRnrPuBIWFKTnVVjM+uQBT1ZZZaETlq7R/vBOO4CugRgcEXnXInHKe4YIA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285101;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KGlDt84X+LMSzS/i/lJM9DHreNNB0ApRjf2Zk9oKYmw=;
	b=eOruZ04VjE9pHINIqtPe83DEjcIfIhIXOLcO008mS3UzEAs/IVrr5Fr/kvu2XNb2RR5x
	 +T55hC2cwW9rcpvw/VHkLMrl5F2LZlq0UAB0C6jwSdfPD8ZVC7m5DmwgiuwErYIR5Sz63
	 8ZakopaHfqT/eCJoOKumsir0p8PYm6xussW+6nT4F6m00C4BjMUqIeYpHJv294Q5sTnn7
	 6+GIRI57u54sRZzdhB3+4pI3gEdbFNmbOz1fvFPSNozjkflEd1Uz+LsJxKGg5bnXfd/dj
	 YSBeJNdXolDDpAJHE19K4ncleBZJtvQIV1GkFHmsT39WDUSmLhzXmGEkELJBb08qieg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwVUCMpC;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EC6606A334;
	Sat, 21 Nov 2026 18:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AwVUCMpC
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795285101;
	b=HN6pXWLNxH5A2jel+87m7bqKLmWca/3wcAOqOup6ZQ0vZUT9gXylorT7b92wwbnZyVfb
	 JTuMN5l6x/XpQpAyR+f8a+U2ZQGrjH785i8C6MSBCHT3PqTM8Sdu9dLLqtQVmEbHYaICa
	 H32kmzcSg9mlqxQFn15JKI8c4VzKgzimd5TI8lWD2CNJnwnIYShghRHwkfJ4jj/hwcT7F
	 D25ziJbWUXIyO4atZn3iXVzuuSUS7wFsM8R7jsfJb6TXi6WRFgD6n+lbJvqkFAfMS+2fM
	 35iWh4qOxpcW01Qdrw01ZY0wTHrk3q/0QXadqZXshBtYs8O/ujyjT/mRKE1FwP7u4mQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795285101;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=KGlDt84X+LMSzS/i/lJM9DHreNNB0ApRjf2Zk9oKYmw=;
	b=HNNlD7v3tusXxQyuCktf4uQSlCNe88D+s42pQShQIo91CPotfsy3kGVJQOBpGkM1l528
	 drXurzlZguKd3DZkcbNSLr9YMN4/rcY/ywV2aEOBZ27MizYqP6uIGJ2hm2Ms4dFG0CkXL
	 Cs0lWxhoJhf8JpDdnlsAeQhqXlyyTCymMyK68DFCp/xPcKXzzSElIhTgxQh9mU4a/ngz5
	 5S2LZHdiWKbgNvK7PHKXVWLOjJVJhr03WS66kwCf4p3XrS7+1Pcg7ZElSKoiS0TPoA8kT
	 kFzsYgkK+1OhgSIRZgn0jObluClwA1PASaIVX6cdrjGH4m6mPmU/CCNcsr1sEyvvCKA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 899B01F000CF;
	Sat, 21 Nov 2026 18:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795285101;
	bh=KGlDt84X+LMSzS/i/lJM9DHreNNB0ApRjf2Zk9oKYmw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=AwVUCMpC1X/i43jNa+f2k6Aqg7eX2FeD3nZGHblnLQxEY1oiPq3laGQsnfneVGb+1
	 agGXvPdIId6zD/aZPJcbFzwrIRRymwkjllR8aLAEI4P4bUe2hoLyKvyqUxLXuDZd6d
	 ouRAb+n+HJXmj5wZXySSY3CKwVGjkF/YkMXFontCvnFDskl3PFjudMgB5ALl/8aNa1
	 4idofuC+eyCAv4UOwZLgNCdG8L6JccvggTbZnN/ntBDOTKB9ZDtNl4JwuSwWD2OVfW
	 sRY2BY3rVCZqcY5K2fSd8aBW5MK53DnihE5c7x1bDrWgoPAbCkOCYUDbwJZu2U6cnn
	 cxAZzae75S3yg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1CD3F4BD42;
	Sat, 21 Nov 2026 18:18:20 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 02:18:05 +0800
Subject: [PATCH v2 2/2] clk: sophgo: Keep SG2042 gates listed in
 protected-clocks enabled
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261122-b4-sg2042-efi-rtc-v2-2-6d087e03e4e8@iscas.ac.cn>
References: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
In-Reply-To: <20261122-b4-sg2042-efi-rtc-v2-0-6d087e03e4e8@iscas.ac.cn>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <me@ziyao.cc>
Cc: Chen Wang <unicorn_wang@outlook.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795285099; l=1924;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=oDFY3WrZMCRM6HlTzCNBxKLTff2F/eD4wOSph6ERWQ0=;
 b=cW/iHYkr/MTWozHP2PrVACf7/yiuOa4PRHWQevLRm3LEinn1tgQtDNy8bsoT7Jma78StFPjTc
 6oWMwxABIQhDeAD/q1kY8iNJIdo+HshdQVJuWbcK0slgHLblwI70ydz
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

On Milk-V Pioneer, EFI runtime services use I2C0 and the serial flash,
while Linux drives other devices behind the same gates. When those
devices runtime-suspend, the gates are turned off under the firmware.

Mark gates listed in protected-clocks as critical. Unlike qcom, still
register them, since Linux devices use them too.

Suggested-by: Yao Zi <me@ziyao.cc>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/clk/sophgo/clk-sg2042-clkgen.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/clk-sg2042-clkgen.c
index 6abc2c973c49..65ab18f701e1 100644
--- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
+++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
@@ -840,6 +840,18 @@ static int sg2042_clk_register_divs(struct device *dev,
 	return ret;
 }
 
+static unsigned long sg2042_gate_flags(struct device *dev,
+				       const struct sg2042_gate_clock *gate)
+{
+	u32 id;
+
+	of_property_for_each_u32(dev->of_node, "protected-clocks", id)
+		if (id == gate->id)
+			return gate->hw.init->flags | CLK_IS_CRITICAL;
+
+	return gate->hw.init->flags;
+}
+
 static int sg2042_clk_register_gates(struct device *dev,
 				     struct sg2042_clk_data *clk_data,
 				     const struct sg2042_gate_clock gate_clks[],
@@ -858,7 +870,7 @@ static int sg2042_clk_register_gates(struct device *dev,
 			 NULL,
 			 gate->hw.init->parent_hws[0],
 			 NULL,
-			 gate->hw.init->flags,
+			 sg2042_gate_flags(dev, gate),
 			 clk_data->iobase + gate->offset_enable,
 			 gate->bit_idx,
 			 0,
@@ -900,7 +912,7 @@ static int sg2042_clk_register_gates_fw(struct device *dev,
 			(dev,
 			 gate->hw.init->name,
 			 gate->hw.init->parent_data,
-			 gate->hw.init->flags,
+			 sg2042_gate_flags(dev, gate),
 			 clk_data->iobase + gate->offset_enable,
 			 gate->bit_idx,
 			 0,

-- 
2.55.0


