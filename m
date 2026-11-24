Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545685;
	b=UIdxSoAVWbx0p0C19DwWtmAF/+agPCxVV5/yXSusKcWFrMSsrLYleFyONIFFfOuGjvUx
	 afXxB60duDMYEy2CrOF62QDzJlBm93A1afHtwezLcBZZsz5Xm3ANjfWoJGoaOjsY+G6NR
	 nwnx2bjEpFPilqFxT0v/l/1LhDCesjZpxIhAYIDPJGLNWjPNV8fFF0lLrpcap8JAi5u36
	 0xigZ4OrvwcC73AnjOh93+Gq7qWT/jZ60/9iqpk55r+w67JOwcVLw90HL4uOVDjcJ2v4P
	 y5ud37rXEdG3bQl7dm9HuOtc0xoNfTasU/oOA8p7B/pVX+0M+MX6ygU+JwTLnXQW04A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545685;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FjSusbs1vkJ/EwbwIgWS/l9m52iylQNbn/QTUuTjTG0=;
	b=4GYsXt0INbJr5OEFj/p1uLiOR6rbjlzj9HoFhGnAy9XKfjCU+Q+PXBeo/p8LtgrQI5E+
	 uZ+LZDpwGBRlqvJlA/UCJxYMAPKbkTBsnGFIosCHhHVlNMtT1Jd2lPdgF2fcHh4/aTmyr
	 cABx41SxFDtuZ4QcuRPyCVkVRkfMmUUYaR1TB1ySFOO0jZ7IHEg8/KVWcSjZksI28sBny
	 XN79PArxb/5e5WD/G6iugiD+LXjcXysOgfWZHUncZJsZrIIINATcAone+/zTVZAtt6ZYf
	 CLqdAlPheAAmUqn9G0DlfAEGwk5YaH1uCVxlx2bJDfHGWraqxi0UR5acegWqnIbDz3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRNFqouJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4308D606A327
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 18:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mRNFqouJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795545685;
	b=xPh/wmuMwU5bUemhsM5UpuYr1XGh9U42ggAwe0irih1sjcLbxpBJCYqmDE1384cCfN10
	 o9ue81ySsUS8mJ6UwLvExCJ4nHvGsmVRsuYZ+/0vdHeg1ImZvT2NZpGjjU+8woDctnv93
	 wKnW7GRP2tUIE6djM6lbdeM91DT71zXDJLRwwV387/g2lF/zJX5crsmiVUNN4M55fFGqD
	 DtPFkGN9sGS7hFLUM6bY+OvniAGr1Hx0NS3nCDWQooswF/bFmrBhnI2HrNlPg3nNWBbqR
	 RB5okZcTo1uNY4uzm6by0d/gC8psn0mRObicRpjQKYi9pu5SV+cZmTQAsSo0nxZ1lbw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795545685;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FjSusbs1vkJ/EwbwIgWS/l9m52iylQNbn/QTUuTjTG0=;
	b=fPxE6TmjD5e4H9FZv9jS5FqMqggTNupV2ds12QQuc1Jn37eMGseDJN9Z+KX/A2w+GjKg
	 obZioUm3AA25brchpYnkZKs7Z6B6GmTwp8Km48Oy35Y/ATFdCpaOG90mwtjDL+KiZyR++
	 B0h8BI2+ntC5PWoPzFwUFy0bqsExL/GEmR7EK7dAC/6Cb/8BOq0wJY+56C9W4LhIbsMfW
	 nf7rQzK8pf+RvbqqhNEKqIcZjWQVkI+qod5vR6bwo4cdUNNn5Isz6Bmc2qWsL+ufLNBiW
	 rhHWeL0GFsEfkCPVFlg6cEJhwh9GZXHkm9DM9AbgSs71b6t1X7mQ6N7coexXpfWeZ8A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8CF891F000CA;
	Tue, 24 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545685;
	bh=FjSusbs1vkJ/EwbwIgWS/l9m52iylQNbn/QTUuTjTG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=mRNFqouJwqjZk0p/ExcnG3fMUWbmXco986jMv8Xd8mZ6HAWM5EEf8qZoPEkdCfnkU
	 3R/O2B7+U21c831+kR1510/So/MXLuHpbjBt4CscuKKiXWc1tQI3i5YcgzouEmuyBw
	 kZI8VKA9//EYvBqcqZ7ileGwL/8mZ2Xe/zYP/EfBnf/NpCJQExWOYIWFbbFDHhx0O2
	 vEcDnyUxB8KS90J8dGwgM/RS6vR2tQp6V05V9G0p92SB6n+uJ0bHZCJrRRPEyPVdjh
	 XPfnFKF+g6lcV6MtbmW1iUS2heNQG5f0TeUITFBkVggJ0XyIgb0irSYfZYZ8Dig07L
	 6TOOXe+dEy6hw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1E81C4CB49;
	Tue, 24 Nov 2026 18:41:14 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Wed, 25 Nov 2026 02:41:03 +0800
