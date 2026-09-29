Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4603EFD17;
	Tue, 29 Sep 2026 20:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714062; cv=none; b=RCmZK3IcAIYm+WECCW/czSojGdpBc2uvons1wTYalg6eE35HyqDV2gNYTatbQsO5e4WidsJDEUDlcsXrIJswz/wxKh0LveTuTSMuHhrPXJS9yOu2yTKri7jjT9XNTJSP6NMdI6vQjzlAhhnyqbQID+dvfj0EKDbqCTcSsTJtdHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714062; c=relaxed/simple;
	bh=BfZcupWhI5ahJDjeC4wsNbIVI4Nbw24z0Adm8BqPlVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rf7qnGiUvMTQJzNiv5pOTdx9DKKCDtVWOtFZbf4yNdzxZMqm1Jts3nRw1tC8/iSrLmjilSveh67VHA+yu/TVlsYMIfOBR7zlu7AFZRKlKjyXz3DMbi0RL18WfMtwRM3lok591uvuxBg0BUPl7mMAgqpxh3AXzUBermMUhQydzxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lu8uI9HA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu8uI9HA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB031F0089B;
	Tue, 29 Sep 2026 20:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714060;
	bh=MqxhznrnsjyG9ebH5kY/8Kl7ayyQw8UgzT4BU66fEnw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=lu8uI9HACYSNmIZb+hwDKpJwxAIhfaT1c+70vMyRiimc8DS3zqc8ybpRezkL6ZaUk
	 bdqAIEmocHmN5mwt44rVsq/rLO1MCI0v4YZFgcIPVFTTYQrxo71C/uqXk7z4q0MERm
	 aNhMyaez7qJMnq/1Q9EzhXhXWV4ohK4xKrhl5KnaeqZmjUgQgZI2DlAmKEOwZLgjQb
	 ENunvyGW5dIJkeJ5q583zujkRIZX9GfqRk9zd/B37tcIgZLb4QNhli1Iv9zOCS5uES
	 BwT5aqfQtXfSd6Pps4NOoifwVPGZZ7vlcHIpQaiZnrgLoV9rSvi3B53sDf91CIG1V1
	 RSSSW5pCIZehA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 0/2] clk: qcom: Add camera clock controllers support for Qualcomm Maili SoC
Date: Tue, 29 Sep 2026 15:34:13 -0500
Message-ID: <179071404941.2903617.14660816524713513430.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
References: <20260922-maili_camcc-v4-0-87704b664dde@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 22 Sep 2026 09:26:36 +0530, Jagadeesh Kona wrote:
> This series adds support for the camera clock controllers on the upcoming
> Qualcomm Maili SoC.

Applied, thanks!

[2/2] clk: qcom: Add support for camera clock controller on Maili
      commit: 4ba7bf34e60fec198b1b76470ba02b495c45788e

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
