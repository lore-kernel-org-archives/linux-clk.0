Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2658389E04;
	Mon,  3 Aug 2026 03:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727475; cv=none; b=d/P/8yBnqaEyX+nb7B1nZrvw7l0n0olaRt7dphxq3aAuAfOjvm0/lZtqs0hmnLn6P1DM5Ai3Dc6scWklqJLeUIkQTt8Y5Dc7g+CKoQqoVpeiccpJ7S5wI58XgQz9Z0Ihw2SLgCdBeqpv/KQ51D+pa/2AXL7YnkuyqwwKIu8kbiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727475; c=relaxed/simple;
	bh=dDoihWawtqPG2Xf3bwdlBZ6p+ItnsrGkEZEU0cC6Eck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K9WnIcZ7OpLPF15Ptts9TbzO+TH4qn93+k3DqryP8tSdI+IppDPMIjyNR1WdnIyCBnObLvieqR15RQkX61N5w+FnfXnGjtGmUBaC91VZdkH4EkHGn5EtPpxB0UcB7puuXldKCEoOqqcTvJUr7IdeIGvCzlqFtyp1TIHF5gtGj1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HG74xWBP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HG74xWBP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19C91F000E9;
	Mon,  3 Aug 2026 03:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727474;
	bh=No3FcISIpFIIiDlkC6UYeQ76ZXlMbBXB5kubW4eDTBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HG74xWBPR1CzK3aHzT8faIFd1ep4hM2G7fkrES+jokZVkOOh6YP3vZndlrC6rZrJZ
	 GbeQnWa+j6t6so+3iLzrMt0nb4HV24A8tJPyQ14VqUdhaYE1ESjFpB5brUoqhk1DiG
	 ecwGfP8wrh6fgKxxzUfsTMb9hfOnGPxGP2JQ/qaXt2P0fipq1b1zOPaEgPyjt5aZxJ
	 CAZklwCIVUwRxRaRW0gITwlLuZrhOFQh6jJwOY2Ta6Ii6+KF5mFCns1iosj3zJvjAd
	 npkANelsxfEVDFOBAuiQ/P3mKj+gkxgBhiLp+qLlUut0utG4bGb44zpUBMrwzt2cgv
	 HXFCRnTb+7IBQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Return expected ENOMEM error on dynamic allocation failure
Date: Sun,  2 Aug 2026 22:24:07 -0500
Message-ID: <178572744556.408250.2506549946731143991.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629162127.3910603-1-vz@kernel.org>
References: <20260629162127.3910603-1-vz@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 29 Jun 2026 19:21:27 +0300, Vladimir Zapolskiy wrote:
> If a dynamic memory allocation fails, the returned error code in clock
> controller driver probe functions on a few legacy platforms should be
> set to -ENOMEM instead of -EINVAL.
> 
> 

Applied, thanks!

[1/1] clk: qcom: Return expected ENOMEM error on dynamic allocation failure
      commit: 22d9257f08913b6eec3e8ece4d13d9c41f14428b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