Subject: [PATCH 2/2] clk: eswin: Use REFDIV and the post-dividers in the
 EIC7700 PLL rate
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
Message-Id: <20261125-eic7700-cpu-pll-postdiv-v1-2-b1ccd6339a20@iscas.ac.cn>
References: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
In-Reply-To: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795545672; l=1923;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=VrFwb4LbqjLwL5yeuV+0FMqYdBlAoZkY2EyJTM77sGc=;
 b=FUIU6DX3ikNkr3SZtTgnF9zNyVsAD9fsSMms6uKh5HiiO/NmSqaknVac+uS4onmZ/RLkJ87yn
 FMhBGdezhVXCG0KvDeHTdiJNWuR/V21IFz/sdJIJHsn9lXb64lkRzOn
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn
Content-Transfer-Encoding: 7bit

From: Han Gao <gaohan@iscas.ac.cn>

clk_pll_recalc_rate() ignores REFDIV and the FOUT1 post-dividers, so
it reports the wrong rate if firmware set them. Use the full formula
from the TRM.

Link: https://github.com/eswincomputing/EIC7700X-SoC-Technical-Reference-Manual/releases/download/v1.0.0-20250103/EIC7700X_SoC_Technical_Reference_Manual_Part1.pdf
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/clk/eswin/clk.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
index 7d51d3a8fc06d7b4a0d7435aeb0cb0e58e16708e..51d816c6d19b8a22045b147a863b39c9f3c9a7f1 100644
--- a/drivers/clk/eswin/clk.c
+++ b/drivers/clk/eswin/clk.c
@@ -135,9 +135,10 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 {
 	struct eswin_clk_pll *clk = to_pll_clk(hw);
 	u64 fbdiv_val, frac_val, tmp;
-	u32 rem, val;
+	u32 refdiv, postdiv_a, postdiv_b, rem, val;
 
 	val = readl_relaxed(clk->ctrl_reg0);
+	refdiv = FIELD_GET(PLL_REFDIV_MASK, val);
 	val &= PLL_FBDIV_MASK;
 	fbdiv_val = (val >> clk->fbdiv_shift);
 
@@ -145,7 +146,17 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	val &= PLL_FRAC_MASK;
 	frac_val = (val >> clk->frac_shift);
 
-	/* rate = 24000000 * (fbdiv + frac / (2 ^ 24)) / 4 */
+	val = readl_relaxed(clk->ctrl_reg2);
+	postdiv_a = FIELD_GET(PLL_POSTDIV1_A_MASK, val);
+	postdiv_b = FIELD_GET(PLL_POSTDIV1_B_MASK, val);
+
+	if (!refdiv)
+		return 0;
+
+	/*
+	 * rate = parent_rate * (fbdiv + frac / 2^24) /
+	 *	  (4 * refdiv * (postdiv_a + 1) * (postdiv_b + 1))
+	 */
 	tmp = parent_rate * frac_val;
 	rem = do_div(tmp, BIT(24));
 	if (rem)
@@ -153,7 +164,7 @@ static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
 	else
 		tmp = parent_rate * fbdiv_val + tmp;
 
-	do_div(tmp, 4);
+	do_div(tmp, 4 * refdiv * (postdiv_a + 1) * (postdiv_b + 1));
 
 	return tmp;
 }

-- 
2.47.3


