Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018961;
	b=qiCVM4b2sAEs7GVXgEdW2I+x1StJunLXr5nvev/J0DpiUesW/JHihKEeJYt0tWKy3AL6
	 Aekjmn6ecPSJRCiolvE0soOQS8pJU3i4nE3MVFVcEcHlIQ4uPQ4qlErDKOpFNxjaYF2PT
	 OOoLeXIr1lWg1IBxymZ52/tQJ5xy375jpQL/kUP2aAjAaG08UQNw+Dxy9gPelrEXUV1lg
	 2Dy0Qb+PABZYJLx70jqeG/JWVZ6PWTTokMqbYMj8+tIznrF4F3cZLhjo+MPqGuj5iM4W+
	 ts3HPngiVlQ5YzE+U83dLy+Z6p4nHDLLMq9RNNqt1nwChaosmmU7dlNqkccBEUPBUNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
	b=jPdUlzr86dkgmeYUAjFCbiRfUUptxi6rp/urEfjNLvlwqaj/EyUfIUWs5XG2Qa3LSby0
	 uq0+xN7UijHYzswc9oPq5JKl7aDqZkrY8Lk6A5qbuRw+CcqvilpnrMgtNu1WcBXYMHjvR
	 LQvCpyQx0sJc/5Q9bfNR0+HeJukucnwFDxihP2Sm5zqvQllN1gEjgOLjfYT/GN8+5G5ag
	 Pfk54xJL19uuZHENZkOJH7L9OCSp+D/5ZE1S2XtCRk4hta5VvFS3X256EduitvQja5K70
	 rk3Dlkoagq/zUvkY6Me7MdWZ9et/LRGiE45Kx6+pgLejRkj5tKweExfWgb6qx0j3L/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS6M7tr7;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FB1606A325
	for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 16:22:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15FB1606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rS6M7tr7
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so823719f8f.2
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2026 08:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795018959; x=1795623759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=rS6M7tr7RCFnO3z1kH73+wDlxDWEXT/AFqz7BQ9nuLQj14vI8eZUE3ozk1uTWVElwL
         LwHO9v5HtUr52M+o/iopn5GXUvTNKCdo5z6Gv2MBMfvduVx40fcBPYL94bBq22YrvXc4
         IBhNcQjC6rDxpudq73u6Ly1b//Nxp9EuTF3DozYQ8B8FfNTIqGHnQ8njyrPYcpH/Z7s0
         +yjR/Z2ZTNaM0fzqKpPVSOFGz8AS2IrVSmSi00fYXGhIDJZHeRpMGIi4pODAunbWWdDU
         wDuE7Kqe0Dd7q42pugpj0wpKvpm+xyMsJCmhBYpWNg+tdhBrIcewDBTgZBg1vQCOFxzc
         O/NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018959; x=1795623759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUMfqx7WyF+WdMCXuuqSGNAynRyVFfZG82HjesEDTws=;
        b=CWGoEzatT69HMgIH8S6BABf/FnzXZFBlL82rwxo3/0xgjvUmMmTe3PeEddX329t281
         QymR5jHGhqpojzGIvsOtjesjX7bqvNsXjtRpoV9/l/kh2339sycqxxd8Vy1SNVuaeezl
         Fys8Sh44e2TWK1i+r6hPj17J2QoRvvZwg16m8Xx4tusR3gp+gDWw9i5WaJabilUVJWVm
         oWcz+gzWPnGeY2ckTIOznFN/3uciidB0QIUEiBM84awcPduJtW0+iLvuNuF/XWA+WUxr
         LG+imv0LEotyiF845Pywnl3+kZ8+Xbwn/2XXvln/bLqR0m9fHKhKQt2BMi8BfhpI9WUF
         dEfg==
X-Forwarded-Encrypted: i=1; AL+hErEOExGCjzIRSpNlER53GpT+qXAKcp8PMjejWeEOAzdCZ5rr5pkkNQxJS+jOR4tAQIJ7Wm1gdXeka94=@vger.kernel.org
X-Gm-Message-State: APuU4Z/g8MsBFmJpoqHvpAlX91htg5MlCm+RB/GdlVbKK99n0wTaiDXu
	F3jDH1PIOh9Ie/EZrW/y/xOgc0w/B/hxz+w5oSX7vpoH9ClYFRjXvJMd
