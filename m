Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793583503;
	b=3oW0/gFdZLzJoqubCRa+SGFAirdH/7Hnzg+k45RF9pZLYPfe8Jr4wqrabNfBc7DswkQ7
	 yYGGlAYEy38Cl2wD8x5NDQvEx//INKKvbwZzdtDm+66T1YeGKTDCm9CgF92Ux2qgxLVdM
	 D3+oW0sUA1J0fO2+uh5FfGof+WaOCMKC3pKO2P1kUrSMi5EdrLt2rP57CJvkMWBL7z2eT
	 LPaS7D3vysYqwg7GmhQpv7v2gU75GUth4bLk4yvzA/B/CD+5PPjm1da21LW9Bpp0AXvFE
	 512DMuy0v1kCCq2pEBD+0MD4ktdkSQQJr4c1KYgpzXatuUV8AiHv+WmoY3rY/2PEcOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793583503;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ejtmm5eyowRk0NJhpHMP+57gHs3U6lwOV1L3TPVgTHs=;
	b=yrk1ISN/Qd5sm8xJICV9rKWJNVwjAVwusIBQxOML4B1FAtGSMxxq8jfsU2NyycKesJyU
	 rRGF3BfnOueBgfomgB6IS0SoldA2Kn5Hq7Vud7uFd+xRm06T2Fz8tQ9Iarvi0C75EiF1P
	 bHwbn6cD61nYJc/bSPWEMXfIDHYzVvwOKmW+e/rhGcBmWgEemk1sME5Xg9ts4LWLKUPbe
	 45FRX1Mhtc2guzALDdUJ28IFRgY8nA7gJ5QTBkiG6kwRtfjrYzYFnPr1L5uFIJpeFyj4b
	 Svyzm1I3i+THz2eV5ElnnuWrzF5DSgcjNctJ9obXuCbh/J+qdP8Qf+HxrEaPUZlimfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2fYIna7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975EC606A324;
	Mon,  2 Nov 2026 01:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E2fYIna7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 669881F000C1;
	Mon,  2 Nov 2026 01:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793583503;
	bh=ejtmm5eyowRk0NJhpHMP+57gHs3U6lwOV1L3TPVgTHs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E2fYIna79grcBl77t8tbB69BarCPSZ0AfvOL3rasGPXT6c2tpL3XiHW9kcWMseWoF
	 qxb+4mZtGSUvOsHEUXr72/d7pQriUUA8p3+sZzZsQxQwe2LLCdJhTDEmm2PXcGK8fu
	 wwWczOApAKjg5R4RhtAeMPqrfMn+L8koM9KcQhCOr1XfbBZ71nuAMvoksT2mPmj8uU
	 XhJX1zNFUcew2314rl3PPZTbt8dynAewR0gBwiDwS8yYl/JuUXy5t8sRF2yfe73Sgt
	 obKGZO0tHQUe1E978FICJ80vXaN/GJMhE/L36fPYE8cZp0ZXNEQj66AnzGj7CxTRgR
	 o+dnZWj9CMZ+g==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Xincheng Ji <jixincheng@ultrarisc.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
In-Reply-To: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
References: <20261014-ultrarisc-clock-fix-v2-1-bd126723a42c@ultrarisc.com>
Subject: Re: [PATCH v2] clk: ultrarisc: Register DP1000 clock provider
 earlier
Message-Id: <179358348606.348312.17586087081637814068.b4-ty@b4>
Date: Sun, 01 Nov 2026 20:38:06 -0500
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-5d8fe
X-Developer-Signature: v=1; a=openpgp-sha256; l=310; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=r1K3qhN0mIVVuV+DzrLeagjKZ8Hb9d7AJVnd7Dg5PEc=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKev2xwOnh5vvC3M/tMuFRvrSkLM1ipe/vPquYtkm7x7
 MK/lGKOdpSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCR9d2MDKs/116as9HhS8+H
 Kwzvr3AnzTzaO+eh6FF9xkNxT73mP+1hZPi/5sYsjgmyErNb0n5lSjBdmPFIsb56klLmfU9xhyX
 7JTgB
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Wed, 14 Oct 2026 11:20:12 +0800, Xincheng Ji wrote:
> clk: ultrarisc: Register DP1000 clock provider earlier

Applied, thanks!

[1/1] clk: ultrarisc: Register DP1000 clock provider earlier
      https://git.kernel.org/clk/linux/c/a2d4a2d2479b

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

