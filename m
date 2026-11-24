Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545684;
	b=B7/pxeULvGmrBQ82GGhr/sL5n2OUhDDrGcvNA3/wD/xpFV0dltv3tL+zQ/6TbPscI9jA
	 aF2Emo71PxNVAnj37XwHeUWduOpc3SH0bwh99T+BikKf9Sl6TRmwmU/ouBXaXAQQwx9iU
	 hG19sub/jqhF0CcBptG7tXT/5oA1di3p8Xl0Z4OBE4HIOk5PGVSZ0VEBX+fat2SoKSLnA
	 D1DrDwUkfB/H1hJ/GWmE00Oi7F4J+9PtcRip/AtRdDBpylrd++lRPPXSdKlE1NJMixvdR
	 j9TItCBBkycNKpA0dMWoYxNkPK6GQbmFsHuECcmsyywEmwVVIIpwyb0+uPapzWlhGkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545684;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jkZYm03lRvQFmPBUbBcIltQEBq59A4h16tLKYtelBQ4=;
	b=tnN1H1rZYYd+LboHm5KqKCR9oV319D56hCfaVknGtro4gI5L0FUkDIzxQnFYXJ0r69Is
	 3zK2+/kv9SwuANmIJ7NS5PRPG/BDeSMgvGDs5M69spIL8x/l2CsfXcKzTUQnL8+fOkxFL
	 uNGiLYXO4V4Ek9ne7qZACswKqiqExNmvCWATZYBScRdEYa1xrj3spJqxDZDYZM//bHoj/
	 9YX+gxFA2RUlAPjK5HA3zAK0UIv6bHa9EuECThB05hq8gG9oGeR9K29fu312Xmleof0Mo
	 QI8EJOrzDWm4gVHeWybrc9gqxhUM7znCXlg8ylna9WL0SgKLx3WUKws/qI8rRqOyqRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6I5SZk0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AA606A31E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 18:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R6I5SZk0
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795545683;
	b=h2s4KXpIFUhcsh3+WygoE0J9z6m8RATPGadM6oRHGVyH8/+K/b3VloovSvf0dgczCIGj
	 s+hr/1eK/lssmSvn4zfbnk/rs2bnQkBlVs1J0Uf5Io4aIPKEKr4/d7kumHOVL7ER0x3Mb
	 Vk7OqjdaujnpVoU7llcgw7srNp8E4sA8GJOPsuNCtyD03aMTZ4bMw1AL95q+bvhmAUNtO
	 mibs6Zqly0DHYRZYl8p2QRlk0RcZS2EH92I8i/rvE0QkImfxD5cSRsEhYLzaisHGZW5RA
	 kC11UkyxlUoxgt7/fZsoCVedO2w6qaN14jy38rvzsCBZxSDAygC1DJNhn6JhvcYT4nQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795545683;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=jkZYm03lRvQFmPBUbBcIltQEBq59A4h16tLKYtelBQ4=;
	b=do98XDC/U6L/lCMeA1ex+KtkewimDCnS0YwKu/Yv4PSS2YY019UA5sftITDIyyfsdcds
	 shFDOJJMsR0um4OHxKLJP7eOZFGqZogNINFyKkFO4BAs+ij/Ne4KlSTY4tBIpLuV+e04r
	 /5fdzM7m+2wvDOhwQtJ2G4/BgtLV4Hq+aEtj54Od6h/Sphzh7ovRTV9+f+P3KrLBEvxi7
	 3BD6oVEnhyJ1Xs/FoOQqsgecZ08a+hn2ngO4uSw7XdzAmM8iq56RXJcfAspYFvGRb4jpF
	 03a5CcoDpY6ddNeTHqlSrIeJBQgOKSAqTq+y12QlvHs0NmOFVdccQzZy7W6oncFsDRA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71E121F000C6;
	Tue, 24 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545683;
	bh=jkZYm03lRvQFmPBUbBcIltQEBq59A4h16tLKYtelBQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=R6I5SZk0mo3DJd90kRmLCuYIWvWN18dhxzkaC33xzpRhcwOSHGDImYAZjQJl/5+yt
	 rarrdaHJD6uusH1vPVe02SpHGbzSSr7iKvn1IuV1bin0tMryx0Pq+kPFnNXSYdQkBI
	 FJaDTzQ/H+gk43hGuqDQgBZTW1D2yZZBvn1FPy9d1yWAwzi9MhyJS14b9CmVHw1irg
	 g3WoRckzZ27h+Fj52uBUALH01hbGzapNAYhFfM+hHyq6Q7RwnNC6O5EW+jEU85JupN
	 daOpVzZgzaPio3wfAAf9HDnozNpplrq9vFc9MvFO0an40g/DZkO+X8OIHDCA6M0oKu
	 roYm/+9K3vraQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F20C24CB42;
	Tue, 24 Nov 2026 18:41:13 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 25 Nov 2026 02:41:02 +0800
