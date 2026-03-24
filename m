Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59789366557;
	Tue, 24 Mar 2026 03:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323738; cv=none; b=MGACnqacM+9bFtBPEExiiaCjkf2RfW0WuOOUkVfph6+9fcKSyEfM70Bq6Us+5ZJA6ntA5T7R69yOjHGZj2NYnbND8W5pswvZMJm2GJ0kbUkvX2+UTgvoxhoKySQL40sWXIgWkG7YK9mmeKyYtCdnQYg2hYREJBCqYdX3FI0KCBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323738; c=relaxed/simple;
	bh=8V1UNozt+W9MbEtfJztWqUALFoK5TAwMw/p/QFXZ358=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tJwIgZHj15rM2irpGHJ/scdS4c+ise6SFllhAlImqRFJckb8AhDadma65pcmCbpUujoLakovC2iRNdbtkccAZrpWgP9SHSMqsxsCyZ5e8ires1zG8kdBgV+8JOuNAwePzjDwmmn73otLTEdmD6HcNptRbO9txNPdPixm9aBhf9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBIIY4ag; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBIIY4ag"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2833C2BCB1;
	Tue, 24 Mar 2026 03:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323738;
	bh=8V1UNozt+W9MbEtfJztWqUALFoK5TAwMw/p/QFXZ358=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBIIY4agkNDrQLFuplX9wd+/q9zwmDV6zZNq7jrpX4Fj+x+muoPZzBFpOUnZ8mMRN
	 +PeROGE3A+UUwei64pNUXrM2CvE/LQSgevtEvM1KOPYk4cvzk2Fz4ZbTQtkr8CpGN7
	 OIcoVY5lb0dYgHDWVrAT9eBn/ttTM4QJ8dzFzhsRLocb/nnDOGsFnGNYZUHTAWI7T1
	 HhIBc+5eA8vgVJjbuvAgRPyELsQmoBVH3UUrCJ29mZgwYy8ViwPzb4pBlTFREcjoaH
	 YmV2Gsp0Nva2xkPDHLf1qoVzek6okFMuBLNqezXXnSVVj1+341AOxumI5qJnO03wdW
	 PJc/mPZg7yDqQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>,
	cros-qcom-dts-watchers@chromium.org,
	Kalyan Thota <quic_kalyant@quicinc.com>,
	Douglas Anderson <dianders@chromium.org>,
	Harigovindan P <harigovi@codeaurora.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Val Packett <val@packett.cool>
Subject: Re: (subset) [PATCH 0/3] SC7180 MDSS core reset
Date: Mon, 23 Mar 2026 22:42:03 -0500
Message-ID: <177432372681.35532.4067644601908843019.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 20 Jan 2026 12:19:24 +0100, Konrad Dybcio wrote:
> Add the missing reset for the display subsystem and wire it up, so that
> drivers can consume it.
> 
> Compile-tested only.
> 
> 

Applied, thanks!

[2/3] clk: qcom: dispcc-sc7180: Add missing MDSS resets
      commit: b0bc6011c5499bdfddd0390262bfa13dce1eff74

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
