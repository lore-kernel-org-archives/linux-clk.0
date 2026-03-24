Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E113E2776;
	Tue, 24 Mar 2026 06:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774334753; cv=none; b=op26egio2f7kdU8i9KQr7CdIomXsZL6Wye3GaFemiMieOTlDINtspZ26/MQv0ZN8MlA1BibmH17w41UnW+qW0aiqUtqtOVO8aKQAyOHXJpuX8mvn69Qh2TF4W2rKkGQ+wLiwhIBpz0nO1CBAibhRZRKh2r2Ur57egduIJguGSQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774334753; c=relaxed/simple;
	bh=nQSem+Qa3va54hpcGSLu2gvFmVM0Xt6MgljRrmslJ3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LDygCXGGr39qcVFNkO6Zqmv/AT284FlLpvq6EiTIjkncs93pX6ZxO/CD8y2tLYN7sfF5oYKGAEFpVnpBptOD/R4IEMV5ioeFmqaRIzf3SlQNLswtinCD7loDuzLrLTMiYUsMDArlk6Iz3MAfRr2qS65f4X9+zhnL30RP9sUXxGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roYKMvgg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roYKMvgg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90481C2BC9E;
	Tue, 24 Mar 2026 06:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774334752;
	bh=nQSem+Qa3va54hpcGSLu2gvFmVM0Xt6MgljRrmslJ3k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=roYKMvggSyOEL70JurnNN864sl1cuSmTR0YBbOycah9QlYqV/hyQ8V+fKmyz4piNf
	 ZdgqPH7QiFEfb9gHxjrVQrW+LObU8EfzzhwWo40Zz+Vy6IBlSo/zufAU5oacRn2sa2
	 py+3XAk3RGnJCQ38e8FQnXWJB7+6We/cfISCuHdTJNIWbv2zSlyo8EcrpCdae1Ae5f
	 lVkoD6CHqSadWO0gEEM4Yuh2a2VrbKnU2P1tMecx7YzAxAA/FshCeqIF40AKKcSJjb
	 OpyuV2409Gf6Wd80oHRQycQRQaBwi3lUT9DQJBuP/jGIoS1ARBNc8VXZUMISSG3qlW
	 3Pqu5TW5R6Y0A==
From: Yixun Lan <dlan@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Haylen Chu <heylenay@4d2.org>,
	Shuwei Wu <shuwei.wu@mailbox.org>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
Date: Tue, 24 Mar 2026 06:45:38 +0000
Message-ID: <177433463997.242902.739790871603648740.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
References: <20260305-k1-clk-fix-v1-1-abca85d6e266@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 05 Mar 2026 20:46:08 +0800, Shuwei Wu wrote:
> Fix inverted condition that skips frequency change trigger,
> causing kernel panics during cpufreq scaling.
> 
> 

Applied, thanks! Will send to clk maintainer as v7.0 fix

[1/1] clk: spacemit: ccu_mix: fix inverted condition in ccu_mix_trigger_fc()
      https://github.com/spacemit-com/linux/commit/54e97360b44bed6b4399dd3be3d65f392df940fa

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