Subject: [PATCH 1/2] clk: eswin: Fix the EIC7700 PLL post-divider
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
Message-Id: <20261125-eic7700-cpu-pll-postdiv-v1-1-b1ccd6339a20@iscas.ac.cn>
References: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
In-Reply-To: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, 
 Jingkun Zheng <zhengjingkun@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795545672; l=2174;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=K7CbBbwRL7SATfIfwvhHdIvzguPw8xQ/hwuAz02UZhg=;
 b=J+PHDdEF/5xW9rq1nnIDUZ7SDjsXFHDB8D67iM0bKs856vLcTRGOBdfpNULzyLAhWAm3Cpph8
 WTxVqm9vcJqBj5raZzvbru7qdR4n47uQUf0XTA21SeYHEhOAuXIdz8C
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

Both PLL clocks are FOUT1 of their PLL. Per the TRM:

  FOUT1 = FREF * (FBDIV + FRAC / 2^24) /
          (4 * REFDIV * (POSTDIV1_A + 1) * (POSTDIV1_B + 1))

The driver leaves the post-dividers out of its rate math, but
clk_pll_set_rate() sets POSTDIV1_A (bits 10:8) to 1, which halves the
output. It also writes bits 18:16 as "POSTDIV2", which is really
POSTDIV2_A for FOUT2.

On the HiFive Premier P550 the CPU ran at 699 MHz when CPUFreq set
1.4 GHz.

Clear POSTDIV1_A and POSTDIV1_B (bits 14:12) instead, and leave FOUT2
alone.

Fixes: cd44f127c1d4 ("clk: eswin: Add eic7700 clock driver")
Reported-by: Jingkun Zheng <zhengjingkun@iscas.ac.cn>
Link: https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases/download/v1.0.0-20250103/EIC7700X_SoC_Technical_Reference_Manual_Part1.pdf
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/clk/eswin/clk.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
index e8851283ccdbf0ea57002511f991c9d68a7f4788..7d51d3a8fc06d7b4a0d7435aeb0cb0e58e16708e 100644
--- a/drivers/clk/eswin/clk.c
+++ b/drivers/clk/eswin/clk.c
@@ -21,8 +21,8 @@
 #define PLL_REFDIV_MASK		GENMASK(17, 12)
 #define PLL_FBDIV_MASK		GENMASK(31, 20)
 #define PLL_FRAC_MASK		GENMASK(27, 4)
-#define PLL_POSTDIV1_MASK	GENMASK(10, 8)
-#define PLL_POSTDIV2_MASK	GENMASK(18, 16)
+#define PLL_POSTDIV1_A_MASK	GENMASK(10, 8)
+#define PLL_POSTDIV1_B_MASK	GENMASK(14, 12)
 
 struct eswin_clock_data *eswin_clk_init(struct platform_device *pdev,
 					size_t nr_clks)
@@ -110,10 +110,9 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	val |= FIELD_PREP(PLL_FRAC_MASK, frac_val);
 	writel_relaxed(val, clk->ctrl_reg1);
 
+	/* eswin_calc_pll() assumes FOUT1 is not post-divided */
 	val = readl_relaxed(clk->ctrl_reg2);
-	val &= ~(PLL_POSTDIV1_MASK | PLL_POSTDIV2_MASK);
-	val |= FIELD_PREP(PLL_POSTDIV1_MASK, 1);
-	val |= FIELD_PREP(PLL_POSTDIV2_MASK, 1);
+	val &= ~(PLL_POSTDIV1_A_MASK | PLL_POSTDIV1_B_MASK);
 	writel_relaxed(val, clk->ctrl_reg2);
 
 	/* Last, enable pll */

-- 
2.47.3


