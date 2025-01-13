Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C81C1AAA;
	Mon, 13 Jan 2025 21:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736803906; cv=none; b=lUxHDnX2U+Wl5vxVKWJx5tcUlSW0nCT0k/HQPSoZcHpkuy7iMx6uR+3DquPelRMXAPS/mZtTCr0yP0cAtDC8vmMCxBwXuD79c9amKYSSXXuGls41plsHXoTBKbMHU/mB/mI7zHsAhnhLQZEOKhd2TkHmQ9yAbRD85OiVDUJGWJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736803906; c=relaxed/simple;
	bh=kPkeS9WcgdQeiACvxxKzvRtWYy6ryBHKvu3EK7aqkTM=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Ek2oIWMlAKANZtWF7YfpMt8uoHgpSsjR8wFaaBQOOqghmcnA2GRD2Jv57WICVReun3NhhDlkCt/XsEHOOfy2Ks0Wersvn1xUB/6E2bEpq1PNAm8MD78CA6AMsv6TKRp5EDI++TNLPVmTwKYH5poajQQjAwjO4+VsYBpfuDaHkiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i2nAOcI9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i2nAOcI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68BE6C4CED6;
	Mon, 13 Jan 2025 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736803905;
	bh=kPkeS9WcgdQeiACvxxKzvRtWYy6ryBHKvu3EK7aqkTM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i2nAOcI9D3azDsDas2j69OjQQFYe6HKYRUV2/37snWgrFJrJnYwyuX/9/OaxiazAz
	 9AU9H2J49PaXw0JiySXaYq/g05E50LVNdq7igcrG7rZgRPwrAGSaxLuIXuTO/Jwgzj
	 WQSaw9k80FsQ5Hdxk1TbIcZTbPQYlkJ9KA16Y+EGtRGPCRFx9eWznLXP4t3nN0xGq1
	 V3diogDLAeLChZaw8NruIr5Stp29qrZcY4WSOvXpq7kKcBemtrlH3Tx6P4oIxL2/dW
	 9XIjAjfJQOZYBB885MTP6aQt3g4BnB17HrYNgAPjlN2+KGwb7oQvmF34EamjE3dFRt
	 qduAEuR9fAq7A==
Message-ID: <f2fd74933479e2eed512e688a6f9ff1a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112133953.10404-4-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-4-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 4/4] clk: en7523: Add clock for eMMC for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 13:31:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-12 05:39:40)
> Add clock for eMMC for EN7581. This is used to give info of the current
> eMMC source clock and to switch it from 200MHz or 150MHz.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next
