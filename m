Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4452C08AB;
	Thu, 14 May 2026 06:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778740407; cv=none; b=Jv8O1xWMEMjhzo1mzRDdsNT3ODGVm5xxhAq0sFPQKzAthM3ZWquo+UdAofzIO+qG/CDPmAOO8iqo7XdR3RocZ2vsbUcuAfeB2/xitiOkV2YqomNBXNDpYtx0jUkBWCGJMa+TvMsjWua8RQFREeQgF34P4YJk75kvZ7Sk6FAdKu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778740407; c=relaxed/simple;
	bh=6I1pLIu5ZO9By01XD+8EXsPwxjZxNWD9DIOmV6OTciU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0g2aFsIuKuxNZ83N0M7oVda0H2s49PwFgHhJVQgk7BDFbCk7jmvrGv+2pQEXhHz7K1d4TtJjRZIzfaLKRqu6f+qbDu9QXI53MiZWvu/Sr6EhNZQqZ16prwXIoKKoDWLp/Y6x1xxgM3cgmJ/9cUa6mlecRMdTHdgrZ9dh1nFVq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wv2Dhm68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wv2Dhm68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD04C2BCB7;
	Thu, 14 May 2026 06:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778740407;
	bh=6I1pLIu5ZO9By01XD+8EXsPwxjZxNWD9DIOmV6OTciU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wv2Dhm68cjTFur1oXruLEabXIRCw/Il7XKh6KSx0j2c+1rUklhQjqWXqcsRYLtvQH
	 9JeZzQRBWuMwdor4b4aQ2knFvij1G1hb36ByKpftOtYZePpvMVVIiArwQPJhV+0Voy
	 OHjrFJtQ/dftSGNYLz/1WObfQsE4UIVlt+3V7tzh5tjbFGl3viIar/I5U0vX2ZDU4G
	 ZPNdkgz0+UKdqPk3mDqPYPYsZaJu1U6E0BDY+dkiQtfPceQ1WJYOXSuQzaMWxHOEmx
	 qyDvnSMfYoJ+A0VdSXUWNIKECU7ZGvMLzdvgRZsmKnTc+8/Y5I+M5Tu8s/LEmQkVho
	 sF9kIUaIxXBxg==
Date: Thu, 14 May 2026 08:33:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Erikas Bitovtas <xerikasxx@gmail.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>, Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 1/8] media: dt-bindings: venus: Add qcom,msm8939 schema
Message-ID: <20260514-economic-logical-bittern-25a5b5@quoll>
References: <20260514-msm8939-venus-rfc-v7-0-33c6c6fb9285@gmail.com>
 <20260514-msm8939-venus-rfc-v7-1-33c6c6fb9285@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260514-msm8939-venus-rfc-v7-1-33c6c6fb9285@gmail.com>

On Thu, May 14, 2026 at 12:24:30AM +0300, Erikas Bitovtas wrote:
> From: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
>=20
> Add a schema description for the Venus video decoder/encoder IP in
> MSM8939.
>=20
> Signed-off-by: Andr=C3=A9 Apitzsch <git@apitzsch.eu>
> Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
>  .../bindings/media/qcom,msm8939-venus.yaml         | 79 ++++++++++++++++=
++++++
>  1 file changed, 79 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

