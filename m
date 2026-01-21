Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F4E2E7F1C;
	Wed, 21 Jan 2026 01:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768958572; cv=none; b=nH97tooHdvLZJdiY5xbQYLRennSItvPOKAGxaH2SxajmiTzEDcMdjRIrkjjRHXIFzIJLTJEk+ay30+xuE7yA86D9LKFaD52OwSv+tOpTphtzw4UcSW3n3C33HV8fftyPtKD1oyX5f/MMNrRzcTzxicyMMzc0vieNrS2k74tjL6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768958572; c=relaxed/simple;
	bh=7fipKzYPSYUFZN7IjFkFaSAzdPWqGjg/pYSX4gM3KFs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SvT/y1cgQSzqZZJhyPQ/dlK+WCOLHHj7Xy7dhg/4gdSz0wv8Af2jSHTiksI0Nkpa3zI36tULjIpQZXIqSkFXxD7Hc4K2U4KcAKssIeUNUb5hy1GvqEKC131bcK2+QiVYuS2rK/APuglZPIPbV9oVFnm/GoyjFsbMyAWTZXNZ2jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.108])
	by APP-05 (Coremail) with SMTP id zQCowAB3zhFdKnBpw6_aBQ--.10840S2;
	Wed, 21 Jan 2026 09:22:38 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH v2 0/7] clk: st: clkgen-pll: Add cleanup in clkgen_c32_pll_setup() and clkgen_odf_register()
Date: Wed, 21 Jan 2026 09:22:16 +0800
Message-Id: <20260121012223.186199-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAB3zhFdKnBpw6_aBQ--.10840S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JryfAF1UZw45GF17Jw4fXwb_yoWkurXEyF
	WxK34aqwn8WF43CF15AwsYy348Ka1DZF17WF1UtrWIkw15JryUKryFkan2qr1agF4fCFn5
	tr1rJws3Cr1YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbckFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0
	cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8Jw
	ACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AFwI0_JF0_
	Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUSNtxUUUUU=
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ4OE2lwF7o5pgAAsx

Patch 1 fixes a memory leak in clkgen_odf_register()
Patches 2 to 7 improve the cleanup process for function errors:
  - release the memory allocated by clkgen_get_register_base()
  - release the memory allocated by clkgen_pll_register()
  - release the memory allocated by clkgen_odf_register()
and removed unnecessary handling.

These works are carried out under the guidance of Brian Masney.
Thanks, Brian!

Changes in v2:
- Rename the patch title for Patch 2 and 3
- Add a Fixes tag in Patch 6

Haoxiang Li (7):
  clk: st: clkgen-pll: Fix a memory leak in clkgen_odf_register()
  clk: st: clkgen-pll: Rename clk variable in clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Rename clk variable in clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Add iounmap() in clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Add clk_unregister for pll_clk in
    clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Remove redundant kfree() in
    clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Add clk_unregister for odf_clk in
    clkgen_c32_pll_setup()

 drivers/clk/st/clkgen-pll.c | 53 +++++++++++++++++++++++++------------
 1 file changed, 36 insertions(+), 17 deletions(-)

-- 
2.25.1

