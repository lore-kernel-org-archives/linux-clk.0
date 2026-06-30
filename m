Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396625A642;
	Tue, 30 Jun 2026 01:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782781855; cv=none; b=XXKslIbZNNduEaZYDB3W280VaJXkd732Dsm9GZ2HY4T+EfKD8lcpcaw/5MCSp2fgbb8Zq2PbEszC9zNkCAOxy2AMkt3CtanZXmZxmXYhWTII306/wmhGMX9xLFFC9TayhGiAmNQ3Qkneh9Gdgvh+0OUM4kQ2zIHAPAN+z1v6h7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782781855; c=relaxed/simple;
	bh=ZtlgWJcxmYjsBghIu7wwqxiusdGtT+l9q7hpDdpmURE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P63z0q6BYC7eMsfZmo7aUE0mfk+vsym88qgRrjqw6Cq5CLARk7O5q1FC6VAsAtm8NE+29QIrb8abpi3UL2AkctRHy21ul/A5IvIKdDt8IYh42CWUgZTWU6ngGkiQINNi4cJZeii621BLpBdoNSLEtLfRiZcmZ2Z+hdcdKn0I+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBR8u1vG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBR8u1vG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D281F00A3F;
	Tue, 30 Jun 2026 01:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782781852;
	bh=piL7uN1ZN4RlJL7pkxygfd5s2i0wytlnszFqNwAYdvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fBR8u1vG/hhVoLDclrWJEZKZGurbJNv1CVj/sLHCVesVCBeOZbvXBws+yRsX6UsK2
	 nSKx8sPmIqtNT90icN6N6EdMltg08yeGPGzMPTtOHDJTJ3MZAuH2lnqjxLmc9y44E9
	 DUEFA/OB1125HkQM/G3ilJ2q90ApuRX2DYIaMyTICrwe+csfTomo8xCbysn/kgV5EB
	 0Q6Ll2XrHTzG9npOsdry/TKbv7owlUdEAqMm3BpMQL5xnxlsLeXNbsOpI8iQ2ieHup
	 GOc6REQn/GW47j1gtfZYvGbjHFwcLnwFwdt317sTKEExYbMZNJ1b0HsZAMSHi6aX7B
	 yLC6Zp0EKOTMw==
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Yixun Lan <dlan@kernel.org>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junzhong Pan <panjunzhong@linux.spacemit.com>
Subject: Re: (subset) [PATCH 0/2] spacemit: fix USB2 clock and reset
Date: Tue, 30 Jun 2026 01:10:44 +0000
Message-ID: <178278137140.759782.6011015469413398398.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
References: <20260518-06-clk-reset-usb-fix-v1-0-14fc235e692b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 18 May 2026 02:58:35 +0000, Yixun Lan wrote:
> In current code (v7.1-rc1), the register bit of bus clock and ahb reset
> for USB2 were wrongly swapped, but this didn't cause any problem, because
> from setting the register bits perspective, the de-assert reset operation
> is effectly equivalent to enabling the clock bit, both of them will set
> value 1.
> 
> This issue was found during suspend/resume test with vendor's internal
> kernel.
> 
> [...]

Applied, thanks! Queue at for-clk-fixes-v7.2 branch

[1/2] clk: spacemit: k3: fix USB2 bus clock
      https://github.com/spacemit-com/linux/commit/51ed53630915c9cc290036fe4f430849e23bbf8e

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