X-Gm-Gg: AZFdTZdJbiGLLALfecErwPCCi8sZsVcsZeW+oK/0ATWXZEdti6sQ/2ao+EHc7pfnR4y
	UE+E/HPbuS+KnCANLceqWo0Ze9a7A39wMM8dGYyVgsHQ3VR2iA/NUdjQnfJa4F8iU1MekJSBb66
	fGHENfwEtyQ+3OPYqHVeLvm2pyFX8FCCKjuQ6/vdfiTTl8Gh/xUyCsUKKmaqg4qp2LG1Fpm7CMG
	jH2xJY98Js0v6K69Dmf0jfiy6cNAoU7vsapIX3dRVe6LqSkXTtKy9h5XrxvvslMzMXBuEFI7xwJ
	n59T8QS5nmY94ndg1xp4Tt2GbpE/AXzJGZfe81dZdd8wK2jYVSF/z/n7UIcNOQJpZ5Brcq5ymkF
	LGlz0b2P8ZXaxLh0imFMjDmWkltE+JX2mWS8a4MFHMHtqjDig7/+dwoXI2VD5hcKbXj6YayCwQ6
	PzHcXi9pCEtz2qG1O5ZT48YG/F5BLyrMQb0iTdSgMxFHuNH2et/VuRIvdQ+M8qMc42endU2YKzz
	GUoAWXFVdM+lrCBBImt6nVmLMJHxwxtKTdbK1kdxWebbutbqKK7BeV1xPFz8y+d1cdJ2Qk3o4ib
	5311KuK6ooJvMKsKTVKh0SsueZnsQagl6QS2SvoPIuPEOIDtRVNiynTNlRPWbsKHvn2oBnRWJNp
	Wr91oOqacgIhW24EmAgxsXz86LlzrHW4=
X-Received: by 2002:a5d:6f0f:0:b0:48c:4f6f:62e3 with SMTP id ffacd0b85a97d-4a63c65829bmr5664866f8f.18.1795018959207;
        Wed, 18 Nov 2026 08:22:39 -0800 (PST)
Received: from localhost.localdomain ([2001:861:39c2:e340:26a9:c0e4:d23b:6722])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65609391bsm5780458f8f.36.2026.11.18.08.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:22:38 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Frank Oltmanns <frank@oltmanns.dev>,
	linux-clk@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH] clk: sunxi-ng: nkm: use div64_ul() for the rate divisions
Date: Wed, 18 Nov 2026 17:22:37 +0100
Message-ID: <20261118162237.1664352-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ccu_nkm_calc_rate() and ccu_nkm_calc_parent_rate() divide their 64-bit
products by an unsigned long (m, n * k) with do_div(), whose divisor is
32 bits: on 64-bit it would be truncated. The N, K and M factors keep
it far below 2^32, so the results do not change, but use div64_ul(),
which takes an unsigned long divisor, as coccinelle suggests. On 32-bit
it is the same do_div() as before.

Fixes: e9d9dae0d248 ("clk: sunxi-ng: nkm: avoid 32-bit overflow in rate calculations")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611151822.QXTOs54d-lkp@intel.com/
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Notes:
- Follow-up to e9d9dae0d248 in sunxi/clk-for-7.5, for the coccinelle
  report of the kernel test robot (do_div() with an unsigned long
  divisor); squash it into that commit if you prefer.
- No functional change: m and n * k stay far below 2^32 for every NKM
  clock, so do_div() never saw a truncated divisor.
- Testing: built with W=1 for arm (multi_v7_defconfig with the A31 and
  A33 CCUs) and arm64 (defconfig), no warnings; on arm the divisions
  still go through __do_div64 (no __aeabi_uldivmod). Not run on
  hardware: the generated code for the rates the hardware uses is the
  same division as before.
- Tool disclosure: prepared with Claude Opus 5.5 (Anthropic) as a coding
  assistant, from the robot report; I reviewed and understand the change.

 drivers/clk/sunxi-ng/ccu_nkm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_nkm.c b/drivers/clk/sunxi-ng/ccu_nkm.c
index e5a8f22d50f5..a11d51dd0f2a 100644
--- a/drivers/clk/sunxi-ng/ccu_nkm.c
+++ b/drivers/clk/sunxi-ng/ccu_nkm.c
@@ -35,9 +35,8 @@ static unsigned long ccu_nkm_calc_rate(unsigned long parent,
 				       unsigned long n, unsigned long k,
 				       unsigned long m)
 {
-	u64 rate = (u64)parent * n * k;
+	u64 rate = div64_ul((u64)parent * n * k, m);
 
-	do_div(rate, m);
 	return min_t(u64, rate, ULONG_MAX);
 }
 
@@ -45,9 +44,8 @@ static unsigned long ccu_nkm_calc_parent_rate(unsigned long rate,
 					      unsigned long n, unsigned long k,
 					      unsigned long m)
 {
-	u64 parent = (u64)rate * m;
+	u64 parent = div64_ul((u64)rate * m, n * k);
 
-	do_div(parent, n * k);
 	return min_t(u64, parent, ULONG_MAX);
 }
 

base-commit: 3f8438336a3b340ffbda9e89480630436423782d
-- 
2.43.0

