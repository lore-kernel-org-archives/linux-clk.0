Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D680F35E922;
	Tue,  7 Jul 2026 03:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=dALiH/x99423onNHA1hJuwJWPu0MBggt5Wlj71TOXjc098UK2MnUtZ+iudouYkYAe9VFnrZ5Anrotx/lmYnp3PGQfpiK70JvHEDTBbEAO1/U4mIvsiIUqA6lQrNaa4NbMvQwVR/yaJq2AiMHO3i/6zYtrIEJT/aF7t4t/upa2to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=b6Sb0LDkyt5nAYOCQJRmBNKvVnbAdD61JWaL2RTVTdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKVnUlM6cCKfZJyWaIeufR6Bep+QGTr0LIXezye0s9e1S7oqfegN75QrHuyXQwWa9X9vs9xWqlQ7d2hlfbA0wds/VDLUjjplnr2HKK6HePHnw/sWgl4aqDnIEeEekGmRYsbbRBFpwpFf57BC4+tpqkLTDuqsl724kHafXxKAKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9P25Rvn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9P25Rvn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AFB31F00A3E;
	Tue,  7 Jul 2026 03:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394517;
	bh=CZlz3Qw4SMeQ861vJm7j+kUWoFcgrQpc2ICQlekS8JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=M9P25Rvn00gBUVkvV195uEfCySHId1rXSWk8RT1ATj7GbFOXSCYoahd+z1nWjhb4F
	 +LtZq7tD19Nsf5BYl2wrSda3FzlhD2Uu5pzac78aezZw42rJauO3PAHHu+KXe4nFbO
	 tGdE3IG3v7v9HC241ZL2fDv+LcHimYBH7EaTHU2Cz1Vi6o3PH6lela0FVoFbM3WTlm
	 55Jvk7puCGwiNV1nn2qixqLSw/8GOQP/dDx+YAmX2eOwb7tE4GHM3kxI0Fd7/Sxfyb
	 bYrGI9I3Ri5HdnX6KAPlQrg0UtC4FvP7rWiohmDv2vU4h7eIqQqPo728j81NvdI8kS
	 2cKbmhUw/epWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Don't use all caps for Glymur GPUCC
Date: Mon,  6 Jul 2026 22:21:31 -0500
Message-ID: <178339449914.1938770.12648702253351432389.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
References: <20260701-glymur-uncaps-v1-1-5f7065348eb2@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 01 Jul 2026 08:19:30 +0200, Luca Weiss wrote:
> All other Glymur driver use "Glymur" and not all caps "GLYMUR". Align
> the prompt and help text.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Don't use all caps for Glymur GPUCC
      commit: 027dc284d5b36733c0868045ff58b6b25b786bb5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
