Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B442835677B;
	Mon,  3 Aug 2026 03:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785727458; cv=none; b=o9HpbgdiC26Yh4BpU0iCG/9si6ySaAIeuVjF02504Lz5RiUfNyKc9ISrZ6DQKGjqeBJ6Gw7diJAcmEKADHmo7rRAVxK1V7p0ojOpzQyAgCUhz35IxzSwVRIbpRilWLbmx3Dr3Av+yI6As/JCbhxzGBLlPM0mc+7iCAje8BTW8yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785727458; c=relaxed/simple;
	bh=xWL5vTe7VZOOqrsSjXcaTuejLB0Pghxdmgq6X5qd/hU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d/ObmyZLxyRJ9WBWdKjTsIFqwTsyvpOGHnznMoxARWm50EYEHZbWUnOH/d2x1cCn7pOjaJNVnjnsfErd6y/Ze4BtmndyyXlU50sN3qU2WmCtNLSxtSXrOETqlJ6qUNN2a+KgmVXWJdqPwl4ExXZIPr/ASoLFhg37YT44VuPqous=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HGa+nMMa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HGa+nMMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AD991F00A3A;
	Mon,  3 Aug 2026 03:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785727457;
	bh=YMWfWPBw/b09AHI1VnKG2+ZwI0X/zY4s2/BBKO5mfp8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HGa+nMMaHj4k4GyDwMezmAXexiVS/B7ibxNM2ozg0UzYTaSn/oHcQMXR8TdgXJT/L
	 Pp6mwiuaiUHQyM40ZiX0+dFGGBjh5X3awXSeBs/k3y1xT/mKyibODGPlwkjkNunz+0
	 RUYRtAOp0PS4xHMSqxpIKNBTd9NiB3v41SugisSGK+rX/Bhs07Te3ObC5GlTvM7cRb
	 e7nSHue25IFKJgeK9U4HQw4hNaXub/3SWpARLP2kpWLaAC4yyvPBZVAxhB1ZCxI02+
	 zkM1dWB/Vic5xMrADlObEPM0/lPkA/ccnbLabac6EuXz7YHL9Frr6aX/gM/yCzXily
	 6iPbfezpScvBw==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v4 0/3] clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
Date: Sun,  2 Aug 2026 22:23:56 -0500
Message-ID: <178572744550.408250.3489195431026489011.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 24 Jul 2026 22:45:31 +0530, Imran Shaik wrote:
> This series adds support for the Audio Core Clock Controller (AUDIOCORECC)
> and Audio Core CSR resets on Qualcomm Shikra SoC. The Audio Core Clocks and
> Resets support differs across Shikra variants based on Audio subsystem
> enablement as follows:
> 
> - CQM variant: The QAIF driver runs on HLOS, hence both clocks and resets
> are required to be supported on HLOS.
> - CQS variant: The QAIF driver runs on the Modem, and required clocks are
> handled on Modem, so from HLOS only resets are needed.
> - IQS variant: no soundwire codes, hence no clocks/resets are needed.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: qcom: Add Qualcomm Shikra AudioCoreCC and AudioCoreCSR
      commit: 6ef116708c63b6c4e5889c7682bf6f92efd30f3e
[2/3] clk: qcom: Add Audio Core clock controller support on Qualcomm Shikra SoC
      commit: 3e7b00804665c8d2e87faaf3ca8e170bc0246896

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
