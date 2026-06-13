Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831E030D3FE;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781391348; cv=none; b=kqBcgTMX3u/IXzOUOqCAjo3rQf5zpDM1hYGGrGtwbaEnqvJQHNBpNxwDE2Y/VrX629QH2UjrWsB5uI7gY93PrjwpusLJwQdlcIGoG477NUGB0CmOx94WQtMIDU+bZLZljaWe4hx1OHBjFDCmWn1ufjwjw7JVdUHeFpL3X1L0qd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781391348; c=relaxed/simple;
	bh=waFcLfIWDrFtfyHeoFg4ES5dRKtg1IRhVdKp4lqp/rw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=lqSPR3LyHy4JnGn8udmZGx8zq+iag6Bk1mo/DohEdTNq8k5PU7HRZKeUfDydFVbyPkN64a54Jv1S3+ePSHnn/OxqlC9pOp0B0+AIbdzLERuCUJM/B3vnSm4dJ3NwAH6rWs7RDi7MZIis4WCU9a+N8DIvDq2F2gadgYwI8KKKDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bsnum7D3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bsnum7D3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9EF1F000E9;
	Sat, 13 Jun 2026 22:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781391347;
	bh=8Y9czviEfUCs9RDuFGMQRHETjuWFS4198YhyV0ORENA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Bsnum7D3HeZqfpgRMb8xikPmhEOVSat1u5u8opBITtAkcWMVEgAmbJgdLsHq7gm/C
	 GMVOCc5iOJ6jFCJ7qv6zS6rEHeEJJMBqQXPdLKlFkZhXqtLzOA9hb6tn+b2pCeQUTi
	 PoWfjMhuLVnSnUpiLtLeZdPmJViT3Xm8rGx75r7X/5sr6vfkFtZODbd+V7/PtWoLX1
	 9/A1dWuhmiU/ECglT3EBs8OaVluvPzgEm8l/S8tftU/3QONSn3R4M02BSDxEmHKK+a
	 oS32GjUUZvLkNKg+F/UN96HtdmmCZxRB8GapW3jY9txi+akDib6yVC47zCGqe28M7z
	 bXhuA4iwzrpWg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260612224825.852551-1-andersson@kernel.org>
References: <20260612224825.852551-1-andersson@kernel.org>
Subject: Re: [GIT PULL] Qualcomm clock updates for v7.2
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, Luca Weiss <luca.weiss@fairphone.com>, Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Luo Jie <jie.luo@oss.qualcomm.com>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, Alexander Koskovich <akoskovich@pm.me>, Biswapriyo Nath <nathbappai@gmail.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Phillip Varney <pbvarney@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org
Date: Sat, 13 Jun 2026 15:55:45 -0700
Message-ID: <178139134534.819343.861205819784064327@lazor>
User-Agent: alot/0.12

Quoting Bjorn Andersson (2026-06-12 15:48:25)
>=20
> The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e7=
31:
>=20
>   Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qco=
m-clk-for-7.2
>=20
> for you to fetch changes up to e108373c54fbc844b7f541c6fd7ecb31772afd3c:
>=20
>   clk: qcom: regmap-phy-mux: Rework the implementation (2026-06-08 09:17:=
24 -0500)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
