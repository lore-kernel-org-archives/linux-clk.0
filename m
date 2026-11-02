Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793584413;
	b=gFvXVv/Pv/+4mcJPXsGQkvgX9EGHQJ44Mh4czzuEChXo9FICpkDm+jAIFT7abY/zNnFY
	 O+wOGENL311LPs7YrJcwElDP6bWXTslnaHCbdrRznrssXEs/3BuD+D9pgaFr/CmrLKwZd
	 qOCa/RNnJtpCNokc+H9SBRxIOHyOpcQmkWDeK4HcT/7NQM5sqbPOYeRB7nCV1zKzyK/s6
	 tx9j1Qc/36f/p90jYiaCw4kqTIGtB0JMqBxvQ6rmGdHYQEZLmLm8CU4MbXosEsljsU5Nw
	 Bfd+ypELO+dJ3dBfxcoQkkP9pJG3fpBeiLPUhoEY4wcfLRsoW1KlkIS+mD/h2aCFs3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793584413;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=MROGN9E8EJD6Dob6PvAu9y9tvnVdyuPg06+xGcxd+JQ=;
	b=Z+zCHLb+5Q6qmGiYzTX2Sk+KAf9nL6jXUfwxsoYfxfPpvkgDca6grAWVNfkQY4EvHZ7S
	 EERqtkyxWGBSPTAqtL3ePBopMpT/vF5ZFFD2y+7rYozZKLoAvyBUaDVaE8aH7TENAqrbQ
	 R1muIycYFh3YUYMgLORaF7AW26BanKX0T8muFFKs0LJCKFIPXgbU0X5cRNCJL7e47fQuB
	 nXM2s37BQi1GGBqlgExKXko8hq2dUUycm8ahAzBFnMD5mnR74FGJpzqVaf8/poyeYO2yO
	 1Q7NCOUoWAMQx+byIyRwGFz8VYgCZAI/0jxnF9nWfaic+n8k/LF9m2ll9f/O1sa+Vfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKSFrJKV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D06606A324;
	Mon,  2 Nov 2026 01:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mKSFrJKV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8951F000C1;
	Mon,  2 Nov 2026 01:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793584413;
	bh=MROGN9E8EJD6Dob6PvAu9y9tvnVdyuPg06+xGcxd+JQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mKSFrJKVgmGVVzhHaeWprcQvTRIvHbFawicYqyIc2MXnSqdCiJDgbdAK539ODKohv
	 pBpSj8qqZSvk3b46E+nzHPmlATgR6MnxMylMcQHlhpwCu/lti6r+F6J2NKQec/jdFV
	 A0zHa+hdyK5GoLvyLukY5Sl1xdqGBo6aglp+aFXfUYWCqQpBLk3tGwj+Ld16+31Kcj
	 hXLHuCm87XZVwr8gvarOxdsbQPrkBuR8r+SFam5YE6lVAng8bM88giNWnKtSlIj2ux
	 7fn2G6TRR7p5i3u9fL2qXyWzlaWVY48mDSYnwBopckalJOKT2DFr2EfRETzUpvCQGi
	 2iipInWf9LmWA==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Olivier Moysan <olivier.moysan@foss.st.com>
In-Reply-To: <20261023-ups_mp25_clk_mdf-v1-1-3043b3fd4bc9@foss.st.com>
References: <20261023-ups_mp25_clk_mdf-v1-1-3043b3fd4bc9@foss.st.com>
Subject: Re: [PATCH] clk: stm32mp25: allow MDF kernel clock rate changes to
 propagate to parent
Message-Id: <179358440476.349160.7540127270699640525.b4-ty@b4>
Date: Sun, 01 Nov 2026 20:53:24 -0500
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
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=356; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=sRSUhW0nCs7Zfux0rOD2DZbpMM9hzet8PA9cOK33KXg=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGrn7Rags8rSQuCbM7vJWk1bUBv99T9TC14cpchuBdRWSfk+z
 Yh1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmrn7RYACgkQt9LdJ11+wIcVrQEAm4WV
 PUi+6S6tp/poyzpg/Usc8X6VU9uPBAOw1qbgZfkA/2aHz8WlzQ7R/IhaxLS6FqDS1s4+kKOBv8e
 3bCRXh/kG
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 23 Oct 2026 08:50:23 +0200, Gabriel Fernandez wrote:
> clk: stm32mp25: allow MDF kernel clock rate changes to propagate to parent

Applied, thanks!

[1/1] clk: stm32mp25: allow MDF kernel clock rate changes to propagate to parent
      https://git.kernel.org/clk/linux/c/1d6eae1cc3dd

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

