Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0402932ED24;
	Wed, 24 Jun 2026 05:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782280702; cv=none; b=j6P3GqPlmV6oIksS+ITPwvgqnml6+TA/HagQlGfACxxC85JasNW57GnBUUD7kmb+tKxloHROfy4H6FQoq3S8ZGSI44egHFFCt0Tk82BJBJUCOavAKMEdfGPh6WFqTHp7NVae2SbkhkN5RFdCJw1rcQaHC4aZm1iLTxtYJn4L0hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782280702; c=relaxed/simple;
	bh=fIA1dJvmvWDvQ15eMcuwpUixxb5wnHPC4C8Vq2X/IEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K/DBDkZE+qCo70zGXszwGElaBG2iQNJpWZbADMdIhVkrPYKi306hXXWb8wlESmE6+zwoCP3F+8e4XTPA47ZhBGmW0oCm5tJfnpBG4of6iIvhTgDSeK4NxyTyEpOYswcnYJOaStkil+4X1ch+MiSC6hn4bNvHgJeY/YvZQW8gOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADH4dj1cTtqbi2tFQ--.63848S2;
	Wed, 24 Jun 2026 13:58:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [RFC PATCH] clk: si521xx: Align si52147 OF data with the I2C id table
Date: Wed, 24 Jun 2026 13:58:10 +0800
Message-ID: <20260624055810.49310-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowADH4dj1cTtqbi2tFQ--.63848S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4fur47urWkGw47uw4UArb_yoW8Jw1rpF
	W2gryFgFZaqr17trWIq3WkZFWYq3WDJa48CrZxA3yqqr9xKFyjyF1SkFyvgryDWr15XrW2
	y34UtrWfJrs3uw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkK14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_
	JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
	AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIY
	rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14
	v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_
	Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjnmRU
	UUUUU==
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

The si52147 match data is used to derive the number and mapping of
registered DIFF clock providers.  The I2C id table uses
SI521XX_OE_MAP(0x17, 0xf8), while the OF compatible for the same chip
currently uses SI521XX_OE_MAP(0x15, 0xf8).

Use the same provider topology for the OF match as for the I2C id match
so the same chip identity does not expose a different clock provider set
depending on the match path.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/clk/clk-si521xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/clk-si521xx.c b/drivers/clk/clk-si521xx.c
index 4ed4e1a5f4f2..f167fd63c504 100644
--- a/drivers/clk/clk-si521xx.c
+++ b/drivers/clk/clk-si521xx.c
@@ -375,7 +375,7 @@ MODULE_DEVICE_TABLE(i2c, si521xx_id);
 static const struct of_device_id clk_si521xx_of_match[] = {
 	{ .compatible = "skyworks,si52144", .data = (void *)SI521XX_OE_MAP(0x5, 0xc0) },
 	{ .compatible = "skyworks,si52146", .data = (void *)SI521XX_OE_MAP(0x15, 0xe0) },
-	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x15, 0xf8) },
+	{ .compatible = "skyworks,si52147", .data = (void *)SI521XX_OE_MAP(0x17, 0xf8) },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, clk_si521xx_of_match);
-- 
2.50.1 (Apple Git-155)

