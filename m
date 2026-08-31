Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74E63905E4;
	Mon, 31 Aug 2026 20:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788207699; cv=none; b=XmOHpBeQ66JOSUNKww/QE4rDBSVYue0T94oDnYKvDwyCZAs/ZDqgcdYL6CEs1SxEdnbMfKzlNCisva0LG5YKYjcu5huzFUUYMajrilWZL1YRIYyICne2RsSKKiO2NagzAlOvhvOQVvXrYlnJpuJdh90r3ktDSqxxc3gMhYRP3Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788207699; c=relaxed/simple;
	bh=vr1kqL1TEFI1on0Ikx/IuHrYthx9f7+xJny4qggoHRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cZlsuAwfJubERfCkLSuXClq6N5ND6J2Kdl23bxd1KKXE3dHkC1r6S9plXhSDX+Cs+o4XD9w5RM4pGB1AJMyeNieFV8Y+RXRY1Ub8RQIwsJlUM12xuvo/CQLCXsejzrRSMEVWD4ynPfuY7R8Yc+bY9FpRJO0jC/zyMgA83Zt4wiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFK0IaQY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFK0IaQY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D89F1F00A3E;
	Mon, 31 Aug 2026 20:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788207698;
	bh=HmFOFJRAYiguX2bos9KzIUtpfkRtF/4p9UxbVPtEKJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WFK0IaQYUL6RXDubUH6FUma6Fw3THKcqqdJOmYAZIu/O2Um4dcaCX2EFF77GMNSXf
	 isi4uuqU524bTrdB5PU24qMlHgWT0DSzzXXNh4oQ5gsNY7KeCXLUgWEZ4Lz28+gOOZ
	 Mf4RVE0OFzo4x1Q1awruBqOzRMAd63LZ8+Uf5bPcwuSwXIqZVROtEVmW2dJaG7UsBb
	 07SVurrs2u1PqCV8au7nVXid8sc5Bu4V0Zyj0i9GsAR61Jr+tNDS+EjYCYAEHpl7rK
	 cFPX6Ue4e1NfvrKz4qx0Ip0oofbaabD2mbIIYt9Qowbk4LyqY9+JjDovCknFF5byHT
	 wPaij2TSbAA3w==
From: Bjorn Andersson <andersson@kernel.org>
To: Bryan O'Donoghue <bod@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>
Cc: Erikas Bitovtas <xerikasxx@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: (subset) [PATCH v10 0/4] media: qcom: venus: add MSM8939 support
Date: Mon, 31 Aug 2026 15:21:16 -0500
Message-ID: <178820768670.1699313.14447759944753965374.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
References: <20260731-msm8939-venus-rfc-v10-0-9ac503250fc7@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 31 Jul 2026 22:08:19 +0200, André Apitzsch wrote:
> This patch series adds support for Venus on MSM8939. It is mostly
> similar to MSM8916 Venus, except it needs two additional cores to be
> powered on before it can start decoding.
> 
> As per Dmitry's request, I am attaching Fluster results and
> v4l2-compliance output. Fluster results were very inconsistent and
> caused power collapse fails.
> H.264: https://pastebin.com/C15qeq5W
> H.265 (HEVC): https://pastebin.com/WDsnxvuk
> VP8: https://pastebin.com/egAgEm15
> v4l2-compliance: https://pastebin.com/VpBhEFc1
> Power collapse fail log: https://pastebin.com/rTivMcpK
> 
> [...]

Applied, thanks!

[1/4] clk: qcom: gcc-msm8939: mark Venus core GDSCs as hardware controlled
      commit: 7bc58e0aca2ac92967c265af67d3adc11d61ff6a

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
