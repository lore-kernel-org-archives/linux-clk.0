Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCEC1320CBE;
	Fri, 31 Jul 2026 03:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785468279; cv=none; b=kNkqRMxkNeXbo2vrEylewFjlwx+sioa5OgVgkGOm1kiBMGyI+tez7czVx60YMWysKfnRSTQp5XpiuttER/nfZkdpaHbXL0K9PhRpL8q/GHGUHWc3dTJuQWkDhk6HEWpPhpsOKetnIw9Llhzh7RogUjjkKnwfo5RD3fs1jmdguQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785468279; c=relaxed/simple;
	bh=GRgCubQQLWfwBImd2ln6Xr9hUZZbJ6e+gNIEsmJeYgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAg3BNwqtNClB1FbSgfMb+RbcCN5DXbXFZOdGrmJUozmFCDUQUJkFEqzFYXs0V6KnTIm2ZSZVoxPv6SVxxv0kI7JNqQ6lXbPPiPihOkELlFIfSwVpYZGD9C4A2sRppAo1pmhm9mmlNynijpnUcFQmYktLSLI1UoRw8YpextuWF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Co+ALJHs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Co+ALJHs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04BDD1F000E9;
	Fri, 31 Jul 2026 03:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785468278;
	bh=Sc1a3lTQJmFYMeE+tHTmWfJpXSNBQv0m++EFfDinOmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Co+ALJHsH2hB7JcqY6XK5bVxkFNRiu70GPPGBRNeJKWXtgksj1/qVl9qtuw5Zoojh
	 RwFGkdcHEMAMFJes9JxvELhog9zxfVe3F2Fw2TXD46BA17OaWOSZRocid4Vl0X60NC
	 Dyz1r24xrsrxY0HjfXOyJFhMq8V0zFVGYxA+Wt1KZU2w5Hrua9Br8TWyvXp7/FvRUG
	 UL63MP7a2v6QbkqG5ktTjCoxvtBILc63mH+9aHO0pzyB0KMoDk29EG91ahJ5GzxjHy
	 U/2m06esIiP/e7eICNzEiaMfJskpzxpQK8QW+ASF2xe0O3K1lgXYlYtbeTjxbbObvs
	 k4xfZJU+6ChqA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Douglas Anderson <dianders@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration
Date: Thu, 30 Jul 2026 22:24:11 -0500
Message-ID: <178546826809.316815.11776200282339144387.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260722-agatti-no-park-v1-1-31ae3a4774e5@oss.qualcomm.com>
References: <20260722-agatti-no-park-v1-1-31ae3a4774e5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 22 Jul 2026 15:46:08 +0300, Dmitry Baryshkov wrote:
> The gcc_qupv3_wrap0_s[0-5]_clk_src RCGs feed the QUP serial engines
> (UART/I2C/SPI). Since shared RCGs are parked to XO at registration time,
> binding the gcc-qcm2290 driver reprograms these clocks away from the
> rate configured by the bootloader. For the UART used as the boot console
> this drops early console output until the serial driver later
> reconfigures the clock.
> 
> [...]

Applied, thanks!

[1/1] clk: qcom: gcc-qcm2290: don't park QUP RCGs upon registration
      commit: 9c4cee964e0ccc155e4ab8fa6cec88fffc262c63

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
