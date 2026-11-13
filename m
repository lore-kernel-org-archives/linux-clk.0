Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794602890;
	b=Df4R19QR38W+CdEYEbvgzlG+MFoDpC4BGWMfhYDmKjLD9TWa9Y7MXqccxxCpwP1q1TRo
	 ecwBrs0DdaUKon1jBeacN/IyHVoyD1l8TqERe8FfmjIS8+/O2O1zO5KEw+HF53lpHdoNw
	 x5zJXzcFIX+3Foz2Nobb2tM8un7Z2USsb8cVgRmCePf72f30TApDBUWuGYr56hGXXAiEY
	 XczGABnlpvrg57E/2lVXHL2ESJ+DgjB028MOQA9DmD+OHYqeIbmLlRlsfQDU5t7TVeQxp
	 q0bmQlGzYblY0UXF66UDT7D+tmVPW47WSof0Fpe/cMK6hp3xfqevSTK81+usZDL4seg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794602890;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=4rrR21eVd9MDJDLbl767Z4gPcJodTxC/4ECrTIhhUY0=;
	b=uSpqJYlOkxRZNlMMy7HPYgsyjuJBGhO6Srfyzt4qfy49uYV82mX9Cq0zgYSX85dletMq
	 /w8HFzpu08FWzkfdvIAKQ/U+qf3jM2LecJrTp7Q20RAFrHfIhf3exVk/s40okbXHadx10
	 FW5tqpPgHzl96N6rcWiK8Dy/kAqMIMg4dEkOhNgQwBF2AljX68QE9Kn70w/iOKFkUkymZ
	 kSUMfUkNbMreFRzWLMBdTuHoLNyiaQoE+ED1c6CVumB59+/CW/Ptmmh8nx5nM7ERK1SYS
	 NvBeTENlQarM9WCzgC0HqefUb0AUOl4Sg+dLMVNKFKvc/P3HZGkEG+0YNKVlthhqRHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLn5fAo+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC03606A331;
	Fri, 13 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nLn5fAo+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 252061F000C5;
	Fri, 13 Nov 2026 20:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602890;
	bh=4rrR21eVd9MDJDLbl767Z4gPcJodTxC/4ECrTIhhUY0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nLn5fAo+VZEunWkRsRkeMZHc/RYC2cIr2i7ergs4c0cActC5esj7vXak6O4sVfAhA
	 rdZIuTFtSFdLiBIJ8fYOb9YFZVLkOhcTe0j9jukhvxp1j1ezWxvTC7kmGo2FA6oPN8
	 f+7tP3QGfnA1oG7mJxXu2PYZ30wsTp/T0UqU/uy/mAz9LF3Ht1/sQpAZQ8S+KpX8/Y
	 WKs5ES4PwK3EpbdX15+ZdwOjUWHE2roby2+Yk/NAiXPs8OvTt7j7SEWL61Z6mM1Bx2
	 ZJX2HQ+5jobTQxgcR1tlfoHFAR8VrZEOEePKT3id1WPTGiC4frIc10ApR31hP/nWn1
	 o8/DGVuZvXF7w==
From: Brian Masney <masneyb@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 John Crispin <john@phrozen.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, lei.dong@airoha.com, 
 Linqi.zhang@airoha.com, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com, 
 zhengping.zhang@airoha.com, Philipp Zabel <p.zabel@pengutronix.de>, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112185329.1314427-1-john@phrozen.org>
References: <20261112185329.1314427-1-john@phrozen.org>
Subject: Re: [PATCH v2] clk: en7523: do not sleep in the EN7581 PCIe clock
 disable
Message-Id: <179460287736.1364508.7241698742869903903.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:47:57 -0500
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
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=319; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=DIl3GzMQKS3yYwlOjz8skXh4EnD12Itpf0Te4iUH2GA=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+l9efWtZ+8YHrzKpKJUll16B1DwpfF8/7+mpS9amdo
 n133JInd5SyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRUntGhqXeD2aELW/UvSPk
 9OvmbhOfnW/+531LLj5kuHKrLmvwzKkM/x0DFwvvsG99VSzSlBD45NKunJvb1Nknabv8WHdKaee
 TGzwA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Thu, 12 Nov 2026 19:53:29 +0100, John Crispin wrote:
> clk: en7523: do not sleep in the EN7581 PCIe clock disable

Applied, thanks!

[1/1] clk: en7523: do not sleep in the EN7581 PCIe clock disable
      https://git.kernel.org/clk/linux/c/1346c1f94294

Best regards,
-- 
Brian Masney <masneyb@kernel.org>

