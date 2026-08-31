Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C453909A9;
	Mon, 31 Aug 2026 20:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207700; cv=none; b=sXm6QU85vK7BmoVrHd4ctUMULtQfxo+T7/5OORtIoS/8LBrpS1KyzPjPrDb58IdwFYrJIuH95vvU9SbAVcJPA2iEaq7P5Sv6GyT6uog5Urlr/9PSXSnt/j67q4JhJhx2OPU7/CUsnaklLNsNNTM0jSILMP1GQ540/1xwD/YJEeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207700; c=relaxed/simple;
	bh=cBWk4otnye8lseCxjHqxNulN/gktNmCfLgu7wOmhal0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxXeak/Zb5738fwvtC6PXTUO5WTFQ2pVzEN8wwtFH/HwXqVTOyzS/7A63tR6fJr48M7qVQupBjDhVp/hpjK/mdEFTDQzOnvxERpkh8T7MgoGeXJ6xUH0W6kotLhW1T0sgwNUbZdhzXDslTnX4H7oJJoUkpUsNY4SAu7l3VZ3uDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iN0lSxCi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN0lSxCi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4071F01559;
	Mon, 31 Aug 2026 20:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207699;
	bh=gofPZ54GoW5FgyQjBSXkv70fyxiRppdlIONHv3An1ZM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iN0lSxCiP2wX9zulOEia0nLG+j3UQEm5TVlJQYJZtoTeDhY9odhgL0j9UQ2iYdFdk
	 qqS+Ob0Oqr10AULVioQ4KytCv3pX7TXl3UTs9aKU+fuWRkHM6oDtraCGDk1i6hcnJu
	 s5ZDb0nA6siZv0MVlbof1SZ2j5mb51qE1zP+3vI6o+YPeRMDFRlRp31lWt3kJ5PSb0
	 3YahlqrgzjJKLr05lti27tEtiWNDF6iT4t986sNhQeVnVtY7B9PLPVYEYmN5/Bpn2c
	 IuJhLEcSON8+Mq9BRLlm6XVTBaUHLlaePK+XYm9ODC9gy1k4kb6SG71qPI/8FuS+mW
	 QH+M4T//ilwuA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Imran Shaik <imran.shaik@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks
Date: Mon, 31 Aug 2026 15:21:17 -0500
Message-ID: <178820768664.1699313.10338261708273261456.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
References: <20260805-qcs8300-tsc-clks-v1-0-e7a5101ed479@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 05 Aug 2026 22:17:12 +0530, Imran Shaik wrote:
> This series adds support for the GCC TSCSS clocks required for the
> Timestamp Counter Subsystem (TSCSS) hardware functionality on Qualcomm
> QCS8300 SoC.
> 
> 

Applied, thanks!

[2/2] clk: qcom: gcc-qcs8300: Add support for TSCSS clocks and resets
      commit: c5d93fd3aac735fa643f5e1117bd34990d91b755

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
