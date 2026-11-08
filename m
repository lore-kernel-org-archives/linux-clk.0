Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169392;
	b=FyfgcYynmZ6v9UJzAjLgIMq5LeEHCSA1Pu02sxcbRLLACeHWK38/qCsUckv6NdwJU5Hz
	 swT3yCST0TLF8M4ckpbTrBZnGZQcW/ezq2qJXcN+7KK3hKgORe9PvWP01GzAL8lchQRAa
	 AGig5WS6UySKLZrS8IqP1CRuY1Svf/YsDhW2YrskK1PR1D3GZJSSb7tW8MXmr5MRhS6ri
	 sw13r5zmPpmoY73N0IQVQx1qfjBJTehjQoyucY8hAFelPh6YSvYW47tEedL3cT7lrDNQh
	 kgUKoBPGC0GozE+AtsuWnLiZtwKzHZo/+UIsrBRx8uJpJWOzusKhCwWwCG/dN3I++qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169392;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hrN+MbT2kW616eaMTGJT8DrhxInPFegVUzPWjQ8Lmyc=;
	b=IxVXAG0f+6YKO+Ek0O++/laOk89Oqu8hg/BVwBa1Sz0qW5Kl0TkNP0ySP5WoI6VnBYns
	 bUi2LUFlM2PWOMgfg/M1M4n4DUDsMEmwmOS2xTS/IXmzFGZ/qJVFgHdqHgMYsO3lD1pDQ
	 zOTiSEXU0TKgmpsGBXQfPNhxZDTuDcG/WPaw3Wo3viKJojkbML6SSDoAVpf3BCkej/RZN
	 XPStbIXykDWgbpuk9jg5CSrN7J0BWDeEMLLF76ABDAY81J6vtJyaG681TzGd1xjCcfApm
	 BdkxdfLTfRr8bRyOx6DdJ1nG+ec2Kpm0SOX/0SNTgbp0OmpO2IOo2XehReP9VOs5EIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5fTpsVq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABD7606E53E;
	Sun,  8 Nov 2026 20:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a5fTpsVq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CDD1F0089F;
	Sun,  8 Nov 2026 20:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169391;
	bh=hrN+MbT2kW616eaMTGJT8DrhxInPFegVUzPWjQ8Lmyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a5fTpsVqiEYMIuB7WCVdM2SmrTD6rNNd3QhWKmdFz7p/Lkgp8RueZQ2oAgVeWc+cS
	 tyzkCadprAR+3UhH7fbWWu70hRyW0jnveb/cFz3TFGWx1NlFcGs+rWxW8/97cnAnmU
	 eew6JgrHOEOvenzVg8hH7my0Kykaw/fK91j+xiHIwoxVw7ao9zrLcWx7m7rfK5dDm+
	 iBTsPYH9Y1zpgZGDXq1sUbt5e6vzg9TAwZDMKX7H0C1TA8k/MVwJUqtt/XU9b1osfB
	 toDExafEUO4Kucf1pvaz/WJF4Of5UYQEGBzbRZTiyJLbDqDqZrBhXoUtgF33419p9M
	 2T5+vqm3Deqcg==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: negcc-nord: Add frequencies for ne_gcc_sdcc4_apps_clk_src
Date: Sun,  8 Nov 2026 14:20:00 -0600
Message-ID: <179416929341.628393.17822157471511144443.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
References: <20261009-nord-sdcc-clk-v2-1-e00ecfa321c3@oss.qualcomm.com>
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


On Fri, 09 Oct 2026 11:38:29 +0530, Jagadeesh Kona wrote:
> Add the frequency table entries for ne_gcc_sdcc4_apps_clk_src to support
> the additional clock rates required on the Nord platform.

Applied, thanks!

[1/1] clk: qcom: negcc-nord: Add frequencies for ne_gcc_sdcc4_apps_clk_src
      commit: 34e531a6dced89c5642cffeae309e403fbbc14df

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
