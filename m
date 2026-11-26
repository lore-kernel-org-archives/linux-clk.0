Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722286;
	b=v10CA2z9S5ZbdIgt0LelsXueosUx4sAIvAhgZcWkw2xtL97OpeQJpU5743aTytAakWN+
	 ysep+qFfuT6HGDVSl3Ki7xTtbDh2CmiFcHIGP9seVZ30hS1sIcmuE0R6zl+LCc/J0Dk/0
	 KHnDkE2GA5RXzZv0p7juoKizdQ7UFHrppGtOua9aPKdbWknT4Bu3GZ2CfqgYQpQ0egOFv
	 uS2ly/P3XVM+Ot4wXYgo57JZzV6GvXb+e4w1o85deB0nOnqXY3YIoKxLTuZd2GK8UZWPq
	 zI+ikWItYw7NwcvHGO0JMIV4SbgNZ2iee00Lx3nVnIX7s6rxnFuLn8Bd4pH0pz2xm8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722286;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Oo9+vrYhAJWcCP9yTjV9mqNzkHZ2WVXfX/Ghz4OifHY=;
	b=h7ni0c+dEPk2oKCSY1FyZ+wnqMy5aWou3faXnzKATqo8aFgvNACUMLIDicwxgozNZsje
	 OAYVnzpP/460BrfMpZUUq/7WuRomn5IIdcce3c6Q0L/6wcoKKWaE52JoJjOK1qYFJxCeF
	 RGaiv55uWglkIlINxjIVWu3YHJnqkUxMxyXgTPxrHt/kadxCBjB0vOiJMyQXepwcXW9Gp
	 lKZaGoS+tg9S6MzrQmSZe1DYpMzkOpMpfTL5dXw8iX0rKIsxjgx4qgTWA6X0faGt+tZz2
	 Sraf3aeIgY6IKqLGAdjiEpOFX7sQTXMC1VyIO1Z7xjPNnqnmcZHWTIMLubgPQ7vSOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lu5JrHAc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD167606A31C;
	Thu, 26 Nov 2026 19:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lu5JrHAc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964391F000C0;
	Thu, 26 Nov 2026 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795722286;
	bh=Oo9+vrYhAJWcCP9yTjV9mqNzkHZ2WVXfX/Ghz4OifHY=;
	h=From:To:Cc:Subject:Date;
	b=lu5JrHAcqLjCYmqJ20tk1pnHtdSHfqZ9uMPiI2EfFJ6SDRi99vzBf2PiuiIu7owRZ
	 3bMuk6sPZgjzpHnyUsQgeRENnPfVjHd3oDp5Ce2G0X9dnH4LYYHAh1HLLwJ5wm/uMk
	 N8hIdkrEaGjZHdBP8HKLAiaqYqDjbCDo4MNtWT/9YISxz4J1fJ4K/GOhQh7SK0t2G5
	 /pm03RVfH55UpDbjXFB6+M8U9zI07QJF8zoPReso5C6wpAM/bguhiilcDk+aBD+XsI
	 mvJADiSX0Zdh4wqIXTr2gVJuzxhNSLXUZtqoj9EeklYfTmWOmZvS3PxQsvLb0fXlae
	 pVdpL61XIPXzw==
From: Bjorn Andersson <andersson@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [GIT PULL] Qualcomm clock fixes for v7.4
Date: Thu, 26 Nov 2026 20:44:41 +0100
Message-ID: <20261126194442.8026-1-andersson@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-clk-fixes-for-7.4

for you to fetch changes up to 60521e4ff9e7f1b41758f387842d73667a7f0410:

  clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs (2026-11-07 18:13:36 -0600)

----------------------------------------------------------------
Qualcomm clock fixes for v7.4

Fix Glymur GCC power domain handling for PCIe and USB.

- Use collapse voting for PCIe and PCIe PHY power domains shared with
  other masters, including domains enabled by boot firmware.
- Retain USB and USB PHY power domains to preserve configuration and
  fix USB host controller resume from suspend.

----------------------------------------------------------------
Jagadeesh Kona (1):
      clk: qcom: gcc-glymur: Use PWRSTS_RET_ON flag for USB GDSCs

Taniya Das (1):
      clk: qcom: gcc-glymur: use collapse-voting for PCIe GDSCs

 drivers/clk/qcom/gcc-glymur.c | 46 +++++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 10 deletions(-)
