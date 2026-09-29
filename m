Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D677E3EC699;
	Tue, 29 Sep 2026 03:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651749; cv=none; b=J6rwJ1T5jzqP+iicoPwiXgKKDzHcqnm3GKoOW1wUsoR9FViG9D8KpjpRYDrEIIjTeI1uHqwBMCqbRYDFdlPkFgXaeftwcqB90tZL0G/Zx2+inZbO7O+Gr+o0zGqRqpTZzYTo4FSml/noaWoHE8QR344xk3Bwz3EFbokuJEpu5Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651749; c=relaxed/simple;
	bh=tTbvf8KIo+xWqJv+acsiJgplV+02uttXLJIYkji03Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OYpCyTdt6K0akyYBe8i6o2v+bobZH9SoBbMcdiwJS4nrCVklvxrC7TWdCn+R+zs/6q5qbSK+KStxTlaFI0BkA5pmJVUO7+Kc4uH8bJD/da5THW+3qnR5bCgrTrd6/BjLRLzdV6mmiZYvGM9q+dChRl39zKJQHVPc57mnZgmXrMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PFq0wjWy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PFq0wjWy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0F91F00898;
	Tue, 29 Sep 2026 03:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790651743;
	bh=3c0pWDYbnRyeZ7VG+SamrUMMa6QD6BS4IAEifX+fcfE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PFq0wjWyl2W/u99pTvHkMwQkj3g1LicGEiUprowPNbF1buxlXDM69mIwqxRRI1RU1
	 Yx6oC2E1QNTHhGNg1IxFvoxdX/4ioumFamXovhY436ARHzcQg5IJZJYII+aw0KqkPO
	 +1gE+m+byfkQuVZHb6tFKzuRwjTP6hXwKYclfTdF+O0/jPreos/7fb36ljkjWtO0sd
	 llBTp6lf5Od6aN4DDvSwq91gOMk3DDkbw9EP32Gky3Q4FDCHuWYl+TL4DguJgW50Bu
	 Eij1QAVA6LZsovTUP1F74vvkcY6b7+fKW6U7JsvJBLBZQAvt2OMTB0BgROabiaklQm
	 PCX2XMPGB7B2A==
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
Date: Mon, 28 Sep 2026 22:14:42 -0500
Message-ID: <179065170986.2673486.16966268784735038404.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
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

[4/4] arm64: dts: qcom: msm8939-asus-z00t: add Venus
      commit: bb92958ea1012d8fdee55fa9254e420b8fb1b6f8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
