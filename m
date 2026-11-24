Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795545677;
	b=w0blZ/VDJ6Sce9a70j+ZbKvlCTjQ1ebxCKM2p0UbL8m7z61K8J1XjpLbH4ywKe3cseE+
	 J6fNT8YNHCmMGxCfZ+pgs8BNvuNnz6rnnZGtcfNdpX1RCyZNEqkZ5bo61EExXXC+ymVK8
	 Kdnm2MnyAnnbXWvdYZoZJMCIGQJBxc545u5CiiKpGqVAdy4IkoPGW3R3OUohF9aa91xCy
	 uG5nbNLj7fQM5O4bLyLOKBWTlaptAo2AQrhoijlfLk+GtLcKirOEAniG2EYwp1/CI0UT0
	 yMzQjmoxnEYoxhdOKtmIxJtQxlCur5j30vjj7FkGrdqFis8s7+UpFiLknalybZpTKHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795545677;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=94OncMefUcNhEDwbiCTBjXKjoJuzmHSv8vTKTTuJQOQ=;
	b=smkq6JgAATYfZKVIkJHs8NFQp2jAEnSU45cFCyNPOZ/gRtjICrmRcVZmJbh0rSIG8JFl
	 XUugFpVFQnOxQyVAqvppWazz9lwu51HpTKpJdpzDYcq+8dn4dCBX7DpDke0dM1NyabeFI
	 A2L2i/jvz/mVyWyy1gy/e3Yz0jI6MyJm6YyQcHHOTC3whfaMOPUTWB5TeAps+CSvoRkqg
	 i/YQvyMyVWUlrH/dNvjq5oH7OaXRg71oY/UaJxoxv7AYpehN3TqHBDgqkKKeJuJHQuTPL
	 /EA91Zcbpu0TKKgcpiia6fF3GCu/+HZvXzZZW1Diw168T6Ns2fZC0lKikJVb685ZYrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJxPgz9W;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC206606A31E
	for <linux-clk@vger.kernel.org>; Tue, 24 Nov 2026 18:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJxPgz9W
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795545677;
	b=29GkeoCBJZD/3Q3wTu2B9hC9Uf1koMdUPmWJ6uTeRcg8CuEQkSuoRqgOUybzSV0EGJre
	 MVIp31sJSEMT9NYHSREONHIvFozfnFGFLtB5+Ed4tObgW0pt5k5OwGHSL4lJaUmd/I2UK
	 b+PEBRE8tU0q3ccux3d64hl4t37X4zmVZzueCgfwgoV6z8FT/k8tVcl0wdoKOay8iGkyv
	 m8omvBTgE8Y+O0EBVweC3Z2Zrd+E5Ep7pYQRHhxBYgJWrnFrJBHBX/JBw8A8E1ul8Llyh
	 biSYlvMWDG2l0A+Bo7Wjb1qYpikTEviVZJ8PUeOZABj3jkZ8hU1EK+QaPKaUnaVP7nA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795545677;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=94OncMefUcNhEDwbiCTBjXKjoJuzmHSv8vTKTTuJQOQ=;
	b=MN0sU4O23wFXcQ8N37i9HpoyTQyw4Ia/FS/OCh65pX6HDcmIUT4dASnU/Tztw4vb6o8y
	 K4RQURI7JrciD/kDVMhRR6gu4zYWpwP58x78tgOTTFwDi6W89NrfQqU2y84RgIaAqGqtG
	 KqGBs/QWPAv0Si6nuiUgEcZ65Gc7paKuqCGgj6xJg91Tp5yt2FSayMGcoPhtaM8C04jMg
	 uk3EqGRY1LjzI7PqI430DdQgVy/VnD07lyaBpamTQ/M5rwRfZ8HMrXrPNqph/HcOsFSPT
	 07T2dOU8EJuN5/FR9Y9qzG7wbPCUxa4vDGI3XzOg2i1LdhSsLDaISeQ9Lydkhcdr0hg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71CD41F000C4;
	Tue, 24 Nov 2026 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795545677;
	bh=94OncMefUcNhEDwbiCTBjXKjoJuzmHSv8vTKTTuJQOQ=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RJxPgz9WzU84SmcBfqvpUsEkQRspdeqREGJkNvbZM7zQbp1RNZKohV+4MPGRFu9OC
	 VH65lWES9Y3yoCubVV7S/d09ohfhxmuTcyBe5ijBJNDIEy/9ys4Mj4ZQ1d5tCWyeZs
	 72hTQsFE/EjAFCiIOLqkXaTAWZWdj+qshsigiz0V0cOQz+bDCLechOYCSpie51n+IU
	 BapItiJMP3wD2F+BXJZ/QWnUvIdDWuPgZAkreNRGQU/ySuHcGn87tJhBCKAiSr/BF6
	 fmdS9B1zDDG6ixAnzpPMheKW6Q+vw27NiNBPr/G5lIJBVhZ1S15ZUBB9P3X6JhCLbN
	 mNxjamd3KUTGQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C66484CB37;
	Tue, 24 Nov 2026 18:41:13 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH 0/2] clk: eswin: Fix the EIC7700 PLL post-divider
Date: Wed, 25 Nov 2026 02:41:01 +0800
Message-Id: <20261125-eic7700-cpu-pll-postdiv-v1-0-b1ccd6339a20@iscas.ac.cn>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD3aBWsC/x3MQQqAIBBA0avErBtwpLK6SrQIHWsgSrQiiO6et
 HyL/x9IHIUT9MUDkS9Jsm8ZVBZgl2mbGcVlg1a6IdI1slhjlEIbTgzrimFPh5MLdeXIdq0nRwp
 yHSJ7uf/zML7vB/69D9dpAAAA
X-Change-ID: 20261125-eic7700-cpu-pll-postdiv-24d1c98f1d10
To: Yifeng Huang <huangyifeng@eswincomputing.com>, 
 Xuyang Dong <dongxuyang@eswincomputing.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Brian Masney <bmasney@redhat.com>, Han Gao <rabenda.cn@gmail.com>, 
 linux-clk@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, 
 Jingkun Zheng <zhengjingkun@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795545672; l=779;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=t8ZcuweeJNISZuSMsr0ma3NCNW561sd+NOoXsw+v1Sw=;
 b=diPFeDuIDZU9YkcSf71xBpGfVxkppziXUTRXOyWVSnCDGZBgMMD8UO+z+vwdcNbgWt6VaM99J
 wHJwV6tWvgoD+cBPF+PEWiT4ohrFB2XO2+Qh2aTudnS3jJHkYOaQpMj
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

clk_pll_set_rate() sets a post-divider the rate math doesn't know
about, so the P550 CPU ran at half speed. Patch 1 fixes that, patch 2
makes recalc_rate use the full formula from the TRM.

Tested on a HiFive Premier P550: all CPU operating points, and setting
and reading back the audio PLL rate.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Han Gao (2):
      clk: eswin: Fix the EIC7700 PLL post-divider
      clk: eswin: Use REFDIV and the post-dividers in the EIC7700 PLL rate

 drivers/clk/eswin/clk.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261125-eic7700-cpu-pll-postdiv-24d1c98f1d10

Best regards,
-- 
Han Gao <gaohan@iscas.ac.cn>


