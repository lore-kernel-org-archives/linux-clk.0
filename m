Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E5F307492;
	Fri, 31 Jul 2026 03:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468282; cv=none; b=JwfMrLTevQBIgFUjWKLMual1w1Z9XgChPs4wfK9dr29+t01O20KlY11Pc30Df/tDcMdHJWWEXdIAGhpxFG4W+F+aAVq6q9LG3QO1NwhRcKGXsY3BNCbLB83WgEfqgM/6q1NxE5LvJpX+u3QiuqEF7/yS1mmo3BsLMnf34QB7Oko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468282; c=relaxed/simple;
	bh=pqfh11gL7jr4rj+3u+RnHpw/16XVf7mH5+aRsk8fO5I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SksYrXUGp41FsWJXeysdElw1XjVnQk3PUlxWnF4aqNmwkFGoylMlpRM1aBAVGs51MyNfwox6Chk5bo+fHG3mIy3YiIgID1fiStCPcBxoiYX7PfiP0Yg+6MBWdUrtbhth+5tqyufQ8Tg84VizWB7sMncLn9WSYBZFk6a327hvtQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AIrKYUs4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AIrKYUs4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FAB1F00A3E;
	Fri, 31 Jul 2026 03:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468280;
	bh=OWp6pWdWfSagrW5LseG9mMr4Rvzs50E50ICjZ+mt1z4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AIrKYUs4cKwuOv18buf/e0JgrkaPz2Ew2ehBcCmNsCz1uV+diMlJiZr1o3pWQ4eCx
	 joerkEqma63357qIPPfIiw9O0154PNKmE6bW5Mw6WKGux4KnYyofJz8F5Ygp+CYz59
	 W70ofKnLclWrcpySdWbqoki9WHfUdKOX9SH7+lAEkyrn2Voxmn5ZmM8QvMJvUD8HU8
	 fqZ3oEcrNqNDaJ8XHbLEBHfLEMZdq7uuSyBTSjx7Bzjf+Bc7xR8NlPQootZFPsZTU1
	 Sh/Sv0laoG7Q++VzTcPMhM9uB5KArHUUnAK2uEKTuqFl/3tViTJwAli8mvX27IGSsf
	 Le+SAbia0ppjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2] clk: qcom: gcc-shikra: Add additional frequencies for EMAC RGMII clocks
Date: Thu, 30 Jul 2026 22:24:13 -0500
Message-ID: <178546826812.316815.9609566068248456737.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722-b4-shikra-gcc-emac-freqs-v2-1-2e480e2de8de@oss.qualcomm.com>
References: <20260722-b4-shikra-gcc-emac-freqs-v2-1-2e480e2de8de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 10:11:14 +0530, Imran Shaik wrote:
> Add support for 2.5MHz and 25MHz GCC EMAC RGMII clock frequencies required
> for EMAC 10M and 100M speeds respectively on Qualcomm Shikra SoC.
> 
> 

Applied, thanks!

[1/1] clk: qcom: gcc-shikra: Add additional frequencies for EMAC RGMII clocks
      commit: 60276a9469a1df6c86666ecc21fa8ad10d90e809

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
