Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794988413;
	b=P+wgYKG5ogxQM50n4rEYGS44VDz5BSN8migOOS9stDUxXmmOcUvafpYXsY88TDDMjzY2
	 tpaUETrrHT4DhszlN0D2p1VdFTT/i9Qv2gTQhefk/Fpt49F9Qn2BJ6q3Sy2i3vlq9jceX
	 xNwatcpHriEAY7uuf3yq7ZsxgvUBRhtuarZkV+xRbEdybJMdM0dhRKQCWl7O5i5p16b4e
	 ar7iT9EcojHdkM27X6aNvcKvYtsAzTzYgDNpgbu9Lv4hhqI83Czzb0vmPKZwW7kMyqmJ/
	 yBjNLbp5II5sWgn9FKE5X7ZN7MY2zl0lecshHiwnsWhWEMtiyMeMHwBw8EKzFP2bXOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794988413;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2Ncz86jXOJFJCGcSH3J6ZEsRklddBnnYpXTmonyOUMU=;
	b=yJ1H7clrsNTD1lDflTX1cRTaiwhz8QQV4QfOokq4lpsaFP/ZNg5q8BtpJ4QSZNeDymEX
	 aP5UfaXLT3Ewq6DgbzpWAXVm1XprZ8tUD5ynGF2MZfKQjz7MfZlrh03pnKaTj0iLnoaxB
	 An2UFpAiB0zIvtxVNQydI1pjAKCpQPBWCbf5VWC0hbFWrSKMIN+KNouKveRcexOH3oS8U
	 1343i+wDTWszMD0RehhRZ7z6bGduEWmpWDBW1+GKjwhaFewLggm6xwjR91jCUUBRhktzh
	 QI6l97x+6ncUnKc+pWyUUXI7rwR295KZfxrXeMBV3TPJFtOo0ErJ+xB0Km0uOlZNx+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuvHfogg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AA6606A31C;
	Wed, 18 Nov 2026 07:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LuvHfogg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE241F000C4;
	Wed, 18 Nov 2026 07:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794988413;
	bh=2Ncz86jXOJFJCGcSH3J6ZEsRklddBnnYpXTmonyOUMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LuvHfoggLcKxiJt7s76UfdAwUXvv1U4+7uT4uG8gUc+KZoJzZb46cvdbkSb23GCKL
	 h+jnrL/G5B/pLZFpxak10GYIFND54kVbxK+E0mo5+0eM416NgGcNUUM7o/FZcDgzBd
	 Vrkgk+NhawwAvV3Pv6uOaYDOFIpPoxAsi6nCC75vkqmrJM+43/Jo/7iDQTo8jd1yuT
	 51fWl1JRfZBOTA4FkcjWHU6VnTpFcY4sDihZAZ5dUQ/QbI0Tl5ume5+D90fmdrNArK
	 tzNeLYixUAqxGlwwreQ1g3HZc37C3uZLkq1jMqIp1oGzapPmlySjowstoyQyf1Wd27
	 XGYUWY5Xd8rFQ==
Message-ID: <sashiko-outbox-220374@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] clk: qcom: camcc-eliza: Declare icc path dependency
 for TITAN_TOP_GDSC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wenmeng Liu" <wenmeng.liu@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
References: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
 <20261118-camcc-fix-v1-2-279d269e343b@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 07:53:32 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: qcom: camcc-eliza: missing Fixes trailer for TITAN_TOP_GDSC
  icc fix
--

commit c65859d436b87a36e0406115c287548cdbaf30c1
Author: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

> clk: qcom: camcc-eliza: Declare icc path dependency for TITAN_TOP_GDSC
>
> The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left
> without any client vote while TITAN_TOP is still on, MMNOC attempts a
> power collapse while camnoc may still be active (QACTIVE high). The
> power collapse then gets stuck, and so does the MMNOC BCM, so any later
> bandwidth request through it times out in RPMh:
>
>   Error sending AMC RPMH requests (-110)
>
> Declare the interconnect path for TITAN_TOP_GDSC, so that MMNOC is kept
> voted for as long as the GDSC is on.
>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

[Severity: Low]
This fixes an MMNOC power-collapse hang and RPMh timeout when
cam_cc_titan_top_gdsc is enabled. Should it include:

  Fixes: 115631176f8a ("clk: qcom: camcc: Add support for camera clock cont=
roller for Eliza")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118-camcc-fix-=
v1-0-279d269e343b@oss.qualcomm.com?part=3D2
