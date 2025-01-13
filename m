Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CDE146A66;
	Mon, 13 Jan 2025 21:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804147; cv=none; b=bubsFI0HdGRCO5yhkkQ46bp+T7fC88eIA7cJF15pZrPL31CTKAPDGv7MgLb//9Q4WB43uU2X9OcdmsXNpeial3i3idmSuuws3vw5fsQXFmSiCLWixeCOkpdgl+RTXwhH96w5S0xDO6u6+CSKDsKj2w2L3+PXQPwsrCONH66SjUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804147; c=relaxed/simple;
	bh=pYAffOgh76GdHhLGQC4MQlGBbfwNSMrw2x9hyVvs8vo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nSzW/JvRLYcrK5mMzG+C+ermcTjClNX4ygMYLwgDbSm3IWf36ko2OU3ueK5ZQ9kP/Sr7yCLnU/v1wxSHjXy8BNj5iiJvPU+RkXnzN7vnnX1wfsl+8I177IVO1WQydYRp28ICvg0mnF5hJIUkRzX4IBWxdfToYT+rKF4lfvBdytk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bBGhKjwz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bBGhKjwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5AEC4CED6;
	Mon, 13 Jan 2025 21:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804147;
	bh=pYAffOgh76GdHhLGQC4MQlGBbfwNSMrw2x9hyVvs8vo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=bBGhKjwzXIFbDsSv3gMqZPbY6pWgqCUpnefd0LYVCv+X8NPzlEyErd6DDxFYWJ2js
	 3Na3Qn4WGgyeB6XGbKJDcQEV+zyzL43XoTh5rr2+SnbwQHsvXpntlYnOp3Y67TiWsS
	 H8to79bEmtco2yi3QQvnZTxLl3JhMz1EFJw0fIZu7giYCvWVc3ZLvBBGfW161KzE5A
	 chTF7dR8l4qpq+AqHq4dr82CHRys5c6c1F/byknFKdKMK9fH75sX805tZ/DjdT8v9F
	 WBe9mCB6KJPwGNSJDJB5QapLHCHzWaPOx4bfcWjle9FGnMic0sGxNWGEkePOJTdnu5
	 p2Y/JsGJ7zvYQ==
Message-ID: <4d504790a2f59facd09227672659d1ce.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250108093636.265033-1-sergio.paracuellos@gmail.com>
References: <20250108093636.265033-1-sergio.paracuellos@gmail.com>
Subject: Re: [PATCH] clk: ralink: mtmips: remove duplicated 'xtal' clock for Ralink SoC RT3883
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-kernel@vger.kernel.org, yangshiji66@outlook.com
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-clk@vger.kernel.org
Date: Mon, 13 Jan 2025 13:35:44 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Sergio Paracuellos (2025-01-08 01:36:36)
> Ralink SoC RT3883 has already 'xtal' defined as a base clock so there is =
no
> need to redefine it again in fixed clocks section. Hence, remove the dupl=
icate
> one from there.
>=20
> Fixes: d34db686a3d7 ("clk: ralink: mtmips: fix clocks probe order in olde=
st ralink SoCs")
> Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> ---

Applied to clk-next
