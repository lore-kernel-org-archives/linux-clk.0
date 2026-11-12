Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794485374;
	b=HYsPaDzLUCZSj27C1D/Q6K5gS17AfS4zbBkYNZs1//ifiZm4R+5MOhxHswZZ7iKI+0CL
	 rLixCRtGcH3tf3hlq6AkTKmg5ZInr5o0Z91OtKy42fv2ikvwwdRKYqhr5CPNkFbYh00Mb
	 WUB4O99Q2IBkXsntmi60nsIMleJXozjJ0Brhn6AbRP5EphyEeeP0GtOJY9/Fb4NQodavb
	 jlel0OM8b+mGtXYalbKh+o2ah9B5n9p1SrYSeheES/nRmW3LcBUc/tPt5Tc43+9PS3vfU
	 hGyAU9yYVLgB6Wip6KgBQzhktB46tpjdyvDkyiA3hIGuckzuQ1OAOXifODRkqAR79yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794485374;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=UikW9uf/xFnA2N8rJ0SI/amxaDAWBP7DQO//iFgbEYA=;
	b=AVCjPS+bjtcoc7sSvPPs606HlMs55K/zGkKJMNHQJh+fPgI6gaAjJzxZfEoXEn9WpVQr
	 VyfsaulGVBPdTzSHsb1t0fuaZ5VONyhd76X2AAK3toRj6fE/ie2d9Y3yCUAuJbV7+poRa
	 PNDDPB0PX6lAcudfddvaqIlIYrH0wjAMGnT1p6dS0nc+nA7ax057/S7I0VpdWPHk8gX23
	 N2Fh2brT5cGjOJHubqUw5h5gJKeZwYDynWa/0yKLlSTYQ5o1ACGxqUpKcsu3zoBw/P+aI
	 zjaKcg2/0UmNzopJEycPINS51ET+YFsNkePPza18QWDOciW/AI9zF10CU+urZFP1gkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMBL3i1x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43993606A31C;
	Thu, 12 Nov 2026 12:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oMBL3i1x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD0C1F00A06;
	Thu, 12 Nov 2026 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794485373;
	bh=UikW9uf/xFnA2N8rJ0SI/amxaDAWBP7DQO//iFgbEYA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=oMBL3i1xkKLBRWn6/ATajmAx/jiD8aMP3hh+WJeClwzsuQPuQKrqmGb5H5+1IVZ9M
	 j8DmwJzKzTfcZlNIqa/dBcacFTGey1dM6O/PGAe0Vglb9Xv7BWuEAGnSUav7WReLBE
	 DuL03vZK7iDhCyfd2BuBFln6lMnjXowXb1ZyNa/F/FZJwbmA4KZ1sBuC0/baS3hpuz
	 zBVdllTc1HmsOSgiFJObK36lHjlCGz1jiW/ATLmvIX7eKM3Dx2qp3q0J5VaA2OXp/h
	 +Y5IFFxioN2dLew/njScHCWhM6t/L31KE4K59OAwhdb1nUac+N41H/9xYc0RuPFXIT
	 4WJO79GhvOVgA==
From: Brian Masney <masneyb@kernel.org>
To: Michal Simek <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Linkai Gong <gonglinkai@kylinos.cn>
Cc: Mike Turquette <mturquette@linaro.org>, 
 Soren Brinkmann <soren.brinkmann@xilinx.com>, Kees Cook <kees@kernel.org>, 
 Babanpreet Singh <bbnpreetsingh@gmail.com>, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
References: <20260908084727.1552042-1-gonglinkai@kylinos.cn>
Subject: Re: [PATCH v2] clk: zynq: return -ETIMEDOUT if the PLL never locks
Message-Id: <179448514302.1202846.1111029538170940837.b4-ty@b4>
Date: Thu, 12 Nov 2026 07:05:43 -0500
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
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=469; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=gzP4VH5mbkB9Vv26t1n4TjvafvjC91W5uK6Td8dMPhA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+rilp4s7Tf+h0wCeEQyrDfea3yC8nK/brb7bk5irVj
 7C1SvbpKGVhEONikBVTZFmSa1QQkbrK9t4dTRaYOaxMIEMYuDgFYCI7DBkZ2p/qFPc1T9ywIfDy
 xMmGS4tjzGstu7eUrlv/xZ8n2OCxESPDR0uPzGXynWGbdvan2+0wKhXsuF3blW6cvdQkf++pr5e
 YAQ==
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Tue, 08 Sep 2026 16:47:27 +0800, Linkai Gong wrote:
> clk: zynq: return -ETIMEDOUT if the PLL never locks

Note: I reworded the commit message to drop the changelog.

Also, please consider posting another patch that allows compiling this
driver with COMPILE_TEST.


Applied, thanks!

[1/1] clk: zynq: return -ETIMEDOUT if the PLL never locks
      https://git.kernel.org/clk/linux/c/b015dff34319

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

