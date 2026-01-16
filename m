Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBE9322B72;
	Fri, 16 Jan 2026 11:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768563544; cv=none; b=LHw6pqQ6mNI6jbcPC4E9/QD7goJzSUnnPil8rm6lwIZODsEw3rLjW5MVDpwHTnZkGL4ltA/SBcsK3IeRMuhg8IMAuYjtk3ugJAUe7cg7PC9r08yBb7zZ+wuQ9CkoeGYZLpoBHhAoKS1Crew8NgJR9Dqs7wtofmGyowKxAqdZMHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768563544; c=relaxed/simple;
	bh=5N9dsDCyk6AYKilaQV9Vuwqeym8Zah6xULXUbAj3Ol4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XgATqc5UgSNH1v8Ta7pa6TVQPcn7JWqmEe67Bc8ezuflCqbsToVWdB713nWlTTzdUGb4VPy5imDc8CGbxjnwaFb5sSfUu1OGeYZB7zUx6wxSC7hI3FmQnoHj93kXZgVhpuI8x7oIVars8HeeZHWV5Ly54VvKV/m2efeb1HmfhoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from localhost.localdomain (unknown [36.112.3.223])
	by APP-05 (Coremail) with SMTP id zQCowAC3TBBMI2ppZbMsBQ--.56400S2;
	Fri, 16 Jan 2026 19:38:53 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	bmasney@redhat.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Subject: [PATCH 0/7] clk: st: clkgen-pll: Add cleanup in clkgen_c32_pll_setup() and clkgen_odf_register()
Date: Fri, 16 Jan 2026 19:38:40 +0800
Message-Id: <20260116113847.1827694-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3TBBMI2ppZbMsBQ--.56400S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JryfAF1UZw45GF17Jw4fXwb_yoWkGrcEyF
	WxKryaqwn8WF43CF15Aw4Fy3y8Ka1DZF17WF1Ut3yIkw15JryUKr9Ykan2vr1SgF4fCFn5
	tr1rGws3Ar1YkjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUehL0UUUUU
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiCQ8JE2lp34rSlwAAsM

Patch 1 fixes a memory leak in clkgen_odf_register()
Patches 2 to 7 improve the cleanup process for function errors:
  - release the memory allocated by clkgen_get_register_base()
  - release the memory allocated by clkgen_pll_register()
  - release the memory allocated by clkgen_odf_register()
and removed unnecessary handling.

These works are carried out under the guidance of Brian Masney.
Thanks, Brian!

Haoxiang Li (7):
  clk: st: clkgen-pll: Fix a memory leak in clkgen_odf_register()
  clk: st: clkgen-pll: Rename some variables in clkgen_c32_pll_setup()
  clk: st: clkgen-pll: Rename some variables in clkgen_c32_pll_setup()
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

