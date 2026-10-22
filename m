Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705989;
	b=0PtTLoAMtF39Uh7s0S2hXdRAYeQdlnef3KUFB5nAGdAyX9Tq1ahFrn/wCRhRngsW2XDm
	 tfPyZV6I+qGGkKQvzTVkGzC22qssKzo2j8kmgIuV32Em5nkxFPePs+R1/QWQOyhF7dWcj
	 o3PQyEnopEzCfQO1mdw18IJVG93SuX4ZbOOi47Iy+pFroNn3ADguiYW90+sR161Jo6/Bj
	 bMk0A5Yh06OwSxiEGT29TTVphKIWp2ZLEZtlpAUzty5b4MHk7chMjTeNPqXT7LFx3qe2o
	 Jf6UpqQuMPTBYQbxpRdfIMU49cJa+3sSfn2SN/NWEhCYDtc0nNYaUVx6gkgR3JJbJOg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705989;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=DTvpZdrzMHo58dnlhxU+/GyKaasgGpS/FpMT1oMFqiI=;
	b=4m5GLSaGtY7hFFCQV18dyALkhiMSnRp27yn6qZUqCfR04ybDi92sqk6TmwVvBrHV9Wnx
	 Ujg4qRNI5T40Xn8xjpUVtnL2MyvlhBHL/S5D3e253CGqsr1Vx0TfwWc1iARtLHKTI/PBS
	 6LRSdiSiY3xGXdwdYGWq8kN/jnM/N6Sat4A/3UiKll3fKRbuY5oNBXH1OZfy2mUIwOeyA
	 fYexA7cZJy0tBceV6L4uyQlJ1I7y0e88PND7K66Yp2LWz6IP1iYqEPw8BpWIFKSfZt7RL
	 8NSk+iStEUR7b+DOi3VxbZPO5j1yE0dmwFyYYdAGEh0bi+RyZyu+T8jsqTkvEzat1yw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f4/yXbzr";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7259A606A321;
	Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f4/yXbzr
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705988;
	b=z7Z//7QdWHsDdqUdKc5/u31Mz4r25lP7ioz+YKfG96HIxOBqXJ3gelyX5s8RnuSqIOYj
	 iUc0esk5cqmAV3kvnbFHlQnlyl5+oq5C9OGvdm/2FpOBZkTIqKDgQnUGbNtF+a0yl0Ajb
	 34RvbfrEa25VUkoREllVHiTyx+jzWo7S1APDm/1scth/y5Y2Jmb2YxKl3JNxIIrjBhzmO
	 iAIbhLS6WmUqIGCH/ffirD5I4/z2+mOexqBgWGYgaXH0o9nTxyIXVI09pdKBHz1AvsO9w
	 Lyauvgp2S7ZGkYKd07/T6IMdPtZmwn1jytXPyF60EpnTwEdev+7yov7//7kBkIR2l5w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705988;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=DTvpZdrzMHo58dnlhxU+/GyKaasgGpS/FpMT1oMFqiI=;
	b=sLKRrcySykTV//pYdOYcbDHjQ+diZ5LeD51uo2F/d0gwN3mBkitaBbxyiwHba8l+oN3A
	 c37e0eKNK9P7B4cS3Y5rlmyBVP6CzW8prvu8Z+fEApeG+no7D13HdhKE44bHyvFys59Nb
	 oEkScPcORCvseHa73XDIffhYVbBzgmIpreuXkzHsieGsV4uaaWZnLV8Mb8bkC1ZAYYIun
	 ycX7ltYd3+uW1aZqVoirOzt9vQZYD1jT0TobCIu9520I/8PoutlrQ1vrEW+ZU3Z0U9o1H
	 3jkfiKGMLrJI6B9b0fVrWcqri6vFheiMY38TnfvmKA+SmzrGyULzccqkTDPxXlA/9nw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5697B1F031E2;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705988;
	bh=DTvpZdrzMHo58dnlhxU+/GyKaasgGpS/FpMT1oMFqiI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=f4/yXbzr1ZMRrJh5UUs7hh5nnH8UtpBaEdES9VlIghAJJ7vwKrwQRlsF6wlh86WCb
	 1h6G/Nk7Oy97FYle2xwvPM1ufWIJXpXnTEjF/oyH2XJX5BJTYiqSKv7KWVsLsnKejm
	 sL0TVrskW8OHEW6K/URmPqkMwI+lucpu2yhPVESAV04MWekNfE3+bcr5CdDvPvY/b+
	 vSHTap7tjRlVG0ioMepQU7Howyn5Hy4CJcEWkUQBb7zsbAgrWZ2zHP4XX4F0S/UP0V
	 8C2JoYnZGft3IAQ0FFpp41Nznas+3+AGW2mznmOE5qyB0hW1CGjsJnujUYTjY1SLUg
	 AiRiOkJe/jbbA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A623541F91;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Subject: [PATCH 0/4] clk: meson: g12a: fix a few clock definition errors
Date: Thu, 22 Oct 2026 23:52:38 +0200
Message-Id: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
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
X-B4-Tracking: v=1; b=H4sIAKaF2moC/x2MQQqAIBAAvxJ7bqFd0ENfiQ5qqy2FhUIE0d+Tj
 sMw80CVolJh7B4ocmnVIzegvoOwupwEdWkMPLClgRmj3piIHYZ9Q4resCcTorPQkrNI8/9umt/
 3A4rwOaZeAAAA
X-Change-ID: 20261022-fix-g12a-clk-1fb52b15cfa6
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kv186d9Cog+H5dWdzKf8ASTTBRJiUw79UW7YCNc2//0=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1g0fNi+Rc9qleitm8/LAgJbJb64ef8cW2GcvknOKZ
 /fEWwmzO0pZGMS4GGTFFFn651qeeHf56Jmve9RTYOawMoEMYeDiFICJhAszMsz1K2F8yr0t446h
 x9GHfwyWR+xf4H37+sWODWyJ9z9KnyplZOgUU0n/x2kvfKPZ+nnanfNNDBYVebaTKoJCPe6GX4h
 ZzQUA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Reply-To: linux-kernel-dev@aliel.fr

While reviewing the G12A clock controller, I noticed two unrelated
mistakes in the clock definitions:

 - fclk_div2p5 uses mult = 1 instead of 2, so it runs at fclk / 5
   instead of fclk / 2.5.
 - CLKID_VID_PLL and CLKID_VID_PLL_DIV are swapped in the hw_onecell_data
   tables.

The first one is a single fix. The second one is split per SoC (g12a,
g12b, sm1) since each table was introduced by a different commit so
I provide different Fixes: tag.

I do not see any consumer today, so nobody should be affected.
I don't think there is any values in backporting them btw.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
Ronald Claveau (4):
      clk: meson: g12a: fix fclk_div2p5 multiplier
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for g12b
      clk: meson: g12a: fix swapped VID_PLL and VID_PLL_DIV clock ids for sm1

 drivers/clk/meson/g12a.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)
---
base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
change-id: 20261022-fix-g12a-clk-1fb52b15cfa6

Best regards,
--  
Ronald Claveau <linux-kernel-dev@aliel.fr>


