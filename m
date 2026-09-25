Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838EF4E56C6;
	Fri, 25 Sep 2026 16:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354628; cv=none; b=h3h02ELM0VYrb90HuveJu13KEJ3rn4uuO32CVl6QnIY+UOF+apFgCVjHVx9jV3UYhbZ6Wbnpr3+WNqq1rWlPvWLVqR0mzCTYXScpglai8TPBsZvn4lfo2T8qIFcSK0sVNFcZCRw6eaaZXHmbgcxibJ9NSoVFE9ZqWalVj8VteE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354628; c=relaxed/simple;
	bh=yZEgQIwW4h15Ihnqucisj23sZl6gLOF4cqF9KgOqx8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dY+hew5nsTOU/QbKEHS5hmPP7gnYaJkqH/5fSC4ij72A8U29Gvrj5V7NpMy+lNj+3GYBeu3L0a323+YzLSk4On23cgFq4hKmyn3gauU3F5RMOGeNYOWlR0RU1qX8Y/n/Ivx+OlNJZiXLzeInhq/Wua+iCCgJLFjff/BCUX/1cZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyGOWdvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyGOWdvx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B091F000FF;
	Fri, 25 Sep 2026 16:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354620;
	bh=AdrwlXNLhoMQHdjz63qlsW97JxKRNwGnoqJt4hRakro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dyGOWdvxgYWIovWtMYYB40m9NCS0xoKWTAw5mrI+pWkEMlO7CMmiVc6tA6MZCdoe5
	 nMnY2BKYjAsjzLS40Nj5EDzG/H3fD8wVXbq15ZIKfMdToUkuSTm07lUTTbH5xaorxK
	 U+0U1UEdKrk5s5uRx5vM+bzIsyr2xo1m6lKHSu2HA3Wxpz1Ve0lVEjdJkrWCDwpPpJ
	 cYyIVMxkqekvyOTYPgJP3kmbO4U1UX7k51R5tN2EafkcDsSPsTJxu2oWEe2nD+okoX
	 7NKKXVbdGSjjeEEbvSjqHXo1ExBYVcBSkl1J2xZAQ3LggT/3ouQZ1Nhvr1wsKzthZG
	 zwUpB6ncIMo1g==
From: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sricharan Ramabadhran <quic_srichara@quicinc.com>,
	Varadarajan Narayanan <quic_varada@quicinc.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
Date: Fri, 25 Sep 2026 11:43:19 -0500
Message-ID: <179035461241.1296652.16122985631805142398.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
References: <20260916-clk-qcom-gcc-ipq5424-fix-tme-bcrs-offsets-v1-1-0fa10674908a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 16 Sep 2026 14:29:30 +0300, Abel Vesa wrote:
> The GCC_TME_BCR and GCC_TME_SEC_BUS_BCR offsets exceed the regmap maximum
> of 0x3f024. Regmap therefore rejects accesses to both registers, leaving
> the resets ineffective while the reset operations report success.
> 
> The offsets appear to contain typographical errors. Use 0x10000 for
> GCC_TME_BCR, matching the offset used on IPQ9574 and the surrounding
> register layout. Use 0x1a030 for GCC_TME_SEC_BUS_BCR, placing it in the
> same register block as GCC_SEC_CTRL_BCR at 0x1a000.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-ipq5424: Fix TME reset register offsets
      commit: a4330776a81f9b60d43e3a0342496584c1f53c1a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
