Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169511;
	b=UORUafD/umh2oTwOaog0Hryxyvjd2UtzXyAuw9MAdZOLWmJYbgYDKBDn2f/OW2iue+aY
	 4H8DLk1hq5TSJNa/mvEejD2vMISdMiv+DZw97gkxhsI7l4Zk5Y9qCCo+k40zvRTpXwL57
	 i+k5xfCiggmojmhO/2hn+sOYT3O4lfjZKyEXdxquiqodpyMF5hrjTKkex/fP1Xvb1cTON
	 r3BEId6liDcG4CB2TGjnAZSqoQtbGj8ATzwssNNFLqaN3kATm7rjgPcxyj7/oip25DU+a
	 qPqbwebBdLdl2OVdfZCoazB7g0RbOxPTlrpjZk81eYPsCH3vgBTqxrITmUyHx8Eh/wg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169511;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=guWYzbKXtCLlEbW80YVVHfz029+IJBpdnFJeA1ZabnY=;
	b=W6mwdnlKObhZq2/XJh4sc2yVKkD7HLe5SJZT+2Hr1ddbi23BFmO8PiZq+gRwM/jHNfUn
	 2pT/BCLls+KDZykyZuDISpXxpPwBqzCGwdOw1ilN04RHRAnj9TCZOTeQx+8r4EcsO43O4
	 EERmmlLA1//oVTak8yanfU7tIziL5qdwzIoNa7QxvoQsUEw9r9061HOJ+Md7HD2YEyqdY
	 JJ4LDs9Pih9gVfikjjUWIi6KoVhl04df7cMoW9XEoDMw2lD/voX6o0YSULwq0NEFN4hfl
	 +SAjo7IA5MsEaF3Hw2jFrkrnWUClyBdhwuBLwV/bgoTatsLz3WQ527Tb4xuEap4DT9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSHFqSZP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA9A6082BCC;
	Sun,  8 Nov 2026 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSHFqSZP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46CB61F008A7;
	Sun,  8 Nov 2026 20:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169511;
	bh=guWYzbKXtCLlEbW80YVVHfz029+IJBpdnFJeA1ZabnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BSHFqSZPI+jCdQSzde3TIdTsnhAS10CdAcpKlXPuI7TFlBdtP8yLzPbXQLw+ca2ek
	 7qKfTJBGBcmwa0HySOwmm2kzjvmk+IRiDRXGDmHLLIurtKMAEYD4R8w4cZrVfinTb2
	 NckvV9OjeVRJVOOgdkZnzA0ZBsZfQCOsL+YbXC65pzFVYdXG7TdWFyP+i2cLVQ38cY
	 bhO3L88IALbtgsbfibZLJLjdry/OB2nK+kTxspSDom4fV55JyeMmEsQFNLP4TglmSg
	 UXnn4Po5qpRLlFf7/7V0ugnxRyHcs6rSiZC9lroRwZTMDnkgJW3XVCidoECGJmY/7/
	 X/XFhRJ7vaqmg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
Date: Sun,  8 Nov 2026 14:21:32 -0600
Message-ID: <179416929555.628393.12847052904216857641.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103200847.606884-1-vladimir.zapolskiy@linaro.org>
References: <20261103200847.606884-1-vladimir.zapolskiy@linaro.org>
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
Content-Transfer-Encoding: 8bit


On Tue, 03 Nov 2026 22:08:47 +0200, Vladimir Zapolskiy wrote:
> On power on a GDSC enables the RCGs within its power domain, and if an
> RCG is left parented to a disabled source clock, the GDSC power on gets
> stuck. After a camera clock controller RCG is used, it is left parented
> to a camera PLL, which is disabled together with the RCG, this leads to
> a problem that on SM8450 the TITAN_TOP GDSC can be powered on only once
> after boot, and every next time its power on fails with the message:
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: camcc-sm8450: Use clk_rcg2_shared_ops for RCGs
      commit: fe1dcfcab7b61c4d3b9f9a74ce04df67f0a7b05b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
