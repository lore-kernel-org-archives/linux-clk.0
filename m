Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B427F4E80B0;
	Fri, 25 Sep 2026 16:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354660; cv=none; b=W5InIyyj0J+eQ8Ai+4K+0u6AgeGBRdJHjmA8RAuxLOlM55kYamH12F9RwcUIFB4i+2A+AGFUDrA+UPRVv9RypulbpDrtGDHy4soh22fNwWjOGxQwqWAmSSic0h9YT3PDR2FaHrb8K7J7sySFR6x4XqdM6LuBQC4X2Z1DIH/YfLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354660; c=relaxed/simple;
	bh=HTEgvhv3CABgcVZF8tgAlyx+/ENUgaMlZWP4unNfYyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DVhl0e5VABouHVLdGGkFKM1kCCOyhcFeTgHSsXE4ErmIAzyvroN5K6Tqz7R26oXQH+UH8IIHSsvW13pPpUvoqpLqwVsVB6STWnTf2XZmLN4X6jM79ulc4SNvCROLU1qHob0Dh1/WJ1YPBPMu5v2Hlw40JyU01HSGIkXPNKT1jIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AlGR6jIm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AlGR6jIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91F1F1F0089E;
	Fri, 25 Sep 2026 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354644;
	bh=qkdcdQQ6KPtrx7gEdkbjHsPLxkJ3KBwNcE5t97XNpSQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=AlGR6jImCWsq9+P71+8OkGkidlCxG+9O5BJrn9cAvibQlCUGhTurcMvMD9G5petu3
	 PFPyqZwKT2gbDot1P4WzCpBvnfxwTXL8PitrYns98jMEl5db2EwTb2lm+QoxWRjgbY
	 cxpca+lRZq0JamJoJswi8bzxCOy9+bsxyXh3FRp3VK/L94wavxzZ8eACZFg7WTY4Pw
	 n+4pL2FozMpDoFYP/hyq/exnAGX7m2vaA/C2rmjlMAiR94Se3eraFFj/fxBijVeg8o
	 1YMeCtA3hJQ8JA4z07pyltzmDIbNqvLOTc5/PshaogvjXjOzHuSusqckSi4OnZ3nup
	 7K+l9REZFmULg==
From: Bjorn Andersson <andersson@kernel.org>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
Date: Fri, 25 Sep 2026 11:43:32 -0500
Message-ID: <179035461227.1296652.17107293800728170798.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
References: <20260901035322.654-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Sep 2026 11:53:20 +0800, Shawn Guo wrote:
> The series adds the missing secondary QUSB2 PHY reset to negcc-nord
> clock driver, so that usb_1_hsphy can be enabled properly on Nord
> platform.
> 
> Bartosz Golaszewski (2):
>   dt-bindings: clock: qcom: nord-negcc: Add the secondary QUSB2 PHY
>     reset
>   clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
> 
> [...]

Applied, thanks!

[2/2] clk: qcom: negcc-nord: Add the secondary QUSB2 PHY reset
      commit: 03445cb3e60340ac8215db9a59daff97d63a5ba9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
