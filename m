Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED5C3D3D0C;
	Tue,  1 Sep 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228601; cv=none; b=WF8Ehli3cKijSiczj/9uPgw5Pu80a3oBxRbAMYPf8NwLsQR0OHGgN5pRbUUbrJEhC5ro/LCLBkXkGqNUYESyqE0anQOyI9CX5lsCZms9xU6UmCiYThMCi5pE1L10QRF/nn6KO++DQqJDo5vZxcetmKFr4W0hlnNa4BkOz4S8ZRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228601; c=relaxed/simple;
	bh=wVbLN2D4jHCRlejLKUvBvlZ1pZLGpnuuGIGMhz3ei8A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0jZKkV6tFHnDRyKAgHcfIrcUgD4X5xamY2TuQ/HQa+Z5R6HO+HObTDvB+csA4uFAFPVVR5cr6YwxkB5P6w7Dcp7bGXeriFPRrypRUiir8vuwDLVEKUaNvw5kibe9fVomDvaxtvB4e/pKK3WgtlE1C8ZYzTvBs8gNt/Ki+pJvGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lsyDL09E; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lsyDL09E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970901F00ADB;
	Tue,  1 Sep 2026 02:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788228588;
	bh=1tfL03b0H6Bzca1n3w8rS5amCqzBzB/d7YtRljxtteU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lsyDL09EA0/rbOaXK5E5O4HIHl0Ac065OO/1ILXI/C0QMIE9ZMPjmFa5ZzAqnxU13
	 pVfRI+xEmu4ZJUQov9WfAUN/hdb3hoBkOJZ9AziVHtgQCtEfJdJlXwwpHI0onmG8Hn
	 Wjtp/XAQRILl6QPbK2Zi5C7JgaypWMnZ/kqHh559fF6Es5I2+7YcLnnA33m+yd1iKq
	 PSdwUXJDwyaHkIuYodj2jQawR7SL1lym1/e7yPB/moxBrcr+BbZsNAZStccn4ZydkC
	 TyCLRn0f7QnWdG6nwhb5Zy15wQvbfWy7cOCbG03idYqqeFkzAjTH7bCoWp5MRZmNwd
	 FG5oM0cyfCAow==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Danila Tikhonov <danila@mainlining.org>,
	David Wronek <davidwronek@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
Date: Mon, 31 Aug 2026 21:09:24 -0500
Message-ID: <178822856272.1835959.1992609658937634640.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260817082457.64797-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 17 Aug 2026 10:24:58 +0200, Krzysztof Kozlowski wrote:
> Bindings for Qualcomm SM7150 and SM6375 GCC clock controllers are
> identical, so this could be one file for less handling and encouraging
> future grouping of similar devices (like SM7250 which also would fit here).
> 
> 

Applied, thanks!

[1/1] dt-bindings: clock: qcom,sm6375-gcc: Merge SM7150 into SM6375
      commit: 0e094dd19e04348183dd3e35d4f66290098a21b6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
