Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737D3DA7E0;
	Tue, 29 Sep 2026 03:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651746; cv=none; b=tPRgp+WhVgMs5P+Y2lWDv+jiIbd3B+EyH37wMiY0Y1pyQMbTnBT3zawlXYHgh1xVjoPp+jdsut526f7d37tJyd5QWuh6ZbsVLHgIYusCjOQbOVPHOaE+2oKiqom2yzb+r7sRuhMxrrkPU7rCUUrvC+8NkZQXQSp9baAuTJ63IsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651746; c=relaxed/simple;
	bh=xUXB/wGGhO7cG5KU2tnrw/3ksAXxjX3wtV5ifZ7l0pg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N3DnUuOvaHhY0w7HV4cMBTF8PziuPrl6qJedMgSD+BUhjIBn8osVREC4D8BRJr3mxeRuvLblUN4qNmakpvziQb/APsxS9vGQy4RHL3JewBKgmptxFM9fS4+5YVXx01aqz/G/mJYAJOMaXpVHKwBV1l2AhIkx6v1ZdpkC/xjY88c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QFUsEfjm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QFUsEfjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EBB51F00893;
	Tue, 29 Sep 2026 03:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651741;
	bh=QepHw4rsKYLzw/gLQSfegDIM2BJrlEu+rJLNvpT7b8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QFUsEfjmUMk/4x7d1hotete/3x0QKaZwLgGGXujG+7CQFVxl6LDEKFT9igc2FrDe8
	 cXwmQ39Gf+Ys9rzBOCMKu9Prab/8trT+zThDfTTdH/hd5xwnqW7Bx8ROFZb3tJQbQD
	 bvCWc/FTPnh7eqnC0riyFkiKgLyrF67t2QR6PzL7eTt0u82q82um4OExaVNtvWYaX3
	 Xnz0QCh2q9dn9eglZLJ8PeKN0av5OOwdqqk0iBTiVz7Eayzolek56FhPqxDVp/zCEl
	 7vMpgzlZwdPaKtkzNdMDp+OCH5NH+niaC/n7MWooII48wjHCx7/rC92lXQKkqblhbW
	 HpVmPyFWJwr5g==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: qcom: msm8974: add MDSS reset
Date: Mon, 28 Sep 2026 22:14:41 -0500
Message-ID: <179065170941.2673486.13871653651451343539.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
References: <20260810-msm8974-mmcc-fix-v2-1-5c787d79c0fa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Aug 2026 12:01:52 +0300, Dmitry Baryshkov wrote:
> Commit 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until
> late_initcall_sync") kept power-domains on longer during boot which is
> causing DSI clock to get stuck and fail to acquire its configuration on
> DSI bringup. Follow the example of other platforms and add MDSS reset to
> the display subsystem node, fixing DSI issues.
> 
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: qcom: msm8974: add MDSS reset
      commit: 542991a1d77e5fea5263c2406773a0cd09a8ec48

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
